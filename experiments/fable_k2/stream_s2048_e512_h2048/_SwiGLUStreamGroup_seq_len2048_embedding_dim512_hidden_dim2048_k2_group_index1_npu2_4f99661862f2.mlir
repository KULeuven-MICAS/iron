module {
  aie.device(npu2) {
    %shim_noc_tile_0_0 = aie.tile(0, 0)
    %shim_noc_tile_1_0 = aie.tile(1, 0)
    %shim_noc_tile_2_0 = aie.tile(2, 0)
    %shim_noc_tile_3_0 = aie.tile(3, 0)
    %shim_noc_tile_4_0 = aie.tile(4, 0)
    %shim_noc_tile_6_0 = aie.tile(6, 0)
    %mem_tile_2_1 = aie.tile(2, 1)
    %mem_tile_4_1 = aie.tile(4, 1)
    %mem_tile_0_1 = aie.tile(0, 1)
    %mem_tile_3_1 = aie.tile(3, 1)
    %tile_6_2 = aie.tile(6, 2)
    %tile_6_3 = aie.tile(6, 3)
    %tile_6_4 = aie.tile(6, 4)
    %tile_6_5 = aie.tile(6, 5)
    %tile_7_2 = aie.tile(7, 2)
    %tile_7_3 = aie.tile(7, 3)
    %tile_7_4 = aie.tile(7, 4)
    %tile_7_5 = aie.tile(7, 5)
    %mem_tile_1_1 = aie.tile(1, 1)
    %mem_tile_6_1 = aie.tile(6, 1)
    aie.runtime_sequence(%arg0: memref<2048x2048xbf16>, %arg1: memref<2048x512xbf16>, %arg2: memref<2048x512xbf16>) {
      %0 = aiex.dma_configure_task_for @of_0_mem_0 {
        aie.dma_bd(%arg0 : memref<2048x2048xbf16> offset = 0 len = 262144 sizes = [8, 32, 128, 64] strides = [0, 64, 2048, 1])
        aie.end
      } {issue_token = true, iteration_t = 0 : index, repeat_count = 7 : i32}
      aiex.dma_start_task(%0)
      %1 = aiex.dma_configure_task_for @of_0_mem_1 {
        aie.dma_bd(%arg0 : memref<2048x2048xbf16> offset = 0 len = 262144 sizes = [8, 32, 128, 64] strides = [0, 64, 2048, 1])
        aie.end
      } {issue_token = true, iteration_t = 0 : index, repeat_count = 7 : i32}
      aiex.dma_start_task(%1)
      %2 = aiex.dma_configure_task_for @of_1_mem_0 {
        aie.dma_bd(%arg1 : memref<2048x512xbf16> offset = 0 len = 65536 sizes = [8, 32, 64, 32] strides = [64, 32768, 512, 1])
        aie.end
      } {issue_token = true, iteration_t = 0 : index, repeat_count = 7 : i32}
      aiex.dma_start_task(%2)
      %3 = aiex.dma_configure_task_for @of_1_mem_1 {
        aie.dma_bd(%arg1 : memref<2048x512xbf16> offset = 32 len = 65536 sizes = [8, 32, 64, 32] strides = [64, 32768, 512, 1])
        aie.end
      } {issue_token = true, iteration_t = 0 : index, repeat_count = 7 : i32}
      aiex.dma_start_task(%3)
      %4 = aiex.dma_configure_task_for @of_5_mem_0 {
        aie.dma_bd(%arg2 : memref<2048x512xbf16> offset = 0 len = 32768 sizes = [16, 8, 128, 32] strides = [65536, 64, 512, 1])
        aie.end
      } {issue_token = true, iteration_t = 0 : index, repeat_count = 15 : i32}
      aiex.dma_start_task(%4)
      %5 = aiex.dma_configure_task_for @of_5_mem_1 {
        aie.dma_bd(%arg2 : memref<2048x512xbf16> offset = 32 len = 32768 sizes = [16, 8, 128, 32] strides = [65536, 64, 512, 1])
        aie.end
      } {issue_token = true, iteration_t = 0 : index, repeat_count = 15 : i32}
      aiex.dma_start_task(%5)
      %6 = aiex.dma_configure_task_for @of_0_mem_0 {
        aie.dma_bd(%arg0 : memref<2048x2048xbf16> offset = 262144 len = 262144 sizes = [8, 32, 128, 64] strides = [0, 64, 2048, 1])
        aie.end
      } {issue_token = true, iteration_t = 2048 : index, repeat_count = 7 : i32}
      aiex.dma_start_task(%6)
      %7 = aiex.dma_configure_task_for @of_0_mem_1 {
        aie.dma_bd(%arg0 : memref<2048x2048xbf16> offset = 262144 len = 262144 sizes = [8, 32, 128, 64] strides = [0, 64, 2048, 1])
        aie.end
      } {issue_token = true, iteration_t = 2048 : index, repeat_count = 7 : i32}
      aiex.dma_start_task(%7)
      %8 = aiex.dma_configure_task_for @of_1_mem_0 {
        aie.dma_bd(%arg1 : memref<2048x512xbf16> offset = 0 len = 65536 sizes = [8, 32, 64, 32] strides = [64, 32768, 512, 1])
        aie.end
      } {issue_token = true, iteration_t = 2048 : index, repeat_count = 7 : i32}
      aiex.dma_start_task(%8)
      %9 = aiex.dma_configure_task_for @of_1_mem_1 {
        aie.dma_bd(%arg1 : memref<2048x512xbf16> offset = 32 len = 65536 sizes = [8, 32, 64, 32] strides = [64, 32768, 512, 1])
        aie.end
      } {issue_token = true, iteration_t = 2048 : index, repeat_count = 7 : i32}
      aiex.dma_start_task(%9)
      aiex.dma_await_task(%0)
      %10 = aiex.dma_configure_task_for @of_0_mem_0 {
        aie.dma_bd(%arg0 : memref<2048x2048xbf16> offset = 524288 len = 262144 sizes = [8, 32, 128, 64] strides = [0, 64, 2048, 1])
        aie.end
      } {issue_token = true, iteration_t = 4096 : index, repeat_count = 7 : i32}
      aiex.dma_start_task(%10)
      aiex.dma_await_task(%1)
      %11 = aiex.dma_configure_task_for @of_0_mem_1 {
        aie.dma_bd(%arg0 : memref<2048x2048xbf16> offset = 524288 len = 262144 sizes = [8, 32, 128, 64] strides = [0, 64, 2048, 1])
        aie.end
      } {issue_token = true, iteration_t = 4096 : index, repeat_count = 7 : i32}
      aiex.dma_start_task(%11)
      aiex.dma_await_task(%2)
      %12 = aiex.dma_configure_task_for @of_1_mem_0 {
        aie.dma_bd(%arg1 : memref<2048x512xbf16> offset = 0 len = 65536 sizes = [8, 32, 64, 32] strides = [64, 32768, 512, 1])
        aie.end
      } {issue_token = true, iteration_t = 4096 : index, repeat_count = 7 : i32}
      aiex.dma_start_task(%12)
      aiex.dma_await_task(%3)
      %13 = aiex.dma_configure_task_for @of_1_mem_1 {
        aie.dma_bd(%arg1 : memref<2048x512xbf16> offset = 32 len = 65536 sizes = [8, 32, 64, 32] strides = [64, 32768, 512, 1])
        aie.end
      } {issue_token = true, iteration_t = 4096 : index, repeat_count = 7 : i32}
      aiex.dma_start_task(%13)
      aiex.dma_await_task(%6)
      %14 = aiex.dma_configure_task_for @of_0_mem_0 {
        aie.dma_bd(%arg0 : memref<2048x2048xbf16> offset = 786432 len = 262144 sizes = [8, 32, 128, 64] strides = [0, 64, 2048, 1])
        aie.end
      } {issue_token = true, iteration_t = 6144 : index, repeat_count = 7 : i32}
      aiex.dma_start_task(%14)
      aiex.dma_await_task(%7)
      %15 = aiex.dma_configure_task_for @of_0_mem_1 {
        aie.dma_bd(%arg0 : memref<2048x2048xbf16> offset = 786432 len = 262144 sizes = [8, 32, 128, 64] strides = [0, 64, 2048, 1])
        aie.end
      } {issue_token = true, iteration_t = 6144 : index, repeat_count = 7 : i32}
      aiex.dma_start_task(%15)
      aiex.dma_await_task(%8)
      %16 = aiex.dma_configure_task_for @of_1_mem_0 {
        aie.dma_bd(%arg1 : memref<2048x512xbf16> offset = 0 len = 65536 sizes = [8, 32, 64, 32] strides = [64, 32768, 512, 1])
        aie.end
      } {issue_token = true, iteration_t = 6144 : index, repeat_count = 7 : i32}
      aiex.dma_start_task(%16)
      aiex.dma_await_task(%9)
      %17 = aiex.dma_configure_task_for @of_1_mem_1 {
        aie.dma_bd(%arg1 : memref<2048x512xbf16> offset = 32 len = 65536 sizes = [8, 32, 64, 32] strides = [64, 32768, 512, 1])
        aie.end
      } {issue_token = true, iteration_t = 6144 : index, repeat_count = 7 : i32}
      aiex.dma_start_task(%17)
      aiex.dma_await_task(%10)
      %18 = aiex.dma_configure_task_for @of_0_mem_0 {
        aie.dma_bd(%arg0 : memref<2048x2048xbf16> offset = 1048576 len = 262144 sizes = [8, 32, 128, 64] strides = [0, 64, 2048, 1])
        aie.end
      } {issue_token = true, iteration_t = 8192 : index, repeat_count = 7 : i32}
      aiex.dma_start_task(%18)
      aiex.dma_await_task(%11)
      %19 = aiex.dma_configure_task_for @of_0_mem_1 {
        aie.dma_bd(%arg0 : memref<2048x2048xbf16> offset = 1048576 len = 262144 sizes = [8, 32, 128, 64] strides = [0, 64, 2048, 1])
        aie.end
      } {issue_token = true, iteration_t = 8192 : index, repeat_count = 7 : i32}
      aiex.dma_start_task(%19)
      aiex.dma_await_task(%12)
      %20 = aiex.dma_configure_task_for @of_1_mem_0 {
        aie.dma_bd(%arg1 : memref<2048x512xbf16> offset = 0 len = 65536 sizes = [8, 32, 64, 32] strides = [64, 32768, 512, 1])
        aie.end
      } {issue_token = true, iteration_t = 8192 : index, repeat_count = 7 : i32}
      aiex.dma_start_task(%20)
      aiex.dma_await_task(%13)
      %21 = aiex.dma_configure_task_for @of_1_mem_1 {
        aie.dma_bd(%arg1 : memref<2048x512xbf16> offset = 32 len = 65536 sizes = [8, 32, 64, 32] strides = [64, 32768, 512, 1])
        aie.end
      } {issue_token = true, iteration_t = 8192 : index, repeat_count = 7 : i32}
      aiex.dma_start_task(%21)
      aiex.dma_await_task(%14)
      %22 = aiex.dma_configure_task_for @of_0_mem_0 {
        aie.dma_bd(%arg0 : memref<2048x2048xbf16> offset = 1310720 len = 262144 sizes = [8, 32, 128, 64] strides = [0, 64, 2048, 1])
        aie.end
      } {issue_token = true, iteration_t = 10240 : index, repeat_count = 7 : i32}
      aiex.dma_start_task(%22)
      aiex.dma_await_task(%15)
      %23 = aiex.dma_configure_task_for @of_0_mem_1 {
        aie.dma_bd(%arg0 : memref<2048x2048xbf16> offset = 1310720 len = 262144 sizes = [8, 32, 128, 64] strides = [0, 64, 2048, 1])
        aie.end
      } {issue_token = true, iteration_t = 10240 : index, repeat_count = 7 : i32}
      aiex.dma_start_task(%23)
      aiex.dma_await_task(%16)
      %24 = aiex.dma_configure_task_for @of_1_mem_0 {
        aie.dma_bd(%arg1 : memref<2048x512xbf16> offset = 0 len = 65536 sizes = [8, 32, 64, 32] strides = [64, 32768, 512, 1])
        aie.end
      } {issue_token = true, iteration_t = 10240 : index, repeat_count = 7 : i32}
      aiex.dma_start_task(%24)
      aiex.dma_await_task(%17)
      %25 = aiex.dma_configure_task_for @of_1_mem_1 {
        aie.dma_bd(%arg1 : memref<2048x512xbf16> offset = 32 len = 65536 sizes = [8, 32, 64, 32] strides = [64, 32768, 512, 1])
        aie.end
      } {issue_token = true, iteration_t = 10240 : index, repeat_count = 7 : i32}
      aiex.dma_start_task(%25)
      aiex.dma_await_task(%18)
      %26 = aiex.dma_configure_task_for @of_0_mem_0 {
        aie.dma_bd(%arg0 : memref<2048x2048xbf16> offset = 1572864 len = 262144 sizes = [8, 32, 128, 64] strides = [0, 64, 2048, 1])
        aie.end
      } {issue_token = true, iteration_t = 12288 : index, repeat_count = 7 : i32}
      aiex.dma_start_task(%26)
      aiex.dma_await_task(%19)
      %27 = aiex.dma_configure_task_for @of_0_mem_1 {
        aie.dma_bd(%arg0 : memref<2048x2048xbf16> offset = 1572864 len = 262144 sizes = [8, 32, 128, 64] strides = [0, 64, 2048, 1])
        aie.end
      } {issue_token = true, iteration_t = 12288 : index, repeat_count = 7 : i32}
      aiex.dma_start_task(%27)
      aiex.dma_await_task(%20)
      %28 = aiex.dma_configure_task_for @of_1_mem_0 {
        aie.dma_bd(%arg1 : memref<2048x512xbf16> offset = 0 len = 65536 sizes = [8, 32, 64, 32] strides = [64, 32768, 512, 1])
        aie.end
      } {issue_token = true, iteration_t = 12288 : index, repeat_count = 7 : i32}
      aiex.dma_start_task(%28)
      aiex.dma_await_task(%21)
      %29 = aiex.dma_configure_task_for @of_1_mem_1 {
        aie.dma_bd(%arg1 : memref<2048x512xbf16> offset = 32 len = 65536 sizes = [8, 32, 64, 32] strides = [64, 32768, 512, 1])
        aie.end
      } {issue_token = true, iteration_t = 12288 : index, repeat_count = 7 : i32}
      aiex.dma_start_task(%29)
      aiex.dma_await_task(%22)
      %30 = aiex.dma_configure_task_for @of_0_mem_0 {
        aie.dma_bd(%arg0 : memref<2048x2048xbf16> offset = 1835008 len = 262144 sizes = [8, 32, 128, 64] strides = [0, 64, 2048, 1])
        aie.end
      } {issue_token = true, iteration_t = 14336 : index, repeat_count = 7 : i32}
      aiex.dma_start_task(%30)
      aiex.dma_await_task(%23)
      %31 = aiex.dma_configure_task_for @of_0_mem_1 {
        aie.dma_bd(%arg0 : memref<2048x2048xbf16> offset = 1835008 len = 262144 sizes = [8, 32, 128, 64] strides = [0, 64, 2048, 1])
        aie.end
      } {issue_token = true, iteration_t = 14336 : index, repeat_count = 7 : i32}
      aiex.dma_start_task(%31)
      aiex.dma_await_task(%24)
      %32 = aiex.dma_configure_task_for @of_1_mem_0 {
        aie.dma_bd(%arg1 : memref<2048x512xbf16> offset = 0 len = 65536 sizes = [8, 32, 64, 32] strides = [64, 32768, 512, 1])
        aie.end
      } {issue_token = true, iteration_t = 14336 : index, repeat_count = 7 : i32}
      aiex.dma_start_task(%32)
      aiex.dma_await_task(%25)
      %33 = aiex.dma_configure_task_for @of_1_mem_1 {
        aie.dma_bd(%arg1 : memref<2048x512xbf16> offset = 32 len = 65536 sizes = [8, 32, 64, 32] strides = [64, 32768, 512, 1])
        aie.end
      } {issue_token = true, iteration_t = 14336 : index, repeat_count = 7 : i32}
      aiex.dma_start_task(%33)
      aiex.dma_await_task(%26)
      %34 = aiex.dma_configure_task_for @of_0_mem_0 {
        aie.dma_bd(%arg0 : memref<2048x2048xbf16> offset = 2097152 len = 262144 sizes = [8, 32, 128, 64] strides = [0, 64, 2048, 1])
        aie.end
      } {issue_token = true, iteration_t = 16384 : index, repeat_count = 7 : i32}
      aiex.dma_start_task(%34)
      aiex.dma_await_task(%27)
      %35 = aiex.dma_configure_task_for @of_0_mem_1 {
        aie.dma_bd(%arg0 : memref<2048x2048xbf16> offset = 2097152 len = 262144 sizes = [8, 32, 128, 64] strides = [0, 64, 2048, 1])
        aie.end
      } {issue_token = true, iteration_t = 16384 : index, repeat_count = 7 : i32}
      aiex.dma_start_task(%35)
      aiex.dma_await_task(%28)
      %36 = aiex.dma_configure_task_for @of_1_mem_0 {
        aie.dma_bd(%arg1 : memref<2048x512xbf16> offset = 0 len = 65536 sizes = [8, 32, 64, 32] strides = [64, 32768, 512, 1])
        aie.end
      } {issue_token = true, iteration_t = 16384 : index, repeat_count = 7 : i32}
      aiex.dma_start_task(%36)
      aiex.dma_await_task(%29)
      %37 = aiex.dma_configure_task_for @of_1_mem_1 {
        aie.dma_bd(%arg1 : memref<2048x512xbf16> offset = 32 len = 65536 sizes = [8, 32, 64, 32] strides = [64, 32768, 512, 1])
        aie.end
      } {issue_token = true, iteration_t = 16384 : index, repeat_count = 7 : i32}
      aiex.dma_start_task(%37)
      aiex.dma_await_task(%30)
      %38 = aiex.dma_configure_task_for @of_0_mem_0 {
        aie.dma_bd(%arg0 : memref<2048x2048xbf16> offset = 2359296 len = 262144 sizes = [8, 32, 128, 64] strides = [0, 64, 2048, 1])
        aie.end
      } {issue_token = true, iteration_t = 18432 : index, repeat_count = 7 : i32}
      aiex.dma_start_task(%38)
      aiex.dma_await_task(%31)
      %39 = aiex.dma_configure_task_for @of_0_mem_1 {
        aie.dma_bd(%arg0 : memref<2048x2048xbf16> offset = 2359296 len = 262144 sizes = [8, 32, 128, 64] strides = [0, 64, 2048, 1])
        aie.end
      } {issue_token = true, iteration_t = 18432 : index, repeat_count = 7 : i32}
      aiex.dma_start_task(%39)
      aiex.dma_await_task(%32)
      %40 = aiex.dma_configure_task_for @of_1_mem_0 {
        aie.dma_bd(%arg1 : memref<2048x512xbf16> offset = 0 len = 65536 sizes = [8, 32, 64, 32] strides = [64, 32768, 512, 1])
        aie.end
      } {issue_token = true, iteration_t = 18432 : index, repeat_count = 7 : i32}
      aiex.dma_start_task(%40)
      aiex.dma_await_task(%33)
      %41 = aiex.dma_configure_task_for @of_1_mem_1 {
        aie.dma_bd(%arg1 : memref<2048x512xbf16> offset = 32 len = 65536 sizes = [8, 32, 64, 32] strides = [64, 32768, 512, 1])
        aie.end
      } {issue_token = true, iteration_t = 18432 : index, repeat_count = 7 : i32}
      aiex.dma_start_task(%41)
      aiex.dma_await_task(%34)
      %42 = aiex.dma_configure_task_for @of_0_mem_0 {
        aie.dma_bd(%arg0 : memref<2048x2048xbf16> offset = 2621440 len = 262144 sizes = [8, 32, 128, 64] strides = [0, 64, 2048, 1])
        aie.end
      } {issue_token = true, iteration_t = 20480 : index, repeat_count = 7 : i32}
      aiex.dma_start_task(%42)
      aiex.dma_await_task(%35)
      %43 = aiex.dma_configure_task_for @of_0_mem_1 {
        aie.dma_bd(%arg0 : memref<2048x2048xbf16> offset = 2621440 len = 262144 sizes = [8, 32, 128, 64] strides = [0, 64, 2048, 1])
        aie.end
      } {issue_token = true, iteration_t = 20480 : index, repeat_count = 7 : i32}
      aiex.dma_start_task(%43)
      aiex.dma_await_task(%36)
      %44 = aiex.dma_configure_task_for @of_1_mem_0 {
        aie.dma_bd(%arg1 : memref<2048x512xbf16> offset = 0 len = 65536 sizes = [8, 32, 64, 32] strides = [64, 32768, 512, 1])
        aie.end
      } {issue_token = true, iteration_t = 20480 : index, repeat_count = 7 : i32}
      aiex.dma_start_task(%44)
      aiex.dma_await_task(%37)
      %45 = aiex.dma_configure_task_for @of_1_mem_1 {
        aie.dma_bd(%arg1 : memref<2048x512xbf16> offset = 32 len = 65536 sizes = [8, 32, 64, 32] strides = [64, 32768, 512, 1])
        aie.end
      } {issue_token = true, iteration_t = 20480 : index, repeat_count = 7 : i32}
      aiex.dma_start_task(%45)
      aiex.dma_await_task(%38)
      %46 = aiex.dma_configure_task_for @of_0_mem_0 {
        aie.dma_bd(%arg0 : memref<2048x2048xbf16> offset = 2883584 len = 262144 sizes = [8, 32, 128, 64] strides = [0, 64, 2048, 1])
        aie.end
      } {issue_token = true, iteration_t = 22528 : index, repeat_count = 7 : i32}
      aiex.dma_start_task(%46)
      aiex.dma_await_task(%39)
      %47 = aiex.dma_configure_task_for @of_0_mem_1 {
        aie.dma_bd(%arg0 : memref<2048x2048xbf16> offset = 2883584 len = 262144 sizes = [8, 32, 128, 64] strides = [0, 64, 2048, 1])
        aie.end
      } {issue_token = true, iteration_t = 22528 : index, repeat_count = 7 : i32}
      aiex.dma_start_task(%47)
      aiex.dma_await_task(%40)
      %48 = aiex.dma_configure_task_for @of_1_mem_0 {
        aie.dma_bd(%arg1 : memref<2048x512xbf16> offset = 0 len = 65536 sizes = [8, 32, 64, 32] strides = [64, 32768, 512, 1])
        aie.end
      } {issue_token = true, iteration_t = 22528 : index, repeat_count = 7 : i32}
      aiex.dma_start_task(%48)
      aiex.dma_await_task(%41)
      %49 = aiex.dma_configure_task_for @of_1_mem_1 {
        aie.dma_bd(%arg1 : memref<2048x512xbf16> offset = 32 len = 65536 sizes = [8, 32, 64, 32] strides = [64, 32768, 512, 1])
        aie.end
      } {issue_token = true, iteration_t = 22528 : index, repeat_count = 7 : i32}
      aiex.dma_start_task(%49)
      aiex.dma_await_task(%42)
      %50 = aiex.dma_configure_task_for @of_0_mem_0 {
        aie.dma_bd(%arg0 : memref<2048x2048xbf16> offset = 3145728 len = 262144 sizes = [8, 32, 128, 64] strides = [0, 64, 2048, 1])
        aie.end
      } {issue_token = true, iteration_t = 24576 : index, repeat_count = 7 : i32}
      aiex.dma_start_task(%50)
      aiex.dma_await_task(%43)
      %51 = aiex.dma_configure_task_for @of_0_mem_1 {
        aie.dma_bd(%arg0 : memref<2048x2048xbf16> offset = 3145728 len = 262144 sizes = [8, 32, 128, 64] strides = [0, 64, 2048, 1])
        aie.end
      } {issue_token = true, iteration_t = 24576 : index, repeat_count = 7 : i32}
      aiex.dma_start_task(%51)
      aiex.dma_await_task(%44)
      %52 = aiex.dma_configure_task_for @of_1_mem_0 {
        aie.dma_bd(%arg1 : memref<2048x512xbf16> offset = 0 len = 65536 sizes = [8, 32, 64, 32] strides = [64, 32768, 512, 1])
        aie.end
      } {issue_token = true, iteration_t = 24576 : index, repeat_count = 7 : i32}
      aiex.dma_start_task(%52)
      aiex.dma_await_task(%45)
      %53 = aiex.dma_configure_task_for @of_1_mem_1 {
        aie.dma_bd(%arg1 : memref<2048x512xbf16> offset = 32 len = 65536 sizes = [8, 32, 64, 32] strides = [64, 32768, 512, 1])
        aie.end
      } {issue_token = true, iteration_t = 24576 : index, repeat_count = 7 : i32}
      aiex.dma_start_task(%53)
      aiex.dma_await_task(%46)
      %54 = aiex.dma_configure_task_for @of_0_mem_0 {
        aie.dma_bd(%arg0 : memref<2048x2048xbf16> offset = 3407872 len = 262144 sizes = [8, 32, 128, 64] strides = [0, 64, 2048, 1])
        aie.end
      } {issue_token = true, iteration_t = 26624 : index, repeat_count = 7 : i32}
      aiex.dma_start_task(%54)
      aiex.dma_await_task(%47)
      %55 = aiex.dma_configure_task_for @of_0_mem_1 {
        aie.dma_bd(%arg0 : memref<2048x2048xbf16> offset = 3407872 len = 262144 sizes = [8, 32, 128, 64] strides = [0, 64, 2048, 1])
        aie.end
      } {issue_token = true, iteration_t = 26624 : index, repeat_count = 7 : i32}
      aiex.dma_start_task(%55)
      aiex.dma_await_task(%48)
      %56 = aiex.dma_configure_task_for @of_1_mem_0 {
        aie.dma_bd(%arg1 : memref<2048x512xbf16> offset = 0 len = 65536 sizes = [8, 32, 64, 32] strides = [64, 32768, 512, 1])
        aie.end
      } {issue_token = true, iteration_t = 26624 : index, repeat_count = 7 : i32}
      aiex.dma_start_task(%56)
      aiex.dma_await_task(%49)
      %57 = aiex.dma_configure_task_for @of_1_mem_1 {
        aie.dma_bd(%arg1 : memref<2048x512xbf16> offset = 32 len = 65536 sizes = [8, 32, 64, 32] strides = [64, 32768, 512, 1])
        aie.end
      } {issue_token = true, iteration_t = 26624 : index, repeat_count = 7 : i32}
      aiex.dma_start_task(%57)
      aiex.dma_await_task(%50)
      %58 = aiex.dma_configure_task_for @of_0_mem_0 {
        aie.dma_bd(%arg0 : memref<2048x2048xbf16> offset = 3670016 len = 262144 sizes = [8, 32, 128, 64] strides = [0, 64, 2048, 1])
        aie.end
      } {issue_token = true, iteration_t = 28672 : index, repeat_count = 7 : i32}
      aiex.dma_start_task(%58)
      aiex.dma_await_task(%51)
      %59 = aiex.dma_configure_task_for @of_0_mem_1 {
        aie.dma_bd(%arg0 : memref<2048x2048xbf16> offset = 3670016 len = 262144 sizes = [8, 32, 128, 64] strides = [0, 64, 2048, 1])
        aie.end
      } {issue_token = true, iteration_t = 28672 : index, repeat_count = 7 : i32}
      aiex.dma_start_task(%59)
      aiex.dma_await_task(%52)
      %60 = aiex.dma_configure_task_for @of_1_mem_0 {
        aie.dma_bd(%arg1 : memref<2048x512xbf16> offset = 0 len = 65536 sizes = [8, 32, 64, 32] strides = [64, 32768, 512, 1])
        aie.end
      } {issue_token = true, iteration_t = 28672 : index, repeat_count = 7 : i32}
      aiex.dma_start_task(%60)
      aiex.dma_await_task(%53)
      %61 = aiex.dma_configure_task_for @of_1_mem_1 {
        aie.dma_bd(%arg1 : memref<2048x512xbf16> offset = 32 len = 65536 sizes = [8, 32, 64, 32] strides = [64, 32768, 512, 1])
        aie.end
      } {issue_token = true, iteration_t = 28672 : index, repeat_count = 7 : i32}
      aiex.dma_start_task(%61)
      aiex.dma_await_task(%54)
      %62 = aiex.dma_configure_task_for @of_0_mem_0 {
        aie.dma_bd(%arg0 : memref<2048x2048xbf16> offset = 3932160 len = 262144 sizes = [8, 32, 128, 64] strides = [0, 64, 2048, 1])
        aie.end
      } {issue_token = true, iteration_t = 30720 : index, repeat_count = 7 : i32}
      aiex.dma_start_task(%62)
      aiex.dma_await_task(%55)
      %63 = aiex.dma_configure_task_for @of_0_mem_1 {
        aie.dma_bd(%arg0 : memref<2048x2048xbf16> offset = 3932160 len = 262144 sizes = [8, 32, 128, 64] strides = [0, 64, 2048, 1])
        aie.end
      } {issue_token = true, iteration_t = 30720 : index, repeat_count = 7 : i32}
      aiex.dma_start_task(%63)
      aiex.dma_await_task(%56)
      %64 = aiex.dma_configure_task_for @of_1_mem_0 {
        aie.dma_bd(%arg1 : memref<2048x512xbf16> offset = 0 len = 65536 sizes = [8, 32, 64, 32] strides = [64, 32768, 512, 1])
        aie.end
      } {issue_token = true, iteration_t = 30720 : index, repeat_count = 7 : i32}
      aiex.dma_start_task(%64)
      aiex.dma_await_task(%57)
      %65 = aiex.dma_configure_task_for @of_1_mem_1 {
        aie.dma_bd(%arg1 : memref<2048x512xbf16> offset = 32 len = 65536 sizes = [8, 32, 64, 32] strides = [64, 32768, 512, 1])
        aie.end
      } {issue_token = true, iteration_t = 30720 : index, repeat_count = 7 : i32}
      aiex.dma_start_task(%65)
      aiex.dma_await_task(%58)
      aiex.dma_await_task(%62)
      aiex.dma_await_task(%59)
      aiex.dma_await_task(%63)
      aiex.dma_await_task(%60)
      aiex.dma_await_task(%64)
      aiex.dma_await_task(%61)
      aiex.dma_await_task(%65)
      aiex.dma_await_task(%4)
      aiex.dma_await_task(%5)
    }
    %core_6_2 = aie.core(%tile_6_2) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c16 = arith.constant 16 : index
        scf.for %arg1 = %c0_0 to %c16 step %c1_1 {
          %c8 = arith.constant 8 : index
          scf.for %arg2 = %c0_0 to %c8 step %c1_1 {
            %0 = aie.objectfifo.acquire @of_4_join_0_0(Produce, 1) : !aie.objectfifosubview<memref<32x32xbf16>>
            %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<32x32xbf16>> -> memref<32x32xbf16>
            func.call @op1_zero_bf16_32_64_32(%1) : (memref<32x32xbf16>) -> ()
            %c32 = arith.constant 32 : index
            scf.for %arg3 = %c0_0 to %c32 step %c1_1 {
              %2 = aie.objectfifo.acquire @of_3_broadcast_0_0(Consume, 1) : !aie.objectfifosubview<memref<64x32xbf16>>
              %3 = aie.objectfifo.subview.access %2[0] : !aie.objectfifosubview<memref<64x32xbf16>> -> memref<64x32xbf16>
              %4 = aie.objectfifo.acquire @of_2_distribute_0_0(Consume, 1) : !aie.objectfifosubview<memref<32x64xbf16>>
              %5 = aie.objectfifo.subview.access %4[0] : !aie.objectfifosubview<memref<32x64xbf16>> -> memref<32x64xbf16>
              func.call @op1_matmul_bf16_bf16_32_64_32(%5, %3, %1) : (memref<32x64xbf16>, memref<64x32xbf16>, memref<32x32xbf16>) -> ()
              aie.objectfifo.release @of_2_distribute_0_0(Consume, 1)
              aie.objectfifo.release @of_3_broadcast_0_0(Consume, 1)
            }
            aie.objectfifo.release @of_4_join_0_0(Produce, 1)
          }
        }
      }
      aie.end
    } {link_with = "op1_mm_32_64_32.o"}
    %core_6_3 = aie.core(%tile_6_3) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c16 = arith.constant 16 : index
        scf.for %arg1 = %c0_0 to %c16 step %c1_1 {
          %c8 = arith.constant 8 : index
          scf.for %arg2 = %c0_0 to %c8 step %c1_1 {
            %0 = aie.objectfifo.acquire @of_4_join_0_1(Produce, 1) : !aie.objectfifosubview<memref<32x32xbf16>>
            %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<32x32xbf16>> -> memref<32x32xbf16>
            func.call @op1_zero_bf16_32_64_32(%1) : (memref<32x32xbf16>) -> ()
            %c32 = arith.constant 32 : index
            scf.for %arg3 = %c0_0 to %c32 step %c1_1 {
              %2 = aie.objectfifo.acquire @of_3_broadcast_0_0(Consume, 1) : !aie.objectfifosubview<memref<64x32xbf16>>
              %3 = aie.objectfifo.subview.access %2[0] : !aie.objectfifosubview<memref<64x32xbf16>> -> memref<64x32xbf16>
              %4 = aie.objectfifo.acquire @of_2_distribute_0_1(Consume, 1) : !aie.objectfifosubview<memref<32x64xbf16>>
              %5 = aie.objectfifo.subview.access %4[0] : !aie.objectfifosubview<memref<32x64xbf16>> -> memref<32x64xbf16>
              func.call @op1_matmul_bf16_bf16_32_64_32(%5, %3, %1) : (memref<32x64xbf16>, memref<64x32xbf16>, memref<32x32xbf16>) -> ()
              aie.objectfifo.release @of_2_distribute_0_1(Consume, 1)
              aie.objectfifo.release @of_3_broadcast_0_0(Consume, 1)
            }
            aie.objectfifo.release @of_4_join_0_1(Produce, 1)
          }
        }
      }
      aie.end
    } {link_with = "op1_mm_32_64_32.o"}
    %core_6_4 = aie.core(%tile_6_4) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c16 = arith.constant 16 : index
        scf.for %arg1 = %c0_0 to %c16 step %c1_1 {
          %c8 = arith.constant 8 : index
          scf.for %arg2 = %c0_0 to %c8 step %c1_1 {
            %0 = aie.objectfifo.acquire @of_4_join_0_2(Produce, 1) : !aie.objectfifosubview<memref<32x32xbf16>>
            %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<32x32xbf16>> -> memref<32x32xbf16>
            func.call @op1_zero_bf16_32_64_32(%1) : (memref<32x32xbf16>) -> ()
            %c32 = arith.constant 32 : index
            scf.for %arg3 = %c0_0 to %c32 step %c1_1 {
              %2 = aie.objectfifo.acquire @of_3_broadcast_0_0(Consume, 1) : !aie.objectfifosubview<memref<64x32xbf16>>
              %3 = aie.objectfifo.subview.access %2[0] : !aie.objectfifosubview<memref<64x32xbf16>> -> memref<64x32xbf16>
              %4 = aie.objectfifo.acquire @of_2_distribute_0_2(Consume, 1) : !aie.objectfifosubview<memref<32x64xbf16>>
              %5 = aie.objectfifo.subview.access %4[0] : !aie.objectfifosubview<memref<32x64xbf16>> -> memref<32x64xbf16>
              func.call @op1_matmul_bf16_bf16_32_64_32(%5, %3, %1) : (memref<32x64xbf16>, memref<64x32xbf16>, memref<32x32xbf16>) -> ()
              aie.objectfifo.release @of_2_distribute_0_2(Consume, 1)
              aie.objectfifo.release @of_3_broadcast_0_0(Consume, 1)
            }
            aie.objectfifo.release @of_4_join_0_2(Produce, 1)
          }
        }
      }
      aie.end
    } {link_with = "op1_mm_32_64_32.o"}
    %core_6_5 = aie.core(%tile_6_5) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c16 = arith.constant 16 : index
        scf.for %arg1 = %c0_0 to %c16 step %c1_1 {
          %c8 = arith.constant 8 : index
          scf.for %arg2 = %c0_0 to %c8 step %c1_1 {
            %0 = aie.objectfifo.acquire @of_4_join_0_3(Produce, 1) : !aie.objectfifosubview<memref<32x32xbf16>>
            %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<32x32xbf16>> -> memref<32x32xbf16>
            func.call @op1_zero_bf16_32_64_32(%1) : (memref<32x32xbf16>) -> ()
            %c32 = arith.constant 32 : index
            scf.for %arg3 = %c0_0 to %c32 step %c1_1 {
              %2 = aie.objectfifo.acquire @of_3_broadcast_0_0(Consume, 1) : !aie.objectfifosubview<memref<64x32xbf16>>
              %3 = aie.objectfifo.subview.access %2[0] : !aie.objectfifosubview<memref<64x32xbf16>> -> memref<64x32xbf16>
              %4 = aie.objectfifo.acquire @of_2_distribute_0_3(Consume, 1) : !aie.objectfifosubview<memref<32x64xbf16>>
              %5 = aie.objectfifo.subview.access %4[0] : !aie.objectfifosubview<memref<32x64xbf16>> -> memref<32x64xbf16>
              func.call @op1_matmul_bf16_bf16_32_64_32(%5, %3, %1) : (memref<32x64xbf16>, memref<64x32xbf16>, memref<32x32xbf16>) -> ()
              aie.objectfifo.release @of_2_distribute_0_3(Consume, 1)
              aie.objectfifo.release @of_3_broadcast_0_0(Consume, 1)
            }
            aie.objectfifo.release @of_4_join_0_3(Produce, 1)
          }
        }
      }
      aie.end
    } {link_with = "op1_mm_32_64_32.o"}
    %core_7_2 = aie.core(%tile_7_2) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c16 = arith.constant 16 : index
        scf.for %arg1 = %c0_0 to %c16 step %c1_1 {
          %c8 = arith.constant 8 : index
          scf.for %arg2 = %c0_0 to %c8 step %c1_1 {
            %0 = aie.objectfifo.acquire @of_4_join_1_0(Produce, 1) : !aie.objectfifosubview<memref<32x32xbf16>>
            %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<32x32xbf16>> -> memref<32x32xbf16>
            func.call @op1_zero_bf16_32_64_32(%1) : (memref<32x32xbf16>) -> ()
            %c32 = arith.constant 32 : index
            scf.for %arg3 = %c0_0 to %c32 step %c1_1 {
              %2 = aie.objectfifo.acquire @of_3_broadcast_1_0(Consume, 1) : !aie.objectfifosubview<memref<64x32xbf16>>
              %3 = aie.objectfifo.subview.access %2[0] : !aie.objectfifosubview<memref<64x32xbf16>> -> memref<64x32xbf16>
              %4 = aie.objectfifo.acquire @of_2_distribute_1_0(Consume, 1) : !aie.objectfifosubview<memref<32x64xbf16>>
              %5 = aie.objectfifo.subview.access %4[0] : !aie.objectfifosubview<memref<32x64xbf16>> -> memref<32x64xbf16>
              func.call @op1_matmul_bf16_bf16_32_64_32(%5, %3, %1) : (memref<32x64xbf16>, memref<64x32xbf16>, memref<32x32xbf16>) -> ()
              aie.objectfifo.release @of_2_distribute_1_0(Consume, 1)
              aie.objectfifo.release @of_3_broadcast_1_0(Consume, 1)
            }
            aie.objectfifo.release @of_4_join_1_0(Produce, 1)
          }
        }
      }
      aie.end
    } {link_with = "op1_mm_32_64_32.o"}
    %core_7_3 = aie.core(%tile_7_3) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c16 = arith.constant 16 : index
        scf.for %arg1 = %c0_0 to %c16 step %c1_1 {
          %c8 = arith.constant 8 : index
          scf.for %arg2 = %c0_0 to %c8 step %c1_1 {
            %0 = aie.objectfifo.acquire @of_4_join_1_1(Produce, 1) : !aie.objectfifosubview<memref<32x32xbf16>>
            %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<32x32xbf16>> -> memref<32x32xbf16>
            func.call @op1_zero_bf16_32_64_32(%1) : (memref<32x32xbf16>) -> ()
            %c32 = arith.constant 32 : index
            scf.for %arg3 = %c0_0 to %c32 step %c1_1 {
              %2 = aie.objectfifo.acquire @of_3_broadcast_1_0(Consume, 1) : !aie.objectfifosubview<memref<64x32xbf16>>
              %3 = aie.objectfifo.subview.access %2[0] : !aie.objectfifosubview<memref<64x32xbf16>> -> memref<64x32xbf16>
              %4 = aie.objectfifo.acquire @of_2_distribute_1_1(Consume, 1) : !aie.objectfifosubview<memref<32x64xbf16>>
              %5 = aie.objectfifo.subview.access %4[0] : !aie.objectfifosubview<memref<32x64xbf16>> -> memref<32x64xbf16>
              func.call @op1_matmul_bf16_bf16_32_64_32(%5, %3, %1) : (memref<32x64xbf16>, memref<64x32xbf16>, memref<32x32xbf16>) -> ()
              aie.objectfifo.release @of_2_distribute_1_1(Consume, 1)
              aie.objectfifo.release @of_3_broadcast_1_0(Consume, 1)
            }
            aie.objectfifo.release @of_4_join_1_1(Produce, 1)
          }
        }
      }
      aie.end
    } {link_with = "op1_mm_32_64_32.o"}
    %core_7_4 = aie.core(%tile_7_4) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c16 = arith.constant 16 : index
        scf.for %arg1 = %c0_0 to %c16 step %c1_1 {
          %c8 = arith.constant 8 : index
          scf.for %arg2 = %c0_0 to %c8 step %c1_1 {
            %0 = aie.objectfifo.acquire @of_4_join_1_2(Produce, 1) : !aie.objectfifosubview<memref<32x32xbf16>>
            %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<32x32xbf16>> -> memref<32x32xbf16>
            func.call @op1_zero_bf16_32_64_32(%1) : (memref<32x32xbf16>) -> ()
            %c32 = arith.constant 32 : index
            scf.for %arg3 = %c0_0 to %c32 step %c1_1 {
              %2 = aie.objectfifo.acquire @of_3_broadcast_1_0(Consume, 1) : !aie.objectfifosubview<memref<64x32xbf16>>
              %3 = aie.objectfifo.subview.access %2[0] : !aie.objectfifosubview<memref<64x32xbf16>> -> memref<64x32xbf16>
              %4 = aie.objectfifo.acquire @of_2_distribute_1_2(Consume, 1) : !aie.objectfifosubview<memref<32x64xbf16>>
              %5 = aie.objectfifo.subview.access %4[0] : !aie.objectfifosubview<memref<32x64xbf16>> -> memref<32x64xbf16>
              func.call @op1_matmul_bf16_bf16_32_64_32(%5, %3, %1) : (memref<32x64xbf16>, memref<64x32xbf16>, memref<32x32xbf16>) -> ()
              aie.objectfifo.release @of_2_distribute_1_2(Consume, 1)
              aie.objectfifo.release @of_3_broadcast_1_0(Consume, 1)
            }
            aie.objectfifo.release @of_4_join_1_2(Produce, 1)
          }
        }
      }
      aie.end
    } {link_with = "op1_mm_32_64_32.o"}
    %core_7_5 = aie.core(%tile_7_5) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c16 = arith.constant 16 : index
        scf.for %arg1 = %c0_0 to %c16 step %c1_1 {
          %c8 = arith.constant 8 : index
          scf.for %arg2 = %c0_0 to %c8 step %c1_1 {
            %0 = aie.objectfifo.acquire @of_4_join_1_3(Produce, 1) : !aie.objectfifosubview<memref<32x32xbf16>>
            %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<32x32xbf16>> -> memref<32x32xbf16>
            func.call @op1_zero_bf16_32_64_32(%1) : (memref<32x32xbf16>) -> ()
            %c32 = arith.constant 32 : index
            scf.for %arg3 = %c0_0 to %c32 step %c1_1 {
              %2 = aie.objectfifo.acquire @of_3_broadcast_1_0(Consume, 1) : !aie.objectfifosubview<memref<64x32xbf16>>
              %3 = aie.objectfifo.subview.access %2[0] : !aie.objectfifosubview<memref<64x32xbf16>> -> memref<64x32xbf16>
              %4 = aie.objectfifo.acquire @of_2_distribute_1_3(Consume, 1) : !aie.objectfifosubview<memref<32x64xbf16>>
              %5 = aie.objectfifo.subview.access %4[0] : !aie.objectfifosubview<memref<32x64xbf16>> -> memref<32x64xbf16>
              func.call @op1_matmul_bf16_bf16_32_64_32(%5, %3, %1) : (memref<32x64xbf16>, memref<64x32xbf16>, memref<32x32xbf16>) -> ()
              aie.objectfifo.release @of_2_distribute_1_3(Consume, 1)
              aie.objectfifo.release @of_3_broadcast_1_0(Consume, 1)
            }
            aie.objectfifo.release @of_4_join_1_3(Produce, 1)
          }
        }
      }
      aie.end
    } {link_with = "op1_mm_32_64_32.o"}
    aie.objectfifo @of_0_mem_0(%shim_noc_tile_2_0, {%mem_tile_2_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<4x32x64xbf16>>  
    aie.objectfifo @of_0_mem_1(%shim_noc_tile_4_0, {%mem_tile_4_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<4x32x64xbf16>>  
    aie.objectfifo @of_1_mem_0(%shim_noc_tile_0_0, {%mem_tile_0_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x32xbf16>>  
    aie.objectfifo @of_1_mem_1(%shim_noc_tile_3_0, {%mem_tile_3_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x32xbf16>>  
    aie.objectfifo @of_2_distribute_0_0(%mem_tile_2_1 dimensionsToStream [<size = 4, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%tile_6_2}, [4 : i32, 4 : i32]) : !aie.objectfifo<memref<32x64xbf16>>  
    aie.objectfifo @of_2_distribute_0_1(%mem_tile_2_1 dimensionsToStream [<size = 4, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%tile_6_3}, [4 : i32, 4 : i32]) : !aie.objectfifo<memref<32x64xbf16>>  
    aie.objectfifo @of_2_distribute_0_2(%mem_tile_2_1 dimensionsToStream [<size = 4, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%tile_6_4}, [4 : i32, 4 : i32]) : !aie.objectfifo<memref<32x64xbf16>>  
    aie.objectfifo @of_2_distribute_0_3(%mem_tile_2_1 dimensionsToStream [<size = 4, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%tile_6_5}, [4 : i32, 4 : i32]) : !aie.objectfifo<memref<32x64xbf16>>  
    aie.objectfifo.link [@of_0_mem_0] -> [@of_2_distribute_0_0, @of_2_distribute_0_1, @of_2_distribute_0_2, @of_2_distribute_0_3]([] [0, 2048, 4096, 6144])
    aie.objectfifo @of_2_distribute_1_0(%mem_tile_4_1 dimensionsToStream [<size = 4, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%tile_7_2}, [4 : i32, 4 : i32]) : !aie.objectfifo<memref<32x64xbf16>>  
    aie.objectfifo @of_2_distribute_1_1(%mem_tile_4_1 dimensionsToStream [<size = 4, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%tile_7_3}, [4 : i32, 4 : i32]) : !aie.objectfifo<memref<32x64xbf16>>  
    aie.objectfifo @of_2_distribute_1_2(%mem_tile_4_1 dimensionsToStream [<size = 4, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%tile_7_4}, [4 : i32, 4 : i32]) : !aie.objectfifo<memref<32x64xbf16>>  
    aie.objectfifo @of_2_distribute_1_3(%mem_tile_4_1 dimensionsToStream [<size = 4, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%tile_7_5}, [4 : i32, 4 : i32]) : !aie.objectfifo<memref<32x64xbf16>>  
    aie.objectfifo.link [@of_0_mem_1] -> [@of_2_distribute_1_0, @of_2_distribute_1_1, @of_2_distribute_1_2, @of_2_distribute_1_3]([] [0, 2048, 4096, 6144])
    aie.objectfifo @of_3_broadcast_0_0(%mem_tile_0_1 dimensionsToStream [<size = 8, stride = 256>, <size = 4, stride = 8>, <size = 8, stride = 32>, <size = 8, stride = 1>], {%tile_6_2, %tile_6_3, %tile_6_4, %tile_6_5}, [4 : i32, 4 : i32, 4 : i32, 4 : i32, 4 : i32]) : !aie.objectfifo<memref<64x32xbf16>>  
    aie.objectfifo.link [@of_1_mem_0] -> [@of_3_broadcast_0_0]([] [])
    aie.objectfifo @of_3_broadcast_1_0(%mem_tile_3_1 dimensionsToStream [<size = 8, stride = 256>, <size = 4, stride = 8>, <size = 8, stride = 32>, <size = 8, stride = 1>], {%tile_7_2, %tile_7_3, %tile_7_4, %tile_7_5}, [4 : i32, 4 : i32, 4 : i32, 4 : i32, 4 : i32]) : !aie.objectfifo<memref<64x32xbf16>>  
    aie.objectfifo.link [@of_1_mem_1] -> [@of_3_broadcast_1_0]([] [])
    aie.objectfifo @of_4_join_0_0(%tile_6_2, {%mem_tile_1_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<32x32xbf16>>  
    aie.objectfifo @of_4_join_0_1(%tile_6_3, {%mem_tile_1_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<32x32xbf16>>  
    aie.objectfifo @of_4_join_0_2(%tile_6_4, {%mem_tile_1_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<32x32xbf16>>  
    aie.objectfifo @of_4_join_0_3(%tile_6_5, {%mem_tile_1_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<32x32xbf16>>  
    aie.objectfifo @of_4_join_1_0(%tile_7_2, {%mem_tile_6_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<32x32xbf16>>  
    aie.objectfifo @of_4_join_1_1(%tile_7_3, {%mem_tile_6_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<32x32xbf16>>  
    aie.objectfifo @of_4_join_1_2(%tile_7_4, {%mem_tile_6_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<32x32xbf16>>  
    aie.objectfifo @of_4_join_1_3(%tile_7_5, {%mem_tile_6_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<32x32xbf16>>  
    aie.objectfifo @of_5_mem_0(%mem_tile_1_1 dimensionsToStream [<size = 4, stride = 256>, <size = 8, stride = 8>, <size = 4, stride = 64>, <size = 8, stride = 1>], {%shim_noc_tile_1_0}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<4x32x32xbf16>>  
    aie.objectfifo.link [@of_4_join_0_0, @of_4_join_0_1, @of_4_join_0_2, @of_4_join_0_3] -> [@of_5_mem_0]([0, 1024, 2048, 3072] [])
    aie.objectfifo @of_5_mem_1(%mem_tile_6_1 dimensionsToStream [<size = 4, stride = 256>, <size = 8, stride = 8>, <size = 4, stride = 64>, <size = 8, stride = 1>], {%shim_noc_tile_6_0}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<4x32x32xbf16>>  
    aie.objectfifo.link [@of_4_join_1_0, @of_4_join_1_1, @of_4_join_1_2, @of_4_join_1_3] -> [@of_5_mem_1]([0, 1024, 2048, 3072] [])
    func.func private @op1_zero_bf16_32_64_32(memref<32x32xbf16>)
    func.func private @op1_matmul_bf16_bf16_32_64_32(memref<32x64xbf16>, memref<64x32xbf16>, memref<32x32xbf16>)
  }
}
