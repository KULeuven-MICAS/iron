module {
  aie.device(npu2) {
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
    %mem_tile_3_1 = aie.tile(3, 1)
    %mem_tile_4_1 = aie.tile(4, 1)
    %mem_tile_5_1 = aie.tile(5, 1)
    %mem_tile_6_1 = aie.tile(6, 1)
    %mem_tile_7_1 = aie.tile(7, 1)
    %tile_0_5 = aie.tile(0, 5)
    %tile_1_5 = aie.tile(1, 5)
    %tile_2_5 = aie.tile(2, 5)
    %tile_3_5 = aie.tile(3, 5)
    %tile_4_5 = aie.tile(4, 5)
    %tile_5_5 = aie.tile(5, 5)
    %tile_6_5 = aie.tile(6, 5)
    %tile_7_5 = aie.tile(7, 5)
    %tile_0_3 = aie.tile(0, 3)
    %tile_1_3 = aie.tile(1, 3)
    %tile_2_3 = aie.tile(2, 3)
    %tile_3_3 = aie.tile(3, 3)
    %tile_4_3 = aie.tile(4, 3)
    %tile_5_3 = aie.tile(5, 3)
    %tile_6_3 = aie.tile(6, 3)
    %tile_7_3 = aie.tile(7, 3)
    %tile_0_2 = aie.tile(0, 2)
    %tile_1_2 = aie.tile(1, 2)
    %tile_2_2 = aie.tile(2, 2)
    %tile_3_2 = aie.tile(3, 2)
    %tile_4_2 = aie.tile(4, 2)
    %tile_5_2 = aie.tile(5, 2)
    %tile_6_2 = aie.tile(6, 2)
    %tile_7_2 = aie.tile(7, 2)
    %tile_0_4 = aie.tile(0, 4)
    %tile_1_4 = aie.tile(1, 4)
    %tile_2_4 = aie.tile(2, 4)
    %tile_3_4 = aie.tile(3, 4)
    %tile_4_4 = aie.tile(4, 4)
    %tile_5_4 = aie.tile(5, 4)
    %tile_6_4 = aie.tile(6, 4)
    %tile_7_4 = aie.tile(7, 4)
    aie.runtime_sequence(%arg0: memref<2048x64xbf16>, %arg1: memref<64x2048xbf16>, %arg2: memref<2048x64xbf16>, %arg3: memref<2048x64xbf16>) {
      %0 = aiex.dma_configure_task_for @of_0_mem_0 {
        aie.dma_bd(%arg0 : memref<2048x64xbf16> offset = 0 len = 16384 sizes = [1, 4, 64, 64] strides = [0, 32768, 64, 1])
        aie.end
      } {issue_token = true, iteration_t = 0 : index}
      aiex.dma_start_task(%0)
      %1 = aiex.dma_configure_task_for @of_0_mem_1 {
        aie.dma_bd(%arg0 : memref<2048x64xbf16> offset = 4096 len = 16384 sizes = [1, 4, 64, 64] strides = [0, 32768, 64, 1])
        aie.end
      } {issue_token = true, iteration_t = 0 : index}
      aiex.dma_start_task(%1)
      %2 = aiex.dma_configure_task_for @of_0_mem_2 {
        aie.dma_bd(%arg0 : memref<2048x64xbf16> offset = 8192 len = 16384 sizes = [1, 4, 64, 64] strides = [0, 32768, 64, 1])
        aie.end
      } {issue_token = true, iteration_t = 0 : index}
      aiex.dma_start_task(%2)
      %3 = aiex.dma_configure_task_for @of_0_mem_3 {
        aie.dma_bd(%arg0 : memref<2048x64xbf16> offset = 12288 len = 16384 sizes = [1, 4, 64, 64] strides = [0, 32768, 64, 1])
        aie.end
      } {issue_token = true, iteration_t = 0 : index}
      aiex.dma_start_task(%3)
      %4 = aiex.dma_configure_task_for @of_0_mem_4 {
        aie.dma_bd(%arg0 : memref<2048x64xbf16> offset = 16384 len = 16384 sizes = [1, 4, 64, 64] strides = [0, 32768, 64, 1])
        aie.end
      } {issue_token = true, iteration_t = 0 : index}
      aiex.dma_start_task(%4)
      %5 = aiex.dma_configure_task_for @of_0_mem_5 {
        aie.dma_bd(%arg0 : memref<2048x64xbf16> offset = 20480 len = 16384 sizes = [1, 4, 64, 64] strides = [0, 32768, 64, 1])
        aie.end
      } {issue_token = true, iteration_t = 0 : index}
      aiex.dma_start_task(%5)
      %6 = aiex.dma_configure_task_for @of_0_mem_6 {
        aie.dma_bd(%arg0 : memref<2048x64xbf16> offset = 24576 len = 16384 sizes = [1, 4, 64, 64] strides = [0, 32768, 64, 1])
        aie.end
      } {issue_token = true, iteration_t = 0 : index}
      aiex.dma_start_task(%6)
      %7 = aiex.dma_configure_task_for @of_0_mem_7 {
        aie.dma_bd(%arg0 : memref<2048x64xbf16> offset = 28672 len = 16384 sizes = [1, 4, 64, 64] strides = [0, 32768, 64, 1])
        aie.end
      } {issue_token = true, iteration_t = 0 : index}
      aiex.dma_start_task(%7)
      %8 = aiex.dma_configure_task_for @of_1_mem {
        aie.dma_bd(%arg1 : memref<64x2048xbf16> offset = 0 len = 4096 sizes = [2, 1, 64, 64] strides = [0, 0, 2048, 1])
        aie.end
      } {issue_token = true, iteration_t = 0 : index, repeat_count = 1 : i32}
      aiex.dma_start_task(%8)
      %9 = aiex.dma_configure_task_for @of_2_mem {
        aie.dma_bd(%arg2 : memref<2048x64xbf16> offset = 0 len = 4096 sizes = [2, 1, 64, 64] strides = [0, 0, 64, 1])
        aie.end
      } {issue_token = true, iteration_t = 0 : index, repeat_count = 1 : i32}
      aiex.dma_start_task(%9)
      %10 = aiex.dma_configure_task_for @of_10_mem_0 {
        aie.dma_bd(%arg3 : memref<2048x64xbf16> offset = 0 len = 16384 sizes = [1, 4, 64, 64] strides = [0, 32768, 64, 1])
        aie.end
      } {issue_token = true, iteration_t = 0 : index}
      aiex.dma_start_task(%10)
      %11 = aiex.dma_configure_task_for @of_10_mem_1 {
        aie.dma_bd(%arg3 : memref<2048x64xbf16> offset = 4096 len = 16384 sizes = [1, 4, 64, 64] strides = [0, 32768, 64, 1])
        aie.end
      } {issue_token = true, iteration_t = 0 : index}
      aiex.dma_start_task(%11)
      %12 = aiex.dma_configure_task_for @of_10_mem_2 {
        aie.dma_bd(%arg3 : memref<2048x64xbf16> offset = 8192 len = 16384 sizes = [1, 4, 64, 64] strides = [0, 32768, 64, 1])
        aie.end
      } {issue_token = true, iteration_t = 0 : index}
      aiex.dma_start_task(%12)
      %13 = aiex.dma_configure_task_for @of_10_mem_3 {
        aie.dma_bd(%arg3 : memref<2048x64xbf16> offset = 12288 len = 16384 sizes = [1, 4, 64, 64] strides = [0, 32768, 64, 1])
        aie.end
      } {issue_token = true, iteration_t = 0 : index}
      aiex.dma_start_task(%13)
      %14 = aiex.dma_configure_task_for @of_10_mem_4 {
        aie.dma_bd(%arg3 : memref<2048x64xbf16> offset = 16384 len = 16384 sizes = [1, 4, 64, 64] strides = [0, 32768, 64, 1])
        aie.end
      } {issue_token = true, iteration_t = 0 : index}
      aiex.dma_start_task(%14)
      %15 = aiex.dma_configure_task_for @of_10_mem_5 {
        aie.dma_bd(%arg3 : memref<2048x64xbf16> offset = 20480 len = 16384 sizes = [1, 4, 64, 64] strides = [0, 32768, 64, 1])
        aie.end
      } {issue_token = true, iteration_t = 0 : index}
      aiex.dma_start_task(%15)
      %16 = aiex.dma_configure_task_for @of_10_mem_6 {
        aie.dma_bd(%arg3 : memref<2048x64xbf16> offset = 24576 len = 16384 sizes = [1, 4, 64, 64] strides = [0, 32768, 64, 1])
        aie.end
      } {issue_token = true, iteration_t = 0 : index}
      aiex.dma_start_task(%16)
      %17 = aiex.dma_configure_task_for @of_10_mem_7 {
        aie.dma_bd(%arg3 : memref<2048x64xbf16> offset = 28672 len = 16384 sizes = [1, 4, 64, 64] strides = [0, 32768, 64, 1])
        aie.end
      } {issue_token = true, iteration_t = 0 : index}
      aiex.dma_start_task(%17)
      %18 = aiex.dma_configure_task_for @of_1_mem {
        aie.dma_bd(%arg1 : memref<64x2048xbf16> offset = 64 len = 4096 sizes = [2, 1, 64, 64] strides = [0, 0, 2048, 1])
        aie.end
      } {issue_token = true, iteration_t = 16 : index, repeat_count = 1 : i32}
      aiex.dma_start_task(%18)
      %19 = aiex.dma_configure_task_for @of_2_mem {
        aie.dma_bd(%arg2 : memref<2048x64xbf16> offset = 4096 len = 4096 sizes = [2, 1, 64, 64] strides = [0, 0, 64, 1])
        aie.end
      } {issue_token = true, iteration_t = 16 : index, repeat_count = 1 : i32}
      aiex.dma_start_task(%19)
      aiex.dma_await_task(%8)
      %20 = aiex.dma_configure_task_for @of_1_mem {
        aie.dma_bd(%arg1 : memref<64x2048xbf16> offset = 128 len = 4096 sizes = [2, 1, 64, 64] strides = [0, 0, 2048, 1])
        aie.end
      } {issue_token = true, iteration_t = 32 : index, repeat_count = 1 : i32}
      aiex.dma_start_task(%20)
      aiex.dma_await_task(%9)
      %21 = aiex.dma_configure_task_for @of_2_mem {
        aie.dma_bd(%arg2 : memref<2048x64xbf16> offset = 8192 len = 4096 sizes = [2, 1, 64, 64] strides = [0, 0, 64, 1])
        aie.end
      } {issue_token = true, iteration_t = 32 : index, repeat_count = 1 : i32}
      aiex.dma_start_task(%21)
      aiex.dma_await_task(%18)
      %22 = aiex.dma_configure_task_for @of_1_mem {
        aie.dma_bd(%arg1 : memref<64x2048xbf16> offset = 192 len = 4096 sizes = [2, 1, 64, 64] strides = [0, 0, 2048, 1])
        aie.end
      } {issue_token = true, iteration_t = 48 : index, repeat_count = 1 : i32}
      aiex.dma_start_task(%22)
      aiex.dma_await_task(%19)
      %23 = aiex.dma_configure_task_for @of_2_mem {
        aie.dma_bd(%arg2 : memref<2048x64xbf16> offset = 12288 len = 4096 sizes = [2, 1, 64, 64] strides = [0, 0, 64, 1])
        aie.end
      } {issue_token = true, iteration_t = 48 : index, repeat_count = 1 : i32}
      aiex.dma_start_task(%23)
      aiex.dma_await_task(%20)
      %24 = aiex.dma_configure_task_for @of_1_mem {
        aie.dma_bd(%arg1 : memref<64x2048xbf16> offset = 256 len = 4096 sizes = [2, 1, 64, 64] strides = [0, 0, 2048, 1])
        aie.end
      } {issue_token = true, iteration_t = 64 : index, repeat_count = 1 : i32}
      aiex.dma_start_task(%24)
      aiex.dma_await_task(%21)
      %25 = aiex.dma_configure_task_for @of_2_mem {
        aie.dma_bd(%arg2 : memref<2048x64xbf16> offset = 16384 len = 4096 sizes = [2, 1, 64, 64] strides = [0, 0, 64, 1])
        aie.end
      } {issue_token = true, iteration_t = 64 : index, repeat_count = 1 : i32}
      aiex.dma_start_task(%25)
      aiex.dma_await_task(%22)
      %26 = aiex.dma_configure_task_for @of_1_mem {
        aie.dma_bd(%arg1 : memref<64x2048xbf16> offset = 320 len = 4096 sizes = [2, 1, 64, 64] strides = [0, 0, 2048, 1])
        aie.end
      } {issue_token = true, iteration_t = 80 : index, repeat_count = 1 : i32}
      aiex.dma_start_task(%26)
      aiex.dma_await_task(%23)
      %27 = aiex.dma_configure_task_for @of_2_mem {
        aie.dma_bd(%arg2 : memref<2048x64xbf16> offset = 20480 len = 4096 sizes = [2, 1, 64, 64] strides = [0, 0, 64, 1])
        aie.end
      } {issue_token = true, iteration_t = 80 : index, repeat_count = 1 : i32}
      aiex.dma_start_task(%27)
      aiex.dma_await_task(%24)
      %28 = aiex.dma_configure_task_for @of_1_mem {
        aie.dma_bd(%arg1 : memref<64x2048xbf16> offset = 384 len = 4096 sizes = [2, 1, 64, 64] strides = [0, 0, 2048, 1])
        aie.end
      } {issue_token = true, iteration_t = 96 : index, repeat_count = 1 : i32}
      aiex.dma_start_task(%28)
      aiex.dma_await_task(%25)
      %29 = aiex.dma_configure_task_for @of_2_mem {
        aie.dma_bd(%arg2 : memref<2048x64xbf16> offset = 24576 len = 4096 sizes = [2, 1, 64, 64] strides = [0, 0, 64, 1])
        aie.end
      } {issue_token = true, iteration_t = 96 : index, repeat_count = 1 : i32}
      aiex.dma_start_task(%29)
      aiex.dma_await_task(%26)
      %30 = aiex.dma_configure_task_for @of_1_mem {
        aie.dma_bd(%arg1 : memref<64x2048xbf16> offset = 448 len = 4096 sizes = [2, 1, 64, 64] strides = [0, 0, 2048, 1])
        aie.end
      } {issue_token = true, iteration_t = 112 : index, repeat_count = 1 : i32}
      aiex.dma_start_task(%30)
      aiex.dma_await_task(%27)
      %31 = aiex.dma_configure_task_for @of_2_mem {
        aie.dma_bd(%arg2 : memref<2048x64xbf16> offset = 28672 len = 4096 sizes = [2, 1, 64, 64] strides = [0, 0, 64, 1])
        aie.end
      } {issue_token = true, iteration_t = 112 : index, repeat_count = 1 : i32}
      aiex.dma_start_task(%31)
      aiex.dma_await_task(%28)
      %32 = aiex.dma_configure_task_for @of_1_mem {
        aie.dma_bd(%arg1 : memref<64x2048xbf16> offset = 512 len = 4096 sizes = [2, 1, 64, 64] strides = [0, 0, 2048, 1])
        aie.end
      } {issue_token = true, iteration_t = 128 : index, repeat_count = 1 : i32}
      aiex.dma_start_task(%32)
      aiex.dma_await_task(%29)
      %33 = aiex.dma_configure_task_for @of_2_mem {
        aie.dma_bd(%arg2 : memref<2048x64xbf16> offset = 32768 len = 4096 sizes = [2, 1, 64, 64] strides = [0, 0, 64, 1])
        aie.end
      } {issue_token = true, iteration_t = 128 : index, repeat_count = 1 : i32}
      aiex.dma_start_task(%33)
      aiex.dma_await_task(%30)
      %34 = aiex.dma_configure_task_for @of_1_mem {
        aie.dma_bd(%arg1 : memref<64x2048xbf16> offset = 576 len = 4096 sizes = [2, 1, 64, 64] strides = [0, 0, 2048, 1])
        aie.end
      } {issue_token = true, iteration_t = 144 : index, repeat_count = 1 : i32}
      aiex.dma_start_task(%34)
      aiex.dma_await_task(%31)
      %35 = aiex.dma_configure_task_for @of_2_mem {
        aie.dma_bd(%arg2 : memref<2048x64xbf16> offset = 36864 len = 4096 sizes = [2, 1, 64, 64] strides = [0, 0, 64, 1])
        aie.end
      } {issue_token = true, iteration_t = 144 : index, repeat_count = 1 : i32}
      aiex.dma_start_task(%35)
      aiex.dma_await_task(%32)
      %36 = aiex.dma_configure_task_for @of_1_mem {
        aie.dma_bd(%arg1 : memref<64x2048xbf16> offset = 640 len = 4096 sizes = [2, 1, 64, 64] strides = [0, 0, 2048, 1])
        aie.end
      } {issue_token = true, iteration_t = 160 : index, repeat_count = 1 : i32}
      aiex.dma_start_task(%36)
      aiex.dma_await_task(%33)
      %37 = aiex.dma_configure_task_for @of_2_mem {
        aie.dma_bd(%arg2 : memref<2048x64xbf16> offset = 40960 len = 4096 sizes = [2, 1, 64, 64] strides = [0, 0, 64, 1])
        aie.end
      } {issue_token = true, iteration_t = 160 : index, repeat_count = 1 : i32}
      aiex.dma_start_task(%37)
      aiex.dma_await_task(%34)
      %38 = aiex.dma_configure_task_for @of_1_mem {
        aie.dma_bd(%arg1 : memref<64x2048xbf16> offset = 704 len = 4096 sizes = [2, 1, 64, 64] strides = [0, 0, 2048, 1])
        aie.end
      } {issue_token = true, iteration_t = 176 : index, repeat_count = 1 : i32}
      aiex.dma_start_task(%38)
      aiex.dma_await_task(%35)
      %39 = aiex.dma_configure_task_for @of_2_mem {
        aie.dma_bd(%arg2 : memref<2048x64xbf16> offset = 45056 len = 4096 sizes = [2, 1, 64, 64] strides = [0, 0, 64, 1])
        aie.end
      } {issue_token = true, iteration_t = 176 : index, repeat_count = 1 : i32}
      aiex.dma_start_task(%39)
      aiex.dma_await_task(%36)
      %40 = aiex.dma_configure_task_for @of_1_mem {
        aie.dma_bd(%arg1 : memref<64x2048xbf16> offset = 768 len = 4096 sizes = [2, 1, 64, 64] strides = [0, 0, 2048, 1])
        aie.end
      } {issue_token = true, iteration_t = 192 : index, repeat_count = 1 : i32}
      aiex.dma_start_task(%40)
      aiex.dma_await_task(%37)
      %41 = aiex.dma_configure_task_for @of_2_mem {
        aie.dma_bd(%arg2 : memref<2048x64xbf16> offset = 49152 len = 4096 sizes = [2, 1, 64, 64] strides = [0, 0, 64, 1])
        aie.end
      } {issue_token = true, iteration_t = 192 : index, repeat_count = 1 : i32}
      aiex.dma_start_task(%41)
      aiex.dma_await_task(%38)
      %42 = aiex.dma_configure_task_for @of_1_mem {
        aie.dma_bd(%arg1 : memref<64x2048xbf16> offset = 832 len = 4096 sizes = [2, 1, 64, 64] strides = [0, 0, 2048, 1])
        aie.end
      } {issue_token = true, iteration_t = 208 : index, repeat_count = 1 : i32}
      aiex.dma_start_task(%42)
      aiex.dma_await_task(%39)
      %43 = aiex.dma_configure_task_for @of_2_mem {
        aie.dma_bd(%arg2 : memref<2048x64xbf16> offset = 53248 len = 4096 sizes = [2, 1, 64, 64] strides = [0, 0, 64, 1])
        aie.end
      } {issue_token = true, iteration_t = 208 : index, repeat_count = 1 : i32}
      aiex.dma_start_task(%43)
      aiex.dma_await_task(%40)
      %44 = aiex.dma_configure_task_for @of_1_mem {
        aie.dma_bd(%arg1 : memref<64x2048xbf16> offset = 896 len = 4096 sizes = [2, 1, 64, 64] strides = [0, 0, 2048, 1])
        aie.end
      } {issue_token = true, iteration_t = 224 : index, repeat_count = 1 : i32}
      aiex.dma_start_task(%44)
      aiex.dma_await_task(%41)
      %45 = aiex.dma_configure_task_for @of_2_mem {
        aie.dma_bd(%arg2 : memref<2048x64xbf16> offset = 57344 len = 4096 sizes = [2, 1, 64, 64] strides = [0, 0, 64, 1])
        aie.end
      } {issue_token = true, iteration_t = 224 : index, repeat_count = 1 : i32}
      aiex.dma_start_task(%45)
      aiex.dma_await_task(%42)
      %46 = aiex.dma_configure_task_for @of_1_mem {
        aie.dma_bd(%arg1 : memref<64x2048xbf16> offset = 960 len = 4096 sizes = [2, 1, 64, 64] strides = [0, 0, 2048, 1])
        aie.end
      } {issue_token = true, iteration_t = 240 : index, repeat_count = 1 : i32}
      aiex.dma_start_task(%46)
      aiex.dma_await_task(%43)
      %47 = aiex.dma_configure_task_for @of_2_mem {
        aie.dma_bd(%arg2 : memref<2048x64xbf16> offset = 61440 len = 4096 sizes = [2, 1, 64, 64] strides = [0, 0, 64, 1])
        aie.end
      } {issue_token = true, iteration_t = 240 : index, repeat_count = 1 : i32}
      aiex.dma_start_task(%47)
      aiex.dma_await_task(%44)
      %48 = aiex.dma_configure_task_for @of_1_mem {
        aie.dma_bd(%arg1 : memref<64x2048xbf16> offset = 1024 len = 4096 sizes = [2, 1, 64, 64] strides = [0, 0, 2048, 1])
        aie.end
      } {issue_token = true, iteration_t = 256 : index, repeat_count = 1 : i32}
      aiex.dma_start_task(%48)
      aiex.dma_await_task(%45)
      %49 = aiex.dma_configure_task_for @of_2_mem {
        aie.dma_bd(%arg2 : memref<2048x64xbf16> offset = 65536 len = 4096 sizes = [2, 1, 64, 64] strides = [0, 0, 64, 1])
        aie.end
      } {issue_token = true, iteration_t = 256 : index, repeat_count = 1 : i32}
      aiex.dma_start_task(%49)
      aiex.dma_await_task(%46)
      %50 = aiex.dma_configure_task_for @of_1_mem {
        aie.dma_bd(%arg1 : memref<64x2048xbf16> offset = 1088 len = 4096 sizes = [2, 1, 64, 64] strides = [0, 0, 2048, 1])
        aie.end
      } {issue_token = true, iteration_t = 272 : index, repeat_count = 1 : i32}
      aiex.dma_start_task(%50)
      aiex.dma_await_task(%47)
      %51 = aiex.dma_configure_task_for @of_2_mem {
        aie.dma_bd(%arg2 : memref<2048x64xbf16> offset = 69632 len = 4096 sizes = [2, 1, 64, 64] strides = [0, 0, 64, 1])
        aie.end
      } {issue_token = true, iteration_t = 272 : index, repeat_count = 1 : i32}
      aiex.dma_start_task(%51)
      aiex.dma_await_task(%48)
      %52 = aiex.dma_configure_task_for @of_1_mem {
        aie.dma_bd(%arg1 : memref<64x2048xbf16> offset = 1152 len = 4096 sizes = [2, 1, 64, 64] strides = [0, 0, 2048, 1])
        aie.end
      } {issue_token = true, iteration_t = 288 : index, repeat_count = 1 : i32}
      aiex.dma_start_task(%52)
      aiex.dma_await_task(%49)
      %53 = aiex.dma_configure_task_for @of_2_mem {
        aie.dma_bd(%arg2 : memref<2048x64xbf16> offset = 73728 len = 4096 sizes = [2, 1, 64, 64] strides = [0, 0, 64, 1])
        aie.end
      } {issue_token = true, iteration_t = 288 : index, repeat_count = 1 : i32}
      aiex.dma_start_task(%53)
      aiex.dma_await_task(%50)
      %54 = aiex.dma_configure_task_for @of_1_mem {
        aie.dma_bd(%arg1 : memref<64x2048xbf16> offset = 1216 len = 4096 sizes = [2, 1, 64, 64] strides = [0, 0, 2048, 1])
        aie.end
      } {issue_token = true, iteration_t = 304 : index, repeat_count = 1 : i32}
      aiex.dma_start_task(%54)
      aiex.dma_await_task(%51)
      %55 = aiex.dma_configure_task_for @of_2_mem {
        aie.dma_bd(%arg2 : memref<2048x64xbf16> offset = 77824 len = 4096 sizes = [2, 1, 64, 64] strides = [0, 0, 64, 1])
        aie.end
      } {issue_token = true, iteration_t = 304 : index, repeat_count = 1 : i32}
      aiex.dma_start_task(%55)
      aiex.dma_await_task(%52)
      %56 = aiex.dma_configure_task_for @of_1_mem {
        aie.dma_bd(%arg1 : memref<64x2048xbf16> offset = 1280 len = 4096 sizes = [2, 1, 64, 64] strides = [0, 0, 2048, 1])
        aie.end
      } {issue_token = true, iteration_t = 320 : index, repeat_count = 1 : i32}
      aiex.dma_start_task(%56)
      aiex.dma_await_task(%53)
      %57 = aiex.dma_configure_task_for @of_2_mem {
        aie.dma_bd(%arg2 : memref<2048x64xbf16> offset = 81920 len = 4096 sizes = [2, 1, 64, 64] strides = [0, 0, 64, 1])
        aie.end
      } {issue_token = true, iteration_t = 320 : index, repeat_count = 1 : i32}
      aiex.dma_start_task(%57)
      aiex.dma_await_task(%54)
      %58 = aiex.dma_configure_task_for @of_1_mem {
        aie.dma_bd(%arg1 : memref<64x2048xbf16> offset = 1344 len = 4096 sizes = [2, 1, 64, 64] strides = [0, 0, 2048, 1])
        aie.end
      } {issue_token = true, iteration_t = 336 : index, repeat_count = 1 : i32}
      aiex.dma_start_task(%58)
      aiex.dma_await_task(%55)
      %59 = aiex.dma_configure_task_for @of_2_mem {
        aie.dma_bd(%arg2 : memref<2048x64xbf16> offset = 86016 len = 4096 sizes = [2, 1, 64, 64] strides = [0, 0, 64, 1])
        aie.end
      } {issue_token = true, iteration_t = 336 : index, repeat_count = 1 : i32}
      aiex.dma_start_task(%59)
      aiex.dma_await_task(%56)
      %60 = aiex.dma_configure_task_for @of_1_mem {
        aie.dma_bd(%arg1 : memref<64x2048xbf16> offset = 1408 len = 4096 sizes = [2, 1, 64, 64] strides = [0, 0, 2048, 1])
        aie.end
      } {issue_token = true, iteration_t = 352 : index, repeat_count = 1 : i32}
      aiex.dma_start_task(%60)
      aiex.dma_await_task(%57)
      %61 = aiex.dma_configure_task_for @of_2_mem {
        aie.dma_bd(%arg2 : memref<2048x64xbf16> offset = 90112 len = 4096 sizes = [2, 1, 64, 64] strides = [0, 0, 64, 1])
        aie.end
      } {issue_token = true, iteration_t = 352 : index, repeat_count = 1 : i32}
      aiex.dma_start_task(%61)
      aiex.dma_await_task(%58)
      %62 = aiex.dma_configure_task_for @of_1_mem {
        aie.dma_bd(%arg1 : memref<64x2048xbf16> offset = 1472 len = 4096 sizes = [2, 1, 64, 64] strides = [0, 0, 2048, 1])
        aie.end
      } {issue_token = true, iteration_t = 368 : index, repeat_count = 1 : i32}
      aiex.dma_start_task(%62)
      aiex.dma_await_task(%59)
      %63 = aiex.dma_configure_task_for @of_2_mem {
        aie.dma_bd(%arg2 : memref<2048x64xbf16> offset = 94208 len = 4096 sizes = [2, 1, 64, 64] strides = [0, 0, 64, 1])
        aie.end
      } {issue_token = true, iteration_t = 368 : index, repeat_count = 1 : i32}
      aiex.dma_start_task(%63)
      aiex.dma_await_task(%60)
      %64 = aiex.dma_configure_task_for @of_1_mem {
        aie.dma_bd(%arg1 : memref<64x2048xbf16> offset = 1536 len = 4096 sizes = [2, 1, 64, 64] strides = [0, 0, 2048, 1])
        aie.end
      } {issue_token = true, iteration_t = 384 : index, repeat_count = 1 : i32}
      aiex.dma_start_task(%64)
      aiex.dma_await_task(%61)
      %65 = aiex.dma_configure_task_for @of_2_mem {
        aie.dma_bd(%arg2 : memref<2048x64xbf16> offset = 98304 len = 4096 sizes = [2, 1, 64, 64] strides = [0, 0, 64, 1])
        aie.end
      } {issue_token = true, iteration_t = 384 : index, repeat_count = 1 : i32}
      aiex.dma_start_task(%65)
      aiex.dma_await_task(%62)
      %66 = aiex.dma_configure_task_for @of_1_mem {
        aie.dma_bd(%arg1 : memref<64x2048xbf16> offset = 1600 len = 4096 sizes = [2, 1, 64, 64] strides = [0, 0, 2048, 1])
        aie.end
      } {issue_token = true, iteration_t = 400 : index, repeat_count = 1 : i32}
      aiex.dma_start_task(%66)
      aiex.dma_await_task(%63)
      %67 = aiex.dma_configure_task_for @of_2_mem {
        aie.dma_bd(%arg2 : memref<2048x64xbf16> offset = 102400 len = 4096 sizes = [2, 1, 64, 64] strides = [0, 0, 64, 1])
        aie.end
      } {issue_token = true, iteration_t = 400 : index, repeat_count = 1 : i32}
      aiex.dma_start_task(%67)
      aiex.dma_await_task(%64)
      %68 = aiex.dma_configure_task_for @of_1_mem {
        aie.dma_bd(%arg1 : memref<64x2048xbf16> offset = 1664 len = 4096 sizes = [2, 1, 64, 64] strides = [0, 0, 2048, 1])
        aie.end
      } {issue_token = true, iteration_t = 416 : index, repeat_count = 1 : i32}
      aiex.dma_start_task(%68)
      aiex.dma_await_task(%65)
      %69 = aiex.dma_configure_task_for @of_2_mem {
        aie.dma_bd(%arg2 : memref<2048x64xbf16> offset = 106496 len = 4096 sizes = [2, 1, 64, 64] strides = [0, 0, 64, 1])
        aie.end
      } {issue_token = true, iteration_t = 416 : index, repeat_count = 1 : i32}
      aiex.dma_start_task(%69)
      aiex.dma_await_task(%66)
      %70 = aiex.dma_configure_task_for @of_1_mem {
        aie.dma_bd(%arg1 : memref<64x2048xbf16> offset = 1728 len = 4096 sizes = [2, 1, 64, 64] strides = [0, 0, 2048, 1])
        aie.end
      } {issue_token = true, iteration_t = 432 : index, repeat_count = 1 : i32}
      aiex.dma_start_task(%70)
      aiex.dma_await_task(%67)
      %71 = aiex.dma_configure_task_for @of_2_mem {
        aie.dma_bd(%arg2 : memref<2048x64xbf16> offset = 110592 len = 4096 sizes = [2, 1, 64, 64] strides = [0, 0, 64, 1])
        aie.end
      } {issue_token = true, iteration_t = 432 : index, repeat_count = 1 : i32}
      aiex.dma_start_task(%71)
      aiex.dma_await_task(%68)
      %72 = aiex.dma_configure_task_for @of_1_mem {
        aie.dma_bd(%arg1 : memref<64x2048xbf16> offset = 1792 len = 4096 sizes = [2, 1, 64, 64] strides = [0, 0, 2048, 1])
        aie.end
      } {issue_token = true, iteration_t = 448 : index, repeat_count = 1 : i32}
      aiex.dma_start_task(%72)
      aiex.dma_await_task(%69)
      %73 = aiex.dma_configure_task_for @of_2_mem {
        aie.dma_bd(%arg2 : memref<2048x64xbf16> offset = 114688 len = 4096 sizes = [2, 1, 64, 64] strides = [0, 0, 64, 1])
        aie.end
      } {issue_token = true, iteration_t = 448 : index, repeat_count = 1 : i32}
      aiex.dma_start_task(%73)
      aiex.dma_await_task(%70)
      %74 = aiex.dma_configure_task_for @of_1_mem {
        aie.dma_bd(%arg1 : memref<64x2048xbf16> offset = 1856 len = 4096 sizes = [2, 1, 64, 64] strides = [0, 0, 2048, 1])
        aie.end
      } {issue_token = true, iteration_t = 464 : index, repeat_count = 1 : i32}
      aiex.dma_start_task(%74)
      aiex.dma_await_task(%71)
      %75 = aiex.dma_configure_task_for @of_2_mem {
        aie.dma_bd(%arg2 : memref<2048x64xbf16> offset = 118784 len = 4096 sizes = [2, 1, 64, 64] strides = [0, 0, 64, 1])
        aie.end
      } {issue_token = true, iteration_t = 464 : index, repeat_count = 1 : i32}
      aiex.dma_start_task(%75)
      aiex.dma_await_task(%72)
      %76 = aiex.dma_configure_task_for @of_1_mem {
        aie.dma_bd(%arg1 : memref<64x2048xbf16> offset = 1920 len = 4096 sizes = [2, 1, 64, 64] strides = [0, 0, 2048, 1])
        aie.end
      } {issue_token = true, iteration_t = 480 : index, repeat_count = 1 : i32}
      aiex.dma_start_task(%76)
      aiex.dma_await_task(%73)
      %77 = aiex.dma_configure_task_for @of_2_mem {
        aie.dma_bd(%arg2 : memref<2048x64xbf16> offset = 122880 len = 4096 sizes = [2, 1, 64, 64] strides = [0, 0, 64, 1])
        aie.end
      } {issue_token = true, iteration_t = 480 : index, repeat_count = 1 : i32}
      aiex.dma_start_task(%77)
      aiex.dma_await_task(%74)
      %78 = aiex.dma_configure_task_for @of_1_mem {
        aie.dma_bd(%arg1 : memref<64x2048xbf16> offset = 1984 len = 4096 sizes = [2, 1, 64, 64] strides = [0, 0, 2048, 1])
        aie.end
      } {issue_token = true, iteration_t = 496 : index, repeat_count = 1 : i32}
      aiex.dma_start_task(%78)
      aiex.dma_await_task(%75)
      %79 = aiex.dma_configure_task_for @of_2_mem {
        aie.dma_bd(%arg2 : memref<2048x64xbf16> offset = 126976 len = 4096 sizes = [2, 1, 64, 64] strides = [0, 0, 64, 1])
        aie.end
      } {issue_token = true, iteration_t = 496 : index, repeat_count = 1 : i32}
      aiex.dma_start_task(%79)
      aiex.dma_await_task(%76)
      %80 = aiex.dma_configure_task_for @of_1_mem {
        aie.dma_bd(%arg1 : memref<64x2048xbf16> offset = 0 len = 4096 sizes = [2, 1, 64, 64] strides = [0, 0, 2048, 1])
        aie.end
      } {issue_token = true, iteration_t = 512 : index, repeat_count = 1 : i32}
      aiex.dma_start_task(%80)
      aiex.dma_await_task(%77)
      %81 = aiex.dma_configure_task_for @of_2_mem {
        aie.dma_bd(%arg2 : memref<2048x64xbf16> offset = 0 len = 4096 sizes = [2, 1, 64, 64] strides = [0, 0, 64, 1])
        aie.end
      } {issue_token = true, iteration_t = 512 : index, repeat_count = 1 : i32}
      aiex.dma_start_task(%81)
      aiex.dma_await_task(%78)
      %82 = aiex.dma_configure_task_for @of_1_mem {
        aie.dma_bd(%arg1 : memref<64x2048xbf16> offset = 64 len = 4096 sizes = [2, 1, 64, 64] strides = [0, 0, 2048, 1])
        aie.end
      } {issue_token = true, iteration_t = 528 : index, repeat_count = 1 : i32}
      aiex.dma_start_task(%82)
      aiex.dma_await_task(%79)
      %83 = aiex.dma_configure_task_for @of_2_mem {
        aie.dma_bd(%arg2 : memref<2048x64xbf16> offset = 4096 len = 4096 sizes = [2, 1, 64, 64] strides = [0, 0, 64, 1])
        aie.end
      } {issue_token = true, iteration_t = 528 : index, repeat_count = 1 : i32}
      aiex.dma_start_task(%83)
      aiex.dma_await_task(%80)
      %84 = aiex.dma_configure_task_for @of_1_mem {
        aie.dma_bd(%arg1 : memref<64x2048xbf16> offset = 128 len = 4096 sizes = [2, 1, 64, 64] strides = [0, 0, 2048, 1])
        aie.end
      } {issue_token = true, iteration_t = 544 : index, repeat_count = 1 : i32}
      aiex.dma_start_task(%84)
      aiex.dma_await_task(%81)
      %85 = aiex.dma_configure_task_for @of_2_mem {
        aie.dma_bd(%arg2 : memref<2048x64xbf16> offset = 8192 len = 4096 sizes = [2, 1, 64, 64] strides = [0, 0, 64, 1])
        aie.end
      } {issue_token = true, iteration_t = 544 : index, repeat_count = 1 : i32}
      aiex.dma_start_task(%85)
      aiex.dma_await_task(%82)
      %86 = aiex.dma_configure_task_for @of_1_mem {
        aie.dma_bd(%arg1 : memref<64x2048xbf16> offset = 192 len = 4096 sizes = [2, 1, 64, 64] strides = [0, 0, 2048, 1])
        aie.end
      } {issue_token = true, iteration_t = 560 : index, repeat_count = 1 : i32}
      aiex.dma_start_task(%86)
      aiex.dma_await_task(%83)
      %87 = aiex.dma_configure_task_for @of_2_mem {
        aie.dma_bd(%arg2 : memref<2048x64xbf16> offset = 12288 len = 4096 sizes = [2, 1, 64, 64] strides = [0, 0, 64, 1])
        aie.end
      } {issue_token = true, iteration_t = 560 : index, repeat_count = 1 : i32}
      aiex.dma_start_task(%87)
      aiex.dma_await_task(%84)
      %88 = aiex.dma_configure_task_for @of_1_mem {
        aie.dma_bd(%arg1 : memref<64x2048xbf16> offset = 256 len = 4096 sizes = [2, 1, 64, 64] strides = [0, 0, 2048, 1])
        aie.end
      } {issue_token = true, iteration_t = 576 : index, repeat_count = 1 : i32}
      aiex.dma_start_task(%88)
      aiex.dma_await_task(%85)
      %89 = aiex.dma_configure_task_for @of_2_mem {
        aie.dma_bd(%arg2 : memref<2048x64xbf16> offset = 16384 len = 4096 sizes = [2, 1, 64, 64] strides = [0, 0, 64, 1])
        aie.end
      } {issue_token = true, iteration_t = 576 : index, repeat_count = 1 : i32}
      aiex.dma_start_task(%89)
      aiex.dma_await_task(%86)
      %90 = aiex.dma_configure_task_for @of_1_mem {
        aie.dma_bd(%arg1 : memref<64x2048xbf16> offset = 320 len = 4096 sizes = [2, 1, 64, 64] strides = [0, 0, 2048, 1])
        aie.end
      } {issue_token = true, iteration_t = 592 : index, repeat_count = 1 : i32}
      aiex.dma_start_task(%90)
      aiex.dma_await_task(%87)
      %91 = aiex.dma_configure_task_for @of_2_mem {
        aie.dma_bd(%arg2 : memref<2048x64xbf16> offset = 20480 len = 4096 sizes = [2, 1, 64, 64] strides = [0, 0, 64, 1])
        aie.end
      } {issue_token = true, iteration_t = 592 : index, repeat_count = 1 : i32}
      aiex.dma_start_task(%91)
      aiex.dma_await_task(%88)
      %92 = aiex.dma_configure_task_for @of_1_mem {
        aie.dma_bd(%arg1 : memref<64x2048xbf16> offset = 384 len = 4096 sizes = [2, 1, 64, 64] strides = [0, 0, 2048, 1])
        aie.end
      } {issue_token = true, iteration_t = 608 : index, repeat_count = 1 : i32}
      aiex.dma_start_task(%92)
      aiex.dma_await_task(%89)
      %93 = aiex.dma_configure_task_for @of_2_mem {
        aie.dma_bd(%arg2 : memref<2048x64xbf16> offset = 24576 len = 4096 sizes = [2, 1, 64, 64] strides = [0, 0, 64, 1])
        aie.end
      } {issue_token = true, iteration_t = 608 : index, repeat_count = 1 : i32}
      aiex.dma_start_task(%93)
      aiex.dma_await_task(%90)
      %94 = aiex.dma_configure_task_for @of_1_mem {
        aie.dma_bd(%arg1 : memref<64x2048xbf16> offset = 448 len = 4096 sizes = [2, 1, 64, 64] strides = [0, 0, 2048, 1])
        aie.end
      } {issue_token = true, iteration_t = 624 : index, repeat_count = 1 : i32}
      aiex.dma_start_task(%94)
      aiex.dma_await_task(%91)
      %95 = aiex.dma_configure_task_for @of_2_mem {
        aie.dma_bd(%arg2 : memref<2048x64xbf16> offset = 28672 len = 4096 sizes = [2, 1, 64, 64] strides = [0, 0, 64, 1])
        aie.end
      } {issue_token = true, iteration_t = 624 : index, repeat_count = 1 : i32}
      aiex.dma_start_task(%95)
      aiex.dma_await_task(%92)
      %96 = aiex.dma_configure_task_for @of_1_mem {
        aie.dma_bd(%arg1 : memref<64x2048xbf16> offset = 512 len = 4096 sizes = [2, 1, 64, 64] strides = [0, 0, 2048, 1])
        aie.end
      } {issue_token = true, iteration_t = 640 : index, repeat_count = 1 : i32}
      aiex.dma_start_task(%96)
      aiex.dma_await_task(%93)
      %97 = aiex.dma_configure_task_for @of_2_mem {
        aie.dma_bd(%arg2 : memref<2048x64xbf16> offset = 32768 len = 4096 sizes = [2, 1, 64, 64] strides = [0, 0, 64, 1])
        aie.end
      } {issue_token = true, iteration_t = 640 : index, repeat_count = 1 : i32}
      aiex.dma_start_task(%97)
      aiex.dma_await_task(%94)
      %98 = aiex.dma_configure_task_for @of_1_mem {
        aie.dma_bd(%arg1 : memref<64x2048xbf16> offset = 576 len = 4096 sizes = [2, 1, 64, 64] strides = [0, 0, 2048, 1])
        aie.end
      } {issue_token = true, iteration_t = 656 : index, repeat_count = 1 : i32}
      aiex.dma_start_task(%98)
      aiex.dma_await_task(%95)
      %99 = aiex.dma_configure_task_for @of_2_mem {
        aie.dma_bd(%arg2 : memref<2048x64xbf16> offset = 36864 len = 4096 sizes = [2, 1, 64, 64] strides = [0, 0, 64, 1])
        aie.end
      } {issue_token = true, iteration_t = 656 : index, repeat_count = 1 : i32}
      aiex.dma_start_task(%99)
      aiex.dma_await_task(%96)
      %100 = aiex.dma_configure_task_for @of_1_mem {
        aie.dma_bd(%arg1 : memref<64x2048xbf16> offset = 640 len = 4096 sizes = [2, 1, 64, 64] strides = [0, 0, 2048, 1])
        aie.end
      } {issue_token = true, iteration_t = 672 : index, repeat_count = 1 : i32}
      aiex.dma_start_task(%100)
      aiex.dma_await_task(%97)
      %101 = aiex.dma_configure_task_for @of_2_mem {
        aie.dma_bd(%arg2 : memref<2048x64xbf16> offset = 40960 len = 4096 sizes = [2, 1, 64, 64] strides = [0, 0, 64, 1])
        aie.end
      } {issue_token = true, iteration_t = 672 : index, repeat_count = 1 : i32}
      aiex.dma_start_task(%101)
      aiex.dma_await_task(%98)
      %102 = aiex.dma_configure_task_for @of_1_mem {
        aie.dma_bd(%arg1 : memref<64x2048xbf16> offset = 704 len = 4096 sizes = [2, 1, 64, 64] strides = [0, 0, 2048, 1])
        aie.end
      } {issue_token = true, iteration_t = 688 : index, repeat_count = 1 : i32}
      aiex.dma_start_task(%102)
      aiex.dma_await_task(%99)
      %103 = aiex.dma_configure_task_for @of_2_mem {
        aie.dma_bd(%arg2 : memref<2048x64xbf16> offset = 45056 len = 4096 sizes = [2, 1, 64, 64] strides = [0, 0, 64, 1])
        aie.end
      } {issue_token = true, iteration_t = 688 : index, repeat_count = 1 : i32}
      aiex.dma_start_task(%103)
      aiex.dma_await_task(%100)
      %104 = aiex.dma_configure_task_for @of_1_mem {
        aie.dma_bd(%arg1 : memref<64x2048xbf16> offset = 768 len = 4096 sizes = [2, 1, 64, 64] strides = [0, 0, 2048, 1])
        aie.end
      } {issue_token = true, iteration_t = 704 : index, repeat_count = 1 : i32}
      aiex.dma_start_task(%104)
      aiex.dma_await_task(%101)
      %105 = aiex.dma_configure_task_for @of_2_mem {
        aie.dma_bd(%arg2 : memref<2048x64xbf16> offset = 49152 len = 4096 sizes = [2, 1, 64, 64] strides = [0, 0, 64, 1])
        aie.end
      } {issue_token = true, iteration_t = 704 : index, repeat_count = 1 : i32}
      aiex.dma_start_task(%105)
      aiex.dma_await_task(%102)
      %106 = aiex.dma_configure_task_for @of_1_mem {
        aie.dma_bd(%arg1 : memref<64x2048xbf16> offset = 832 len = 4096 sizes = [2, 1, 64, 64] strides = [0, 0, 2048, 1])
        aie.end
      } {issue_token = true, iteration_t = 720 : index, repeat_count = 1 : i32}
      aiex.dma_start_task(%106)
      aiex.dma_await_task(%103)
      %107 = aiex.dma_configure_task_for @of_2_mem {
        aie.dma_bd(%arg2 : memref<2048x64xbf16> offset = 53248 len = 4096 sizes = [2, 1, 64, 64] strides = [0, 0, 64, 1])
        aie.end
      } {issue_token = true, iteration_t = 720 : index, repeat_count = 1 : i32}
      aiex.dma_start_task(%107)
      aiex.dma_await_task(%104)
      %108 = aiex.dma_configure_task_for @of_1_mem {
        aie.dma_bd(%arg1 : memref<64x2048xbf16> offset = 896 len = 4096 sizes = [2, 1, 64, 64] strides = [0, 0, 2048, 1])
        aie.end
      } {issue_token = true, iteration_t = 736 : index, repeat_count = 1 : i32}
      aiex.dma_start_task(%108)
      aiex.dma_await_task(%105)
      %109 = aiex.dma_configure_task_for @of_2_mem {
        aie.dma_bd(%arg2 : memref<2048x64xbf16> offset = 57344 len = 4096 sizes = [2, 1, 64, 64] strides = [0, 0, 64, 1])
        aie.end
      } {issue_token = true, iteration_t = 736 : index, repeat_count = 1 : i32}
      aiex.dma_start_task(%109)
      aiex.dma_await_task(%106)
      %110 = aiex.dma_configure_task_for @of_1_mem {
        aie.dma_bd(%arg1 : memref<64x2048xbf16> offset = 960 len = 4096 sizes = [2, 1, 64, 64] strides = [0, 0, 2048, 1])
        aie.end
      } {issue_token = true, iteration_t = 752 : index, repeat_count = 1 : i32}
      aiex.dma_start_task(%110)
      aiex.dma_await_task(%107)
      %111 = aiex.dma_configure_task_for @of_2_mem {
        aie.dma_bd(%arg2 : memref<2048x64xbf16> offset = 61440 len = 4096 sizes = [2, 1, 64, 64] strides = [0, 0, 64, 1])
        aie.end
      } {issue_token = true, iteration_t = 752 : index, repeat_count = 1 : i32}
      aiex.dma_start_task(%111)
      aiex.dma_await_task(%108)
      %112 = aiex.dma_configure_task_for @of_1_mem {
        aie.dma_bd(%arg1 : memref<64x2048xbf16> offset = 1024 len = 4096 sizes = [2, 1, 64, 64] strides = [0, 0, 2048, 1])
        aie.end
      } {issue_token = true, iteration_t = 768 : index, repeat_count = 1 : i32}
      aiex.dma_start_task(%112)
      aiex.dma_await_task(%109)
      %113 = aiex.dma_configure_task_for @of_2_mem {
        aie.dma_bd(%arg2 : memref<2048x64xbf16> offset = 65536 len = 4096 sizes = [2, 1, 64, 64] strides = [0, 0, 64, 1])
        aie.end
      } {issue_token = true, iteration_t = 768 : index, repeat_count = 1 : i32}
      aiex.dma_start_task(%113)
      aiex.dma_await_task(%110)
      %114 = aiex.dma_configure_task_for @of_1_mem {
        aie.dma_bd(%arg1 : memref<64x2048xbf16> offset = 1088 len = 4096 sizes = [2, 1, 64, 64] strides = [0, 0, 2048, 1])
        aie.end
      } {issue_token = true, iteration_t = 784 : index, repeat_count = 1 : i32}
      aiex.dma_start_task(%114)
      aiex.dma_await_task(%111)
      %115 = aiex.dma_configure_task_for @of_2_mem {
        aie.dma_bd(%arg2 : memref<2048x64xbf16> offset = 69632 len = 4096 sizes = [2, 1, 64, 64] strides = [0, 0, 64, 1])
        aie.end
      } {issue_token = true, iteration_t = 784 : index, repeat_count = 1 : i32}
      aiex.dma_start_task(%115)
      aiex.dma_await_task(%112)
      %116 = aiex.dma_configure_task_for @of_1_mem {
        aie.dma_bd(%arg1 : memref<64x2048xbf16> offset = 1152 len = 4096 sizes = [2, 1, 64, 64] strides = [0, 0, 2048, 1])
        aie.end
      } {issue_token = true, iteration_t = 800 : index, repeat_count = 1 : i32}
      aiex.dma_start_task(%116)
      aiex.dma_await_task(%113)
      %117 = aiex.dma_configure_task_for @of_2_mem {
        aie.dma_bd(%arg2 : memref<2048x64xbf16> offset = 73728 len = 4096 sizes = [2, 1, 64, 64] strides = [0, 0, 64, 1])
        aie.end
      } {issue_token = true, iteration_t = 800 : index, repeat_count = 1 : i32}
      aiex.dma_start_task(%117)
      aiex.dma_await_task(%114)
      %118 = aiex.dma_configure_task_for @of_1_mem {
        aie.dma_bd(%arg1 : memref<64x2048xbf16> offset = 1216 len = 4096 sizes = [2, 1, 64, 64] strides = [0, 0, 2048, 1])
        aie.end
      } {issue_token = true, iteration_t = 816 : index, repeat_count = 1 : i32}
      aiex.dma_start_task(%118)
      aiex.dma_await_task(%115)
      %119 = aiex.dma_configure_task_for @of_2_mem {
        aie.dma_bd(%arg2 : memref<2048x64xbf16> offset = 77824 len = 4096 sizes = [2, 1, 64, 64] strides = [0, 0, 64, 1])
        aie.end
      } {issue_token = true, iteration_t = 816 : index, repeat_count = 1 : i32}
      aiex.dma_start_task(%119)
      aiex.dma_await_task(%116)
      %120 = aiex.dma_configure_task_for @of_1_mem {
        aie.dma_bd(%arg1 : memref<64x2048xbf16> offset = 1280 len = 4096 sizes = [2, 1, 64, 64] strides = [0, 0, 2048, 1])
        aie.end
      } {issue_token = true, iteration_t = 832 : index, repeat_count = 1 : i32}
      aiex.dma_start_task(%120)
      aiex.dma_await_task(%117)
      %121 = aiex.dma_configure_task_for @of_2_mem {
        aie.dma_bd(%arg2 : memref<2048x64xbf16> offset = 81920 len = 4096 sizes = [2, 1, 64, 64] strides = [0, 0, 64, 1])
        aie.end
      } {issue_token = true, iteration_t = 832 : index, repeat_count = 1 : i32}
      aiex.dma_start_task(%121)
      aiex.dma_await_task(%118)
      %122 = aiex.dma_configure_task_for @of_1_mem {
        aie.dma_bd(%arg1 : memref<64x2048xbf16> offset = 1344 len = 4096 sizes = [2, 1, 64, 64] strides = [0, 0, 2048, 1])
        aie.end
      } {issue_token = true, iteration_t = 848 : index, repeat_count = 1 : i32}
      aiex.dma_start_task(%122)
      aiex.dma_await_task(%119)
      %123 = aiex.dma_configure_task_for @of_2_mem {
        aie.dma_bd(%arg2 : memref<2048x64xbf16> offset = 86016 len = 4096 sizes = [2, 1, 64, 64] strides = [0, 0, 64, 1])
        aie.end
      } {issue_token = true, iteration_t = 848 : index, repeat_count = 1 : i32}
      aiex.dma_start_task(%123)
      aiex.dma_await_task(%120)
      %124 = aiex.dma_configure_task_for @of_1_mem {
        aie.dma_bd(%arg1 : memref<64x2048xbf16> offset = 1408 len = 4096 sizes = [2, 1, 64, 64] strides = [0, 0, 2048, 1])
        aie.end
      } {issue_token = true, iteration_t = 864 : index, repeat_count = 1 : i32}
      aiex.dma_start_task(%124)
      aiex.dma_await_task(%121)
      %125 = aiex.dma_configure_task_for @of_2_mem {
        aie.dma_bd(%arg2 : memref<2048x64xbf16> offset = 90112 len = 4096 sizes = [2, 1, 64, 64] strides = [0, 0, 64, 1])
        aie.end
      } {issue_token = true, iteration_t = 864 : index, repeat_count = 1 : i32}
      aiex.dma_start_task(%125)
      aiex.dma_await_task(%122)
      %126 = aiex.dma_configure_task_for @of_1_mem {
        aie.dma_bd(%arg1 : memref<64x2048xbf16> offset = 1472 len = 4096 sizes = [2, 1, 64, 64] strides = [0, 0, 2048, 1])
        aie.end
      } {issue_token = true, iteration_t = 880 : index, repeat_count = 1 : i32}
      aiex.dma_start_task(%126)
      aiex.dma_await_task(%123)
      %127 = aiex.dma_configure_task_for @of_2_mem {
        aie.dma_bd(%arg2 : memref<2048x64xbf16> offset = 94208 len = 4096 sizes = [2, 1, 64, 64] strides = [0, 0, 64, 1])
        aie.end
      } {issue_token = true, iteration_t = 880 : index, repeat_count = 1 : i32}
      aiex.dma_start_task(%127)
      aiex.dma_await_task(%124)
      %128 = aiex.dma_configure_task_for @of_1_mem {
        aie.dma_bd(%arg1 : memref<64x2048xbf16> offset = 1536 len = 4096 sizes = [2, 1, 64, 64] strides = [0, 0, 2048, 1])
        aie.end
      } {issue_token = true, iteration_t = 896 : index, repeat_count = 1 : i32}
      aiex.dma_start_task(%128)
      aiex.dma_await_task(%125)
      %129 = aiex.dma_configure_task_for @of_2_mem {
        aie.dma_bd(%arg2 : memref<2048x64xbf16> offset = 98304 len = 4096 sizes = [2, 1, 64, 64] strides = [0, 0, 64, 1])
        aie.end
      } {issue_token = true, iteration_t = 896 : index, repeat_count = 1 : i32}
      aiex.dma_start_task(%129)
      aiex.dma_await_task(%126)
      %130 = aiex.dma_configure_task_for @of_1_mem {
        aie.dma_bd(%arg1 : memref<64x2048xbf16> offset = 1600 len = 4096 sizes = [2, 1, 64, 64] strides = [0, 0, 2048, 1])
        aie.end
      } {issue_token = true, iteration_t = 912 : index, repeat_count = 1 : i32}
      aiex.dma_start_task(%130)
      aiex.dma_await_task(%127)
      %131 = aiex.dma_configure_task_for @of_2_mem {
        aie.dma_bd(%arg2 : memref<2048x64xbf16> offset = 102400 len = 4096 sizes = [2, 1, 64, 64] strides = [0, 0, 64, 1])
        aie.end
      } {issue_token = true, iteration_t = 912 : index, repeat_count = 1 : i32}
      aiex.dma_start_task(%131)
      aiex.dma_await_task(%128)
      %132 = aiex.dma_configure_task_for @of_1_mem {
        aie.dma_bd(%arg1 : memref<64x2048xbf16> offset = 1664 len = 4096 sizes = [2, 1, 64, 64] strides = [0, 0, 2048, 1])
        aie.end
      } {issue_token = true, iteration_t = 928 : index, repeat_count = 1 : i32}
      aiex.dma_start_task(%132)
      aiex.dma_await_task(%129)
      %133 = aiex.dma_configure_task_for @of_2_mem {
        aie.dma_bd(%arg2 : memref<2048x64xbf16> offset = 106496 len = 4096 sizes = [2, 1, 64, 64] strides = [0, 0, 64, 1])
        aie.end
      } {issue_token = true, iteration_t = 928 : index, repeat_count = 1 : i32}
      aiex.dma_start_task(%133)
      aiex.dma_await_task(%130)
      %134 = aiex.dma_configure_task_for @of_1_mem {
        aie.dma_bd(%arg1 : memref<64x2048xbf16> offset = 1728 len = 4096 sizes = [2, 1, 64, 64] strides = [0, 0, 2048, 1])
        aie.end
      } {issue_token = true, iteration_t = 944 : index, repeat_count = 1 : i32}
      aiex.dma_start_task(%134)
      aiex.dma_await_task(%131)
      %135 = aiex.dma_configure_task_for @of_2_mem {
        aie.dma_bd(%arg2 : memref<2048x64xbf16> offset = 110592 len = 4096 sizes = [2, 1, 64, 64] strides = [0, 0, 64, 1])
        aie.end
      } {issue_token = true, iteration_t = 944 : index, repeat_count = 1 : i32}
      aiex.dma_start_task(%135)
      aiex.dma_await_task(%132)
      %136 = aiex.dma_configure_task_for @of_1_mem {
        aie.dma_bd(%arg1 : memref<64x2048xbf16> offset = 1792 len = 4096 sizes = [2, 1, 64, 64] strides = [0, 0, 2048, 1])
        aie.end
      } {issue_token = true, iteration_t = 960 : index, repeat_count = 1 : i32}
      aiex.dma_start_task(%136)
      aiex.dma_await_task(%133)
      %137 = aiex.dma_configure_task_for @of_2_mem {
        aie.dma_bd(%arg2 : memref<2048x64xbf16> offset = 114688 len = 4096 sizes = [2, 1, 64, 64] strides = [0, 0, 64, 1])
        aie.end
      } {issue_token = true, iteration_t = 960 : index, repeat_count = 1 : i32}
      aiex.dma_start_task(%137)
      aiex.dma_await_task(%134)
      %138 = aiex.dma_configure_task_for @of_1_mem {
        aie.dma_bd(%arg1 : memref<64x2048xbf16> offset = 1856 len = 4096 sizes = [2, 1, 64, 64] strides = [0, 0, 2048, 1])
        aie.end
      } {issue_token = true, iteration_t = 976 : index, repeat_count = 1 : i32}
      aiex.dma_start_task(%138)
      aiex.dma_await_task(%135)
      %139 = aiex.dma_configure_task_for @of_2_mem {
        aie.dma_bd(%arg2 : memref<2048x64xbf16> offset = 118784 len = 4096 sizes = [2, 1, 64, 64] strides = [0, 0, 64, 1])
        aie.end
      } {issue_token = true, iteration_t = 976 : index, repeat_count = 1 : i32}
      aiex.dma_start_task(%139)
      aiex.dma_await_task(%136)
      %140 = aiex.dma_configure_task_for @of_1_mem {
        aie.dma_bd(%arg1 : memref<64x2048xbf16> offset = 1920 len = 4096 sizes = [2, 1, 64, 64] strides = [0, 0, 2048, 1])
        aie.end
      } {issue_token = true, iteration_t = 992 : index, repeat_count = 1 : i32}
      aiex.dma_start_task(%140)
      aiex.dma_await_task(%137)
      %141 = aiex.dma_configure_task_for @of_2_mem {
        aie.dma_bd(%arg2 : memref<2048x64xbf16> offset = 122880 len = 4096 sizes = [2, 1, 64, 64] strides = [0, 0, 64, 1])
        aie.end
      } {issue_token = true, iteration_t = 992 : index, repeat_count = 1 : i32}
      aiex.dma_start_task(%141)
      aiex.dma_await_task(%138)
      %142 = aiex.dma_configure_task_for @of_1_mem {
        aie.dma_bd(%arg1 : memref<64x2048xbf16> offset = 1984 len = 4096 sizes = [2, 1, 64, 64] strides = [0, 0, 2048, 1])
        aie.end
      } {issue_token = true, iteration_t = 1008 : index, repeat_count = 1 : i32}
      aiex.dma_start_task(%142)
      aiex.dma_await_task(%139)
      %143 = aiex.dma_configure_task_for @of_2_mem {
        aie.dma_bd(%arg2 : memref<2048x64xbf16> offset = 126976 len = 4096 sizes = [2, 1, 64, 64] strides = [0, 0, 64, 1])
        aie.end
      } {issue_token = true, iteration_t = 1008 : index, repeat_count = 1 : i32}
      aiex.dma_start_task(%143)
      aiex.dma_await_task(%0)
      aiex.dma_await_task(%1)
      aiex.dma_await_task(%2)
      aiex.dma_await_task(%3)
      aiex.dma_await_task(%4)
      aiex.dma_await_task(%5)
      aiex.dma_await_task(%6)
      aiex.dma_await_task(%7)
      aiex.dma_await_task(%140)
      aiex.dma_await_task(%142)
      aiex.dma_await_task(%141)
      aiex.dma_await_task(%143)
      aiex.dma_await_task(%10)
      aiex.dma_await_task(%11)
      aiex.dma_await_task(%12)
      aiex.dma_await_task(%13)
      aiex.dma_await_task(%14)
      aiex.dma_await_task(%15)
      aiex.dma_await_task(%16)
      aiex.dma_await_task(%17)
    }
    %core_0_5 = aie.core(%tile_0_5) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c2 = arith.constant 2 : index
        scf.for %arg1 = %c0_0 to %c2 step %c1_1 {
          %0 = aie.objectfifo.acquire @of_3_unicast_0_0(Consume, 2) : !aie.objectfifosubview<memref<64x64xbf16>>
          %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
          %2 = aie.objectfifo.subview.access %0[1] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
          %c32 = arith.constant 32 : index
          scf.for %arg2 = %c0_0 to %c32 step %c1_1 {
            %3 = aie.objectfifo.acquire @of_4_broadcast_0_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %4 = aie.objectfifo.subview.access %3[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            %c2_2 = arith.constant 2 : index
            scf.for %arg3 = %c0_0 to %c2_2 step %c1_1 {
              %5 = aie.objectfifo.acquire @of_6_unicast_0(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
              %6 = aie.objectfifo.subview.access %5[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
              func.call @op0_zero_bf16_64_64_64(%6) : (memref<64x64xbf16>) -> ()
              %c1_3 = arith.constant 1 : index
              %c0_4 = arith.constant 0 : index
              %7 = arith.muli %c1_3, %arg3 : index
              %8 = arith.addi %c0_4, %7 : index
              %9 = arith.muli %c1_3, %c2_2 : index
              %10 = scf.index_switch %8 -> memref<64x64xbf16> 
              case 0 {
                scf.yield %1 : memref<64x64xbf16>
              }
              case 1 {
                scf.yield %2 : memref<64x64xbf16>
              }
              default {
                scf.yield %1 : memref<64x64xbf16>
              }
              %11 = arith.index_cast %arg2 : index to i32
              %c1_i32 = arith.constant 1 : i32
              %12 = arith.muli %11, %c1_i32 : i32
              %c0_i32 = arith.constant 0 : i32
              %13 = arith.addi %c0_i32, %12 : i32
              %14 = arith.index_cast %arg3 : index to i32
              %c1_i32_5 = arith.constant 1 : i32
              %15 = arith.muli %14, %c1_i32_5 : i32
              %16 = arith.index_cast %arg3 : index to i32
              %c16_i32 = arith.constant 16 : i32
              %17 = arith.muli %16, %c16_i32 : i32
              %c0_i32_6 = arith.constant 0 : i32
              %18 = arith.addi %c0_i32_6, %15 : i32
              %19 = arith.addi %18, %17 : i32
              %20 = arith.cmpi sle, %13, %19 : i32
              scf.if %20 {
                func.call @op0_matmul_bf16_bf16_64_64_64(%10, %4, %6) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>) -> ()
              }
              aie.objectfifo.release @of_6_unicast_0(Produce, 1)
            }
            aie.objectfifo.release @of_4_broadcast_0_0(Consume, 1)
          }
          aie.objectfifo.release @of_3_unicast_0_0(Consume, 2)
        }
      }
      aie.end
    } {link_with = "op0_mm_64_64_64.o"}
    %core_1_5 = aie.core(%tile_1_5) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c2 = arith.constant 2 : index
        scf.for %arg1 = %c0_0 to %c2 step %c1_1 {
          %0 = aie.objectfifo.acquire @of_3_unicast_1_0(Consume, 2) : !aie.objectfifosubview<memref<64x64xbf16>>
          %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
          %2 = aie.objectfifo.subview.access %0[1] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
          %c32 = arith.constant 32 : index
          scf.for %arg2 = %c0_0 to %c32 step %c1_1 {
            %3 = aie.objectfifo.acquire @of_4_broadcast_0_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %4 = aie.objectfifo.subview.access %3[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            %c2_2 = arith.constant 2 : index
            scf.for %arg3 = %c0_0 to %c2_2 step %c1_1 {
              %5 = aie.objectfifo.acquire @of_6_unicast_1(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
              %6 = aie.objectfifo.subview.access %5[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
              func.call @op0_zero_bf16_64_64_64(%6) : (memref<64x64xbf16>) -> ()
              %c1_3 = arith.constant 1 : index
              %c0_4 = arith.constant 0 : index
              %7 = arith.muli %c1_3, %arg3 : index
              %8 = arith.addi %c0_4, %7 : index
              %9 = arith.muli %c1_3, %c2_2 : index
              %10 = scf.index_switch %8 -> memref<64x64xbf16> 
              case 0 {
                scf.yield %1 : memref<64x64xbf16>
              }
              case 1 {
                scf.yield %2 : memref<64x64xbf16>
              }
              default {
                scf.yield %1 : memref<64x64xbf16>
              }
              %11 = arith.index_cast %arg2 : index to i32
              %c1_i32 = arith.constant 1 : i32
              %12 = arith.muli %11, %c1_i32 : i32
              %c0_i32 = arith.constant 0 : i32
              %13 = arith.addi %c0_i32, %12 : i32
              %14 = arith.index_cast %arg3 : index to i32
              %c1_i32_5 = arith.constant 1 : i32
              %15 = arith.muli %14, %c1_i32_5 : i32
              %16 = arith.index_cast %arg3 : index to i32
              %c16_i32 = arith.constant 16 : i32
              %17 = arith.muli %16, %c16_i32 : i32
              %c2_i32 = arith.constant 2 : i32
              %18 = arith.addi %c2_i32, %15 : i32
              %19 = arith.addi %18, %17 : i32
              %20 = arith.cmpi sle, %13, %19 : i32
              scf.if %20 {
                func.call @op0_matmul_bf16_bf16_64_64_64(%10, %4, %6) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>) -> ()
              }
              aie.objectfifo.release @of_6_unicast_1(Produce, 1)
            }
            aie.objectfifo.release @of_4_broadcast_0_0(Consume, 1)
          }
          aie.objectfifo.release @of_3_unicast_1_0(Consume, 2)
        }
      }
      aie.end
    } {link_with = "op0_mm_64_64_64.o"}
    %core_2_5 = aie.core(%tile_2_5) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c2 = arith.constant 2 : index
        scf.for %arg1 = %c0_0 to %c2 step %c1_1 {
          %0 = aie.objectfifo.acquire @of_3_unicast_2_0(Consume, 2) : !aie.objectfifosubview<memref<64x64xbf16>>
          %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
          %2 = aie.objectfifo.subview.access %0[1] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
          %c32 = arith.constant 32 : index
          scf.for %arg2 = %c0_0 to %c32 step %c1_1 {
            %3 = aie.objectfifo.acquire @of_4_broadcast_0_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %4 = aie.objectfifo.subview.access %3[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            %c2_2 = arith.constant 2 : index
            scf.for %arg3 = %c0_0 to %c2_2 step %c1_1 {
              %5 = aie.objectfifo.acquire @of_6_unicast_2(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
              %6 = aie.objectfifo.subview.access %5[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
              func.call @op0_zero_bf16_64_64_64(%6) : (memref<64x64xbf16>) -> ()
              %c1_3 = arith.constant 1 : index
              %c0_4 = arith.constant 0 : index
              %7 = arith.muli %c1_3, %arg3 : index
              %8 = arith.addi %c0_4, %7 : index
              %9 = arith.muli %c1_3, %c2_2 : index
              %10 = scf.index_switch %8 -> memref<64x64xbf16> 
              case 0 {
                scf.yield %1 : memref<64x64xbf16>
              }
              case 1 {
                scf.yield %2 : memref<64x64xbf16>
              }
              default {
                scf.yield %1 : memref<64x64xbf16>
              }
              %11 = arith.index_cast %arg2 : index to i32
              %c1_i32 = arith.constant 1 : i32
              %12 = arith.muli %11, %c1_i32 : i32
              %c0_i32 = arith.constant 0 : i32
              %13 = arith.addi %c0_i32, %12 : i32
              %14 = arith.index_cast %arg3 : index to i32
              %c1_i32_5 = arith.constant 1 : i32
              %15 = arith.muli %14, %c1_i32_5 : i32
              %16 = arith.index_cast %arg3 : index to i32
              %c16_i32 = arith.constant 16 : i32
              %17 = arith.muli %16, %c16_i32 : i32
              %c4_i32 = arith.constant 4 : i32
              %18 = arith.addi %c4_i32, %15 : i32
              %19 = arith.addi %18, %17 : i32
              %20 = arith.cmpi sle, %13, %19 : i32
              scf.if %20 {
                func.call @op0_matmul_bf16_bf16_64_64_64(%10, %4, %6) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>) -> ()
              }
              aie.objectfifo.release @of_6_unicast_2(Produce, 1)
            }
            aie.objectfifo.release @of_4_broadcast_0_0(Consume, 1)
          }
          aie.objectfifo.release @of_3_unicast_2_0(Consume, 2)
        }
      }
      aie.end
    } {link_with = "op0_mm_64_64_64.o"}
    %core_3_5 = aie.core(%tile_3_5) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c2 = arith.constant 2 : index
        scf.for %arg1 = %c0_0 to %c2 step %c1_1 {
          %0 = aie.objectfifo.acquire @of_3_unicast_3_0(Consume, 2) : !aie.objectfifosubview<memref<64x64xbf16>>
          %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
          %2 = aie.objectfifo.subview.access %0[1] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
          %c32 = arith.constant 32 : index
          scf.for %arg2 = %c0_0 to %c32 step %c1_1 {
            %3 = aie.objectfifo.acquire @of_4_broadcast_0_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %4 = aie.objectfifo.subview.access %3[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            %c2_2 = arith.constant 2 : index
            scf.for %arg3 = %c0_0 to %c2_2 step %c1_1 {
              %5 = aie.objectfifo.acquire @of_6_unicast_3(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
              %6 = aie.objectfifo.subview.access %5[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
              func.call @op0_zero_bf16_64_64_64(%6) : (memref<64x64xbf16>) -> ()
              %c1_3 = arith.constant 1 : index
              %c0_4 = arith.constant 0 : index
              %7 = arith.muli %c1_3, %arg3 : index
              %8 = arith.addi %c0_4, %7 : index
              %9 = arith.muli %c1_3, %c2_2 : index
              %10 = scf.index_switch %8 -> memref<64x64xbf16> 
              case 0 {
                scf.yield %1 : memref<64x64xbf16>
              }
              case 1 {
                scf.yield %2 : memref<64x64xbf16>
              }
              default {
                scf.yield %1 : memref<64x64xbf16>
              }
              %11 = arith.index_cast %arg2 : index to i32
              %c1_i32 = arith.constant 1 : i32
              %12 = arith.muli %11, %c1_i32 : i32
              %c0_i32 = arith.constant 0 : i32
              %13 = arith.addi %c0_i32, %12 : i32
              %14 = arith.index_cast %arg3 : index to i32
              %c1_i32_5 = arith.constant 1 : i32
              %15 = arith.muli %14, %c1_i32_5 : i32
              %16 = arith.index_cast %arg3 : index to i32
              %c16_i32 = arith.constant 16 : i32
              %17 = arith.muli %16, %c16_i32 : i32
              %c6_i32 = arith.constant 6 : i32
              %18 = arith.addi %c6_i32, %15 : i32
              %19 = arith.addi %18, %17 : i32
              %20 = arith.cmpi sle, %13, %19 : i32
              scf.if %20 {
                func.call @op0_matmul_bf16_bf16_64_64_64(%10, %4, %6) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>) -> ()
              }
              aie.objectfifo.release @of_6_unicast_3(Produce, 1)
            }
            aie.objectfifo.release @of_4_broadcast_0_0(Consume, 1)
          }
          aie.objectfifo.release @of_3_unicast_3_0(Consume, 2)
        }
      }
      aie.end
    } {link_with = "op0_mm_64_64_64.o"}
    %core_4_5 = aie.core(%tile_4_5) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c2 = arith.constant 2 : index
        scf.for %arg1 = %c0_0 to %c2 step %c1_1 {
          %0 = aie.objectfifo.acquire @of_3_unicast_4_0(Consume, 2) : !aie.objectfifosubview<memref<64x64xbf16>>
          %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
          %2 = aie.objectfifo.subview.access %0[1] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
          %c32 = arith.constant 32 : index
          scf.for %arg2 = %c0_0 to %c32 step %c1_1 {
            %3 = aie.objectfifo.acquire @of_4_broadcast_0_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %4 = aie.objectfifo.subview.access %3[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            %c2_2 = arith.constant 2 : index
            scf.for %arg3 = %c0_0 to %c2_2 step %c1_1 {
              %5 = aie.objectfifo.acquire @of_6_unicast_4(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
              %6 = aie.objectfifo.subview.access %5[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
              func.call @op0_zero_bf16_64_64_64(%6) : (memref<64x64xbf16>) -> ()
              %c1_3 = arith.constant 1 : index
              %c0_4 = arith.constant 0 : index
              %7 = arith.muli %c1_3, %arg3 : index
              %8 = arith.addi %c0_4, %7 : index
              %9 = arith.muli %c1_3, %c2_2 : index
              %10 = scf.index_switch %8 -> memref<64x64xbf16> 
              case 0 {
                scf.yield %1 : memref<64x64xbf16>
              }
              case 1 {
                scf.yield %2 : memref<64x64xbf16>
              }
              default {
                scf.yield %1 : memref<64x64xbf16>
              }
              %11 = arith.index_cast %arg2 : index to i32
              %c1_i32 = arith.constant 1 : i32
              %12 = arith.muli %11, %c1_i32 : i32
              %c0_i32 = arith.constant 0 : i32
              %13 = arith.addi %c0_i32, %12 : i32
              %14 = arith.index_cast %arg3 : index to i32
              %c1_i32_5 = arith.constant 1 : i32
              %15 = arith.muli %14, %c1_i32_5 : i32
              %16 = arith.index_cast %arg3 : index to i32
              %c16_i32 = arith.constant 16 : i32
              %17 = arith.muli %16, %c16_i32 : i32
              %c8_i32 = arith.constant 8 : i32
              %18 = arith.addi %c8_i32, %15 : i32
              %19 = arith.addi %18, %17 : i32
              %20 = arith.cmpi sle, %13, %19 : i32
              scf.if %20 {
                func.call @op0_matmul_bf16_bf16_64_64_64(%10, %4, %6) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>) -> ()
              }
              aie.objectfifo.release @of_6_unicast_4(Produce, 1)
            }
            aie.objectfifo.release @of_4_broadcast_0_0(Consume, 1)
          }
          aie.objectfifo.release @of_3_unicast_4_0(Consume, 2)
        }
      }
      aie.end
    } {link_with = "op0_mm_64_64_64.o"}
    %core_5_5 = aie.core(%tile_5_5) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c2 = arith.constant 2 : index
        scf.for %arg1 = %c0_0 to %c2 step %c1_1 {
          %0 = aie.objectfifo.acquire @of_3_unicast_5_0(Consume, 2) : !aie.objectfifosubview<memref<64x64xbf16>>
          %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
          %2 = aie.objectfifo.subview.access %0[1] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
          %c32 = arith.constant 32 : index
          scf.for %arg2 = %c0_0 to %c32 step %c1_1 {
            %3 = aie.objectfifo.acquire @of_4_broadcast_0_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %4 = aie.objectfifo.subview.access %3[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            %c2_2 = arith.constant 2 : index
            scf.for %arg3 = %c0_0 to %c2_2 step %c1_1 {
              %5 = aie.objectfifo.acquire @of_6_unicast_5(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
              %6 = aie.objectfifo.subview.access %5[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
              func.call @op0_zero_bf16_64_64_64(%6) : (memref<64x64xbf16>) -> ()
              %c1_3 = arith.constant 1 : index
              %c0_4 = arith.constant 0 : index
              %7 = arith.muli %c1_3, %arg3 : index
              %8 = arith.addi %c0_4, %7 : index
              %9 = arith.muli %c1_3, %c2_2 : index
              %10 = scf.index_switch %8 -> memref<64x64xbf16> 
              case 0 {
                scf.yield %1 : memref<64x64xbf16>
              }
              case 1 {
                scf.yield %2 : memref<64x64xbf16>
              }
              default {
                scf.yield %1 : memref<64x64xbf16>
              }
              %11 = arith.index_cast %arg2 : index to i32
              %c1_i32 = arith.constant 1 : i32
              %12 = arith.muli %11, %c1_i32 : i32
              %c0_i32 = arith.constant 0 : i32
              %13 = arith.addi %c0_i32, %12 : i32
              %14 = arith.index_cast %arg3 : index to i32
              %c1_i32_5 = arith.constant 1 : i32
              %15 = arith.muli %14, %c1_i32_5 : i32
              %16 = arith.index_cast %arg3 : index to i32
              %c16_i32 = arith.constant 16 : i32
              %17 = arith.muli %16, %c16_i32 : i32
              %c10_i32 = arith.constant 10 : i32
              %18 = arith.addi %c10_i32, %15 : i32
              %19 = arith.addi %18, %17 : i32
              %20 = arith.cmpi sle, %13, %19 : i32
              scf.if %20 {
                func.call @op0_matmul_bf16_bf16_64_64_64(%10, %4, %6) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>) -> ()
              }
              aie.objectfifo.release @of_6_unicast_5(Produce, 1)
            }
            aie.objectfifo.release @of_4_broadcast_0_0(Consume, 1)
          }
          aie.objectfifo.release @of_3_unicast_5_0(Consume, 2)
        }
      }
      aie.end
    } {link_with = "op0_mm_64_64_64.o"}
    %core_6_5 = aie.core(%tile_6_5) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c2 = arith.constant 2 : index
        scf.for %arg1 = %c0_0 to %c2 step %c1_1 {
          %0 = aie.objectfifo.acquire @of_3_unicast_6_0(Consume, 2) : !aie.objectfifosubview<memref<64x64xbf16>>
          %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
          %2 = aie.objectfifo.subview.access %0[1] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
          %c32 = arith.constant 32 : index
          scf.for %arg2 = %c0_0 to %c32 step %c1_1 {
            %3 = aie.objectfifo.acquire @of_4_broadcast_0_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %4 = aie.objectfifo.subview.access %3[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            %c2_2 = arith.constant 2 : index
            scf.for %arg3 = %c0_0 to %c2_2 step %c1_1 {
              %5 = aie.objectfifo.acquire @of_6_unicast_6(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
              %6 = aie.objectfifo.subview.access %5[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
              func.call @op0_zero_bf16_64_64_64(%6) : (memref<64x64xbf16>) -> ()
              %c1_3 = arith.constant 1 : index
              %c0_4 = arith.constant 0 : index
              %7 = arith.muli %c1_3, %arg3 : index
              %8 = arith.addi %c0_4, %7 : index
              %9 = arith.muli %c1_3, %c2_2 : index
              %10 = scf.index_switch %8 -> memref<64x64xbf16> 
              case 0 {
                scf.yield %1 : memref<64x64xbf16>
              }
              case 1 {
                scf.yield %2 : memref<64x64xbf16>
              }
              default {
                scf.yield %1 : memref<64x64xbf16>
              }
              %11 = arith.index_cast %arg2 : index to i32
              %c1_i32 = arith.constant 1 : i32
              %12 = arith.muli %11, %c1_i32 : i32
              %c0_i32 = arith.constant 0 : i32
              %13 = arith.addi %c0_i32, %12 : i32
              %14 = arith.index_cast %arg3 : index to i32
              %c1_i32_5 = arith.constant 1 : i32
              %15 = arith.muli %14, %c1_i32_5 : i32
              %16 = arith.index_cast %arg3 : index to i32
              %c16_i32 = arith.constant 16 : i32
              %17 = arith.muli %16, %c16_i32 : i32
              %c12_i32 = arith.constant 12 : i32
              %18 = arith.addi %c12_i32, %15 : i32
              %19 = arith.addi %18, %17 : i32
              %20 = arith.cmpi sle, %13, %19 : i32
              scf.if %20 {
                func.call @op0_matmul_bf16_bf16_64_64_64(%10, %4, %6) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>) -> ()
              }
              aie.objectfifo.release @of_6_unicast_6(Produce, 1)
            }
            aie.objectfifo.release @of_4_broadcast_0_0(Consume, 1)
          }
          aie.objectfifo.release @of_3_unicast_6_0(Consume, 2)
        }
      }
      aie.end
    } {link_with = "op0_mm_64_64_64.o"}
    %core_7_5 = aie.core(%tile_7_5) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c2 = arith.constant 2 : index
        scf.for %arg1 = %c0_0 to %c2 step %c1_1 {
          %0 = aie.objectfifo.acquire @of_3_unicast_7_0(Consume, 2) : !aie.objectfifosubview<memref<64x64xbf16>>
          %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
          %2 = aie.objectfifo.subview.access %0[1] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
          %c32 = arith.constant 32 : index
          scf.for %arg2 = %c0_0 to %c32 step %c1_1 {
            %3 = aie.objectfifo.acquire @of_4_broadcast_0_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %4 = aie.objectfifo.subview.access %3[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            %c2_2 = arith.constant 2 : index
            scf.for %arg3 = %c0_0 to %c2_2 step %c1_1 {
              %5 = aie.objectfifo.acquire @of_6_unicast_7(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
              %6 = aie.objectfifo.subview.access %5[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
              func.call @op0_zero_bf16_64_64_64(%6) : (memref<64x64xbf16>) -> ()
              %c1_3 = arith.constant 1 : index
              %c0_4 = arith.constant 0 : index
              %7 = arith.muli %c1_3, %arg3 : index
              %8 = arith.addi %c0_4, %7 : index
              %9 = arith.muli %c1_3, %c2_2 : index
              %10 = scf.index_switch %8 -> memref<64x64xbf16> 
              case 0 {
                scf.yield %1 : memref<64x64xbf16>
              }
              case 1 {
                scf.yield %2 : memref<64x64xbf16>
              }
              default {
                scf.yield %1 : memref<64x64xbf16>
              }
              %11 = arith.index_cast %arg2 : index to i32
              %c1_i32 = arith.constant 1 : i32
              %12 = arith.muli %11, %c1_i32 : i32
              %c0_i32 = arith.constant 0 : i32
              %13 = arith.addi %c0_i32, %12 : i32
              %14 = arith.index_cast %arg3 : index to i32
              %c1_i32_5 = arith.constant 1 : i32
              %15 = arith.muli %14, %c1_i32_5 : i32
              %16 = arith.index_cast %arg3 : index to i32
              %c16_i32 = arith.constant 16 : i32
              %17 = arith.muli %16, %c16_i32 : i32
              %c14_i32 = arith.constant 14 : i32
              %18 = arith.addi %c14_i32, %15 : i32
              %19 = arith.addi %18, %17 : i32
              %20 = arith.cmpi sle, %13, %19 : i32
              scf.if %20 {
                func.call @op0_matmul_bf16_bf16_64_64_64(%10, %4, %6) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>) -> ()
              }
              aie.objectfifo.release @of_6_unicast_7(Produce, 1)
            }
            aie.objectfifo.release @of_4_broadcast_0_0(Consume, 1)
          }
          aie.objectfifo.release @of_3_unicast_7_0(Consume, 2)
        }
      }
      aie.end
    } {link_with = "op0_mm_64_64_64.o"}
    %flash_index_0_3 = aie.buffer(%tile_0_3) {sym_name = "flash_index_0_3"} : memref<2xi32> 
    %core_0_3 = aie.core(%tile_0_3) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c2 = arith.constant 2 : index
        scf.for %arg1 = %c0_0 to %c2 step %c1_1 {
          %0 = aie.objectfifo.acquire @of_9_unicast_0(Produce, 2) : !aie.objectfifosubview<memref<64x64xbf16>>
          %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
          func.call @op0_zero_bf16(%1) : (memref<64x64xbf16>) -> ()
          %2 = aie.objectfifo.subview.access %0[1] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
          func.call @op0_zero_bf16(%2) : (memref<64x64xbf16>) -> ()
          %c32 = arith.constant 32 : index
          scf.for %arg2 = %c0_0 to %c32 step %c1_1 {
            %3 = aie.objectfifo.acquire @of_5_broadcast_0_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %4 = aie.objectfifo.subview.access %3[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            %c2_2 = arith.constant 2 : index
            %5 = aie.objectfifo.acquire @of_8_switch_join_0_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %6 = aie.objectfifo.acquire @of_8_switch_join_0_1(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %7 = aie.objectfifo.subview.access %5[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            %8 = aie.objectfifo.subview.access %6[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            scf.for %arg3 = %c0_0 to %c2_2 step %c1_1 {
              %c1_3 = arith.constant 1 : index
              %c0_4 = arith.constant 0 : index
              %9 = arith.muli %c1_3, %arg3 : index
              %10 = arith.addi %c0_4, %9 : index
              %11 = arith.muli %c1_3, %c2_2 : index
              %12 = scf.index_switch %10 -> memref<64x64xbf16> 
              case 0 {
                scf.yield %1 : memref<64x64xbf16>
              }
              case 1 {
                scf.yield %2 : memref<64x64xbf16>
              }
              default {
                scf.yield %1 : memref<64x64xbf16>
              }
              %13 = scf.index_switch %arg3 -> memref<64x64xbf16> 
              case 0 {
                scf.yield %7 : memref<64x64xbf16>
              }
              case 1 {
                scf.yield %8 : memref<64x64xbf16>
              }
              default {
                scf.yield %7 : memref<64x64xbf16>
              }
              %14 = arith.index_cast %arg2 : index to i32
              %c1_i32 = arith.constant 1 : i32
              %15 = arith.muli %14, %c1_i32 : i32
              %c0_i32 = arith.constant 0 : i32
              %16 = arith.addi %c0_i32, %15 : i32
              %17 = arith.index_cast %arg3 : index to i32
              %c1_i32_5 = arith.constant 1 : i32
              %18 = arith.muli %17, %c1_i32_5 : i32
              %19 = arith.index_cast %arg3 : index to i32
              %c16_i32 = arith.constant 16 : i32
              %20 = arith.muli %19, %c16_i32 : i32
              %c0_i32_6 = arith.constant 0 : i32
              %21 = arith.addi %c0_i32_6, %18 : i32
              %22 = arith.addi %21, %20 : i32
              %c0_7 = arith.constant 0 : index
              %c1_8 = arith.constant 1 : index
              memref.store %16, %flash_index_0_3[%c0_7] : memref<2xi32>
              memref.store %22, %flash_index_0_3[%c1_8] : memref<2xi32>
              scf.index_switch %arg3 
              case 0 {
                %23 = aie.objectfifo.acquire @flash_scale_0_2(Consume, 1) : !aie.objectfifosubview<memref<256xbf16>>
                %24 = aie.objectfifo.subview.access %23[0] : !aie.objectfifosubview<memref<256xbf16>> -> memref<256xbf16>
                %c64_i32 = arith.constant 64 : i32
                %c0_i32_9 = arith.constant 0 : i32
                %25 = arith.cmpi ne, %16, %c0_i32_9 : i32
                %26 = arith.extui %25 : i1 to i32
                func.call @op0_matmul_PV(%13, %4, %12, %24, %c64_i32, %26, %flash_index_0_3) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>, memref<256xbf16>, i32, i32, memref<2xi32>) -> ()
                %c31_i32 = arith.constant 31 : i32
                %27 = arith.cmpi eq, %16, %c31_i32 : i32
                scf.if %27 {
                  func.call @op0_rescale_O(%12, %24, %c64_i32, %flash_index_0_3) : (memref<64x64xbf16>, memref<256xbf16>, i32, memref<2xi32>) -> ()
                }
                aie.objectfifo.release @flash_scale_0_2(Consume, 1)
                scf.yield
              }
              case 1 {
                %23 = aie.objectfifo.acquire @flash_scale_0_4(Consume, 1) : !aie.objectfifosubview<memref<256xbf16>>
                %24 = aie.objectfifo.subview.access %23[0] : !aie.objectfifosubview<memref<256xbf16>> -> memref<256xbf16>
                %c64_i32 = arith.constant 64 : i32
                %c0_i32_9 = arith.constant 0 : i32
                %25 = arith.cmpi ne, %16, %c0_i32_9 : i32
                %26 = arith.extui %25 : i1 to i32
                func.call @op0_matmul_PV(%13, %4, %12, %24, %c64_i32, %26, %flash_index_0_3) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>, memref<256xbf16>, i32, i32, memref<2xi32>) -> ()
                %c31_i32 = arith.constant 31 : i32
                %27 = arith.cmpi eq, %16, %c31_i32 : i32
                scf.if %27 {
                  func.call @op0_rescale_O(%12, %24, %c64_i32, %flash_index_0_3) : (memref<64x64xbf16>, memref<256xbf16>, i32, memref<2xi32>) -> ()
                }
                aie.objectfifo.release @flash_scale_0_4(Consume, 1)
                scf.yield
              }
              default {
                %23 = aie.objectfifo.acquire @flash_scale_0_2(Consume, 1) : !aie.objectfifosubview<memref<256xbf16>>
                %24 = aie.objectfifo.subview.access %23[0] : !aie.objectfifosubview<memref<256xbf16>> -> memref<256xbf16>
                %c64_i32 = arith.constant 64 : i32
                %c0_i32_9 = arith.constant 0 : i32
                %25 = arith.cmpi ne, %16, %c0_i32_9 : i32
                %26 = arith.extui %25 : i1 to i32
                func.call @op0_matmul_PV(%13, %4, %12, %24, %c64_i32, %26, %flash_index_0_3) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>, memref<256xbf16>, i32, i32, memref<2xi32>) -> ()
                %c31_i32 = arith.constant 31 : i32
                %27 = arith.cmpi eq, %16, %c31_i32 : i32
                scf.if %27 {
                  func.call @op0_rescale_O(%12, %24, %c64_i32, %flash_index_0_3) : (memref<64x64xbf16>, memref<256xbf16>, i32, memref<2xi32>) -> ()
                }
                aie.objectfifo.release @flash_scale_0_2(Consume, 1)
              }
            }
            aie.objectfifo.release @of_8_switch_join_0_0(Consume, 1)
            aie.objectfifo.release @of_8_switch_join_0_1(Consume, 1)
            aie.objectfifo.release @of_5_broadcast_0_0(Consume, 1)
          }
          aie.objectfifo.release @of_9_unicast_0(Produce, 2)
        }
      }
      aie.end
    } {link_with = "op0_mha.o"}
    %flash_index_1_3 = aie.buffer(%tile_1_3) {sym_name = "flash_index_1_3"} : memref<2xi32> 
    %core_1_3 = aie.core(%tile_1_3) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c2 = arith.constant 2 : index
        scf.for %arg1 = %c0_0 to %c2 step %c1_1 {
          %0 = aie.objectfifo.acquire @of_9_unicast_1(Produce, 2) : !aie.objectfifosubview<memref<64x64xbf16>>
          %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
          func.call @op0_zero_bf16(%1) : (memref<64x64xbf16>) -> ()
          %2 = aie.objectfifo.subview.access %0[1] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
          func.call @op0_zero_bf16(%2) : (memref<64x64xbf16>) -> ()
          %c32 = arith.constant 32 : index
          scf.for %arg2 = %c0_0 to %c32 step %c1_1 {
            %3 = aie.objectfifo.acquire @of_5_broadcast_0_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %4 = aie.objectfifo.subview.access %3[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            %c2_2 = arith.constant 2 : index
            %5 = aie.objectfifo.acquire @of_8_switch_join_1_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %6 = aie.objectfifo.acquire @of_8_switch_join_1_1(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %7 = aie.objectfifo.subview.access %5[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            %8 = aie.objectfifo.subview.access %6[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            scf.for %arg3 = %c0_0 to %c2_2 step %c1_1 {
              %c1_3 = arith.constant 1 : index
              %c0_4 = arith.constant 0 : index
              %9 = arith.muli %c1_3, %arg3 : index
              %10 = arith.addi %c0_4, %9 : index
              %11 = arith.muli %c1_3, %c2_2 : index
              %12 = scf.index_switch %10 -> memref<64x64xbf16> 
              case 0 {
                scf.yield %1 : memref<64x64xbf16>
              }
              case 1 {
                scf.yield %2 : memref<64x64xbf16>
              }
              default {
                scf.yield %1 : memref<64x64xbf16>
              }
              %13 = scf.index_switch %arg3 -> memref<64x64xbf16> 
              case 0 {
                scf.yield %7 : memref<64x64xbf16>
              }
              case 1 {
                scf.yield %8 : memref<64x64xbf16>
              }
              default {
                scf.yield %7 : memref<64x64xbf16>
              }
              %14 = arith.index_cast %arg2 : index to i32
              %c1_i32 = arith.constant 1 : i32
              %15 = arith.muli %14, %c1_i32 : i32
              %c0_i32 = arith.constant 0 : i32
              %16 = arith.addi %c0_i32, %15 : i32
              %17 = arith.index_cast %arg3 : index to i32
              %c1_i32_5 = arith.constant 1 : i32
              %18 = arith.muli %17, %c1_i32_5 : i32
              %19 = arith.index_cast %arg3 : index to i32
              %c16_i32 = arith.constant 16 : i32
              %20 = arith.muli %19, %c16_i32 : i32
              %c2_i32 = arith.constant 2 : i32
              %21 = arith.addi %c2_i32, %18 : i32
              %22 = arith.addi %21, %20 : i32
              %c0_6 = arith.constant 0 : index
              %c1_7 = arith.constant 1 : index
              memref.store %16, %flash_index_1_3[%c0_6] : memref<2xi32>
              memref.store %22, %flash_index_1_3[%c1_7] : memref<2xi32>
              scf.index_switch %arg3 
              case 0 {
                %23 = aie.objectfifo.acquire @flash_scale_1_2(Consume, 1) : !aie.objectfifosubview<memref<256xbf16>>
                %24 = aie.objectfifo.subview.access %23[0] : !aie.objectfifosubview<memref<256xbf16>> -> memref<256xbf16>
                %c64_i32 = arith.constant 64 : i32
                %c0_i32_8 = arith.constant 0 : i32
                %25 = arith.cmpi ne, %16, %c0_i32_8 : i32
                %26 = arith.extui %25 : i1 to i32
                func.call @op0_matmul_PV(%13, %4, %12, %24, %c64_i32, %26, %flash_index_1_3) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>, memref<256xbf16>, i32, i32, memref<2xi32>) -> ()
                %c31_i32 = arith.constant 31 : i32
                %27 = arith.cmpi eq, %16, %c31_i32 : i32
                scf.if %27 {
                  func.call @op0_rescale_O(%12, %24, %c64_i32, %flash_index_1_3) : (memref<64x64xbf16>, memref<256xbf16>, i32, memref<2xi32>) -> ()
                }
                aie.objectfifo.release @flash_scale_1_2(Consume, 1)
                scf.yield
              }
              case 1 {
                %23 = aie.objectfifo.acquire @flash_scale_1_4(Consume, 1) : !aie.objectfifosubview<memref<256xbf16>>
                %24 = aie.objectfifo.subview.access %23[0] : !aie.objectfifosubview<memref<256xbf16>> -> memref<256xbf16>
                %c64_i32 = arith.constant 64 : i32
                %c0_i32_8 = arith.constant 0 : i32
                %25 = arith.cmpi ne, %16, %c0_i32_8 : i32
                %26 = arith.extui %25 : i1 to i32
                func.call @op0_matmul_PV(%13, %4, %12, %24, %c64_i32, %26, %flash_index_1_3) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>, memref<256xbf16>, i32, i32, memref<2xi32>) -> ()
                %c31_i32 = arith.constant 31 : i32
                %27 = arith.cmpi eq, %16, %c31_i32 : i32
                scf.if %27 {
                  func.call @op0_rescale_O(%12, %24, %c64_i32, %flash_index_1_3) : (memref<64x64xbf16>, memref<256xbf16>, i32, memref<2xi32>) -> ()
                }
                aie.objectfifo.release @flash_scale_1_4(Consume, 1)
                scf.yield
              }
              default {
                %23 = aie.objectfifo.acquire @flash_scale_1_2(Consume, 1) : !aie.objectfifosubview<memref<256xbf16>>
                %24 = aie.objectfifo.subview.access %23[0] : !aie.objectfifosubview<memref<256xbf16>> -> memref<256xbf16>
                %c64_i32 = arith.constant 64 : i32
                %c0_i32_8 = arith.constant 0 : i32
                %25 = arith.cmpi ne, %16, %c0_i32_8 : i32
                %26 = arith.extui %25 : i1 to i32
                func.call @op0_matmul_PV(%13, %4, %12, %24, %c64_i32, %26, %flash_index_1_3) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>, memref<256xbf16>, i32, i32, memref<2xi32>) -> ()
                %c31_i32 = arith.constant 31 : i32
                %27 = arith.cmpi eq, %16, %c31_i32 : i32
                scf.if %27 {
                  func.call @op0_rescale_O(%12, %24, %c64_i32, %flash_index_1_3) : (memref<64x64xbf16>, memref<256xbf16>, i32, memref<2xi32>) -> ()
                }
                aie.objectfifo.release @flash_scale_1_2(Consume, 1)
              }
            }
            aie.objectfifo.release @of_8_switch_join_1_0(Consume, 1)
            aie.objectfifo.release @of_8_switch_join_1_1(Consume, 1)
            aie.objectfifo.release @of_5_broadcast_0_0(Consume, 1)
          }
          aie.objectfifo.release @of_9_unicast_1(Produce, 2)
        }
      }
      aie.end
    } {link_with = "op0_mha.o"}
    %flash_index_2_3 = aie.buffer(%tile_2_3) {sym_name = "flash_index_2_3"} : memref<2xi32> 
    %core_2_3 = aie.core(%tile_2_3) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c2 = arith.constant 2 : index
        scf.for %arg1 = %c0_0 to %c2 step %c1_1 {
          %0 = aie.objectfifo.acquire @of_9_unicast_2(Produce, 2) : !aie.objectfifosubview<memref<64x64xbf16>>
          %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
          func.call @op0_zero_bf16(%1) : (memref<64x64xbf16>) -> ()
          %2 = aie.objectfifo.subview.access %0[1] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
          func.call @op0_zero_bf16(%2) : (memref<64x64xbf16>) -> ()
          %c32 = arith.constant 32 : index
          scf.for %arg2 = %c0_0 to %c32 step %c1_1 {
            %3 = aie.objectfifo.acquire @of_5_broadcast_0_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %4 = aie.objectfifo.subview.access %3[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            %c2_2 = arith.constant 2 : index
            %5 = aie.objectfifo.acquire @of_8_switch_join_2_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %6 = aie.objectfifo.acquire @of_8_switch_join_2_1(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %7 = aie.objectfifo.subview.access %5[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            %8 = aie.objectfifo.subview.access %6[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            scf.for %arg3 = %c0_0 to %c2_2 step %c1_1 {
              %c1_3 = arith.constant 1 : index
              %c0_4 = arith.constant 0 : index
              %9 = arith.muli %c1_3, %arg3 : index
              %10 = arith.addi %c0_4, %9 : index
              %11 = arith.muli %c1_3, %c2_2 : index
              %12 = scf.index_switch %10 -> memref<64x64xbf16> 
              case 0 {
                scf.yield %1 : memref<64x64xbf16>
              }
              case 1 {
                scf.yield %2 : memref<64x64xbf16>
              }
              default {
                scf.yield %1 : memref<64x64xbf16>
              }
              %13 = scf.index_switch %arg3 -> memref<64x64xbf16> 
              case 0 {
                scf.yield %7 : memref<64x64xbf16>
              }
              case 1 {
                scf.yield %8 : memref<64x64xbf16>
              }
              default {
                scf.yield %7 : memref<64x64xbf16>
              }
              %14 = arith.index_cast %arg2 : index to i32
              %c1_i32 = arith.constant 1 : i32
              %15 = arith.muli %14, %c1_i32 : i32
              %c0_i32 = arith.constant 0 : i32
              %16 = arith.addi %c0_i32, %15 : i32
              %17 = arith.index_cast %arg3 : index to i32
              %c1_i32_5 = arith.constant 1 : i32
              %18 = arith.muli %17, %c1_i32_5 : i32
              %19 = arith.index_cast %arg3 : index to i32
              %c16_i32 = arith.constant 16 : i32
              %20 = arith.muli %19, %c16_i32 : i32
              %c4_i32 = arith.constant 4 : i32
              %21 = arith.addi %c4_i32, %18 : i32
              %22 = arith.addi %21, %20 : i32
              %c0_6 = arith.constant 0 : index
              %c1_7 = arith.constant 1 : index
              memref.store %16, %flash_index_2_3[%c0_6] : memref<2xi32>
              memref.store %22, %flash_index_2_3[%c1_7] : memref<2xi32>
              scf.index_switch %arg3 
              case 0 {
                %23 = aie.objectfifo.acquire @flash_scale_2_2(Consume, 1) : !aie.objectfifosubview<memref<256xbf16>>
                %24 = aie.objectfifo.subview.access %23[0] : !aie.objectfifosubview<memref<256xbf16>> -> memref<256xbf16>
                %c64_i32 = arith.constant 64 : i32
                %c0_i32_8 = arith.constant 0 : i32
                %25 = arith.cmpi ne, %16, %c0_i32_8 : i32
                %26 = arith.extui %25 : i1 to i32
                func.call @op0_matmul_PV(%13, %4, %12, %24, %c64_i32, %26, %flash_index_2_3) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>, memref<256xbf16>, i32, i32, memref<2xi32>) -> ()
                %c31_i32 = arith.constant 31 : i32
                %27 = arith.cmpi eq, %16, %c31_i32 : i32
                scf.if %27 {
                  func.call @op0_rescale_O(%12, %24, %c64_i32, %flash_index_2_3) : (memref<64x64xbf16>, memref<256xbf16>, i32, memref<2xi32>) -> ()
                }
                aie.objectfifo.release @flash_scale_2_2(Consume, 1)
                scf.yield
              }
              case 1 {
                %23 = aie.objectfifo.acquire @flash_scale_2_4(Consume, 1) : !aie.objectfifosubview<memref<256xbf16>>
                %24 = aie.objectfifo.subview.access %23[0] : !aie.objectfifosubview<memref<256xbf16>> -> memref<256xbf16>
                %c64_i32 = arith.constant 64 : i32
                %c0_i32_8 = arith.constant 0 : i32
                %25 = arith.cmpi ne, %16, %c0_i32_8 : i32
                %26 = arith.extui %25 : i1 to i32
                func.call @op0_matmul_PV(%13, %4, %12, %24, %c64_i32, %26, %flash_index_2_3) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>, memref<256xbf16>, i32, i32, memref<2xi32>) -> ()
                %c31_i32 = arith.constant 31 : i32
                %27 = arith.cmpi eq, %16, %c31_i32 : i32
                scf.if %27 {
                  func.call @op0_rescale_O(%12, %24, %c64_i32, %flash_index_2_3) : (memref<64x64xbf16>, memref<256xbf16>, i32, memref<2xi32>) -> ()
                }
                aie.objectfifo.release @flash_scale_2_4(Consume, 1)
                scf.yield
              }
              default {
                %23 = aie.objectfifo.acquire @flash_scale_2_2(Consume, 1) : !aie.objectfifosubview<memref<256xbf16>>
                %24 = aie.objectfifo.subview.access %23[0] : !aie.objectfifosubview<memref<256xbf16>> -> memref<256xbf16>
                %c64_i32 = arith.constant 64 : i32
                %c0_i32_8 = arith.constant 0 : i32
                %25 = arith.cmpi ne, %16, %c0_i32_8 : i32
                %26 = arith.extui %25 : i1 to i32
                func.call @op0_matmul_PV(%13, %4, %12, %24, %c64_i32, %26, %flash_index_2_3) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>, memref<256xbf16>, i32, i32, memref<2xi32>) -> ()
                %c31_i32 = arith.constant 31 : i32
                %27 = arith.cmpi eq, %16, %c31_i32 : i32
                scf.if %27 {
                  func.call @op0_rescale_O(%12, %24, %c64_i32, %flash_index_2_3) : (memref<64x64xbf16>, memref<256xbf16>, i32, memref<2xi32>) -> ()
                }
                aie.objectfifo.release @flash_scale_2_2(Consume, 1)
              }
            }
            aie.objectfifo.release @of_8_switch_join_2_0(Consume, 1)
            aie.objectfifo.release @of_8_switch_join_2_1(Consume, 1)
            aie.objectfifo.release @of_5_broadcast_0_0(Consume, 1)
          }
          aie.objectfifo.release @of_9_unicast_2(Produce, 2)
        }
      }
      aie.end
    } {link_with = "op0_mha.o"}
    %flash_index_3_3 = aie.buffer(%tile_3_3) {sym_name = "flash_index_3_3"} : memref<2xi32> 
    %core_3_3 = aie.core(%tile_3_3) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c2 = arith.constant 2 : index
        scf.for %arg1 = %c0_0 to %c2 step %c1_1 {
          %0 = aie.objectfifo.acquire @of_9_unicast_3(Produce, 2) : !aie.objectfifosubview<memref<64x64xbf16>>
          %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
          func.call @op0_zero_bf16(%1) : (memref<64x64xbf16>) -> ()
          %2 = aie.objectfifo.subview.access %0[1] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
          func.call @op0_zero_bf16(%2) : (memref<64x64xbf16>) -> ()
          %c32 = arith.constant 32 : index
          scf.for %arg2 = %c0_0 to %c32 step %c1_1 {
            %3 = aie.objectfifo.acquire @of_5_broadcast_0_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %4 = aie.objectfifo.subview.access %3[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            %c2_2 = arith.constant 2 : index
            %5 = aie.objectfifo.acquire @of_8_switch_join_3_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %6 = aie.objectfifo.acquire @of_8_switch_join_3_1(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %7 = aie.objectfifo.subview.access %5[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            %8 = aie.objectfifo.subview.access %6[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            scf.for %arg3 = %c0_0 to %c2_2 step %c1_1 {
              %c1_3 = arith.constant 1 : index
              %c0_4 = arith.constant 0 : index
              %9 = arith.muli %c1_3, %arg3 : index
              %10 = arith.addi %c0_4, %9 : index
              %11 = arith.muli %c1_3, %c2_2 : index
              %12 = scf.index_switch %10 -> memref<64x64xbf16> 
              case 0 {
                scf.yield %1 : memref<64x64xbf16>
              }
              case 1 {
                scf.yield %2 : memref<64x64xbf16>
              }
              default {
                scf.yield %1 : memref<64x64xbf16>
              }
              %13 = scf.index_switch %arg3 -> memref<64x64xbf16> 
              case 0 {
                scf.yield %7 : memref<64x64xbf16>
              }
              case 1 {
                scf.yield %8 : memref<64x64xbf16>
              }
              default {
                scf.yield %7 : memref<64x64xbf16>
              }
              %14 = arith.index_cast %arg2 : index to i32
              %c1_i32 = arith.constant 1 : i32
              %15 = arith.muli %14, %c1_i32 : i32
              %c0_i32 = arith.constant 0 : i32
              %16 = arith.addi %c0_i32, %15 : i32
              %17 = arith.index_cast %arg3 : index to i32
              %c1_i32_5 = arith.constant 1 : i32
              %18 = arith.muli %17, %c1_i32_5 : i32
              %19 = arith.index_cast %arg3 : index to i32
              %c16_i32 = arith.constant 16 : i32
              %20 = arith.muli %19, %c16_i32 : i32
              %c6_i32 = arith.constant 6 : i32
              %21 = arith.addi %c6_i32, %18 : i32
              %22 = arith.addi %21, %20 : i32
              %c0_6 = arith.constant 0 : index
              %c1_7 = arith.constant 1 : index
              memref.store %16, %flash_index_3_3[%c0_6] : memref<2xi32>
              memref.store %22, %flash_index_3_3[%c1_7] : memref<2xi32>
              scf.index_switch %arg3 
              case 0 {
                %23 = aie.objectfifo.acquire @flash_scale_3_2(Consume, 1) : !aie.objectfifosubview<memref<256xbf16>>
                %24 = aie.objectfifo.subview.access %23[0] : !aie.objectfifosubview<memref<256xbf16>> -> memref<256xbf16>
                %c64_i32 = arith.constant 64 : i32
                %c0_i32_8 = arith.constant 0 : i32
                %25 = arith.cmpi ne, %16, %c0_i32_8 : i32
                %26 = arith.extui %25 : i1 to i32
                func.call @op0_matmul_PV(%13, %4, %12, %24, %c64_i32, %26, %flash_index_3_3) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>, memref<256xbf16>, i32, i32, memref<2xi32>) -> ()
                %c31_i32 = arith.constant 31 : i32
                %27 = arith.cmpi eq, %16, %c31_i32 : i32
                scf.if %27 {
                  func.call @op0_rescale_O(%12, %24, %c64_i32, %flash_index_3_3) : (memref<64x64xbf16>, memref<256xbf16>, i32, memref<2xi32>) -> ()
                }
                aie.objectfifo.release @flash_scale_3_2(Consume, 1)
                scf.yield
              }
              case 1 {
                %23 = aie.objectfifo.acquire @flash_scale_3_4(Consume, 1) : !aie.objectfifosubview<memref<256xbf16>>
                %24 = aie.objectfifo.subview.access %23[0] : !aie.objectfifosubview<memref<256xbf16>> -> memref<256xbf16>
                %c64_i32 = arith.constant 64 : i32
                %c0_i32_8 = arith.constant 0 : i32
                %25 = arith.cmpi ne, %16, %c0_i32_8 : i32
                %26 = arith.extui %25 : i1 to i32
                func.call @op0_matmul_PV(%13, %4, %12, %24, %c64_i32, %26, %flash_index_3_3) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>, memref<256xbf16>, i32, i32, memref<2xi32>) -> ()
                %c31_i32 = arith.constant 31 : i32
                %27 = arith.cmpi eq, %16, %c31_i32 : i32
                scf.if %27 {
                  func.call @op0_rescale_O(%12, %24, %c64_i32, %flash_index_3_3) : (memref<64x64xbf16>, memref<256xbf16>, i32, memref<2xi32>) -> ()
                }
                aie.objectfifo.release @flash_scale_3_4(Consume, 1)
                scf.yield
              }
              default {
                %23 = aie.objectfifo.acquire @flash_scale_3_2(Consume, 1) : !aie.objectfifosubview<memref<256xbf16>>
                %24 = aie.objectfifo.subview.access %23[0] : !aie.objectfifosubview<memref<256xbf16>> -> memref<256xbf16>
                %c64_i32 = arith.constant 64 : i32
                %c0_i32_8 = arith.constant 0 : i32
                %25 = arith.cmpi ne, %16, %c0_i32_8 : i32
                %26 = arith.extui %25 : i1 to i32
                func.call @op0_matmul_PV(%13, %4, %12, %24, %c64_i32, %26, %flash_index_3_3) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>, memref<256xbf16>, i32, i32, memref<2xi32>) -> ()
                %c31_i32 = arith.constant 31 : i32
                %27 = arith.cmpi eq, %16, %c31_i32 : i32
                scf.if %27 {
                  func.call @op0_rescale_O(%12, %24, %c64_i32, %flash_index_3_3) : (memref<64x64xbf16>, memref<256xbf16>, i32, memref<2xi32>) -> ()
                }
                aie.objectfifo.release @flash_scale_3_2(Consume, 1)
              }
            }
            aie.objectfifo.release @of_8_switch_join_3_0(Consume, 1)
            aie.objectfifo.release @of_8_switch_join_3_1(Consume, 1)
            aie.objectfifo.release @of_5_broadcast_0_0(Consume, 1)
          }
          aie.objectfifo.release @of_9_unicast_3(Produce, 2)
        }
      }
      aie.end
    } {link_with = "op0_mha.o"}
    %flash_index_4_3 = aie.buffer(%tile_4_3) {sym_name = "flash_index_4_3"} : memref<2xi32> 
    %core_4_3 = aie.core(%tile_4_3) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c2 = arith.constant 2 : index
        scf.for %arg1 = %c0_0 to %c2 step %c1_1 {
          %0 = aie.objectfifo.acquire @of_9_unicast_4(Produce, 2) : !aie.objectfifosubview<memref<64x64xbf16>>
          %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
          func.call @op0_zero_bf16(%1) : (memref<64x64xbf16>) -> ()
          %2 = aie.objectfifo.subview.access %0[1] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
          func.call @op0_zero_bf16(%2) : (memref<64x64xbf16>) -> ()
          %c32 = arith.constant 32 : index
          scf.for %arg2 = %c0_0 to %c32 step %c1_1 {
            %3 = aie.objectfifo.acquire @of_5_broadcast_0_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %4 = aie.objectfifo.subview.access %3[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            %c2_2 = arith.constant 2 : index
            %5 = aie.objectfifo.acquire @of_8_switch_join_4_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %6 = aie.objectfifo.acquire @of_8_switch_join_4_1(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %7 = aie.objectfifo.subview.access %5[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            %8 = aie.objectfifo.subview.access %6[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            scf.for %arg3 = %c0_0 to %c2_2 step %c1_1 {
              %c1_3 = arith.constant 1 : index
              %c0_4 = arith.constant 0 : index
              %9 = arith.muli %c1_3, %arg3 : index
              %10 = arith.addi %c0_4, %9 : index
              %11 = arith.muli %c1_3, %c2_2 : index
              %12 = scf.index_switch %10 -> memref<64x64xbf16> 
              case 0 {
                scf.yield %1 : memref<64x64xbf16>
              }
              case 1 {
                scf.yield %2 : memref<64x64xbf16>
              }
              default {
                scf.yield %1 : memref<64x64xbf16>
              }
              %13 = scf.index_switch %arg3 -> memref<64x64xbf16> 
              case 0 {
                scf.yield %7 : memref<64x64xbf16>
              }
              case 1 {
                scf.yield %8 : memref<64x64xbf16>
              }
              default {
                scf.yield %7 : memref<64x64xbf16>
              }
              %14 = arith.index_cast %arg2 : index to i32
              %c1_i32 = arith.constant 1 : i32
              %15 = arith.muli %14, %c1_i32 : i32
              %c0_i32 = arith.constant 0 : i32
              %16 = arith.addi %c0_i32, %15 : i32
              %17 = arith.index_cast %arg3 : index to i32
              %c1_i32_5 = arith.constant 1 : i32
              %18 = arith.muli %17, %c1_i32_5 : i32
              %19 = arith.index_cast %arg3 : index to i32
              %c16_i32 = arith.constant 16 : i32
              %20 = arith.muli %19, %c16_i32 : i32
              %c8_i32 = arith.constant 8 : i32
              %21 = arith.addi %c8_i32, %18 : i32
              %22 = arith.addi %21, %20 : i32
              %c0_6 = arith.constant 0 : index
              %c1_7 = arith.constant 1 : index
              memref.store %16, %flash_index_4_3[%c0_6] : memref<2xi32>
              memref.store %22, %flash_index_4_3[%c1_7] : memref<2xi32>
              scf.index_switch %arg3 
              case 0 {
                %23 = aie.objectfifo.acquire @flash_scale_4_2(Consume, 1) : !aie.objectfifosubview<memref<256xbf16>>
                %24 = aie.objectfifo.subview.access %23[0] : !aie.objectfifosubview<memref<256xbf16>> -> memref<256xbf16>
                %c64_i32 = arith.constant 64 : i32
                %c0_i32_8 = arith.constant 0 : i32
                %25 = arith.cmpi ne, %16, %c0_i32_8 : i32
                %26 = arith.extui %25 : i1 to i32
                func.call @op0_matmul_PV(%13, %4, %12, %24, %c64_i32, %26, %flash_index_4_3) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>, memref<256xbf16>, i32, i32, memref<2xi32>) -> ()
                %c31_i32 = arith.constant 31 : i32
                %27 = arith.cmpi eq, %16, %c31_i32 : i32
                scf.if %27 {
                  func.call @op0_rescale_O(%12, %24, %c64_i32, %flash_index_4_3) : (memref<64x64xbf16>, memref<256xbf16>, i32, memref<2xi32>) -> ()
                }
                aie.objectfifo.release @flash_scale_4_2(Consume, 1)
                scf.yield
              }
              case 1 {
                %23 = aie.objectfifo.acquire @flash_scale_4_4(Consume, 1) : !aie.objectfifosubview<memref<256xbf16>>
                %24 = aie.objectfifo.subview.access %23[0] : !aie.objectfifosubview<memref<256xbf16>> -> memref<256xbf16>
                %c64_i32 = arith.constant 64 : i32
                %c0_i32_8 = arith.constant 0 : i32
                %25 = arith.cmpi ne, %16, %c0_i32_8 : i32
                %26 = arith.extui %25 : i1 to i32
                func.call @op0_matmul_PV(%13, %4, %12, %24, %c64_i32, %26, %flash_index_4_3) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>, memref<256xbf16>, i32, i32, memref<2xi32>) -> ()
                %c31_i32 = arith.constant 31 : i32
                %27 = arith.cmpi eq, %16, %c31_i32 : i32
                scf.if %27 {
                  func.call @op0_rescale_O(%12, %24, %c64_i32, %flash_index_4_3) : (memref<64x64xbf16>, memref<256xbf16>, i32, memref<2xi32>) -> ()
                }
                aie.objectfifo.release @flash_scale_4_4(Consume, 1)
                scf.yield
              }
              default {
                %23 = aie.objectfifo.acquire @flash_scale_4_2(Consume, 1) : !aie.objectfifosubview<memref<256xbf16>>
                %24 = aie.objectfifo.subview.access %23[0] : !aie.objectfifosubview<memref<256xbf16>> -> memref<256xbf16>
                %c64_i32 = arith.constant 64 : i32
                %c0_i32_8 = arith.constant 0 : i32
                %25 = arith.cmpi ne, %16, %c0_i32_8 : i32
                %26 = arith.extui %25 : i1 to i32
                func.call @op0_matmul_PV(%13, %4, %12, %24, %c64_i32, %26, %flash_index_4_3) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>, memref<256xbf16>, i32, i32, memref<2xi32>) -> ()
                %c31_i32 = arith.constant 31 : i32
                %27 = arith.cmpi eq, %16, %c31_i32 : i32
                scf.if %27 {
                  func.call @op0_rescale_O(%12, %24, %c64_i32, %flash_index_4_3) : (memref<64x64xbf16>, memref<256xbf16>, i32, memref<2xi32>) -> ()
                }
                aie.objectfifo.release @flash_scale_4_2(Consume, 1)
              }
            }
            aie.objectfifo.release @of_8_switch_join_4_0(Consume, 1)
            aie.objectfifo.release @of_8_switch_join_4_1(Consume, 1)
            aie.objectfifo.release @of_5_broadcast_0_0(Consume, 1)
          }
          aie.objectfifo.release @of_9_unicast_4(Produce, 2)
        }
      }
      aie.end
    } {link_with = "op0_mha.o"}
    %flash_index_5_3 = aie.buffer(%tile_5_3) {sym_name = "flash_index_5_3"} : memref<2xi32> 
    %core_5_3 = aie.core(%tile_5_3) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c2 = arith.constant 2 : index
        scf.for %arg1 = %c0_0 to %c2 step %c1_1 {
          %0 = aie.objectfifo.acquire @of_9_unicast_5(Produce, 2) : !aie.objectfifosubview<memref<64x64xbf16>>
          %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
          func.call @op0_zero_bf16(%1) : (memref<64x64xbf16>) -> ()
          %2 = aie.objectfifo.subview.access %0[1] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
          func.call @op0_zero_bf16(%2) : (memref<64x64xbf16>) -> ()
          %c32 = arith.constant 32 : index
          scf.for %arg2 = %c0_0 to %c32 step %c1_1 {
            %3 = aie.objectfifo.acquire @of_5_broadcast_0_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %4 = aie.objectfifo.subview.access %3[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            %c2_2 = arith.constant 2 : index
            %5 = aie.objectfifo.acquire @of_8_switch_join_5_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %6 = aie.objectfifo.acquire @of_8_switch_join_5_1(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %7 = aie.objectfifo.subview.access %5[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            %8 = aie.objectfifo.subview.access %6[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            scf.for %arg3 = %c0_0 to %c2_2 step %c1_1 {
              %c1_3 = arith.constant 1 : index
              %c0_4 = arith.constant 0 : index
              %9 = arith.muli %c1_3, %arg3 : index
              %10 = arith.addi %c0_4, %9 : index
              %11 = arith.muli %c1_3, %c2_2 : index
              %12 = scf.index_switch %10 -> memref<64x64xbf16> 
              case 0 {
                scf.yield %1 : memref<64x64xbf16>
              }
              case 1 {
                scf.yield %2 : memref<64x64xbf16>
              }
              default {
                scf.yield %1 : memref<64x64xbf16>
              }
              %13 = scf.index_switch %arg3 -> memref<64x64xbf16> 
              case 0 {
                scf.yield %7 : memref<64x64xbf16>
              }
              case 1 {
                scf.yield %8 : memref<64x64xbf16>
              }
              default {
                scf.yield %7 : memref<64x64xbf16>
              }
              %14 = arith.index_cast %arg2 : index to i32
              %c1_i32 = arith.constant 1 : i32
              %15 = arith.muli %14, %c1_i32 : i32
              %c0_i32 = arith.constant 0 : i32
              %16 = arith.addi %c0_i32, %15 : i32
              %17 = arith.index_cast %arg3 : index to i32
              %c1_i32_5 = arith.constant 1 : i32
              %18 = arith.muli %17, %c1_i32_5 : i32
              %19 = arith.index_cast %arg3 : index to i32
              %c16_i32 = arith.constant 16 : i32
              %20 = arith.muli %19, %c16_i32 : i32
              %c10_i32 = arith.constant 10 : i32
              %21 = arith.addi %c10_i32, %18 : i32
              %22 = arith.addi %21, %20 : i32
              %c0_6 = arith.constant 0 : index
              %c1_7 = arith.constant 1 : index
              memref.store %16, %flash_index_5_3[%c0_6] : memref<2xi32>
              memref.store %22, %flash_index_5_3[%c1_7] : memref<2xi32>
              scf.index_switch %arg3 
              case 0 {
                %23 = aie.objectfifo.acquire @flash_scale_5_2(Consume, 1) : !aie.objectfifosubview<memref<256xbf16>>
                %24 = aie.objectfifo.subview.access %23[0] : !aie.objectfifosubview<memref<256xbf16>> -> memref<256xbf16>
                %c64_i32 = arith.constant 64 : i32
                %c0_i32_8 = arith.constant 0 : i32
                %25 = arith.cmpi ne, %16, %c0_i32_8 : i32
                %26 = arith.extui %25 : i1 to i32
                func.call @op0_matmul_PV(%13, %4, %12, %24, %c64_i32, %26, %flash_index_5_3) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>, memref<256xbf16>, i32, i32, memref<2xi32>) -> ()
                %c31_i32 = arith.constant 31 : i32
                %27 = arith.cmpi eq, %16, %c31_i32 : i32
                scf.if %27 {
                  func.call @op0_rescale_O(%12, %24, %c64_i32, %flash_index_5_3) : (memref<64x64xbf16>, memref<256xbf16>, i32, memref<2xi32>) -> ()
                }
                aie.objectfifo.release @flash_scale_5_2(Consume, 1)
                scf.yield
              }
              case 1 {
                %23 = aie.objectfifo.acquire @flash_scale_5_4(Consume, 1) : !aie.objectfifosubview<memref<256xbf16>>
                %24 = aie.objectfifo.subview.access %23[0] : !aie.objectfifosubview<memref<256xbf16>> -> memref<256xbf16>
                %c64_i32 = arith.constant 64 : i32
                %c0_i32_8 = arith.constant 0 : i32
                %25 = arith.cmpi ne, %16, %c0_i32_8 : i32
                %26 = arith.extui %25 : i1 to i32
                func.call @op0_matmul_PV(%13, %4, %12, %24, %c64_i32, %26, %flash_index_5_3) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>, memref<256xbf16>, i32, i32, memref<2xi32>) -> ()
                %c31_i32 = arith.constant 31 : i32
                %27 = arith.cmpi eq, %16, %c31_i32 : i32
                scf.if %27 {
                  func.call @op0_rescale_O(%12, %24, %c64_i32, %flash_index_5_3) : (memref<64x64xbf16>, memref<256xbf16>, i32, memref<2xi32>) -> ()
                }
                aie.objectfifo.release @flash_scale_5_4(Consume, 1)
                scf.yield
              }
              default {
                %23 = aie.objectfifo.acquire @flash_scale_5_2(Consume, 1) : !aie.objectfifosubview<memref<256xbf16>>
                %24 = aie.objectfifo.subview.access %23[0] : !aie.objectfifosubview<memref<256xbf16>> -> memref<256xbf16>
                %c64_i32 = arith.constant 64 : i32
                %c0_i32_8 = arith.constant 0 : i32
                %25 = arith.cmpi ne, %16, %c0_i32_8 : i32
                %26 = arith.extui %25 : i1 to i32
                func.call @op0_matmul_PV(%13, %4, %12, %24, %c64_i32, %26, %flash_index_5_3) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>, memref<256xbf16>, i32, i32, memref<2xi32>) -> ()
                %c31_i32 = arith.constant 31 : i32
                %27 = arith.cmpi eq, %16, %c31_i32 : i32
                scf.if %27 {
                  func.call @op0_rescale_O(%12, %24, %c64_i32, %flash_index_5_3) : (memref<64x64xbf16>, memref<256xbf16>, i32, memref<2xi32>) -> ()
                }
                aie.objectfifo.release @flash_scale_5_2(Consume, 1)
              }
            }
            aie.objectfifo.release @of_8_switch_join_5_0(Consume, 1)
            aie.objectfifo.release @of_8_switch_join_5_1(Consume, 1)
            aie.objectfifo.release @of_5_broadcast_0_0(Consume, 1)
          }
          aie.objectfifo.release @of_9_unicast_5(Produce, 2)
        }
      }
      aie.end
    } {link_with = "op0_mha.o"}
    %flash_index_6_3 = aie.buffer(%tile_6_3) {sym_name = "flash_index_6_3"} : memref<2xi32> 
    %core_6_3 = aie.core(%tile_6_3) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c2 = arith.constant 2 : index
        scf.for %arg1 = %c0_0 to %c2 step %c1_1 {
          %0 = aie.objectfifo.acquire @of_9_unicast_6(Produce, 2) : !aie.objectfifosubview<memref<64x64xbf16>>
          %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
          func.call @op0_zero_bf16(%1) : (memref<64x64xbf16>) -> ()
          %2 = aie.objectfifo.subview.access %0[1] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
          func.call @op0_zero_bf16(%2) : (memref<64x64xbf16>) -> ()
          %c32 = arith.constant 32 : index
          scf.for %arg2 = %c0_0 to %c32 step %c1_1 {
            %3 = aie.objectfifo.acquire @of_5_broadcast_0_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %4 = aie.objectfifo.subview.access %3[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            %c2_2 = arith.constant 2 : index
            %5 = aie.objectfifo.acquire @of_8_switch_join_6_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %6 = aie.objectfifo.acquire @of_8_switch_join_6_1(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %7 = aie.objectfifo.subview.access %5[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            %8 = aie.objectfifo.subview.access %6[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            scf.for %arg3 = %c0_0 to %c2_2 step %c1_1 {
              %c1_3 = arith.constant 1 : index
              %c0_4 = arith.constant 0 : index
              %9 = arith.muli %c1_3, %arg3 : index
              %10 = arith.addi %c0_4, %9 : index
              %11 = arith.muli %c1_3, %c2_2 : index
              %12 = scf.index_switch %10 -> memref<64x64xbf16> 
              case 0 {
                scf.yield %1 : memref<64x64xbf16>
              }
              case 1 {
                scf.yield %2 : memref<64x64xbf16>
              }
              default {
                scf.yield %1 : memref<64x64xbf16>
              }
              %13 = scf.index_switch %arg3 -> memref<64x64xbf16> 
              case 0 {
                scf.yield %7 : memref<64x64xbf16>
              }
              case 1 {
                scf.yield %8 : memref<64x64xbf16>
              }
              default {
                scf.yield %7 : memref<64x64xbf16>
              }
              %14 = arith.index_cast %arg2 : index to i32
              %c1_i32 = arith.constant 1 : i32
              %15 = arith.muli %14, %c1_i32 : i32
              %c0_i32 = arith.constant 0 : i32
              %16 = arith.addi %c0_i32, %15 : i32
              %17 = arith.index_cast %arg3 : index to i32
              %c1_i32_5 = arith.constant 1 : i32
              %18 = arith.muli %17, %c1_i32_5 : i32
              %19 = arith.index_cast %arg3 : index to i32
              %c16_i32 = arith.constant 16 : i32
              %20 = arith.muli %19, %c16_i32 : i32
              %c12_i32 = arith.constant 12 : i32
              %21 = arith.addi %c12_i32, %18 : i32
              %22 = arith.addi %21, %20 : i32
              %c0_6 = arith.constant 0 : index
              %c1_7 = arith.constant 1 : index
              memref.store %16, %flash_index_6_3[%c0_6] : memref<2xi32>
              memref.store %22, %flash_index_6_3[%c1_7] : memref<2xi32>
              scf.index_switch %arg3 
              case 0 {
                %23 = aie.objectfifo.acquire @flash_scale_6_2(Consume, 1) : !aie.objectfifosubview<memref<256xbf16>>
                %24 = aie.objectfifo.subview.access %23[0] : !aie.objectfifosubview<memref<256xbf16>> -> memref<256xbf16>
                %c64_i32 = arith.constant 64 : i32
                %c0_i32_8 = arith.constant 0 : i32
                %25 = arith.cmpi ne, %16, %c0_i32_8 : i32
                %26 = arith.extui %25 : i1 to i32
                func.call @op0_matmul_PV(%13, %4, %12, %24, %c64_i32, %26, %flash_index_6_3) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>, memref<256xbf16>, i32, i32, memref<2xi32>) -> ()
                %c31_i32 = arith.constant 31 : i32
                %27 = arith.cmpi eq, %16, %c31_i32 : i32
                scf.if %27 {
                  func.call @op0_rescale_O(%12, %24, %c64_i32, %flash_index_6_3) : (memref<64x64xbf16>, memref<256xbf16>, i32, memref<2xi32>) -> ()
                }
                aie.objectfifo.release @flash_scale_6_2(Consume, 1)
                scf.yield
              }
              case 1 {
                %23 = aie.objectfifo.acquire @flash_scale_6_4(Consume, 1) : !aie.objectfifosubview<memref<256xbf16>>
                %24 = aie.objectfifo.subview.access %23[0] : !aie.objectfifosubview<memref<256xbf16>> -> memref<256xbf16>
                %c64_i32 = arith.constant 64 : i32
                %c0_i32_8 = arith.constant 0 : i32
                %25 = arith.cmpi ne, %16, %c0_i32_8 : i32
                %26 = arith.extui %25 : i1 to i32
                func.call @op0_matmul_PV(%13, %4, %12, %24, %c64_i32, %26, %flash_index_6_3) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>, memref<256xbf16>, i32, i32, memref<2xi32>) -> ()
                %c31_i32 = arith.constant 31 : i32
                %27 = arith.cmpi eq, %16, %c31_i32 : i32
                scf.if %27 {
                  func.call @op0_rescale_O(%12, %24, %c64_i32, %flash_index_6_3) : (memref<64x64xbf16>, memref<256xbf16>, i32, memref<2xi32>) -> ()
                }
                aie.objectfifo.release @flash_scale_6_4(Consume, 1)
                scf.yield
              }
              default {
                %23 = aie.objectfifo.acquire @flash_scale_6_2(Consume, 1) : !aie.objectfifosubview<memref<256xbf16>>
                %24 = aie.objectfifo.subview.access %23[0] : !aie.objectfifosubview<memref<256xbf16>> -> memref<256xbf16>
                %c64_i32 = arith.constant 64 : i32
                %c0_i32_8 = arith.constant 0 : i32
                %25 = arith.cmpi ne, %16, %c0_i32_8 : i32
                %26 = arith.extui %25 : i1 to i32
                func.call @op0_matmul_PV(%13, %4, %12, %24, %c64_i32, %26, %flash_index_6_3) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>, memref<256xbf16>, i32, i32, memref<2xi32>) -> ()
                %c31_i32 = arith.constant 31 : i32
                %27 = arith.cmpi eq, %16, %c31_i32 : i32
                scf.if %27 {
                  func.call @op0_rescale_O(%12, %24, %c64_i32, %flash_index_6_3) : (memref<64x64xbf16>, memref<256xbf16>, i32, memref<2xi32>) -> ()
                }
                aie.objectfifo.release @flash_scale_6_2(Consume, 1)
              }
            }
            aie.objectfifo.release @of_8_switch_join_6_0(Consume, 1)
            aie.objectfifo.release @of_8_switch_join_6_1(Consume, 1)
            aie.objectfifo.release @of_5_broadcast_0_0(Consume, 1)
          }
          aie.objectfifo.release @of_9_unicast_6(Produce, 2)
        }
      }
      aie.end
    } {link_with = "op0_mha.o"}
    %flash_index_7_3 = aie.buffer(%tile_7_3) {sym_name = "flash_index_7_3"} : memref<2xi32> 
    %core_7_3 = aie.core(%tile_7_3) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c2 = arith.constant 2 : index
        scf.for %arg1 = %c0_0 to %c2 step %c1_1 {
          %0 = aie.objectfifo.acquire @of_9_unicast_7(Produce, 2) : !aie.objectfifosubview<memref<64x64xbf16>>
          %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
          func.call @op0_zero_bf16(%1) : (memref<64x64xbf16>) -> ()
          %2 = aie.objectfifo.subview.access %0[1] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
          func.call @op0_zero_bf16(%2) : (memref<64x64xbf16>) -> ()
          %c32 = arith.constant 32 : index
          scf.for %arg2 = %c0_0 to %c32 step %c1_1 {
            %3 = aie.objectfifo.acquire @of_5_broadcast_0_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %4 = aie.objectfifo.subview.access %3[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            %c2_2 = arith.constant 2 : index
            %5 = aie.objectfifo.acquire @of_8_switch_join_7_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %6 = aie.objectfifo.acquire @of_8_switch_join_7_1(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %7 = aie.objectfifo.subview.access %5[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            %8 = aie.objectfifo.subview.access %6[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            scf.for %arg3 = %c0_0 to %c2_2 step %c1_1 {
              %c1_3 = arith.constant 1 : index
              %c0_4 = arith.constant 0 : index
              %9 = arith.muli %c1_3, %arg3 : index
              %10 = arith.addi %c0_4, %9 : index
              %11 = arith.muli %c1_3, %c2_2 : index
              %12 = scf.index_switch %10 -> memref<64x64xbf16> 
              case 0 {
                scf.yield %1 : memref<64x64xbf16>
              }
              case 1 {
                scf.yield %2 : memref<64x64xbf16>
              }
              default {
                scf.yield %1 : memref<64x64xbf16>
              }
              %13 = scf.index_switch %arg3 -> memref<64x64xbf16> 
              case 0 {
                scf.yield %7 : memref<64x64xbf16>
              }
              case 1 {
                scf.yield %8 : memref<64x64xbf16>
              }
              default {
                scf.yield %7 : memref<64x64xbf16>
              }
              %14 = arith.index_cast %arg2 : index to i32
              %c1_i32 = arith.constant 1 : i32
              %15 = arith.muli %14, %c1_i32 : i32
              %c0_i32 = arith.constant 0 : i32
              %16 = arith.addi %c0_i32, %15 : i32
              %17 = arith.index_cast %arg3 : index to i32
              %c1_i32_5 = arith.constant 1 : i32
              %18 = arith.muli %17, %c1_i32_5 : i32
              %19 = arith.index_cast %arg3 : index to i32
              %c16_i32 = arith.constant 16 : i32
              %20 = arith.muli %19, %c16_i32 : i32
              %c14_i32 = arith.constant 14 : i32
              %21 = arith.addi %c14_i32, %18 : i32
              %22 = arith.addi %21, %20 : i32
              %c0_6 = arith.constant 0 : index
              %c1_7 = arith.constant 1 : index
              memref.store %16, %flash_index_7_3[%c0_6] : memref<2xi32>
              memref.store %22, %flash_index_7_3[%c1_7] : memref<2xi32>
              scf.index_switch %arg3 
              case 0 {
                %23 = aie.objectfifo.acquire @flash_scale_7_2(Consume, 1) : !aie.objectfifosubview<memref<256xbf16>>
                %24 = aie.objectfifo.subview.access %23[0] : !aie.objectfifosubview<memref<256xbf16>> -> memref<256xbf16>
                %c64_i32 = arith.constant 64 : i32
                %c0_i32_8 = arith.constant 0 : i32
                %25 = arith.cmpi ne, %16, %c0_i32_8 : i32
                %26 = arith.extui %25 : i1 to i32
                func.call @op0_matmul_PV(%13, %4, %12, %24, %c64_i32, %26, %flash_index_7_3) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>, memref<256xbf16>, i32, i32, memref<2xi32>) -> ()
                %c31_i32 = arith.constant 31 : i32
                %27 = arith.cmpi eq, %16, %c31_i32 : i32
                scf.if %27 {
                  func.call @op0_rescale_O(%12, %24, %c64_i32, %flash_index_7_3) : (memref<64x64xbf16>, memref<256xbf16>, i32, memref<2xi32>) -> ()
                }
                aie.objectfifo.release @flash_scale_7_2(Consume, 1)
                scf.yield
              }
              case 1 {
                %23 = aie.objectfifo.acquire @flash_scale_7_4(Consume, 1) : !aie.objectfifosubview<memref<256xbf16>>
                %24 = aie.objectfifo.subview.access %23[0] : !aie.objectfifosubview<memref<256xbf16>> -> memref<256xbf16>
                %c64_i32 = arith.constant 64 : i32
                %c0_i32_8 = arith.constant 0 : i32
                %25 = arith.cmpi ne, %16, %c0_i32_8 : i32
                %26 = arith.extui %25 : i1 to i32
                func.call @op0_matmul_PV(%13, %4, %12, %24, %c64_i32, %26, %flash_index_7_3) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>, memref<256xbf16>, i32, i32, memref<2xi32>) -> ()
                %c31_i32 = arith.constant 31 : i32
                %27 = arith.cmpi eq, %16, %c31_i32 : i32
                scf.if %27 {
                  func.call @op0_rescale_O(%12, %24, %c64_i32, %flash_index_7_3) : (memref<64x64xbf16>, memref<256xbf16>, i32, memref<2xi32>) -> ()
                }
                aie.objectfifo.release @flash_scale_7_4(Consume, 1)
                scf.yield
              }
              default {
                %23 = aie.objectfifo.acquire @flash_scale_7_2(Consume, 1) : !aie.objectfifosubview<memref<256xbf16>>
                %24 = aie.objectfifo.subview.access %23[0] : !aie.objectfifosubview<memref<256xbf16>> -> memref<256xbf16>
                %c64_i32 = arith.constant 64 : i32
                %c0_i32_8 = arith.constant 0 : i32
                %25 = arith.cmpi ne, %16, %c0_i32_8 : i32
                %26 = arith.extui %25 : i1 to i32
                func.call @op0_matmul_PV(%13, %4, %12, %24, %c64_i32, %26, %flash_index_7_3) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>, memref<256xbf16>, i32, i32, memref<2xi32>) -> ()
                %c31_i32 = arith.constant 31 : i32
                %27 = arith.cmpi eq, %16, %c31_i32 : i32
                scf.if %27 {
                  func.call @op0_rescale_O(%12, %24, %c64_i32, %flash_index_7_3) : (memref<64x64xbf16>, memref<256xbf16>, i32, memref<2xi32>) -> ()
                }
                aie.objectfifo.release @flash_scale_7_2(Consume, 1)
              }
            }
            aie.objectfifo.release @of_8_switch_join_7_0(Consume, 1)
            aie.objectfifo.release @of_8_switch_join_7_1(Consume, 1)
            aie.objectfifo.release @of_5_broadcast_0_0(Consume, 1)
          }
          aie.objectfifo.release @of_9_unicast_7(Produce, 2)
        }
      }
      aie.end
    } {link_with = "op0_mha.o"}
    %flash_state_0_2 = aie.buffer(%tile_0_2) {sym_name = "flash_state_0_2"} : memref<256xbf16> 
    %flash_index_0_2 = aie.buffer(%tile_0_2) {sym_name = "flash_index_0_2"} : memref<2xi32> 
    aie.objectfifo @flash_scale_0_2(%tile_0_2, {%tile_0_3}, 2 : i32) : !aie.objectfifo<memref<256xbf16>>  
    %core_0_2 = aie.core(%tile_0_2) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c2 = arith.constant 2 : index
        scf.for %arg1 = %c0_0 to %c2 step %c1_1 {
          %c32 = arith.constant 32 : index
          scf.for %arg2 = %c0_0 to %c32 step %c1_1 {
            %0 = aie.objectfifo.acquire @of_8_switch_join_0_0(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            %2 = aie.objectfifo.acquire @of_7_distribute_0_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %3 = aie.objectfifo.subview.access %2[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            %4 = arith.index_cast %arg2 : index to i32
            %c1_i32 = arith.constant 1 : i32
            %5 = arith.muli %4, %c1_i32 : i32
            %c0_i32 = arith.constant 0 : i32
            %6 = arith.addi %c0_i32, %5 : i32
            %7 = arith.index_cast %arg1 : index to i32
            %c16_i32 = arith.constant 16 : i32
            %8 = arith.muli %7, %c16_i32 : i32
            %c0_i32_2 = arith.constant 0 : i32
            %9 = arith.addi %c0_i32_2, %8 : i32
            %c0_3 = arith.constant 0 : index
            %c1_4 = arith.constant 1 : index
            memref.store %6, %flash_index_0_2[%c0_3] : memref<2xi32>
            memref.store %9, %flash_index_0_2[%c1_4] : memref<2xi32>
            %c64_i32 = arith.constant 64 : i32
            %c0_i32_5 = arith.constant 0 : i32
            %10 = arith.cmpi eq, %6, %c0_i32_5 : i32
            scf.if %10 {
              func.call @op0_init_scale_buffer(%flash_state_0_2, %c64_i32) : (memref<256xbf16>, i32) -> ()
            }
            %cst = arith.constant 1.4453125 : f32
            %11 = arith.truncf %cst : f32 to bf16
            %c64_i32_6 = arith.constant 64 : i32
            %c2048_i32 = arith.constant 2048 : i32
            %c2048_i32_7 = arith.constant 2048 : i32
            func.call @op0_partial_softmax(%3, %1, %flash_state_0_2, %flash_index_0_2, %11, %c64_i32, %c64_i32_6, %c2048_i32, %c2048_i32_7) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<256xbf16>, memref<2xi32>, bf16, i32, i32, i32, i32) -> ()
            %12 = aie.objectfifo.acquire @flash_scale_0_2(Produce, 1) : !aie.objectfifosubview<memref<256xbf16>>
            %13 = aie.objectfifo.subview.access %12[0] : !aie.objectfifosubview<memref<256xbf16>> -> memref<256xbf16>
            %c256_i32 = arith.constant 256 : i32
            func.call @op0_passThroughLine(%flash_state_0_2, %13, %c256_i32) : (memref<256xbf16>, memref<256xbf16>, i32) -> ()
            aie.objectfifo.release @flash_scale_0_2(Produce, 1)
            aie.objectfifo.release @of_7_distribute_0_0(Consume, 1)
            aie.objectfifo.release @of_8_switch_join_0_0(Produce, 1)
          }
        }
      }
      aie.end
    } {link_with = "op0_mha.o"}
    %flash_state_1_2 = aie.buffer(%tile_1_2) {sym_name = "flash_state_1_2"} : memref<256xbf16> 
    %flash_index_1_2 = aie.buffer(%tile_1_2) {sym_name = "flash_index_1_2"} : memref<2xi32> 
    aie.objectfifo @flash_scale_1_2(%tile_1_2, {%tile_1_3}, 2 : i32) : !aie.objectfifo<memref<256xbf16>>  
    %core_1_2 = aie.core(%tile_1_2) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c2 = arith.constant 2 : index
        scf.for %arg1 = %c0_0 to %c2 step %c1_1 {
          %c32 = arith.constant 32 : index
          scf.for %arg2 = %c0_0 to %c32 step %c1_1 {
            %0 = aie.objectfifo.acquire @of_8_switch_join_1_0(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            %2 = aie.objectfifo.acquire @of_7_distribute_1_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %3 = aie.objectfifo.subview.access %2[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            %4 = arith.index_cast %arg2 : index to i32
            %c1_i32 = arith.constant 1 : i32
            %5 = arith.muli %4, %c1_i32 : i32
            %c0_i32 = arith.constant 0 : i32
            %6 = arith.addi %c0_i32, %5 : i32
            %7 = arith.index_cast %arg1 : index to i32
            %c16_i32 = arith.constant 16 : i32
            %8 = arith.muli %7, %c16_i32 : i32
            %c1_i32_2 = arith.constant 1 : i32
            %9 = arith.addi %c1_i32_2, %8 : i32
            %c0_3 = arith.constant 0 : index
            %c1_4 = arith.constant 1 : index
            memref.store %6, %flash_index_1_2[%c0_3] : memref<2xi32>
            memref.store %9, %flash_index_1_2[%c1_4] : memref<2xi32>
            %c64_i32 = arith.constant 64 : i32
            %c0_i32_5 = arith.constant 0 : i32
            %10 = arith.cmpi eq, %6, %c0_i32_5 : i32
            scf.if %10 {
              func.call @op0_init_scale_buffer(%flash_state_1_2, %c64_i32) : (memref<256xbf16>, i32) -> ()
            }
            %cst = arith.constant 1.4453125 : f32
            %11 = arith.truncf %cst : f32 to bf16
            %c64_i32_6 = arith.constant 64 : i32
            %c2048_i32 = arith.constant 2048 : i32
            %c2048_i32_7 = arith.constant 2048 : i32
            func.call @op0_partial_softmax(%3, %1, %flash_state_1_2, %flash_index_1_2, %11, %c64_i32, %c64_i32_6, %c2048_i32, %c2048_i32_7) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<256xbf16>, memref<2xi32>, bf16, i32, i32, i32, i32) -> ()
            %12 = aie.objectfifo.acquire @flash_scale_1_2(Produce, 1) : !aie.objectfifosubview<memref<256xbf16>>
            %13 = aie.objectfifo.subview.access %12[0] : !aie.objectfifosubview<memref<256xbf16>> -> memref<256xbf16>
            %c256_i32 = arith.constant 256 : i32
            func.call @op0_passThroughLine(%flash_state_1_2, %13, %c256_i32) : (memref<256xbf16>, memref<256xbf16>, i32) -> ()
            aie.objectfifo.release @flash_scale_1_2(Produce, 1)
            aie.objectfifo.release @of_7_distribute_1_0(Consume, 1)
            aie.objectfifo.release @of_8_switch_join_1_0(Produce, 1)
          }
        }
      }
      aie.end
    } {link_with = "op0_mha.o"}
    %flash_state_2_2 = aie.buffer(%tile_2_2) {sym_name = "flash_state_2_2"} : memref<256xbf16> 
    %flash_index_2_2 = aie.buffer(%tile_2_2) {sym_name = "flash_index_2_2"} : memref<2xi32> 
    aie.objectfifo @flash_scale_2_2(%tile_2_2, {%tile_2_3}, 2 : i32) : !aie.objectfifo<memref<256xbf16>>  
    %core_2_2 = aie.core(%tile_2_2) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c2 = arith.constant 2 : index
        scf.for %arg1 = %c0_0 to %c2 step %c1_1 {
          %c32 = arith.constant 32 : index
          scf.for %arg2 = %c0_0 to %c32 step %c1_1 {
            %0 = aie.objectfifo.acquire @of_8_switch_join_2_0(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            %2 = aie.objectfifo.acquire @of_7_distribute_2_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %3 = aie.objectfifo.subview.access %2[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            %4 = arith.index_cast %arg2 : index to i32
            %c1_i32 = arith.constant 1 : i32
            %5 = arith.muli %4, %c1_i32 : i32
            %c0_i32 = arith.constant 0 : i32
            %6 = arith.addi %c0_i32, %5 : i32
            %7 = arith.index_cast %arg1 : index to i32
            %c16_i32 = arith.constant 16 : i32
            %8 = arith.muli %7, %c16_i32 : i32
            %c2_i32 = arith.constant 2 : i32
            %9 = arith.addi %c2_i32, %8 : i32
            %c0_2 = arith.constant 0 : index
            %c1_3 = arith.constant 1 : index
            memref.store %6, %flash_index_2_2[%c0_2] : memref<2xi32>
            memref.store %9, %flash_index_2_2[%c1_3] : memref<2xi32>
            %c64_i32 = arith.constant 64 : i32
            %c0_i32_4 = arith.constant 0 : i32
            %10 = arith.cmpi eq, %6, %c0_i32_4 : i32
            scf.if %10 {
              func.call @op0_init_scale_buffer(%flash_state_2_2, %c64_i32) : (memref<256xbf16>, i32) -> ()
            }
            %cst = arith.constant 1.4453125 : f32
            %11 = arith.truncf %cst : f32 to bf16
            %c64_i32_5 = arith.constant 64 : i32
            %c2048_i32 = arith.constant 2048 : i32
            %c2048_i32_6 = arith.constant 2048 : i32
            func.call @op0_partial_softmax(%3, %1, %flash_state_2_2, %flash_index_2_2, %11, %c64_i32, %c64_i32_5, %c2048_i32, %c2048_i32_6) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<256xbf16>, memref<2xi32>, bf16, i32, i32, i32, i32) -> ()
            %12 = aie.objectfifo.acquire @flash_scale_2_2(Produce, 1) : !aie.objectfifosubview<memref<256xbf16>>
            %13 = aie.objectfifo.subview.access %12[0] : !aie.objectfifosubview<memref<256xbf16>> -> memref<256xbf16>
            %c256_i32 = arith.constant 256 : i32
            func.call @op0_passThroughLine(%flash_state_2_2, %13, %c256_i32) : (memref<256xbf16>, memref<256xbf16>, i32) -> ()
            aie.objectfifo.release @flash_scale_2_2(Produce, 1)
            aie.objectfifo.release @of_7_distribute_2_0(Consume, 1)
            aie.objectfifo.release @of_8_switch_join_2_0(Produce, 1)
          }
        }
      }
      aie.end
    } {link_with = "op0_mha.o"}
    %flash_state_3_2 = aie.buffer(%tile_3_2) {sym_name = "flash_state_3_2"} : memref<256xbf16> 
    %flash_index_3_2 = aie.buffer(%tile_3_2) {sym_name = "flash_index_3_2"} : memref<2xi32> 
    aie.objectfifo @flash_scale_3_2(%tile_3_2, {%tile_3_3}, 2 : i32) : !aie.objectfifo<memref<256xbf16>>  
    %core_3_2 = aie.core(%tile_3_2) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c2 = arith.constant 2 : index
        scf.for %arg1 = %c0_0 to %c2 step %c1_1 {
          %c32 = arith.constant 32 : index
          scf.for %arg2 = %c0_0 to %c32 step %c1_1 {
            %0 = aie.objectfifo.acquire @of_8_switch_join_3_0(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            %2 = aie.objectfifo.acquire @of_7_distribute_3_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %3 = aie.objectfifo.subview.access %2[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            %4 = arith.index_cast %arg2 : index to i32
            %c1_i32 = arith.constant 1 : i32
            %5 = arith.muli %4, %c1_i32 : i32
            %c0_i32 = arith.constant 0 : i32
            %6 = arith.addi %c0_i32, %5 : i32
            %7 = arith.index_cast %arg1 : index to i32
            %c16_i32 = arith.constant 16 : i32
            %8 = arith.muli %7, %c16_i32 : i32
            %c3_i32 = arith.constant 3 : i32
            %9 = arith.addi %c3_i32, %8 : i32
            %c0_2 = arith.constant 0 : index
            %c1_3 = arith.constant 1 : index
            memref.store %6, %flash_index_3_2[%c0_2] : memref<2xi32>
            memref.store %9, %flash_index_3_2[%c1_3] : memref<2xi32>
            %c64_i32 = arith.constant 64 : i32
            %c0_i32_4 = arith.constant 0 : i32
            %10 = arith.cmpi eq, %6, %c0_i32_4 : i32
            scf.if %10 {
              func.call @op0_init_scale_buffer(%flash_state_3_2, %c64_i32) : (memref<256xbf16>, i32) -> ()
            }
            %cst = arith.constant 1.4453125 : f32
            %11 = arith.truncf %cst : f32 to bf16
            %c64_i32_5 = arith.constant 64 : i32
            %c2048_i32 = arith.constant 2048 : i32
            %c2048_i32_6 = arith.constant 2048 : i32
            func.call @op0_partial_softmax(%3, %1, %flash_state_3_2, %flash_index_3_2, %11, %c64_i32, %c64_i32_5, %c2048_i32, %c2048_i32_6) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<256xbf16>, memref<2xi32>, bf16, i32, i32, i32, i32) -> ()
            %12 = aie.objectfifo.acquire @flash_scale_3_2(Produce, 1) : !aie.objectfifosubview<memref<256xbf16>>
            %13 = aie.objectfifo.subview.access %12[0] : !aie.objectfifosubview<memref<256xbf16>> -> memref<256xbf16>
            %c256_i32 = arith.constant 256 : i32
            func.call @op0_passThroughLine(%flash_state_3_2, %13, %c256_i32) : (memref<256xbf16>, memref<256xbf16>, i32) -> ()
            aie.objectfifo.release @flash_scale_3_2(Produce, 1)
            aie.objectfifo.release @of_7_distribute_3_0(Consume, 1)
            aie.objectfifo.release @of_8_switch_join_3_0(Produce, 1)
          }
        }
      }
      aie.end
    } {link_with = "op0_mha.o"}
    %flash_state_4_2 = aie.buffer(%tile_4_2) {sym_name = "flash_state_4_2"} : memref<256xbf16> 
    %flash_index_4_2 = aie.buffer(%tile_4_2) {sym_name = "flash_index_4_2"} : memref<2xi32> 
    aie.objectfifo @flash_scale_4_2(%tile_4_2, {%tile_4_3}, 2 : i32) : !aie.objectfifo<memref<256xbf16>>  
    %core_4_2 = aie.core(%tile_4_2) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c2 = arith.constant 2 : index
        scf.for %arg1 = %c0_0 to %c2 step %c1_1 {
          %c32 = arith.constant 32 : index
          scf.for %arg2 = %c0_0 to %c32 step %c1_1 {
            %0 = aie.objectfifo.acquire @of_8_switch_join_4_0(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            %2 = aie.objectfifo.acquire @of_7_distribute_4_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %3 = aie.objectfifo.subview.access %2[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            %4 = arith.index_cast %arg2 : index to i32
            %c1_i32 = arith.constant 1 : i32
            %5 = arith.muli %4, %c1_i32 : i32
            %c0_i32 = arith.constant 0 : i32
            %6 = arith.addi %c0_i32, %5 : i32
            %7 = arith.index_cast %arg1 : index to i32
            %c16_i32 = arith.constant 16 : i32
            %8 = arith.muli %7, %c16_i32 : i32
            %c4_i32 = arith.constant 4 : i32
            %9 = arith.addi %c4_i32, %8 : i32
            %c0_2 = arith.constant 0 : index
            %c1_3 = arith.constant 1 : index
            memref.store %6, %flash_index_4_2[%c0_2] : memref<2xi32>
            memref.store %9, %flash_index_4_2[%c1_3] : memref<2xi32>
            %c64_i32 = arith.constant 64 : i32
            %c0_i32_4 = arith.constant 0 : i32
            %10 = arith.cmpi eq, %6, %c0_i32_4 : i32
            scf.if %10 {
              func.call @op0_init_scale_buffer(%flash_state_4_2, %c64_i32) : (memref<256xbf16>, i32) -> ()
            }
            %cst = arith.constant 1.4453125 : f32
            %11 = arith.truncf %cst : f32 to bf16
            %c64_i32_5 = arith.constant 64 : i32
            %c2048_i32 = arith.constant 2048 : i32
            %c2048_i32_6 = arith.constant 2048 : i32
            func.call @op0_partial_softmax(%3, %1, %flash_state_4_2, %flash_index_4_2, %11, %c64_i32, %c64_i32_5, %c2048_i32, %c2048_i32_6) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<256xbf16>, memref<2xi32>, bf16, i32, i32, i32, i32) -> ()
            %12 = aie.objectfifo.acquire @flash_scale_4_2(Produce, 1) : !aie.objectfifosubview<memref<256xbf16>>
            %13 = aie.objectfifo.subview.access %12[0] : !aie.objectfifosubview<memref<256xbf16>> -> memref<256xbf16>
            %c256_i32 = arith.constant 256 : i32
            func.call @op0_passThroughLine(%flash_state_4_2, %13, %c256_i32) : (memref<256xbf16>, memref<256xbf16>, i32) -> ()
            aie.objectfifo.release @flash_scale_4_2(Produce, 1)
            aie.objectfifo.release @of_7_distribute_4_0(Consume, 1)
            aie.objectfifo.release @of_8_switch_join_4_0(Produce, 1)
          }
        }
      }
      aie.end
    } {link_with = "op0_mha.o"}
    %flash_state_5_2 = aie.buffer(%tile_5_2) {sym_name = "flash_state_5_2"} : memref<256xbf16> 
    %flash_index_5_2 = aie.buffer(%tile_5_2) {sym_name = "flash_index_5_2"} : memref<2xi32> 
    aie.objectfifo @flash_scale_5_2(%tile_5_2, {%tile_5_3}, 2 : i32) : !aie.objectfifo<memref<256xbf16>>  
    %core_5_2 = aie.core(%tile_5_2) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c2 = arith.constant 2 : index
        scf.for %arg1 = %c0_0 to %c2 step %c1_1 {
          %c32 = arith.constant 32 : index
          scf.for %arg2 = %c0_0 to %c32 step %c1_1 {
            %0 = aie.objectfifo.acquire @of_8_switch_join_5_0(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            %2 = aie.objectfifo.acquire @of_7_distribute_5_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %3 = aie.objectfifo.subview.access %2[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            %4 = arith.index_cast %arg2 : index to i32
            %c1_i32 = arith.constant 1 : i32
            %5 = arith.muli %4, %c1_i32 : i32
            %c0_i32 = arith.constant 0 : i32
            %6 = arith.addi %c0_i32, %5 : i32
            %7 = arith.index_cast %arg1 : index to i32
            %c16_i32 = arith.constant 16 : i32
            %8 = arith.muli %7, %c16_i32 : i32
            %c5_i32 = arith.constant 5 : i32
            %9 = arith.addi %c5_i32, %8 : i32
            %c0_2 = arith.constant 0 : index
            %c1_3 = arith.constant 1 : index
            memref.store %6, %flash_index_5_2[%c0_2] : memref<2xi32>
            memref.store %9, %flash_index_5_2[%c1_3] : memref<2xi32>
            %c64_i32 = arith.constant 64 : i32
            %c0_i32_4 = arith.constant 0 : i32
            %10 = arith.cmpi eq, %6, %c0_i32_4 : i32
            scf.if %10 {
              func.call @op0_init_scale_buffer(%flash_state_5_2, %c64_i32) : (memref<256xbf16>, i32) -> ()
            }
            %cst = arith.constant 1.4453125 : f32
            %11 = arith.truncf %cst : f32 to bf16
            %c64_i32_5 = arith.constant 64 : i32
            %c2048_i32 = arith.constant 2048 : i32
            %c2048_i32_6 = arith.constant 2048 : i32
            func.call @op0_partial_softmax(%3, %1, %flash_state_5_2, %flash_index_5_2, %11, %c64_i32, %c64_i32_5, %c2048_i32, %c2048_i32_6) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<256xbf16>, memref<2xi32>, bf16, i32, i32, i32, i32) -> ()
            %12 = aie.objectfifo.acquire @flash_scale_5_2(Produce, 1) : !aie.objectfifosubview<memref<256xbf16>>
            %13 = aie.objectfifo.subview.access %12[0] : !aie.objectfifosubview<memref<256xbf16>> -> memref<256xbf16>
            %c256_i32 = arith.constant 256 : i32
            func.call @op0_passThroughLine(%flash_state_5_2, %13, %c256_i32) : (memref<256xbf16>, memref<256xbf16>, i32) -> ()
            aie.objectfifo.release @flash_scale_5_2(Produce, 1)
            aie.objectfifo.release @of_7_distribute_5_0(Consume, 1)
            aie.objectfifo.release @of_8_switch_join_5_0(Produce, 1)
          }
        }
      }
      aie.end
    } {link_with = "op0_mha.o"}
    %flash_state_6_2 = aie.buffer(%tile_6_2) {sym_name = "flash_state_6_2"} : memref<256xbf16> 
    %flash_index_6_2 = aie.buffer(%tile_6_2) {sym_name = "flash_index_6_2"} : memref<2xi32> 
    aie.objectfifo @flash_scale_6_2(%tile_6_2, {%tile_6_3}, 2 : i32) : !aie.objectfifo<memref<256xbf16>>  
    %core_6_2 = aie.core(%tile_6_2) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c2 = arith.constant 2 : index
        scf.for %arg1 = %c0_0 to %c2 step %c1_1 {
          %c32 = arith.constant 32 : index
          scf.for %arg2 = %c0_0 to %c32 step %c1_1 {
            %0 = aie.objectfifo.acquire @of_8_switch_join_6_0(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            %2 = aie.objectfifo.acquire @of_7_distribute_6_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %3 = aie.objectfifo.subview.access %2[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            %4 = arith.index_cast %arg2 : index to i32
            %c1_i32 = arith.constant 1 : i32
            %5 = arith.muli %4, %c1_i32 : i32
            %c0_i32 = arith.constant 0 : i32
            %6 = arith.addi %c0_i32, %5 : i32
            %7 = arith.index_cast %arg1 : index to i32
            %c16_i32 = arith.constant 16 : i32
            %8 = arith.muli %7, %c16_i32 : i32
            %c6_i32 = arith.constant 6 : i32
            %9 = arith.addi %c6_i32, %8 : i32
            %c0_2 = arith.constant 0 : index
            %c1_3 = arith.constant 1 : index
            memref.store %6, %flash_index_6_2[%c0_2] : memref<2xi32>
            memref.store %9, %flash_index_6_2[%c1_3] : memref<2xi32>
            %c64_i32 = arith.constant 64 : i32
            %c0_i32_4 = arith.constant 0 : i32
            %10 = arith.cmpi eq, %6, %c0_i32_4 : i32
            scf.if %10 {
              func.call @op0_init_scale_buffer(%flash_state_6_2, %c64_i32) : (memref<256xbf16>, i32) -> ()
            }
            %cst = arith.constant 1.4453125 : f32
            %11 = arith.truncf %cst : f32 to bf16
            %c64_i32_5 = arith.constant 64 : i32
            %c2048_i32 = arith.constant 2048 : i32
            %c2048_i32_6 = arith.constant 2048 : i32
            func.call @op0_partial_softmax(%3, %1, %flash_state_6_2, %flash_index_6_2, %11, %c64_i32, %c64_i32_5, %c2048_i32, %c2048_i32_6) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<256xbf16>, memref<2xi32>, bf16, i32, i32, i32, i32) -> ()
            %12 = aie.objectfifo.acquire @flash_scale_6_2(Produce, 1) : !aie.objectfifosubview<memref<256xbf16>>
            %13 = aie.objectfifo.subview.access %12[0] : !aie.objectfifosubview<memref<256xbf16>> -> memref<256xbf16>
            %c256_i32 = arith.constant 256 : i32
            func.call @op0_passThroughLine(%flash_state_6_2, %13, %c256_i32) : (memref<256xbf16>, memref<256xbf16>, i32) -> ()
            aie.objectfifo.release @flash_scale_6_2(Produce, 1)
            aie.objectfifo.release @of_7_distribute_6_0(Consume, 1)
            aie.objectfifo.release @of_8_switch_join_6_0(Produce, 1)
          }
        }
      }
      aie.end
    } {link_with = "op0_mha.o"}
    %flash_state_7_2 = aie.buffer(%tile_7_2) {sym_name = "flash_state_7_2"} : memref<256xbf16> 
    %flash_index_7_2 = aie.buffer(%tile_7_2) {sym_name = "flash_index_7_2"} : memref<2xi32> 
    aie.objectfifo @flash_scale_7_2(%tile_7_2, {%tile_7_3}, 2 : i32) : !aie.objectfifo<memref<256xbf16>>  
    %core_7_2 = aie.core(%tile_7_2) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c2 = arith.constant 2 : index
        scf.for %arg1 = %c0_0 to %c2 step %c1_1 {
          %c32 = arith.constant 32 : index
          scf.for %arg2 = %c0_0 to %c32 step %c1_1 {
            %0 = aie.objectfifo.acquire @of_8_switch_join_7_0(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            %2 = aie.objectfifo.acquire @of_7_distribute_7_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %3 = aie.objectfifo.subview.access %2[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            %4 = arith.index_cast %arg2 : index to i32
            %c1_i32 = arith.constant 1 : i32
            %5 = arith.muli %4, %c1_i32 : i32
            %c0_i32 = arith.constant 0 : i32
            %6 = arith.addi %c0_i32, %5 : i32
            %7 = arith.index_cast %arg1 : index to i32
            %c16_i32 = arith.constant 16 : i32
            %8 = arith.muli %7, %c16_i32 : i32
            %c7_i32 = arith.constant 7 : i32
            %9 = arith.addi %c7_i32, %8 : i32
            %c0_2 = arith.constant 0 : index
            %c1_3 = arith.constant 1 : index
            memref.store %6, %flash_index_7_2[%c0_2] : memref<2xi32>
            memref.store %9, %flash_index_7_2[%c1_3] : memref<2xi32>
            %c64_i32 = arith.constant 64 : i32
            %c0_i32_4 = arith.constant 0 : i32
            %10 = arith.cmpi eq, %6, %c0_i32_4 : i32
            scf.if %10 {
              func.call @op0_init_scale_buffer(%flash_state_7_2, %c64_i32) : (memref<256xbf16>, i32) -> ()
            }
            %cst = arith.constant 1.4453125 : f32
            %11 = arith.truncf %cst : f32 to bf16
            %c64_i32_5 = arith.constant 64 : i32
            %c2048_i32 = arith.constant 2048 : i32
            %c2048_i32_6 = arith.constant 2048 : i32
            func.call @op0_partial_softmax(%3, %1, %flash_state_7_2, %flash_index_7_2, %11, %c64_i32, %c64_i32_5, %c2048_i32, %c2048_i32_6) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<256xbf16>, memref<2xi32>, bf16, i32, i32, i32, i32) -> ()
            %12 = aie.objectfifo.acquire @flash_scale_7_2(Produce, 1) : !aie.objectfifosubview<memref<256xbf16>>
            %13 = aie.objectfifo.subview.access %12[0] : !aie.objectfifosubview<memref<256xbf16>> -> memref<256xbf16>
            %c256_i32 = arith.constant 256 : i32
            func.call @op0_passThroughLine(%flash_state_7_2, %13, %c256_i32) : (memref<256xbf16>, memref<256xbf16>, i32) -> ()
            aie.objectfifo.release @flash_scale_7_2(Produce, 1)
            aie.objectfifo.release @of_7_distribute_7_0(Consume, 1)
            aie.objectfifo.release @of_8_switch_join_7_0(Produce, 1)
          }
        }
      }
      aie.end
    } {link_with = "op0_mha.o"}
    %flash_state_0_4 = aie.buffer(%tile_0_4) {sym_name = "flash_state_0_4"} : memref<256xbf16> 
    %flash_index_0_4 = aie.buffer(%tile_0_4) {sym_name = "flash_index_0_4"} : memref<2xi32> 
    aie.objectfifo @flash_scale_0_4(%tile_0_4, {%tile_0_3}, 2 : i32) : !aie.objectfifo<memref<256xbf16>>  
    %core_0_4 = aie.core(%tile_0_4) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c2 = arith.constant 2 : index
        scf.for %arg1 = %c0_0 to %c2 step %c1_1 {
          %c32 = arith.constant 32 : index
          scf.for %arg2 = %c0_0 to %c32 step %c1_1 {
            %0 = aie.objectfifo.acquire @of_8_switch_join_0_1(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            %2 = aie.objectfifo.acquire @of_7_distribute_0_1(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %3 = aie.objectfifo.subview.access %2[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            %4 = arith.index_cast %arg2 : index to i32
            %c1_i32 = arith.constant 1 : i32
            %5 = arith.muli %4, %c1_i32 : i32
            %c0_i32 = arith.constant 0 : i32
            %6 = arith.addi %c0_i32, %5 : i32
            %7 = arith.index_cast %arg1 : index to i32
            %c16_i32 = arith.constant 16 : i32
            %8 = arith.muli %7, %c16_i32 : i32
            %c8_i32 = arith.constant 8 : i32
            %9 = arith.addi %c8_i32, %8 : i32
            %c0_2 = arith.constant 0 : index
            %c1_3 = arith.constant 1 : index
            memref.store %6, %flash_index_0_4[%c0_2] : memref<2xi32>
            memref.store %9, %flash_index_0_4[%c1_3] : memref<2xi32>
            %c64_i32 = arith.constant 64 : i32
            %c0_i32_4 = arith.constant 0 : i32
            %10 = arith.cmpi eq, %6, %c0_i32_4 : i32
            scf.if %10 {
              func.call @op0_init_scale_buffer(%flash_state_0_4, %c64_i32) : (memref<256xbf16>, i32) -> ()
            }
            %cst = arith.constant 1.4453125 : f32
            %11 = arith.truncf %cst : f32 to bf16
            %c64_i32_5 = arith.constant 64 : i32
            %c2048_i32 = arith.constant 2048 : i32
            %c2048_i32_6 = arith.constant 2048 : i32
            func.call @op0_partial_softmax(%3, %1, %flash_state_0_4, %flash_index_0_4, %11, %c64_i32, %c64_i32_5, %c2048_i32, %c2048_i32_6) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<256xbf16>, memref<2xi32>, bf16, i32, i32, i32, i32) -> ()
            %12 = aie.objectfifo.acquire @flash_scale_0_4(Produce, 1) : !aie.objectfifosubview<memref<256xbf16>>
            %13 = aie.objectfifo.subview.access %12[0] : !aie.objectfifosubview<memref<256xbf16>> -> memref<256xbf16>
            %c256_i32 = arith.constant 256 : i32
            func.call @op0_passThroughLine(%flash_state_0_4, %13, %c256_i32) : (memref<256xbf16>, memref<256xbf16>, i32) -> ()
            aie.objectfifo.release @flash_scale_0_4(Produce, 1)
            aie.objectfifo.release @of_7_distribute_0_1(Consume, 1)
            aie.objectfifo.release @of_8_switch_join_0_1(Produce, 1)
          }
        }
      }
      aie.end
    } {link_with = "op0_mha.o"}
    %flash_state_1_4 = aie.buffer(%tile_1_4) {sym_name = "flash_state_1_4"} : memref<256xbf16> 
    %flash_index_1_4 = aie.buffer(%tile_1_4) {sym_name = "flash_index_1_4"} : memref<2xi32> 
    aie.objectfifo @flash_scale_1_4(%tile_1_4, {%tile_1_3}, 2 : i32) : !aie.objectfifo<memref<256xbf16>>  
    %core_1_4 = aie.core(%tile_1_4) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c2 = arith.constant 2 : index
        scf.for %arg1 = %c0_0 to %c2 step %c1_1 {
          %c32 = arith.constant 32 : index
          scf.for %arg2 = %c0_0 to %c32 step %c1_1 {
            %0 = aie.objectfifo.acquire @of_8_switch_join_1_1(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            %2 = aie.objectfifo.acquire @of_7_distribute_1_1(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %3 = aie.objectfifo.subview.access %2[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            %4 = arith.index_cast %arg2 : index to i32
            %c1_i32 = arith.constant 1 : i32
            %5 = arith.muli %4, %c1_i32 : i32
            %c0_i32 = arith.constant 0 : i32
            %6 = arith.addi %c0_i32, %5 : i32
            %7 = arith.index_cast %arg1 : index to i32
            %c16_i32 = arith.constant 16 : i32
            %8 = arith.muli %7, %c16_i32 : i32
            %c9_i32 = arith.constant 9 : i32
            %9 = arith.addi %c9_i32, %8 : i32
            %c0_2 = arith.constant 0 : index
            %c1_3 = arith.constant 1 : index
            memref.store %6, %flash_index_1_4[%c0_2] : memref<2xi32>
            memref.store %9, %flash_index_1_4[%c1_3] : memref<2xi32>
            %c64_i32 = arith.constant 64 : i32
            %c0_i32_4 = arith.constant 0 : i32
            %10 = arith.cmpi eq, %6, %c0_i32_4 : i32
            scf.if %10 {
              func.call @op0_init_scale_buffer(%flash_state_1_4, %c64_i32) : (memref<256xbf16>, i32) -> ()
            }
            %cst = arith.constant 1.4453125 : f32
            %11 = arith.truncf %cst : f32 to bf16
            %c64_i32_5 = arith.constant 64 : i32
            %c2048_i32 = arith.constant 2048 : i32
            %c2048_i32_6 = arith.constant 2048 : i32
            func.call @op0_partial_softmax(%3, %1, %flash_state_1_4, %flash_index_1_4, %11, %c64_i32, %c64_i32_5, %c2048_i32, %c2048_i32_6) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<256xbf16>, memref<2xi32>, bf16, i32, i32, i32, i32) -> ()
            %12 = aie.objectfifo.acquire @flash_scale_1_4(Produce, 1) : !aie.objectfifosubview<memref<256xbf16>>
            %13 = aie.objectfifo.subview.access %12[0] : !aie.objectfifosubview<memref<256xbf16>> -> memref<256xbf16>
            %c256_i32 = arith.constant 256 : i32
            func.call @op0_passThroughLine(%flash_state_1_4, %13, %c256_i32) : (memref<256xbf16>, memref<256xbf16>, i32) -> ()
            aie.objectfifo.release @flash_scale_1_4(Produce, 1)
            aie.objectfifo.release @of_7_distribute_1_1(Consume, 1)
            aie.objectfifo.release @of_8_switch_join_1_1(Produce, 1)
          }
        }
      }
      aie.end
    } {link_with = "op0_mha.o"}
    %flash_state_2_4 = aie.buffer(%tile_2_4) {sym_name = "flash_state_2_4"} : memref<256xbf16> 
    %flash_index_2_4 = aie.buffer(%tile_2_4) {sym_name = "flash_index_2_4"} : memref<2xi32> 
    aie.objectfifo @flash_scale_2_4(%tile_2_4, {%tile_2_3}, 2 : i32) : !aie.objectfifo<memref<256xbf16>>  
    %core_2_4 = aie.core(%tile_2_4) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c2 = arith.constant 2 : index
        scf.for %arg1 = %c0_0 to %c2 step %c1_1 {
          %c32 = arith.constant 32 : index
          scf.for %arg2 = %c0_0 to %c32 step %c1_1 {
            %0 = aie.objectfifo.acquire @of_8_switch_join_2_1(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            %2 = aie.objectfifo.acquire @of_7_distribute_2_1(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %3 = aie.objectfifo.subview.access %2[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            %4 = arith.index_cast %arg2 : index to i32
            %c1_i32 = arith.constant 1 : i32
            %5 = arith.muli %4, %c1_i32 : i32
            %c0_i32 = arith.constant 0 : i32
            %6 = arith.addi %c0_i32, %5 : i32
            %7 = arith.index_cast %arg1 : index to i32
            %c16_i32 = arith.constant 16 : i32
            %8 = arith.muli %7, %c16_i32 : i32
            %c10_i32 = arith.constant 10 : i32
            %9 = arith.addi %c10_i32, %8 : i32
            %c0_2 = arith.constant 0 : index
            %c1_3 = arith.constant 1 : index
            memref.store %6, %flash_index_2_4[%c0_2] : memref<2xi32>
            memref.store %9, %flash_index_2_4[%c1_3] : memref<2xi32>
            %c64_i32 = arith.constant 64 : i32
            %c0_i32_4 = arith.constant 0 : i32
            %10 = arith.cmpi eq, %6, %c0_i32_4 : i32
            scf.if %10 {
              func.call @op0_init_scale_buffer(%flash_state_2_4, %c64_i32) : (memref<256xbf16>, i32) -> ()
            }
            %cst = arith.constant 1.4453125 : f32
            %11 = arith.truncf %cst : f32 to bf16
            %c64_i32_5 = arith.constant 64 : i32
            %c2048_i32 = arith.constant 2048 : i32
            %c2048_i32_6 = arith.constant 2048 : i32
            func.call @op0_partial_softmax(%3, %1, %flash_state_2_4, %flash_index_2_4, %11, %c64_i32, %c64_i32_5, %c2048_i32, %c2048_i32_6) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<256xbf16>, memref<2xi32>, bf16, i32, i32, i32, i32) -> ()
            %12 = aie.objectfifo.acquire @flash_scale_2_4(Produce, 1) : !aie.objectfifosubview<memref<256xbf16>>
            %13 = aie.objectfifo.subview.access %12[0] : !aie.objectfifosubview<memref<256xbf16>> -> memref<256xbf16>
            %c256_i32 = arith.constant 256 : i32
            func.call @op0_passThroughLine(%flash_state_2_4, %13, %c256_i32) : (memref<256xbf16>, memref<256xbf16>, i32) -> ()
            aie.objectfifo.release @flash_scale_2_4(Produce, 1)
            aie.objectfifo.release @of_7_distribute_2_1(Consume, 1)
            aie.objectfifo.release @of_8_switch_join_2_1(Produce, 1)
          }
        }
      }
      aie.end
    } {link_with = "op0_mha.o"}
    %flash_state_3_4 = aie.buffer(%tile_3_4) {sym_name = "flash_state_3_4"} : memref<256xbf16> 
    %flash_index_3_4 = aie.buffer(%tile_3_4) {sym_name = "flash_index_3_4"} : memref<2xi32> 
    aie.objectfifo @flash_scale_3_4(%tile_3_4, {%tile_3_3}, 2 : i32) : !aie.objectfifo<memref<256xbf16>>  
    %core_3_4 = aie.core(%tile_3_4) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c2 = arith.constant 2 : index
        scf.for %arg1 = %c0_0 to %c2 step %c1_1 {
          %c32 = arith.constant 32 : index
          scf.for %arg2 = %c0_0 to %c32 step %c1_1 {
            %0 = aie.objectfifo.acquire @of_8_switch_join_3_1(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            %2 = aie.objectfifo.acquire @of_7_distribute_3_1(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %3 = aie.objectfifo.subview.access %2[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            %4 = arith.index_cast %arg2 : index to i32
            %c1_i32 = arith.constant 1 : i32
            %5 = arith.muli %4, %c1_i32 : i32
            %c0_i32 = arith.constant 0 : i32
            %6 = arith.addi %c0_i32, %5 : i32
            %7 = arith.index_cast %arg1 : index to i32
            %c16_i32 = arith.constant 16 : i32
            %8 = arith.muli %7, %c16_i32 : i32
            %c11_i32 = arith.constant 11 : i32
            %9 = arith.addi %c11_i32, %8 : i32
            %c0_2 = arith.constant 0 : index
            %c1_3 = arith.constant 1 : index
            memref.store %6, %flash_index_3_4[%c0_2] : memref<2xi32>
            memref.store %9, %flash_index_3_4[%c1_3] : memref<2xi32>
            %c64_i32 = arith.constant 64 : i32
            %c0_i32_4 = arith.constant 0 : i32
            %10 = arith.cmpi eq, %6, %c0_i32_4 : i32
            scf.if %10 {
              func.call @op0_init_scale_buffer(%flash_state_3_4, %c64_i32) : (memref<256xbf16>, i32) -> ()
            }
            %cst = arith.constant 1.4453125 : f32
            %11 = arith.truncf %cst : f32 to bf16
            %c64_i32_5 = arith.constant 64 : i32
            %c2048_i32 = arith.constant 2048 : i32
            %c2048_i32_6 = arith.constant 2048 : i32
            func.call @op0_partial_softmax(%3, %1, %flash_state_3_4, %flash_index_3_4, %11, %c64_i32, %c64_i32_5, %c2048_i32, %c2048_i32_6) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<256xbf16>, memref<2xi32>, bf16, i32, i32, i32, i32) -> ()
            %12 = aie.objectfifo.acquire @flash_scale_3_4(Produce, 1) : !aie.objectfifosubview<memref<256xbf16>>
            %13 = aie.objectfifo.subview.access %12[0] : !aie.objectfifosubview<memref<256xbf16>> -> memref<256xbf16>
            %c256_i32 = arith.constant 256 : i32
            func.call @op0_passThroughLine(%flash_state_3_4, %13, %c256_i32) : (memref<256xbf16>, memref<256xbf16>, i32) -> ()
            aie.objectfifo.release @flash_scale_3_4(Produce, 1)
            aie.objectfifo.release @of_7_distribute_3_1(Consume, 1)
            aie.objectfifo.release @of_8_switch_join_3_1(Produce, 1)
          }
        }
      }
      aie.end
    } {link_with = "op0_mha.o"}
    %flash_state_4_4 = aie.buffer(%tile_4_4) {sym_name = "flash_state_4_4"} : memref<256xbf16> 
    %flash_index_4_4 = aie.buffer(%tile_4_4) {sym_name = "flash_index_4_4"} : memref<2xi32> 
    aie.objectfifo @flash_scale_4_4(%tile_4_4, {%tile_4_3}, 2 : i32) : !aie.objectfifo<memref<256xbf16>>  
    %core_4_4 = aie.core(%tile_4_4) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c2 = arith.constant 2 : index
        scf.for %arg1 = %c0_0 to %c2 step %c1_1 {
          %c32 = arith.constant 32 : index
          scf.for %arg2 = %c0_0 to %c32 step %c1_1 {
            %0 = aie.objectfifo.acquire @of_8_switch_join_4_1(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            %2 = aie.objectfifo.acquire @of_7_distribute_4_1(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %3 = aie.objectfifo.subview.access %2[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            %4 = arith.index_cast %arg2 : index to i32
            %c1_i32 = arith.constant 1 : i32
            %5 = arith.muli %4, %c1_i32 : i32
            %c0_i32 = arith.constant 0 : i32
            %6 = arith.addi %c0_i32, %5 : i32
            %7 = arith.index_cast %arg1 : index to i32
            %c16_i32 = arith.constant 16 : i32
            %8 = arith.muli %7, %c16_i32 : i32
            %c12_i32 = arith.constant 12 : i32
            %9 = arith.addi %c12_i32, %8 : i32
            %c0_2 = arith.constant 0 : index
            %c1_3 = arith.constant 1 : index
            memref.store %6, %flash_index_4_4[%c0_2] : memref<2xi32>
            memref.store %9, %flash_index_4_4[%c1_3] : memref<2xi32>
            %c64_i32 = arith.constant 64 : i32
            %c0_i32_4 = arith.constant 0 : i32
            %10 = arith.cmpi eq, %6, %c0_i32_4 : i32
            scf.if %10 {
              func.call @op0_init_scale_buffer(%flash_state_4_4, %c64_i32) : (memref<256xbf16>, i32) -> ()
            }
            %cst = arith.constant 1.4453125 : f32
            %11 = arith.truncf %cst : f32 to bf16
            %c64_i32_5 = arith.constant 64 : i32
            %c2048_i32 = arith.constant 2048 : i32
            %c2048_i32_6 = arith.constant 2048 : i32
            func.call @op0_partial_softmax(%3, %1, %flash_state_4_4, %flash_index_4_4, %11, %c64_i32, %c64_i32_5, %c2048_i32, %c2048_i32_6) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<256xbf16>, memref<2xi32>, bf16, i32, i32, i32, i32) -> ()
            %12 = aie.objectfifo.acquire @flash_scale_4_4(Produce, 1) : !aie.objectfifosubview<memref<256xbf16>>
            %13 = aie.objectfifo.subview.access %12[0] : !aie.objectfifosubview<memref<256xbf16>> -> memref<256xbf16>
            %c256_i32 = arith.constant 256 : i32
            func.call @op0_passThroughLine(%flash_state_4_4, %13, %c256_i32) : (memref<256xbf16>, memref<256xbf16>, i32) -> ()
            aie.objectfifo.release @flash_scale_4_4(Produce, 1)
            aie.objectfifo.release @of_7_distribute_4_1(Consume, 1)
            aie.objectfifo.release @of_8_switch_join_4_1(Produce, 1)
          }
        }
      }
      aie.end
    } {link_with = "op0_mha.o"}
    %flash_state_5_4 = aie.buffer(%tile_5_4) {sym_name = "flash_state_5_4"} : memref<256xbf16> 
    %flash_index_5_4 = aie.buffer(%tile_5_4) {sym_name = "flash_index_5_4"} : memref<2xi32> 
    aie.objectfifo @flash_scale_5_4(%tile_5_4, {%tile_5_3}, 2 : i32) : !aie.objectfifo<memref<256xbf16>>  
    %core_5_4 = aie.core(%tile_5_4) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c2 = arith.constant 2 : index
        scf.for %arg1 = %c0_0 to %c2 step %c1_1 {
          %c32 = arith.constant 32 : index
          scf.for %arg2 = %c0_0 to %c32 step %c1_1 {
            %0 = aie.objectfifo.acquire @of_8_switch_join_5_1(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            %2 = aie.objectfifo.acquire @of_7_distribute_5_1(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %3 = aie.objectfifo.subview.access %2[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            %4 = arith.index_cast %arg2 : index to i32
            %c1_i32 = arith.constant 1 : i32
            %5 = arith.muli %4, %c1_i32 : i32
            %c0_i32 = arith.constant 0 : i32
            %6 = arith.addi %c0_i32, %5 : i32
            %7 = arith.index_cast %arg1 : index to i32
            %c16_i32 = arith.constant 16 : i32
            %8 = arith.muli %7, %c16_i32 : i32
            %c13_i32 = arith.constant 13 : i32
            %9 = arith.addi %c13_i32, %8 : i32
            %c0_2 = arith.constant 0 : index
            %c1_3 = arith.constant 1 : index
            memref.store %6, %flash_index_5_4[%c0_2] : memref<2xi32>
            memref.store %9, %flash_index_5_4[%c1_3] : memref<2xi32>
            %c64_i32 = arith.constant 64 : i32
            %c0_i32_4 = arith.constant 0 : i32
            %10 = arith.cmpi eq, %6, %c0_i32_4 : i32
            scf.if %10 {
              func.call @op0_init_scale_buffer(%flash_state_5_4, %c64_i32) : (memref<256xbf16>, i32) -> ()
            }
            %cst = arith.constant 1.4453125 : f32
            %11 = arith.truncf %cst : f32 to bf16
            %c64_i32_5 = arith.constant 64 : i32
            %c2048_i32 = arith.constant 2048 : i32
            %c2048_i32_6 = arith.constant 2048 : i32
            func.call @op0_partial_softmax(%3, %1, %flash_state_5_4, %flash_index_5_4, %11, %c64_i32, %c64_i32_5, %c2048_i32, %c2048_i32_6) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<256xbf16>, memref<2xi32>, bf16, i32, i32, i32, i32) -> ()
            %12 = aie.objectfifo.acquire @flash_scale_5_4(Produce, 1) : !aie.objectfifosubview<memref<256xbf16>>
            %13 = aie.objectfifo.subview.access %12[0] : !aie.objectfifosubview<memref<256xbf16>> -> memref<256xbf16>
            %c256_i32 = arith.constant 256 : i32
            func.call @op0_passThroughLine(%flash_state_5_4, %13, %c256_i32) : (memref<256xbf16>, memref<256xbf16>, i32) -> ()
            aie.objectfifo.release @flash_scale_5_4(Produce, 1)
            aie.objectfifo.release @of_7_distribute_5_1(Consume, 1)
            aie.objectfifo.release @of_8_switch_join_5_1(Produce, 1)
          }
        }
      }
      aie.end
    } {link_with = "op0_mha.o"}
    %flash_state_6_4 = aie.buffer(%tile_6_4) {sym_name = "flash_state_6_4"} : memref<256xbf16> 
    %flash_index_6_4 = aie.buffer(%tile_6_4) {sym_name = "flash_index_6_4"} : memref<2xi32> 
    aie.objectfifo @flash_scale_6_4(%tile_6_4, {%tile_6_3}, 2 : i32) : !aie.objectfifo<memref<256xbf16>>  
    %core_6_4 = aie.core(%tile_6_4) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c2 = arith.constant 2 : index
        scf.for %arg1 = %c0_0 to %c2 step %c1_1 {
          %c32 = arith.constant 32 : index
          scf.for %arg2 = %c0_0 to %c32 step %c1_1 {
            %0 = aie.objectfifo.acquire @of_8_switch_join_6_1(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            %2 = aie.objectfifo.acquire @of_7_distribute_6_1(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %3 = aie.objectfifo.subview.access %2[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            %4 = arith.index_cast %arg2 : index to i32
            %c1_i32 = arith.constant 1 : i32
            %5 = arith.muli %4, %c1_i32 : i32
            %c0_i32 = arith.constant 0 : i32
            %6 = arith.addi %c0_i32, %5 : i32
            %7 = arith.index_cast %arg1 : index to i32
            %c16_i32 = arith.constant 16 : i32
            %8 = arith.muli %7, %c16_i32 : i32
            %c14_i32 = arith.constant 14 : i32
            %9 = arith.addi %c14_i32, %8 : i32
            %c0_2 = arith.constant 0 : index
            %c1_3 = arith.constant 1 : index
            memref.store %6, %flash_index_6_4[%c0_2] : memref<2xi32>
            memref.store %9, %flash_index_6_4[%c1_3] : memref<2xi32>
            %c64_i32 = arith.constant 64 : i32
            %c0_i32_4 = arith.constant 0 : i32
            %10 = arith.cmpi eq, %6, %c0_i32_4 : i32
            scf.if %10 {
              func.call @op0_init_scale_buffer(%flash_state_6_4, %c64_i32) : (memref<256xbf16>, i32) -> ()
            }
            %cst = arith.constant 1.4453125 : f32
            %11 = arith.truncf %cst : f32 to bf16
            %c64_i32_5 = arith.constant 64 : i32
            %c2048_i32 = arith.constant 2048 : i32
            %c2048_i32_6 = arith.constant 2048 : i32
            func.call @op0_partial_softmax(%3, %1, %flash_state_6_4, %flash_index_6_4, %11, %c64_i32, %c64_i32_5, %c2048_i32, %c2048_i32_6) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<256xbf16>, memref<2xi32>, bf16, i32, i32, i32, i32) -> ()
            %12 = aie.objectfifo.acquire @flash_scale_6_4(Produce, 1) : !aie.objectfifosubview<memref<256xbf16>>
            %13 = aie.objectfifo.subview.access %12[0] : !aie.objectfifosubview<memref<256xbf16>> -> memref<256xbf16>
            %c256_i32 = arith.constant 256 : i32
            func.call @op0_passThroughLine(%flash_state_6_4, %13, %c256_i32) : (memref<256xbf16>, memref<256xbf16>, i32) -> ()
            aie.objectfifo.release @flash_scale_6_4(Produce, 1)
            aie.objectfifo.release @of_7_distribute_6_1(Consume, 1)
            aie.objectfifo.release @of_8_switch_join_6_1(Produce, 1)
          }
        }
      }
      aie.end
    } {link_with = "op0_mha.o"}
    %flash_state_7_4 = aie.buffer(%tile_7_4) {sym_name = "flash_state_7_4"} : memref<256xbf16> 
    %flash_index_7_4 = aie.buffer(%tile_7_4) {sym_name = "flash_index_7_4"} : memref<2xi32> 
    aie.objectfifo @flash_scale_7_4(%tile_7_4, {%tile_7_3}, 2 : i32) : !aie.objectfifo<memref<256xbf16>>  
    %core_7_4 = aie.core(%tile_7_4) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c2 = arith.constant 2 : index
        scf.for %arg1 = %c0_0 to %c2 step %c1_1 {
          %c32 = arith.constant 32 : index
          scf.for %arg2 = %c0_0 to %c32 step %c1_1 {
            %0 = aie.objectfifo.acquire @of_8_switch_join_7_1(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            %2 = aie.objectfifo.acquire @of_7_distribute_7_1(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %3 = aie.objectfifo.subview.access %2[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            %4 = arith.index_cast %arg2 : index to i32
            %c1_i32 = arith.constant 1 : i32
            %5 = arith.muli %4, %c1_i32 : i32
            %c0_i32 = arith.constant 0 : i32
            %6 = arith.addi %c0_i32, %5 : i32
            %7 = arith.index_cast %arg1 : index to i32
            %c16_i32 = arith.constant 16 : i32
            %8 = arith.muli %7, %c16_i32 : i32
            %c15_i32 = arith.constant 15 : i32
            %9 = arith.addi %c15_i32, %8 : i32
            %c0_2 = arith.constant 0 : index
            %c1_3 = arith.constant 1 : index
            memref.store %6, %flash_index_7_4[%c0_2] : memref<2xi32>
            memref.store %9, %flash_index_7_4[%c1_3] : memref<2xi32>
            %c64_i32 = arith.constant 64 : i32
            %c0_i32_4 = arith.constant 0 : i32
            %10 = arith.cmpi eq, %6, %c0_i32_4 : i32
            scf.if %10 {
              func.call @op0_init_scale_buffer(%flash_state_7_4, %c64_i32) : (memref<256xbf16>, i32) -> ()
            }
            %cst = arith.constant 1.4453125 : f32
            %11 = arith.truncf %cst : f32 to bf16
            %c64_i32_5 = arith.constant 64 : i32
            %c2048_i32 = arith.constant 2048 : i32
            %c2048_i32_6 = arith.constant 2048 : i32
            func.call @op0_partial_softmax(%3, %1, %flash_state_7_4, %flash_index_7_4, %11, %c64_i32, %c64_i32_5, %c2048_i32, %c2048_i32_6) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<256xbf16>, memref<2xi32>, bf16, i32, i32, i32, i32) -> ()
            %12 = aie.objectfifo.acquire @flash_scale_7_4(Produce, 1) : !aie.objectfifosubview<memref<256xbf16>>
            %13 = aie.objectfifo.subview.access %12[0] : !aie.objectfifosubview<memref<256xbf16>> -> memref<256xbf16>
            %c256_i32 = arith.constant 256 : i32
            func.call @op0_passThroughLine(%flash_state_7_4, %13, %c256_i32) : (memref<256xbf16>, memref<256xbf16>, i32) -> ()
            aie.objectfifo.release @flash_scale_7_4(Produce, 1)
            aie.objectfifo.release @of_7_distribute_7_1(Consume, 1)
            aie.objectfifo.release @of_8_switch_join_7_1(Produce, 1)
          }
        }
      }
      aie.end
    } {link_with = "op0_mha.o"}
    aie.objectfifo @of_0_mem_0(%shim_noc_tile_0_0, {%mem_tile_0_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<2x64x64xbf16>>  
    aie.objectfifo @of_0_mem_1(%shim_noc_tile_1_0, {%mem_tile_1_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<2x64x64xbf16>>  
    aie.objectfifo @of_0_mem_2(%shim_noc_tile_2_0, {%mem_tile_2_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<2x64x64xbf16>>  
    aie.objectfifo @of_0_mem_3(%shim_noc_tile_3_0, {%mem_tile_3_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<2x64x64xbf16>>  
    aie.objectfifo @of_0_mem_4(%shim_noc_tile_4_0, {%mem_tile_4_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<2x64x64xbf16>>  
    aie.objectfifo @of_0_mem_5(%shim_noc_tile_5_0, {%mem_tile_5_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<2x64x64xbf16>>  
    aie.objectfifo @of_0_mem_6(%shim_noc_tile_6_0, {%mem_tile_6_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<2x64x64xbf16>>  
    aie.objectfifo @of_0_mem_7(%shim_noc_tile_7_0, {%mem_tile_7_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<2x64x64xbf16>>  
    aie.objectfifo @of_1_mem(%shim_noc_tile_3_0, {%mem_tile_3_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_2_mem(%shim_noc_tile_5_0, {%mem_tile_5_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_3_unicast_0_0(%mem_tile_0_1 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%tile_0_5}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo.link [@of_0_mem_0] -> [@of_3_unicast_0_0]([] [])
    aie.objectfifo @of_3_unicast_1_0(%mem_tile_1_1 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%tile_1_5}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo.link [@of_0_mem_1] -> [@of_3_unicast_1_0]([] [])
    aie.objectfifo @of_3_unicast_2_0(%mem_tile_2_1 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%tile_2_5}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo.link [@of_0_mem_2] -> [@of_3_unicast_2_0]([] [])
    aie.objectfifo @of_3_unicast_3_0(%mem_tile_3_1 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%tile_3_5}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo.link [@of_0_mem_3] -> [@of_3_unicast_3_0]([] [])
    aie.objectfifo @of_3_unicast_4_0(%mem_tile_4_1 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%tile_4_5}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo.link [@of_0_mem_4] -> [@of_3_unicast_4_0]([] [])
    aie.objectfifo @of_3_unicast_5_0(%mem_tile_5_1 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%tile_5_5}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo.link [@of_0_mem_5] -> [@of_3_unicast_5_0]([] [])
    aie.objectfifo @of_3_unicast_6_0(%mem_tile_6_1 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%tile_6_5}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo.link [@of_0_mem_6] -> [@of_3_unicast_6_0]([] [])
    aie.objectfifo @of_3_unicast_7_0(%mem_tile_7_1 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%tile_7_5}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo.link [@of_0_mem_7] -> [@of_3_unicast_7_0]([] [])
    aie.objectfifo @of_4_broadcast_0_0(%mem_tile_3_1 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%tile_0_5, %tile_1_5, %tile_2_5, %tile_3_5, %tile_4_5, %tile_5_5, %tile_6_5, %tile_7_5}, [2 : i32, 2 : i32, 2 : i32, 2 : i32, 2 : i32, 2 : i32, 2 : i32, 2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo.link [@of_1_mem] -> [@of_4_broadcast_0_0]([] [])
    aie.objectfifo @of_5_broadcast_0_0(%mem_tile_5_1 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%tile_0_3, %tile_1_3, %tile_2_3, %tile_3_3, %tile_4_3, %tile_5_3, %tile_6_3, %tile_7_3}, [2 : i32, 2 : i32, 2 : i32, 2 : i32, 2 : i32, 2 : i32, 2 : i32, 2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo.link [@of_2_mem] -> [@of_5_broadcast_0_0]([] [])
    aie.objectfifo @of_6_unicast_0(%tile_0_5, {%mem_tile_0_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_6_unicast_1(%tile_1_5, {%mem_tile_1_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_6_unicast_2(%tile_2_5, {%mem_tile_2_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_6_unicast_3(%tile_3_5, {%mem_tile_3_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_6_unicast_4(%tile_4_5, {%mem_tile_4_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_6_unicast_5(%tile_5_5, {%mem_tile_5_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_6_unicast_6(%tile_6_5, {%mem_tile_6_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_6_unicast_7(%tile_7_5, {%mem_tile_7_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_7_distribute_0_0(%mem_tile_0_1 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%tile_0_2}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_7_distribute_0_1(%mem_tile_0_1, {%tile_0_4}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo.link [@of_6_unicast_0] -> [@of_7_distribute_0_0, @of_7_distribute_0_1]([] [0, 2048])
    aie.objectfifo @of_7_distribute_1_0(%mem_tile_1_1 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%tile_1_2}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_7_distribute_1_1(%mem_tile_1_1, {%tile_1_4}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo.link [@of_6_unicast_1] -> [@of_7_distribute_1_0, @of_7_distribute_1_1]([] [0, 2048])
    aie.objectfifo @of_7_distribute_2_0(%mem_tile_2_1 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%tile_2_2}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_7_distribute_2_1(%mem_tile_2_1, {%tile_2_4}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo.link [@of_6_unicast_2] -> [@of_7_distribute_2_0, @of_7_distribute_2_1]([] [0, 2048])
    aie.objectfifo @of_7_distribute_3_0(%mem_tile_3_1 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%tile_3_2}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_7_distribute_3_1(%mem_tile_3_1, {%tile_3_4}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo.link [@of_6_unicast_3] -> [@of_7_distribute_3_0, @of_7_distribute_3_1]([] [0, 2048])
    aie.objectfifo @of_7_distribute_4_0(%mem_tile_4_1 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%tile_4_2}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_7_distribute_4_1(%mem_tile_4_1, {%tile_4_4}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo.link [@of_6_unicast_4] -> [@of_7_distribute_4_0, @of_7_distribute_4_1]([] [0, 2048])
    aie.objectfifo @of_7_distribute_5_0(%mem_tile_5_1 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%tile_5_2}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_7_distribute_5_1(%mem_tile_5_1, {%tile_5_4}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo.link [@of_6_unicast_5] -> [@of_7_distribute_5_0, @of_7_distribute_5_1]([] [0, 2048])
    aie.objectfifo @of_7_distribute_6_0(%mem_tile_6_1 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%tile_6_2}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_7_distribute_6_1(%mem_tile_6_1, {%tile_6_4}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo.link [@of_6_unicast_6] -> [@of_7_distribute_6_0, @of_7_distribute_6_1]([] [0, 2048])
    aie.objectfifo @of_7_distribute_7_0(%mem_tile_7_1 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%tile_7_2}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_7_distribute_7_1(%mem_tile_7_1, {%tile_7_4}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo.link [@of_6_unicast_7] -> [@of_7_distribute_7_0, @of_7_distribute_7_1]([] [0, 2048])
    aie.objectfifo @of_8_switch_join_0_0(%tile_0_2, {%tile_0_3}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_8_switch_join_0_1(%tile_0_4, {%tile_0_3}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_8_switch_join_1_0(%tile_1_2, {%tile_1_3}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_8_switch_join_1_1(%tile_1_4, {%tile_1_3}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_8_switch_join_2_0(%tile_2_2, {%tile_2_3}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_8_switch_join_2_1(%tile_2_4, {%tile_2_3}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_8_switch_join_3_0(%tile_3_2, {%tile_3_3}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_8_switch_join_3_1(%tile_3_4, {%tile_3_3}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_8_switch_join_4_0(%tile_4_2, {%tile_4_3}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_8_switch_join_4_1(%tile_4_4, {%tile_4_3}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_8_switch_join_5_0(%tile_5_2, {%tile_5_3}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_8_switch_join_5_1(%tile_5_4, {%tile_5_3}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_8_switch_join_6_0(%tile_6_2, {%tile_6_3}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_8_switch_join_6_1(%tile_6_4, {%tile_6_3}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_8_switch_join_7_0(%tile_7_2, {%tile_7_3}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_8_switch_join_7_1(%tile_7_4, {%tile_7_3}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_9_unicast_0(%tile_0_3, {%mem_tile_0_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_9_unicast_1(%tile_1_3, {%mem_tile_1_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_9_unicast_2(%tile_2_3, {%mem_tile_2_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_9_unicast_3(%tile_3_3, {%mem_tile_3_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_9_unicast_4(%tile_4_3, {%mem_tile_4_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_9_unicast_5(%tile_5_3, {%mem_tile_5_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_9_unicast_6(%tile_6_3, {%mem_tile_6_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_9_unicast_7(%tile_7_3, {%mem_tile_7_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_10_mem_0(%mem_tile_0_1 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%shim_noc_tile_0_0}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<2x64x64xbf16>>  
    aie.objectfifo.link [@of_9_unicast_0] -> [@of_10_mem_0]([] [])
    aie.objectfifo @of_10_mem_1(%mem_tile_1_1 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%shim_noc_tile_1_0}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<2x64x64xbf16>>  
    aie.objectfifo.link [@of_9_unicast_1] -> [@of_10_mem_1]([] [])
    aie.objectfifo @of_10_mem_2(%mem_tile_2_1 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%shim_noc_tile_2_0}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<2x64x64xbf16>>  
    aie.objectfifo.link [@of_9_unicast_2] -> [@of_10_mem_2]([] [])
    aie.objectfifo @of_10_mem_3(%mem_tile_3_1 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%shim_noc_tile_3_0}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<2x64x64xbf16>>  
    aie.objectfifo.link [@of_9_unicast_3] -> [@of_10_mem_3]([] [])
    aie.objectfifo @of_10_mem_4(%mem_tile_4_1 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%shim_noc_tile_4_0}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<2x64x64xbf16>>  
    aie.objectfifo.link [@of_9_unicast_4] -> [@of_10_mem_4]([] [])
    aie.objectfifo @of_10_mem_5(%mem_tile_5_1 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%shim_noc_tile_5_0}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<2x64x64xbf16>>  
    aie.objectfifo.link [@of_9_unicast_5] -> [@of_10_mem_5]([] [])
    aie.objectfifo @of_10_mem_6(%mem_tile_6_1 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%shim_noc_tile_6_0}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<2x64x64xbf16>>  
    aie.objectfifo.link [@of_9_unicast_6] -> [@of_10_mem_6]([] [])
    aie.objectfifo @of_10_mem_7(%mem_tile_7_1 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%shim_noc_tile_7_0}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<2x64x64xbf16>>  
    aie.objectfifo.link [@of_9_unicast_7] -> [@of_10_mem_7]([] [])
    func.func private @op0_zero_bf16_64_64_64(memref<64x64xbf16>)
    func.func private @op0_matmul_bf16_bf16_64_64_64(memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>)
    func.func private @op0_rescale_O(memref<64x64xbf16>, memref<256xbf16>, i32, memref<2xi32>)
    func.func private @op0_zero_bf16(memref<64x64xbf16>)
    func.func private @op0_matmul_PV(memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>, memref<256xbf16>, i32, i32, memref<2xi32>)
    func.func private @op0_init_scale_buffer(memref<256xbf16>, i32)
    func.func private @op0_passThroughLine(memref<256xbf16>, memref<256xbf16>, i32) attributes {link_with = "op0_mha_passThrough.o"}
    func.func private @op0_partial_softmax(memref<64x64xbf16>, memref<64x64xbf16>, memref<256xbf16>, memref<2xi32>, bf16, i32, i32, i32, i32)
  }
}
