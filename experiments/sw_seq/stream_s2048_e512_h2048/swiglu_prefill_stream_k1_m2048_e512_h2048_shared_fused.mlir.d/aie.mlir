module {
  aie.device(npu2) @op0__SwiGLUStreamGroup {
    %shim_noc_tile_0_0 = aie.tile(0, 0)
    %shim_noc_tile_1_0 = aie.tile(1, 0)
    %shim_noc_tile_2_0 = aie.tile(2, 0)
    %shim_noc_tile_3_0 = aie.tile(3, 0)
    %shim_noc_tile_4_0 = aie.tile(4, 0)
    %shim_noc_tile_5_0 = aie.tile(5, 0)
    %shim_noc_tile_6_0 = aie.tile(6, 0)
    %shim_noc_tile_7_0 = aie.tile(7, 0)
    %mem_tile_0_1 = aie.tile(0, 1)
    %mem_tile_1_1 = aie.tile(1, 1)
    %mem_tile_2_1 = aie.tile(2, 1)
    %mem_tile_4_1 = aie.tile(4, 1)
    %mem_tile_5_1 = aie.tile(5, 1)
    %mem_tile_6_1 = aie.tile(6, 1)
    %mem_tile_3_1 = aie.tile(3, 1)
    %mem_tile_7_1 = aie.tile(7, 1)
    %tile_0_2 = aie.tile(0, 2)
    %tile_0_3 = aie.tile(0, 3)
    %tile_0_4 = aie.tile(0, 4)
    %tile_0_5 = aie.tile(0, 5)
    %tile_1_2 = aie.tile(1, 2)
    %tile_1_3 = aie.tile(1, 3)
    %tile_1_4 = aie.tile(1, 4)
    %tile_1_5 = aie.tile(1, 5)
    %tile_2_2 = aie.tile(2, 2)
    %tile_2_3 = aie.tile(2, 3)
    %tile_2_4 = aie.tile(2, 4)
    %tile_2_5 = aie.tile(2, 5)
    %tile_3_2 = aie.tile(3, 2)
    %tile_3_3 = aie.tile(3, 3)
    %tile_3_4 = aie.tile(3, 4)
    %tile_3_5 = aie.tile(3, 5)
    %tile_6_2 = aie.tile(6, 2)
    %tile_6_3 = aie.tile(6, 3)
    %tile_6_4 = aie.tile(6, 4)
    %tile_6_5 = aie.tile(6, 5)
    %tile_7_2 = aie.tile(7, 2)
    %tile_7_3 = aie.tile(7, 3)
    %tile_7_4 = aie.tile(7, 4)
    %tile_7_5 = aie.tile(7, 5)
    %tile_4_2 = aie.tile(4, 2)
    %tile_4_3 = aie.tile(4, 3)
    %tile_4_4 = aie.tile(4, 4)
    %tile_4_5 = aie.tile(4, 5)
    %tile_5_2 = aie.tile(5, 2)
    %tile_5_3 = aie.tile(5, 3)
    %tile_5_4 = aie.tile(5, 4)
    %tile_5_5 = aie.tile(5, 5)
    aie.runtime_sequence(%arg0: memref<2048x512xbf16>, %arg1: memref<512x2048xbf16>, %arg2: memref<512x2048xbf16>, %arg3: memref<2048x512xbf16>, %arg4: memref<2048x512xbf16>) {
      %0 = aiex.dma_configure_task_for @of_0_mem_0 {
        aie.dma_bd(%arg0 : memref<2048x512xbf16> offset = 0 len = 65536 sizes = [16, 16, 128, 32] strides = [0, 32, 512, 1])
        aie.end
      } {issue_token = true, iteration_t = 0 : index, repeat_count = 15 : i32}
      aiex.dma_start_task(%0)
      %1 = aiex.dma_configure_task_for @of_0_mem_1 {
        aie.dma_bd(%arg0 : memref<2048x512xbf16> offset = 0 len = 65536 sizes = [16, 16, 128, 32] strides = [0, 32, 512, 1])
        aie.end
      } {issue_token = true, iteration_t = 0 : index, repeat_count = 15 : i32}
      aiex.dma_start_task(%1)
      %2 = aiex.dma_configure_task_for @of_1_mem_0 {
        aie.dma_bd(%arg1 : memref<512x2048xbf16> offset = 0 len = 524288 sizes = [16, 16, 512, 64] strides = [0, 128, 2048, 1])
        aie.end
      } {issue_token = true, iteration_t = 0 : index, repeat_count = 15 : i32}
      aiex.dma_start_task(%2)
      %3 = aiex.dma_configure_task_for @of_1_mem_1 {
        aie.dma_bd(%arg1 : memref<512x2048xbf16> offset = 64 len = 524288 sizes = [16, 16, 512, 64] strides = [0, 128, 2048, 1])
        aie.end
      } {issue_token = true, iteration_t = 0 : index, repeat_count = 15 : i32}
      aiex.dma_start_task(%3)
      %4 = aiex.dma_configure_task_for @of_2_mem_0 {
        aie.dma_bd(%arg2 : memref<512x2048xbf16> offset = 0 len = 524288 sizes = [16, 16, 512, 64] strides = [0, 128, 2048, 1])
        aie.end
      } {issue_token = true, iteration_t = 0 : index, repeat_count = 15 : i32}
      aiex.dma_start_task(%4)
      %5 = aiex.dma_configure_task_for @of_2_mem_1 {
        aie.dma_bd(%arg2 : memref<512x2048xbf16> offset = 64 len = 524288 sizes = [16, 16, 512, 64] strides = [0, 128, 2048, 1])
        aie.end
      } {issue_token = true, iteration_t = 0 : index, repeat_count = 15 : i32}
      aiex.dma_start_task(%5)
      %6 = aiex.dma_configure_task_for @of_3_mem_0 {
        aie.dma_bd(%arg3 : memref<2048x512xbf16> offset = 0 len = 32768 sizes = [16, 8, 128, 32] strides = [65536, 64, 512, 1])
        aie.end
      } {issue_token = true, iteration_t = 0 : index, repeat_count = 15 : i32}
      aiex.dma_start_task(%6)
      %7 = aiex.dma_configure_task_for @of_3_mem_1 {
        aie.dma_bd(%arg3 : memref<2048x512xbf16> offset = 32 len = 32768 sizes = [16, 8, 128, 32] strides = [65536, 64, 512, 1])
        aie.end
      } {issue_token = true, iteration_t = 0 : index, repeat_count = 15 : i32}
      aiex.dma_start_task(%7)
      %8 = aiex.dma_configure_task_for @of_13_mem_0 {
        aie.dma_bd(%arg4 : memref<2048x512xbf16> offset = 0 len = 8192 sizes = [32, 8, 32, 32] strides = [16384, 64, 512, 1])
        aie.end
      } {issue_token = true, iteration_t = 0 : index, repeat_count = 31 : i32}
      aiex.dma_start_task(%8)
      %9 = aiex.dma_configure_task_for @of_13_mem_1 {
        aie.dma_bd(%arg4 : memref<2048x512xbf16> offset = 32 len = 8192 sizes = [32, 8, 32, 32] strides = [16384, 64, 512, 1])
        aie.end
      } {issue_token = true, iteration_t = 0 : index, repeat_count = 31 : i32}
      aiex.dma_start_task(%9)
      %10 = aiex.dma_configure_task_for @of_0_mem_0 {
        aie.dma_bd(%arg0 : memref<2048x512xbf16> offset = 65536 len = 65536 sizes = [16, 16, 128, 32] strides = [0, 32, 512, 1])
        aie.end
      } {issue_token = true, iteration_t = 32768 : index, repeat_count = 15 : i32}
      aiex.dma_start_task(%10)
      %11 = aiex.dma_configure_task_for @of_0_mem_1 {
        aie.dma_bd(%arg0 : memref<2048x512xbf16> offset = 65536 len = 65536 sizes = [16, 16, 128, 32] strides = [0, 32, 512, 1])
        aie.end
      } {issue_token = true, iteration_t = 32768 : index, repeat_count = 15 : i32}
      aiex.dma_start_task(%11)
      %12 = aiex.dma_configure_task_for @of_3_mem_0 {
        aie.dma_bd(%arg3 : memref<2048x512xbf16> offset = 0 len = 32768 sizes = [16, 8, 128, 32] strides = [65536, 64, 512, 1])
        aie.end
      } {issue_token = true, iteration_t = 32768 : index, repeat_count = 15 : i32}
      aiex.dma_start_task(%12)
      %13 = aiex.dma_configure_task_for @of_3_mem_1 {
        aie.dma_bd(%arg3 : memref<2048x512xbf16> offset = 32 len = 32768 sizes = [16, 8, 128, 32] strides = [65536, 64, 512, 1])
        aie.end
      } {issue_token = true, iteration_t = 32768 : index, repeat_count = 15 : i32}
      aiex.dma_start_task(%13)
      aiex.dma_await_task(%0)
      %14 = aiex.dma_configure_task_for @of_0_mem_0 {
        aie.dma_bd(%arg0 : memref<2048x512xbf16> offset = 131072 len = 65536 sizes = [16, 16, 128, 32] strides = [0, 32, 512, 1])
        aie.end
      } {issue_token = true, iteration_t = 65536 : index, repeat_count = 15 : i32}
      aiex.dma_start_task(%14)
      aiex.dma_await_task(%1)
      %15 = aiex.dma_configure_task_for @of_0_mem_1 {
        aie.dma_bd(%arg0 : memref<2048x512xbf16> offset = 131072 len = 65536 sizes = [16, 16, 128, 32] strides = [0, 32, 512, 1])
        aie.end
      } {issue_token = true, iteration_t = 65536 : index, repeat_count = 15 : i32}
      aiex.dma_start_task(%15)
      aiex.dma_await_task(%6)
      %16 = aiex.dma_configure_task_for @of_3_mem_0 {
        aie.dma_bd(%arg3 : memref<2048x512xbf16> offset = 0 len = 32768 sizes = [16, 8, 128, 32] strides = [65536, 64, 512, 1])
        aie.end
      } {issue_token = true, iteration_t = 65536 : index, repeat_count = 15 : i32}
      aiex.dma_start_task(%16)
      aiex.dma_await_task(%7)
      %17 = aiex.dma_configure_task_for @of_3_mem_1 {
        aie.dma_bd(%arg3 : memref<2048x512xbf16> offset = 32 len = 32768 sizes = [16, 8, 128, 32] strides = [65536, 64, 512, 1])
        aie.end
      } {issue_token = true, iteration_t = 65536 : index, repeat_count = 15 : i32}
      aiex.dma_start_task(%17)
      aiex.dma_await_task(%10)
      %18 = aiex.dma_configure_task_for @of_0_mem_0 {
        aie.dma_bd(%arg0 : memref<2048x512xbf16> offset = 196608 len = 65536 sizes = [16, 16, 128, 32] strides = [0, 32, 512, 1])
        aie.end
      } {issue_token = true, iteration_t = 98304 : index, repeat_count = 15 : i32}
      aiex.dma_start_task(%18)
      aiex.dma_await_task(%11)
      %19 = aiex.dma_configure_task_for @of_0_mem_1 {
        aie.dma_bd(%arg0 : memref<2048x512xbf16> offset = 196608 len = 65536 sizes = [16, 16, 128, 32] strides = [0, 32, 512, 1])
        aie.end
      } {issue_token = true, iteration_t = 98304 : index, repeat_count = 15 : i32}
      aiex.dma_start_task(%19)
      aiex.dma_await_task(%12)
      %20 = aiex.dma_configure_task_for @of_3_mem_0 {
        aie.dma_bd(%arg3 : memref<2048x512xbf16> offset = 0 len = 32768 sizes = [16, 8, 128, 32] strides = [65536, 64, 512, 1])
        aie.end
      } {issue_token = true, iteration_t = 98304 : index, repeat_count = 15 : i32}
      aiex.dma_start_task(%20)
      aiex.dma_await_task(%13)
      %21 = aiex.dma_configure_task_for @of_3_mem_1 {
        aie.dma_bd(%arg3 : memref<2048x512xbf16> offset = 32 len = 32768 sizes = [16, 8, 128, 32] strides = [65536, 64, 512, 1])
        aie.end
      } {issue_token = true, iteration_t = 98304 : index, repeat_count = 15 : i32}
      aiex.dma_start_task(%21)
      aiex.dma_await_task(%14)
      %22 = aiex.dma_configure_task_for @of_0_mem_0 {
        aie.dma_bd(%arg0 : memref<2048x512xbf16> offset = 262144 len = 65536 sizes = [16, 16, 128, 32] strides = [0, 32, 512, 1])
        aie.end
      } {issue_token = true, iteration_t = 131072 : index, repeat_count = 15 : i32}
      aiex.dma_start_task(%22)
      aiex.dma_await_task(%15)
      %23 = aiex.dma_configure_task_for @of_0_mem_1 {
        aie.dma_bd(%arg0 : memref<2048x512xbf16> offset = 262144 len = 65536 sizes = [16, 16, 128, 32] strides = [0, 32, 512, 1])
        aie.end
      } {issue_token = true, iteration_t = 131072 : index, repeat_count = 15 : i32}
      aiex.dma_start_task(%23)
      aiex.dma_await_task(%16)
      %24 = aiex.dma_configure_task_for @of_3_mem_0 {
        aie.dma_bd(%arg3 : memref<2048x512xbf16> offset = 0 len = 32768 sizes = [16, 8, 128, 32] strides = [65536, 64, 512, 1])
        aie.end
      } {issue_token = true, iteration_t = 131072 : index, repeat_count = 15 : i32}
      aiex.dma_start_task(%24)
      aiex.dma_await_task(%17)
      %25 = aiex.dma_configure_task_for @of_3_mem_1 {
        aie.dma_bd(%arg3 : memref<2048x512xbf16> offset = 32 len = 32768 sizes = [16, 8, 128, 32] strides = [65536, 64, 512, 1])
        aie.end
      } {issue_token = true, iteration_t = 131072 : index, repeat_count = 15 : i32}
      aiex.dma_start_task(%25)
      aiex.dma_await_task(%18)
      %26 = aiex.dma_configure_task_for @of_0_mem_0 {
        aie.dma_bd(%arg0 : memref<2048x512xbf16> offset = 327680 len = 65536 sizes = [16, 16, 128, 32] strides = [0, 32, 512, 1])
        aie.end
      } {issue_token = true, iteration_t = 163840 : index, repeat_count = 15 : i32}
      aiex.dma_start_task(%26)
      aiex.dma_await_task(%19)
      %27 = aiex.dma_configure_task_for @of_0_mem_1 {
        aie.dma_bd(%arg0 : memref<2048x512xbf16> offset = 327680 len = 65536 sizes = [16, 16, 128, 32] strides = [0, 32, 512, 1])
        aie.end
      } {issue_token = true, iteration_t = 163840 : index, repeat_count = 15 : i32}
      aiex.dma_start_task(%27)
      aiex.dma_await_task(%20)
      %28 = aiex.dma_configure_task_for @of_3_mem_0 {
        aie.dma_bd(%arg3 : memref<2048x512xbf16> offset = 0 len = 32768 sizes = [16, 8, 128, 32] strides = [65536, 64, 512, 1])
        aie.end
      } {issue_token = true, iteration_t = 163840 : index, repeat_count = 15 : i32}
      aiex.dma_start_task(%28)
      aiex.dma_await_task(%21)
      %29 = aiex.dma_configure_task_for @of_3_mem_1 {
        aie.dma_bd(%arg3 : memref<2048x512xbf16> offset = 32 len = 32768 sizes = [16, 8, 128, 32] strides = [65536, 64, 512, 1])
        aie.end
      } {issue_token = true, iteration_t = 163840 : index, repeat_count = 15 : i32}
      aiex.dma_start_task(%29)
      aiex.dma_await_task(%22)
      %30 = aiex.dma_configure_task_for @of_0_mem_0 {
        aie.dma_bd(%arg0 : memref<2048x512xbf16> offset = 393216 len = 65536 sizes = [16, 16, 128, 32] strides = [0, 32, 512, 1])
        aie.end
      } {issue_token = true, iteration_t = 196608 : index, repeat_count = 15 : i32}
      aiex.dma_start_task(%30)
      aiex.dma_await_task(%23)
      %31 = aiex.dma_configure_task_for @of_0_mem_1 {
        aie.dma_bd(%arg0 : memref<2048x512xbf16> offset = 393216 len = 65536 sizes = [16, 16, 128, 32] strides = [0, 32, 512, 1])
        aie.end
      } {issue_token = true, iteration_t = 196608 : index, repeat_count = 15 : i32}
      aiex.dma_start_task(%31)
      aiex.dma_await_task(%24)
      %32 = aiex.dma_configure_task_for @of_3_mem_0 {
        aie.dma_bd(%arg3 : memref<2048x512xbf16> offset = 0 len = 32768 sizes = [16, 8, 128, 32] strides = [65536, 64, 512, 1])
        aie.end
      } {issue_token = true, iteration_t = 196608 : index, repeat_count = 15 : i32}
      aiex.dma_start_task(%32)
      aiex.dma_await_task(%25)
      %33 = aiex.dma_configure_task_for @of_3_mem_1 {
        aie.dma_bd(%arg3 : memref<2048x512xbf16> offset = 32 len = 32768 sizes = [16, 8, 128, 32] strides = [65536, 64, 512, 1])
        aie.end
      } {issue_token = true, iteration_t = 196608 : index, repeat_count = 15 : i32}
      aiex.dma_start_task(%33)
      aiex.dma_await_task(%26)
      %34 = aiex.dma_configure_task_for @of_0_mem_0 {
        aie.dma_bd(%arg0 : memref<2048x512xbf16> offset = 458752 len = 65536 sizes = [16, 16, 128, 32] strides = [0, 32, 512, 1])
        aie.end
      } {issue_token = true, iteration_t = 229376 : index, repeat_count = 15 : i32}
      aiex.dma_start_task(%34)
      aiex.dma_await_task(%27)
      %35 = aiex.dma_configure_task_for @of_0_mem_1 {
        aie.dma_bd(%arg0 : memref<2048x512xbf16> offset = 458752 len = 65536 sizes = [16, 16, 128, 32] strides = [0, 32, 512, 1])
        aie.end
      } {issue_token = true, iteration_t = 229376 : index, repeat_count = 15 : i32}
      aiex.dma_start_task(%35)
      aiex.dma_await_task(%28)
      %36 = aiex.dma_configure_task_for @of_3_mem_0 {
        aie.dma_bd(%arg3 : memref<2048x512xbf16> offset = 0 len = 32768 sizes = [16, 8, 128, 32] strides = [65536, 64, 512, 1])
        aie.end
      } {issue_token = true, iteration_t = 229376 : index, repeat_count = 15 : i32}
      aiex.dma_start_task(%36)
      aiex.dma_await_task(%29)
      %37 = aiex.dma_configure_task_for @of_3_mem_1 {
        aie.dma_bd(%arg3 : memref<2048x512xbf16> offset = 32 len = 32768 sizes = [16, 8, 128, 32] strides = [65536, 64, 512, 1])
        aie.end
      } {issue_token = true, iteration_t = 229376 : index, repeat_count = 15 : i32}
      aiex.dma_start_task(%37)
      aiex.dma_await_task(%30)
      %38 = aiex.dma_configure_task_for @of_0_mem_0 {
        aie.dma_bd(%arg0 : memref<2048x512xbf16> offset = 524288 len = 65536 sizes = [16, 16, 128, 32] strides = [0, 32, 512, 1])
        aie.end
      } {issue_token = true, iteration_t = 262144 : index, repeat_count = 15 : i32}
      aiex.dma_start_task(%38)
      aiex.dma_await_task(%31)
      %39 = aiex.dma_configure_task_for @of_0_mem_1 {
        aie.dma_bd(%arg0 : memref<2048x512xbf16> offset = 524288 len = 65536 sizes = [16, 16, 128, 32] strides = [0, 32, 512, 1])
        aie.end
      } {issue_token = true, iteration_t = 262144 : index, repeat_count = 15 : i32}
      aiex.dma_start_task(%39)
      aiex.dma_await_task(%32)
      %40 = aiex.dma_configure_task_for @of_3_mem_0 {
        aie.dma_bd(%arg3 : memref<2048x512xbf16> offset = 0 len = 32768 sizes = [16, 8, 128, 32] strides = [65536, 64, 512, 1])
        aie.end
      } {issue_token = true, iteration_t = 262144 : index, repeat_count = 15 : i32}
      aiex.dma_start_task(%40)
      aiex.dma_await_task(%33)
      %41 = aiex.dma_configure_task_for @of_3_mem_1 {
        aie.dma_bd(%arg3 : memref<2048x512xbf16> offset = 32 len = 32768 sizes = [16, 8, 128, 32] strides = [65536, 64, 512, 1])
        aie.end
      } {issue_token = true, iteration_t = 262144 : index, repeat_count = 15 : i32}
      aiex.dma_start_task(%41)
      %42 = aiex.dma_configure_task_for @of_13_mem_0 {
        aie.dma_bd(%arg4 : memref<2048x512xbf16> offset = 524288 len = 8192 sizes = [32, 8, 32, 32] strides = [16384, 64, 512, 1])
        aie.end
      } {issue_token = true, iteration_t = 262144 : index, repeat_count = 31 : i32}
      aiex.dma_start_task(%42)
      %43 = aiex.dma_configure_task_for @of_13_mem_1 {
        aie.dma_bd(%arg4 : memref<2048x512xbf16> offset = 524320 len = 8192 sizes = [32, 8, 32, 32] strides = [16384, 64, 512, 1])
        aie.end
      } {issue_token = true, iteration_t = 262144 : index, repeat_count = 31 : i32}
      aiex.dma_start_task(%43)
      aiex.dma_await_task(%34)
      %44 = aiex.dma_configure_task_for @of_0_mem_0 {
        aie.dma_bd(%arg0 : memref<2048x512xbf16> offset = 589824 len = 65536 sizes = [16, 16, 128, 32] strides = [0, 32, 512, 1])
        aie.end
      } {issue_token = true, iteration_t = 294912 : index, repeat_count = 15 : i32}
      aiex.dma_start_task(%44)
      aiex.dma_await_task(%35)
      %45 = aiex.dma_configure_task_for @of_0_mem_1 {
        aie.dma_bd(%arg0 : memref<2048x512xbf16> offset = 589824 len = 65536 sizes = [16, 16, 128, 32] strides = [0, 32, 512, 1])
        aie.end
      } {issue_token = true, iteration_t = 294912 : index, repeat_count = 15 : i32}
      aiex.dma_start_task(%45)
      aiex.dma_await_task(%36)
      %46 = aiex.dma_configure_task_for @of_3_mem_0 {
        aie.dma_bd(%arg3 : memref<2048x512xbf16> offset = 0 len = 32768 sizes = [16, 8, 128, 32] strides = [65536, 64, 512, 1])
        aie.end
      } {issue_token = true, iteration_t = 294912 : index, repeat_count = 15 : i32}
      aiex.dma_start_task(%46)
      aiex.dma_await_task(%37)
      %47 = aiex.dma_configure_task_for @of_3_mem_1 {
        aie.dma_bd(%arg3 : memref<2048x512xbf16> offset = 32 len = 32768 sizes = [16, 8, 128, 32] strides = [65536, 64, 512, 1])
        aie.end
      } {issue_token = true, iteration_t = 294912 : index, repeat_count = 15 : i32}
      aiex.dma_start_task(%47)
      aiex.dma_await_task(%38)
      %48 = aiex.dma_configure_task_for @of_0_mem_0 {
        aie.dma_bd(%arg0 : memref<2048x512xbf16> offset = 655360 len = 65536 sizes = [16, 16, 128, 32] strides = [0, 32, 512, 1])
        aie.end
      } {issue_token = true, iteration_t = 327680 : index, repeat_count = 15 : i32}
      aiex.dma_start_task(%48)
      aiex.dma_await_task(%39)
      %49 = aiex.dma_configure_task_for @of_0_mem_1 {
        aie.dma_bd(%arg0 : memref<2048x512xbf16> offset = 655360 len = 65536 sizes = [16, 16, 128, 32] strides = [0, 32, 512, 1])
        aie.end
      } {issue_token = true, iteration_t = 327680 : index, repeat_count = 15 : i32}
      aiex.dma_start_task(%49)
      aiex.dma_await_task(%40)
      %50 = aiex.dma_configure_task_for @of_3_mem_0 {
        aie.dma_bd(%arg3 : memref<2048x512xbf16> offset = 0 len = 32768 sizes = [16, 8, 128, 32] strides = [65536, 64, 512, 1])
        aie.end
      } {issue_token = true, iteration_t = 327680 : index, repeat_count = 15 : i32}
      aiex.dma_start_task(%50)
      aiex.dma_await_task(%41)
      %51 = aiex.dma_configure_task_for @of_3_mem_1 {
        aie.dma_bd(%arg3 : memref<2048x512xbf16> offset = 32 len = 32768 sizes = [16, 8, 128, 32] strides = [65536, 64, 512, 1])
        aie.end
      } {issue_token = true, iteration_t = 327680 : index, repeat_count = 15 : i32}
      aiex.dma_start_task(%51)
      aiex.dma_await_task(%44)
      %52 = aiex.dma_configure_task_for @of_0_mem_0 {
        aie.dma_bd(%arg0 : memref<2048x512xbf16> offset = 720896 len = 65536 sizes = [16, 16, 128, 32] strides = [0, 32, 512, 1])
        aie.end
      } {issue_token = true, iteration_t = 360448 : index, repeat_count = 15 : i32}
      aiex.dma_start_task(%52)
      aiex.dma_await_task(%45)
      %53 = aiex.dma_configure_task_for @of_0_mem_1 {
        aie.dma_bd(%arg0 : memref<2048x512xbf16> offset = 720896 len = 65536 sizes = [16, 16, 128, 32] strides = [0, 32, 512, 1])
        aie.end
      } {issue_token = true, iteration_t = 360448 : index, repeat_count = 15 : i32}
      aiex.dma_start_task(%53)
      aiex.dma_await_task(%46)
      %54 = aiex.dma_configure_task_for @of_3_mem_0 {
        aie.dma_bd(%arg3 : memref<2048x512xbf16> offset = 0 len = 32768 sizes = [16, 8, 128, 32] strides = [65536, 64, 512, 1])
        aie.end
      } {issue_token = true, iteration_t = 360448 : index, repeat_count = 15 : i32}
      aiex.dma_start_task(%54)
      aiex.dma_await_task(%47)
      %55 = aiex.dma_configure_task_for @of_3_mem_1 {
        aie.dma_bd(%arg3 : memref<2048x512xbf16> offset = 32 len = 32768 sizes = [16, 8, 128, 32] strides = [65536, 64, 512, 1])
        aie.end
      } {issue_token = true, iteration_t = 360448 : index, repeat_count = 15 : i32}
      aiex.dma_start_task(%55)
      aiex.dma_await_task(%48)
      %56 = aiex.dma_configure_task_for @of_0_mem_0 {
        aie.dma_bd(%arg0 : memref<2048x512xbf16> offset = 786432 len = 65536 sizes = [16, 16, 128, 32] strides = [0, 32, 512, 1])
        aie.end
      } {issue_token = true, iteration_t = 393216 : index, repeat_count = 15 : i32}
      aiex.dma_start_task(%56)
      aiex.dma_await_task(%49)
      %57 = aiex.dma_configure_task_for @of_0_mem_1 {
        aie.dma_bd(%arg0 : memref<2048x512xbf16> offset = 786432 len = 65536 sizes = [16, 16, 128, 32] strides = [0, 32, 512, 1])
        aie.end
      } {issue_token = true, iteration_t = 393216 : index, repeat_count = 15 : i32}
      aiex.dma_start_task(%57)
      aiex.dma_await_task(%50)
      %58 = aiex.dma_configure_task_for @of_3_mem_0 {
        aie.dma_bd(%arg3 : memref<2048x512xbf16> offset = 0 len = 32768 sizes = [16, 8, 128, 32] strides = [65536, 64, 512, 1])
        aie.end
      } {issue_token = true, iteration_t = 393216 : index, repeat_count = 15 : i32}
      aiex.dma_start_task(%58)
      aiex.dma_await_task(%51)
      %59 = aiex.dma_configure_task_for @of_3_mem_1 {
        aie.dma_bd(%arg3 : memref<2048x512xbf16> offset = 32 len = 32768 sizes = [16, 8, 128, 32] strides = [65536, 64, 512, 1])
        aie.end
      } {issue_token = true, iteration_t = 393216 : index, repeat_count = 15 : i32}
      aiex.dma_start_task(%59)
      aiex.dma_await_task(%52)
      %60 = aiex.dma_configure_task_for @of_0_mem_0 {
        aie.dma_bd(%arg0 : memref<2048x512xbf16> offset = 851968 len = 65536 sizes = [16, 16, 128, 32] strides = [0, 32, 512, 1])
        aie.end
      } {issue_token = true, iteration_t = 425984 : index, repeat_count = 15 : i32}
      aiex.dma_start_task(%60)
      aiex.dma_await_task(%53)
      %61 = aiex.dma_configure_task_for @of_0_mem_1 {
        aie.dma_bd(%arg0 : memref<2048x512xbf16> offset = 851968 len = 65536 sizes = [16, 16, 128, 32] strides = [0, 32, 512, 1])
        aie.end
      } {issue_token = true, iteration_t = 425984 : index, repeat_count = 15 : i32}
      aiex.dma_start_task(%61)
      aiex.dma_await_task(%54)
      %62 = aiex.dma_configure_task_for @of_3_mem_0 {
        aie.dma_bd(%arg3 : memref<2048x512xbf16> offset = 0 len = 32768 sizes = [16, 8, 128, 32] strides = [65536, 64, 512, 1])
        aie.end
      } {issue_token = true, iteration_t = 425984 : index, repeat_count = 15 : i32}
      aiex.dma_start_task(%62)
      aiex.dma_await_task(%55)
      %63 = aiex.dma_configure_task_for @of_3_mem_1 {
        aie.dma_bd(%arg3 : memref<2048x512xbf16> offset = 32 len = 32768 sizes = [16, 8, 128, 32] strides = [65536, 64, 512, 1])
        aie.end
      } {issue_token = true, iteration_t = 425984 : index, repeat_count = 15 : i32}
      aiex.dma_start_task(%63)
      aiex.dma_await_task(%56)
      %64 = aiex.dma_configure_task_for @of_0_mem_0 {
        aie.dma_bd(%arg0 : memref<2048x512xbf16> offset = 917504 len = 65536 sizes = [16, 16, 128, 32] strides = [0, 32, 512, 1])
        aie.end
      } {issue_token = true, iteration_t = 458752 : index, repeat_count = 15 : i32}
      aiex.dma_start_task(%64)
      aiex.dma_await_task(%57)
      %65 = aiex.dma_configure_task_for @of_0_mem_1 {
        aie.dma_bd(%arg0 : memref<2048x512xbf16> offset = 917504 len = 65536 sizes = [16, 16, 128, 32] strides = [0, 32, 512, 1])
        aie.end
      } {issue_token = true, iteration_t = 458752 : index, repeat_count = 15 : i32}
      aiex.dma_start_task(%65)
      aiex.dma_await_task(%58)
      %66 = aiex.dma_configure_task_for @of_3_mem_0 {
        aie.dma_bd(%arg3 : memref<2048x512xbf16> offset = 0 len = 32768 sizes = [16, 8, 128, 32] strides = [65536, 64, 512, 1])
        aie.end
      } {issue_token = true, iteration_t = 458752 : index, repeat_count = 15 : i32}
      aiex.dma_start_task(%66)
      aiex.dma_await_task(%59)
      %67 = aiex.dma_configure_task_for @of_3_mem_1 {
        aie.dma_bd(%arg3 : memref<2048x512xbf16> offset = 32 len = 32768 sizes = [16, 8, 128, 32] strides = [65536, 64, 512, 1])
        aie.end
      } {issue_token = true, iteration_t = 458752 : index, repeat_count = 15 : i32}
      aiex.dma_start_task(%67)
      aiex.dma_await_task(%60)
      %68 = aiex.dma_configure_task_for @of_0_mem_0 {
        aie.dma_bd(%arg0 : memref<2048x512xbf16> offset = 983040 len = 65536 sizes = [16, 16, 128, 32] strides = [0, 32, 512, 1])
        aie.end
      } {issue_token = true, iteration_t = 491520 : index, repeat_count = 15 : i32}
      aiex.dma_start_task(%68)
      aiex.dma_await_task(%61)
      %69 = aiex.dma_configure_task_for @of_0_mem_1 {
        aie.dma_bd(%arg0 : memref<2048x512xbf16> offset = 983040 len = 65536 sizes = [16, 16, 128, 32] strides = [0, 32, 512, 1])
        aie.end
      } {issue_token = true, iteration_t = 491520 : index, repeat_count = 15 : i32}
      aiex.dma_start_task(%69)
      aiex.dma_await_task(%62)
      %70 = aiex.dma_configure_task_for @of_3_mem_0 {
        aie.dma_bd(%arg3 : memref<2048x512xbf16> offset = 0 len = 32768 sizes = [16, 8, 128, 32] strides = [65536, 64, 512, 1])
        aie.end
      } {issue_token = true, iteration_t = 491520 : index, repeat_count = 15 : i32}
      aiex.dma_start_task(%70)
      aiex.dma_await_task(%63)
      %71 = aiex.dma_configure_task_for @of_3_mem_1 {
        aie.dma_bd(%arg3 : memref<2048x512xbf16> offset = 32 len = 32768 sizes = [16, 8, 128, 32] strides = [65536, 64, 512, 1])
        aie.end
      } {issue_token = true, iteration_t = 491520 : index, repeat_count = 15 : i32}
      aiex.dma_start_task(%71)
      aiex.dma_await_task(%64)
      aiex.dma_await_task(%68)
      aiex.dma_await_task(%65)
      aiex.dma_await_task(%69)
      aiex.dma_await_task(%2)
      aiex.dma_await_task(%3)
      aiex.dma_await_task(%4)
      aiex.dma_await_task(%5)
      aiex.dma_await_task(%66)
      aiex.dma_await_task(%70)
      aiex.dma_await_task(%67)
      aiex.dma_await_task(%71)
      aiex.dma_await_task(%8)
      aiex.dma_await_task(%42)
      aiex.dma_await_task(%9)
      aiex.dma_await_task(%43)
    }
    %core_0_2 = aie.core(%tile_0_2) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c16 = arith.constant 16 : index
        scf.for %arg1 = %c0_0 to %c16 step %c1_1 {
          %c16_2 = arith.constant 16 : index
          scf.for %arg2 = %c0_0 to %c16_2 step %c1_1 {
            %0 = aie.objectfifo.acquire @of_8_switch_join_0_0(Produce, 1) : !aie.objectfifosubview<memref<32x64xbf16>>
            %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<32x64xbf16>> -> memref<32x64xbf16>
            func.call @op0_zero_bf16_32_32_64(%1) : (memref<32x64xbf16>) -> ()
            %c16_3 = arith.constant 16 : index
            scf.for %arg3 = %c0_0 to %c16_3 step %c1_1 {
              %2 = aie.objectfifo.acquire @of_5_broadcast_0_0(Consume, 1) : !aie.objectfifosubview<memref<32x64xbf16>>
              %3 = aie.objectfifo.subview.access %2[0] : !aie.objectfifosubview<memref<32x64xbf16>> -> memref<32x64xbf16>
              %4 = aie.objectfifo.acquire @of_4_distribute_0_0(Consume, 1) : !aie.objectfifosubview<memref<32x32xbf16>>
              %5 = aie.objectfifo.subview.access %4[0] : !aie.objectfifosubview<memref<32x32xbf16>> -> memref<32x32xbf16>
              func.call @op0_matmul_bf16_bf16_32_32_64(%5, %3, %1) : (memref<32x32xbf16>, memref<32x64xbf16>, memref<32x64xbf16>) -> ()
              aie.objectfifo.release @of_4_distribute_0_0(Consume, 1)
              aie.objectfifo.release @of_5_broadcast_0_0(Consume, 1)
            }
            aie.objectfifo.release @of_8_switch_join_0_0(Produce, 1)
          }
        }
      }
      aie.end
    } {link_with = "op0_mm_32_32_64.o"}
    %core_0_3 = aie.core(%tile_0_3) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c16 = arith.constant 16 : index
        scf.for %arg1 = %c0_0 to %c16 step %c1_1 {
          %c16_2 = arith.constant 16 : index
          scf.for %arg2 = %c0_0 to %c16_2 step %c1_1 {
            %0 = aie.objectfifo.acquire @of_8_switch_join_1_0(Produce, 1) : !aie.objectfifosubview<memref<32x64xbf16>>
            %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<32x64xbf16>> -> memref<32x64xbf16>
            func.call @op0_zero_bf16_32_32_64(%1) : (memref<32x64xbf16>) -> ()
            %c16_3 = arith.constant 16 : index
            scf.for %arg3 = %c0_0 to %c16_3 step %c1_1 {
              %2 = aie.objectfifo.acquire @of_5_broadcast_0_0(Consume, 1) : !aie.objectfifosubview<memref<32x64xbf16>>
              %3 = aie.objectfifo.subview.access %2[0] : !aie.objectfifosubview<memref<32x64xbf16>> -> memref<32x64xbf16>
              %4 = aie.objectfifo.acquire @of_4_distribute_0_1(Consume, 1) : !aie.objectfifosubview<memref<32x32xbf16>>
              %5 = aie.objectfifo.subview.access %4[0] : !aie.objectfifosubview<memref<32x32xbf16>> -> memref<32x32xbf16>
              func.call @op0_matmul_bf16_bf16_32_32_64(%5, %3, %1) : (memref<32x32xbf16>, memref<32x64xbf16>, memref<32x64xbf16>) -> ()
              aie.objectfifo.release @of_4_distribute_0_1(Consume, 1)
              aie.objectfifo.release @of_5_broadcast_0_0(Consume, 1)
            }
            aie.objectfifo.release @of_8_switch_join_1_0(Produce, 1)
          }
        }
      }
      aie.end
    } {link_with = "op0_mm_32_32_64.o"}
    %core_0_4 = aie.core(%tile_0_4) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c16 = arith.constant 16 : index
        scf.for %arg1 = %c0_0 to %c16 step %c1_1 {
          %c16_2 = arith.constant 16 : index
          scf.for %arg2 = %c0_0 to %c16_2 step %c1_1 {
            %0 = aie.objectfifo.acquire @of_8_switch_join_2_0(Produce, 1) : !aie.objectfifosubview<memref<32x64xbf16>>
            %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<32x64xbf16>> -> memref<32x64xbf16>
            func.call @op0_zero_bf16_32_32_64(%1) : (memref<32x64xbf16>) -> ()
            %c16_3 = arith.constant 16 : index
            scf.for %arg3 = %c0_0 to %c16_3 step %c1_1 {
              %2 = aie.objectfifo.acquire @of_5_broadcast_0_0(Consume, 1) : !aie.objectfifosubview<memref<32x64xbf16>>
              %3 = aie.objectfifo.subview.access %2[0] : !aie.objectfifosubview<memref<32x64xbf16>> -> memref<32x64xbf16>
              %4 = aie.objectfifo.acquire @of_4_distribute_0_2(Consume, 1) : !aie.objectfifosubview<memref<32x32xbf16>>
              %5 = aie.objectfifo.subview.access %4[0] : !aie.objectfifosubview<memref<32x32xbf16>> -> memref<32x32xbf16>
              func.call @op0_matmul_bf16_bf16_32_32_64(%5, %3, %1) : (memref<32x32xbf16>, memref<32x64xbf16>, memref<32x64xbf16>) -> ()
              aie.objectfifo.release @of_4_distribute_0_2(Consume, 1)
              aie.objectfifo.release @of_5_broadcast_0_0(Consume, 1)
            }
            aie.objectfifo.release @of_8_switch_join_2_0(Produce, 1)
          }
        }
      }
      aie.end
    } {link_with = "op0_mm_32_32_64.o"}
    %core_0_5 = aie.core(%tile_0_5) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c16 = arith.constant 16 : index
        scf.for %arg1 = %c0_0 to %c16 step %c1_1 {
          %c16_2 = arith.constant 16 : index
          scf.for %arg2 = %c0_0 to %c16_2 step %c1_1 {
            %0 = aie.objectfifo.acquire @of_8_switch_join_3_0(Produce, 1) : !aie.objectfifosubview<memref<32x64xbf16>>
            %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<32x64xbf16>> -> memref<32x64xbf16>
            func.call @op0_zero_bf16_32_32_64(%1) : (memref<32x64xbf16>) -> ()
            %c16_3 = arith.constant 16 : index
            scf.for %arg3 = %c0_0 to %c16_3 step %c1_1 {
              %2 = aie.objectfifo.acquire @of_5_broadcast_0_0(Consume, 1) : !aie.objectfifosubview<memref<32x64xbf16>>
              %3 = aie.objectfifo.subview.access %2[0] : !aie.objectfifosubview<memref<32x64xbf16>> -> memref<32x64xbf16>
              %4 = aie.objectfifo.acquire @of_4_distribute_0_3(Consume, 1) : !aie.objectfifosubview<memref<32x32xbf16>>
              %5 = aie.objectfifo.subview.access %4[0] : !aie.objectfifosubview<memref<32x32xbf16>> -> memref<32x32xbf16>
              func.call @op0_matmul_bf16_bf16_32_32_64(%5, %3, %1) : (memref<32x32xbf16>, memref<32x64xbf16>, memref<32x64xbf16>) -> ()
              aie.objectfifo.release @of_4_distribute_0_3(Consume, 1)
              aie.objectfifo.release @of_5_broadcast_0_0(Consume, 1)
            }
            aie.objectfifo.release @of_8_switch_join_3_0(Produce, 1)
          }
        }
      }
      aie.end
    } {link_with = "op0_mm_32_32_64.o"}
    %core_1_2 = aie.core(%tile_1_2) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c16 = arith.constant 16 : index
        scf.for %arg1 = %c0_0 to %c16 step %c1_1 {
          %c16_2 = arith.constant 16 : index
          scf.for %arg2 = %c0_0 to %c16_2 step %c1_1 {
            %0 = aie.objectfifo.acquire @of_8_switch_join_0_1(Produce, 1) : !aie.objectfifosubview<memref<32x64xbf16>>
            %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<32x64xbf16>> -> memref<32x64xbf16>
            func.call @op0_zero_bf16_32_32_64(%1) : (memref<32x64xbf16>) -> ()
            %c16_3 = arith.constant 16 : index
            scf.for %arg3 = %c0_0 to %c16_3 step %c1_1 {
              %2 = aie.objectfifo.acquire @of_5_broadcast_1_0(Consume, 1) : !aie.objectfifosubview<memref<32x64xbf16>>
              %3 = aie.objectfifo.subview.access %2[0] : !aie.objectfifosubview<memref<32x64xbf16>> -> memref<32x64xbf16>
              %4 = aie.objectfifo.acquire @of_4_distribute_1_0(Consume, 1) : !aie.objectfifosubview<memref<32x32xbf16>>
              %5 = aie.objectfifo.subview.access %4[0] : !aie.objectfifosubview<memref<32x32xbf16>> -> memref<32x32xbf16>
              func.call @op0_matmul_bf16_bf16_32_32_64(%5, %3, %1) : (memref<32x32xbf16>, memref<32x64xbf16>, memref<32x64xbf16>) -> ()
              aie.objectfifo.release @of_4_distribute_1_0(Consume, 1)
              aie.objectfifo.release @of_5_broadcast_1_0(Consume, 1)
            }
            aie.objectfifo.release @of_8_switch_join_0_1(Produce, 1)
          }
        }
      }
      aie.end
    } {link_with = "op0_mm_32_32_64.o"}
    %core_1_3 = aie.core(%tile_1_3) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c16 = arith.constant 16 : index
        scf.for %arg1 = %c0_0 to %c16 step %c1_1 {
          %c16_2 = arith.constant 16 : index
          scf.for %arg2 = %c0_0 to %c16_2 step %c1_1 {
            %0 = aie.objectfifo.acquire @of_8_switch_join_1_1(Produce, 1) : !aie.objectfifosubview<memref<32x64xbf16>>
            %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<32x64xbf16>> -> memref<32x64xbf16>
            func.call @op0_zero_bf16_32_32_64(%1) : (memref<32x64xbf16>) -> ()
            %c16_3 = arith.constant 16 : index
            scf.for %arg3 = %c0_0 to %c16_3 step %c1_1 {
              %2 = aie.objectfifo.acquire @of_5_broadcast_1_0(Consume, 1) : !aie.objectfifosubview<memref<32x64xbf16>>
              %3 = aie.objectfifo.subview.access %2[0] : !aie.objectfifosubview<memref<32x64xbf16>> -> memref<32x64xbf16>
              %4 = aie.objectfifo.acquire @of_4_distribute_1_1(Consume, 1) : !aie.objectfifosubview<memref<32x32xbf16>>
              %5 = aie.objectfifo.subview.access %4[0] : !aie.objectfifosubview<memref<32x32xbf16>> -> memref<32x32xbf16>
              func.call @op0_matmul_bf16_bf16_32_32_64(%5, %3, %1) : (memref<32x32xbf16>, memref<32x64xbf16>, memref<32x64xbf16>) -> ()
              aie.objectfifo.release @of_4_distribute_1_1(Consume, 1)
              aie.objectfifo.release @of_5_broadcast_1_0(Consume, 1)
            }
            aie.objectfifo.release @of_8_switch_join_1_1(Produce, 1)
          }
        }
      }
      aie.end
    } {link_with = "op0_mm_32_32_64.o"}
    %core_1_4 = aie.core(%tile_1_4) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c16 = arith.constant 16 : index
        scf.for %arg1 = %c0_0 to %c16 step %c1_1 {
          %c16_2 = arith.constant 16 : index
          scf.for %arg2 = %c0_0 to %c16_2 step %c1_1 {
            %0 = aie.objectfifo.acquire @of_8_switch_join_2_1(Produce, 1) : !aie.objectfifosubview<memref<32x64xbf16>>
            %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<32x64xbf16>> -> memref<32x64xbf16>
            func.call @op0_zero_bf16_32_32_64(%1) : (memref<32x64xbf16>) -> ()
            %c16_3 = arith.constant 16 : index
            scf.for %arg3 = %c0_0 to %c16_3 step %c1_1 {
              %2 = aie.objectfifo.acquire @of_5_broadcast_1_0(Consume, 1) : !aie.objectfifosubview<memref<32x64xbf16>>
              %3 = aie.objectfifo.subview.access %2[0] : !aie.objectfifosubview<memref<32x64xbf16>> -> memref<32x64xbf16>
              %4 = aie.objectfifo.acquire @of_4_distribute_1_2(Consume, 1) : !aie.objectfifosubview<memref<32x32xbf16>>
              %5 = aie.objectfifo.subview.access %4[0] : !aie.objectfifosubview<memref<32x32xbf16>> -> memref<32x32xbf16>
              func.call @op0_matmul_bf16_bf16_32_32_64(%5, %3, %1) : (memref<32x32xbf16>, memref<32x64xbf16>, memref<32x64xbf16>) -> ()
              aie.objectfifo.release @of_4_distribute_1_2(Consume, 1)
              aie.objectfifo.release @of_5_broadcast_1_0(Consume, 1)
            }
            aie.objectfifo.release @of_8_switch_join_2_1(Produce, 1)
          }
        }
      }
      aie.end
    } {link_with = "op0_mm_32_32_64.o"}
    %core_1_5 = aie.core(%tile_1_5) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c16 = arith.constant 16 : index
        scf.for %arg1 = %c0_0 to %c16 step %c1_1 {
          %c16_2 = arith.constant 16 : index
          scf.for %arg2 = %c0_0 to %c16_2 step %c1_1 {
            %0 = aie.objectfifo.acquire @of_8_switch_join_3_1(Produce, 1) : !aie.objectfifosubview<memref<32x64xbf16>>
            %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<32x64xbf16>> -> memref<32x64xbf16>
            func.call @op0_zero_bf16_32_32_64(%1) : (memref<32x64xbf16>) -> ()
            %c16_3 = arith.constant 16 : index
            scf.for %arg3 = %c0_0 to %c16_3 step %c1_1 {
              %2 = aie.objectfifo.acquire @of_5_broadcast_1_0(Consume, 1) : !aie.objectfifosubview<memref<32x64xbf16>>
              %3 = aie.objectfifo.subview.access %2[0] : !aie.objectfifosubview<memref<32x64xbf16>> -> memref<32x64xbf16>
              %4 = aie.objectfifo.acquire @of_4_distribute_1_3(Consume, 1) : !aie.objectfifosubview<memref<32x32xbf16>>
              %5 = aie.objectfifo.subview.access %4[0] : !aie.objectfifosubview<memref<32x32xbf16>> -> memref<32x32xbf16>
              func.call @op0_matmul_bf16_bf16_32_32_64(%5, %3, %1) : (memref<32x32xbf16>, memref<32x64xbf16>, memref<32x64xbf16>) -> ()
              aie.objectfifo.release @of_4_distribute_1_3(Consume, 1)
              aie.objectfifo.release @of_5_broadcast_1_0(Consume, 1)
            }
            aie.objectfifo.release @of_8_switch_join_3_1(Produce, 1)
          }
        }
      }
      aie.end
    } {link_with = "op0_mm_32_32_64.o"}
    %core_2_2 = aie.core(%tile_2_2) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c16 = arith.constant 16 : index
        scf.for %arg1 = %c0_0 to %c16 step %c1_1 {
          %c16_2 = arith.constant 16 : index
          scf.for %arg2 = %c0_0 to %c16_2 step %c1_1 {
            %0 = aie.objectfifo.acquire @of_9_switch_join_0_0(Produce, 1) : !aie.objectfifosubview<memref<32x64xbf16>>
            %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<32x64xbf16>> -> memref<32x64xbf16>
            func.call @op0_zero_bf16_32_32_64(%1) : (memref<32x64xbf16>) -> ()
            %c16_3 = arith.constant 16 : index
            scf.for %arg3 = %c0_0 to %c16_3 step %c1_1 {
              %2 = aie.objectfifo.acquire @of_6_broadcast_0_0(Consume, 1) : !aie.objectfifosubview<memref<32x64xbf16>>
              %3 = aie.objectfifo.subview.access %2[0] : !aie.objectfifosubview<memref<32x64xbf16>> -> memref<32x64xbf16>
              %4 = aie.objectfifo.acquire @of_4_distribute_0_0(Consume, 1) : !aie.objectfifosubview<memref<32x32xbf16>>
              %5 = aie.objectfifo.subview.access %4[0] : !aie.objectfifosubview<memref<32x32xbf16>> -> memref<32x32xbf16>
              func.call @op0_matmul_bf16_bf16_32_32_64(%5, %3, %1) : (memref<32x32xbf16>, memref<32x64xbf16>, memref<32x64xbf16>) -> ()
              aie.objectfifo.release @of_4_distribute_0_0(Consume, 1)
              aie.objectfifo.release @of_6_broadcast_0_0(Consume, 1)
            }
            aie.objectfifo.release @of_9_switch_join_0_0(Produce, 1)
          }
        }
      }
      aie.end
    } {link_with = "op0_mm_32_32_64.o"}
    %core_2_3 = aie.core(%tile_2_3) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c16 = arith.constant 16 : index
        scf.for %arg1 = %c0_0 to %c16 step %c1_1 {
          %c16_2 = arith.constant 16 : index
          scf.for %arg2 = %c0_0 to %c16_2 step %c1_1 {
            %0 = aie.objectfifo.acquire @of_9_switch_join_1_0(Produce, 1) : !aie.objectfifosubview<memref<32x64xbf16>>
            %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<32x64xbf16>> -> memref<32x64xbf16>
            func.call @op0_zero_bf16_32_32_64(%1) : (memref<32x64xbf16>) -> ()
            %c16_3 = arith.constant 16 : index
            scf.for %arg3 = %c0_0 to %c16_3 step %c1_1 {
              %2 = aie.objectfifo.acquire @of_6_broadcast_0_0(Consume, 1) : !aie.objectfifosubview<memref<32x64xbf16>>
              %3 = aie.objectfifo.subview.access %2[0] : !aie.objectfifosubview<memref<32x64xbf16>> -> memref<32x64xbf16>
              %4 = aie.objectfifo.acquire @of_4_distribute_0_1(Consume, 1) : !aie.objectfifosubview<memref<32x32xbf16>>
              %5 = aie.objectfifo.subview.access %4[0] : !aie.objectfifosubview<memref<32x32xbf16>> -> memref<32x32xbf16>
              func.call @op0_matmul_bf16_bf16_32_32_64(%5, %3, %1) : (memref<32x32xbf16>, memref<32x64xbf16>, memref<32x64xbf16>) -> ()
              aie.objectfifo.release @of_4_distribute_0_1(Consume, 1)
              aie.objectfifo.release @of_6_broadcast_0_0(Consume, 1)
            }
            aie.objectfifo.release @of_9_switch_join_1_0(Produce, 1)
          }
        }
      }
      aie.end
    } {link_with = "op0_mm_32_32_64.o"}
    %core_2_4 = aie.core(%tile_2_4) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c16 = arith.constant 16 : index
        scf.for %arg1 = %c0_0 to %c16 step %c1_1 {
          %c16_2 = arith.constant 16 : index
          scf.for %arg2 = %c0_0 to %c16_2 step %c1_1 {
            %0 = aie.objectfifo.acquire @of_9_switch_join_2_0(Produce, 1) : !aie.objectfifosubview<memref<32x64xbf16>>
            %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<32x64xbf16>> -> memref<32x64xbf16>
            func.call @op0_zero_bf16_32_32_64(%1) : (memref<32x64xbf16>) -> ()
            %c16_3 = arith.constant 16 : index
            scf.for %arg3 = %c0_0 to %c16_3 step %c1_1 {
              %2 = aie.objectfifo.acquire @of_6_broadcast_0_0(Consume, 1) : !aie.objectfifosubview<memref<32x64xbf16>>
              %3 = aie.objectfifo.subview.access %2[0] : !aie.objectfifosubview<memref<32x64xbf16>> -> memref<32x64xbf16>
              %4 = aie.objectfifo.acquire @of_4_distribute_0_2(Consume, 1) : !aie.objectfifosubview<memref<32x32xbf16>>
              %5 = aie.objectfifo.subview.access %4[0] : !aie.objectfifosubview<memref<32x32xbf16>> -> memref<32x32xbf16>
              func.call @op0_matmul_bf16_bf16_32_32_64(%5, %3, %1) : (memref<32x32xbf16>, memref<32x64xbf16>, memref<32x64xbf16>) -> ()
              aie.objectfifo.release @of_4_distribute_0_2(Consume, 1)
              aie.objectfifo.release @of_6_broadcast_0_0(Consume, 1)
            }
            aie.objectfifo.release @of_9_switch_join_2_0(Produce, 1)
          }
        }
      }
      aie.end
    } {link_with = "op0_mm_32_32_64.o"}
    %core_2_5 = aie.core(%tile_2_5) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c16 = arith.constant 16 : index
        scf.for %arg1 = %c0_0 to %c16 step %c1_1 {
          %c16_2 = arith.constant 16 : index
          scf.for %arg2 = %c0_0 to %c16_2 step %c1_1 {
            %0 = aie.objectfifo.acquire @of_9_switch_join_3_0(Produce, 1) : !aie.objectfifosubview<memref<32x64xbf16>>
            %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<32x64xbf16>> -> memref<32x64xbf16>
            func.call @op0_zero_bf16_32_32_64(%1) : (memref<32x64xbf16>) -> ()
            %c16_3 = arith.constant 16 : index
            scf.for %arg3 = %c0_0 to %c16_3 step %c1_1 {
              %2 = aie.objectfifo.acquire @of_6_broadcast_0_0(Consume, 1) : !aie.objectfifosubview<memref<32x64xbf16>>
              %3 = aie.objectfifo.subview.access %2[0] : !aie.objectfifosubview<memref<32x64xbf16>> -> memref<32x64xbf16>
              %4 = aie.objectfifo.acquire @of_4_distribute_0_3(Consume, 1) : !aie.objectfifosubview<memref<32x32xbf16>>
              %5 = aie.objectfifo.subview.access %4[0] : !aie.objectfifosubview<memref<32x32xbf16>> -> memref<32x32xbf16>
              func.call @op0_matmul_bf16_bf16_32_32_64(%5, %3, %1) : (memref<32x32xbf16>, memref<32x64xbf16>, memref<32x64xbf16>) -> ()
              aie.objectfifo.release @of_4_distribute_0_3(Consume, 1)
              aie.objectfifo.release @of_6_broadcast_0_0(Consume, 1)
            }
            aie.objectfifo.release @of_9_switch_join_3_0(Produce, 1)
          }
        }
      }
      aie.end
    } {link_with = "op0_mm_32_32_64.o"}
    %core_3_2 = aie.core(%tile_3_2) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c16 = arith.constant 16 : index
        scf.for %arg1 = %c0_0 to %c16 step %c1_1 {
          %c16_2 = arith.constant 16 : index
          scf.for %arg2 = %c0_0 to %c16_2 step %c1_1 {
            %0 = aie.objectfifo.acquire @of_9_switch_join_0_1(Produce, 1) : !aie.objectfifosubview<memref<32x64xbf16>>
            %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<32x64xbf16>> -> memref<32x64xbf16>
            func.call @op0_zero_bf16_32_32_64(%1) : (memref<32x64xbf16>) -> ()
            %c16_3 = arith.constant 16 : index
            scf.for %arg3 = %c0_0 to %c16_3 step %c1_1 {
              %2 = aie.objectfifo.acquire @of_6_broadcast_1_0(Consume, 1) : !aie.objectfifosubview<memref<32x64xbf16>>
              %3 = aie.objectfifo.subview.access %2[0] : !aie.objectfifosubview<memref<32x64xbf16>> -> memref<32x64xbf16>
              %4 = aie.objectfifo.acquire @of_4_distribute_1_0(Consume, 1) : !aie.objectfifosubview<memref<32x32xbf16>>
              %5 = aie.objectfifo.subview.access %4[0] : !aie.objectfifosubview<memref<32x32xbf16>> -> memref<32x32xbf16>
              func.call @op0_matmul_bf16_bf16_32_32_64(%5, %3, %1) : (memref<32x32xbf16>, memref<32x64xbf16>, memref<32x64xbf16>) -> ()
              aie.objectfifo.release @of_4_distribute_1_0(Consume, 1)
              aie.objectfifo.release @of_6_broadcast_1_0(Consume, 1)
            }
            aie.objectfifo.release @of_9_switch_join_0_1(Produce, 1)
          }
        }
      }
      aie.end
    } {link_with = "op0_mm_32_32_64.o"}
    %core_3_3 = aie.core(%tile_3_3) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c16 = arith.constant 16 : index
        scf.for %arg1 = %c0_0 to %c16 step %c1_1 {
          %c16_2 = arith.constant 16 : index
          scf.for %arg2 = %c0_0 to %c16_2 step %c1_1 {
            %0 = aie.objectfifo.acquire @of_9_switch_join_1_1(Produce, 1) : !aie.objectfifosubview<memref<32x64xbf16>>
            %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<32x64xbf16>> -> memref<32x64xbf16>
            func.call @op0_zero_bf16_32_32_64(%1) : (memref<32x64xbf16>) -> ()
            %c16_3 = arith.constant 16 : index
            scf.for %arg3 = %c0_0 to %c16_3 step %c1_1 {
              %2 = aie.objectfifo.acquire @of_6_broadcast_1_0(Consume, 1) : !aie.objectfifosubview<memref<32x64xbf16>>
              %3 = aie.objectfifo.subview.access %2[0] : !aie.objectfifosubview<memref<32x64xbf16>> -> memref<32x64xbf16>
              %4 = aie.objectfifo.acquire @of_4_distribute_1_1(Consume, 1) : !aie.objectfifosubview<memref<32x32xbf16>>
              %5 = aie.objectfifo.subview.access %4[0] : !aie.objectfifosubview<memref<32x32xbf16>> -> memref<32x32xbf16>
              func.call @op0_matmul_bf16_bf16_32_32_64(%5, %3, %1) : (memref<32x32xbf16>, memref<32x64xbf16>, memref<32x64xbf16>) -> ()
              aie.objectfifo.release @of_4_distribute_1_1(Consume, 1)
              aie.objectfifo.release @of_6_broadcast_1_0(Consume, 1)
            }
            aie.objectfifo.release @of_9_switch_join_1_1(Produce, 1)
          }
        }
      }
      aie.end
    } {link_with = "op0_mm_32_32_64.o"}
    %core_3_4 = aie.core(%tile_3_4) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c16 = arith.constant 16 : index
        scf.for %arg1 = %c0_0 to %c16 step %c1_1 {
          %c16_2 = arith.constant 16 : index
          scf.for %arg2 = %c0_0 to %c16_2 step %c1_1 {
            %0 = aie.objectfifo.acquire @of_9_switch_join_2_1(Produce, 1) : !aie.objectfifosubview<memref<32x64xbf16>>
            %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<32x64xbf16>> -> memref<32x64xbf16>
            func.call @op0_zero_bf16_32_32_64(%1) : (memref<32x64xbf16>) -> ()
            %c16_3 = arith.constant 16 : index
            scf.for %arg3 = %c0_0 to %c16_3 step %c1_1 {
              %2 = aie.objectfifo.acquire @of_6_broadcast_1_0(Consume, 1) : !aie.objectfifosubview<memref<32x64xbf16>>
              %3 = aie.objectfifo.subview.access %2[0] : !aie.objectfifosubview<memref<32x64xbf16>> -> memref<32x64xbf16>
              %4 = aie.objectfifo.acquire @of_4_distribute_1_2(Consume, 1) : !aie.objectfifosubview<memref<32x32xbf16>>
              %5 = aie.objectfifo.subview.access %4[0] : !aie.objectfifosubview<memref<32x32xbf16>> -> memref<32x32xbf16>
              func.call @op0_matmul_bf16_bf16_32_32_64(%5, %3, %1) : (memref<32x32xbf16>, memref<32x64xbf16>, memref<32x64xbf16>) -> ()
              aie.objectfifo.release @of_4_distribute_1_2(Consume, 1)
              aie.objectfifo.release @of_6_broadcast_1_0(Consume, 1)
            }
            aie.objectfifo.release @of_9_switch_join_2_1(Produce, 1)
          }
        }
      }
      aie.end
    } {link_with = "op0_mm_32_32_64.o"}
    %core_3_5 = aie.core(%tile_3_5) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c16 = arith.constant 16 : index
        scf.for %arg1 = %c0_0 to %c16 step %c1_1 {
          %c16_2 = arith.constant 16 : index
          scf.for %arg2 = %c0_0 to %c16_2 step %c1_1 {
            %0 = aie.objectfifo.acquire @of_9_switch_join_3_1(Produce, 1) : !aie.objectfifosubview<memref<32x64xbf16>>
            %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<32x64xbf16>> -> memref<32x64xbf16>
            func.call @op0_zero_bf16_32_32_64(%1) : (memref<32x64xbf16>) -> ()
            %c16_3 = arith.constant 16 : index
            scf.for %arg3 = %c0_0 to %c16_3 step %c1_1 {
              %2 = aie.objectfifo.acquire @of_6_broadcast_1_0(Consume, 1) : !aie.objectfifosubview<memref<32x64xbf16>>
              %3 = aie.objectfifo.subview.access %2[0] : !aie.objectfifosubview<memref<32x64xbf16>> -> memref<32x64xbf16>
              %4 = aie.objectfifo.acquire @of_4_distribute_1_3(Consume, 1) : !aie.objectfifosubview<memref<32x32xbf16>>
              %5 = aie.objectfifo.subview.access %4[0] : !aie.objectfifosubview<memref<32x32xbf16>> -> memref<32x32xbf16>
              func.call @op0_matmul_bf16_bf16_32_32_64(%5, %3, %1) : (memref<32x32xbf16>, memref<32x64xbf16>, memref<32x64xbf16>) -> ()
              aie.objectfifo.release @of_4_distribute_1_3(Consume, 1)
              aie.objectfifo.release @of_6_broadcast_1_0(Consume, 1)
            }
            aie.objectfifo.release @of_9_switch_join_3_1(Produce, 1)
          }
        }
      }
      aie.end
    } {link_with = "op0_mm_32_32_64.o"}
    %core_4_2 = aie.core(%tile_4_2) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c16 = arith.constant 16 : index
        scf.for %arg1 = %c0_0 to %c16 step %c1_1 {
          %c16_2 = arith.constant 16 : index
          scf.for %arg2 = %c0_0 to %c16_2 step %c1_1 {
            %c2 = arith.constant 2 : index
            %0 = aie.objectfifo.acquire @of_8_switch_join_0_0(Consume, 1) : !aie.objectfifosubview<memref<32x64xbf16>>
            %1 = aie.objectfifo.acquire @of_8_switch_join_0_1(Consume, 1) : !aie.objectfifosubview<memref<32x64xbf16>>
            %2 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<32x64xbf16>> -> memref<32x64xbf16>
            %3 = aie.objectfifo.subview.access %1[0] : !aie.objectfifosubview<memref<32x64xbf16>> -> memref<32x64xbf16>
            scf.for %arg3 = %c0_0 to %c2 step %c1_1 {
              %4 = aie.objectfifo.acquire @of_10_unicast_0(Produce, 1) : !aie.objectfifosubview<memref<32x64xbf16>>
              %5 = aie.objectfifo.subview.access %4[0] : !aie.objectfifosubview<memref<32x64xbf16>> -> memref<32x64xbf16>
              %6 = scf.index_switch %arg3 -> memref<32x64xbf16> 
              case 0 {
                scf.yield %2 : memref<32x64xbf16>
              }
              case 1 {
                scf.yield %3 : memref<32x64xbf16>
              }
              default {
                scf.yield %2 : memref<32x64xbf16>
              }
              %c2048_i32 = arith.constant 2048 : i32
              func.call @op0_silu_bf16(%6, %5, %c2048_i32) : (memref<32x64xbf16>, memref<32x64xbf16>, i32) -> ()
              aie.objectfifo.release @of_10_unicast_0(Produce, 1)
            }
            aie.objectfifo.release @of_8_switch_join_0_0(Consume, 1)
            aie.objectfifo.release @of_8_switch_join_0_1(Consume, 1)
          }
        }
      }
      aie.end
    } {link_with = "op0_silu.o"}
    %core_4_3 = aie.core(%tile_4_3) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c16 = arith.constant 16 : index
        scf.for %arg1 = %c0_0 to %c16 step %c1_1 {
          %c16_2 = arith.constant 16 : index
          scf.for %arg2 = %c0_0 to %c16_2 step %c1_1 {
            %c2 = arith.constant 2 : index
            %0 = aie.objectfifo.acquire @of_8_switch_join_1_0(Consume, 1) : !aie.objectfifosubview<memref<32x64xbf16>>
            %1 = aie.objectfifo.acquire @of_8_switch_join_1_1(Consume, 1) : !aie.objectfifosubview<memref<32x64xbf16>>
            %2 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<32x64xbf16>> -> memref<32x64xbf16>
            %3 = aie.objectfifo.subview.access %1[0] : !aie.objectfifosubview<memref<32x64xbf16>> -> memref<32x64xbf16>
            scf.for %arg3 = %c0_0 to %c2 step %c1_1 {
              %4 = aie.objectfifo.acquire @of_10_unicast_1(Produce, 1) : !aie.objectfifosubview<memref<32x64xbf16>>
              %5 = aie.objectfifo.subview.access %4[0] : !aie.objectfifosubview<memref<32x64xbf16>> -> memref<32x64xbf16>
              %6 = scf.index_switch %arg3 -> memref<32x64xbf16> 
              case 0 {
                scf.yield %2 : memref<32x64xbf16>
              }
              case 1 {
                scf.yield %3 : memref<32x64xbf16>
              }
              default {
                scf.yield %2 : memref<32x64xbf16>
              }
              %c2048_i32 = arith.constant 2048 : i32
              func.call @op0_silu_bf16(%6, %5, %c2048_i32) : (memref<32x64xbf16>, memref<32x64xbf16>, i32) -> ()
              aie.objectfifo.release @of_10_unicast_1(Produce, 1)
            }
            aie.objectfifo.release @of_8_switch_join_1_0(Consume, 1)
            aie.objectfifo.release @of_8_switch_join_1_1(Consume, 1)
          }
        }
      }
      aie.end
    } {link_with = "op0_silu.o"}
    %core_4_4 = aie.core(%tile_4_4) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c16 = arith.constant 16 : index
        scf.for %arg1 = %c0_0 to %c16 step %c1_1 {
          %c16_2 = arith.constant 16 : index
          scf.for %arg2 = %c0_0 to %c16_2 step %c1_1 {
            %c2 = arith.constant 2 : index
            %0 = aie.objectfifo.acquire @of_8_switch_join_2_0(Consume, 1) : !aie.objectfifosubview<memref<32x64xbf16>>
            %1 = aie.objectfifo.acquire @of_8_switch_join_2_1(Consume, 1) : !aie.objectfifosubview<memref<32x64xbf16>>
            %2 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<32x64xbf16>> -> memref<32x64xbf16>
            %3 = aie.objectfifo.subview.access %1[0] : !aie.objectfifosubview<memref<32x64xbf16>> -> memref<32x64xbf16>
            scf.for %arg3 = %c0_0 to %c2 step %c1_1 {
              %4 = aie.objectfifo.acquire @of_10_unicast_2(Produce, 1) : !aie.objectfifosubview<memref<32x64xbf16>>
              %5 = aie.objectfifo.subview.access %4[0] : !aie.objectfifosubview<memref<32x64xbf16>> -> memref<32x64xbf16>
              %6 = scf.index_switch %arg3 -> memref<32x64xbf16> 
              case 0 {
                scf.yield %2 : memref<32x64xbf16>
              }
              case 1 {
                scf.yield %3 : memref<32x64xbf16>
              }
              default {
                scf.yield %2 : memref<32x64xbf16>
              }
              %c2048_i32 = arith.constant 2048 : i32
              func.call @op0_silu_bf16(%6, %5, %c2048_i32) : (memref<32x64xbf16>, memref<32x64xbf16>, i32) -> ()
              aie.objectfifo.release @of_10_unicast_2(Produce, 1)
            }
            aie.objectfifo.release @of_8_switch_join_2_0(Consume, 1)
            aie.objectfifo.release @of_8_switch_join_2_1(Consume, 1)
          }
        }
      }
      aie.end
    } {link_with = "op0_silu.o"}
    %core_4_5 = aie.core(%tile_4_5) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c16 = arith.constant 16 : index
        scf.for %arg1 = %c0_0 to %c16 step %c1_1 {
          %c16_2 = arith.constant 16 : index
          scf.for %arg2 = %c0_0 to %c16_2 step %c1_1 {
            %c2 = arith.constant 2 : index
            %0 = aie.objectfifo.acquire @of_8_switch_join_3_0(Consume, 1) : !aie.objectfifosubview<memref<32x64xbf16>>
            %1 = aie.objectfifo.acquire @of_8_switch_join_3_1(Consume, 1) : !aie.objectfifosubview<memref<32x64xbf16>>
            %2 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<32x64xbf16>> -> memref<32x64xbf16>
            %3 = aie.objectfifo.subview.access %1[0] : !aie.objectfifosubview<memref<32x64xbf16>> -> memref<32x64xbf16>
            scf.for %arg3 = %c0_0 to %c2 step %c1_1 {
              %4 = aie.objectfifo.acquire @of_10_unicast_3(Produce, 1) : !aie.objectfifosubview<memref<32x64xbf16>>
              %5 = aie.objectfifo.subview.access %4[0] : !aie.objectfifosubview<memref<32x64xbf16>> -> memref<32x64xbf16>
              %6 = scf.index_switch %arg3 -> memref<32x64xbf16> 
              case 0 {
                scf.yield %2 : memref<32x64xbf16>
              }
              case 1 {
                scf.yield %3 : memref<32x64xbf16>
              }
              default {
                scf.yield %2 : memref<32x64xbf16>
              }
              %c2048_i32 = arith.constant 2048 : i32
              func.call @op0_silu_bf16(%6, %5, %c2048_i32) : (memref<32x64xbf16>, memref<32x64xbf16>, i32) -> ()
              aie.objectfifo.release @of_10_unicast_3(Produce, 1)
            }
            aie.objectfifo.release @of_8_switch_join_3_0(Consume, 1)
            aie.objectfifo.release @of_8_switch_join_3_1(Consume, 1)
          }
        }
      }
      aie.end
    } {link_with = "op0_silu.o"}
    %core_5_2 = aie.core(%tile_5_2) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c16 = arith.constant 16 : index
        scf.for %arg1 = %c0_0 to %c16 step %c1_1 {
          %c16_2 = arith.constant 16 : index
          scf.for %arg2 = %c0_0 to %c16_2 step %c1_1 {
            %c2 = arith.constant 2 : index
            %0 = aie.objectfifo.acquire @of_9_switch_join_0_0(Consume, 1) : !aie.objectfifosubview<memref<32x64xbf16>>
            %1 = aie.objectfifo.acquire @of_9_switch_join_0_1(Consume, 1) : !aie.objectfifosubview<memref<32x64xbf16>>
            %2 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<32x64xbf16>> -> memref<32x64xbf16>
            %3 = aie.objectfifo.subview.access %1[0] : !aie.objectfifosubview<memref<32x64xbf16>> -> memref<32x64xbf16>
            scf.for %arg3 = %c0_0 to %c2 step %c1_1 {
              %4 = aie.objectfifo.acquire @of_11_broadcast_0(Produce, 1) : !aie.objectfifosubview<memref<32x64xbf16>>
              %5 = aie.objectfifo.subview.access %4[0] : !aie.objectfifosubview<memref<32x64xbf16>> -> memref<32x64xbf16>
              %6 = aie.objectfifo.acquire @of_10_unicast_0(Consume, 1) : !aie.objectfifosubview<memref<32x64xbf16>>
              %7 = aie.objectfifo.subview.access %6[0] : !aie.objectfifosubview<memref<32x64xbf16>> -> memref<32x64xbf16>
              %8 = scf.index_switch %arg3 -> memref<32x64xbf16> 
              case 0 {
                scf.yield %2 : memref<32x64xbf16>
              }
              case 1 {
                scf.yield %3 : memref<32x64xbf16>
              }
              default {
                scf.yield %2 : memref<32x64xbf16>
              }
              %c2048_i32 = arith.constant 2048 : i32
              func.call @op0_eltwise_mul_bf16_vector(%7, %8, %5, %c2048_i32) : (memref<32x64xbf16>, memref<32x64xbf16>, memref<32x64xbf16>, i32) -> ()
              aie.objectfifo.release @of_10_unicast_0(Consume, 1)
              aie.objectfifo.release @of_11_broadcast_0(Produce, 1)
            }
            aie.objectfifo.release @of_9_switch_join_0_0(Consume, 1)
            aie.objectfifo.release @of_9_switch_join_0_1(Consume, 1)
          }
        }
      }
      aie.end
    } {link_with = "op0_mul.o"}
    %core_5_3 = aie.core(%tile_5_3) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c16 = arith.constant 16 : index
        scf.for %arg1 = %c0_0 to %c16 step %c1_1 {
          %c16_2 = arith.constant 16 : index
          scf.for %arg2 = %c0_0 to %c16_2 step %c1_1 {
            %c2 = arith.constant 2 : index
            %0 = aie.objectfifo.acquire @of_9_switch_join_1_0(Consume, 1) : !aie.objectfifosubview<memref<32x64xbf16>>
            %1 = aie.objectfifo.acquire @of_9_switch_join_1_1(Consume, 1) : !aie.objectfifosubview<memref<32x64xbf16>>
            %2 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<32x64xbf16>> -> memref<32x64xbf16>
            %3 = aie.objectfifo.subview.access %1[0] : !aie.objectfifosubview<memref<32x64xbf16>> -> memref<32x64xbf16>
            scf.for %arg3 = %c0_0 to %c2 step %c1_1 {
              %4 = aie.objectfifo.acquire @of_11_broadcast_1(Produce, 1) : !aie.objectfifosubview<memref<32x64xbf16>>
              %5 = aie.objectfifo.subview.access %4[0] : !aie.objectfifosubview<memref<32x64xbf16>> -> memref<32x64xbf16>
              %6 = aie.objectfifo.acquire @of_10_unicast_1(Consume, 1) : !aie.objectfifosubview<memref<32x64xbf16>>
              %7 = aie.objectfifo.subview.access %6[0] : !aie.objectfifosubview<memref<32x64xbf16>> -> memref<32x64xbf16>
              %8 = scf.index_switch %arg3 -> memref<32x64xbf16> 
              case 0 {
                scf.yield %2 : memref<32x64xbf16>
              }
              case 1 {
                scf.yield %3 : memref<32x64xbf16>
              }
              default {
                scf.yield %2 : memref<32x64xbf16>
              }
              %c2048_i32 = arith.constant 2048 : i32
              func.call @op0_eltwise_mul_bf16_vector(%7, %8, %5, %c2048_i32) : (memref<32x64xbf16>, memref<32x64xbf16>, memref<32x64xbf16>, i32) -> ()
              aie.objectfifo.release @of_10_unicast_1(Consume, 1)
              aie.objectfifo.release @of_11_broadcast_1(Produce, 1)
            }
            aie.objectfifo.release @of_9_switch_join_1_0(Consume, 1)
            aie.objectfifo.release @of_9_switch_join_1_1(Consume, 1)
          }
        }
      }
      aie.end
    } {link_with = "op0_mul.o"}
    %core_5_4 = aie.core(%tile_5_4) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c16 = arith.constant 16 : index
        scf.for %arg1 = %c0_0 to %c16 step %c1_1 {
          %c16_2 = arith.constant 16 : index
          scf.for %arg2 = %c0_0 to %c16_2 step %c1_1 {
            %c2 = arith.constant 2 : index
            %0 = aie.objectfifo.acquire @of_9_switch_join_2_0(Consume, 1) : !aie.objectfifosubview<memref<32x64xbf16>>
            %1 = aie.objectfifo.acquire @of_9_switch_join_2_1(Consume, 1) : !aie.objectfifosubview<memref<32x64xbf16>>
            %2 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<32x64xbf16>> -> memref<32x64xbf16>
            %3 = aie.objectfifo.subview.access %1[0] : !aie.objectfifosubview<memref<32x64xbf16>> -> memref<32x64xbf16>
            scf.for %arg3 = %c0_0 to %c2 step %c1_1 {
              %4 = aie.objectfifo.acquire @of_11_broadcast_2(Produce, 1) : !aie.objectfifosubview<memref<32x64xbf16>>
              %5 = aie.objectfifo.subview.access %4[0] : !aie.objectfifosubview<memref<32x64xbf16>> -> memref<32x64xbf16>
              %6 = aie.objectfifo.acquire @of_10_unicast_2(Consume, 1) : !aie.objectfifosubview<memref<32x64xbf16>>
              %7 = aie.objectfifo.subview.access %6[0] : !aie.objectfifosubview<memref<32x64xbf16>> -> memref<32x64xbf16>
              %8 = scf.index_switch %arg3 -> memref<32x64xbf16> 
              case 0 {
                scf.yield %2 : memref<32x64xbf16>
              }
              case 1 {
                scf.yield %3 : memref<32x64xbf16>
              }
              default {
                scf.yield %2 : memref<32x64xbf16>
              }
              %c2048_i32 = arith.constant 2048 : i32
              func.call @op0_eltwise_mul_bf16_vector(%7, %8, %5, %c2048_i32) : (memref<32x64xbf16>, memref<32x64xbf16>, memref<32x64xbf16>, i32) -> ()
              aie.objectfifo.release @of_10_unicast_2(Consume, 1)
              aie.objectfifo.release @of_11_broadcast_2(Produce, 1)
            }
            aie.objectfifo.release @of_9_switch_join_2_0(Consume, 1)
            aie.objectfifo.release @of_9_switch_join_2_1(Consume, 1)
          }
        }
      }
      aie.end
    } {link_with = "op0_mul.o"}
    %core_5_5 = aie.core(%tile_5_5) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c16 = arith.constant 16 : index
        scf.for %arg1 = %c0_0 to %c16 step %c1_1 {
          %c16_2 = arith.constant 16 : index
          scf.for %arg2 = %c0_0 to %c16_2 step %c1_1 {
            %c2 = arith.constant 2 : index
            %0 = aie.objectfifo.acquire @of_9_switch_join_3_0(Consume, 1) : !aie.objectfifosubview<memref<32x64xbf16>>
            %1 = aie.objectfifo.acquire @of_9_switch_join_3_1(Consume, 1) : !aie.objectfifosubview<memref<32x64xbf16>>
            %2 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<32x64xbf16>> -> memref<32x64xbf16>
            %3 = aie.objectfifo.subview.access %1[0] : !aie.objectfifosubview<memref<32x64xbf16>> -> memref<32x64xbf16>
            scf.for %arg3 = %c0_0 to %c2 step %c1_1 {
              %4 = aie.objectfifo.acquire @of_11_broadcast_3(Produce, 1) : !aie.objectfifosubview<memref<32x64xbf16>>
              %5 = aie.objectfifo.subview.access %4[0] : !aie.objectfifosubview<memref<32x64xbf16>> -> memref<32x64xbf16>
              %6 = aie.objectfifo.acquire @of_10_unicast_3(Consume, 1) : !aie.objectfifosubview<memref<32x64xbf16>>
              %7 = aie.objectfifo.subview.access %6[0] : !aie.objectfifosubview<memref<32x64xbf16>> -> memref<32x64xbf16>
              %8 = scf.index_switch %arg3 -> memref<32x64xbf16> 
              case 0 {
                scf.yield %2 : memref<32x64xbf16>
              }
              case 1 {
                scf.yield %3 : memref<32x64xbf16>
              }
              default {
                scf.yield %2 : memref<32x64xbf16>
              }
              %c2048_i32 = arith.constant 2048 : i32
              func.call @op0_eltwise_mul_bf16_vector(%7, %8, %5, %c2048_i32) : (memref<32x64xbf16>, memref<32x64xbf16>, memref<32x64xbf16>, i32) -> ()
              aie.objectfifo.release @of_10_unicast_3(Consume, 1)
              aie.objectfifo.release @of_11_broadcast_3(Produce, 1)
            }
            aie.objectfifo.release @of_9_switch_join_3_0(Consume, 1)
            aie.objectfifo.release @of_9_switch_join_3_1(Consume, 1)
          }
        }
      }
      aie.end
    } {link_with = "op0_mul.o"}
    %core_6_2 = aie.core(%tile_6_2) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c16 = arith.constant 16 : index
        scf.for %arg1 = %c0_0 to %c16 step %c1_1 {
          %0 = aie.objectfifo.acquire @of_12_join_0_0(Produce, 8) : !aie.objectfifosubview<memref<32x32xbf16>>
          %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<32x32xbf16>> -> memref<32x32xbf16>
          func.call @op0_zero_bf16_32_64_32(%1) : (memref<32x32xbf16>) -> ()
          %2 = aie.objectfifo.subview.access %0[1] : !aie.objectfifosubview<memref<32x32xbf16>> -> memref<32x32xbf16>
          func.call @op0_zero_bf16_32_64_32(%2) : (memref<32x32xbf16>) -> ()
          %3 = aie.objectfifo.subview.access %0[2] : !aie.objectfifosubview<memref<32x32xbf16>> -> memref<32x32xbf16>
          func.call @op0_zero_bf16_32_64_32(%3) : (memref<32x32xbf16>) -> ()
          %4 = aie.objectfifo.subview.access %0[3] : !aie.objectfifosubview<memref<32x32xbf16>> -> memref<32x32xbf16>
          func.call @op0_zero_bf16_32_64_32(%4) : (memref<32x32xbf16>) -> ()
          %5 = aie.objectfifo.subview.access %0[4] : !aie.objectfifosubview<memref<32x32xbf16>> -> memref<32x32xbf16>
          func.call @op0_zero_bf16_32_64_32(%5) : (memref<32x32xbf16>) -> ()
          %6 = aie.objectfifo.subview.access %0[5] : !aie.objectfifosubview<memref<32x32xbf16>> -> memref<32x32xbf16>
          func.call @op0_zero_bf16_32_64_32(%6) : (memref<32x32xbf16>) -> ()
          %7 = aie.objectfifo.subview.access %0[6] : !aie.objectfifosubview<memref<32x32xbf16>> -> memref<32x32xbf16>
          func.call @op0_zero_bf16_32_64_32(%7) : (memref<32x32xbf16>) -> ()
          %8 = aie.objectfifo.subview.access %0[7] : !aie.objectfifosubview<memref<32x32xbf16>> -> memref<32x32xbf16>
          func.call @op0_zero_bf16_32_64_32(%8) : (memref<32x32xbf16>) -> ()
          %c16_2 = arith.constant 16 : index
          scf.for %arg2 = %c0_0 to %c16_2 step %c1_1 {
            %9 = aie.objectfifo.acquire @of_11_broadcast_0(Consume, 2) : !aie.objectfifosubview<memref<32x64xbf16>>
            %10 = aie.objectfifo.subview.access %9[0] : !aie.objectfifosubview<memref<32x64xbf16>> -> memref<32x64xbf16>
            %11 = aie.objectfifo.subview.access %9[1] : !aie.objectfifosubview<memref<32x64xbf16>> -> memref<32x64xbf16>
            %c8 = arith.constant 8 : index
            scf.for %arg3 = %c0_0 to %c8 step %c1_1 {
              %c1_3 = arith.constant 1 : index
              %c0_4 = arith.constant 0 : index
              %12 = arith.muli %c1_3, %arg3 : index
              %13 = arith.addi %c0_4, %12 : index
              %14 = arith.muli %c1_3, %c8 : index
              %15 = scf.index_switch %13 -> memref<32x32xbf16> 
              case 0 {
                scf.yield %1 : memref<32x32xbf16>
              }
              case 1 {
                scf.yield %2 : memref<32x32xbf16>
              }
              case 2 {
                scf.yield %3 : memref<32x32xbf16>
              }
              case 3 {
                scf.yield %4 : memref<32x32xbf16>
              }
              case 4 {
                scf.yield %5 : memref<32x32xbf16>
              }
              case 5 {
                scf.yield %6 : memref<32x32xbf16>
              }
              case 6 {
                scf.yield %7 : memref<32x32xbf16>
              }
              case 7 {
                scf.yield %8 : memref<32x32xbf16>
              }
              default {
                scf.yield %1 : memref<32x32xbf16>
              }
              %c2 = arith.constant 2 : index
              scf.for %arg4 = %c0_0 to %c2 step %c1_1 {
                %c1_5 = arith.constant 1 : index
                %c0_6 = arith.constant 0 : index
                %16 = arith.muli %c1_5, %arg4 : index
                %17 = arith.addi %c0_6, %16 : index
                %18 = arith.muli %c1_5, %c2 : index
                %19 = scf.index_switch %17 -> memref<32x64xbf16> 
                case 0 {
                  scf.yield %10 : memref<32x64xbf16>
                }
                case 1 {
                  scf.yield %11 : memref<32x64xbf16>
                }
                default {
                  scf.yield %10 : memref<32x64xbf16>
                }
                %20 = aie.objectfifo.acquire @of_7_broadcast_0_0(Consume, 1) : !aie.objectfifosubview<memref<64x32xbf16>>
                %21 = aie.objectfifo.subview.access %20[0] : !aie.objectfifosubview<memref<64x32xbf16>> -> memref<64x32xbf16>
                func.call @op0_matmul_bf16_bf16_32_64_32(%19, %21, %15) : (memref<32x64xbf16>, memref<64x32xbf16>, memref<32x32xbf16>) -> ()
                aie.objectfifo.release @of_7_broadcast_0_0(Consume, 1)
              }
            }
            aie.objectfifo.release @of_11_broadcast_0(Consume, 2)
          }
          aie.objectfifo.release @of_12_join_0_0(Produce, 8)
        }
      }
      aie.end
    } {link_with = "op0_mm_32_64_32.o"}
    %core_6_3 = aie.core(%tile_6_3) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c16 = arith.constant 16 : index
        scf.for %arg1 = %c0_0 to %c16 step %c1_1 {
          %0 = aie.objectfifo.acquire @of_12_join_0_1(Produce, 8) : !aie.objectfifosubview<memref<32x32xbf16>>
          %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<32x32xbf16>> -> memref<32x32xbf16>
          func.call @op0_zero_bf16_32_64_32(%1) : (memref<32x32xbf16>) -> ()
          %2 = aie.objectfifo.subview.access %0[1] : !aie.objectfifosubview<memref<32x32xbf16>> -> memref<32x32xbf16>
          func.call @op0_zero_bf16_32_64_32(%2) : (memref<32x32xbf16>) -> ()
          %3 = aie.objectfifo.subview.access %0[2] : !aie.objectfifosubview<memref<32x32xbf16>> -> memref<32x32xbf16>
          func.call @op0_zero_bf16_32_64_32(%3) : (memref<32x32xbf16>) -> ()
          %4 = aie.objectfifo.subview.access %0[3] : !aie.objectfifosubview<memref<32x32xbf16>> -> memref<32x32xbf16>
          func.call @op0_zero_bf16_32_64_32(%4) : (memref<32x32xbf16>) -> ()
          %5 = aie.objectfifo.subview.access %0[4] : !aie.objectfifosubview<memref<32x32xbf16>> -> memref<32x32xbf16>
          func.call @op0_zero_bf16_32_64_32(%5) : (memref<32x32xbf16>) -> ()
          %6 = aie.objectfifo.subview.access %0[5] : !aie.objectfifosubview<memref<32x32xbf16>> -> memref<32x32xbf16>
          func.call @op0_zero_bf16_32_64_32(%6) : (memref<32x32xbf16>) -> ()
          %7 = aie.objectfifo.subview.access %0[6] : !aie.objectfifosubview<memref<32x32xbf16>> -> memref<32x32xbf16>
          func.call @op0_zero_bf16_32_64_32(%7) : (memref<32x32xbf16>) -> ()
          %8 = aie.objectfifo.subview.access %0[7] : !aie.objectfifosubview<memref<32x32xbf16>> -> memref<32x32xbf16>
          func.call @op0_zero_bf16_32_64_32(%8) : (memref<32x32xbf16>) -> ()
          %c16_2 = arith.constant 16 : index
          scf.for %arg2 = %c0_0 to %c16_2 step %c1_1 {
            %9 = aie.objectfifo.acquire @of_11_broadcast_1(Consume, 2) : !aie.objectfifosubview<memref<32x64xbf16>>
            %10 = aie.objectfifo.subview.access %9[0] : !aie.objectfifosubview<memref<32x64xbf16>> -> memref<32x64xbf16>
            %11 = aie.objectfifo.subview.access %9[1] : !aie.objectfifosubview<memref<32x64xbf16>> -> memref<32x64xbf16>
            %c8 = arith.constant 8 : index
            scf.for %arg3 = %c0_0 to %c8 step %c1_1 {
              %c1_3 = arith.constant 1 : index
              %c0_4 = arith.constant 0 : index
              %12 = arith.muli %c1_3, %arg3 : index
              %13 = arith.addi %c0_4, %12 : index
              %14 = arith.muli %c1_3, %c8 : index
              %15 = scf.index_switch %13 -> memref<32x32xbf16> 
              case 0 {
                scf.yield %1 : memref<32x32xbf16>
              }
              case 1 {
                scf.yield %2 : memref<32x32xbf16>
              }
              case 2 {
                scf.yield %3 : memref<32x32xbf16>
              }
              case 3 {
                scf.yield %4 : memref<32x32xbf16>
              }
              case 4 {
                scf.yield %5 : memref<32x32xbf16>
              }
              case 5 {
                scf.yield %6 : memref<32x32xbf16>
              }
              case 6 {
                scf.yield %7 : memref<32x32xbf16>
              }
              case 7 {
                scf.yield %8 : memref<32x32xbf16>
              }
              default {
                scf.yield %1 : memref<32x32xbf16>
              }
              %c2 = arith.constant 2 : index
              scf.for %arg4 = %c0_0 to %c2 step %c1_1 {
                %c1_5 = arith.constant 1 : index
                %c0_6 = arith.constant 0 : index
                %16 = arith.muli %c1_5, %arg4 : index
                %17 = arith.addi %c0_6, %16 : index
                %18 = arith.muli %c1_5, %c2 : index
                %19 = scf.index_switch %17 -> memref<32x64xbf16> 
                case 0 {
                  scf.yield %10 : memref<32x64xbf16>
                }
                case 1 {
                  scf.yield %11 : memref<32x64xbf16>
                }
                default {
                  scf.yield %10 : memref<32x64xbf16>
                }
                %20 = aie.objectfifo.acquire @of_7_broadcast_0_0(Consume, 1) : !aie.objectfifosubview<memref<64x32xbf16>>
                %21 = aie.objectfifo.subview.access %20[0] : !aie.objectfifosubview<memref<64x32xbf16>> -> memref<64x32xbf16>
                func.call @op0_matmul_bf16_bf16_32_64_32(%19, %21, %15) : (memref<32x64xbf16>, memref<64x32xbf16>, memref<32x32xbf16>) -> ()
                aie.objectfifo.release @of_7_broadcast_0_0(Consume, 1)
              }
            }
            aie.objectfifo.release @of_11_broadcast_1(Consume, 2)
          }
          aie.objectfifo.release @of_12_join_0_1(Produce, 8)
        }
      }
      aie.end
    } {link_with = "op0_mm_32_64_32.o"}
    %core_6_4 = aie.core(%tile_6_4) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c16 = arith.constant 16 : index
        scf.for %arg1 = %c0_0 to %c16 step %c1_1 {
          %0 = aie.objectfifo.acquire @of_12_join_0_2(Produce, 8) : !aie.objectfifosubview<memref<32x32xbf16>>
          %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<32x32xbf16>> -> memref<32x32xbf16>
          func.call @op0_zero_bf16_32_64_32(%1) : (memref<32x32xbf16>) -> ()
          %2 = aie.objectfifo.subview.access %0[1] : !aie.objectfifosubview<memref<32x32xbf16>> -> memref<32x32xbf16>
          func.call @op0_zero_bf16_32_64_32(%2) : (memref<32x32xbf16>) -> ()
          %3 = aie.objectfifo.subview.access %0[2] : !aie.objectfifosubview<memref<32x32xbf16>> -> memref<32x32xbf16>
          func.call @op0_zero_bf16_32_64_32(%3) : (memref<32x32xbf16>) -> ()
          %4 = aie.objectfifo.subview.access %0[3] : !aie.objectfifosubview<memref<32x32xbf16>> -> memref<32x32xbf16>
          func.call @op0_zero_bf16_32_64_32(%4) : (memref<32x32xbf16>) -> ()
          %5 = aie.objectfifo.subview.access %0[4] : !aie.objectfifosubview<memref<32x32xbf16>> -> memref<32x32xbf16>
          func.call @op0_zero_bf16_32_64_32(%5) : (memref<32x32xbf16>) -> ()
          %6 = aie.objectfifo.subview.access %0[5] : !aie.objectfifosubview<memref<32x32xbf16>> -> memref<32x32xbf16>
          func.call @op0_zero_bf16_32_64_32(%6) : (memref<32x32xbf16>) -> ()
          %7 = aie.objectfifo.subview.access %0[6] : !aie.objectfifosubview<memref<32x32xbf16>> -> memref<32x32xbf16>
          func.call @op0_zero_bf16_32_64_32(%7) : (memref<32x32xbf16>) -> ()
          %8 = aie.objectfifo.subview.access %0[7] : !aie.objectfifosubview<memref<32x32xbf16>> -> memref<32x32xbf16>
          func.call @op0_zero_bf16_32_64_32(%8) : (memref<32x32xbf16>) -> ()
          %c16_2 = arith.constant 16 : index
          scf.for %arg2 = %c0_0 to %c16_2 step %c1_1 {
            %9 = aie.objectfifo.acquire @of_11_broadcast_2(Consume, 2) : !aie.objectfifosubview<memref<32x64xbf16>>
            %10 = aie.objectfifo.subview.access %9[0] : !aie.objectfifosubview<memref<32x64xbf16>> -> memref<32x64xbf16>
            %11 = aie.objectfifo.subview.access %9[1] : !aie.objectfifosubview<memref<32x64xbf16>> -> memref<32x64xbf16>
            %c8 = arith.constant 8 : index
            scf.for %arg3 = %c0_0 to %c8 step %c1_1 {
              %c1_3 = arith.constant 1 : index
              %c0_4 = arith.constant 0 : index
              %12 = arith.muli %c1_3, %arg3 : index
              %13 = arith.addi %c0_4, %12 : index
              %14 = arith.muli %c1_3, %c8 : index
              %15 = scf.index_switch %13 -> memref<32x32xbf16> 
              case 0 {
                scf.yield %1 : memref<32x32xbf16>
              }
              case 1 {
                scf.yield %2 : memref<32x32xbf16>
              }
              case 2 {
                scf.yield %3 : memref<32x32xbf16>
              }
              case 3 {
                scf.yield %4 : memref<32x32xbf16>
              }
              case 4 {
                scf.yield %5 : memref<32x32xbf16>
              }
              case 5 {
                scf.yield %6 : memref<32x32xbf16>
              }
              case 6 {
                scf.yield %7 : memref<32x32xbf16>
              }
              case 7 {
                scf.yield %8 : memref<32x32xbf16>
              }
              default {
                scf.yield %1 : memref<32x32xbf16>
              }
              %c2 = arith.constant 2 : index
              scf.for %arg4 = %c0_0 to %c2 step %c1_1 {
                %c1_5 = arith.constant 1 : index
                %c0_6 = arith.constant 0 : index
                %16 = arith.muli %c1_5, %arg4 : index
                %17 = arith.addi %c0_6, %16 : index
                %18 = arith.muli %c1_5, %c2 : index
                %19 = scf.index_switch %17 -> memref<32x64xbf16> 
                case 0 {
                  scf.yield %10 : memref<32x64xbf16>
                }
                case 1 {
                  scf.yield %11 : memref<32x64xbf16>
                }
                default {
                  scf.yield %10 : memref<32x64xbf16>
                }
                %20 = aie.objectfifo.acquire @of_7_broadcast_0_0(Consume, 1) : !aie.objectfifosubview<memref<64x32xbf16>>
                %21 = aie.objectfifo.subview.access %20[0] : !aie.objectfifosubview<memref<64x32xbf16>> -> memref<64x32xbf16>
                func.call @op0_matmul_bf16_bf16_32_64_32(%19, %21, %15) : (memref<32x64xbf16>, memref<64x32xbf16>, memref<32x32xbf16>) -> ()
                aie.objectfifo.release @of_7_broadcast_0_0(Consume, 1)
              }
            }
            aie.objectfifo.release @of_11_broadcast_2(Consume, 2)
          }
          aie.objectfifo.release @of_12_join_0_2(Produce, 8)
        }
      }
      aie.end
    } {link_with = "op0_mm_32_64_32.o"}
    %core_6_5 = aie.core(%tile_6_5) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c16 = arith.constant 16 : index
        scf.for %arg1 = %c0_0 to %c16 step %c1_1 {
          %0 = aie.objectfifo.acquire @of_12_join_0_3(Produce, 8) : !aie.objectfifosubview<memref<32x32xbf16>>
          %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<32x32xbf16>> -> memref<32x32xbf16>
          func.call @op0_zero_bf16_32_64_32(%1) : (memref<32x32xbf16>) -> ()
          %2 = aie.objectfifo.subview.access %0[1] : !aie.objectfifosubview<memref<32x32xbf16>> -> memref<32x32xbf16>
          func.call @op0_zero_bf16_32_64_32(%2) : (memref<32x32xbf16>) -> ()
          %3 = aie.objectfifo.subview.access %0[2] : !aie.objectfifosubview<memref<32x32xbf16>> -> memref<32x32xbf16>
          func.call @op0_zero_bf16_32_64_32(%3) : (memref<32x32xbf16>) -> ()
          %4 = aie.objectfifo.subview.access %0[3] : !aie.objectfifosubview<memref<32x32xbf16>> -> memref<32x32xbf16>
          func.call @op0_zero_bf16_32_64_32(%4) : (memref<32x32xbf16>) -> ()
          %5 = aie.objectfifo.subview.access %0[4] : !aie.objectfifosubview<memref<32x32xbf16>> -> memref<32x32xbf16>
          func.call @op0_zero_bf16_32_64_32(%5) : (memref<32x32xbf16>) -> ()
          %6 = aie.objectfifo.subview.access %0[5] : !aie.objectfifosubview<memref<32x32xbf16>> -> memref<32x32xbf16>
          func.call @op0_zero_bf16_32_64_32(%6) : (memref<32x32xbf16>) -> ()
          %7 = aie.objectfifo.subview.access %0[6] : !aie.objectfifosubview<memref<32x32xbf16>> -> memref<32x32xbf16>
          func.call @op0_zero_bf16_32_64_32(%7) : (memref<32x32xbf16>) -> ()
          %8 = aie.objectfifo.subview.access %0[7] : !aie.objectfifosubview<memref<32x32xbf16>> -> memref<32x32xbf16>
          func.call @op0_zero_bf16_32_64_32(%8) : (memref<32x32xbf16>) -> ()
          %c16_2 = arith.constant 16 : index
          scf.for %arg2 = %c0_0 to %c16_2 step %c1_1 {
            %9 = aie.objectfifo.acquire @of_11_broadcast_3(Consume, 2) : !aie.objectfifosubview<memref<32x64xbf16>>
            %10 = aie.objectfifo.subview.access %9[0] : !aie.objectfifosubview<memref<32x64xbf16>> -> memref<32x64xbf16>
            %11 = aie.objectfifo.subview.access %9[1] : !aie.objectfifosubview<memref<32x64xbf16>> -> memref<32x64xbf16>
            %c8 = arith.constant 8 : index
            scf.for %arg3 = %c0_0 to %c8 step %c1_1 {
              %c1_3 = arith.constant 1 : index
              %c0_4 = arith.constant 0 : index
              %12 = arith.muli %c1_3, %arg3 : index
              %13 = arith.addi %c0_4, %12 : index
              %14 = arith.muli %c1_3, %c8 : index
              %15 = scf.index_switch %13 -> memref<32x32xbf16> 
              case 0 {
                scf.yield %1 : memref<32x32xbf16>
              }
              case 1 {
                scf.yield %2 : memref<32x32xbf16>
              }
              case 2 {
                scf.yield %3 : memref<32x32xbf16>
              }
              case 3 {
                scf.yield %4 : memref<32x32xbf16>
              }
              case 4 {
                scf.yield %5 : memref<32x32xbf16>
              }
              case 5 {
                scf.yield %6 : memref<32x32xbf16>
              }
              case 6 {
                scf.yield %7 : memref<32x32xbf16>
              }
              case 7 {
                scf.yield %8 : memref<32x32xbf16>
              }
              default {
                scf.yield %1 : memref<32x32xbf16>
              }
              %c2 = arith.constant 2 : index
              scf.for %arg4 = %c0_0 to %c2 step %c1_1 {
                %c1_5 = arith.constant 1 : index
                %c0_6 = arith.constant 0 : index
                %16 = arith.muli %c1_5, %arg4 : index
                %17 = arith.addi %c0_6, %16 : index
                %18 = arith.muli %c1_5, %c2 : index
                %19 = scf.index_switch %17 -> memref<32x64xbf16> 
                case 0 {
                  scf.yield %10 : memref<32x64xbf16>
                }
                case 1 {
                  scf.yield %11 : memref<32x64xbf16>
                }
                default {
                  scf.yield %10 : memref<32x64xbf16>
                }
                %20 = aie.objectfifo.acquire @of_7_broadcast_0_0(Consume, 1) : !aie.objectfifosubview<memref<64x32xbf16>>
                %21 = aie.objectfifo.subview.access %20[0] : !aie.objectfifosubview<memref<64x32xbf16>> -> memref<64x32xbf16>
                func.call @op0_matmul_bf16_bf16_32_64_32(%19, %21, %15) : (memref<32x64xbf16>, memref<64x32xbf16>, memref<32x32xbf16>) -> ()
                aie.objectfifo.release @of_7_broadcast_0_0(Consume, 1)
              }
            }
            aie.objectfifo.release @of_11_broadcast_3(Consume, 2)
          }
          aie.objectfifo.release @of_12_join_0_3(Produce, 8)
        }
      }
      aie.end
    } {link_with = "op0_mm_32_64_32.o"}
    %core_7_2 = aie.core(%tile_7_2) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c16 = arith.constant 16 : index
        scf.for %arg1 = %c0_0 to %c16 step %c1_1 {
          %0 = aie.objectfifo.acquire @of_12_join_1_0(Produce, 8) : !aie.objectfifosubview<memref<32x32xbf16>>
          %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<32x32xbf16>> -> memref<32x32xbf16>
          func.call @op0_zero_bf16_32_64_32(%1) : (memref<32x32xbf16>) -> ()
          %2 = aie.objectfifo.subview.access %0[1] : !aie.objectfifosubview<memref<32x32xbf16>> -> memref<32x32xbf16>
          func.call @op0_zero_bf16_32_64_32(%2) : (memref<32x32xbf16>) -> ()
          %3 = aie.objectfifo.subview.access %0[2] : !aie.objectfifosubview<memref<32x32xbf16>> -> memref<32x32xbf16>
          func.call @op0_zero_bf16_32_64_32(%3) : (memref<32x32xbf16>) -> ()
          %4 = aie.objectfifo.subview.access %0[3] : !aie.objectfifosubview<memref<32x32xbf16>> -> memref<32x32xbf16>
          func.call @op0_zero_bf16_32_64_32(%4) : (memref<32x32xbf16>) -> ()
          %5 = aie.objectfifo.subview.access %0[4] : !aie.objectfifosubview<memref<32x32xbf16>> -> memref<32x32xbf16>
          func.call @op0_zero_bf16_32_64_32(%5) : (memref<32x32xbf16>) -> ()
          %6 = aie.objectfifo.subview.access %0[5] : !aie.objectfifosubview<memref<32x32xbf16>> -> memref<32x32xbf16>
          func.call @op0_zero_bf16_32_64_32(%6) : (memref<32x32xbf16>) -> ()
          %7 = aie.objectfifo.subview.access %0[6] : !aie.objectfifosubview<memref<32x32xbf16>> -> memref<32x32xbf16>
          func.call @op0_zero_bf16_32_64_32(%7) : (memref<32x32xbf16>) -> ()
          %8 = aie.objectfifo.subview.access %0[7] : !aie.objectfifosubview<memref<32x32xbf16>> -> memref<32x32xbf16>
          func.call @op0_zero_bf16_32_64_32(%8) : (memref<32x32xbf16>) -> ()
          %c16_2 = arith.constant 16 : index
          scf.for %arg2 = %c0_0 to %c16_2 step %c1_1 {
            %9 = aie.objectfifo.acquire @of_11_broadcast_0(Consume, 2) : !aie.objectfifosubview<memref<32x64xbf16>>
            %10 = aie.objectfifo.subview.access %9[0] : !aie.objectfifosubview<memref<32x64xbf16>> -> memref<32x64xbf16>
            %11 = aie.objectfifo.subview.access %9[1] : !aie.objectfifosubview<memref<32x64xbf16>> -> memref<32x64xbf16>
            %c8 = arith.constant 8 : index
            scf.for %arg3 = %c0_0 to %c8 step %c1_1 {
              %c1_3 = arith.constant 1 : index
              %c0_4 = arith.constant 0 : index
              %12 = arith.muli %c1_3, %arg3 : index
              %13 = arith.addi %c0_4, %12 : index
              %14 = arith.muli %c1_3, %c8 : index
              %15 = scf.index_switch %13 -> memref<32x32xbf16> 
              case 0 {
                scf.yield %1 : memref<32x32xbf16>
              }
              case 1 {
                scf.yield %2 : memref<32x32xbf16>
              }
              case 2 {
                scf.yield %3 : memref<32x32xbf16>
              }
              case 3 {
                scf.yield %4 : memref<32x32xbf16>
              }
              case 4 {
                scf.yield %5 : memref<32x32xbf16>
              }
              case 5 {
                scf.yield %6 : memref<32x32xbf16>
              }
              case 6 {
                scf.yield %7 : memref<32x32xbf16>
              }
              case 7 {
                scf.yield %8 : memref<32x32xbf16>
              }
              default {
                scf.yield %1 : memref<32x32xbf16>
              }
              %c2 = arith.constant 2 : index
              scf.for %arg4 = %c0_0 to %c2 step %c1_1 {
                %c1_5 = arith.constant 1 : index
                %c0_6 = arith.constant 0 : index
                %16 = arith.muli %c1_5, %arg4 : index
                %17 = arith.addi %c0_6, %16 : index
                %18 = arith.muli %c1_5, %c2 : index
                %19 = scf.index_switch %17 -> memref<32x64xbf16> 
                case 0 {
                  scf.yield %10 : memref<32x64xbf16>
                }
                case 1 {
                  scf.yield %11 : memref<32x64xbf16>
                }
                default {
                  scf.yield %10 : memref<32x64xbf16>
                }
                %20 = aie.objectfifo.acquire @of_7_broadcast_1_0(Consume, 1) : !aie.objectfifosubview<memref<64x32xbf16>>
                %21 = aie.objectfifo.subview.access %20[0] : !aie.objectfifosubview<memref<64x32xbf16>> -> memref<64x32xbf16>
                func.call @op0_matmul_bf16_bf16_32_64_32(%19, %21, %15) : (memref<32x64xbf16>, memref<64x32xbf16>, memref<32x32xbf16>) -> ()
                aie.objectfifo.release @of_7_broadcast_1_0(Consume, 1)
              }
            }
            aie.objectfifo.release @of_11_broadcast_0(Consume, 2)
          }
          aie.objectfifo.release @of_12_join_1_0(Produce, 8)
        }
      }
      aie.end
    } {link_with = "op0_mm_32_64_32.o"}
    %core_7_3 = aie.core(%tile_7_3) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c16 = arith.constant 16 : index
        scf.for %arg1 = %c0_0 to %c16 step %c1_1 {
          %0 = aie.objectfifo.acquire @of_12_join_1_1(Produce, 8) : !aie.objectfifosubview<memref<32x32xbf16>>
          %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<32x32xbf16>> -> memref<32x32xbf16>
          func.call @op0_zero_bf16_32_64_32(%1) : (memref<32x32xbf16>) -> ()
          %2 = aie.objectfifo.subview.access %0[1] : !aie.objectfifosubview<memref<32x32xbf16>> -> memref<32x32xbf16>
          func.call @op0_zero_bf16_32_64_32(%2) : (memref<32x32xbf16>) -> ()
          %3 = aie.objectfifo.subview.access %0[2] : !aie.objectfifosubview<memref<32x32xbf16>> -> memref<32x32xbf16>
          func.call @op0_zero_bf16_32_64_32(%3) : (memref<32x32xbf16>) -> ()
          %4 = aie.objectfifo.subview.access %0[3] : !aie.objectfifosubview<memref<32x32xbf16>> -> memref<32x32xbf16>
          func.call @op0_zero_bf16_32_64_32(%4) : (memref<32x32xbf16>) -> ()
          %5 = aie.objectfifo.subview.access %0[4] : !aie.objectfifosubview<memref<32x32xbf16>> -> memref<32x32xbf16>
          func.call @op0_zero_bf16_32_64_32(%5) : (memref<32x32xbf16>) -> ()
          %6 = aie.objectfifo.subview.access %0[5] : !aie.objectfifosubview<memref<32x32xbf16>> -> memref<32x32xbf16>
          func.call @op0_zero_bf16_32_64_32(%6) : (memref<32x32xbf16>) -> ()
          %7 = aie.objectfifo.subview.access %0[6] : !aie.objectfifosubview<memref<32x32xbf16>> -> memref<32x32xbf16>
          func.call @op0_zero_bf16_32_64_32(%7) : (memref<32x32xbf16>) -> ()
          %8 = aie.objectfifo.subview.access %0[7] : !aie.objectfifosubview<memref<32x32xbf16>> -> memref<32x32xbf16>
          func.call @op0_zero_bf16_32_64_32(%8) : (memref<32x32xbf16>) -> ()
          %c16_2 = arith.constant 16 : index
          scf.for %arg2 = %c0_0 to %c16_2 step %c1_1 {
            %9 = aie.objectfifo.acquire @of_11_broadcast_1(Consume, 2) : !aie.objectfifosubview<memref<32x64xbf16>>
            %10 = aie.objectfifo.subview.access %9[0] : !aie.objectfifosubview<memref<32x64xbf16>> -> memref<32x64xbf16>
            %11 = aie.objectfifo.subview.access %9[1] : !aie.objectfifosubview<memref<32x64xbf16>> -> memref<32x64xbf16>
            %c8 = arith.constant 8 : index
            scf.for %arg3 = %c0_0 to %c8 step %c1_1 {
              %c1_3 = arith.constant 1 : index
              %c0_4 = arith.constant 0 : index
              %12 = arith.muli %c1_3, %arg3 : index
              %13 = arith.addi %c0_4, %12 : index
              %14 = arith.muli %c1_3, %c8 : index
              %15 = scf.index_switch %13 -> memref<32x32xbf16> 
              case 0 {
                scf.yield %1 : memref<32x32xbf16>
              }
              case 1 {
                scf.yield %2 : memref<32x32xbf16>
              }
              case 2 {
                scf.yield %3 : memref<32x32xbf16>
              }
              case 3 {
                scf.yield %4 : memref<32x32xbf16>
              }
              case 4 {
                scf.yield %5 : memref<32x32xbf16>
              }
              case 5 {
                scf.yield %6 : memref<32x32xbf16>
              }
              case 6 {
                scf.yield %7 : memref<32x32xbf16>
              }
              case 7 {
                scf.yield %8 : memref<32x32xbf16>
              }
              default {
                scf.yield %1 : memref<32x32xbf16>
              }
              %c2 = arith.constant 2 : index
              scf.for %arg4 = %c0_0 to %c2 step %c1_1 {
                %c1_5 = arith.constant 1 : index
                %c0_6 = arith.constant 0 : index
                %16 = arith.muli %c1_5, %arg4 : index
                %17 = arith.addi %c0_6, %16 : index
                %18 = arith.muli %c1_5, %c2 : index
                %19 = scf.index_switch %17 -> memref<32x64xbf16> 
                case 0 {
                  scf.yield %10 : memref<32x64xbf16>
                }
                case 1 {
                  scf.yield %11 : memref<32x64xbf16>
                }
                default {
                  scf.yield %10 : memref<32x64xbf16>
                }
                %20 = aie.objectfifo.acquire @of_7_broadcast_1_0(Consume, 1) : !aie.objectfifosubview<memref<64x32xbf16>>
                %21 = aie.objectfifo.subview.access %20[0] : !aie.objectfifosubview<memref<64x32xbf16>> -> memref<64x32xbf16>
                func.call @op0_matmul_bf16_bf16_32_64_32(%19, %21, %15) : (memref<32x64xbf16>, memref<64x32xbf16>, memref<32x32xbf16>) -> ()
                aie.objectfifo.release @of_7_broadcast_1_0(Consume, 1)
              }
            }
            aie.objectfifo.release @of_11_broadcast_1(Consume, 2)
          }
          aie.objectfifo.release @of_12_join_1_1(Produce, 8)
        }
      }
      aie.end
    } {link_with = "op0_mm_32_64_32.o"}
    %core_7_4 = aie.core(%tile_7_4) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c16 = arith.constant 16 : index
        scf.for %arg1 = %c0_0 to %c16 step %c1_1 {
          %0 = aie.objectfifo.acquire @of_12_join_1_2(Produce, 8) : !aie.objectfifosubview<memref<32x32xbf16>>
          %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<32x32xbf16>> -> memref<32x32xbf16>
          func.call @op0_zero_bf16_32_64_32(%1) : (memref<32x32xbf16>) -> ()
          %2 = aie.objectfifo.subview.access %0[1] : !aie.objectfifosubview<memref<32x32xbf16>> -> memref<32x32xbf16>
          func.call @op0_zero_bf16_32_64_32(%2) : (memref<32x32xbf16>) -> ()
          %3 = aie.objectfifo.subview.access %0[2] : !aie.objectfifosubview<memref<32x32xbf16>> -> memref<32x32xbf16>
          func.call @op0_zero_bf16_32_64_32(%3) : (memref<32x32xbf16>) -> ()
          %4 = aie.objectfifo.subview.access %0[3] : !aie.objectfifosubview<memref<32x32xbf16>> -> memref<32x32xbf16>
          func.call @op0_zero_bf16_32_64_32(%4) : (memref<32x32xbf16>) -> ()
          %5 = aie.objectfifo.subview.access %0[4] : !aie.objectfifosubview<memref<32x32xbf16>> -> memref<32x32xbf16>
          func.call @op0_zero_bf16_32_64_32(%5) : (memref<32x32xbf16>) -> ()
          %6 = aie.objectfifo.subview.access %0[5] : !aie.objectfifosubview<memref<32x32xbf16>> -> memref<32x32xbf16>
          func.call @op0_zero_bf16_32_64_32(%6) : (memref<32x32xbf16>) -> ()
          %7 = aie.objectfifo.subview.access %0[6] : !aie.objectfifosubview<memref<32x32xbf16>> -> memref<32x32xbf16>
          func.call @op0_zero_bf16_32_64_32(%7) : (memref<32x32xbf16>) -> ()
          %8 = aie.objectfifo.subview.access %0[7] : !aie.objectfifosubview<memref<32x32xbf16>> -> memref<32x32xbf16>
          func.call @op0_zero_bf16_32_64_32(%8) : (memref<32x32xbf16>) -> ()
          %c16_2 = arith.constant 16 : index
          scf.for %arg2 = %c0_0 to %c16_2 step %c1_1 {
            %9 = aie.objectfifo.acquire @of_11_broadcast_2(Consume, 2) : !aie.objectfifosubview<memref<32x64xbf16>>
            %10 = aie.objectfifo.subview.access %9[0] : !aie.objectfifosubview<memref<32x64xbf16>> -> memref<32x64xbf16>
            %11 = aie.objectfifo.subview.access %9[1] : !aie.objectfifosubview<memref<32x64xbf16>> -> memref<32x64xbf16>
            %c8 = arith.constant 8 : index
            scf.for %arg3 = %c0_0 to %c8 step %c1_1 {
              %c1_3 = arith.constant 1 : index
              %c0_4 = arith.constant 0 : index
              %12 = arith.muli %c1_3, %arg3 : index
              %13 = arith.addi %c0_4, %12 : index
              %14 = arith.muli %c1_3, %c8 : index
              %15 = scf.index_switch %13 -> memref<32x32xbf16> 
              case 0 {
                scf.yield %1 : memref<32x32xbf16>
              }
              case 1 {
                scf.yield %2 : memref<32x32xbf16>
              }
              case 2 {
                scf.yield %3 : memref<32x32xbf16>
              }
              case 3 {
                scf.yield %4 : memref<32x32xbf16>
              }
              case 4 {
                scf.yield %5 : memref<32x32xbf16>
              }
              case 5 {
                scf.yield %6 : memref<32x32xbf16>
              }
              case 6 {
                scf.yield %7 : memref<32x32xbf16>
              }
              case 7 {
                scf.yield %8 : memref<32x32xbf16>
              }
              default {
                scf.yield %1 : memref<32x32xbf16>
              }
              %c2 = arith.constant 2 : index
              scf.for %arg4 = %c0_0 to %c2 step %c1_1 {
                %c1_5 = arith.constant 1 : index
                %c0_6 = arith.constant 0 : index
                %16 = arith.muli %c1_5, %arg4 : index
                %17 = arith.addi %c0_6, %16 : index
                %18 = arith.muli %c1_5, %c2 : index
                %19 = scf.index_switch %17 -> memref<32x64xbf16> 
                case 0 {
                  scf.yield %10 : memref<32x64xbf16>
                }
                case 1 {
                  scf.yield %11 : memref<32x64xbf16>
                }
                default {
                  scf.yield %10 : memref<32x64xbf16>
                }
                %20 = aie.objectfifo.acquire @of_7_broadcast_1_0(Consume, 1) : !aie.objectfifosubview<memref<64x32xbf16>>
                %21 = aie.objectfifo.subview.access %20[0] : !aie.objectfifosubview<memref<64x32xbf16>> -> memref<64x32xbf16>
                func.call @op0_matmul_bf16_bf16_32_64_32(%19, %21, %15) : (memref<32x64xbf16>, memref<64x32xbf16>, memref<32x32xbf16>) -> ()
                aie.objectfifo.release @of_7_broadcast_1_0(Consume, 1)
              }
            }
            aie.objectfifo.release @of_11_broadcast_2(Consume, 2)
          }
          aie.objectfifo.release @of_12_join_1_2(Produce, 8)
        }
      }
      aie.end
    } {link_with = "op0_mm_32_64_32.o"}
    %core_7_5 = aie.core(%tile_7_5) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c16 = arith.constant 16 : index
        scf.for %arg1 = %c0_0 to %c16 step %c1_1 {
          %0 = aie.objectfifo.acquire @of_12_join_1_3(Produce, 8) : !aie.objectfifosubview<memref<32x32xbf16>>
          %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<32x32xbf16>> -> memref<32x32xbf16>
          func.call @op0_zero_bf16_32_64_32(%1) : (memref<32x32xbf16>) -> ()
          %2 = aie.objectfifo.subview.access %0[1] : !aie.objectfifosubview<memref<32x32xbf16>> -> memref<32x32xbf16>
          func.call @op0_zero_bf16_32_64_32(%2) : (memref<32x32xbf16>) -> ()
          %3 = aie.objectfifo.subview.access %0[2] : !aie.objectfifosubview<memref<32x32xbf16>> -> memref<32x32xbf16>
          func.call @op0_zero_bf16_32_64_32(%3) : (memref<32x32xbf16>) -> ()
          %4 = aie.objectfifo.subview.access %0[3] : !aie.objectfifosubview<memref<32x32xbf16>> -> memref<32x32xbf16>
          func.call @op0_zero_bf16_32_64_32(%4) : (memref<32x32xbf16>) -> ()
          %5 = aie.objectfifo.subview.access %0[4] : !aie.objectfifosubview<memref<32x32xbf16>> -> memref<32x32xbf16>
          func.call @op0_zero_bf16_32_64_32(%5) : (memref<32x32xbf16>) -> ()
          %6 = aie.objectfifo.subview.access %0[5] : !aie.objectfifosubview<memref<32x32xbf16>> -> memref<32x32xbf16>
          func.call @op0_zero_bf16_32_64_32(%6) : (memref<32x32xbf16>) -> ()
          %7 = aie.objectfifo.subview.access %0[6] : !aie.objectfifosubview<memref<32x32xbf16>> -> memref<32x32xbf16>
          func.call @op0_zero_bf16_32_64_32(%7) : (memref<32x32xbf16>) -> ()
          %8 = aie.objectfifo.subview.access %0[7] : !aie.objectfifosubview<memref<32x32xbf16>> -> memref<32x32xbf16>
          func.call @op0_zero_bf16_32_64_32(%8) : (memref<32x32xbf16>) -> ()
          %c16_2 = arith.constant 16 : index
          scf.for %arg2 = %c0_0 to %c16_2 step %c1_1 {
            %9 = aie.objectfifo.acquire @of_11_broadcast_3(Consume, 2) : !aie.objectfifosubview<memref<32x64xbf16>>
            %10 = aie.objectfifo.subview.access %9[0] : !aie.objectfifosubview<memref<32x64xbf16>> -> memref<32x64xbf16>
            %11 = aie.objectfifo.subview.access %9[1] : !aie.objectfifosubview<memref<32x64xbf16>> -> memref<32x64xbf16>
            %c8 = arith.constant 8 : index
            scf.for %arg3 = %c0_0 to %c8 step %c1_1 {
              %c1_3 = arith.constant 1 : index
              %c0_4 = arith.constant 0 : index
              %12 = arith.muli %c1_3, %arg3 : index
              %13 = arith.addi %c0_4, %12 : index
              %14 = arith.muli %c1_3, %c8 : index
              %15 = scf.index_switch %13 -> memref<32x32xbf16> 
              case 0 {
                scf.yield %1 : memref<32x32xbf16>
              }
              case 1 {
                scf.yield %2 : memref<32x32xbf16>
              }
              case 2 {
                scf.yield %3 : memref<32x32xbf16>
              }
              case 3 {
                scf.yield %4 : memref<32x32xbf16>
              }
              case 4 {
                scf.yield %5 : memref<32x32xbf16>
              }
              case 5 {
                scf.yield %6 : memref<32x32xbf16>
              }
              case 6 {
                scf.yield %7 : memref<32x32xbf16>
              }
              case 7 {
                scf.yield %8 : memref<32x32xbf16>
              }
              default {
                scf.yield %1 : memref<32x32xbf16>
              }
              %c2 = arith.constant 2 : index
              scf.for %arg4 = %c0_0 to %c2 step %c1_1 {
                %c1_5 = arith.constant 1 : index
                %c0_6 = arith.constant 0 : index
                %16 = arith.muli %c1_5, %arg4 : index
                %17 = arith.addi %c0_6, %16 : index
                %18 = arith.muli %c1_5, %c2 : index
                %19 = scf.index_switch %17 -> memref<32x64xbf16> 
                case 0 {
                  scf.yield %10 : memref<32x64xbf16>
                }
                case 1 {
                  scf.yield %11 : memref<32x64xbf16>
                }
                default {
                  scf.yield %10 : memref<32x64xbf16>
                }
                %20 = aie.objectfifo.acquire @of_7_broadcast_1_0(Consume, 1) : !aie.objectfifosubview<memref<64x32xbf16>>
                %21 = aie.objectfifo.subview.access %20[0] : !aie.objectfifosubview<memref<64x32xbf16>> -> memref<64x32xbf16>
                func.call @op0_matmul_bf16_bf16_32_64_32(%19, %21, %15) : (memref<32x64xbf16>, memref<64x32xbf16>, memref<32x32xbf16>) -> ()
                aie.objectfifo.release @of_7_broadcast_1_0(Consume, 1)
              }
            }
            aie.objectfifo.release @of_11_broadcast_3(Consume, 2)
          }
          aie.objectfifo.release @of_12_join_1_3(Produce, 8)
        }
      }
      aie.end
    } {link_with = "op0_mm_32_64_32.o"}
    aie.objectfifo @of_0_mem_0(%shim_noc_tile_0_0, {%mem_tile_0_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<4x32x32xbf16>>  
    aie.objectfifo @of_0_mem_1(%shim_noc_tile_1_0, {%mem_tile_1_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<4x32x32xbf16>>  
    aie.objectfifo @of_1_mem_0(%shim_noc_tile_2_0, {%mem_tile_2_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<32x64xbf16>>  
    aie.objectfifo @of_1_mem_1(%shim_noc_tile_4_0, {%mem_tile_4_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<32x64xbf16>>  
    aie.objectfifo @of_2_mem_0(%shim_noc_tile_5_0, {%mem_tile_5_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<32x64xbf16>>  
    aie.objectfifo @of_2_mem_1(%shim_noc_tile_6_0, {%mem_tile_6_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<32x64xbf16>>  
    aie.objectfifo @of_3_mem_0(%shim_noc_tile_3_0, {%mem_tile_3_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x32xbf16>>  
    aie.objectfifo @of_3_mem_1(%shim_noc_tile_7_0, {%mem_tile_7_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x32xbf16>>  
    aie.objectfifo @of_4_distribute_0_0(%mem_tile_0_1 dimensionsToStream [<size = 4, stride = 256>, <size = 4, stride = 8>, <size = 8, stride = 32>, <size = 8, stride = 1>], {%tile_2_2, %tile_0_2}, [2 : i32, 2 : i32, 2 : i32]) : !aie.objectfifo<memref<32x32xbf16>>  
    aie.objectfifo @of_4_distribute_0_1(%mem_tile_0_1 dimensionsToStream [<size = 4, stride = 256>, <size = 4, stride = 8>, <size = 8, stride = 32>, <size = 8, stride = 1>], {%tile_0_3, %tile_2_3}, [2 : i32, 2 : i32, 2 : i32]) : !aie.objectfifo<memref<32x32xbf16>>  
    aie.objectfifo @of_4_distribute_0_2(%mem_tile_0_1 dimensionsToStream [<size = 4, stride = 256>, <size = 4, stride = 8>, <size = 8, stride = 32>, <size = 8, stride = 1>], {%tile_0_4, %tile_2_4}, [2 : i32, 2 : i32, 2 : i32]) : !aie.objectfifo<memref<32x32xbf16>>  
    aie.objectfifo @of_4_distribute_0_3(%mem_tile_0_1 dimensionsToStream [<size = 4, stride = 256>, <size = 4, stride = 8>, <size = 8, stride = 32>, <size = 8, stride = 1>], {%tile_2_5, %tile_0_5}, [2 : i32, 2 : i32, 2 : i32]) : !aie.objectfifo<memref<32x32xbf16>>  
    aie.objectfifo.link [@of_0_mem_0] -> [@of_4_distribute_0_0, @of_4_distribute_0_1, @of_4_distribute_0_2, @of_4_distribute_0_3]([] [0, 1024, 2048, 3072])
    aie.objectfifo @of_4_distribute_1_0(%mem_tile_1_1 dimensionsToStream [<size = 4, stride = 256>, <size = 4, stride = 8>, <size = 8, stride = 32>, <size = 8, stride = 1>], {%tile_3_2, %tile_1_2}, [2 : i32, 2 : i32, 2 : i32]) : !aie.objectfifo<memref<32x32xbf16>>  
    aie.objectfifo @of_4_distribute_1_1(%mem_tile_1_1 dimensionsToStream [<size = 4, stride = 256>, <size = 4, stride = 8>, <size = 8, stride = 32>, <size = 8, stride = 1>], {%tile_3_3, %tile_1_3}, [2 : i32, 2 : i32, 2 : i32]) : !aie.objectfifo<memref<32x32xbf16>>  
    aie.objectfifo @of_4_distribute_1_2(%mem_tile_1_1 dimensionsToStream [<size = 4, stride = 256>, <size = 4, stride = 8>, <size = 8, stride = 32>, <size = 8, stride = 1>], {%tile_1_4, %tile_3_4}, [2 : i32, 2 : i32, 2 : i32]) : !aie.objectfifo<memref<32x32xbf16>>  
    aie.objectfifo @of_4_distribute_1_3(%mem_tile_1_1 dimensionsToStream [<size = 4, stride = 256>, <size = 4, stride = 8>, <size = 8, stride = 32>, <size = 8, stride = 1>], {%tile_1_5, %tile_3_5}, [2 : i32, 2 : i32, 2 : i32]) : !aie.objectfifo<memref<32x32xbf16>>  
    aie.objectfifo.link [@of_0_mem_1] -> [@of_4_distribute_1_0, @of_4_distribute_1_1, @of_4_distribute_1_2, @of_4_distribute_1_3]([] [0, 1024, 2048, 3072])
    aie.objectfifo @of_5_broadcast_0_0(%mem_tile_2_1 dimensionsToStream [<size = 4, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%tile_0_2, %tile_0_3, %tile_0_4, %tile_0_5}, [2 : i32, 2 : i32, 2 : i32, 2 : i32, 2 : i32]) : !aie.objectfifo<memref<32x64xbf16>>  
    aie.objectfifo.link [@of_1_mem_0] -> [@of_5_broadcast_0_0]([] [])
    aie.objectfifo @of_5_broadcast_1_0(%mem_tile_4_1 dimensionsToStream [<size = 4, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%tile_1_2, %tile_1_3, %tile_1_4, %tile_1_5}, [2 : i32, 2 : i32, 2 : i32, 2 : i32, 2 : i32]) : !aie.objectfifo<memref<32x64xbf16>>  
    aie.objectfifo.link [@of_1_mem_1] -> [@of_5_broadcast_1_0]([] [])
    aie.objectfifo @of_6_broadcast_0_0(%mem_tile_5_1 dimensionsToStream [<size = 4, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%tile_2_2, %tile_2_3, %tile_2_4, %tile_2_5}, [2 : i32, 2 : i32, 2 : i32, 2 : i32, 2 : i32]) : !aie.objectfifo<memref<32x64xbf16>>  
    aie.objectfifo.link [@of_2_mem_0] -> [@of_6_broadcast_0_0]([] [])
    aie.objectfifo @of_6_broadcast_1_0(%mem_tile_6_1 dimensionsToStream [<size = 4, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%tile_3_2, %tile_3_3, %tile_3_4, %tile_3_5}, [2 : i32, 2 : i32, 2 : i32, 2 : i32, 2 : i32]) : !aie.objectfifo<memref<32x64xbf16>>  
    aie.objectfifo.link [@of_2_mem_1] -> [@of_6_broadcast_1_0]([] [])
    aie.objectfifo @of_7_broadcast_0_0(%mem_tile_3_1 dimensionsToStream [<size = 8, stride = 256>, <size = 4, stride = 8>, <size = 8, stride = 32>, <size = 8, stride = 1>], {%tile_6_2, %tile_6_3, %tile_6_4, %tile_6_5}, [2 : i32, 2 : i32, 2 : i32, 2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x32xbf16>>  
    aie.objectfifo.link [@of_3_mem_0] -> [@of_7_broadcast_0_0]([] [])
    aie.objectfifo @of_7_broadcast_1_0(%mem_tile_7_1 dimensionsToStream [<size = 8, stride = 256>, <size = 4, stride = 8>, <size = 8, stride = 32>, <size = 8, stride = 1>], {%tile_7_2, %tile_7_3, %tile_7_4, %tile_7_5}, [2 : i32, 2 : i32, 2 : i32, 2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x32xbf16>>  
    aie.objectfifo.link [@of_3_mem_1] -> [@of_7_broadcast_1_0]([] [])
    aie.objectfifo @of_8_switch_join_0_0(%tile_0_2, {%tile_4_2}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<32x64xbf16>>  
    aie.objectfifo @of_8_switch_join_0_1(%tile_1_2, {%tile_4_2}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<32x64xbf16>>  
    aie.objectfifo @of_8_switch_join_1_0(%tile_0_3, {%tile_4_3}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<32x64xbf16>>  
    aie.objectfifo @of_8_switch_join_1_1(%tile_1_3, {%tile_4_3}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<32x64xbf16>>  
    aie.objectfifo @of_8_switch_join_2_0(%tile_0_4, {%tile_4_4}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<32x64xbf16>>  
    aie.objectfifo @of_8_switch_join_2_1(%tile_1_4, {%tile_4_4}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<32x64xbf16>>  
    aie.objectfifo @of_8_switch_join_3_0(%tile_0_5, {%tile_4_5}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<32x64xbf16>>  
    aie.objectfifo @of_8_switch_join_3_1(%tile_1_5, {%tile_4_5}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<32x64xbf16>>  
    aie.objectfifo @of_9_switch_join_0_0(%tile_2_2, {%tile_5_2}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<32x64xbf16>>  
    aie.objectfifo @of_9_switch_join_0_1(%tile_3_2, {%tile_5_2}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<32x64xbf16>>  
    aie.objectfifo @of_9_switch_join_1_0(%tile_2_3, {%tile_5_3}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<32x64xbf16>>  
    aie.objectfifo @of_9_switch_join_1_1(%tile_3_3, {%tile_5_3}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<32x64xbf16>>  
    aie.objectfifo @of_9_switch_join_2_0(%tile_2_4, {%tile_5_4}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<32x64xbf16>>  
    aie.objectfifo @of_9_switch_join_2_1(%tile_3_4, {%tile_5_4}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<32x64xbf16>>  
    aie.objectfifo @of_9_switch_join_3_0(%tile_2_5, {%tile_5_5}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<32x64xbf16>>  
    aie.objectfifo @of_9_switch_join_3_1(%tile_3_5, {%tile_5_5}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<32x64xbf16>>  
    aie.objectfifo @of_10_unicast_0(%tile_4_2, {%tile_5_2}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<32x64xbf16>>  
    aie.objectfifo @of_10_unicast_1(%tile_4_3, {%tile_5_3}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<32x64xbf16>>  
    aie.objectfifo @of_10_unicast_2(%tile_4_4, {%tile_5_4}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<32x64xbf16>>  
    aie.objectfifo @of_10_unicast_3(%tile_4_5, {%tile_5_5}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<32x64xbf16>>  
    aie.objectfifo @of_11_broadcast_0(%tile_5_2, {%tile_6_2, %tile_7_2}, [2 : i32, 2 : i32, 2 : i32]) : !aie.objectfifo<memref<32x64xbf16>>  
    aie.objectfifo @of_11_broadcast_1(%tile_5_3, {%tile_7_3, %tile_6_3}, [2 : i32, 2 : i32, 2 : i32]) : !aie.objectfifo<memref<32x64xbf16>>  
    aie.objectfifo @of_11_broadcast_2(%tile_5_4, {%tile_7_4, %tile_6_4}, [2 : i32, 2 : i32, 2 : i32]) : !aie.objectfifo<memref<32x64xbf16>>  
    aie.objectfifo @of_11_broadcast_3(%tile_5_5, {%tile_7_5, %tile_6_5}, [2 : i32, 2 : i32, 2 : i32]) : !aie.objectfifo<memref<32x64xbf16>>  
    aie.objectfifo @of_12_join_0_0(%tile_6_2, {%mem_tile_1_1}, [8 : i32, 2 : i32]) : !aie.objectfifo<memref<32x32xbf16>>  
    aie.objectfifo @of_12_join_0_1(%tile_6_3, {%mem_tile_1_1}, [8 : i32, 2 : i32]) : !aie.objectfifo<memref<32x32xbf16>>  
    aie.objectfifo @of_12_join_0_2(%tile_6_4, {%mem_tile_1_1}, [8 : i32, 2 : i32]) : !aie.objectfifo<memref<32x32xbf16>>  
    aie.objectfifo @of_12_join_0_3(%tile_6_5, {%mem_tile_1_1}, [8 : i32, 2 : i32]) : !aie.objectfifo<memref<32x32xbf16>>  
    aie.objectfifo @of_12_join_1_0(%tile_7_2, {%mem_tile_7_1}, [8 : i32, 2 : i32]) : !aie.objectfifo<memref<32x32xbf16>>  
    aie.objectfifo @of_12_join_1_1(%tile_7_3, {%mem_tile_7_1}, [8 : i32, 2 : i32]) : !aie.objectfifo<memref<32x32xbf16>>  
    aie.objectfifo @of_12_join_1_2(%tile_7_4, {%mem_tile_7_1}, [8 : i32, 2 : i32]) : !aie.objectfifo<memref<32x32xbf16>>  
    aie.objectfifo @of_12_join_1_3(%tile_7_5, {%mem_tile_7_1}, [8 : i32, 2 : i32]) : !aie.objectfifo<memref<32x32xbf16>>  
    aie.objectfifo @of_13_mem_0(%mem_tile_1_1 dimensionsToStream [<size = 4, stride = 256>, <size = 8, stride = 8>, <size = 4, stride = 64>, <size = 8, stride = 1>], {%shim_noc_tile_1_0}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<8x4x32x32xbf16>>  
    aie.objectfifo.link [@of_12_join_0_0, @of_12_join_0_1, @of_12_join_0_2, @of_12_join_0_3] -> [@of_13_mem_0]([0, 8192, 16384, 24576] [])
    aie.objectfifo @of_13_mem_1(%mem_tile_7_1 dimensionsToStream [<size = 4, stride = 256>, <size = 8, stride = 8>, <size = 4, stride = 64>, <size = 8, stride = 1>], {%shim_noc_tile_7_0}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<8x4x32x32xbf16>>  
    aie.objectfifo.link [@of_12_join_1_0, @of_12_join_1_1, @of_12_join_1_2, @of_12_join_1_3] -> [@of_13_mem_1]([0, 8192, 16384, 24576] [])
    func.func private @op0_zero_bf16_32_32_64(memref<32x64xbf16>)
    func.func private @op0_matmul_bf16_bf16_32_32_64(memref<32x32xbf16>, memref<32x64xbf16>, memref<32x64xbf16>)
    func.func private @op0_zero_bf16_32_64_32(memref<32x32xbf16>)
    func.func private @op0_matmul_bf16_bf16_32_64_32(memref<32x64xbf16>, memref<64x32xbf16>, memref<32x32xbf16>)
    func.func private @op0_silu_bf16(memref<32x64xbf16>, memref<32x64xbf16>, i32)
    func.func private @op0_eltwise_mul_bf16_vector(memref<32x64xbf16>, memref<32x64xbf16>, memref<32x64xbf16>, i32)
  }
  aie.device(npu2) @reset_device {
    aie.runtime_sequence() {
    }
  }
  aie.device(npu2) {
    aie.runtime_sequence(%arg0: memref<4194304xbf16>, %arg1: memref<1048576xbf16>, %arg2: memref<1xbf16>) {
      aiex.configure @op0__SwiGLUStreamGroup {
        %subview = memref.subview %arg0[0] [1048576] [1] : memref<4194304xbf16> to memref<1048576xbf16>
        %reinterpret_cast = memref.reinterpret_cast %subview to offset: [0], sizes: [2048, 512], strides: [512, 1] : memref<1048576xbf16> to memref<2048x512xbf16>
        %subview_0 = memref.subview %arg0[1048576] [1048576] [1] : memref<4194304xbf16> to memref<1048576xbf16, strided<[1], offset: 1048576>>
        %reinterpret_cast_1 = memref.reinterpret_cast %subview_0 to offset: [0], sizes: [512, 2048], strides: [2048, 1] : memref<1048576xbf16, strided<[1], offset: 1048576>> to memref<512x2048xbf16>
        %subview_2 = memref.subview %arg0[2097152] [1048576] [1] : memref<4194304xbf16> to memref<1048576xbf16, strided<[1], offset: 2097152>>
        %reinterpret_cast_3 = memref.reinterpret_cast %subview_2 to offset: [0], sizes: [512, 2048], strides: [2048, 1] : memref<1048576xbf16, strided<[1], offset: 2097152>> to memref<512x2048xbf16>
        %subview_4 = memref.subview %arg0[3145728] [1048576] [1] : memref<4194304xbf16> to memref<1048576xbf16, strided<[1], offset: 3145728>>
        %reinterpret_cast_5 = memref.reinterpret_cast %subview_4 to offset: [0], sizes: [2048, 512], strides: [512, 1] : memref<1048576xbf16, strided<[1], offset: 3145728>> to memref<2048x512xbf16>
        %subview_6 = memref.subview %arg1[0] [1048576] [1] : memref<1048576xbf16> to memref<1048576xbf16>
        %reinterpret_cast_7 = memref.reinterpret_cast %subview_6 to offset: [0], sizes: [2048, 512], strides: [512, 1] : memref<1048576xbf16> to memref<2048x512xbf16>
        aiex.run @sequence(%reinterpret_cast, %reinterpret_cast_1, %reinterpret_cast_3, %reinterpret_cast_5, %reinterpret_cast_7) : (memref<2048x512xbf16>, memref<512x2048xbf16>, memref<512x2048xbf16>, memref<2048x512xbf16>, memref<2048x512xbf16>)
      }
      aiex.configure @reset_device {
      }
    }
  }
}
