// SPDX-FileCopyrightText: Copyright (C) 2026 KU Leuven (MICAS). All rights reserved.
// SPDX-License-Identifier: Apache-2.0

// The mm.cc matmul over one block of a joined A operand.
//
// When several producers' A blocks are joined in a memory tile, the consumer
// receives them as one element and works through them block by block. This
// entry point takes the whole element and the index of the block to use, and
// offsets the A pointer by one DIM_M x DIM_K block per index.

#include "mm.cc"

extern "C" {

void matmul_bf16_bf16_join(bfloat16 *a_in, bfloat16 *b_in, bfloat16 *c_out, int32_t block)
{
    matmul_bf16_bf16(a_in + block * DIM_M * DIM_K, b_in, c_out);
}

} // extern "C"
