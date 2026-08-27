// SPDX-FileCopyrightText: Copyright (C) 2025 Advanced Micro Devices, Inc. All rights reserved.
// SPDX-License-Identifier: Apache-2.0

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

constexpr int TILE_M = 8;
constexpr int TILE_K = 8;
constexpr int TILE_N = 8;
constexpr int K_TILES = FULL_K / DIM_K;

// TODO these all are cursed, get these into stream:
// * the buffers is something that stream should properly reason about and pass to this kernel
// * the reduction step is the index of one of the stream loops and should just be passed through
static bfloat16 gate_acc[DIM_M * DIM_N];
static bfloat16 up_acc[DIM_M * DIM_N];
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

// TODO parametrize this again
using MMUL = aie::mmul<8, 8, 8, bfloat16, bfloat16, accauto>;

static inline void front_matmul(
    const bfloat16 *restrict input,
    const bfloat16 *restrict weights,
    bfloat16 *restrict accum,
    int matrix
)
{
    constexpr int row_tiles = DIM_M / TILE_M;
    constexpr int k_tiles = DIM_K / TILE_K;
    constexpr int col_tiles = DIM_N / TILE_N;
    constexpr int tile_elements = MMUL::size_C;

    static_assert(DIM_M % 16 == 0);
    static_assert(DIM_K % 8 == 0);
    static_assert(DIM_N % 16 == 0);

    aie::set_rounding(aie::rounding_mode::conv_even);

    for (int row_tile = 0; row_tile < row_tiles; row_tile += 2) {
        const bfloat16 *input0 = input + row_tile * k_tiles * MMUL::size_A;
        const bfloat16 *input1 = input0 + k_tiles * MMUL::size_A;

        for (int col_tile = 0; col_tile < col_tiles; col_tile += 2) {
            const int output_tile = row_tile * col_tiles + col_tile;
            MMUL c00(aie::load_v<tile_elements>(accum + output_tile * tile_elements));
            MMUL c01(aie::load_v<tile_elements>(accum + (output_tile + 1) * tile_elements));
            MMUL c10(aie::load_v<tile_elements>(accum + (output_tile + col_tiles) * tile_elements));
            MMUL c11(aie::load_v<tile_elements>(accum + (output_tile + col_tiles + 1) * tile_elements));

            for (int k_tile = 0; k_tile < k_tiles; ++k_tile) {
                const auto a0 = aie::load_v<MMUL::size_A>(input0 + k_tile * MMUL::size_A);
                const auto a1 = aie::load_v<MMUL::size_A>(input1 + k_tile * MMUL::size_A);

                const bfloat16 *weight_tile = weights
                    + k_tile * 2 * col_tiles * MMUL::size_B
                    + matrix * col_tiles * MMUL::size_B
                    + col_tile * MMUL::size_B;
                const auto b0 = aie::load_v<MMUL::size_B>(weight_tile);
                const auto b1 = aie::load_v<MMUL::size_B>(weight_tile + MMUL::size_B);

                c00.mac(a0, b0);
                c01.mac(a0, b1);
                c10.mac(a1, b0);
                c11.mac(a1, b1);
            }

            aie::store_v(accum + output_tile * tile_elements, c00.template to_vector<bfloat16>());
            aie::store_v(accum + (output_tile + 1) * tile_elements, c01.template to_vector<bfloat16>());
            aie::store_v(accum + (output_tile + col_tiles) * tile_elements, c10.template to_vector<bfloat16>());
            aie::store_v(accum + (output_tile + col_tiles + 1) * tile_elements, c11.template to_vector<bfloat16>());
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

    front_matmul(input, weights, gate_acc, 0);
    front_matmul(input, weights, up_acc, 1);

    ++reduction_step;
    if (reduction_step == K_TILES) {
        auto gate_it = aie::begin_restrict_vector<32>(gate_acc);
        auto up_it = aie::begin_restrict_vector<32>(up_acc);
        auto output_it = aie::begin_restrict_vector<32>(output);

        for (int i = 0; i < DIM_M * DIM_N; i += 32) {
            const auto gate = *gate_it++;
            const auto up = *up_it++;
            *output_it++ = aie::mul(silu_vec<32>(gate), up).template to_vector<bfloat16>();
        }

        reduction_step = 0;
    }
    event1();
}

void zero_front_fused(bfloat16 *restrict output)
{
    for (int i = 0; i < DIM_M * DIM_N; ++i) {
        output[i] = 0;
    }
    for (int i = 0; i < DIM_M * DIM_N; ++i) {
        gate_acc[i] = 0;
        up_acc[i] = 0;
    }
    reduction_step = 0;
}

} // extern "C"
