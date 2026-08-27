// SPDX-FileCopyrightText: Copyright (C) 2026 KU Leuven (MICAS). All rights reserved.
// SPDX-License-Identifier: Apache-2.0
//
// Four rows of the online softmax per call, so their reduction trees interleave.
// See README.md in this directory for the measurement that motivates it.
//
// Numerics are the reference body's, operation for operation: the same log2e scale, the
// same running-maximum rule, the same exp2 and the same sum. Only the schedule differs.

#ifndef SOFTMAX_FAST_CC
#define SOFTMAX_FAST_CC

#include <aie_api/aie.hpp>
#include <stdint.h>

#ifndef SM_VEC_LEN
#define SM_VEC_LEN 64
#endif

// One row's first pass: scale by log2e and reduce to a maximum. Split out so four of
// them can be in flight at once; `aie::reduce_max` is a six-step dependent tree, and
// four independent trees are what fills the VLIW slots the single row leaves empty.
static inline float sm_row_max(const bfloat16 *in,
                               aie::vector<bfloat16, SM_VEC_LEN> log2e_vec)
{
    aie::vector<bfloat16, SM_VEC_LEN> v = aie::load_v<SM_VEC_LEN>(in);
    aie::accum<accfloat, SM_VEC_LEN> scaled = aie::mul(v, log2e_vec);
    return aie::reduce_max(scaled.to_vector<bfloat16>());
}

// One row's second pass, given the running maximum: exponentiate and sum.
static inline float sm_row_exp(const bfloat16 *in,
                               bfloat16 *out,
                               aie::vector<bfloat16, SM_VEC_LEN> log2e_vec,
                               float m)
{
    aie::vector<bfloat16, SM_VEC_LEN> max_vec = aie::broadcast<bfloat16, SM_VEC_LEN>((bfloat16)m);
    aie::vector<bfloat16, SM_VEC_LEN> v = aie::load_v<SM_VEC_LEN>(in);
    aie::accum<accfloat, SM_VEC_LEN> scaled = aie::mul(v, log2e_vec);
    aie::accum<accfloat, SM_VEC_LEN> shifted = aie::sub(scaled, max_vec);
    aie::vector<bfloat16, SM_VEC_LEN> e = aie::exp2<bfloat16>(shifted.to_vector<float>());
    aie::store_v(out, e);
    aie::accum<accfloat, SM_VEC_LEN> acc = aie::zeros<accfloat, SM_VEC_LEN>();
    acc = add(acc, e);
    return aie::reduce_add(acc.to_vector<float>());
}

// `rows` rows starting at `first`, four at a time. Row stride is `row_len`, which is the
// 64 this block shape uses, so each row is exactly one vector and the two passes are one
// vector iteration each.
static inline void partial_softmax_rows_fast(bfloat16 *restrict A,
                                             bfloat16 *restrict P,
                                             bfloat16 *restrict scale_buffer,
                                             const int32_t row_len,
                                             const int32_t first,
                                             const int32_t rows,
                                             const int32_t num_rows,
                                             const bfloat16 scale)
{
    ::aie::set_rounding(aie::rounding_mode::conv_even);
    const aie::vector<bfloat16, SM_VEC_LEN> log2e_vec =
        aie::broadcast<bfloat16, SM_VEC_LEN>((bfloat16)scale);

    int32_t i = 0;
    for (; i + 2 <= rows; i += 2) {
        const int32_t r0 = first + i, r1 = r0 + 1;
        const bfloat16 *a0 = A + row_len * (i + 0), *a1 = A + row_len * (i + 1);

        // Two independent reduction trees, issued together.
        float m0 = sm_row_max(a0, log2e_vec);
        float m1 = sm_row_max(a1, log2e_vec);

        const float p0 = scale_buffer[r0], p1 = scale_buffer[r1];
        m0 = m0 > p0 ? m0 : p0;
        m1 = m1 > p1 ? m1 : p1;
        scale_buffer[num_rows + r0] = (bfloat16)m0;
        scale_buffer[num_rows + r1] = (bfloat16)m1;

        scale_buffer[3 * num_rows + r0] =
            (bfloat16)sm_row_exp(a0, P + row_len * (i + 0), log2e_vec, m0);
        scale_buffer[3 * num_rows + r1] =
            (bfloat16)sm_row_exp(a1, P + row_len * (i + 1), log2e_vec, m1);
    }
    for (; i < rows; i++) {
        const int32_t r = first + i;
        const bfloat16 *a = A + row_len * i;
        float m = sm_row_max(a, log2e_vec);
        const float prev = scale_buffer[r];
        m = m > prev ? m : prev;
        scale_buffer[num_rows + r] = (bfloat16)m;
        scale_buffer[3 * num_rows + r] =
            (bfloat16)sm_row_exp(a, P + row_len * i, log2e_vec, m);
    }
}

#endif // SOFTMAX_FAST_CC
