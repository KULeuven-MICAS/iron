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

extern "C" {

void front_fused(
    bfloat16 *restrict input,
    bfloat16 *restrict weights,
    bfloat16 *restrict output
)
{
    event0();

    // Deliberately no-op until the fused front computation is implemented.
    (void)input;
    (void)weights;
    (void)output;

    event1();
}

void zero_front_fused(bfloat16 *restrict output)
{
    for (int i = 0; i < DIM_M * DIM_N; ++i) {
        output[i] = 0;
    }
}

} // extern "C"
