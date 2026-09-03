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
    %mem_tile_3_1 = aie.tile(3, 1)
    %mem_tile_4_1 = aie.tile(4, 1)
    %mem_tile_5_1 = aie.tile(5, 1)
    %mem_tile_6_1 = aie.tile(6, 1)
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
    %tile_4_2 = aie.tile(4, 2)
    %tile_4_3 = aie.tile(4, 3)
    %tile_4_4 = aie.tile(4, 4)
    %tile_4_5 = aie.tile(4, 5)
    %tile_5_2 = aie.tile(5, 2)
    %tile_5_3 = aie.tile(5, 3)
    %tile_5_4 = aie.tile(5, 4)
    %tile_5_5 = aie.tile(5, 5)
    %tile_6_2 = aie.tile(6, 2)
    %tile_6_3 = aie.tile(6, 3)
    %tile_6_4 = aie.tile(6, 4)
    %tile_6_5 = aie.tile(6, 5)
    %tile_7_2 = aie.tile(7, 2)
    %tile_7_3 = aie.tile(7, 3)
    %tile_7_4 = aie.tile(7, 4)
    %tile_7_5 = aie.tile(7, 5)
    aie.runtime_sequence(%arg0: memref<512x512xbf16>, %arg1: memref<512x2048xbf16>, %arg2: memref<512x2048xbf16>) {
      %0 = aiex.dma_configure_task_for @of_0_mem_0 {
        aie.dma_bd(%arg0 : memref<512x512xbf16> offset = 0 len = 32768 sizes = [4, 8, 64, 64] strides = [0, 64, 512, 1])
        aie.end
      } {issue_token = true, iteration_t = 0 : index, repeat_count = 3 : i32}
      aiex.dma_start_task(%0)
      %1 = aiex.dma_configure_task_for @of_0_mem_1 {
        aie.dma_bd(%arg0 : memref<512x512xbf16> offset = 32768 len = 32768 sizes = [4, 8, 64, 64] strides = [0, 64, 512, 1])
        aie.end
      } {issue_token = true, iteration_t = 0 : index, repeat_count = 3 : i32}
      aiex.dma_start_task(%1)
      %2 = aiex.dma_configure_task_for @of_0_mem_2 {
        aie.dma_bd(%arg0 : memref<512x512xbf16> offset = 65536 len = 32768 sizes = [4, 8, 64, 64] strides = [0, 64, 512, 1])
        aie.end
      } {issue_token = true, iteration_t = 0 : index, repeat_count = 3 : i32}
      aiex.dma_start_task(%2)
      %3 = aiex.dma_configure_task_for @of_0_mem_3 {
        aie.dma_bd(%arg0 : memref<512x512xbf16> offset = 98304 len = 32768 sizes = [4, 8, 64, 64] strides = [0, 64, 512, 1])
        aie.end
      } {issue_token = true, iteration_t = 0 : index, repeat_count = 3 : i32}
      aiex.dma_start_task(%3)
      %4 = aiex.dma_configure_task_for @of_1_mem_0 {
        aie.dma_bd(%arg1 : memref<512x2048xbf16> offset = 0 len = 131072 sizes = [2, 4, 512, 64] strides = [0, 512, 2048, 1])
        aie.end
      } {issue_token = true, iteration_t = 0 : index, repeat_count = 1 : i32}
      aiex.dma_start_task(%4)
      %5 = aiex.dma_configure_task_for @of_1_mem_1 {
        aie.dma_bd(%arg1 : memref<512x2048xbf16> offset = 64 len = 131072 sizes = [2, 4, 512, 64] strides = [0, 512, 2048, 1])
        aie.end
      } {issue_token = true, iteration_t = 0 : index, repeat_count = 1 : i32}
      aiex.dma_start_task(%5)
      %6 = aiex.dma_configure_task_for @of_1_mem_2 {
        aie.dma_bd(%arg1 : memref<512x2048xbf16> offset = 128 len = 131072 sizes = [2, 4, 512, 64] strides = [0, 512, 2048, 1])
        aie.end
      } {issue_token = true, iteration_t = 0 : index, repeat_count = 1 : i32}
      aiex.dma_start_task(%6)
      %7 = aiex.dma_configure_task_for @of_1_mem_3 {
        aie.dma_bd(%arg1 : memref<512x2048xbf16> offset = 192 len = 131072 sizes = [2, 4, 512, 64] strides = [0, 512, 2048, 1])
        aie.end
      } {issue_token = true, iteration_t = 0 : index, repeat_count = 1 : i32}
      aiex.dma_start_task(%7)
      %8 = aiex.dma_configure_task_for @of_1_mem_4 {
        aie.dma_bd(%arg1 : memref<512x2048xbf16> offset = 256 len = 131072 sizes = [2, 4, 512, 64] strides = [0, 512, 2048, 1])
        aie.end
      } {issue_token = true, iteration_t = 0 : index, repeat_count = 1 : i32}
      aiex.dma_start_task(%8)
      %9 = aiex.dma_configure_task_for @of_1_mem_5 {
        aie.dma_bd(%arg1 : memref<512x2048xbf16> offset = 320 len = 131072 sizes = [2, 4, 512, 64] strides = [0, 512, 2048, 1])
        aie.end
      } {issue_token = true, iteration_t = 0 : index, repeat_count = 1 : i32}
      aiex.dma_start_task(%9)
      %10 = aiex.dma_configure_task_for @of_1_mem_6 {
        aie.dma_bd(%arg1 : memref<512x2048xbf16> offset = 384 len = 131072 sizes = [2, 4, 512, 64] strides = [0, 512, 2048, 1])
        aie.end
      } {issue_token = true, iteration_t = 0 : index, repeat_count = 1 : i32}
      aiex.dma_start_task(%10)
      %11 = aiex.dma_configure_task_for @of_1_mem_7 {
        aie.dma_bd(%arg1 : memref<512x2048xbf16> offset = 448 len = 131072 sizes = [2, 4, 512, 64] strides = [0, 512, 2048, 1])
        aie.end
      } {issue_token = true, iteration_t = 0 : index, repeat_count = 1 : i32}
      aiex.dma_start_task(%11)
      %12 = aiex.dma_configure_task_for @of_5_mem_0 {
        aie.dma_bd(%arg2 : memref<512x2048xbf16> offset = 0 len = 65536 sizes = [2, 4, 256, 64] strides = [524288, 512, 2048, 1])
        aie.end
      } {issue_token = true, iteration_t = 0 : index, repeat_count = 1 : i32}
      aiex.dma_start_task(%12)
      %13 = aiex.dma_configure_task_for @of_5_mem_1 {
        aie.dma_bd(%arg2 : memref<512x2048xbf16> offset = 64 len = 65536 sizes = [2, 4, 256, 64] strides = [524288, 512, 2048, 1])
        aie.end
      } {issue_token = true, iteration_t = 0 : index, repeat_count = 1 : i32}
      aiex.dma_start_task(%13)
      %14 = aiex.dma_configure_task_for @of_5_mem_2 {
        aie.dma_bd(%arg2 : memref<512x2048xbf16> offset = 128 len = 65536 sizes = [2, 4, 256, 64] strides = [524288, 512, 2048, 1])
        aie.end
      } {issue_token = true, iteration_t = 0 : index, repeat_count = 1 : i32}
      aiex.dma_start_task(%14)
      %15 = aiex.dma_configure_task_for @of_5_mem_3 {
        aie.dma_bd(%arg2 : memref<512x2048xbf16> offset = 192 len = 65536 sizes = [2, 4, 256, 64] strides = [524288, 512, 2048, 1])
        aie.end
      } {issue_token = true, iteration_t = 0 : index, repeat_count = 1 : i32}
      aiex.dma_start_task(%15)
      %16 = aiex.dma_configure_task_for @of_5_mem_4 {
        aie.dma_bd(%arg2 : memref<512x2048xbf16> offset = 256 len = 65536 sizes = [2, 4, 256, 64] strides = [524288, 512, 2048, 1])
        aie.end
      } {issue_token = true, iteration_t = 0 : index, repeat_count = 1 : i32}
      aiex.dma_start_task(%16)
      %17 = aiex.dma_configure_task_for @of_5_mem_5 {
        aie.dma_bd(%arg2 : memref<512x2048xbf16> offset = 320 len = 65536 sizes = [2, 4, 256, 64] strides = [524288, 512, 2048, 1])
        aie.end
      } {issue_token = true, iteration_t = 0 : index, repeat_count = 1 : i32}
      aiex.dma_start_task(%17)
      %18 = aiex.dma_configure_task_for @of_5_mem_6 {
        aie.dma_bd(%arg2 : memref<512x2048xbf16> offset = 384 len = 65536 sizes = [2, 4, 256, 64] strides = [524288, 512, 2048, 1])
        aie.end
      } {issue_token = true, iteration_t = 0 : index, repeat_count = 1 : i32}
      aiex.dma_start_task(%18)
      %19 = aiex.dma_configure_task_for @of_5_mem_7 {
        aie.dma_bd(%arg2 : memref<512x2048xbf16> offset = 448 len = 65536 sizes = [2, 4, 256, 64] strides = [524288, 512, 2048, 1])
        aie.end
      } {issue_token = true, iteration_t = 0 : index, repeat_count = 1 : i32}
      aiex.dma_start_task(%19)
      %20 = aiex.dma_configure_task_for @of_0_mem_0 {
        aie.dma_bd(%arg0 : memref<512x512xbf16> offset = 131072 len = 32768 sizes = [4, 8, 64, 64] strides = [0, 64, 512, 1])
        aie.end
      } {issue_token = true, iteration_t = 1024 : index, repeat_count = 3 : i32}
      aiex.dma_start_task(%20)
      %21 = aiex.dma_configure_task_for @of_0_mem_1 {
        aie.dma_bd(%arg0 : memref<512x512xbf16> offset = 163840 len = 32768 sizes = [4, 8, 64, 64] strides = [0, 64, 512, 1])
        aie.end
      } {issue_token = true, iteration_t = 1024 : index, repeat_count = 3 : i32}
      aiex.dma_start_task(%21)
      %22 = aiex.dma_configure_task_for @of_0_mem_2 {
        aie.dma_bd(%arg0 : memref<512x512xbf16> offset = 196608 len = 32768 sizes = [4, 8, 64, 64] strides = [0, 64, 512, 1])
        aie.end
      } {issue_token = true, iteration_t = 1024 : index, repeat_count = 3 : i32}
      aiex.dma_start_task(%22)
      %23 = aiex.dma_configure_task_for @of_0_mem_3 {
        aie.dma_bd(%arg0 : memref<512x512xbf16> offset = 229376 len = 32768 sizes = [4, 8, 64, 64] strides = [0, 64, 512, 1])
        aie.end
      } {issue_token = true, iteration_t = 1024 : index, repeat_count = 3 : i32}
      aiex.dma_start_task(%23)
      aiex.dma_await_task(%0)
      aiex.dma_await_task(%20)
      aiex.dma_await_task(%1)
      aiex.dma_await_task(%21)
      aiex.dma_await_task(%2)
      aiex.dma_await_task(%22)
      aiex.dma_await_task(%3)
      aiex.dma_await_task(%23)
      aiex.dma_await_task(%4)
      aiex.dma_await_task(%5)
      aiex.dma_await_task(%6)
      aiex.dma_await_task(%7)
      aiex.dma_await_task(%8)
      aiex.dma_await_task(%9)
      aiex.dma_await_task(%10)
      aiex.dma_await_task(%11)
      aiex.dma_await_task(%12)
      aiex.dma_await_task(%13)
      aiex.dma_await_task(%14)
      aiex.dma_await_task(%15)
      aiex.dma_await_task(%16)
      aiex.dma_await_task(%17)
      aiex.dma_await_task(%18)
      aiex.dma_await_task(%19)
    }
    %core_0_2 = aie.core(%tile_0_2) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c2 = arith.constant 2 : index
        scf.for %arg1 = %c0_0 to %c2 step %c1_1 {
          %c4 = arith.constant 4 : index
          scf.for %arg2 = %c0_0 to %c4 step %c1_1 {
            %0 = aie.objectfifo.acquire @of_4_join_0_0(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            func.call @op0_zero_bf16_64_64_64(%1) : (memref<64x64xbf16>) -> ()
            %c8 = arith.constant 8 : index
            scf.for %arg3 = %c0_0 to %c8 step %c1_1 {
              %2 = aie.objectfifo.acquire @of_3_broadcast_0_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
              %3 = aie.objectfifo.subview.access %2[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
              %4 = aie.objectfifo.acquire @of_2_broadcast_0_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
              %5 = aie.objectfifo.subview.access %4[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
              func.call @op0_matmul_bf16_bf16_64_64_64(%5, %3, %1) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>) -> ()
              aie.objectfifo.release @of_2_broadcast_0_0(Consume, 1)
              aie.objectfifo.release @of_3_broadcast_0_0(Consume, 1)
            }
            aie.objectfifo.release @of_4_join_0_0(Produce, 1)
          }
        }
      }
      aie.end
    } {link_with = "op0_mm_64_64_64.o"}
    %core_0_3 = aie.core(%tile_0_3) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c2 = arith.constant 2 : index
        scf.for %arg1 = %c0_0 to %c2 step %c1_1 {
          %c4 = arith.constant 4 : index
          scf.for %arg2 = %c0_0 to %c4 step %c1_1 {
            %0 = aie.objectfifo.acquire @of_4_join_0_1(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            func.call @op0_zero_bf16_64_64_64(%1) : (memref<64x64xbf16>) -> ()
            %c8 = arith.constant 8 : index
            scf.for %arg3 = %c0_0 to %c8 step %c1_1 {
              %2 = aie.objectfifo.acquire @of_3_broadcast_0_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
              %3 = aie.objectfifo.subview.access %2[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
              %4 = aie.objectfifo.acquire @of_2_broadcast_1_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
              %5 = aie.objectfifo.subview.access %4[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
              func.call @op0_matmul_bf16_bf16_64_64_64(%5, %3, %1) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>) -> ()
              aie.objectfifo.release @of_2_broadcast_1_0(Consume, 1)
              aie.objectfifo.release @of_3_broadcast_0_0(Consume, 1)
            }
            aie.objectfifo.release @of_4_join_0_1(Produce, 1)
          }
        }
      }
      aie.end
    } {link_with = "op0_mm_64_64_64.o"}
    %core_0_4 = aie.core(%tile_0_4) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c2 = arith.constant 2 : index
        scf.for %arg1 = %c0_0 to %c2 step %c1_1 {
          %c4 = arith.constant 4 : index
          scf.for %arg2 = %c0_0 to %c4 step %c1_1 {
            %0 = aie.objectfifo.acquire @of_4_join_0_2(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            func.call @op0_zero_bf16_64_64_64(%1) : (memref<64x64xbf16>) -> ()
            %c8 = arith.constant 8 : index
            scf.for %arg3 = %c0_0 to %c8 step %c1_1 {
              %2 = aie.objectfifo.acquire @of_3_broadcast_0_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
              %3 = aie.objectfifo.subview.access %2[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
              %4 = aie.objectfifo.acquire @of_2_broadcast_2_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
              %5 = aie.objectfifo.subview.access %4[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
              func.call @op0_matmul_bf16_bf16_64_64_64(%5, %3, %1) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>) -> ()
              aie.objectfifo.release @of_2_broadcast_2_0(Consume, 1)
              aie.objectfifo.release @of_3_broadcast_0_0(Consume, 1)
            }
            aie.objectfifo.release @of_4_join_0_2(Produce, 1)
          }
        }
      }
      aie.end
    } {link_with = "op0_mm_64_64_64.o"}
    %core_0_5 = aie.core(%tile_0_5) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c2 = arith.constant 2 : index
        scf.for %arg1 = %c0_0 to %c2 step %c1_1 {
          %c4 = arith.constant 4 : index
          scf.for %arg2 = %c0_0 to %c4 step %c1_1 {
            %0 = aie.objectfifo.acquire @of_4_join_0_3(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            func.call @op0_zero_bf16_64_64_64(%1) : (memref<64x64xbf16>) -> ()
            %c8 = arith.constant 8 : index
            scf.for %arg3 = %c0_0 to %c8 step %c1_1 {
              %2 = aie.objectfifo.acquire @of_3_broadcast_0_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
              %3 = aie.objectfifo.subview.access %2[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
              %4 = aie.objectfifo.acquire @of_2_broadcast_3_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
              %5 = aie.objectfifo.subview.access %4[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
              func.call @op0_matmul_bf16_bf16_64_64_64(%5, %3, %1) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>) -> ()
              aie.objectfifo.release @of_2_broadcast_3_0(Consume, 1)
              aie.objectfifo.release @of_3_broadcast_0_0(Consume, 1)
            }
            aie.objectfifo.release @of_4_join_0_3(Produce, 1)
          }
        }
      }
      aie.end
    } {link_with = "op0_mm_64_64_64.o"}
    %core_1_2 = aie.core(%tile_1_2) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c2 = arith.constant 2 : index
        scf.for %arg1 = %c0_0 to %c2 step %c1_1 {
          %c4 = arith.constant 4 : index
          scf.for %arg2 = %c0_0 to %c4 step %c1_1 {
            %0 = aie.objectfifo.acquire @of_4_join_1_0(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            func.call @op0_zero_bf16_64_64_64(%1) : (memref<64x64xbf16>) -> ()
            %c8 = arith.constant 8 : index
            scf.for %arg3 = %c0_0 to %c8 step %c1_1 {
              %2 = aie.objectfifo.acquire @of_3_broadcast_1_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
              %3 = aie.objectfifo.subview.access %2[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
              %4 = aie.objectfifo.acquire @of_2_broadcast_0_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
              %5 = aie.objectfifo.subview.access %4[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
              func.call @op0_matmul_bf16_bf16_64_64_64(%5, %3, %1) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>) -> ()
              aie.objectfifo.release @of_2_broadcast_0_0(Consume, 1)
              aie.objectfifo.release @of_3_broadcast_1_0(Consume, 1)
            }
            aie.objectfifo.release @of_4_join_1_0(Produce, 1)
          }
        }
      }
      aie.end
    } {link_with = "op0_mm_64_64_64.o"}
    %core_1_3 = aie.core(%tile_1_3) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c2 = arith.constant 2 : index
        scf.for %arg1 = %c0_0 to %c2 step %c1_1 {
          %c4 = arith.constant 4 : index
          scf.for %arg2 = %c0_0 to %c4 step %c1_1 {
            %0 = aie.objectfifo.acquire @of_4_join_1_1(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            func.call @op0_zero_bf16_64_64_64(%1) : (memref<64x64xbf16>) -> ()
            %c8 = arith.constant 8 : index
            scf.for %arg3 = %c0_0 to %c8 step %c1_1 {
              %2 = aie.objectfifo.acquire @of_3_broadcast_1_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
              %3 = aie.objectfifo.subview.access %2[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
              %4 = aie.objectfifo.acquire @of_2_broadcast_1_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
              %5 = aie.objectfifo.subview.access %4[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
              func.call @op0_matmul_bf16_bf16_64_64_64(%5, %3, %1) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>) -> ()
              aie.objectfifo.release @of_2_broadcast_1_0(Consume, 1)
              aie.objectfifo.release @of_3_broadcast_1_0(Consume, 1)
            }
            aie.objectfifo.release @of_4_join_1_1(Produce, 1)
          }
        }
      }
      aie.end
    } {link_with = "op0_mm_64_64_64.o"}
    %core_1_4 = aie.core(%tile_1_4) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c2 = arith.constant 2 : index
        scf.for %arg1 = %c0_0 to %c2 step %c1_1 {
          %c4 = arith.constant 4 : index
          scf.for %arg2 = %c0_0 to %c4 step %c1_1 {
            %0 = aie.objectfifo.acquire @of_4_join_1_2(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            func.call @op0_zero_bf16_64_64_64(%1) : (memref<64x64xbf16>) -> ()
            %c8 = arith.constant 8 : index
            scf.for %arg3 = %c0_0 to %c8 step %c1_1 {
              %2 = aie.objectfifo.acquire @of_3_broadcast_1_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
              %3 = aie.objectfifo.subview.access %2[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
              %4 = aie.objectfifo.acquire @of_2_broadcast_2_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
              %5 = aie.objectfifo.subview.access %4[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
              func.call @op0_matmul_bf16_bf16_64_64_64(%5, %3, %1) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>) -> ()
              aie.objectfifo.release @of_2_broadcast_2_0(Consume, 1)
              aie.objectfifo.release @of_3_broadcast_1_0(Consume, 1)
            }
            aie.objectfifo.release @of_4_join_1_2(Produce, 1)
          }
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
          %c4 = arith.constant 4 : index
          scf.for %arg2 = %c0_0 to %c4 step %c1_1 {
            %0 = aie.objectfifo.acquire @of_4_join_1_3(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            func.call @op0_zero_bf16_64_64_64(%1) : (memref<64x64xbf16>) -> ()
            %c8 = arith.constant 8 : index
            scf.for %arg3 = %c0_0 to %c8 step %c1_1 {
              %2 = aie.objectfifo.acquire @of_3_broadcast_1_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
              %3 = aie.objectfifo.subview.access %2[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
              %4 = aie.objectfifo.acquire @of_2_broadcast_3_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
              %5 = aie.objectfifo.subview.access %4[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
              func.call @op0_matmul_bf16_bf16_64_64_64(%5, %3, %1) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>) -> ()
              aie.objectfifo.release @of_2_broadcast_3_0(Consume, 1)
              aie.objectfifo.release @of_3_broadcast_1_0(Consume, 1)
            }
            aie.objectfifo.release @of_4_join_1_3(Produce, 1)
          }
        }
      }
      aie.end
    } {link_with = "op0_mm_64_64_64.o"}
    %core_2_2 = aie.core(%tile_2_2) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c2 = arith.constant 2 : index
        scf.for %arg1 = %c0_0 to %c2 step %c1_1 {
          %c4 = arith.constant 4 : index
          scf.for %arg2 = %c0_0 to %c4 step %c1_1 {
            %0 = aie.objectfifo.acquire @of_4_join_2_0(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            func.call @op0_zero_bf16_64_64_64(%1) : (memref<64x64xbf16>) -> ()
            %c8 = arith.constant 8 : index
            scf.for %arg3 = %c0_0 to %c8 step %c1_1 {
              %2 = aie.objectfifo.acquire @of_3_broadcast_2_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
              %3 = aie.objectfifo.subview.access %2[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
              %4 = aie.objectfifo.acquire @of_2_broadcast_0_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
              %5 = aie.objectfifo.subview.access %4[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
              func.call @op0_matmul_bf16_bf16_64_64_64(%5, %3, %1) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>) -> ()
              aie.objectfifo.release @of_2_broadcast_0_0(Consume, 1)
              aie.objectfifo.release @of_3_broadcast_2_0(Consume, 1)
            }
            aie.objectfifo.release @of_4_join_2_0(Produce, 1)
          }
        }
      }
      aie.end
    } {link_with = "op0_mm_64_64_64.o"}
    %core_2_3 = aie.core(%tile_2_3) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c2 = arith.constant 2 : index
        scf.for %arg1 = %c0_0 to %c2 step %c1_1 {
          %c4 = arith.constant 4 : index
          scf.for %arg2 = %c0_0 to %c4 step %c1_1 {
            %0 = aie.objectfifo.acquire @of_4_join_2_1(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            func.call @op0_zero_bf16_64_64_64(%1) : (memref<64x64xbf16>) -> ()
            %c8 = arith.constant 8 : index
            scf.for %arg3 = %c0_0 to %c8 step %c1_1 {
              %2 = aie.objectfifo.acquire @of_3_broadcast_2_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
              %3 = aie.objectfifo.subview.access %2[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
              %4 = aie.objectfifo.acquire @of_2_broadcast_1_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
              %5 = aie.objectfifo.subview.access %4[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
              func.call @op0_matmul_bf16_bf16_64_64_64(%5, %3, %1) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>) -> ()
              aie.objectfifo.release @of_2_broadcast_1_0(Consume, 1)
              aie.objectfifo.release @of_3_broadcast_2_0(Consume, 1)
            }
            aie.objectfifo.release @of_4_join_2_1(Produce, 1)
          }
        }
      }
      aie.end
    } {link_with = "op0_mm_64_64_64.o"}
    %core_2_4 = aie.core(%tile_2_4) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c2 = arith.constant 2 : index
        scf.for %arg1 = %c0_0 to %c2 step %c1_1 {
          %c4 = arith.constant 4 : index
          scf.for %arg2 = %c0_0 to %c4 step %c1_1 {
            %0 = aie.objectfifo.acquire @of_4_join_2_2(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            func.call @op0_zero_bf16_64_64_64(%1) : (memref<64x64xbf16>) -> ()
            %c8 = arith.constant 8 : index
            scf.for %arg3 = %c0_0 to %c8 step %c1_1 {
              %2 = aie.objectfifo.acquire @of_3_broadcast_2_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
              %3 = aie.objectfifo.subview.access %2[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
              %4 = aie.objectfifo.acquire @of_2_broadcast_2_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
              %5 = aie.objectfifo.subview.access %4[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
              func.call @op0_matmul_bf16_bf16_64_64_64(%5, %3, %1) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>) -> ()
              aie.objectfifo.release @of_2_broadcast_2_0(Consume, 1)
              aie.objectfifo.release @of_3_broadcast_2_0(Consume, 1)
            }
            aie.objectfifo.release @of_4_join_2_2(Produce, 1)
          }
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
          %c4 = arith.constant 4 : index
          scf.for %arg2 = %c0_0 to %c4 step %c1_1 {
            %0 = aie.objectfifo.acquire @of_4_join_2_3(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            func.call @op0_zero_bf16_64_64_64(%1) : (memref<64x64xbf16>) -> ()
            %c8 = arith.constant 8 : index
            scf.for %arg3 = %c0_0 to %c8 step %c1_1 {
              %2 = aie.objectfifo.acquire @of_3_broadcast_2_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
              %3 = aie.objectfifo.subview.access %2[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
              %4 = aie.objectfifo.acquire @of_2_broadcast_3_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
              %5 = aie.objectfifo.subview.access %4[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
              func.call @op0_matmul_bf16_bf16_64_64_64(%5, %3, %1) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>) -> ()
              aie.objectfifo.release @of_2_broadcast_3_0(Consume, 1)
              aie.objectfifo.release @of_3_broadcast_2_0(Consume, 1)
            }
            aie.objectfifo.release @of_4_join_2_3(Produce, 1)
          }
        }
      }
      aie.end
    } {link_with = "op0_mm_64_64_64.o"}
    %core_3_2 = aie.core(%tile_3_2) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c2 = arith.constant 2 : index
        scf.for %arg1 = %c0_0 to %c2 step %c1_1 {
          %c4 = arith.constant 4 : index
          scf.for %arg2 = %c0_0 to %c4 step %c1_1 {
            %0 = aie.objectfifo.acquire @of_4_join_3_0(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            func.call @op0_zero_bf16_64_64_64(%1) : (memref<64x64xbf16>) -> ()
            %c8 = arith.constant 8 : index
            scf.for %arg3 = %c0_0 to %c8 step %c1_1 {
              %2 = aie.objectfifo.acquire @of_3_broadcast_3_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
              %3 = aie.objectfifo.subview.access %2[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
              %4 = aie.objectfifo.acquire @of_2_broadcast_0_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
              %5 = aie.objectfifo.subview.access %4[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
              func.call @op0_matmul_bf16_bf16_64_64_64(%5, %3, %1) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>) -> ()
              aie.objectfifo.release @of_2_broadcast_0_0(Consume, 1)
              aie.objectfifo.release @of_3_broadcast_3_0(Consume, 1)
            }
            aie.objectfifo.release @of_4_join_3_0(Produce, 1)
          }
        }
      }
      aie.end
    } {link_with = "op0_mm_64_64_64.o"}
    %core_3_3 = aie.core(%tile_3_3) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c2 = arith.constant 2 : index
        scf.for %arg1 = %c0_0 to %c2 step %c1_1 {
          %c4 = arith.constant 4 : index
          scf.for %arg2 = %c0_0 to %c4 step %c1_1 {
            %0 = aie.objectfifo.acquire @of_4_join_3_1(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            func.call @op0_zero_bf16_64_64_64(%1) : (memref<64x64xbf16>) -> ()
            %c8 = arith.constant 8 : index
            scf.for %arg3 = %c0_0 to %c8 step %c1_1 {
              %2 = aie.objectfifo.acquire @of_3_broadcast_3_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
              %3 = aie.objectfifo.subview.access %2[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
              %4 = aie.objectfifo.acquire @of_2_broadcast_1_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
              %5 = aie.objectfifo.subview.access %4[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
              func.call @op0_matmul_bf16_bf16_64_64_64(%5, %3, %1) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>) -> ()
              aie.objectfifo.release @of_2_broadcast_1_0(Consume, 1)
              aie.objectfifo.release @of_3_broadcast_3_0(Consume, 1)
            }
            aie.objectfifo.release @of_4_join_3_1(Produce, 1)
          }
        }
      }
      aie.end
    } {link_with = "op0_mm_64_64_64.o"}
    %core_3_4 = aie.core(%tile_3_4) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c2 = arith.constant 2 : index
        scf.for %arg1 = %c0_0 to %c2 step %c1_1 {
          %c4 = arith.constant 4 : index
          scf.for %arg2 = %c0_0 to %c4 step %c1_1 {
            %0 = aie.objectfifo.acquire @of_4_join_3_2(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            func.call @op0_zero_bf16_64_64_64(%1) : (memref<64x64xbf16>) -> ()
            %c8 = arith.constant 8 : index
            scf.for %arg3 = %c0_0 to %c8 step %c1_1 {
              %2 = aie.objectfifo.acquire @of_3_broadcast_3_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
              %3 = aie.objectfifo.subview.access %2[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
              %4 = aie.objectfifo.acquire @of_2_broadcast_2_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
              %5 = aie.objectfifo.subview.access %4[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
              func.call @op0_matmul_bf16_bf16_64_64_64(%5, %3, %1) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>) -> ()
              aie.objectfifo.release @of_2_broadcast_2_0(Consume, 1)
              aie.objectfifo.release @of_3_broadcast_3_0(Consume, 1)
            }
            aie.objectfifo.release @of_4_join_3_2(Produce, 1)
          }
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
          %c4 = arith.constant 4 : index
          scf.for %arg2 = %c0_0 to %c4 step %c1_1 {
            %0 = aie.objectfifo.acquire @of_4_join_3_3(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            func.call @op0_zero_bf16_64_64_64(%1) : (memref<64x64xbf16>) -> ()
            %c8 = arith.constant 8 : index
            scf.for %arg3 = %c0_0 to %c8 step %c1_1 {
              %2 = aie.objectfifo.acquire @of_3_broadcast_3_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
              %3 = aie.objectfifo.subview.access %2[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
              %4 = aie.objectfifo.acquire @of_2_broadcast_3_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
              %5 = aie.objectfifo.subview.access %4[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
              func.call @op0_matmul_bf16_bf16_64_64_64(%5, %3, %1) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>) -> ()
              aie.objectfifo.release @of_2_broadcast_3_0(Consume, 1)
              aie.objectfifo.release @of_3_broadcast_3_0(Consume, 1)
            }
            aie.objectfifo.release @of_4_join_3_3(Produce, 1)
          }
        }
      }
      aie.end
    } {link_with = "op0_mm_64_64_64.o"}
    %core_4_2 = aie.core(%tile_4_2) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c2 = arith.constant 2 : index
        scf.for %arg1 = %c0_0 to %c2 step %c1_1 {
          %c4 = arith.constant 4 : index
          scf.for %arg2 = %c0_0 to %c4 step %c1_1 {
            %0 = aie.objectfifo.acquire @of_4_join_4_0(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            func.call @op0_zero_bf16_64_64_64(%1) : (memref<64x64xbf16>) -> ()
            %c8 = arith.constant 8 : index
            scf.for %arg3 = %c0_0 to %c8 step %c1_1 {
              %2 = aie.objectfifo.acquire @of_3_broadcast_4_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
              %3 = aie.objectfifo.subview.access %2[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
              %4 = aie.objectfifo.acquire @of_2_broadcast_0_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
              %5 = aie.objectfifo.subview.access %4[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
              func.call @op0_matmul_bf16_bf16_64_64_64(%5, %3, %1) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>) -> ()
              aie.objectfifo.release @of_2_broadcast_0_0(Consume, 1)
              aie.objectfifo.release @of_3_broadcast_4_0(Consume, 1)
            }
            aie.objectfifo.release @of_4_join_4_0(Produce, 1)
          }
        }
      }
      aie.end
    } {link_with = "op0_mm_64_64_64.o"}
    %core_4_3 = aie.core(%tile_4_3) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c2 = arith.constant 2 : index
        scf.for %arg1 = %c0_0 to %c2 step %c1_1 {
          %c4 = arith.constant 4 : index
          scf.for %arg2 = %c0_0 to %c4 step %c1_1 {
            %0 = aie.objectfifo.acquire @of_4_join_4_1(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            func.call @op0_zero_bf16_64_64_64(%1) : (memref<64x64xbf16>) -> ()
            %c8 = arith.constant 8 : index
            scf.for %arg3 = %c0_0 to %c8 step %c1_1 {
              %2 = aie.objectfifo.acquire @of_3_broadcast_4_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
              %3 = aie.objectfifo.subview.access %2[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
              %4 = aie.objectfifo.acquire @of_2_broadcast_1_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
              %5 = aie.objectfifo.subview.access %4[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
              func.call @op0_matmul_bf16_bf16_64_64_64(%5, %3, %1) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>) -> ()
              aie.objectfifo.release @of_2_broadcast_1_0(Consume, 1)
              aie.objectfifo.release @of_3_broadcast_4_0(Consume, 1)
            }
            aie.objectfifo.release @of_4_join_4_1(Produce, 1)
          }
        }
      }
      aie.end
    } {link_with = "op0_mm_64_64_64.o"}
    %core_4_4 = aie.core(%tile_4_4) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c2 = arith.constant 2 : index
        scf.for %arg1 = %c0_0 to %c2 step %c1_1 {
          %c4 = arith.constant 4 : index
          scf.for %arg2 = %c0_0 to %c4 step %c1_1 {
            %0 = aie.objectfifo.acquire @of_4_join_4_2(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            func.call @op0_zero_bf16_64_64_64(%1) : (memref<64x64xbf16>) -> ()
            %c8 = arith.constant 8 : index
            scf.for %arg3 = %c0_0 to %c8 step %c1_1 {
              %2 = aie.objectfifo.acquire @of_3_broadcast_4_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
              %3 = aie.objectfifo.subview.access %2[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
              %4 = aie.objectfifo.acquire @of_2_broadcast_2_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
              %5 = aie.objectfifo.subview.access %4[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
              func.call @op0_matmul_bf16_bf16_64_64_64(%5, %3, %1) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>) -> ()
              aie.objectfifo.release @of_2_broadcast_2_0(Consume, 1)
              aie.objectfifo.release @of_3_broadcast_4_0(Consume, 1)
            }
            aie.objectfifo.release @of_4_join_4_2(Produce, 1)
          }
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
          %c4 = arith.constant 4 : index
          scf.for %arg2 = %c0_0 to %c4 step %c1_1 {
            %0 = aie.objectfifo.acquire @of_4_join_4_3(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            func.call @op0_zero_bf16_64_64_64(%1) : (memref<64x64xbf16>) -> ()
            %c8 = arith.constant 8 : index
            scf.for %arg3 = %c0_0 to %c8 step %c1_1 {
              %2 = aie.objectfifo.acquire @of_3_broadcast_4_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
              %3 = aie.objectfifo.subview.access %2[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
              %4 = aie.objectfifo.acquire @of_2_broadcast_3_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
              %5 = aie.objectfifo.subview.access %4[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
              func.call @op0_matmul_bf16_bf16_64_64_64(%5, %3, %1) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>) -> ()
              aie.objectfifo.release @of_2_broadcast_3_0(Consume, 1)
              aie.objectfifo.release @of_3_broadcast_4_0(Consume, 1)
            }
            aie.objectfifo.release @of_4_join_4_3(Produce, 1)
          }
        }
      }
      aie.end
    } {link_with = "op0_mm_64_64_64.o"}
    %core_5_2 = aie.core(%tile_5_2) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c2 = arith.constant 2 : index
        scf.for %arg1 = %c0_0 to %c2 step %c1_1 {
          %c4 = arith.constant 4 : index
          scf.for %arg2 = %c0_0 to %c4 step %c1_1 {
            %0 = aie.objectfifo.acquire @of_4_join_5_0(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            func.call @op0_zero_bf16_64_64_64(%1) : (memref<64x64xbf16>) -> ()
            %c8 = arith.constant 8 : index
            scf.for %arg3 = %c0_0 to %c8 step %c1_1 {
              %2 = aie.objectfifo.acquire @of_3_broadcast_5_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
              %3 = aie.objectfifo.subview.access %2[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
              %4 = aie.objectfifo.acquire @of_2_broadcast_0_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
              %5 = aie.objectfifo.subview.access %4[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
              func.call @op0_matmul_bf16_bf16_64_64_64(%5, %3, %1) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>) -> ()
              aie.objectfifo.release @of_2_broadcast_0_0(Consume, 1)
              aie.objectfifo.release @of_3_broadcast_5_0(Consume, 1)
            }
            aie.objectfifo.release @of_4_join_5_0(Produce, 1)
          }
        }
      }
      aie.end
    } {link_with = "op0_mm_64_64_64.o"}
    %core_5_3 = aie.core(%tile_5_3) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c2 = arith.constant 2 : index
        scf.for %arg1 = %c0_0 to %c2 step %c1_1 {
          %c4 = arith.constant 4 : index
          scf.for %arg2 = %c0_0 to %c4 step %c1_1 {
            %0 = aie.objectfifo.acquire @of_4_join_5_1(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            func.call @op0_zero_bf16_64_64_64(%1) : (memref<64x64xbf16>) -> ()
            %c8 = arith.constant 8 : index
            scf.for %arg3 = %c0_0 to %c8 step %c1_1 {
              %2 = aie.objectfifo.acquire @of_3_broadcast_5_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
              %3 = aie.objectfifo.subview.access %2[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
              %4 = aie.objectfifo.acquire @of_2_broadcast_1_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
              %5 = aie.objectfifo.subview.access %4[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
              func.call @op0_matmul_bf16_bf16_64_64_64(%5, %3, %1) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>) -> ()
              aie.objectfifo.release @of_2_broadcast_1_0(Consume, 1)
              aie.objectfifo.release @of_3_broadcast_5_0(Consume, 1)
            }
            aie.objectfifo.release @of_4_join_5_1(Produce, 1)
          }
        }
      }
      aie.end
    } {link_with = "op0_mm_64_64_64.o"}
    %core_5_4 = aie.core(%tile_5_4) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c2 = arith.constant 2 : index
        scf.for %arg1 = %c0_0 to %c2 step %c1_1 {
          %c4 = arith.constant 4 : index
          scf.for %arg2 = %c0_0 to %c4 step %c1_1 {
            %0 = aie.objectfifo.acquire @of_4_join_5_2(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            func.call @op0_zero_bf16_64_64_64(%1) : (memref<64x64xbf16>) -> ()
            %c8 = arith.constant 8 : index
            scf.for %arg3 = %c0_0 to %c8 step %c1_1 {
              %2 = aie.objectfifo.acquire @of_3_broadcast_5_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
              %3 = aie.objectfifo.subview.access %2[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
              %4 = aie.objectfifo.acquire @of_2_broadcast_2_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
              %5 = aie.objectfifo.subview.access %4[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
              func.call @op0_matmul_bf16_bf16_64_64_64(%5, %3, %1) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>) -> ()
              aie.objectfifo.release @of_2_broadcast_2_0(Consume, 1)
              aie.objectfifo.release @of_3_broadcast_5_0(Consume, 1)
            }
            aie.objectfifo.release @of_4_join_5_2(Produce, 1)
          }
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
          %c4 = arith.constant 4 : index
          scf.for %arg2 = %c0_0 to %c4 step %c1_1 {
            %0 = aie.objectfifo.acquire @of_4_join_5_3(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            func.call @op0_zero_bf16_64_64_64(%1) : (memref<64x64xbf16>) -> ()
            %c8 = arith.constant 8 : index
            scf.for %arg3 = %c0_0 to %c8 step %c1_1 {
              %2 = aie.objectfifo.acquire @of_3_broadcast_5_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
              %3 = aie.objectfifo.subview.access %2[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
              %4 = aie.objectfifo.acquire @of_2_broadcast_3_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
              %5 = aie.objectfifo.subview.access %4[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
              func.call @op0_matmul_bf16_bf16_64_64_64(%5, %3, %1) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>) -> ()
              aie.objectfifo.release @of_2_broadcast_3_0(Consume, 1)
              aie.objectfifo.release @of_3_broadcast_5_0(Consume, 1)
            }
            aie.objectfifo.release @of_4_join_5_3(Produce, 1)
          }
        }
      }
      aie.end
    } {link_with = "op0_mm_64_64_64.o"}
    %core_6_2 = aie.core(%tile_6_2) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c2 = arith.constant 2 : index
        scf.for %arg1 = %c0_0 to %c2 step %c1_1 {
          %c4 = arith.constant 4 : index
          scf.for %arg2 = %c0_0 to %c4 step %c1_1 {
            %0 = aie.objectfifo.acquire @of_4_join_6_0(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            func.call @op0_zero_bf16_64_64_64(%1) : (memref<64x64xbf16>) -> ()
            %c8 = arith.constant 8 : index
            scf.for %arg3 = %c0_0 to %c8 step %c1_1 {
              %2 = aie.objectfifo.acquire @of_3_broadcast_6_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
              %3 = aie.objectfifo.subview.access %2[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
              %4 = aie.objectfifo.acquire @of_2_broadcast_0_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
              %5 = aie.objectfifo.subview.access %4[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
              func.call @op0_matmul_bf16_bf16_64_64_64(%5, %3, %1) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>) -> ()
              aie.objectfifo.release @of_2_broadcast_0_0(Consume, 1)
              aie.objectfifo.release @of_3_broadcast_6_0(Consume, 1)
            }
            aie.objectfifo.release @of_4_join_6_0(Produce, 1)
          }
        }
      }
      aie.end
    } {link_with = "op0_mm_64_64_64.o"}
    %core_6_3 = aie.core(%tile_6_3) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c2 = arith.constant 2 : index
        scf.for %arg1 = %c0_0 to %c2 step %c1_1 {
          %c4 = arith.constant 4 : index
          scf.for %arg2 = %c0_0 to %c4 step %c1_1 {
            %0 = aie.objectfifo.acquire @of_4_join_6_1(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            func.call @op0_zero_bf16_64_64_64(%1) : (memref<64x64xbf16>) -> ()
            %c8 = arith.constant 8 : index
            scf.for %arg3 = %c0_0 to %c8 step %c1_1 {
              %2 = aie.objectfifo.acquire @of_3_broadcast_6_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
              %3 = aie.objectfifo.subview.access %2[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
              %4 = aie.objectfifo.acquire @of_2_broadcast_1_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
              %5 = aie.objectfifo.subview.access %4[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
              func.call @op0_matmul_bf16_bf16_64_64_64(%5, %3, %1) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>) -> ()
              aie.objectfifo.release @of_2_broadcast_1_0(Consume, 1)
              aie.objectfifo.release @of_3_broadcast_6_0(Consume, 1)
            }
            aie.objectfifo.release @of_4_join_6_1(Produce, 1)
          }
        }
      }
      aie.end
    } {link_with = "op0_mm_64_64_64.o"}
    %core_6_4 = aie.core(%tile_6_4) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c2 = arith.constant 2 : index
        scf.for %arg1 = %c0_0 to %c2 step %c1_1 {
          %c4 = arith.constant 4 : index
          scf.for %arg2 = %c0_0 to %c4 step %c1_1 {
            %0 = aie.objectfifo.acquire @of_4_join_6_2(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            func.call @op0_zero_bf16_64_64_64(%1) : (memref<64x64xbf16>) -> ()
            %c8 = arith.constant 8 : index
            scf.for %arg3 = %c0_0 to %c8 step %c1_1 {
              %2 = aie.objectfifo.acquire @of_3_broadcast_6_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
              %3 = aie.objectfifo.subview.access %2[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
              %4 = aie.objectfifo.acquire @of_2_broadcast_2_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
              %5 = aie.objectfifo.subview.access %4[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
              func.call @op0_matmul_bf16_bf16_64_64_64(%5, %3, %1) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>) -> ()
              aie.objectfifo.release @of_2_broadcast_2_0(Consume, 1)
              aie.objectfifo.release @of_3_broadcast_6_0(Consume, 1)
            }
            aie.objectfifo.release @of_4_join_6_2(Produce, 1)
          }
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
          %c4 = arith.constant 4 : index
          scf.for %arg2 = %c0_0 to %c4 step %c1_1 {
            %0 = aie.objectfifo.acquire @of_4_join_6_3(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            func.call @op0_zero_bf16_64_64_64(%1) : (memref<64x64xbf16>) -> ()
            %c8 = arith.constant 8 : index
            scf.for %arg3 = %c0_0 to %c8 step %c1_1 {
              %2 = aie.objectfifo.acquire @of_3_broadcast_6_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
              %3 = aie.objectfifo.subview.access %2[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
              %4 = aie.objectfifo.acquire @of_2_broadcast_3_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
              %5 = aie.objectfifo.subview.access %4[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
              func.call @op0_matmul_bf16_bf16_64_64_64(%5, %3, %1) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>) -> ()
              aie.objectfifo.release @of_2_broadcast_3_0(Consume, 1)
              aie.objectfifo.release @of_3_broadcast_6_0(Consume, 1)
            }
            aie.objectfifo.release @of_4_join_6_3(Produce, 1)
          }
        }
      }
      aie.end
    } {link_with = "op0_mm_64_64_64.o"}
    %core_7_2 = aie.core(%tile_7_2) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c2 = arith.constant 2 : index
        scf.for %arg1 = %c0_0 to %c2 step %c1_1 {
          %c4 = arith.constant 4 : index
          scf.for %arg2 = %c0_0 to %c4 step %c1_1 {
            %0 = aie.objectfifo.acquire @of_4_join_7_0(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            func.call @op0_zero_bf16_64_64_64(%1) : (memref<64x64xbf16>) -> ()
            %c8 = arith.constant 8 : index
            scf.for %arg3 = %c0_0 to %c8 step %c1_1 {
              %2 = aie.objectfifo.acquire @of_3_broadcast_7_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
              %3 = aie.objectfifo.subview.access %2[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
              %4 = aie.objectfifo.acquire @of_2_broadcast_0_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
              %5 = aie.objectfifo.subview.access %4[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
              func.call @op0_matmul_bf16_bf16_64_64_64(%5, %3, %1) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>) -> ()
              aie.objectfifo.release @of_2_broadcast_0_0(Consume, 1)
              aie.objectfifo.release @of_3_broadcast_7_0(Consume, 1)
            }
            aie.objectfifo.release @of_4_join_7_0(Produce, 1)
          }
        }
      }
      aie.end
    } {link_with = "op0_mm_64_64_64.o"}
    %core_7_3 = aie.core(%tile_7_3) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c2 = arith.constant 2 : index
        scf.for %arg1 = %c0_0 to %c2 step %c1_1 {
          %c4 = arith.constant 4 : index
          scf.for %arg2 = %c0_0 to %c4 step %c1_1 {
            %0 = aie.objectfifo.acquire @of_4_join_7_1(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            func.call @op0_zero_bf16_64_64_64(%1) : (memref<64x64xbf16>) -> ()
            %c8 = arith.constant 8 : index
            scf.for %arg3 = %c0_0 to %c8 step %c1_1 {
              %2 = aie.objectfifo.acquire @of_3_broadcast_7_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
              %3 = aie.objectfifo.subview.access %2[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
              %4 = aie.objectfifo.acquire @of_2_broadcast_1_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
              %5 = aie.objectfifo.subview.access %4[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
              func.call @op0_matmul_bf16_bf16_64_64_64(%5, %3, %1) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>) -> ()
              aie.objectfifo.release @of_2_broadcast_1_0(Consume, 1)
              aie.objectfifo.release @of_3_broadcast_7_0(Consume, 1)
            }
            aie.objectfifo.release @of_4_join_7_1(Produce, 1)
          }
        }
      }
      aie.end
    } {link_with = "op0_mm_64_64_64.o"}
    %core_7_4 = aie.core(%tile_7_4) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c2 = arith.constant 2 : index
        scf.for %arg1 = %c0_0 to %c2 step %c1_1 {
          %c4 = arith.constant 4 : index
          scf.for %arg2 = %c0_0 to %c4 step %c1_1 {
            %0 = aie.objectfifo.acquire @of_4_join_7_2(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            func.call @op0_zero_bf16_64_64_64(%1) : (memref<64x64xbf16>) -> ()
            %c8 = arith.constant 8 : index
            scf.for %arg3 = %c0_0 to %c8 step %c1_1 {
              %2 = aie.objectfifo.acquire @of_3_broadcast_7_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
              %3 = aie.objectfifo.subview.access %2[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
              %4 = aie.objectfifo.acquire @of_2_broadcast_2_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
              %5 = aie.objectfifo.subview.access %4[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
              func.call @op0_matmul_bf16_bf16_64_64_64(%5, %3, %1) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>) -> ()
              aie.objectfifo.release @of_2_broadcast_2_0(Consume, 1)
              aie.objectfifo.release @of_3_broadcast_7_0(Consume, 1)
            }
            aie.objectfifo.release @of_4_join_7_2(Produce, 1)
          }
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
          %c4 = arith.constant 4 : index
          scf.for %arg2 = %c0_0 to %c4 step %c1_1 {
            %0 = aie.objectfifo.acquire @of_4_join_7_3(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            func.call @op0_zero_bf16_64_64_64(%1) : (memref<64x64xbf16>) -> ()
            %c8 = arith.constant 8 : index
            scf.for %arg3 = %c0_0 to %c8 step %c1_1 {
              %2 = aie.objectfifo.acquire @of_3_broadcast_7_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
              %3 = aie.objectfifo.subview.access %2[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
              %4 = aie.objectfifo.acquire @of_2_broadcast_3_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
              %5 = aie.objectfifo.subview.access %4[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
              func.call @op0_matmul_bf16_bf16_64_64_64(%5, %3, %1) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>) -> ()
              aie.objectfifo.release @of_2_broadcast_3_0(Consume, 1)
              aie.objectfifo.release @of_3_broadcast_7_0(Consume, 1)
            }
            aie.objectfifo.release @of_4_join_7_3(Produce, 1)
          }
        }
      }
      aie.end
    } {link_with = "op0_mm_64_64_64.o"}
    aie.objectfifo @of_0_mem_0(%shim_noc_tile_0_0, {%mem_tile_0_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_0_mem_1(%shim_noc_tile_1_0, {%mem_tile_1_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_0_mem_2(%shim_noc_tile_2_0, {%mem_tile_2_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_0_mem_3(%shim_noc_tile_3_0, {%mem_tile_3_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_1_mem_0(%shim_noc_tile_0_0, {%mem_tile_0_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_1_mem_1(%shim_noc_tile_1_0, {%mem_tile_1_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_1_mem_2(%shim_noc_tile_2_0, {%mem_tile_2_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_1_mem_3(%shim_noc_tile_3_0, {%mem_tile_3_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_1_mem_4(%shim_noc_tile_4_0, {%mem_tile_4_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_1_mem_5(%shim_noc_tile_5_0, {%mem_tile_5_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_1_mem_6(%shim_noc_tile_6_0, {%mem_tile_6_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_1_mem_7(%shim_noc_tile_7_0, {%mem_tile_7_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_2_broadcast_0_0(%mem_tile_0_1 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%tile_0_2, %tile_1_2, %tile_2_2, %tile_3_2, %tile_4_2, %tile_5_2, %tile_6_2, %tile_7_2}, [4 : i32, 2 : i32, 2 : i32, 2 : i32, 2 : i32, 2 : i32, 2 : i32, 2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo.link [@of_0_mem_0] -> [@of_2_broadcast_0_0]([] [])
    aie.objectfifo @of_2_broadcast_1_0(%mem_tile_1_1 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%tile_0_3, %tile_1_3, %tile_2_3, %tile_3_3, %tile_4_3, %tile_5_3, %tile_6_3, %tile_7_3}, [4 : i32, 2 : i32, 2 : i32, 2 : i32, 2 : i32, 2 : i32, 2 : i32, 2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo.link [@of_0_mem_1] -> [@of_2_broadcast_1_0]([] [])
    aie.objectfifo @of_2_broadcast_2_0(%mem_tile_2_1 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%tile_0_4, %tile_1_4, %tile_2_4, %tile_3_4, %tile_4_4, %tile_5_4, %tile_6_4, %tile_7_4}, [4 : i32, 2 : i32, 2 : i32, 2 : i32, 2 : i32, 2 : i32, 2 : i32, 2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo.link [@of_0_mem_2] -> [@of_2_broadcast_2_0]([] [])
    aie.objectfifo @of_2_broadcast_3_0(%mem_tile_3_1 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%tile_0_5, %tile_1_5, %tile_2_5, %tile_3_5, %tile_4_5, %tile_5_5, %tile_6_5, %tile_7_5}, [4 : i32, 2 : i32, 2 : i32, 2 : i32, 2 : i32, 2 : i32, 2 : i32, 2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo.link [@of_0_mem_3] -> [@of_2_broadcast_3_0]([] [])
    aie.objectfifo @of_3_broadcast_0_0(%mem_tile_0_1 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%tile_0_2, %tile_0_3, %tile_0_4, %tile_0_5}, [4 : i32, 2 : i32, 2 : i32, 2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo.link [@of_1_mem_0] -> [@of_3_broadcast_0_0]([] [])
    aie.objectfifo @of_3_broadcast_1_0(%mem_tile_1_1 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%tile_1_2, %tile_1_3, %tile_1_4, %tile_1_5}, [4 : i32, 2 : i32, 2 : i32, 2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo.link [@of_1_mem_1] -> [@of_3_broadcast_1_0]([] [])
    aie.objectfifo @of_3_broadcast_2_0(%mem_tile_2_1 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%tile_2_2, %tile_2_3, %tile_2_4, %tile_2_5}, [4 : i32, 2 : i32, 2 : i32, 2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo.link [@of_1_mem_2] -> [@of_3_broadcast_2_0]([] [])
    aie.objectfifo @of_3_broadcast_3_0(%mem_tile_3_1 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%tile_3_2, %tile_3_3, %tile_3_4, %tile_3_5}, [4 : i32, 2 : i32, 2 : i32, 2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo.link [@of_1_mem_3] -> [@of_3_broadcast_3_0]([] [])
    aie.objectfifo @of_3_broadcast_4_0(%mem_tile_4_1 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%tile_4_2, %tile_4_3, %tile_4_4, %tile_4_5}, [4 : i32, 2 : i32, 2 : i32, 2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo.link [@of_1_mem_4] -> [@of_3_broadcast_4_0]([] [])
    aie.objectfifo @of_3_broadcast_5_0(%mem_tile_5_1 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%tile_5_2, %tile_5_3, %tile_5_4, %tile_5_5}, [4 : i32, 2 : i32, 2 : i32, 2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo.link [@of_1_mem_5] -> [@of_3_broadcast_5_0]([] [])
    aie.objectfifo @of_3_broadcast_6_0(%mem_tile_6_1 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%tile_6_2, %tile_6_3, %tile_6_4, %tile_6_5}, [4 : i32, 2 : i32, 2 : i32, 2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo.link [@of_1_mem_6] -> [@of_3_broadcast_6_0]([] [])
    aie.objectfifo @of_3_broadcast_7_0(%mem_tile_7_1 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%tile_7_2, %tile_7_3, %tile_7_4, %tile_7_5}, [4 : i32, 2 : i32, 2 : i32, 2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo.link [@of_1_mem_7] -> [@of_3_broadcast_7_0]([] [])
    aie.objectfifo @of_4_join_0_0(%tile_0_2, {%mem_tile_0_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_4_join_0_1(%tile_0_3, {%mem_tile_0_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_4_join_0_2(%tile_0_4, {%mem_tile_0_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_4_join_0_3(%tile_0_5, {%mem_tile_0_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_4_join_1_0(%tile_1_2, {%mem_tile_1_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_4_join_1_1(%tile_1_3, {%mem_tile_1_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_4_join_1_2(%tile_1_4, {%mem_tile_1_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_4_join_1_3(%tile_1_5, {%mem_tile_1_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_4_join_2_0(%tile_2_2, {%mem_tile_2_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_4_join_2_1(%tile_2_3, {%mem_tile_2_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_4_join_2_2(%tile_2_4, {%mem_tile_2_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_4_join_2_3(%tile_2_5, {%mem_tile_2_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_4_join_3_0(%tile_3_2, {%mem_tile_3_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_4_join_3_1(%tile_3_3, {%mem_tile_3_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_4_join_3_2(%tile_3_4, {%mem_tile_3_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_4_join_3_3(%tile_3_5, {%mem_tile_3_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_4_join_4_0(%tile_4_2, {%mem_tile_4_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_4_join_4_1(%tile_4_3, {%mem_tile_4_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_4_join_4_2(%tile_4_4, {%mem_tile_4_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_4_join_4_3(%tile_4_5, {%mem_tile_4_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_4_join_5_0(%tile_5_2, {%mem_tile_5_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_4_join_5_1(%tile_5_3, {%mem_tile_5_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_4_join_5_2(%tile_5_4, {%mem_tile_5_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_4_join_5_3(%tile_5_5, {%mem_tile_5_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_4_join_6_0(%tile_6_2, {%mem_tile_6_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_4_join_6_1(%tile_6_3, {%mem_tile_6_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_4_join_6_2(%tile_6_4, {%mem_tile_6_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_4_join_6_3(%tile_6_5, {%mem_tile_6_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_4_join_7_0(%tile_7_2, {%mem_tile_7_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_4_join_7_1(%tile_7_3, {%mem_tile_7_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_4_join_7_2(%tile_7_4, {%mem_tile_7_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_4_join_7_3(%tile_7_5, {%mem_tile_7_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_5_mem_0(%mem_tile_0_1 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%shim_noc_tile_0_0}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<4x64x64xbf16>>  
    aie.objectfifo.link [@of_4_join_0_0, @of_4_join_0_1, @of_4_join_0_2, @of_4_join_0_3] -> [@of_5_mem_0]([0, 4096, 8192, 12288] [])
    aie.objectfifo @of_5_mem_1(%mem_tile_1_1 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%shim_noc_tile_1_0}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<4x64x64xbf16>>  
    aie.objectfifo.link [@of_4_join_1_0, @of_4_join_1_1, @of_4_join_1_2, @of_4_join_1_3] -> [@of_5_mem_1]([0, 4096, 8192, 12288] [])
    aie.objectfifo @of_5_mem_2(%mem_tile_2_1 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%shim_noc_tile_2_0}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<4x64x64xbf16>>  
    aie.objectfifo.link [@of_4_join_2_0, @of_4_join_2_1, @of_4_join_2_2, @of_4_join_2_3] -> [@of_5_mem_2]([0, 4096, 8192, 12288] [])
    aie.objectfifo @of_5_mem_3(%mem_tile_3_1 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%shim_noc_tile_3_0}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<4x64x64xbf16>>  
    aie.objectfifo.link [@of_4_join_3_0, @of_4_join_3_1, @of_4_join_3_2, @of_4_join_3_3] -> [@of_5_mem_3]([0, 4096, 8192, 12288] [])
    aie.objectfifo @of_5_mem_4(%mem_tile_4_1 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%shim_noc_tile_4_0}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<4x64x64xbf16>>  
    aie.objectfifo.link [@of_4_join_4_0, @of_4_join_4_1, @of_4_join_4_2, @of_4_join_4_3] -> [@of_5_mem_4]([0, 4096, 8192, 12288] [])
    aie.objectfifo @of_5_mem_5(%mem_tile_5_1 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%shim_noc_tile_5_0}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<4x64x64xbf16>>  
    aie.objectfifo.link [@of_4_join_5_0, @of_4_join_5_1, @of_4_join_5_2, @of_4_join_5_3] -> [@of_5_mem_5]([0, 4096, 8192, 12288] [])
    aie.objectfifo @of_5_mem_6(%mem_tile_6_1 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%shim_noc_tile_6_0}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<4x64x64xbf16>>  
    aie.objectfifo.link [@of_4_join_6_0, @of_4_join_6_1, @of_4_join_6_2, @of_4_join_6_3] -> [@of_5_mem_6]([0, 4096, 8192, 12288] [])
    aie.objectfifo @of_5_mem_7(%mem_tile_7_1 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%shim_noc_tile_7_0}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<4x64x64xbf16>>  
    aie.objectfifo.link [@of_4_join_7_0, @of_4_join_7_1, @of_4_join_7_2, @of_4_join_7_3] -> [@of_5_mem_7]([0, 4096, 8192, 12288] [])
    func.func private @op0_zero_bf16_64_64_64(memref<64x64xbf16>)
    func.func private @op0_matmul_bf16_bf16_64_64_64(memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>)
  }
  aie.device(npu2) @op1__SwiGLUStreamGroup {
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
    %tile_0_2 = aie.tile(0, 2)
    %tile_1_2 = aie.tile(1, 2)
    %tile_2_2 = aie.tile(2, 2)
    %tile_3_2 = aie.tile(3, 2)
    %tile_4_2 = aie.tile(4, 2)
    %tile_5_2 = aie.tile(5, 2)
    %tile_6_2 = aie.tile(6, 2)
    %tile_7_2 = aie.tile(7, 2)
    aie.runtime_sequence(%arg0: memref<512x2048xbf16>, %arg1: memref<512x2048xbf16>) {
      %0 = aiex.dma_configure_task_for @of_0_mem_0 {
        aie.dma_bd(%arg0 : memref<512x2048xbf16> offset = 0 len = 131072 sizes = [1, 64, 32, 64] strides = [0, 16384, 64, 1])
        aie.end
      } {issue_token = true, iteration_t = 0 : index}
      aiex.dma_start_task(%0)
      %1 = aiex.dma_configure_task_for @of_0_mem_1 {
        aie.dma_bd(%arg0 : memref<512x2048xbf16> offset = 2048 len = 131072 sizes = [1, 64, 32, 64] strides = [0, 16384, 64, 1])
        aie.end
      } {issue_token = true, iteration_t = 0 : index}
      aiex.dma_start_task(%1)
      %2 = aiex.dma_configure_task_for @of_0_mem_2 {
        aie.dma_bd(%arg0 : memref<512x2048xbf16> offset = 4096 len = 131072 sizes = [1, 64, 32, 64] strides = [0, 16384, 64, 1])
        aie.end
      } {issue_token = true, iteration_t = 0 : index}
      aiex.dma_start_task(%2)
      %3 = aiex.dma_configure_task_for @of_0_mem_3 {
        aie.dma_bd(%arg0 : memref<512x2048xbf16> offset = 6144 len = 131072 sizes = [1, 64, 32, 64] strides = [0, 16384, 64, 1])
        aie.end
      } {issue_token = true, iteration_t = 0 : index}
      aiex.dma_start_task(%3)
      %4 = aiex.dma_configure_task_for @of_0_mem_4 {
        aie.dma_bd(%arg0 : memref<512x2048xbf16> offset = 8192 len = 131072 sizes = [1, 64, 32, 64] strides = [0, 16384, 64, 1])
        aie.end
      } {issue_token = true, iteration_t = 0 : index}
      aiex.dma_start_task(%4)
      %5 = aiex.dma_configure_task_for @of_0_mem_5 {
        aie.dma_bd(%arg0 : memref<512x2048xbf16> offset = 10240 len = 131072 sizes = [1, 64, 32, 64] strides = [0, 16384, 64, 1])
        aie.end
      } {issue_token = true, iteration_t = 0 : index}
      aiex.dma_start_task(%5)
      %6 = aiex.dma_configure_task_for @of_0_mem_6 {
        aie.dma_bd(%arg0 : memref<512x2048xbf16> offset = 12288 len = 131072 sizes = [1, 64, 32, 64] strides = [0, 16384, 64, 1])
        aie.end
      } {issue_token = true, iteration_t = 0 : index}
      aiex.dma_start_task(%6)
      %7 = aiex.dma_configure_task_for @of_0_mem_7 {
        aie.dma_bd(%arg0 : memref<512x2048xbf16> offset = 14336 len = 131072 sizes = [1, 64, 32, 64] strides = [0, 16384, 64, 1])
        aie.end
      } {issue_token = true, iteration_t = 0 : index}
      aiex.dma_start_task(%7)
      %8 = aiex.dma_configure_task_for @of_3_mem_0 {
        aie.dma_bd(%arg1 : memref<512x2048xbf16> offset = 0 len = 131072 sizes = [1, 64, 32, 64] strides = [0, 16384, 64, 1])
        aie.end
      } {issue_token = true, iteration_t = 0 : index}
      aiex.dma_start_task(%8)
      %9 = aiex.dma_configure_task_for @of_3_mem_1 {
        aie.dma_bd(%arg1 : memref<512x2048xbf16> offset = 2048 len = 131072 sizes = [1, 64, 32, 64] strides = [0, 16384, 64, 1])
        aie.end
      } {issue_token = true, iteration_t = 0 : index}
      aiex.dma_start_task(%9)
      %10 = aiex.dma_configure_task_for @of_3_mem_2 {
        aie.dma_bd(%arg1 : memref<512x2048xbf16> offset = 4096 len = 131072 sizes = [1, 64, 32, 64] strides = [0, 16384, 64, 1])
        aie.end
      } {issue_token = true, iteration_t = 0 : index}
      aiex.dma_start_task(%10)
      %11 = aiex.dma_configure_task_for @of_3_mem_3 {
        aie.dma_bd(%arg1 : memref<512x2048xbf16> offset = 6144 len = 131072 sizes = [1, 64, 32, 64] strides = [0, 16384, 64, 1])
        aie.end
      } {issue_token = true, iteration_t = 0 : index}
      aiex.dma_start_task(%11)
      %12 = aiex.dma_configure_task_for @of_3_mem_4 {
        aie.dma_bd(%arg1 : memref<512x2048xbf16> offset = 8192 len = 131072 sizes = [1, 64, 32, 64] strides = [0, 16384, 64, 1])
        aie.end
      } {issue_token = true, iteration_t = 0 : index}
      aiex.dma_start_task(%12)
      %13 = aiex.dma_configure_task_for @of_3_mem_5 {
        aie.dma_bd(%arg1 : memref<512x2048xbf16> offset = 10240 len = 131072 sizes = [1, 64, 32, 64] strides = [0, 16384, 64, 1])
        aie.end
      } {issue_token = true, iteration_t = 0 : index}
      aiex.dma_start_task(%13)
      %14 = aiex.dma_configure_task_for @of_3_mem_6 {
        aie.dma_bd(%arg1 : memref<512x2048xbf16> offset = 12288 len = 131072 sizes = [1, 64, 32, 64] strides = [0, 16384, 64, 1])
        aie.end
      } {issue_token = true, iteration_t = 0 : index}
      aiex.dma_start_task(%14)
      %15 = aiex.dma_configure_task_for @of_3_mem_7 {
        aie.dma_bd(%arg1 : memref<512x2048xbf16> offset = 14336 len = 131072 sizes = [1, 64, 32, 64] strides = [0, 16384, 64, 1])
        aie.end
      } {issue_token = true, iteration_t = 0 : index}
      aiex.dma_start_task(%15)
      aiex.dma_await_task(%0)
      aiex.dma_await_task(%1)
      aiex.dma_await_task(%2)
      aiex.dma_await_task(%3)
      aiex.dma_await_task(%4)
      aiex.dma_await_task(%5)
      aiex.dma_await_task(%6)
      aiex.dma_await_task(%7)
      aiex.dma_await_task(%8)
      aiex.dma_await_task(%9)
      aiex.dma_await_task(%10)
      aiex.dma_await_task(%11)
      aiex.dma_await_task(%12)
      aiex.dma_await_task(%13)
      aiex.dma_await_task(%14)
      aiex.dma_await_task(%15)
    }
    %core_0_2 = aie.core(%tile_0_2) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c64 = arith.constant 64 : index
        scf.for %arg1 = %c0_0 to %c64 step %c1_1 {
          %0 = aie.objectfifo.acquire @of_1_unicast_0_0(Consume, 1) : !aie.objectfifosubview<memref<1x2048xbf16>>
          %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<1x2048xbf16>> -> memref<1x2048xbf16>
          %c1_2 = arith.constant 1 : index
          scf.for %arg2 = %c0_0 to %c1_2 step %c1_1 {
            %2 = aie.objectfifo.acquire @of_2_unicast_0(Produce, 1) : !aie.objectfifosubview<memref<1x2048xbf16>>
            %3 = aie.objectfifo.subview.access %2[0] : !aie.objectfifosubview<memref<1x2048xbf16>> -> memref<1x2048xbf16>
            %c2048_i32 = arith.constant 2048 : i32
            func.call @op1_silu_bf16(%1, %3, %c2048_i32) : (memref<1x2048xbf16>, memref<1x2048xbf16>, i32) -> ()
            aie.objectfifo.release @of_2_unicast_0(Produce, 1)
          }
          aie.objectfifo.release @of_1_unicast_0_0(Consume, 1)
        }
      }
      aie.end
    } {link_with = "op1_silu.o"}
    %core_1_2 = aie.core(%tile_1_2) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c64 = arith.constant 64 : index
        scf.for %arg1 = %c0_0 to %c64 step %c1_1 {
          %0 = aie.objectfifo.acquire @of_1_unicast_1_0(Consume, 1) : !aie.objectfifosubview<memref<1x2048xbf16>>
          %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<1x2048xbf16>> -> memref<1x2048xbf16>
          %c1_2 = arith.constant 1 : index
          scf.for %arg2 = %c0_0 to %c1_2 step %c1_1 {
            %2 = aie.objectfifo.acquire @of_2_unicast_1(Produce, 1) : !aie.objectfifosubview<memref<1x2048xbf16>>
            %3 = aie.objectfifo.subview.access %2[0] : !aie.objectfifosubview<memref<1x2048xbf16>> -> memref<1x2048xbf16>
            %c2048_i32 = arith.constant 2048 : i32
            func.call @op1_silu_bf16(%1, %3, %c2048_i32) : (memref<1x2048xbf16>, memref<1x2048xbf16>, i32) -> ()
            aie.objectfifo.release @of_2_unicast_1(Produce, 1)
          }
          aie.objectfifo.release @of_1_unicast_1_0(Consume, 1)
        }
      }
      aie.end
    } {link_with = "op1_silu.o"}
    %core_2_2 = aie.core(%tile_2_2) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c64 = arith.constant 64 : index
        scf.for %arg1 = %c0_0 to %c64 step %c1_1 {
          %0 = aie.objectfifo.acquire @of_1_unicast_2_0(Consume, 1) : !aie.objectfifosubview<memref<1x2048xbf16>>
          %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<1x2048xbf16>> -> memref<1x2048xbf16>
          %c1_2 = arith.constant 1 : index
          scf.for %arg2 = %c0_0 to %c1_2 step %c1_1 {
            %2 = aie.objectfifo.acquire @of_2_unicast_2(Produce, 1) : !aie.objectfifosubview<memref<1x2048xbf16>>
            %3 = aie.objectfifo.subview.access %2[0] : !aie.objectfifosubview<memref<1x2048xbf16>> -> memref<1x2048xbf16>
            %c2048_i32 = arith.constant 2048 : i32
            func.call @op1_silu_bf16(%1, %3, %c2048_i32) : (memref<1x2048xbf16>, memref<1x2048xbf16>, i32) -> ()
            aie.objectfifo.release @of_2_unicast_2(Produce, 1)
          }
          aie.objectfifo.release @of_1_unicast_2_0(Consume, 1)
        }
      }
      aie.end
    } {link_with = "op1_silu.o"}
    %core_3_2 = aie.core(%tile_3_2) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c64 = arith.constant 64 : index
        scf.for %arg1 = %c0_0 to %c64 step %c1_1 {
          %0 = aie.objectfifo.acquire @of_1_unicast_3_0(Consume, 1) : !aie.objectfifosubview<memref<1x2048xbf16>>
          %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<1x2048xbf16>> -> memref<1x2048xbf16>
          %c1_2 = arith.constant 1 : index
          scf.for %arg2 = %c0_0 to %c1_2 step %c1_1 {
            %2 = aie.objectfifo.acquire @of_2_unicast_3(Produce, 1) : !aie.objectfifosubview<memref<1x2048xbf16>>
            %3 = aie.objectfifo.subview.access %2[0] : !aie.objectfifosubview<memref<1x2048xbf16>> -> memref<1x2048xbf16>
            %c2048_i32 = arith.constant 2048 : i32
            func.call @op1_silu_bf16(%1, %3, %c2048_i32) : (memref<1x2048xbf16>, memref<1x2048xbf16>, i32) -> ()
            aie.objectfifo.release @of_2_unicast_3(Produce, 1)
          }
          aie.objectfifo.release @of_1_unicast_3_0(Consume, 1)
        }
      }
      aie.end
    } {link_with = "op1_silu.o"}
    %core_4_2 = aie.core(%tile_4_2) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c64 = arith.constant 64 : index
        scf.for %arg1 = %c0_0 to %c64 step %c1_1 {
          %0 = aie.objectfifo.acquire @of_1_unicast_4_0(Consume, 1) : !aie.objectfifosubview<memref<1x2048xbf16>>
          %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<1x2048xbf16>> -> memref<1x2048xbf16>
          %c1_2 = arith.constant 1 : index
          scf.for %arg2 = %c0_0 to %c1_2 step %c1_1 {
            %2 = aie.objectfifo.acquire @of_2_unicast_4(Produce, 1) : !aie.objectfifosubview<memref<1x2048xbf16>>
            %3 = aie.objectfifo.subview.access %2[0] : !aie.objectfifosubview<memref<1x2048xbf16>> -> memref<1x2048xbf16>
            %c2048_i32 = arith.constant 2048 : i32
            func.call @op1_silu_bf16(%1, %3, %c2048_i32) : (memref<1x2048xbf16>, memref<1x2048xbf16>, i32) -> ()
            aie.objectfifo.release @of_2_unicast_4(Produce, 1)
          }
          aie.objectfifo.release @of_1_unicast_4_0(Consume, 1)
        }
      }
      aie.end
    } {link_with = "op1_silu.o"}
    %core_5_2 = aie.core(%tile_5_2) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c64 = arith.constant 64 : index
        scf.for %arg1 = %c0_0 to %c64 step %c1_1 {
          %0 = aie.objectfifo.acquire @of_1_unicast_5_0(Consume, 1) : !aie.objectfifosubview<memref<1x2048xbf16>>
          %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<1x2048xbf16>> -> memref<1x2048xbf16>
          %c1_2 = arith.constant 1 : index
          scf.for %arg2 = %c0_0 to %c1_2 step %c1_1 {
            %2 = aie.objectfifo.acquire @of_2_unicast_5(Produce, 1) : !aie.objectfifosubview<memref<1x2048xbf16>>
            %3 = aie.objectfifo.subview.access %2[0] : !aie.objectfifosubview<memref<1x2048xbf16>> -> memref<1x2048xbf16>
            %c2048_i32 = arith.constant 2048 : i32
            func.call @op1_silu_bf16(%1, %3, %c2048_i32) : (memref<1x2048xbf16>, memref<1x2048xbf16>, i32) -> ()
            aie.objectfifo.release @of_2_unicast_5(Produce, 1)
          }
          aie.objectfifo.release @of_1_unicast_5_0(Consume, 1)
        }
      }
      aie.end
    } {link_with = "op1_silu.o"}
    %core_6_2 = aie.core(%tile_6_2) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c64 = arith.constant 64 : index
        scf.for %arg1 = %c0_0 to %c64 step %c1_1 {
          %0 = aie.objectfifo.acquire @of_1_unicast_6_0(Consume, 1) : !aie.objectfifosubview<memref<1x2048xbf16>>
          %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<1x2048xbf16>> -> memref<1x2048xbf16>
          %c1_2 = arith.constant 1 : index
          scf.for %arg2 = %c0_0 to %c1_2 step %c1_1 {
            %2 = aie.objectfifo.acquire @of_2_unicast_6(Produce, 1) : !aie.objectfifosubview<memref<1x2048xbf16>>
            %3 = aie.objectfifo.subview.access %2[0] : !aie.objectfifosubview<memref<1x2048xbf16>> -> memref<1x2048xbf16>
            %c2048_i32 = arith.constant 2048 : i32
            func.call @op1_silu_bf16(%1, %3, %c2048_i32) : (memref<1x2048xbf16>, memref<1x2048xbf16>, i32) -> ()
            aie.objectfifo.release @of_2_unicast_6(Produce, 1)
          }
          aie.objectfifo.release @of_1_unicast_6_0(Consume, 1)
        }
      }
      aie.end
    } {link_with = "op1_silu.o"}
    %core_7_2 = aie.core(%tile_7_2) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c64 = arith.constant 64 : index
        scf.for %arg1 = %c0_0 to %c64 step %c1_1 {
          %0 = aie.objectfifo.acquire @of_1_unicast_7_0(Consume, 1) : !aie.objectfifosubview<memref<1x2048xbf16>>
          %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<1x2048xbf16>> -> memref<1x2048xbf16>
          %c1_2 = arith.constant 1 : index
          scf.for %arg2 = %c0_0 to %c1_2 step %c1_1 {
            %2 = aie.objectfifo.acquire @of_2_unicast_7(Produce, 1) : !aie.objectfifosubview<memref<1x2048xbf16>>
            %3 = aie.objectfifo.subview.access %2[0] : !aie.objectfifosubview<memref<1x2048xbf16>> -> memref<1x2048xbf16>
            %c2048_i32 = arith.constant 2048 : i32
            func.call @op1_silu_bf16(%1, %3, %c2048_i32) : (memref<1x2048xbf16>, memref<1x2048xbf16>, i32) -> ()
            aie.objectfifo.release @of_2_unicast_7(Produce, 1)
          }
          aie.objectfifo.release @of_1_unicast_7_0(Consume, 1)
        }
      }
      aie.end
    } {link_with = "op1_silu.o"}
    aie.objectfifo @of_0_mem_0(%shim_noc_tile_0_0, {%mem_tile_0_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<1x1x2048xbf16>>  
    aie.objectfifo @of_0_mem_1(%shim_noc_tile_1_0, {%mem_tile_1_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<1x1x2048xbf16>>  
    aie.objectfifo @of_0_mem_2(%shim_noc_tile_2_0, {%mem_tile_2_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<1x1x2048xbf16>>  
    aie.objectfifo @of_0_mem_3(%shim_noc_tile_3_0, {%mem_tile_3_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<1x1x2048xbf16>>  
    aie.objectfifo @of_0_mem_4(%shim_noc_tile_4_0, {%mem_tile_4_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<1x1x2048xbf16>>  
    aie.objectfifo @of_0_mem_5(%shim_noc_tile_5_0, {%mem_tile_5_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<1x1x2048xbf16>>  
    aie.objectfifo @of_0_mem_6(%shim_noc_tile_6_0, {%mem_tile_6_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<1x1x2048xbf16>>  
    aie.objectfifo @of_0_mem_7(%shim_noc_tile_7_0, {%mem_tile_7_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<1x1x2048xbf16>>  
    aie.objectfifo @of_1_unicast_0_0(%mem_tile_0_1, {%tile_0_2}, [4 : i32, 4 : i32]) : !aie.objectfifo<memref<1x2048xbf16>>  
    aie.objectfifo.link [@of_0_mem_0] -> [@of_1_unicast_0_0]([] [])
    aie.objectfifo @of_1_unicast_1_0(%mem_tile_1_1, {%tile_1_2}, [4 : i32, 4 : i32]) : !aie.objectfifo<memref<1x2048xbf16>>  
    aie.objectfifo.link [@of_0_mem_1] -> [@of_1_unicast_1_0]([] [])
    aie.objectfifo @of_1_unicast_2_0(%mem_tile_2_1, {%tile_2_2}, [4 : i32, 4 : i32]) : !aie.objectfifo<memref<1x2048xbf16>>  
    aie.objectfifo.link [@of_0_mem_2] -> [@of_1_unicast_2_0]([] [])
    aie.objectfifo @of_1_unicast_3_0(%mem_tile_3_1, {%tile_3_2}, [4 : i32, 4 : i32]) : !aie.objectfifo<memref<1x2048xbf16>>  
    aie.objectfifo.link [@of_0_mem_3] -> [@of_1_unicast_3_0]([] [])
    aie.objectfifo @of_1_unicast_4_0(%mem_tile_4_1, {%tile_4_2}, [4 : i32, 4 : i32]) : !aie.objectfifo<memref<1x2048xbf16>>  
    aie.objectfifo.link [@of_0_mem_4] -> [@of_1_unicast_4_0]([] [])
    aie.objectfifo @of_1_unicast_5_0(%mem_tile_5_1, {%tile_5_2}, [4 : i32, 4 : i32]) : !aie.objectfifo<memref<1x2048xbf16>>  
    aie.objectfifo.link [@of_0_mem_5] -> [@of_1_unicast_5_0]([] [])
    aie.objectfifo @of_1_unicast_6_0(%mem_tile_6_1, {%tile_6_2}, [4 : i32, 4 : i32]) : !aie.objectfifo<memref<1x2048xbf16>>  
    aie.objectfifo.link [@of_0_mem_6] -> [@of_1_unicast_6_0]([] [])
    aie.objectfifo @of_1_unicast_7_0(%mem_tile_7_1, {%tile_7_2}, [4 : i32, 4 : i32]) : !aie.objectfifo<memref<1x2048xbf16>>  
    aie.objectfifo.link [@of_0_mem_7] -> [@of_1_unicast_7_0]([] [])
    aie.objectfifo @of_2_unicast_0(%tile_0_2, {%mem_tile_0_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<1x2048xbf16>>  
    aie.objectfifo @of_2_unicast_1(%tile_1_2, {%mem_tile_1_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<1x2048xbf16>>  
    aie.objectfifo @of_2_unicast_2(%tile_2_2, {%mem_tile_2_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<1x2048xbf16>>  
    aie.objectfifo @of_2_unicast_3(%tile_3_2, {%mem_tile_3_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<1x2048xbf16>>  
    aie.objectfifo @of_2_unicast_4(%tile_4_2, {%mem_tile_4_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<1x2048xbf16>>  
    aie.objectfifo @of_2_unicast_5(%tile_5_2, {%mem_tile_5_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<1x2048xbf16>>  
    aie.objectfifo @of_2_unicast_6(%tile_6_2, {%mem_tile_6_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<1x2048xbf16>>  
    aie.objectfifo @of_2_unicast_7(%tile_7_2, {%mem_tile_7_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<1x2048xbf16>>  
    aie.objectfifo @of_3_mem_0(%mem_tile_0_1, {%shim_noc_tile_0_0}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<1x1x2048xbf16>>  
    aie.objectfifo.link [@of_2_unicast_0] -> [@of_3_mem_0]([] [])
    aie.objectfifo @of_3_mem_1(%mem_tile_1_1, {%shim_noc_tile_1_0}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<1x1x2048xbf16>>  
    aie.objectfifo.link [@of_2_unicast_1] -> [@of_3_mem_1]([] [])
    aie.objectfifo @of_3_mem_2(%mem_tile_2_1, {%shim_noc_tile_2_0}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<1x1x2048xbf16>>  
    aie.objectfifo.link [@of_2_unicast_2] -> [@of_3_mem_2]([] [])
    aie.objectfifo @of_3_mem_3(%mem_tile_3_1, {%shim_noc_tile_3_0}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<1x1x2048xbf16>>  
    aie.objectfifo.link [@of_2_unicast_3] -> [@of_3_mem_3]([] [])
    aie.objectfifo @of_3_mem_4(%mem_tile_4_1, {%shim_noc_tile_4_0}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<1x1x2048xbf16>>  
    aie.objectfifo.link [@of_2_unicast_4] -> [@of_3_mem_4]([] [])
    aie.objectfifo @of_3_mem_5(%mem_tile_5_1, {%shim_noc_tile_5_0}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<1x1x2048xbf16>>  
    aie.objectfifo.link [@of_2_unicast_5] -> [@of_3_mem_5]([] [])
    aie.objectfifo @of_3_mem_6(%mem_tile_6_1, {%shim_noc_tile_6_0}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<1x1x2048xbf16>>  
    aie.objectfifo.link [@of_2_unicast_6] -> [@of_3_mem_6]([] [])
    aie.objectfifo @of_3_mem_7(%mem_tile_7_1, {%shim_noc_tile_7_0}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<1x1x2048xbf16>>  
    aie.objectfifo.link [@of_2_unicast_7] -> [@of_3_mem_7]([] [])
    func.func private @op1_silu_bf16(memref<1x2048xbf16>, memref<1x2048xbf16>, i32)
  }
  aie.device(npu2) @op2__SwiGLUStreamGroup {
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
    %tile_0_2 = aie.tile(0, 2)
    %tile_1_2 = aie.tile(1, 2)
    %tile_2_2 = aie.tile(2, 2)
    %tile_3_2 = aie.tile(3, 2)
    %tile_4_2 = aie.tile(4, 2)
    %tile_5_2 = aie.tile(5, 2)
    %tile_6_2 = aie.tile(6, 2)
    %tile_7_2 = aie.tile(7, 2)
    aie.runtime_sequence(%arg0: memref<512x2048xbf16>, %arg1: memref<512x2048xbf16>, %arg2: memref<512x2048xbf16>) {
      %0 = aiex.dma_configure_task_for @of_0_mem_0 {
        aie.dma_bd(%arg0 : memref<512x2048xbf16> offset = 0 len = 131072 sizes = [1, 64, 32, 64] strides = [0, 16384, 64, 1])
        aie.end
      } {issue_token = true, iteration_t = 0 : index}
      aiex.dma_start_task(%0)
      %1 = aiex.dma_configure_task_for @of_0_mem_1 {
        aie.dma_bd(%arg0 : memref<512x2048xbf16> offset = 2048 len = 131072 sizes = [1, 64, 32, 64] strides = [0, 16384, 64, 1])
        aie.end
      } {issue_token = true, iteration_t = 0 : index}
      aiex.dma_start_task(%1)
      %2 = aiex.dma_configure_task_for @of_0_mem_2 {
        aie.dma_bd(%arg0 : memref<512x2048xbf16> offset = 4096 len = 131072 sizes = [1, 64, 32, 64] strides = [0, 16384, 64, 1])
        aie.end
      } {issue_token = true, iteration_t = 0 : index}
      aiex.dma_start_task(%2)
      %3 = aiex.dma_configure_task_for @of_0_mem_3 {
        aie.dma_bd(%arg0 : memref<512x2048xbf16> offset = 6144 len = 131072 sizes = [1, 64, 32, 64] strides = [0, 16384, 64, 1])
        aie.end
      } {issue_token = true, iteration_t = 0 : index}
      aiex.dma_start_task(%3)
      %4 = aiex.dma_configure_task_for @of_0_mem_4 {
        aie.dma_bd(%arg0 : memref<512x2048xbf16> offset = 8192 len = 131072 sizes = [1, 64, 32, 64] strides = [0, 16384, 64, 1])
        aie.end
      } {issue_token = true, iteration_t = 0 : index}
      aiex.dma_start_task(%4)
      %5 = aiex.dma_configure_task_for @of_0_mem_5 {
        aie.dma_bd(%arg0 : memref<512x2048xbf16> offset = 10240 len = 131072 sizes = [1, 64, 32, 64] strides = [0, 16384, 64, 1])
        aie.end
      } {issue_token = true, iteration_t = 0 : index}
      aiex.dma_start_task(%5)
      %6 = aiex.dma_configure_task_for @of_0_mem_6 {
        aie.dma_bd(%arg0 : memref<512x2048xbf16> offset = 12288 len = 131072 sizes = [1, 64, 32, 64] strides = [0, 16384, 64, 1])
        aie.end
      } {issue_token = true, iteration_t = 0 : index}
      aiex.dma_start_task(%6)
      %7 = aiex.dma_configure_task_for @of_0_mem_7 {
        aie.dma_bd(%arg0 : memref<512x2048xbf16> offset = 14336 len = 131072 sizes = [1, 64, 32, 64] strides = [0, 16384, 64, 1])
        aie.end
      } {issue_token = true, iteration_t = 0 : index}
      aiex.dma_start_task(%7)
      %8 = aiex.dma_configure_task_for @of_1_mem_0 {
        aie.dma_bd(%arg1 : memref<512x2048xbf16> offset = 0 len = 131072 sizes = [1, 64, 32, 64] strides = [0, 16384, 64, 1])
        aie.end
      } {issue_token = true, iteration_t = 0 : index}
      aiex.dma_start_task(%8)
      %9 = aiex.dma_configure_task_for @of_1_mem_1 {
        aie.dma_bd(%arg1 : memref<512x2048xbf16> offset = 2048 len = 131072 sizes = [1, 64, 32, 64] strides = [0, 16384, 64, 1])
        aie.end
      } {issue_token = true, iteration_t = 0 : index}
      aiex.dma_start_task(%9)
      %10 = aiex.dma_configure_task_for @of_1_mem_2 {
        aie.dma_bd(%arg1 : memref<512x2048xbf16> offset = 4096 len = 131072 sizes = [1, 64, 32, 64] strides = [0, 16384, 64, 1])
        aie.end
      } {issue_token = true, iteration_t = 0 : index}
      aiex.dma_start_task(%10)
      %11 = aiex.dma_configure_task_for @of_1_mem_3 {
        aie.dma_bd(%arg1 : memref<512x2048xbf16> offset = 6144 len = 131072 sizes = [1, 64, 32, 64] strides = [0, 16384, 64, 1])
        aie.end
      } {issue_token = true, iteration_t = 0 : index}
      aiex.dma_start_task(%11)
      %12 = aiex.dma_configure_task_for @of_1_mem_4 {
        aie.dma_bd(%arg1 : memref<512x2048xbf16> offset = 8192 len = 131072 sizes = [1, 64, 32, 64] strides = [0, 16384, 64, 1])
        aie.end
      } {issue_token = true, iteration_t = 0 : index}
      aiex.dma_start_task(%12)
      %13 = aiex.dma_configure_task_for @of_1_mem_5 {
        aie.dma_bd(%arg1 : memref<512x2048xbf16> offset = 10240 len = 131072 sizes = [1, 64, 32, 64] strides = [0, 16384, 64, 1])
        aie.end
      } {issue_token = true, iteration_t = 0 : index}
      aiex.dma_start_task(%13)
      %14 = aiex.dma_configure_task_for @of_1_mem_6 {
        aie.dma_bd(%arg1 : memref<512x2048xbf16> offset = 12288 len = 131072 sizes = [1, 64, 32, 64] strides = [0, 16384, 64, 1])
        aie.end
      } {issue_token = true, iteration_t = 0 : index}
      aiex.dma_start_task(%14)
      %15 = aiex.dma_configure_task_for @of_1_mem_7 {
        aie.dma_bd(%arg1 : memref<512x2048xbf16> offset = 14336 len = 131072 sizes = [1, 64, 32, 64] strides = [0, 16384, 64, 1])
        aie.end
      } {issue_token = true, iteration_t = 0 : index}
      aiex.dma_start_task(%15)
      %16 = aiex.dma_configure_task_for @of_5_mem_0 {
        aie.dma_bd(%arg2 : memref<512x2048xbf16> offset = 0 len = 131072 sizes = [1, 64, 32, 64] strides = [0, 16384, 64, 1])
        aie.end
      } {issue_token = true, iteration_t = 0 : index}
      aiex.dma_start_task(%16)
      %17 = aiex.dma_configure_task_for @of_5_mem_1 {
        aie.dma_bd(%arg2 : memref<512x2048xbf16> offset = 2048 len = 131072 sizes = [1, 64, 32, 64] strides = [0, 16384, 64, 1])
        aie.end
      } {issue_token = true, iteration_t = 0 : index}
      aiex.dma_start_task(%17)
      %18 = aiex.dma_configure_task_for @of_5_mem_2 {
        aie.dma_bd(%arg2 : memref<512x2048xbf16> offset = 4096 len = 131072 sizes = [1, 64, 32, 64] strides = [0, 16384, 64, 1])
        aie.end
      } {issue_token = true, iteration_t = 0 : index}
      aiex.dma_start_task(%18)
      %19 = aiex.dma_configure_task_for @of_5_mem_3 {
        aie.dma_bd(%arg2 : memref<512x2048xbf16> offset = 6144 len = 131072 sizes = [1, 64, 32, 64] strides = [0, 16384, 64, 1])
        aie.end
      } {issue_token = true, iteration_t = 0 : index}
      aiex.dma_start_task(%19)
      %20 = aiex.dma_configure_task_for @of_5_mem_4 {
        aie.dma_bd(%arg2 : memref<512x2048xbf16> offset = 8192 len = 131072 sizes = [1, 64, 32, 64] strides = [0, 16384, 64, 1])
        aie.end
      } {issue_token = true, iteration_t = 0 : index}
      aiex.dma_start_task(%20)
      %21 = aiex.dma_configure_task_for @of_5_mem_5 {
        aie.dma_bd(%arg2 : memref<512x2048xbf16> offset = 10240 len = 131072 sizes = [1, 64, 32, 64] strides = [0, 16384, 64, 1])
        aie.end
      } {issue_token = true, iteration_t = 0 : index}
      aiex.dma_start_task(%21)
      %22 = aiex.dma_configure_task_for @of_5_mem_6 {
        aie.dma_bd(%arg2 : memref<512x2048xbf16> offset = 12288 len = 131072 sizes = [1, 64, 32, 64] strides = [0, 16384, 64, 1])
        aie.end
      } {issue_token = true, iteration_t = 0 : index}
      aiex.dma_start_task(%22)
      %23 = aiex.dma_configure_task_for @of_5_mem_7 {
        aie.dma_bd(%arg2 : memref<512x2048xbf16> offset = 14336 len = 131072 sizes = [1, 64, 32, 64] strides = [0, 16384, 64, 1])
        aie.end
      } {issue_token = true, iteration_t = 0 : index}
      aiex.dma_start_task(%23)
      aiex.dma_await_task(%0)
      aiex.dma_await_task(%1)
      aiex.dma_await_task(%2)
      aiex.dma_await_task(%3)
      aiex.dma_await_task(%4)
      aiex.dma_await_task(%5)
      aiex.dma_await_task(%6)
      aiex.dma_await_task(%7)
      aiex.dma_await_task(%8)
      aiex.dma_await_task(%9)
      aiex.dma_await_task(%10)
      aiex.dma_await_task(%11)
      aiex.dma_await_task(%12)
      aiex.dma_await_task(%13)
      aiex.dma_await_task(%14)
      aiex.dma_await_task(%15)
      aiex.dma_await_task(%16)
      aiex.dma_await_task(%17)
      aiex.dma_await_task(%18)
      aiex.dma_await_task(%19)
      aiex.dma_await_task(%20)
      aiex.dma_await_task(%21)
      aiex.dma_await_task(%22)
      aiex.dma_await_task(%23)
    }
    %core_0_2 = aie.core(%tile_0_2) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c64 = arith.constant 64 : index
        scf.for %arg1 = %c0_0 to %c64 step %c1_1 {
          %0 = aie.objectfifo.acquire @of_3_unicast_0_0(Consume, 1) : !aie.objectfifosubview<memref<1x2048xbf16>>
          %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<1x2048xbf16>> -> memref<1x2048xbf16>
          %2 = aie.objectfifo.acquire @of_2_unicast_0_0(Consume, 1) : !aie.objectfifosubview<memref<1x2048xbf16>>
          %3 = aie.objectfifo.subview.access %2[0] : !aie.objectfifosubview<memref<1x2048xbf16>> -> memref<1x2048xbf16>
          %c1_2 = arith.constant 1 : index
          scf.for %arg2 = %c0_0 to %c1_2 step %c1_1 {
            %4 = aie.objectfifo.acquire @of_4_unicast_0(Produce, 1) : !aie.objectfifosubview<memref<1x2048xbf16>>
            %5 = aie.objectfifo.subview.access %4[0] : !aie.objectfifosubview<memref<1x2048xbf16>> -> memref<1x2048xbf16>
            %c2048_i32 = arith.constant 2048 : i32
            func.call @op2_eltwise_mul_bf16_vector(%3, %1, %5, %c2048_i32) : (memref<1x2048xbf16>, memref<1x2048xbf16>, memref<1x2048xbf16>, i32) -> ()
            aie.objectfifo.release @of_4_unicast_0(Produce, 1)
          }
          aie.objectfifo.release @of_2_unicast_0_0(Consume, 1)
          aie.objectfifo.release @of_3_unicast_0_0(Consume, 1)
        }
      }
      aie.end
    } {link_with = "op2_mul.o"}
    %core_1_2 = aie.core(%tile_1_2) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c64 = arith.constant 64 : index
        scf.for %arg1 = %c0_0 to %c64 step %c1_1 {
          %0 = aie.objectfifo.acquire @of_3_unicast_1_0(Consume, 1) : !aie.objectfifosubview<memref<1x2048xbf16>>
          %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<1x2048xbf16>> -> memref<1x2048xbf16>
          %2 = aie.objectfifo.acquire @of_2_unicast_1_0(Consume, 1) : !aie.objectfifosubview<memref<1x2048xbf16>>
          %3 = aie.objectfifo.subview.access %2[0] : !aie.objectfifosubview<memref<1x2048xbf16>> -> memref<1x2048xbf16>
          %c1_2 = arith.constant 1 : index
          scf.for %arg2 = %c0_0 to %c1_2 step %c1_1 {
            %4 = aie.objectfifo.acquire @of_4_unicast_1(Produce, 1) : !aie.objectfifosubview<memref<1x2048xbf16>>
            %5 = aie.objectfifo.subview.access %4[0] : !aie.objectfifosubview<memref<1x2048xbf16>> -> memref<1x2048xbf16>
            %c2048_i32 = arith.constant 2048 : i32
            func.call @op2_eltwise_mul_bf16_vector(%3, %1, %5, %c2048_i32) : (memref<1x2048xbf16>, memref<1x2048xbf16>, memref<1x2048xbf16>, i32) -> ()
            aie.objectfifo.release @of_4_unicast_1(Produce, 1)
          }
          aie.objectfifo.release @of_2_unicast_1_0(Consume, 1)
          aie.objectfifo.release @of_3_unicast_1_0(Consume, 1)
        }
      }
      aie.end
    } {link_with = "op2_mul.o"}
    %core_2_2 = aie.core(%tile_2_2) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c64 = arith.constant 64 : index
        scf.for %arg1 = %c0_0 to %c64 step %c1_1 {
          %0 = aie.objectfifo.acquire @of_3_unicast_2_0(Consume, 1) : !aie.objectfifosubview<memref<1x2048xbf16>>
          %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<1x2048xbf16>> -> memref<1x2048xbf16>
          %2 = aie.objectfifo.acquire @of_2_unicast_2_0(Consume, 1) : !aie.objectfifosubview<memref<1x2048xbf16>>
          %3 = aie.objectfifo.subview.access %2[0] : !aie.objectfifosubview<memref<1x2048xbf16>> -> memref<1x2048xbf16>
          %c1_2 = arith.constant 1 : index
          scf.for %arg2 = %c0_0 to %c1_2 step %c1_1 {
            %4 = aie.objectfifo.acquire @of_4_unicast_2(Produce, 1) : !aie.objectfifosubview<memref<1x2048xbf16>>
            %5 = aie.objectfifo.subview.access %4[0] : !aie.objectfifosubview<memref<1x2048xbf16>> -> memref<1x2048xbf16>
            %c2048_i32 = arith.constant 2048 : i32
            func.call @op2_eltwise_mul_bf16_vector(%3, %1, %5, %c2048_i32) : (memref<1x2048xbf16>, memref<1x2048xbf16>, memref<1x2048xbf16>, i32) -> ()
            aie.objectfifo.release @of_4_unicast_2(Produce, 1)
          }
          aie.objectfifo.release @of_2_unicast_2_0(Consume, 1)
          aie.objectfifo.release @of_3_unicast_2_0(Consume, 1)
        }
      }
      aie.end
    } {link_with = "op2_mul.o"}
    %core_3_2 = aie.core(%tile_3_2) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c64 = arith.constant 64 : index
        scf.for %arg1 = %c0_0 to %c64 step %c1_1 {
          %0 = aie.objectfifo.acquire @of_3_unicast_3_0(Consume, 1) : !aie.objectfifosubview<memref<1x2048xbf16>>
          %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<1x2048xbf16>> -> memref<1x2048xbf16>
          %2 = aie.objectfifo.acquire @of_2_unicast_3_0(Consume, 1) : !aie.objectfifosubview<memref<1x2048xbf16>>
          %3 = aie.objectfifo.subview.access %2[0] : !aie.objectfifosubview<memref<1x2048xbf16>> -> memref<1x2048xbf16>
          %c1_2 = arith.constant 1 : index
          scf.for %arg2 = %c0_0 to %c1_2 step %c1_1 {
            %4 = aie.objectfifo.acquire @of_4_unicast_3(Produce, 1) : !aie.objectfifosubview<memref<1x2048xbf16>>
            %5 = aie.objectfifo.subview.access %4[0] : !aie.objectfifosubview<memref<1x2048xbf16>> -> memref<1x2048xbf16>
            %c2048_i32 = arith.constant 2048 : i32
            func.call @op2_eltwise_mul_bf16_vector(%3, %1, %5, %c2048_i32) : (memref<1x2048xbf16>, memref<1x2048xbf16>, memref<1x2048xbf16>, i32) -> ()
            aie.objectfifo.release @of_4_unicast_3(Produce, 1)
          }
          aie.objectfifo.release @of_2_unicast_3_0(Consume, 1)
          aie.objectfifo.release @of_3_unicast_3_0(Consume, 1)
        }
      }
      aie.end
    } {link_with = "op2_mul.o"}
    %core_4_2 = aie.core(%tile_4_2) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c64 = arith.constant 64 : index
        scf.for %arg1 = %c0_0 to %c64 step %c1_1 {
          %0 = aie.objectfifo.acquire @of_3_unicast_4_0(Consume, 1) : !aie.objectfifosubview<memref<1x2048xbf16>>
          %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<1x2048xbf16>> -> memref<1x2048xbf16>
          %2 = aie.objectfifo.acquire @of_2_unicast_4_0(Consume, 1) : !aie.objectfifosubview<memref<1x2048xbf16>>
          %3 = aie.objectfifo.subview.access %2[0] : !aie.objectfifosubview<memref<1x2048xbf16>> -> memref<1x2048xbf16>
          %c1_2 = arith.constant 1 : index
          scf.for %arg2 = %c0_0 to %c1_2 step %c1_1 {
            %4 = aie.objectfifo.acquire @of_4_unicast_4(Produce, 1) : !aie.objectfifosubview<memref<1x2048xbf16>>
            %5 = aie.objectfifo.subview.access %4[0] : !aie.objectfifosubview<memref<1x2048xbf16>> -> memref<1x2048xbf16>
            %c2048_i32 = arith.constant 2048 : i32
            func.call @op2_eltwise_mul_bf16_vector(%3, %1, %5, %c2048_i32) : (memref<1x2048xbf16>, memref<1x2048xbf16>, memref<1x2048xbf16>, i32) -> ()
            aie.objectfifo.release @of_4_unicast_4(Produce, 1)
          }
          aie.objectfifo.release @of_2_unicast_4_0(Consume, 1)
          aie.objectfifo.release @of_3_unicast_4_0(Consume, 1)
        }
      }
      aie.end
    } {link_with = "op2_mul.o"}
    %core_5_2 = aie.core(%tile_5_2) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c64 = arith.constant 64 : index
        scf.for %arg1 = %c0_0 to %c64 step %c1_1 {
          %0 = aie.objectfifo.acquire @of_3_unicast_5_0(Consume, 1) : !aie.objectfifosubview<memref<1x2048xbf16>>
          %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<1x2048xbf16>> -> memref<1x2048xbf16>
          %2 = aie.objectfifo.acquire @of_2_unicast_5_0(Consume, 1) : !aie.objectfifosubview<memref<1x2048xbf16>>
          %3 = aie.objectfifo.subview.access %2[0] : !aie.objectfifosubview<memref<1x2048xbf16>> -> memref<1x2048xbf16>
          %c1_2 = arith.constant 1 : index
          scf.for %arg2 = %c0_0 to %c1_2 step %c1_1 {
            %4 = aie.objectfifo.acquire @of_4_unicast_5(Produce, 1) : !aie.objectfifosubview<memref<1x2048xbf16>>
            %5 = aie.objectfifo.subview.access %4[0] : !aie.objectfifosubview<memref<1x2048xbf16>> -> memref<1x2048xbf16>
            %c2048_i32 = arith.constant 2048 : i32
            func.call @op2_eltwise_mul_bf16_vector(%3, %1, %5, %c2048_i32) : (memref<1x2048xbf16>, memref<1x2048xbf16>, memref<1x2048xbf16>, i32) -> ()
            aie.objectfifo.release @of_4_unicast_5(Produce, 1)
          }
          aie.objectfifo.release @of_2_unicast_5_0(Consume, 1)
          aie.objectfifo.release @of_3_unicast_5_0(Consume, 1)
        }
      }
      aie.end
    } {link_with = "op2_mul.o"}
    %core_6_2 = aie.core(%tile_6_2) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c64 = arith.constant 64 : index
        scf.for %arg1 = %c0_0 to %c64 step %c1_1 {
          %0 = aie.objectfifo.acquire @of_3_unicast_6_0(Consume, 1) : !aie.objectfifosubview<memref<1x2048xbf16>>
          %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<1x2048xbf16>> -> memref<1x2048xbf16>
          %2 = aie.objectfifo.acquire @of_2_unicast_6_0(Consume, 1) : !aie.objectfifosubview<memref<1x2048xbf16>>
          %3 = aie.objectfifo.subview.access %2[0] : !aie.objectfifosubview<memref<1x2048xbf16>> -> memref<1x2048xbf16>
          %c1_2 = arith.constant 1 : index
          scf.for %arg2 = %c0_0 to %c1_2 step %c1_1 {
            %4 = aie.objectfifo.acquire @of_4_unicast_6(Produce, 1) : !aie.objectfifosubview<memref<1x2048xbf16>>
            %5 = aie.objectfifo.subview.access %4[0] : !aie.objectfifosubview<memref<1x2048xbf16>> -> memref<1x2048xbf16>
            %c2048_i32 = arith.constant 2048 : i32
            func.call @op2_eltwise_mul_bf16_vector(%3, %1, %5, %c2048_i32) : (memref<1x2048xbf16>, memref<1x2048xbf16>, memref<1x2048xbf16>, i32) -> ()
            aie.objectfifo.release @of_4_unicast_6(Produce, 1)
          }
          aie.objectfifo.release @of_2_unicast_6_0(Consume, 1)
          aie.objectfifo.release @of_3_unicast_6_0(Consume, 1)
        }
      }
      aie.end
    } {link_with = "op2_mul.o"}
    %core_7_2 = aie.core(%tile_7_2) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c64 = arith.constant 64 : index
        scf.for %arg1 = %c0_0 to %c64 step %c1_1 {
          %0 = aie.objectfifo.acquire @of_3_unicast_7_0(Consume, 1) : !aie.objectfifosubview<memref<1x2048xbf16>>
          %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<1x2048xbf16>> -> memref<1x2048xbf16>
          %2 = aie.objectfifo.acquire @of_2_unicast_7_0(Consume, 1) : !aie.objectfifosubview<memref<1x2048xbf16>>
          %3 = aie.objectfifo.subview.access %2[0] : !aie.objectfifosubview<memref<1x2048xbf16>> -> memref<1x2048xbf16>
          %c1_2 = arith.constant 1 : index
          scf.for %arg2 = %c0_0 to %c1_2 step %c1_1 {
            %4 = aie.objectfifo.acquire @of_4_unicast_7(Produce, 1) : !aie.objectfifosubview<memref<1x2048xbf16>>
            %5 = aie.objectfifo.subview.access %4[0] : !aie.objectfifosubview<memref<1x2048xbf16>> -> memref<1x2048xbf16>
            %c2048_i32 = arith.constant 2048 : i32
            func.call @op2_eltwise_mul_bf16_vector(%3, %1, %5, %c2048_i32) : (memref<1x2048xbf16>, memref<1x2048xbf16>, memref<1x2048xbf16>, i32) -> ()
            aie.objectfifo.release @of_4_unicast_7(Produce, 1)
          }
          aie.objectfifo.release @of_2_unicast_7_0(Consume, 1)
          aie.objectfifo.release @of_3_unicast_7_0(Consume, 1)
        }
      }
      aie.end
    } {link_with = "op2_mul.o"}
    aie.objectfifo @of_0_mem_0(%shim_noc_tile_0_0, {%mem_tile_0_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<1x1x2048xbf16>>  
    aie.objectfifo @of_0_mem_1(%shim_noc_tile_1_0, {%mem_tile_1_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<1x1x2048xbf16>>  
    aie.objectfifo @of_0_mem_2(%shim_noc_tile_2_0, {%mem_tile_2_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<1x1x2048xbf16>>  
    aie.objectfifo @of_0_mem_3(%shim_noc_tile_3_0, {%mem_tile_3_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<1x1x2048xbf16>>  
    aie.objectfifo @of_0_mem_4(%shim_noc_tile_4_0, {%mem_tile_4_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<1x1x2048xbf16>>  
    aie.objectfifo @of_0_mem_5(%shim_noc_tile_5_0, {%mem_tile_5_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<1x1x2048xbf16>>  
    aie.objectfifo @of_0_mem_6(%shim_noc_tile_6_0, {%mem_tile_6_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<1x1x2048xbf16>>  
    aie.objectfifo @of_0_mem_7(%shim_noc_tile_7_0, {%mem_tile_7_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<1x1x2048xbf16>>  
    aie.objectfifo @of_1_mem_0(%shim_noc_tile_0_0, {%mem_tile_0_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<1x1x2048xbf16>>  
    aie.objectfifo @of_1_mem_1(%shim_noc_tile_1_0, {%mem_tile_1_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<1x1x2048xbf16>>  
    aie.objectfifo @of_1_mem_2(%shim_noc_tile_2_0, {%mem_tile_2_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<1x1x2048xbf16>>  
    aie.objectfifo @of_1_mem_3(%shim_noc_tile_3_0, {%mem_tile_3_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<1x1x2048xbf16>>  
    aie.objectfifo @of_1_mem_4(%shim_noc_tile_4_0, {%mem_tile_4_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<1x1x2048xbf16>>  
    aie.objectfifo @of_1_mem_5(%shim_noc_tile_5_0, {%mem_tile_5_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<1x1x2048xbf16>>  
    aie.objectfifo @of_1_mem_6(%shim_noc_tile_6_0, {%mem_tile_6_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<1x1x2048xbf16>>  
    aie.objectfifo @of_1_mem_7(%shim_noc_tile_7_0, {%mem_tile_7_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<1x1x2048xbf16>>  
    aie.objectfifo @of_2_unicast_0_0(%mem_tile_0_1, {%tile_0_2}, [4 : i32, 4 : i32]) : !aie.objectfifo<memref<1x2048xbf16>>  
    aie.objectfifo.link [@of_0_mem_0] -> [@of_2_unicast_0_0]([] [])
    aie.objectfifo @of_2_unicast_1_0(%mem_tile_1_1, {%tile_1_2}, [4 : i32, 4 : i32]) : !aie.objectfifo<memref<1x2048xbf16>>  
    aie.objectfifo.link [@of_0_mem_1] -> [@of_2_unicast_1_0]([] [])
    aie.objectfifo @of_2_unicast_2_0(%mem_tile_2_1, {%tile_2_2}, [4 : i32, 4 : i32]) : !aie.objectfifo<memref<1x2048xbf16>>  
    aie.objectfifo.link [@of_0_mem_2] -> [@of_2_unicast_2_0]([] [])
    aie.objectfifo @of_2_unicast_3_0(%mem_tile_3_1, {%tile_3_2}, [4 : i32, 4 : i32]) : !aie.objectfifo<memref<1x2048xbf16>>  
    aie.objectfifo.link [@of_0_mem_3] -> [@of_2_unicast_3_0]([] [])
    aie.objectfifo @of_2_unicast_4_0(%mem_tile_4_1, {%tile_4_2}, [4 : i32, 4 : i32]) : !aie.objectfifo<memref<1x2048xbf16>>  
    aie.objectfifo.link [@of_0_mem_4] -> [@of_2_unicast_4_0]([] [])
    aie.objectfifo @of_2_unicast_5_0(%mem_tile_5_1, {%tile_5_2}, [4 : i32, 4 : i32]) : !aie.objectfifo<memref<1x2048xbf16>>  
    aie.objectfifo.link [@of_0_mem_5] -> [@of_2_unicast_5_0]([] [])
    aie.objectfifo @of_2_unicast_6_0(%mem_tile_6_1, {%tile_6_2}, [4 : i32, 4 : i32]) : !aie.objectfifo<memref<1x2048xbf16>>  
    aie.objectfifo.link [@of_0_mem_6] -> [@of_2_unicast_6_0]([] [])
    aie.objectfifo @of_2_unicast_7_0(%mem_tile_7_1, {%tile_7_2}, [4 : i32, 4 : i32]) : !aie.objectfifo<memref<1x2048xbf16>>  
    aie.objectfifo.link [@of_0_mem_7] -> [@of_2_unicast_7_0]([] [])
    aie.objectfifo @of_3_unicast_0_0(%mem_tile_0_1, {%tile_0_2}, [4 : i32, 4 : i32]) : !aie.objectfifo<memref<1x2048xbf16>>  
    aie.objectfifo.link [@of_1_mem_0] -> [@of_3_unicast_0_0]([] [])
    aie.objectfifo @of_3_unicast_1_0(%mem_tile_1_1, {%tile_1_2}, [4 : i32, 4 : i32]) : !aie.objectfifo<memref<1x2048xbf16>>  
    aie.objectfifo.link [@of_1_mem_1] -> [@of_3_unicast_1_0]([] [])
    aie.objectfifo @of_3_unicast_2_0(%mem_tile_2_1, {%tile_2_2}, [4 : i32, 4 : i32]) : !aie.objectfifo<memref<1x2048xbf16>>  
    aie.objectfifo.link [@of_1_mem_2] -> [@of_3_unicast_2_0]([] [])
    aie.objectfifo @of_3_unicast_3_0(%mem_tile_3_1, {%tile_3_2}, [4 : i32, 4 : i32]) : !aie.objectfifo<memref<1x2048xbf16>>  
    aie.objectfifo.link [@of_1_mem_3] -> [@of_3_unicast_3_0]([] [])
    aie.objectfifo @of_3_unicast_4_0(%mem_tile_4_1, {%tile_4_2}, [4 : i32, 4 : i32]) : !aie.objectfifo<memref<1x2048xbf16>>  
    aie.objectfifo.link [@of_1_mem_4] -> [@of_3_unicast_4_0]([] [])
    aie.objectfifo @of_3_unicast_5_0(%mem_tile_5_1, {%tile_5_2}, [4 : i32, 4 : i32]) : !aie.objectfifo<memref<1x2048xbf16>>  
    aie.objectfifo.link [@of_1_mem_5] -> [@of_3_unicast_5_0]([] [])
    aie.objectfifo @of_3_unicast_6_0(%mem_tile_6_1, {%tile_6_2}, [4 : i32, 4 : i32]) : !aie.objectfifo<memref<1x2048xbf16>>  
    aie.objectfifo.link [@of_1_mem_6] -> [@of_3_unicast_6_0]([] [])
    aie.objectfifo @of_3_unicast_7_0(%mem_tile_7_1, {%tile_7_2}, [4 : i32, 4 : i32]) : !aie.objectfifo<memref<1x2048xbf16>>  
    aie.objectfifo.link [@of_1_mem_7] -> [@of_3_unicast_7_0]([] [])
    aie.objectfifo @of_4_unicast_0(%tile_0_2, {%mem_tile_0_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<1x2048xbf16>>  
    aie.objectfifo @of_4_unicast_1(%tile_1_2, {%mem_tile_1_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<1x2048xbf16>>  
    aie.objectfifo @of_4_unicast_2(%tile_2_2, {%mem_tile_2_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<1x2048xbf16>>  
    aie.objectfifo @of_4_unicast_3(%tile_3_2, {%mem_tile_3_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<1x2048xbf16>>  
    aie.objectfifo @of_4_unicast_4(%tile_4_2, {%mem_tile_4_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<1x2048xbf16>>  
    aie.objectfifo @of_4_unicast_5(%tile_5_2, {%mem_tile_5_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<1x2048xbf16>>  
    aie.objectfifo @of_4_unicast_6(%tile_6_2, {%mem_tile_6_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<1x2048xbf16>>  
    aie.objectfifo @of_4_unicast_7(%tile_7_2, {%mem_tile_7_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<1x2048xbf16>>  
    aie.objectfifo @of_5_mem_0(%mem_tile_0_1, {%shim_noc_tile_0_0}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<1x1x2048xbf16>>  
    aie.objectfifo.link [@of_4_unicast_0] -> [@of_5_mem_0]([] [])
    aie.objectfifo @of_5_mem_1(%mem_tile_1_1, {%shim_noc_tile_1_0}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<1x1x2048xbf16>>  
    aie.objectfifo.link [@of_4_unicast_1] -> [@of_5_mem_1]([] [])
    aie.objectfifo @of_5_mem_2(%mem_tile_2_1, {%shim_noc_tile_2_0}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<1x1x2048xbf16>>  
    aie.objectfifo.link [@of_4_unicast_2] -> [@of_5_mem_2]([] [])
    aie.objectfifo @of_5_mem_3(%mem_tile_3_1, {%shim_noc_tile_3_0}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<1x1x2048xbf16>>  
    aie.objectfifo.link [@of_4_unicast_3] -> [@of_5_mem_3]([] [])
    aie.objectfifo @of_5_mem_4(%mem_tile_4_1, {%shim_noc_tile_4_0}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<1x1x2048xbf16>>  
    aie.objectfifo.link [@of_4_unicast_4] -> [@of_5_mem_4]([] [])
    aie.objectfifo @of_5_mem_5(%mem_tile_5_1, {%shim_noc_tile_5_0}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<1x1x2048xbf16>>  
    aie.objectfifo.link [@of_4_unicast_5] -> [@of_5_mem_5]([] [])
    aie.objectfifo @of_5_mem_6(%mem_tile_6_1, {%shim_noc_tile_6_0}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<1x1x2048xbf16>>  
    aie.objectfifo.link [@of_4_unicast_6] -> [@of_5_mem_6]([] [])
    aie.objectfifo @of_5_mem_7(%mem_tile_7_1, {%shim_noc_tile_7_0}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<1x1x2048xbf16>>  
    aie.objectfifo.link [@of_4_unicast_7] -> [@of_5_mem_7]([] [])
    func.func private @op2_eltwise_mul_bf16_vector(memref<1x2048xbf16>, memref<1x2048xbf16>, memref<1x2048xbf16>, i32)
  }
  aie.device(npu2) @op3__SwiGLUStreamGroup {
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
    %tile_4_2 = aie.tile(4, 2)
    %tile_4_3 = aie.tile(4, 3)
    %tile_4_4 = aie.tile(4, 4)
    %tile_4_5 = aie.tile(4, 5)
    %tile_5_2 = aie.tile(5, 2)
    %tile_5_3 = aie.tile(5, 3)
    %tile_5_4 = aie.tile(5, 4)
    %tile_5_5 = aie.tile(5, 5)
    %tile_6_2 = aie.tile(6, 2)
    %tile_6_3 = aie.tile(6, 3)
    %tile_6_4 = aie.tile(6, 4)
    %tile_6_5 = aie.tile(6, 5)
    %tile_7_2 = aie.tile(7, 2)
    %tile_7_3 = aie.tile(7, 3)
    %tile_7_4 = aie.tile(7, 4)
    %tile_7_5 = aie.tile(7, 5)
    aie.runtime_sequence(%arg0: memref<512x2048xbf16>, %arg1: memref<2048x512xbf16>, %arg2: memref<512x512xbf16>) {
      %0 = aiex.dma_configure_task_for @of_0_mem_0 {
        aie.dma_bd(%arg0 : memref<512x2048xbf16> offset = 0 len = 131072 sizes = [2, 32, 64, 64] strides = [524288, 64, 2048, 1])
        aie.end
      } {issue_token = true, iteration_t = 0 : index, repeat_count = 1 : i32}
      aiex.dma_start_task(%0)
      %1 = aiex.dma_configure_task_for @of_0_mem_1 {
        aie.dma_bd(%arg0 : memref<512x2048xbf16> offset = 131072 len = 131072 sizes = [2, 32, 64, 64] strides = [524288, 64, 2048, 1])
        aie.end
      } {issue_token = true, iteration_t = 0 : index, repeat_count = 1 : i32}
      aiex.dma_start_task(%1)
      %2 = aiex.dma_configure_task_for @of_0_mem_2 {
        aie.dma_bd(%arg0 : memref<512x2048xbf16> offset = 262144 len = 131072 sizes = [2, 32, 64, 64] strides = [524288, 64, 2048, 1])
        aie.end
      } {issue_token = true, iteration_t = 0 : index, repeat_count = 1 : i32}
      aiex.dma_start_task(%2)
      %3 = aiex.dma_configure_task_for @of_0_mem_3 {
        aie.dma_bd(%arg0 : memref<512x2048xbf16> offset = 393216 len = 131072 sizes = [2, 32, 64, 64] strides = [524288, 64, 2048, 1])
        aie.end
      } {issue_token = true, iteration_t = 0 : index, repeat_count = 1 : i32}
      aiex.dma_start_task(%3)
      %4 = aiex.dma_configure_task_for @of_1_mem_0 {
        aie.dma_bd(%arg1 : memref<2048x512xbf16> offset = 0 len = 131072 sizes = [2, 32, 64, 64] strides = [0, 32768, 512, 1])
        aie.end
      } {issue_token = true, iteration_t = 0 : index, repeat_count = 1 : i32}
      aiex.dma_start_task(%4)
      %5 = aiex.dma_configure_task_for @of_1_mem_1 {
        aie.dma_bd(%arg1 : memref<2048x512xbf16> offset = 64 len = 131072 sizes = [2, 32, 64, 64] strides = [0, 32768, 512, 1])
        aie.end
      } {issue_token = true, iteration_t = 0 : index, repeat_count = 1 : i32}
      aiex.dma_start_task(%5)
      %6 = aiex.dma_configure_task_for @of_1_mem_2 {
        aie.dma_bd(%arg1 : memref<2048x512xbf16> offset = 128 len = 131072 sizes = [2, 32, 64, 64] strides = [0, 32768, 512, 1])
        aie.end
      } {issue_token = true, iteration_t = 0 : index, repeat_count = 1 : i32}
      aiex.dma_start_task(%6)
      %7 = aiex.dma_configure_task_for @of_1_mem_3 {
        aie.dma_bd(%arg1 : memref<2048x512xbf16> offset = 192 len = 131072 sizes = [2, 32, 64, 64] strides = [0, 32768, 512, 1])
        aie.end
      } {issue_token = true, iteration_t = 0 : index, repeat_count = 1 : i32}
      aiex.dma_start_task(%7)
      %8 = aiex.dma_configure_task_for @of_1_mem_4 {
        aie.dma_bd(%arg1 : memref<2048x512xbf16> offset = 256 len = 131072 sizes = [2, 32, 64, 64] strides = [0, 32768, 512, 1])
        aie.end
      } {issue_token = true, iteration_t = 0 : index, repeat_count = 1 : i32}
      aiex.dma_start_task(%8)
      %9 = aiex.dma_configure_task_for @of_1_mem_5 {
        aie.dma_bd(%arg1 : memref<2048x512xbf16> offset = 320 len = 131072 sizes = [2, 32, 64, 64] strides = [0, 32768, 512, 1])
        aie.end
      } {issue_token = true, iteration_t = 0 : index, repeat_count = 1 : i32}
      aiex.dma_start_task(%9)
      %10 = aiex.dma_configure_task_for @of_1_mem_6 {
        aie.dma_bd(%arg1 : memref<2048x512xbf16> offset = 384 len = 131072 sizes = [2, 32, 64, 64] strides = [0, 32768, 512, 1])
        aie.end
      } {issue_token = true, iteration_t = 0 : index, repeat_count = 1 : i32}
      aiex.dma_start_task(%10)
      %11 = aiex.dma_configure_task_for @of_1_mem_7 {
        aie.dma_bd(%arg1 : memref<2048x512xbf16> offset = 448 len = 131072 sizes = [2, 32, 64, 64] strides = [0, 32768, 512, 1])
        aie.end
      } {issue_token = true, iteration_t = 0 : index, repeat_count = 1 : i32}
      aiex.dma_start_task(%11)
      %12 = aiex.dma_configure_task_for @of_5_mem_0 {
        aie.dma_bd(%arg2 : memref<512x512xbf16> offset = 0 len = 32768 sizes = [1, 1, 512, 64] strides = [0, 0, 512, 1])
        aie.end
      } {issue_token = true, iteration_t = 0 : index}
      aiex.dma_start_task(%12)
      %13 = aiex.dma_configure_task_for @of_5_mem_1 {
        aie.dma_bd(%arg2 : memref<512x512xbf16> offset = 64 len = 32768 sizes = [1, 1, 512, 64] strides = [0, 0, 512, 1])
        aie.end
      } {issue_token = true, iteration_t = 0 : index}
      aiex.dma_start_task(%13)
      %14 = aiex.dma_configure_task_for @of_5_mem_2 {
        aie.dma_bd(%arg2 : memref<512x512xbf16> offset = 128 len = 32768 sizes = [1, 1, 512, 64] strides = [0, 0, 512, 1])
        aie.end
      } {issue_token = true, iteration_t = 0 : index}
      aiex.dma_start_task(%14)
      %15 = aiex.dma_configure_task_for @of_5_mem_3 {
        aie.dma_bd(%arg2 : memref<512x512xbf16> offset = 192 len = 32768 sizes = [1, 1, 512, 64] strides = [0, 0, 512, 1])
        aie.end
      } {issue_token = true, iteration_t = 0 : index}
      aiex.dma_start_task(%15)
      %16 = aiex.dma_configure_task_for @of_5_mem_4 {
        aie.dma_bd(%arg2 : memref<512x512xbf16> offset = 256 len = 32768 sizes = [1, 1, 512, 64] strides = [0, 0, 512, 1])
        aie.end
      } {issue_token = true, iteration_t = 0 : index}
      aiex.dma_start_task(%16)
      %17 = aiex.dma_configure_task_for @of_5_mem_5 {
        aie.dma_bd(%arg2 : memref<512x512xbf16> offset = 320 len = 32768 sizes = [1, 1, 512, 64] strides = [0, 0, 512, 1])
        aie.end
      } {issue_token = true, iteration_t = 0 : index}
      aiex.dma_start_task(%17)
      %18 = aiex.dma_configure_task_for @of_5_mem_6 {
        aie.dma_bd(%arg2 : memref<512x512xbf16> offset = 384 len = 32768 sizes = [1, 1, 512, 64] strides = [0, 0, 512, 1])
        aie.end
      } {issue_token = true, iteration_t = 0 : index}
      aiex.dma_start_task(%18)
      %19 = aiex.dma_configure_task_for @of_5_mem_7 {
        aie.dma_bd(%arg2 : memref<512x512xbf16> offset = 448 len = 32768 sizes = [1, 1, 512, 64] strides = [0, 0, 512, 1])
        aie.end
      } {issue_token = true, iteration_t = 0 : index}
      aiex.dma_start_task(%19)
      aiex.dma_await_task(%0)
      aiex.dma_await_task(%1)
      aiex.dma_await_task(%2)
      aiex.dma_await_task(%3)
      aiex.dma_await_task(%4)
      aiex.dma_await_task(%5)
      aiex.dma_await_task(%6)
      aiex.dma_await_task(%7)
      aiex.dma_await_task(%8)
      aiex.dma_await_task(%9)
      aiex.dma_await_task(%10)
      aiex.dma_await_task(%11)
      aiex.dma_await_task(%12)
      aiex.dma_await_task(%13)
      aiex.dma_await_task(%14)
      aiex.dma_await_task(%15)
      aiex.dma_await_task(%16)
      aiex.dma_await_task(%17)
      aiex.dma_await_task(%18)
      aiex.dma_await_task(%19)
    }
    %core_0_2 = aie.core(%tile_0_2) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c2 = arith.constant 2 : index
        scf.for %arg1 = %c0_0 to %c2 step %c1_1 {
          %c1_2 = arith.constant 1 : index
          scf.for %arg2 = %c0_0 to %c1_2 step %c1_1 {
            %0 = aie.objectfifo.acquire @of_4_join_0_0(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            func.call @op3_zero_bf16_64_64_64(%1) : (memref<64x64xbf16>) -> ()
            %c32 = arith.constant 32 : index
            scf.for %arg3 = %c0_0 to %c32 step %c1_1 {
              %2 = aie.objectfifo.acquire @of_3_broadcast_0_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
              %3 = aie.objectfifo.subview.access %2[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
              %4 = aie.objectfifo.acquire @of_2_broadcast_0_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
              %5 = aie.objectfifo.subview.access %4[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
              func.call @op3_matmul_bf16_bf16_64_64_64(%5, %3, %1) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>) -> ()
              aie.objectfifo.release @of_2_broadcast_0_0(Consume, 1)
              aie.objectfifo.release @of_3_broadcast_0_0(Consume, 1)
            }
            aie.objectfifo.release @of_4_join_0_0(Produce, 1)
          }
        }
      }
      aie.end
    } {link_with = "op3_mm_64_64_64.o"}
    %core_0_3 = aie.core(%tile_0_3) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c2 = arith.constant 2 : index
        scf.for %arg1 = %c0_0 to %c2 step %c1_1 {
          %c1_2 = arith.constant 1 : index
          scf.for %arg2 = %c0_0 to %c1_2 step %c1_1 {
            %0 = aie.objectfifo.acquire @of_4_join_0_1(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            func.call @op3_zero_bf16_64_64_64(%1) : (memref<64x64xbf16>) -> ()
            %c32 = arith.constant 32 : index
            scf.for %arg3 = %c0_0 to %c32 step %c1_1 {
              %2 = aie.objectfifo.acquire @of_3_broadcast_0_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
              %3 = aie.objectfifo.subview.access %2[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
              %4 = aie.objectfifo.acquire @of_2_broadcast_1_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
              %5 = aie.objectfifo.subview.access %4[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
              func.call @op3_matmul_bf16_bf16_64_64_64(%5, %3, %1) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>) -> ()
              aie.objectfifo.release @of_2_broadcast_1_0(Consume, 1)
              aie.objectfifo.release @of_3_broadcast_0_0(Consume, 1)
            }
            aie.objectfifo.release @of_4_join_0_1(Produce, 1)
          }
        }
      }
      aie.end
    } {link_with = "op3_mm_64_64_64.o"}
    %core_0_4 = aie.core(%tile_0_4) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c2 = arith.constant 2 : index
        scf.for %arg1 = %c0_0 to %c2 step %c1_1 {
          %c1_2 = arith.constant 1 : index
          scf.for %arg2 = %c0_0 to %c1_2 step %c1_1 {
            %0 = aie.objectfifo.acquire @of_4_join_0_2(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            func.call @op3_zero_bf16_64_64_64(%1) : (memref<64x64xbf16>) -> ()
            %c32 = arith.constant 32 : index
            scf.for %arg3 = %c0_0 to %c32 step %c1_1 {
              %2 = aie.objectfifo.acquire @of_3_broadcast_0_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
              %3 = aie.objectfifo.subview.access %2[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
              %4 = aie.objectfifo.acquire @of_2_broadcast_2_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
              %5 = aie.objectfifo.subview.access %4[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
              func.call @op3_matmul_bf16_bf16_64_64_64(%5, %3, %1) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>) -> ()
              aie.objectfifo.release @of_2_broadcast_2_0(Consume, 1)
              aie.objectfifo.release @of_3_broadcast_0_0(Consume, 1)
            }
            aie.objectfifo.release @of_4_join_0_2(Produce, 1)
          }
        }
      }
      aie.end
    } {link_with = "op3_mm_64_64_64.o"}
    %core_0_5 = aie.core(%tile_0_5) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c2 = arith.constant 2 : index
        scf.for %arg1 = %c0_0 to %c2 step %c1_1 {
          %c1_2 = arith.constant 1 : index
          scf.for %arg2 = %c0_0 to %c1_2 step %c1_1 {
            %0 = aie.objectfifo.acquire @of_4_join_0_3(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            func.call @op3_zero_bf16_64_64_64(%1) : (memref<64x64xbf16>) -> ()
            %c32 = arith.constant 32 : index
            scf.for %arg3 = %c0_0 to %c32 step %c1_1 {
              %2 = aie.objectfifo.acquire @of_3_broadcast_0_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
              %3 = aie.objectfifo.subview.access %2[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
              %4 = aie.objectfifo.acquire @of_2_broadcast_3_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
              %5 = aie.objectfifo.subview.access %4[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
              func.call @op3_matmul_bf16_bf16_64_64_64(%5, %3, %1) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>) -> ()
              aie.objectfifo.release @of_2_broadcast_3_0(Consume, 1)
              aie.objectfifo.release @of_3_broadcast_0_0(Consume, 1)
            }
            aie.objectfifo.release @of_4_join_0_3(Produce, 1)
          }
        }
      }
      aie.end
    } {link_with = "op3_mm_64_64_64.o"}
    %core_1_2 = aie.core(%tile_1_2) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c2 = arith.constant 2 : index
        scf.for %arg1 = %c0_0 to %c2 step %c1_1 {
          %c1_2 = arith.constant 1 : index
          scf.for %arg2 = %c0_0 to %c1_2 step %c1_1 {
            %0 = aie.objectfifo.acquire @of_4_join_1_0(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            func.call @op3_zero_bf16_64_64_64(%1) : (memref<64x64xbf16>) -> ()
            %c32 = arith.constant 32 : index
            scf.for %arg3 = %c0_0 to %c32 step %c1_1 {
              %2 = aie.objectfifo.acquire @of_3_broadcast_1_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
              %3 = aie.objectfifo.subview.access %2[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
              %4 = aie.objectfifo.acquire @of_2_broadcast_0_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
              %5 = aie.objectfifo.subview.access %4[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
              func.call @op3_matmul_bf16_bf16_64_64_64(%5, %3, %1) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>) -> ()
              aie.objectfifo.release @of_2_broadcast_0_0(Consume, 1)
              aie.objectfifo.release @of_3_broadcast_1_0(Consume, 1)
            }
            aie.objectfifo.release @of_4_join_1_0(Produce, 1)
          }
        }
      }
      aie.end
    } {link_with = "op3_mm_64_64_64.o"}
    %core_1_3 = aie.core(%tile_1_3) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c2 = arith.constant 2 : index
        scf.for %arg1 = %c0_0 to %c2 step %c1_1 {
          %c1_2 = arith.constant 1 : index
          scf.for %arg2 = %c0_0 to %c1_2 step %c1_1 {
            %0 = aie.objectfifo.acquire @of_4_join_1_1(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            func.call @op3_zero_bf16_64_64_64(%1) : (memref<64x64xbf16>) -> ()
            %c32 = arith.constant 32 : index
            scf.for %arg3 = %c0_0 to %c32 step %c1_1 {
              %2 = aie.objectfifo.acquire @of_3_broadcast_1_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
              %3 = aie.objectfifo.subview.access %2[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
              %4 = aie.objectfifo.acquire @of_2_broadcast_1_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
              %5 = aie.objectfifo.subview.access %4[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
              func.call @op3_matmul_bf16_bf16_64_64_64(%5, %3, %1) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>) -> ()
              aie.objectfifo.release @of_2_broadcast_1_0(Consume, 1)
              aie.objectfifo.release @of_3_broadcast_1_0(Consume, 1)
            }
            aie.objectfifo.release @of_4_join_1_1(Produce, 1)
          }
        }
      }
      aie.end
    } {link_with = "op3_mm_64_64_64.o"}
    %core_1_4 = aie.core(%tile_1_4) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c2 = arith.constant 2 : index
        scf.for %arg1 = %c0_0 to %c2 step %c1_1 {
          %c1_2 = arith.constant 1 : index
          scf.for %arg2 = %c0_0 to %c1_2 step %c1_1 {
            %0 = aie.objectfifo.acquire @of_4_join_1_2(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            func.call @op3_zero_bf16_64_64_64(%1) : (memref<64x64xbf16>) -> ()
            %c32 = arith.constant 32 : index
            scf.for %arg3 = %c0_0 to %c32 step %c1_1 {
              %2 = aie.objectfifo.acquire @of_3_broadcast_1_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
              %3 = aie.objectfifo.subview.access %2[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
              %4 = aie.objectfifo.acquire @of_2_broadcast_2_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
              %5 = aie.objectfifo.subview.access %4[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
              func.call @op3_matmul_bf16_bf16_64_64_64(%5, %3, %1) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>) -> ()
              aie.objectfifo.release @of_2_broadcast_2_0(Consume, 1)
              aie.objectfifo.release @of_3_broadcast_1_0(Consume, 1)
            }
            aie.objectfifo.release @of_4_join_1_2(Produce, 1)
          }
        }
      }
      aie.end
    } {link_with = "op3_mm_64_64_64.o"}
    %core_1_5 = aie.core(%tile_1_5) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c2 = arith.constant 2 : index
        scf.for %arg1 = %c0_0 to %c2 step %c1_1 {
          %c1_2 = arith.constant 1 : index
          scf.for %arg2 = %c0_0 to %c1_2 step %c1_1 {
            %0 = aie.objectfifo.acquire @of_4_join_1_3(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            func.call @op3_zero_bf16_64_64_64(%1) : (memref<64x64xbf16>) -> ()
            %c32 = arith.constant 32 : index
            scf.for %arg3 = %c0_0 to %c32 step %c1_1 {
              %2 = aie.objectfifo.acquire @of_3_broadcast_1_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
              %3 = aie.objectfifo.subview.access %2[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
              %4 = aie.objectfifo.acquire @of_2_broadcast_3_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
              %5 = aie.objectfifo.subview.access %4[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
              func.call @op3_matmul_bf16_bf16_64_64_64(%5, %3, %1) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>) -> ()
              aie.objectfifo.release @of_2_broadcast_3_0(Consume, 1)
              aie.objectfifo.release @of_3_broadcast_1_0(Consume, 1)
            }
            aie.objectfifo.release @of_4_join_1_3(Produce, 1)
          }
        }
      }
      aie.end
    } {link_with = "op3_mm_64_64_64.o"}
    %core_2_2 = aie.core(%tile_2_2) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c2 = arith.constant 2 : index
        scf.for %arg1 = %c0_0 to %c2 step %c1_1 {
          %c1_2 = arith.constant 1 : index
          scf.for %arg2 = %c0_0 to %c1_2 step %c1_1 {
            %0 = aie.objectfifo.acquire @of_4_join_2_0(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            func.call @op3_zero_bf16_64_64_64(%1) : (memref<64x64xbf16>) -> ()
            %c32 = arith.constant 32 : index
            scf.for %arg3 = %c0_0 to %c32 step %c1_1 {
              %2 = aie.objectfifo.acquire @of_3_broadcast_2_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
              %3 = aie.objectfifo.subview.access %2[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
              %4 = aie.objectfifo.acquire @of_2_broadcast_0_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
              %5 = aie.objectfifo.subview.access %4[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
              func.call @op3_matmul_bf16_bf16_64_64_64(%5, %3, %1) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>) -> ()
              aie.objectfifo.release @of_2_broadcast_0_0(Consume, 1)
              aie.objectfifo.release @of_3_broadcast_2_0(Consume, 1)
            }
            aie.objectfifo.release @of_4_join_2_0(Produce, 1)
          }
        }
      }
      aie.end
    } {link_with = "op3_mm_64_64_64.o"}
    %core_2_3 = aie.core(%tile_2_3) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c2 = arith.constant 2 : index
        scf.for %arg1 = %c0_0 to %c2 step %c1_1 {
          %c1_2 = arith.constant 1 : index
          scf.for %arg2 = %c0_0 to %c1_2 step %c1_1 {
            %0 = aie.objectfifo.acquire @of_4_join_2_1(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            func.call @op3_zero_bf16_64_64_64(%1) : (memref<64x64xbf16>) -> ()
            %c32 = arith.constant 32 : index
            scf.for %arg3 = %c0_0 to %c32 step %c1_1 {
              %2 = aie.objectfifo.acquire @of_3_broadcast_2_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
              %3 = aie.objectfifo.subview.access %2[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
              %4 = aie.objectfifo.acquire @of_2_broadcast_1_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
              %5 = aie.objectfifo.subview.access %4[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
              func.call @op3_matmul_bf16_bf16_64_64_64(%5, %3, %1) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>) -> ()
              aie.objectfifo.release @of_2_broadcast_1_0(Consume, 1)
              aie.objectfifo.release @of_3_broadcast_2_0(Consume, 1)
            }
            aie.objectfifo.release @of_4_join_2_1(Produce, 1)
          }
        }
      }
      aie.end
    } {link_with = "op3_mm_64_64_64.o"}
    %core_2_4 = aie.core(%tile_2_4) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c2 = arith.constant 2 : index
        scf.for %arg1 = %c0_0 to %c2 step %c1_1 {
          %c1_2 = arith.constant 1 : index
          scf.for %arg2 = %c0_0 to %c1_2 step %c1_1 {
            %0 = aie.objectfifo.acquire @of_4_join_2_2(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            func.call @op3_zero_bf16_64_64_64(%1) : (memref<64x64xbf16>) -> ()
            %c32 = arith.constant 32 : index
            scf.for %arg3 = %c0_0 to %c32 step %c1_1 {
              %2 = aie.objectfifo.acquire @of_3_broadcast_2_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
              %3 = aie.objectfifo.subview.access %2[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
              %4 = aie.objectfifo.acquire @of_2_broadcast_2_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
              %5 = aie.objectfifo.subview.access %4[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
              func.call @op3_matmul_bf16_bf16_64_64_64(%5, %3, %1) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>) -> ()
              aie.objectfifo.release @of_2_broadcast_2_0(Consume, 1)
              aie.objectfifo.release @of_3_broadcast_2_0(Consume, 1)
            }
            aie.objectfifo.release @of_4_join_2_2(Produce, 1)
          }
        }
      }
      aie.end
    } {link_with = "op3_mm_64_64_64.o"}
    %core_2_5 = aie.core(%tile_2_5) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c2 = arith.constant 2 : index
        scf.for %arg1 = %c0_0 to %c2 step %c1_1 {
          %c1_2 = arith.constant 1 : index
          scf.for %arg2 = %c0_0 to %c1_2 step %c1_1 {
            %0 = aie.objectfifo.acquire @of_4_join_2_3(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            func.call @op3_zero_bf16_64_64_64(%1) : (memref<64x64xbf16>) -> ()
            %c32 = arith.constant 32 : index
            scf.for %arg3 = %c0_0 to %c32 step %c1_1 {
              %2 = aie.objectfifo.acquire @of_3_broadcast_2_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
              %3 = aie.objectfifo.subview.access %2[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
              %4 = aie.objectfifo.acquire @of_2_broadcast_3_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
              %5 = aie.objectfifo.subview.access %4[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
              func.call @op3_matmul_bf16_bf16_64_64_64(%5, %3, %1) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>) -> ()
              aie.objectfifo.release @of_2_broadcast_3_0(Consume, 1)
              aie.objectfifo.release @of_3_broadcast_2_0(Consume, 1)
            }
            aie.objectfifo.release @of_4_join_2_3(Produce, 1)
          }
        }
      }
      aie.end
    } {link_with = "op3_mm_64_64_64.o"}
    %core_3_2 = aie.core(%tile_3_2) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c2 = arith.constant 2 : index
        scf.for %arg1 = %c0_0 to %c2 step %c1_1 {
          %c1_2 = arith.constant 1 : index
          scf.for %arg2 = %c0_0 to %c1_2 step %c1_1 {
            %0 = aie.objectfifo.acquire @of_4_join_3_0(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            func.call @op3_zero_bf16_64_64_64(%1) : (memref<64x64xbf16>) -> ()
            %c32 = arith.constant 32 : index
            scf.for %arg3 = %c0_0 to %c32 step %c1_1 {
              %2 = aie.objectfifo.acquire @of_3_broadcast_3_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
              %3 = aie.objectfifo.subview.access %2[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
              %4 = aie.objectfifo.acquire @of_2_broadcast_0_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
              %5 = aie.objectfifo.subview.access %4[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
              func.call @op3_matmul_bf16_bf16_64_64_64(%5, %3, %1) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>) -> ()
              aie.objectfifo.release @of_2_broadcast_0_0(Consume, 1)
              aie.objectfifo.release @of_3_broadcast_3_0(Consume, 1)
            }
            aie.objectfifo.release @of_4_join_3_0(Produce, 1)
          }
        }
      }
      aie.end
    } {link_with = "op3_mm_64_64_64.o"}
    %core_3_3 = aie.core(%tile_3_3) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c2 = arith.constant 2 : index
        scf.for %arg1 = %c0_0 to %c2 step %c1_1 {
          %c1_2 = arith.constant 1 : index
          scf.for %arg2 = %c0_0 to %c1_2 step %c1_1 {
            %0 = aie.objectfifo.acquire @of_4_join_3_1(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            func.call @op3_zero_bf16_64_64_64(%1) : (memref<64x64xbf16>) -> ()
            %c32 = arith.constant 32 : index
            scf.for %arg3 = %c0_0 to %c32 step %c1_1 {
              %2 = aie.objectfifo.acquire @of_3_broadcast_3_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
              %3 = aie.objectfifo.subview.access %2[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
              %4 = aie.objectfifo.acquire @of_2_broadcast_1_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
              %5 = aie.objectfifo.subview.access %4[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
              func.call @op3_matmul_bf16_bf16_64_64_64(%5, %3, %1) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>) -> ()
              aie.objectfifo.release @of_2_broadcast_1_0(Consume, 1)
              aie.objectfifo.release @of_3_broadcast_3_0(Consume, 1)
            }
            aie.objectfifo.release @of_4_join_3_1(Produce, 1)
          }
        }
      }
      aie.end
    } {link_with = "op3_mm_64_64_64.o"}
    %core_3_4 = aie.core(%tile_3_4) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c2 = arith.constant 2 : index
        scf.for %arg1 = %c0_0 to %c2 step %c1_1 {
          %c1_2 = arith.constant 1 : index
          scf.for %arg2 = %c0_0 to %c1_2 step %c1_1 {
            %0 = aie.objectfifo.acquire @of_4_join_3_2(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            func.call @op3_zero_bf16_64_64_64(%1) : (memref<64x64xbf16>) -> ()
            %c32 = arith.constant 32 : index
            scf.for %arg3 = %c0_0 to %c32 step %c1_1 {
              %2 = aie.objectfifo.acquire @of_3_broadcast_3_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
              %3 = aie.objectfifo.subview.access %2[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
              %4 = aie.objectfifo.acquire @of_2_broadcast_2_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
              %5 = aie.objectfifo.subview.access %4[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
              func.call @op3_matmul_bf16_bf16_64_64_64(%5, %3, %1) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>) -> ()
              aie.objectfifo.release @of_2_broadcast_2_0(Consume, 1)
              aie.objectfifo.release @of_3_broadcast_3_0(Consume, 1)
            }
            aie.objectfifo.release @of_4_join_3_2(Produce, 1)
          }
        }
      }
      aie.end
    } {link_with = "op3_mm_64_64_64.o"}
    %core_3_5 = aie.core(%tile_3_5) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c2 = arith.constant 2 : index
        scf.for %arg1 = %c0_0 to %c2 step %c1_1 {
          %c1_2 = arith.constant 1 : index
          scf.for %arg2 = %c0_0 to %c1_2 step %c1_1 {
            %0 = aie.objectfifo.acquire @of_4_join_3_3(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            func.call @op3_zero_bf16_64_64_64(%1) : (memref<64x64xbf16>) -> ()
            %c32 = arith.constant 32 : index
            scf.for %arg3 = %c0_0 to %c32 step %c1_1 {
              %2 = aie.objectfifo.acquire @of_3_broadcast_3_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
              %3 = aie.objectfifo.subview.access %2[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
              %4 = aie.objectfifo.acquire @of_2_broadcast_3_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
              %5 = aie.objectfifo.subview.access %4[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
              func.call @op3_matmul_bf16_bf16_64_64_64(%5, %3, %1) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>) -> ()
              aie.objectfifo.release @of_2_broadcast_3_0(Consume, 1)
              aie.objectfifo.release @of_3_broadcast_3_0(Consume, 1)
            }
            aie.objectfifo.release @of_4_join_3_3(Produce, 1)
          }
        }
      }
      aie.end
    } {link_with = "op3_mm_64_64_64.o"}
    %core_4_2 = aie.core(%tile_4_2) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c2 = arith.constant 2 : index
        scf.for %arg1 = %c0_0 to %c2 step %c1_1 {
          %c1_2 = arith.constant 1 : index
          scf.for %arg2 = %c0_0 to %c1_2 step %c1_1 {
            %0 = aie.objectfifo.acquire @of_4_join_4_0(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            func.call @op3_zero_bf16_64_64_64(%1) : (memref<64x64xbf16>) -> ()
            %c32 = arith.constant 32 : index
            scf.for %arg3 = %c0_0 to %c32 step %c1_1 {
              %2 = aie.objectfifo.acquire @of_3_broadcast_4_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
              %3 = aie.objectfifo.subview.access %2[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
              %4 = aie.objectfifo.acquire @of_2_broadcast_0_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
              %5 = aie.objectfifo.subview.access %4[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
              func.call @op3_matmul_bf16_bf16_64_64_64(%5, %3, %1) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>) -> ()
              aie.objectfifo.release @of_2_broadcast_0_0(Consume, 1)
              aie.objectfifo.release @of_3_broadcast_4_0(Consume, 1)
            }
            aie.objectfifo.release @of_4_join_4_0(Produce, 1)
          }
        }
      }
      aie.end
    } {link_with = "op3_mm_64_64_64.o"}
    %core_4_3 = aie.core(%tile_4_3) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c2 = arith.constant 2 : index
        scf.for %arg1 = %c0_0 to %c2 step %c1_1 {
          %c1_2 = arith.constant 1 : index
          scf.for %arg2 = %c0_0 to %c1_2 step %c1_1 {
            %0 = aie.objectfifo.acquire @of_4_join_4_1(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            func.call @op3_zero_bf16_64_64_64(%1) : (memref<64x64xbf16>) -> ()
            %c32 = arith.constant 32 : index
            scf.for %arg3 = %c0_0 to %c32 step %c1_1 {
              %2 = aie.objectfifo.acquire @of_3_broadcast_4_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
              %3 = aie.objectfifo.subview.access %2[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
              %4 = aie.objectfifo.acquire @of_2_broadcast_1_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
              %5 = aie.objectfifo.subview.access %4[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
              func.call @op3_matmul_bf16_bf16_64_64_64(%5, %3, %1) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>) -> ()
              aie.objectfifo.release @of_2_broadcast_1_0(Consume, 1)
              aie.objectfifo.release @of_3_broadcast_4_0(Consume, 1)
            }
            aie.objectfifo.release @of_4_join_4_1(Produce, 1)
          }
        }
      }
      aie.end
    } {link_with = "op3_mm_64_64_64.o"}
    %core_4_4 = aie.core(%tile_4_4) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c2 = arith.constant 2 : index
        scf.for %arg1 = %c0_0 to %c2 step %c1_1 {
          %c1_2 = arith.constant 1 : index
          scf.for %arg2 = %c0_0 to %c1_2 step %c1_1 {
            %0 = aie.objectfifo.acquire @of_4_join_4_2(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            func.call @op3_zero_bf16_64_64_64(%1) : (memref<64x64xbf16>) -> ()
            %c32 = arith.constant 32 : index
            scf.for %arg3 = %c0_0 to %c32 step %c1_1 {
              %2 = aie.objectfifo.acquire @of_3_broadcast_4_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
              %3 = aie.objectfifo.subview.access %2[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
              %4 = aie.objectfifo.acquire @of_2_broadcast_2_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
              %5 = aie.objectfifo.subview.access %4[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
              func.call @op3_matmul_bf16_bf16_64_64_64(%5, %3, %1) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>) -> ()
              aie.objectfifo.release @of_2_broadcast_2_0(Consume, 1)
              aie.objectfifo.release @of_3_broadcast_4_0(Consume, 1)
            }
            aie.objectfifo.release @of_4_join_4_2(Produce, 1)
          }
        }
      }
      aie.end
    } {link_with = "op3_mm_64_64_64.o"}
    %core_4_5 = aie.core(%tile_4_5) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c2 = arith.constant 2 : index
        scf.for %arg1 = %c0_0 to %c2 step %c1_1 {
          %c1_2 = arith.constant 1 : index
          scf.for %arg2 = %c0_0 to %c1_2 step %c1_1 {
            %0 = aie.objectfifo.acquire @of_4_join_4_3(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            func.call @op3_zero_bf16_64_64_64(%1) : (memref<64x64xbf16>) -> ()
            %c32 = arith.constant 32 : index
            scf.for %arg3 = %c0_0 to %c32 step %c1_1 {
              %2 = aie.objectfifo.acquire @of_3_broadcast_4_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
              %3 = aie.objectfifo.subview.access %2[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
              %4 = aie.objectfifo.acquire @of_2_broadcast_3_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
              %5 = aie.objectfifo.subview.access %4[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
              func.call @op3_matmul_bf16_bf16_64_64_64(%5, %3, %1) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>) -> ()
              aie.objectfifo.release @of_2_broadcast_3_0(Consume, 1)
              aie.objectfifo.release @of_3_broadcast_4_0(Consume, 1)
            }
            aie.objectfifo.release @of_4_join_4_3(Produce, 1)
          }
        }
      }
      aie.end
    } {link_with = "op3_mm_64_64_64.o"}
    %core_5_2 = aie.core(%tile_5_2) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c2 = arith.constant 2 : index
        scf.for %arg1 = %c0_0 to %c2 step %c1_1 {
          %c1_2 = arith.constant 1 : index
          scf.for %arg2 = %c0_0 to %c1_2 step %c1_1 {
            %0 = aie.objectfifo.acquire @of_4_join_5_0(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            func.call @op3_zero_bf16_64_64_64(%1) : (memref<64x64xbf16>) -> ()
            %c32 = arith.constant 32 : index
            scf.for %arg3 = %c0_0 to %c32 step %c1_1 {
              %2 = aie.objectfifo.acquire @of_3_broadcast_5_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
              %3 = aie.objectfifo.subview.access %2[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
              %4 = aie.objectfifo.acquire @of_2_broadcast_0_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
              %5 = aie.objectfifo.subview.access %4[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
              func.call @op3_matmul_bf16_bf16_64_64_64(%5, %3, %1) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>) -> ()
              aie.objectfifo.release @of_2_broadcast_0_0(Consume, 1)
              aie.objectfifo.release @of_3_broadcast_5_0(Consume, 1)
            }
            aie.objectfifo.release @of_4_join_5_0(Produce, 1)
          }
        }
      }
      aie.end
    } {link_with = "op3_mm_64_64_64.o"}
    %core_5_3 = aie.core(%tile_5_3) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c2 = arith.constant 2 : index
        scf.for %arg1 = %c0_0 to %c2 step %c1_1 {
          %c1_2 = arith.constant 1 : index
          scf.for %arg2 = %c0_0 to %c1_2 step %c1_1 {
            %0 = aie.objectfifo.acquire @of_4_join_5_1(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            func.call @op3_zero_bf16_64_64_64(%1) : (memref<64x64xbf16>) -> ()
            %c32 = arith.constant 32 : index
            scf.for %arg3 = %c0_0 to %c32 step %c1_1 {
              %2 = aie.objectfifo.acquire @of_3_broadcast_5_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
              %3 = aie.objectfifo.subview.access %2[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
              %4 = aie.objectfifo.acquire @of_2_broadcast_1_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
              %5 = aie.objectfifo.subview.access %4[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
              func.call @op3_matmul_bf16_bf16_64_64_64(%5, %3, %1) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>) -> ()
              aie.objectfifo.release @of_2_broadcast_1_0(Consume, 1)
              aie.objectfifo.release @of_3_broadcast_5_0(Consume, 1)
            }
            aie.objectfifo.release @of_4_join_5_1(Produce, 1)
          }
        }
      }
      aie.end
    } {link_with = "op3_mm_64_64_64.o"}
    %core_5_4 = aie.core(%tile_5_4) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c2 = arith.constant 2 : index
        scf.for %arg1 = %c0_0 to %c2 step %c1_1 {
          %c1_2 = arith.constant 1 : index
          scf.for %arg2 = %c0_0 to %c1_2 step %c1_1 {
            %0 = aie.objectfifo.acquire @of_4_join_5_2(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            func.call @op3_zero_bf16_64_64_64(%1) : (memref<64x64xbf16>) -> ()
            %c32 = arith.constant 32 : index
            scf.for %arg3 = %c0_0 to %c32 step %c1_1 {
              %2 = aie.objectfifo.acquire @of_3_broadcast_5_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
              %3 = aie.objectfifo.subview.access %2[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
              %4 = aie.objectfifo.acquire @of_2_broadcast_2_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
              %5 = aie.objectfifo.subview.access %4[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
              func.call @op3_matmul_bf16_bf16_64_64_64(%5, %3, %1) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>) -> ()
              aie.objectfifo.release @of_2_broadcast_2_0(Consume, 1)
              aie.objectfifo.release @of_3_broadcast_5_0(Consume, 1)
            }
            aie.objectfifo.release @of_4_join_5_2(Produce, 1)
          }
        }
      }
      aie.end
    } {link_with = "op3_mm_64_64_64.o"}
    %core_5_5 = aie.core(%tile_5_5) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c2 = arith.constant 2 : index
        scf.for %arg1 = %c0_0 to %c2 step %c1_1 {
          %c1_2 = arith.constant 1 : index
          scf.for %arg2 = %c0_0 to %c1_2 step %c1_1 {
            %0 = aie.objectfifo.acquire @of_4_join_5_3(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            func.call @op3_zero_bf16_64_64_64(%1) : (memref<64x64xbf16>) -> ()
            %c32 = arith.constant 32 : index
            scf.for %arg3 = %c0_0 to %c32 step %c1_1 {
              %2 = aie.objectfifo.acquire @of_3_broadcast_5_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
              %3 = aie.objectfifo.subview.access %2[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
              %4 = aie.objectfifo.acquire @of_2_broadcast_3_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
              %5 = aie.objectfifo.subview.access %4[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
              func.call @op3_matmul_bf16_bf16_64_64_64(%5, %3, %1) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>) -> ()
              aie.objectfifo.release @of_2_broadcast_3_0(Consume, 1)
              aie.objectfifo.release @of_3_broadcast_5_0(Consume, 1)
            }
            aie.objectfifo.release @of_4_join_5_3(Produce, 1)
          }
        }
      }
      aie.end
    } {link_with = "op3_mm_64_64_64.o"}
    %core_6_2 = aie.core(%tile_6_2) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c2 = arith.constant 2 : index
        scf.for %arg1 = %c0_0 to %c2 step %c1_1 {
          %c1_2 = arith.constant 1 : index
          scf.for %arg2 = %c0_0 to %c1_2 step %c1_1 {
            %0 = aie.objectfifo.acquire @of_4_join_6_0(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            func.call @op3_zero_bf16_64_64_64(%1) : (memref<64x64xbf16>) -> ()
            %c32 = arith.constant 32 : index
            scf.for %arg3 = %c0_0 to %c32 step %c1_1 {
              %2 = aie.objectfifo.acquire @of_3_broadcast_6_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
              %3 = aie.objectfifo.subview.access %2[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
              %4 = aie.objectfifo.acquire @of_2_broadcast_0_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
              %5 = aie.objectfifo.subview.access %4[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
              func.call @op3_matmul_bf16_bf16_64_64_64(%5, %3, %1) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>) -> ()
              aie.objectfifo.release @of_2_broadcast_0_0(Consume, 1)
              aie.objectfifo.release @of_3_broadcast_6_0(Consume, 1)
            }
            aie.objectfifo.release @of_4_join_6_0(Produce, 1)
          }
        }
      }
      aie.end
    } {link_with = "op3_mm_64_64_64.o"}
    %core_6_3 = aie.core(%tile_6_3) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c2 = arith.constant 2 : index
        scf.for %arg1 = %c0_0 to %c2 step %c1_1 {
          %c1_2 = arith.constant 1 : index
          scf.for %arg2 = %c0_0 to %c1_2 step %c1_1 {
            %0 = aie.objectfifo.acquire @of_4_join_6_1(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            func.call @op3_zero_bf16_64_64_64(%1) : (memref<64x64xbf16>) -> ()
            %c32 = arith.constant 32 : index
            scf.for %arg3 = %c0_0 to %c32 step %c1_1 {
              %2 = aie.objectfifo.acquire @of_3_broadcast_6_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
              %3 = aie.objectfifo.subview.access %2[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
              %4 = aie.objectfifo.acquire @of_2_broadcast_1_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
              %5 = aie.objectfifo.subview.access %4[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
              func.call @op3_matmul_bf16_bf16_64_64_64(%5, %3, %1) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>) -> ()
              aie.objectfifo.release @of_2_broadcast_1_0(Consume, 1)
              aie.objectfifo.release @of_3_broadcast_6_0(Consume, 1)
            }
            aie.objectfifo.release @of_4_join_6_1(Produce, 1)
          }
        }
      }
      aie.end
    } {link_with = "op3_mm_64_64_64.o"}
    %core_6_4 = aie.core(%tile_6_4) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c2 = arith.constant 2 : index
        scf.for %arg1 = %c0_0 to %c2 step %c1_1 {
          %c1_2 = arith.constant 1 : index
          scf.for %arg2 = %c0_0 to %c1_2 step %c1_1 {
            %0 = aie.objectfifo.acquire @of_4_join_6_2(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            func.call @op3_zero_bf16_64_64_64(%1) : (memref<64x64xbf16>) -> ()
            %c32 = arith.constant 32 : index
            scf.for %arg3 = %c0_0 to %c32 step %c1_1 {
              %2 = aie.objectfifo.acquire @of_3_broadcast_6_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
              %3 = aie.objectfifo.subview.access %2[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
              %4 = aie.objectfifo.acquire @of_2_broadcast_2_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
              %5 = aie.objectfifo.subview.access %4[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
              func.call @op3_matmul_bf16_bf16_64_64_64(%5, %3, %1) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>) -> ()
              aie.objectfifo.release @of_2_broadcast_2_0(Consume, 1)
              aie.objectfifo.release @of_3_broadcast_6_0(Consume, 1)
            }
            aie.objectfifo.release @of_4_join_6_2(Produce, 1)
          }
        }
      }
      aie.end
    } {link_with = "op3_mm_64_64_64.o"}
    %core_6_5 = aie.core(%tile_6_5) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c2 = arith.constant 2 : index
        scf.for %arg1 = %c0_0 to %c2 step %c1_1 {
          %c1_2 = arith.constant 1 : index
          scf.for %arg2 = %c0_0 to %c1_2 step %c1_1 {
            %0 = aie.objectfifo.acquire @of_4_join_6_3(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            func.call @op3_zero_bf16_64_64_64(%1) : (memref<64x64xbf16>) -> ()
            %c32 = arith.constant 32 : index
            scf.for %arg3 = %c0_0 to %c32 step %c1_1 {
              %2 = aie.objectfifo.acquire @of_3_broadcast_6_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
              %3 = aie.objectfifo.subview.access %2[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
              %4 = aie.objectfifo.acquire @of_2_broadcast_3_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
              %5 = aie.objectfifo.subview.access %4[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
              func.call @op3_matmul_bf16_bf16_64_64_64(%5, %3, %1) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>) -> ()
              aie.objectfifo.release @of_2_broadcast_3_0(Consume, 1)
              aie.objectfifo.release @of_3_broadcast_6_0(Consume, 1)
            }
            aie.objectfifo.release @of_4_join_6_3(Produce, 1)
          }
        }
      }
      aie.end
    } {link_with = "op3_mm_64_64_64.o"}
    %core_7_2 = aie.core(%tile_7_2) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c2 = arith.constant 2 : index
        scf.for %arg1 = %c0_0 to %c2 step %c1_1 {
          %c1_2 = arith.constant 1 : index
          scf.for %arg2 = %c0_0 to %c1_2 step %c1_1 {
            %0 = aie.objectfifo.acquire @of_4_join_7_0(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            func.call @op3_zero_bf16_64_64_64(%1) : (memref<64x64xbf16>) -> ()
            %c32 = arith.constant 32 : index
            scf.for %arg3 = %c0_0 to %c32 step %c1_1 {
              %2 = aie.objectfifo.acquire @of_3_broadcast_7_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
              %3 = aie.objectfifo.subview.access %2[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
              %4 = aie.objectfifo.acquire @of_2_broadcast_0_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
              %5 = aie.objectfifo.subview.access %4[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
              func.call @op3_matmul_bf16_bf16_64_64_64(%5, %3, %1) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>) -> ()
              aie.objectfifo.release @of_2_broadcast_0_0(Consume, 1)
              aie.objectfifo.release @of_3_broadcast_7_0(Consume, 1)
            }
            aie.objectfifo.release @of_4_join_7_0(Produce, 1)
          }
        }
      }
      aie.end
    } {link_with = "op3_mm_64_64_64.o"}
    %core_7_3 = aie.core(%tile_7_3) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c2 = arith.constant 2 : index
        scf.for %arg1 = %c0_0 to %c2 step %c1_1 {
          %c1_2 = arith.constant 1 : index
          scf.for %arg2 = %c0_0 to %c1_2 step %c1_1 {
            %0 = aie.objectfifo.acquire @of_4_join_7_1(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            func.call @op3_zero_bf16_64_64_64(%1) : (memref<64x64xbf16>) -> ()
            %c32 = arith.constant 32 : index
            scf.for %arg3 = %c0_0 to %c32 step %c1_1 {
              %2 = aie.objectfifo.acquire @of_3_broadcast_7_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
              %3 = aie.objectfifo.subview.access %2[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
              %4 = aie.objectfifo.acquire @of_2_broadcast_1_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
              %5 = aie.objectfifo.subview.access %4[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
              func.call @op3_matmul_bf16_bf16_64_64_64(%5, %3, %1) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>) -> ()
              aie.objectfifo.release @of_2_broadcast_1_0(Consume, 1)
              aie.objectfifo.release @of_3_broadcast_7_0(Consume, 1)
            }
            aie.objectfifo.release @of_4_join_7_1(Produce, 1)
          }
        }
      }
      aie.end
    } {link_with = "op3_mm_64_64_64.o"}
    %core_7_4 = aie.core(%tile_7_4) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c2 = arith.constant 2 : index
        scf.for %arg1 = %c0_0 to %c2 step %c1_1 {
          %c1_2 = arith.constant 1 : index
          scf.for %arg2 = %c0_0 to %c1_2 step %c1_1 {
            %0 = aie.objectfifo.acquire @of_4_join_7_2(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            func.call @op3_zero_bf16_64_64_64(%1) : (memref<64x64xbf16>) -> ()
            %c32 = arith.constant 32 : index
            scf.for %arg3 = %c0_0 to %c32 step %c1_1 {
              %2 = aie.objectfifo.acquire @of_3_broadcast_7_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
              %3 = aie.objectfifo.subview.access %2[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
              %4 = aie.objectfifo.acquire @of_2_broadcast_2_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
              %5 = aie.objectfifo.subview.access %4[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
              func.call @op3_matmul_bf16_bf16_64_64_64(%5, %3, %1) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>) -> ()
              aie.objectfifo.release @of_2_broadcast_2_0(Consume, 1)
              aie.objectfifo.release @of_3_broadcast_7_0(Consume, 1)
            }
            aie.objectfifo.release @of_4_join_7_2(Produce, 1)
          }
        }
      }
      aie.end
    } {link_with = "op3_mm_64_64_64.o"}
    %core_7_5 = aie.core(%tile_7_5) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c2 = arith.constant 2 : index
        scf.for %arg1 = %c0_0 to %c2 step %c1_1 {
          %c1_2 = arith.constant 1 : index
          scf.for %arg2 = %c0_0 to %c1_2 step %c1_1 {
            %0 = aie.objectfifo.acquire @of_4_join_7_3(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            func.call @op3_zero_bf16_64_64_64(%1) : (memref<64x64xbf16>) -> ()
            %c32 = arith.constant 32 : index
            scf.for %arg3 = %c0_0 to %c32 step %c1_1 {
              %2 = aie.objectfifo.acquire @of_3_broadcast_7_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
              %3 = aie.objectfifo.subview.access %2[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
              %4 = aie.objectfifo.acquire @of_2_broadcast_3_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
              %5 = aie.objectfifo.subview.access %4[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
              func.call @op3_matmul_bf16_bf16_64_64_64(%5, %3, %1) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>) -> ()
              aie.objectfifo.release @of_2_broadcast_3_0(Consume, 1)
              aie.objectfifo.release @of_3_broadcast_7_0(Consume, 1)
            }
            aie.objectfifo.release @of_4_join_7_3(Produce, 1)
          }
        }
      }
      aie.end
    } {link_with = "op3_mm_64_64_64.o"}
    aie.objectfifo @of_0_mem_0(%shim_noc_tile_0_0, {%mem_tile_0_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_0_mem_1(%shim_noc_tile_1_0, {%mem_tile_1_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_0_mem_2(%shim_noc_tile_2_0, {%mem_tile_2_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_0_mem_3(%shim_noc_tile_3_0, {%mem_tile_3_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_1_mem_0(%shim_noc_tile_0_0, {%mem_tile_0_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_1_mem_1(%shim_noc_tile_1_0, {%mem_tile_1_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_1_mem_2(%shim_noc_tile_2_0, {%mem_tile_2_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_1_mem_3(%shim_noc_tile_3_0, {%mem_tile_3_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_1_mem_4(%shim_noc_tile_4_0, {%mem_tile_4_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_1_mem_5(%shim_noc_tile_5_0, {%mem_tile_5_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_1_mem_6(%shim_noc_tile_6_0, {%mem_tile_6_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_1_mem_7(%shim_noc_tile_7_0, {%mem_tile_7_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_2_broadcast_0_0(%mem_tile_0_1 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%tile_0_2, %tile_1_2, %tile_2_2, %tile_3_2, %tile_4_2, %tile_5_2, %tile_6_2, %tile_7_2}, [4 : i32, 2 : i32, 2 : i32, 2 : i32, 2 : i32, 2 : i32, 2 : i32, 2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo.link [@of_0_mem_0] -> [@of_2_broadcast_0_0]([] [])
    aie.objectfifo @of_2_broadcast_1_0(%mem_tile_1_1 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%tile_0_3, %tile_1_3, %tile_2_3, %tile_3_3, %tile_4_3, %tile_5_3, %tile_6_3, %tile_7_3}, [4 : i32, 2 : i32, 2 : i32, 2 : i32, 2 : i32, 2 : i32, 2 : i32, 2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo.link [@of_0_mem_1] -> [@of_2_broadcast_1_0]([] [])
    aie.objectfifo @of_2_broadcast_2_0(%mem_tile_2_1 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%tile_0_4, %tile_1_4, %tile_2_4, %tile_3_4, %tile_4_4, %tile_5_4, %tile_6_4, %tile_7_4}, [4 : i32, 2 : i32, 2 : i32, 2 : i32, 2 : i32, 2 : i32, 2 : i32, 2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo.link [@of_0_mem_2] -> [@of_2_broadcast_2_0]([] [])
    aie.objectfifo @of_2_broadcast_3_0(%mem_tile_3_1 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%tile_0_5, %tile_1_5, %tile_2_5, %tile_3_5, %tile_4_5, %tile_5_5, %tile_6_5, %tile_7_5}, [4 : i32, 2 : i32, 2 : i32, 2 : i32, 2 : i32, 2 : i32, 2 : i32, 2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo.link [@of_0_mem_3] -> [@of_2_broadcast_3_0]([] [])
    aie.objectfifo @of_3_broadcast_0_0(%mem_tile_0_1 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%tile_0_2, %tile_0_3, %tile_0_4, %tile_0_5}, [4 : i32, 2 : i32, 2 : i32, 2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo.link [@of_1_mem_0] -> [@of_3_broadcast_0_0]([] [])
    aie.objectfifo @of_3_broadcast_1_0(%mem_tile_1_1 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%tile_1_2, %tile_1_3, %tile_1_4, %tile_1_5}, [4 : i32, 2 : i32, 2 : i32, 2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo.link [@of_1_mem_1] -> [@of_3_broadcast_1_0]([] [])
    aie.objectfifo @of_3_broadcast_2_0(%mem_tile_2_1 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%tile_2_2, %tile_2_3, %tile_2_4, %tile_2_5}, [4 : i32, 2 : i32, 2 : i32, 2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo.link [@of_1_mem_2] -> [@of_3_broadcast_2_0]([] [])
    aie.objectfifo @of_3_broadcast_3_0(%mem_tile_3_1 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%tile_3_2, %tile_3_3, %tile_3_4, %tile_3_5}, [4 : i32, 2 : i32, 2 : i32, 2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo.link [@of_1_mem_3] -> [@of_3_broadcast_3_0]([] [])
    aie.objectfifo @of_3_broadcast_4_0(%mem_tile_4_1 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%tile_4_2, %tile_4_3, %tile_4_4, %tile_4_5}, [4 : i32, 2 : i32, 2 : i32, 2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo.link [@of_1_mem_4] -> [@of_3_broadcast_4_0]([] [])
    aie.objectfifo @of_3_broadcast_5_0(%mem_tile_5_1 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%tile_5_2, %tile_5_3, %tile_5_4, %tile_5_5}, [4 : i32, 2 : i32, 2 : i32, 2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo.link [@of_1_mem_5] -> [@of_3_broadcast_5_0]([] [])
    aie.objectfifo @of_3_broadcast_6_0(%mem_tile_6_1 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%tile_6_2, %tile_6_3, %tile_6_4, %tile_6_5}, [4 : i32, 2 : i32, 2 : i32, 2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo.link [@of_1_mem_6] -> [@of_3_broadcast_6_0]([] [])
    aie.objectfifo @of_3_broadcast_7_0(%mem_tile_7_1 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%tile_7_2, %tile_7_3, %tile_7_4, %tile_7_5}, [4 : i32, 2 : i32, 2 : i32, 2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo.link [@of_1_mem_7] -> [@of_3_broadcast_7_0]([] [])
    aie.objectfifo @of_4_join_0_0(%tile_0_2, {%mem_tile_0_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_4_join_0_1(%tile_0_3, {%mem_tile_0_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_4_join_0_2(%tile_0_4, {%mem_tile_0_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_4_join_0_3(%tile_0_5, {%mem_tile_0_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_4_join_1_0(%tile_1_2, {%mem_tile_1_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_4_join_1_1(%tile_1_3, {%mem_tile_1_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_4_join_1_2(%tile_1_4, {%mem_tile_1_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_4_join_1_3(%tile_1_5, {%mem_tile_1_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_4_join_2_0(%tile_2_2, {%mem_tile_2_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_4_join_2_1(%tile_2_3, {%mem_tile_2_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_4_join_2_2(%tile_2_4, {%mem_tile_2_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_4_join_2_3(%tile_2_5, {%mem_tile_2_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_4_join_3_0(%tile_3_2, {%mem_tile_3_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_4_join_3_1(%tile_3_3, {%mem_tile_3_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_4_join_3_2(%tile_3_4, {%mem_tile_3_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_4_join_3_3(%tile_3_5, {%mem_tile_3_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_4_join_4_0(%tile_4_2, {%mem_tile_4_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_4_join_4_1(%tile_4_3, {%mem_tile_4_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_4_join_4_2(%tile_4_4, {%mem_tile_4_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_4_join_4_3(%tile_4_5, {%mem_tile_4_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_4_join_5_0(%tile_5_2, {%mem_tile_5_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_4_join_5_1(%tile_5_3, {%mem_tile_5_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_4_join_5_2(%tile_5_4, {%mem_tile_5_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_4_join_5_3(%tile_5_5, {%mem_tile_5_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_4_join_6_0(%tile_6_2, {%mem_tile_6_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_4_join_6_1(%tile_6_3, {%mem_tile_6_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_4_join_6_2(%tile_6_4, {%mem_tile_6_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_4_join_6_3(%tile_6_5, {%mem_tile_6_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_4_join_7_0(%tile_7_2, {%mem_tile_7_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_4_join_7_1(%tile_7_3, {%mem_tile_7_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_4_join_7_2(%tile_7_4, {%mem_tile_7_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_4_join_7_3(%tile_7_5, {%mem_tile_7_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_5_mem_0(%mem_tile_0_1 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%shim_noc_tile_0_0}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<1x4x64x64xbf16>>  
    aie.objectfifo.link [@of_4_join_0_0, @of_4_join_0_1, @of_4_join_0_2, @of_4_join_0_3] -> [@of_5_mem_0]([0, 4096, 8192, 12288] [])
    aie.objectfifo @of_5_mem_1(%mem_tile_1_1 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%shim_noc_tile_1_0}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<1x4x64x64xbf16>>  
    aie.objectfifo.link [@of_4_join_1_0, @of_4_join_1_1, @of_4_join_1_2, @of_4_join_1_3] -> [@of_5_mem_1]([0, 4096, 8192, 12288] [])
    aie.objectfifo @of_5_mem_2(%mem_tile_2_1 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%shim_noc_tile_2_0}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<1x4x64x64xbf16>>  
    aie.objectfifo.link [@of_4_join_2_0, @of_4_join_2_1, @of_4_join_2_2, @of_4_join_2_3] -> [@of_5_mem_2]([0, 4096, 8192, 12288] [])
    aie.objectfifo @of_5_mem_3(%mem_tile_3_1 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%shim_noc_tile_3_0}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<1x4x64x64xbf16>>  
    aie.objectfifo.link [@of_4_join_3_0, @of_4_join_3_1, @of_4_join_3_2, @of_4_join_3_3] -> [@of_5_mem_3]([0, 4096, 8192, 12288] [])
    aie.objectfifo @of_5_mem_4(%mem_tile_4_1 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%shim_noc_tile_4_0}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<1x4x64x64xbf16>>  
    aie.objectfifo.link [@of_4_join_4_0, @of_4_join_4_1, @of_4_join_4_2, @of_4_join_4_3] -> [@of_5_mem_4]([0, 4096, 8192, 12288] [])
    aie.objectfifo @of_5_mem_5(%mem_tile_5_1 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%shim_noc_tile_5_0}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<1x4x64x64xbf16>>  
    aie.objectfifo.link [@of_4_join_5_0, @of_4_join_5_1, @of_4_join_5_2, @of_4_join_5_3] -> [@of_5_mem_5]([0, 4096, 8192, 12288] [])
    aie.objectfifo @of_5_mem_6(%mem_tile_6_1 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%shim_noc_tile_6_0}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<1x4x64x64xbf16>>  
    aie.objectfifo.link [@of_4_join_6_0, @of_4_join_6_1, @of_4_join_6_2, @of_4_join_6_3] -> [@of_5_mem_6]([0, 4096, 8192, 12288] [])
    aie.objectfifo @of_5_mem_7(%mem_tile_7_1 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%shim_noc_tile_7_0}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<1x4x64x64xbf16>>  
    aie.objectfifo.link [@of_4_join_7_0, @of_4_join_7_1, @of_4_join_7_2, @of_4_join_7_3] -> [@of_5_mem_7]([0, 4096, 8192, 12288] [])
    func.func private @op3_zero_bf16_64_64_64(memref<64x64xbf16>)
    func.func private @op3_matmul_bf16_bf16_64_64_64(memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>)
  }
  aie.device(npu2) {
    aie.runtime_sequence(%arg0: memref<3407872xbf16>, %arg1: memref<262144xbf16>, %arg2: memref<4194304xbf16>) {
      aiex.configure @op0__SwiGLUStreamGroup {
        %subview = memref.subview %arg0[0] [262144] [1] : memref<3407872xbf16> to memref<262144xbf16>
        %reinterpret_cast = memref.reinterpret_cast %subview to offset: [0], sizes: [512, 512], strides: [512, 1] : memref<262144xbf16> to memref<512x512xbf16>
        %subview_0 = memref.subview %arg0[262144] [1048576] [1] : memref<3407872xbf16> to memref<1048576xbf16, strided<[1], offset: 262144>>
        %reinterpret_cast_1 = memref.reinterpret_cast %subview_0 to offset: [0], sizes: [512, 2048], strides: [2048, 1] : memref<1048576xbf16, strided<[1], offset: 262144>> to memref<512x2048xbf16>
        %subview_2 = memref.subview %arg2[0] [1048576] [1] : memref<4194304xbf16> to memref<1048576xbf16>
        %reinterpret_cast_3 = memref.reinterpret_cast %subview_2 to offset: [0], sizes: [512, 2048], strides: [2048, 1] : memref<1048576xbf16> to memref<512x2048xbf16>
        aiex.run @sequence(%reinterpret_cast, %reinterpret_cast_1, %reinterpret_cast_3) : (memref<512x512xbf16>, memref<512x2048xbf16>, memref<512x2048xbf16>)
        %subview_4 = memref.subview %arg0[0] [262144] [1] : memref<3407872xbf16> to memref<262144xbf16>
        %reinterpret_cast_5 = memref.reinterpret_cast %subview_4 to offset: [0], sizes: [512, 512], strides: [512, 1] : memref<262144xbf16> to memref<512x512xbf16>
        %subview_6 = memref.subview %arg0[1310720] [1048576] [1] : memref<3407872xbf16> to memref<1048576xbf16, strided<[1], offset: 1310720>>
        %reinterpret_cast_7 = memref.reinterpret_cast %subview_6 to offset: [0], sizes: [512, 2048], strides: [2048, 1] : memref<1048576xbf16, strided<[1], offset: 1310720>> to memref<512x2048xbf16>
        %subview_8 = memref.subview %arg2[1048576] [1048576] [1] : memref<4194304xbf16> to memref<1048576xbf16, strided<[1], offset: 1048576>>
        %reinterpret_cast_9 = memref.reinterpret_cast %subview_8 to offset: [0], sizes: [512, 2048], strides: [2048, 1] : memref<1048576xbf16, strided<[1], offset: 1048576>> to memref<512x2048xbf16>
        aiex.run @sequence(%reinterpret_cast_5, %reinterpret_cast_7, %reinterpret_cast_9) : (memref<512x512xbf16>, memref<512x2048xbf16>, memref<512x2048xbf16>)
      }
      aiex.configure @op1__SwiGLUStreamGroup {
        %subview = memref.subview %arg2[0] [1048576] [1] : memref<4194304xbf16> to memref<1048576xbf16>
        %reinterpret_cast = memref.reinterpret_cast %subview to offset: [0], sizes: [512, 2048], strides: [2048, 1] : memref<1048576xbf16> to memref<512x2048xbf16>
        %subview_0 = memref.subview %arg2[2097152] [1048576] [1] : memref<4194304xbf16> to memref<1048576xbf16, strided<[1], offset: 2097152>>
        %reinterpret_cast_1 = memref.reinterpret_cast %subview_0 to offset: [0], sizes: [512, 2048], strides: [2048, 1] : memref<1048576xbf16, strided<[1], offset: 2097152>> to memref<512x2048xbf16>
        aiex.run @sequence(%reinterpret_cast, %reinterpret_cast_1) : (memref<512x2048xbf16>, memref<512x2048xbf16>)
      }
      aiex.configure @op2__SwiGLUStreamGroup {
        %subview = memref.subview %arg2[2097152] [1048576] [1] : memref<4194304xbf16> to memref<1048576xbf16, strided<[1], offset: 2097152>>
        %reinterpret_cast = memref.reinterpret_cast %subview to offset: [0], sizes: [512, 2048], strides: [2048, 1] : memref<1048576xbf16, strided<[1], offset: 2097152>> to memref<512x2048xbf16>
        %subview_0 = memref.subview %arg2[1048576] [1048576] [1] : memref<4194304xbf16> to memref<1048576xbf16, strided<[1], offset: 1048576>>
        %reinterpret_cast_1 = memref.reinterpret_cast %subview_0 to offset: [0], sizes: [512, 2048], strides: [2048, 1] : memref<1048576xbf16, strided<[1], offset: 1048576>> to memref<512x2048xbf16>
        %subview_2 = memref.subview %arg2[3145728] [1048576] [1] : memref<4194304xbf16> to memref<1048576xbf16, strided<[1], offset: 3145728>>
        %reinterpret_cast_3 = memref.reinterpret_cast %subview_2 to offset: [0], sizes: [512, 2048], strides: [2048, 1] : memref<1048576xbf16, strided<[1], offset: 3145728>> to memref<512x2048xbf16>
        aiex.run @sequence(%reinterpret_cast, %reinterpret_cast_1, %reinterpret_cast_3) : (memref<512x2048xbf16>, memref<512x2048xbf16>, memref<512x2048xbf16>)
      }
      aiex.configure @op3__SwiGLUStreamGroup {
        %subview = memref.subview %arg2[3145728] [1048576] [1] : memref<4194304xbf16> to memref<1048576xbf16, strided<[1], offset: 3145728>>
        %reinterpret_cast = memref.reinterpret_cast %subview to offset: [0], sizes: [512, 2048], strides: [2048, 1] : memref<1048576xbf16, strided<[1], offset: 3145728>> to memref<512x2048xbf16>
        %subview_0 = memref.subview %arg0[2359296] [1048576] [1] : memref<3407872xbf16> to memref<1048576xbf16, strided<[1], offset: 2359296>>
        %reinterpret_cast_1 = memref.reinterpret_cast %subview_0 to offset: [0], sizes: [2048, 512], strides: [512, 1] : memref<1048576xbf16, strided<[1], offset: 2359296>> to memref<2048x512xbf16>
        %subview_2 = memref.subview %arg1[0] [262144] [1] : memref<262144xbf16> to memref<262144xbf16>
        %reinterpret_cast_3 = memref.reinterpret_cast %subview_2 to offset: [0], sizes: [512, 512], strides: [512, 1] : memref<262144xbf16> to memref<512x512xbf16>
        aiex.run @sequence(%reinterpret_cast, %reinterpret_cast_1, %reinterpret_cast_3) : (memref<512x2048xbf16>, memref<2048x512xbf16>, memref<512x512xbf16>)
      }
    }
  }
}
