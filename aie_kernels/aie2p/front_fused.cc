// SPDX-FileCopyrightText: Copyright (C) 2025 Advanced Micro Devices, Inc. All rights reserved.
// SPDX-License-Identifier: Apache-2.0

// SwiGLU front: the gate and up projections and the activation that joins them.
//
// The contraction runs across calls: the design streams the weights in FULL_K/DIM_K
// slices and calls this kernel once per slice, so both running sums outlive a call.
// The up projection accumulates in the output tile, which is already its shape and
// already lives for the whole contraction; the last slice overwrites it with the
// result. Only the gate projection needs storage of its own.

#include "../aie_kernel_utils.h"

#include <aie_api/aie.hpp>
#include <stdint.h>

using namespace aie;

#ifndef DIM_M
#define DIM_M 16
#endif

#ifndef DIM_N
#define DIM_N 64
#endif

#ifndef FULL_K
#define FULL_K 512
#endif

// TODO parametrize this again
constexpr int TILE_M = 8;
constexpr int TILE_K = 8;
constexpr int TILE_N = 8;

using MMUL = aie::mmul<TILE_M, TILE_K, TILE_N, bfloat16, bfloat16, accauto>;
using TileAccum = MMUL::accum_type;

constexpr int ROW_TILES = DIM_M / TILE_M;
constexpr int K_TILES = DIM_K / TILE_K;
constexpr int COL_TILES = DIM_N / TILE_N;
constexpr int REDUCTION_STEPS = FULL_K / DIM_K;
constexpr int TILE_ELEMENTS = MMUL::size_C;

static_assert(DIM_M % (2 * TILE_M) == 0);
static_assert(DIM_K % TILE_K == 0);
static_assert(DIM_N % (2 * TILE_N) == 0);
static_assert(FULL_K % DIM_K == 0);

// TODO these all are cursed, get these into stream:
// * the buffers is something that stream should properly reason about and pass to this kernel
// * the reduction step is the index of one of the stream loops and should just be passed through
static bfloat16 gate_acc[DIM_M * DIM_N];
static int reduction_step = 0;

template <int N>
static inline aie::vector<bfloat16, N> silu_vec(
    aie::vector<bfloat16, N> input
)
{
    auto half_x = aie::mul(input, aie::broadcast<bfloat16, N>(0.5f));
    auto tanh_half_x = aie::tanh<bfloat16>(half_x.template to_vector<float>());
    auto sigmoid = aie::mul(
        aie::add(tanh_half_x, aie::broadcast<bfloat16, N>(1.0f)),
        aie::broadcast<bfloat16, N>(0.5f)
    ).template to_vector<bfloat16>();
    return aie::mul(input, sigmoid).template to_vector<bfloat16>();
}

static inline void front_matmul(
    const bfloat16 *restrict input,
    const bfloat16 *restrict weights,
    bfloat16 *restrict accum,
    int matrix
)
{
    for (int row_tile = 0; row_tile < ROW_TILES; row_tile += 2) {
        const bfloat16 *input0 = input + row_tile * K_TILES * MMUL::size_A;
        const bfloat16 *input1 = input0 + K_TILES * MMUL::size_A;

        for (int col_tile = 0; col_tile < COL_TILES; col_tile += 2) {
            const int output_tile = row_tile * COL_TILES + col_tile;
            bfloat16 *restrict accum0 = accum + output_tile * TILE_ELEMENTS;
            bfloat16 *restrict accum1 = accum0 + COL_TILES * TILE_ELEMENTS;

            MMUL c00(TileAccum(aie::load_v<TILE_ELEMENTS>(accum0)));
            MMUL c01(TileAccum(aie::load_v<TILE_ELEMENTS>(accum0 + TILE_ELEMENTS)));
            MMUL c10(TileAccum(aie::load_v<TILE_ELEMENTS>(accum1)));
            MMUL c11(TileAccum(aie::load_v<TILE_ELEMENTS>(accum1 + TILE_ELEMENTS)));

            const bfloat16 *weight_tile = weights + matrix * COL_TILES * MMUL::size_B + col_tile * MMUL::size_B;

            AIE_LOOP_UNROLL_FULL
            for (int k_tile = 0; k_tile < K_TILES; ++k_tile) {
                const auto a0 = aie::load_v<MMUL::size_A>(input0 + k_tile * MMUL::size_A);
                const auto a1 = aie::load_v<MMUL::size_A>(input1 + k_tile * MMUL::size_A);
                const auto b0 = aie::load_v<MMUL::size_B>(weight_tile);
                const auto b1 = aie::load_v<MMUL::size_B>(weight_tile + MMUL::size_B);
                weight_tile += 2 * COL_TILES * MMUL::size_B;

                c00.mac(a0, b0);
                c01.mac(a0, b1);
                c10.mac(a1, b0);
                c11.mac(a1, b1);
            }

            aie::store_v(accum0, c00.to_accum().template to_vector<bfloat16>());
            aie::store_v(accum0 + TILE_ELEMENTS, c01.to_accum().template to_vector<bfloat16>());
            aie::store_v(accum1, c10.to_accum().template to_vector<bfloat16>());
            aie::store_v(accum1 + TILE_ELEMENTS, c11.to_accum().template to_vector<bfloat16>());
        }
    }
}

extern "C" {

void front_fused(
    bfloat16 *restrict input,
    bfloat16 *restrict weights,
    bfloat16 *restrict output
)
{
    event0();

    aie::set_rounding(aie::rounding_mode::conv_even);

    front_matmul(input, weights, gate_acc, 0);
    front_matmul(input, weights, output, 1);

    if (++reduction_step == REDUCTION_STEPS) {
        constexpr int LANES = 32;
        for (int i = 0; i < DIM_M * DIM_N; i += LANES) {
            const auto gate = aie::load_v<LANES>(gate_acc + i);
            const auto up = aie::load_v<LANES>(output + i);
            aie::store_v(output + i, aie::mul(silu_vec<LANES>(gate), up).template to_vector<bfloat16>());
        }

        reduction_step = 0;
    }
    event1();
}

void zero_front_fused(bfloat16 *restrict output)
{
    constexpr int LANES = 32;
    const auto zero = aie::zeros<bfloat16, LANES>();
    for (int i = 0; i < DIM_M * DIM_N; i += LANES) {
        aie::store_v(output + i, zero);
        aie::store_v(gate_acc + i, zero);
    }
    reduction_step = 0;
}

} // extern "C"
