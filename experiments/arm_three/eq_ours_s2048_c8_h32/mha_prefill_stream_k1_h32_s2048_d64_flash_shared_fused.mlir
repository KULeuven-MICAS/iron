module {
  aie.device(npu2) @op0__MHAStreamGroup {
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
    %tile_0_4 = aie.tile(0, 4)
    %tile_1_4 = aie.tile(1, 4)
    %tile_2_4 = aie.tile(2, 4)
    %tile_3_4 = aie.tile(3, 4)
    %tile_4_4 = aie.tile(4, 4)
    %tile_5_4 = aie.tile(5, 4)
    %tile_6_4 = aie.tile(6, 4)
    %tile_7_4 = aie.tile(7, 4)
    %tile_0_3 = aie.tile(0, 3)
    %tile_1_3 = aie.tile(1, 3)
    %tile_2_3 = aie.tile(2, 3)
    %tile_3_3 = aie.tile(3, 3)
    %tile_4_3 = aie.tile(4, 3)
    %tile_5_3 = aie.tile(5, 3)
    %tile_6_3 = aie.tile(6, 3)
    %tile_7_3 = aie.tile(7, 3)
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
        aie.dma_bd(%arg1 : memref<64x2048xbf16> offset = 0 len = 131072 sizes = [4, 32, 64, 64] strides = [0, 64, 2048, 1])
        aie.end
      } {issue_token = true, iteration_t = 0 : index, repeat_count = 3 : i32}
      aiex.dma_start_task(%8)
      %9 = aiex.dma_configure_task_for @of_2_mem {
        aie.dma_bd(%arg2 : memref<2048x64xbf16> offset = 0 len = 131072 sizes = [4, 1, 256, 512] strides = [0, 0, 512, 1])
        aie.end
      } {issue_token = true, iteration_t = 0 : index, repeat_count = 3 : i32}
      aiex.dma_start_task(%9)
      %10 = aiex.dma_configure_task_for @of_11_mem_0 {
        aie.dma_bd(%arg3 : memref<2048x64xbf16> offset = 0 len = 16384 sizes = [1, 4, 64, 64] strides = [0, 32768, 64, 1])
        aie.end
      } {issue_token = true, iteration_t = 0 : index}
      aiex.dma_start_task(%10)
      %11 = aiex.dma_configure_task_for @of_11_mem_1 {
        aie.dma_bd(%arg3 : memref<2048x64xbf16> offset = 4096 len = 16384 sizes = [1, 4, 64, 64] strides = [0, 32768, 64, 1])
        aie.end
      } {issue_token = true, iteration_t = 0 : index}
      aiex.dma_start_task(%11)
      %12 = aiex.dma_configure_task_for @of_11_mem_2 {
        aie.dma_bd(%arg3 : memref<2048x64xbf16> offset = 8192 len = 16384 sizes = [1, 4, 64, 64] strides = [0, 32768, 64, 1])
        aie.end
      } {issue_token = true, iteration_t = 0 : index}
      aiex.dma_start_task(%12)
      %13 = aiex.dma_configure_task_for @of_11_mem_3 {
        aie.dma_bd(%arg3 : memref<2048x64xbf16> offset = 12288 len = 16384 sizes = [1, 4, 64, 64] strides = [0, 32768, 64, 1])
        aie.end
      } {issue_token = true, iteration_t = 0 : index}
      aiex.dma_start_task(%13)
      %14 = aiex.dma_configure_task_for @of_11_mem_4 {
        aie.dma_bd(%arg3 : memref<2048x64xbf16> offset = 16384 len = 16384 sizes = [1, 4, 64, 64] strides = [0, 32768, 64, 1])
        aie.end
      } {issue_token = true, iteration_t = 0 : index}
      aiex.dma_start_task(%14)
      %15 = aiex.dma_configure_task_for @of_11_mem_5 {
        aie.dma_bd(%arg3 : memref<2048x64xbf16> offset = 20480 len = 16384 sizes = [1, 4, 64, 64] strides = [0, 32768, 64, 1])
        aie.end
      } {issue_token = true, iteration_t = 0 : index}
      aiex.dma_start_task(%15)
      %16 = aiex.dma_configure_task_for @of_11_mem_6 {
        aie.dma_bd(%arg3 : memref<2048x64xbf16> offset = 24576 len = 16384 sizes = [1, 4, 64, 64] strides = [0, 32768, 64, 1])
        aie.end
      } {issue_token = true, iteration_t = 0 : index}
      aiex.dma_start_task(%16)
      %17 = aiex.dma_configure_task_for @of_11_mem_7 {
        aie.dma_bd(%arg3 : memref<2048x64xbf16> offset = 28672 len = 16384 sizes = [1, 4, 64, 64] strides = [0, 32768, 64, 1])
        aie.end
      } {issue_token = true, iteration_t = 0 : index}
      aiex.dma_start_task(%17)
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
    }
    %core_0_2 = aie.core(%tile_0_2) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c4 = arith.constant 4 : index
        scf.for %arg1 = %c0_0 to %c4 step %c1_1 {
          %0 = aie.objectfifo.acquire @of_3_unicast_0_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
          %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
          %c32 = arith.constant 32 : index
          scf.for %arg2 = %c0_0 to %c32 step %c1_1 {
            %2 = aie.objectfifo.acquire @of_6_unicast_0(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %3 = aie.objectfifo.subview.access %2[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            func.call @op0_zero_bf16_64_64_64(%3) : (memref<64x64xbf16>) -> ()
            %4 = aie.objectfifo.acquire @of_4_broadcast_0_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %5 = aie.objectfifo.subview.access %4[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            %6 = arith.index_cast %arg2 : index to i32
            %c1_i32 = arith.constant 1 : i32
            %7 = arith.muli %6, %c1_i32 : i32
            %c0_i32 = arith.constant 0 : i32
            %8 = arith.addi %c0_i32, %7 : i32
            %9 = arith.index_cast %arg1 : index to i32
            %c8_i32 = arith.constant 8 : i32
            %10 = arith.muli %9, %c8_i32 : i32
            %c0_i32_2 = arith.constant 0 : i32
            %11 = arith.addi %c0_i32_2, %10 : i32
            %12 = arith.cmpi sle, %8, %11 : i32
            scf.if %12 {
              func.call @op0_matmul_bf16_bf16_64_64_64(%1, %5, %3) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>) -> ()
            }
            aie.objectfifo.release @of_4_broadcast_0_0(Consume, 1)
            aie.objectfifo.release @of_6_unicast_0(Produce, 1)
          }
          aie.objectfifo.release @of_3_unicast_0_0(Consume, 1)
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
        %c4 = arith.constant 4 : index
        scf.for %arg1 = %c0_0 to %c4 step %c1_1 {
          %0 = aie.objectfifo.acquire @of_3_unicast_1_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
          %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
          %c32 = arith.constant 32 : index
          scf.for %arg2 = %c0_0 to %c32 step %c1_1 {
            %2 = aie.objectfifo.acquire @of_6_unicast_1(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %3 = aie.objectfifo.subview.access %2[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            func.call @op0_zero_bf16_64_64_64(%3) : (memref<64x64xbf16>) -> ()
            %4 = aie.objectfifo.acquire @of_4_broadcast_0_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %5 = aie.objectfifo.subview.access %4[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            %6 = arith.index_cast %arg2 : index to i32
            %c1_i32 = arith.constant 1 : i32
            %7 = arith.muli %6, %c1_i32 : i32
            %c0_i32 = arith.constant 0 : i32
            %8 = arith.addi %c0_i32, %7 : i32
            %9 = arith.index_cast %arg1 : index to i32
            %c8_i32 = arith.constant 8 : i32
            %10 = arith.muli %9, %c8_i32 : i32
            %c1_i32_2 = arith.constant 1 : i32
            %11 = arith.addi %c1_i32_2, %10 : i32
            %12 = arith.cmpi sle, %8, %11 : i32
            scf.if %12 {
              func.call @op0_matmul_bf16_bf16_64_64_64(%1, %5, %3) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>) -> ()
            }
            aie.objectfifo.release @of_4_broadcast_0_0(Consume, 1)
            aie.objectfifo.release @of_6_unicast_1(Produce, 1)
          }
          aie.objectfifo.release @of_3_unicast_1_0(Consume, 1)
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
        %c4 = arith.constant 4 : index
        scf.for %arg1 = %c0_0 to %c4 step %c1_1 {
          %0 = aie.objectfifo.acquire @of_3_unicast_2_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
          %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
          %c32 = arith.constant 32 : index
          scf.for %arg2 = %c0_0 to %c32 step %c1_1 {
            %2 = aie.objectfifo.acquire @of_6_unicast_2(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %3 = aie.objectfifo.subview.access %2[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            func.call @op0_zero_bf16_64_64_64(%3) : (memref<64x64xbf16>) -> ()
            %4 = aie.objectfifo.acquire @of_4_broadcast_0_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %5 = aie.objectfifo.subview.access %4[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            %6 = arith.index_cast %arg2 : index to i32
            %c1_i32 = arith.constant 1 : i32
            %7 = arith.muli %6, %c1_i32 : i32
            %c0_i32 = arith.constant 0 : i32
            %8 = arith.addi %c0_i32, %7 : i32
            %9 = arith.index_cast %arg1 : index to i32
            %c8_i32 = arith.constant 8 : i32
            %10 = arith.muli %9, %c8_i32 : i32
            %c2_i32 = arith.constant 2 : i32
            %11 = arith.addi %c2_i32, %10 : i32
            %12 = arith.cmpi sle, %8, %11 : i32
            scf.if %12 {
              func.call @op0_matmul_bf16_bf16_64_64_64(%1, %5, %3) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>) -> ()
            }
            aie.objectfifo.release @of_4_broadcast_0_0(Consume, 1)
            aie.objectfifo.release @of_6_unicast_2(Produce, 1)
          }
          aie.objectfifo.release @of_3_unicast_2_0(Consume, 1)
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
        %c4 = arith.constant 4 : index
        scf.for %arg1 = %c0_0 to %c4 step %c1_1 {
          %0 = aie.objectfifo.acquire @of_3_unicast_3_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
          %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
          %c32 = arith.constant 32 : index
          scf.for %arg2 = %c0_0 to %c32 step %c1_1 {
            %2 = aie.objectfifo.acquire @of_6_unicast_3(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %3 = aie.objectfifo.subview.access %2[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            func.call @op0_zero_bf16_64_64_64(%3) : (memref<64x64xbf16>) -> ()
            %4 = aie.objectfifo.acquire @of_4_broadcast_0_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %5 = aie.objectfifo.subview.access %4[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            %6 = arith.index_cast %arg2 : index to i32
            %c1_i32 = arith.constant 1 : i32
            %7 = arith.muli %6, %c1_i32 : i32
            %c0_i32 = arith.constant 0 : i32
            %8 = arith.addi %c0_i32, %7 : i32
            %9 = arith.index_cast %arg1 : index to i32
            %c8_i32 = arith.constant 8 : i32
            %10 = arith.muli %9, %c8_i32 : i32
            %c3_i32 = arith.constant 3 : i32
            %11 = arith.addi %c3_i32, %10 : i32
            %12 = arith.cmpi sle, %8, %11 : i32
            scf.if %12 {
              func.call @op0_matmul_bf16_bf16_64_64_64(%1, %5, %3) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>) -> ()
            }
            aie.objectfifo.release @of_4_broadcast_0_0(Consume, 1)
            aie.objectfifo.release @of_6_unicast_3(Produce, 1)
          }
          aie.objectfifo.release @of_3_unicast_3_0(Consume, 1)
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
        %c4 = arith.constant 4 : index
        scf.for %arg1 = %c0_0 to %c4 step %c1_1 {
          %0 = aie.objectfifo.acquire @of_3_unicast_4_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
          %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
          %c32 = arith.constant 32 : index
          scf.for %arg2 = %c0_0 to %c32 step %c1_1 {
            %2 = aie.objectfifo.acquire @of_6_unicast_4(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %3 = aie.objectfifo.subview.access %2[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            func.call @op0_zero_bf16_64_64_64(%3) : (memref<64x64xbf16>) -> ()
            %4 = aie.objectfifo.acquire @of_4_broadcast_0_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %5 = aie.objectfifo.subview.access %4[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            %6 = arith.index_cast %arg2 : index to i32
            %c1_i32 = arith.constant 1 : i32
            %7 = arith.muli %6, %c1_i32 : i32
            %c0_i32 = arith.constant 0 : i32
            %8 = arith.addi %c0_i32, %7 : i32
            %9 = arith.index_cast %arg1 : index to i32
            %c8_i32 = arith.constant 8 : i32
            %10 = arith.muli %9, %c8_i32 : i32
            %c4_i32 = arith.constant 4 : i32
            %11 = arith.addi %c4_i32, %10 : i32
            %12 = arith.cmpi sle, %8, %11 : i32
            scf.if %12 {
              func.call @op0_matmul_bf16_bf16_64_64_64(%1, %5, %3) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>) -> ()
            }
            aie.objectfifo.release @of_4_broadcast_0_0(Consume, 1)
            aie.objectfifo.release @of_6_unicast_4(Produce, 1)
          }
          aie.objectfifo.release @of_3_unicast_4_0(Consume, 1)
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
        %c4 = arith.constant 4 : index
        scf.for %arg1 = %c0_0 to %c4 step %c1_1 {
          %0 = aie.objectfifo.acquire @of_3_unicast_5_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
          %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
          %c32 = arith.constant 32 : index
          scf.for %arg2 = %c0_0 to %c32 step %c1_1 {
            %2 = aie.objectfifo.acquire @of_6_unicast_5(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %3 = aie.objectfifo.subview.access %2[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            func.call @op0_zero_bf16_64_64_64(%3) : (memref<64x64xbf16>) -> ()
            %4 = aie.objectfifo.acquire @of_4_broadcast_0_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %5 = aie.objectfifo.subview.access %4[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            %6 = arith.index_cast %arg2 : index to i32
            %c1_i32 = arith.constant 1 : i32
            %7 = arith.muli %6, %c1_i32 : i32
            %c0_i32 = arith.constant 0 : i32
            %8 = arith.addi %c0_i32, %7 : i32
            %9 = arith.index_cast %arg1 : index to i32
            %c8_i32 = arith.constant 8 : i32
            %10 = arith.muli %9, %c8_i32 : i32
            %c5_i32 = arith.constant 5 : i32
            %11 = arith.addi %c5_i32, %10 : i32
            %12 = arith.cmpi sle, %8, %11 : i32
            scf.if %12 {
              func.call @op0_matmul_bf16_bf16_64_64_64(%1, %5, %3) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>) -> ()
            }
            aie.objectfifo.release @of_4_broadcast_0_0(Consume, 1)
            aie.objectfifo.release @of_6_unicast_5(Produce, 1)
          }
          aie.objectfifo.release @of_3_unicast_5_0(Consume, 1)
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
        %c4 = arith.constant 4 : index
        scf.for %arg1 = %c0_0 to %c4 step %c1_1 {
          %0 = aie.objectfifo.acquire @of_3_unicast_6_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
          %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
          %c32 = arith.constant 32 : index
          scf.for %arg2 = %c0_0 to %c32 step %c1_1 {
            %2 = aie.objectfifo.acquire @of_6_unicast_6(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %3 = aie.objectfifo.subview.access %2[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            func.call @op0_zero_bf16_64_64_64(%3) : (memref<64x64xbf16>) -> ()
            %4 = aie.objectfifo.acquire @of_4_broadcast_0_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %5 = aie.objectfifo.subview.access %4[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            %6 = arith.index_cast %arg2 : index to i32
            %c1_i32 = arith.constant 1 : i32
            %7 = arith.muli %6, %c1_i32 : i32
            %c0_i32 = arith.constant 0 : i32
            %8 = arith.addi %c0_i32, %7 : i32
            %9 = arith.index_cast %arg1 : index to i32
            %c8_i32 = arith.constant 8 : i32
            %10 = arith.muli %9, %c8_i32 : i32
            %c6_i32 = arith.constant 6 : i32
            %11 = arith.addi %c6_i32, %10 : i32
            %12 = arith.cmpi sle, %8, %11 : i32
            scf.if %12 {
              func.call @op0_matmul_bf16_bf16_64_64_64(%1, %5, %3) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>) -> ()
            }
            aie.objectfifo.release @of_4_broadcast_0_0(Consume, 1)
            aie.objectfifo.release @of_6_unicast_6(Produce, 1)
          }
          aie.objectfifo.release @of_3_unicast_6_0(Consume, 1)
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
        %c4 = arith.constant 4 : index
        scf.for %arg1 = %c0_0 to %c4 step %c1_1 {
          %0 = aie.objectfifo.acquire @of_3_unicast_7_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
          %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
          %c32 = arith.constant 32 : index
          scf.for %arg2 = %c0_0 to %c32 step %c1_1 {
            %2 = aie.objectfifo.acquire @of_6_unicast_7(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %3 = aie.objectfifo.subview.access %2[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            func.call @op0_zero_bf16_64_64_64(%3) : (memref<64x64xbf16>) -> ()
            %4 = aie.objectfifo.acquire @of_4_broadcast_0_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %5 = aie.objectfifo.subview.access %4[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            %6 = arith.index_cast %arg2 : index to i32
            %c1_i32 = arith.constant 1 : i32
            %7 = arith.muli %6, %c1_i32 : i32
            %c0_i32 = arith.constant 0 : i32
            %8 = arith.addi %c0_i32, %7 : i32
            %9 = arith.index_cast %arg1 : index to i32
            %c8_i32 = arith.constant 8 : i32
            %10 = arith.muli %9, %c8_i32 : i32
            %c7_i32 = arith.constant 7 : i32
            %11 = arith.addi %c7_i32, %10 : i32
            %12 = arith.cmpi sle, %8, %11 : i32
            scf.if %12 {
              func.call @op0_matmul_bf16_bf16_64_64_64(%1, %5, %3) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>) -> ()
            }
            aie.objectfifo.release @of_4_broadcast_0_0(Consume, 1)
            aie.objectfifo.release @of_6_unicast_7(Produce, 1)
          }
          aie.objectfifo.release @of_3_unicast_7_0(Consume, 1)
        }
      }
      aie.end
    } {link_with = "op0_mm_64_64_64.o"}
    %flash_index_0_4 = aie.buffer(%tile_0_4) {sym_name = "flash_index_0_4"} : memref<2xi32> 
    %core_0_4 = aie.core(%tile_0_4) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c4 = arith.constant 4 : index
        scf.for %arg1 = %c0_0 to %c4 step %c1_1 {
          %0 = aie.objectfifo.acquire @of_10_unicast_0(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
          %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
          func.call @op0_zero_bf16(%1) : (memref<64x64xbf16>) -> ()
          %c32 = arith.constant 32 : index
          scf.for %arg2 = %c0_0 to %c32 step %c1_1 {
            %2 = aie.objectfifo.acquire @of_9_unicast_0_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %3 = aie.objectfifo.subview.access %2[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            %4 = aie.objectfifo.acquire @of_5_broadcast_0_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %5 = aie.objectfifo.subview.access %4[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            %6 = arith.index_cast %arg2 : index to i32
            %c1_i32 = arith.constant 1 : i32
            %7 = arith.muli %6, %c1_i32 : i32
            %c0_i32 = arith.constant 0 : i32
            %8 = arith.addi %c0_i32, %7 : i32
            %9 = arith.index_cast %arg1 : index to i32
            %c8_i32 = arith.constant 8 : i32
            %10 = arith.muli %9, %c8_i32 : i32
            %c0_i32_2 = arith.constant 0 : i32
            %11 = arith.addi %c0_i32_2, %10 : i32
            %c0_3 = arith.constant 0 : index
            %c1_4 = arith.constant 1 : index
            memref.store %8, %flash_index_0_4[%c0_3] : memref<2xi32>
            memref.store %11, %flash_index_0_4[%c1_4] : memref<2xi32>
            %12 = aie.objectfifo.acquire @flash_scale_0_3(Consume, 1) : !aie.objectfifosubview<memref<256xbf16>>
            %13 = aie.objectfifo.subview.access %12[0] : !aie.objectfifosubview<memref<256xbf16>> -> memref<256xbf16>
            %c64_i32 = arith.constant 64 : i32
            %c0_i32_5 = arith.constant 0 : i32
            %14 = arith.cmpi ne, %8, %c0_i32_5 : i32
            %15 = arith.extui %14 : i1 to i32
            func.call @op0_matmul_PV(%3, %5, %1, %13, %c64_i32, %15, %flash_index_0_4) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>, memref<256xbf16>, i32, i32, memref<2xi32>) -> ()
            %c31_i32 = arith.constant 31 : i32
            %16 = arith.cmpi eq, %8, %c31_i32 : i32
            scf.if %16 {
              func.call @op0_rescale_O(%1, %13, %c64_i32, %flash_index_0_4) : (memref<64x64xbf16>, memref<256xbf16>, i32, memref<2xi32>) -> ()
            }
            aie.objectfifo.release @flash_scale_0_3(Consume, 1)
            aie.objectfifo.release @of_5_broadcast_0_0(Consume, 1)
            aie.objectfifo.release @of_9_unicast_0_0(Consume, 1)
          }
          aie.objectfifo.release @of_10_unicast_0(Produce, 1)
        }
      }
      aie.end
    } {link_with = "op0_mha.o"}
    %flash_index_1_4 = aie.buffer(%tile_1_4) {sym_name = "flash_index_1_4"} : memref<2xi32> 
    %core_1_4 = aie.core(%tile_1_4) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c4 = arith.constant 4 : index
        scf.for %arg1 = %c0_0 to %c4 step %c1_1 {
          %0 = aie.objectfifo.acquire @of_10_unicast_1(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
          %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
          func.call @op0_zero_bf16(%1) : (memref<64x64xbf16>) -> ()
          %c32 = arith.constant 32 : index
          scf.for %arg2 = %c0_0 to %c32 step %c1_1 {
            %2 = aie.objectfifo.acquire @of_9_unicast_1_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %3 = aie.objectfifo.subview.access %2[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            %4 = aie.objectfifo.acquire @of_5_broadcast_0_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %5 = aie.objectfifo.subview.access %4[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            %6 = arith.index_cast %arg2 : index to i32
            %c1_i32 = arith.constant 1 : i32
            %7 = arith.muli %6, %c1_i32 : i32
            %c0_i32 = arith.constant 0 : i32
            %8 = arith.addi %c0_i32, %7 : i32
            %9 = arith.index_cast %arg1 : index to i32
            %c8_i32 = arith.constant 8 : i32
            %10 = arith.muli %9, %c8_i32 : i32
            %c1_i32_2 = arith.constant 1 : i32
            %11 = arith.addi %c1_i32_2, %10 : i32
            %c0_3 = arith.constant 0 : index
            %c1_4 = arith.constant 1 : index
            memref.store %8, %flash_index_1_4[%c0_3] : memref<2xi32>
            memref.store %11, %flash_index_1_4[%c1_4] : memref<2xi32>
            %12 = aie.objectfifo.acquire @flash_scale_1_3(Consume, 1) : !aie.objectfifosubview<memref<256xbf16>>
            %13 = aie.objectfifo.subview.access %12[0] : !aie.objectfifosubview<memref<256xbf16>> -> memref<256xbf16>
            %c64_i32 = arith.constant 64 : i32
            %c0_i32_5 = arith.constant 0 : i32
            %14 = arith.cmpi ne, %8, %c0_i32_5 : i32
            %15 = arith.extui %14 : i1 to i32
            func.call @op0_matmul_PV(%3, %5, %1, %13, %c64_i32, %15, %flash_index_1_4) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>, memref<256xbf16>, i32, i32, memref<2xi32>) -> ()
            %c31_i32 = arith.constant 31 : i32
            %16 = arith.cmpi eq, %8, %c31_i32 : i32
            scf.if %16 {
              func.call @op0_rescale_O(%1, %13, %c64_i32, %flash_index_1_4) : (memref<64x64xbf16>, memref<256xbf16>, i32, memref<2xi32>) -> ()
            }
            aie.objectfifo.release @flash_scale_1_3(Consume, 1)
            aie.objectfifo.release @of_5_broadcast_0_0(Consume, 1)
            aie.objectfifo.release @of_9_unicast_1_0(Consume, 1)
          }
          aie.objectfifo.release @of_10_unicast_1(Produce, 1)
        }
      }
      aie.end
    } {link_with = "op0_mha.o"}
    %flash_index_2_4 = aie.buffer(%tile_2_4) {sym_name = "flash_index_2_4"} : memref<2xi32> 
    %core_2_4 = aie.core(%tile_2_4) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c4 = arith.constant 4 : index
        scf.for %arg1 = %c0_0 to %c4 step %c1_1 {
          %0 = aie.objectfifo.acquire @of_10_unicast_2(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
          %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
          func.call @op0_zero_bf16(%1) : (memref<64x64xbf16>) -> ()
          %c32 = arith.constant 32 : index
          scf.for %arg2 = %c0_0 to %c32 step %c1_1 {
            %2 = aie.objectfifo.acquire @of_9_unicast_2_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %3 = aie.objectfifo.subview.access %2[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            %4 = aie.objectfifo.acquire @of_5_broadcast_0_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %5 = aie.objectfifo.subview.access %4[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            %6 = arith.index_cast %arg2 : index to i32
            %c1_i32 = arith.constant 1 : i32
            %7 = arith.muli %6, %c1_i32 : i32
            %c0_i32 = arith.constant 0 : i32
            %8 = arith.addi %c0_i32, %7 : i32
            %9 = arith.index_cast %arg1 : index to i32
            %c8_i32 = arith.constant 8 : i32
            %10 = arith.muli %9, %c8_i32 : i32
            %c2_i32 = arith.constant 2 : i32
            %11 = arith.addi %c2_i32, %10 : i32
            %c0_2 = arith.constant 0 : index
            %c1_3 = arith.constant 1 : index
            memref.store %8, %flash_index_2_4[%c0_2] : memref<2xi32>
            memref.store %11, %flash_index_2_4[%c1_3] : memref<2xi32>
            %12 = aie.objectfifo.acquire @flash_scale_2_3(Consume, 1) : !aie.objectfifosubview<memref<256xbf16>>
            %13 = aie.objectfifo.subview.access %12[0] : !aie.objectfifosubview<memref<256xbf16>> -> memref<256xbf16>
            %c64_i32 = arith.constant 64 : i32
            %c0_i32_4 = arith.constant 0 : i32
            %14 = arith.cmpi ne, %8, %c0_i32_4 : i32
            %15 = arith.extui %14 : i1 to i32
            func.call @op0_matmul_PV(%3, %5, %1, %13, %c64_i32, %15, %flash_index_2_4) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>, memref<256xbf16>, i32, i32, memref<2xi32>) -> ()
            %c31_i32 = arith.constant 31 : i32
            %16 = arith.cmpi eq, %8, %c31_i32 : i32
            scf.if %16 {
              func.call @op0_rescale_O(%1, %13, %c64_i32, %flash_index_2_4) : (memref<64x64xbf16>, memref<256xbf16>, i32, memref<2xi32>) -> ()
            }
            aie.objectfifo.release @flash_scale_2_3(Consume, 1)
            aie.objectfifo.release @of_5_broadcast_0_0(Consume, 1)
            aie.objectfifo.release @of_9_unicast_2_0(Consume, 1)
          }
          aie.objectfifo.release @of_10_unicast_2(Produce, 1)
        }
      }
      aie.end
    } {link_with = "op0_mha.o"}
    %flash_index_3_4 = aie.buffer(%tile_3_4) {sym_name = "flash_index_3_4"} : memref<2xi32> 
    %core_3_4 = aie.core(%tile_3_4) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c4 = arith.constant 4 : index
        scf.for %arg1 = %c0_0 to %c4 step %c1_1 {
          %0 = aie.objectfifo.acquire @of_10_unicast_3(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
          %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
          func.call @op0_zero_bf16(%1) : (memref<64x64xbf16>) -> ()
          %c32 = arith.constant 32 : index
          scf.for %arg2 = %c0_0 to %c32 step %c1_1 {
            %2 = aie.objectfifo.acquire @of_9_unicast_3_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %3 = aie.objectfifo.subview.access %2[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            %4 = aie.objectfifo.acquire @of_5_broadcast_0_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %5 = aie.objectfifo.subview.access %4[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            %6 = arith.index_cast %arg2 : index to i32
            %c1_i32 = arith.constant 1 : i32
            %7 = arith.muli %6, %c1_i32 : i32
            %c0_i32 = arith.constant 0 : i32
            %8 = arith.addi %c0_i32, %7 : i32
            %9 = arith.index_cast %arg1 : index to i32
            %c8_i32 = arith.constant 8 : i32
            %10 = arith.muli %9, %c8_i32 : i32
            %c3_i32 = arith.constant 3 : i32
            %11 = arith.addi %c3_i32, %10 : i32
            %c0_2 = arith.constant 0 : index
            %c1_3 = arith.constant 1 : index
            memref.store %8, %flash_index_3_4[%c0_2] : memref<2xi32>
            memref.store %11, %flash_index_3_4[%c1_3] : memref<2xi32>
            %12 = aie.objectfifo.acquire @flash_scale_3_3(Consume, 1) : !aie.objectfifosubview<memref<256xbf16>>
            %13 = aie.objectfifo.subview.access %12[0] : !aie.objectfifosubview<memref<256xbf16>> -> memref<256xbf16>
            %c64_i32 = arith.constant 64 : i32
            %c0_i32_4 = arith.constant 0 : i32
            %14 = arith.cmpi ne, %8, %c0_i32_4 : i32
            %15 = arith.extui %14 : i1 to i32
            func.call @op0_matmul_PV(%3, %5, %1, %13, %c64_i32, %15, %flash_index_3_4) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>, memref<256xbf16>, i32, i32, memref<2xi32>) -> ()
            %c31_i32 = arith.constant 31 : i32
            %16 = arith.cmpi eq, %8, %c31_i32 : i32
            scf.if %16 {
              func.call @op0_rescale_O(%1, %13, %c64_i32, %flash_index_3_4) : (memref<64x64xbf16>, memref<256xbf16>, i32, memref<2xi32>) -> ()
            }
            aie.objectfifo.release @flash_scale_3_3(Consume, 1)
            aie.objectfifo.release @of_5_broadcast_0_0(Consume, 1)
            aie.objectfifo.release @of_9_unicast_3_0(Consume, 1)
          }
          aie.objectfifo.release @of_10_unicast_3(Produce, 1)
        }
      }
      aie.end
    } {link_with = "op0_mha.o"}
    %flash_index_4_4 = aie.buffer(%tile_4_4) {sym_name = "flash_index_4_4"} : memref<2xi32> 
    %core_4_4 = aie.core(%tile_4_4) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c4 = arith.constant 4 : index
        scf.for %arg1 = %c0_0 to %c4 step %c1_1 {
          %0 = aie.objectfifo.acquire @of_10_unicast_4(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
          %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
          func.call @op0_zero_bf16(%1) : (memref<64x64xbf16>) -> ()
          %c32 = arith.constant 32 : index
          scf.for %arg2 = %c0_0 to %c32 step %c1_1 {
            %2 = aie.objectfifo.acquire @of_9_unicast_4_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %3 = aie.objectfifo.subview.access %2[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            %4 = aie.objectfifo.acquire @of_5_broadcast_0_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %5 = aie.objectfifo.subview.access %4[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            %6 = arith.index_cast %arg2 : index to i32
            %c1_i32 = arith.constant 1 : i32
            %7 = arith.muli %6, %c1_i32 : i32
            %c0_i32 = arith.constant 0 : i32
            %8 = arith.addi %c0_i32, %7 : i32
            %9 = arith.index_cast %arg1 : index to i32
            %c8_i32 = arith.constant 8 : i32
            %10 = arith.muli %9, %c8_i32 : i32
            %c4_i32 = arith.constant 4 : i32
            %11 = arith.addi %c4_i32, %10 : i32
            %c0_2 = arith.constant 0 : index
            %c1_3 = arith.constant 1 : index
            memref.store %8, %flash_index_4_4[%c0_2] : memref<2xi32>
            memref.store %11, %flash_index_4_4[%c1_3] : memref<2xi32>
            %12 = aie.objectfifo.acquire @flash_scale_4_3(Consume, 1) : !aie.objectfifosubview<memref<256xbf16>>
            %13 = aie.objectfifo.subview.access %12[0] : !aie.objectfifosubview<memref<256xbf16>> -> memref<256xbf16>
            %c64_i32 = arith.constant 64 : i32
            %c0_i32_4 = arith.constant 0 : i32
            %14 = arith.cmpi ne, %8, %c0_i32_4 : i32
            %15 = arith.extui %14 : i1 to i32
            func.call @op0_matmul_PV(%3, %5, %1, %13, %c64_i32, %15, %flash_index_4_4) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>, memref<256xbf16>, i32, i32, memref<2xi32>) -> ()
            %c31_i32 = arith.constant 31 : i32
            %16 = arith.cmpi eq, %8, %c31_i32 : i32
            scf.if %16 {
              func.call @op0_rescale_O(%1, %13, %c64_i32, %flash_index_4_4) : (memref<64x64xbf16>, memref<256xbf16>, i32, memref<2xi32>) -> ()
            }
            aie.objectfifo.release @flash_scale_4_3(Consume, 1)
            aie.objectfifo.release @of_5_broadcast_0_0(Consume, 1)
            aie.objectfifo.release @of_9_unicast_4_0(Consume, 1)
          }
          aie.objectfifo.release @of_10_unicast_4(Produce, 1)
        }
      }
      aie.end
    } {link_with = "op0_mha.o"}
    %flash_index_5_4 = aie.buffer(%tile_5_4) {sym_name = "flash_index_5_4"} : memref<2xi32> 
    %core_5_4 = aie.core(%tile_5_4) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c4 = arith.constant 4 : index
        scf.for %arg1 = %c0_0 to %c4 step %c1_1 {
          %0 = aie.objectfifo.acquire @of_10_unicast_5(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
          %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
          func.call @op0_zero_bf16(%1) : (memref<64x64xbf16>) -> ()
          %c32 = arith.constant 32 : index
          scf.for %arg2 = %c0_0 to %c32 step %c1_1 {
            %2 = aie.objectfifo.acquire @of_9_unicast_5_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %3 = aie.objectfifo.subview.access %2[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            %4 = aie.objectfifo.acquire @of_5_broadcast_0_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %5 = aie.objectfifo.subview.access %4[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            %6 = arith.index_cast %arg2 : index to i32
            %c1_i32 = arith.constant 1 : i32
            %7 = arith.muli %6, %c1_i32 : i32
            %c0_i32 = arith.constant 0 : i32
            %8 = arith.addi %c0_i32, %7 : i32
            %9 = arith.index_cast %arg1 : index to i32
            %c8_i32 = arith.constant 8 : i32
            %10 = arith.muli %9, %c8_i32 : i32
            %c5_i32 = arith.constant 5 : i32
            %11 = arith.addi %c5_i32, %10 : i32
            %c0_2 = arith.constant 0 : index
            %c1_3 = arith.constant 1 : index
            memref.store %8, %flash_index_5_4[%c0_2] : memref<2xi32>
            memref.store %11, %flash_index_5_4[%c1_3] : memref<2xi32>
            %12 = aie.objectfifo.acquire @flash_scale_5_3(Consume, 1) : !aie.objectfifosubview<memref<256xbf16>>
            %13 = aie.objectfifo.subview.access %12[0] : !aie.objectfifosubview<memref<256xbf16>> -> memref<256xbf16>
            %c64_i32 = arith.constant 64 : i32
            %c0_i32_4 = arith.constant 0 : i32
            %14 = arith.cmpi ne, %8, %c0_i32_4 : i32
            %15 = arith.extui %14 : i1 to i32
            func.call @op0_matmul_PV(%3, %5, %1, %13, %c64_i32, %15, %flash_index_5_4) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>, memref<256xbf16>, i32, i32, memref<2xi32>) -> ()
            %c31_i32 = arith.constant 31 : i32
            %16 = arith.cmpi eq, %8, %c31_i32 : i32
            scf.if %16 {
              func.call @op0_rescale_O(%1, %13, %c64_i32, %flash_index_5_4) : (memref<64x64xbf16>, memref<256xbf16>, i32, memref<2xi32>) -> ()
            }
            aie.objectfifo.release @flash_scale_5_3(Consume, 1)
            aie.objectfifo.release @of_5_broadcast_0_0(Consume, 1)
            aie.objectfifo.release @of_9_unicast_5_0(Consume, 1)
          }
          aie.objectfifo.release @of_10_unicast_5(Produce, 1)
        }
      }
      aie.end
    } {link_with = "op0_mha.o"}
    %flash_index_6_4 = aie.buffer(%tile_6_4) {sym_name = "flash_index_6_4"} : memref<2xi32> 
    %core_6_4 = aie.core(%tile_6_4) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c4 = arith.constant 4 : index
        scf.for %arg1 = %c0_0 to %c4 step %c1_1 {
          %0 = aie.objectfifo.acquire @of_10_unicast_6(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
          %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
          func.call @op0_zero_bf16(%1) : (memref<64x64xbf16>) -> ()
          %c32 = arith.constant 32 : index
          scf.for %arg2 = %c0_0 to %c32 step %c1_1 {
            %2 = aie.objectfifo.acquire @of_9_unicast_6_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %3 = aie.objectfifo.subview.access %2[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            %4 = aie.objectfifo.acquire @of_5_broadcast_0_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %5 = aie.objectfifo.subview.access %4[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            %6 = arith.index_cast %arg2 : index to i32
            %c1_i32 = arith.constant 1 : i32
            %7 = arith.muli %6, %c1_i32 : i32
            %c0_i32 = arith.constant 0 : i32
            %8 = arith.addi %c0_i32, %7 : i32
            %9 = arith.index_cast %arg1 : index to i32
            %c8_i32 = arith.constant 8 : i32
            %10 = arith.muli %9, %c8_i32 : i32
            %c6_i32 = arith.constant 6 : i32
            %11 = arith.addi %c6_i32, %10 : i32
            %c0_2 = arith.constant 0 : index
            %c1_3 = arith.constant 1 : index
            memref.store %8, %flash_index_6_4[%c0_2] : memref<2xi32>
            memref.store %11, %flash_index_6_4[%c1_3] : memref<2xi32>
            %12 = aie.objectfifo.acquire @flash_scale_6_3(Consume, 1) : !aie.objectfifosubview<memref<256xbf16>>
            %13 = aie.objectfifo.subview.access %12[0] : !aie.objectfifosubview<memref<256xbf16>> -> memref<256xbf16>
            %c64_i32 = arith.constant 64 : i32
            %c0_i32_4 = arith.constant 0 : i32
            %14 = arith.cmpi ne, %8, %c0_i32_4 : i32
            %15 = arith.extui %14 : i1 to i32
            func.call @op0_matmul_PV(%3, %5, %1, %13, %c64_i32, %15, %flash_index_6_4) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>, memref<256xbf16>, i32, i32, memref<2xi32>) -> ()
            %c31_i32 = arith.constant 31 : i32
            %16 = arith.cmpi eq, %8, %c31_i32 : i32
            scf.if %16 {
              func.call @op0_rescale_O(%1, %13, %c64_i32, %flash_index_6_4) : (memref<64x64xbf16>, memref<256xbf16>, i32, memref<2xi32>) -> ()
            }
            aie.objectfifo.release @flash_scale_6_3(Consume, 1)
            aie.objectfifo.release @of_5_broadcast_0_0(Consume, 1)
            aie.objectfifo.release @of_9_unicast_6_0(Consume, 1)
          }
          aie.objectfifo.release @of_10_unicast_6(Produce, 1)
        }
      }
      aie.end
    } {link_with = "op0_mha.o"}
    %flash_index_7_4 = aie.buffer(%tile_7_4) {sym_name = "flash_index_7_4"} : memref<2xi32> 
    %core_7_4 = aie.core(%tile_7_4) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c4 = arith.constant 4 : index
        scf.for %arg1 = %c0_0 to %c4 step %c1_1 {
          %0 = aie.objectfifo.acquire @of_10_unicast_7(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
          %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
          func.call @op0_zero_bf16(%1) : (memref<64x64xbf16>) -> ()
          %c32 = arith.constant 32 : index
          scf.for %arg2 = %c0_0 to %c32 step %c1_1 {
            %2 = aie.objectfifo.acquire @of_9_unicast_7_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %3 = aie.objectfifo.subview.access %2[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            %4 = aie.objectfifo.acquire @of_5_broadcast_0_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %5 = aie.objectfifo.subview.access %4[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            %6 = arith.index_cast %arg2 : index to i32
            %c1_i32 = arith.constant 1 : i32
            %7 = arith.muli %6, %c1_i32 : i32
            %c0_i32 = arith.constant 0 : i32
            %8 = arith.addi %c0_i32, %7 : i32
            %9 = arith.index_cast %arg1 : index to i32
            %c8_i32 = arith.constant 8 : i32
            %10 = arith.muli %9, %c8_i32 : i32
            %c7_i32 = arith.constant 7 : i32
            %11 = arith.addi %c7_i32, %10 : i32
            %c0_2 = arith.constant 0 : index
            %c1_3 = arith.constant 1 : index
            memref.store %8, %flash_index_7_4[%c0_2] : memref<2xi32>
            memref.store %11, %flash_index_7_4[%c1_3] : memref<2xi32>
            %12 = aie.objectfifo.acquire @flash_scale_7_3(Consume, 1) : !aie.objectfifosubview<memref<256xbf16>>
            %13 = aie.objectfifo.subview.access %12[0] : !aie.objectfifosubview<memref<256xbf16>> -> memref<256xbf16>
            %c64_i32 = arith.constant 64 : i32
            %c0_i32_4 = arith.constant 0 : i32
            %14 = arith.cmpi ne, %8, %c0_i32_4 : i32
            %15 = arith.extui %14 : i1 to i32
            func.call @op0_matmul_PV(%3, %5, %1, %13, %c64_i32, %15, %flash_index_7_4) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>, memref<256xbf16>, i32, i32, memref<2xi32>) -> ()
            %c31_i32 = arith.constant 31 : i32
            %16 = arith.cmpi eq, %8, %c31_i32 : i32
            scf.if %16 {
              func.call @op0_rescale_O(%1, %13, %c64_i32, %flash_index_7_4) : (memref<64x64xbf16>, memref<256xbf16>, i32, memref<2xi32>) -> ()
            }
            aie.objectfifo.release @flash_scale_7_3(Consume, 1)
            aie.objectfifo.release @of_5_broadcast_0_0(Consume, 1)
            aie.objectfifo.release @of_9_unicast_7_0(Consume, 1)
          }
          aie.objectfifo.release @of_10_unicast_7(Produce, 1)
        }
      }
      aie.end
    } {link_with = "op0_mha.o"}
    %flash_state_0_3 = aie.buffer(%tile_0_3) {sym_name = "flash_state_0_3"} : memref<256xbf16> 
    %flash_index_0_3 = aie.buffer(%tile_0_3) {sym_name = "flash_index_0_3"} : memref<2xi32> 
    aie.objectfifo @flash_scale_0_3(%tile_0_3, {%tile_0_4}, 2 : i32) : !aie.objectfifo<memref<256xbf16>>  
    %core_0_3 = aie.core(%tile_0_3) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c4 = arith.constant 4 : index
        scf.for %arg1 = %c0_0 to %c4 step %c1_1 {
          %c32 = arith.constant 32 : index
          scf.for %arg2 = %c0_0 to %c32 step %c1_1 {
            %0 = aie.objectfifo.acquire @of_8_unicast_0(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            %2 = aie.objectfifo.acquire @of_7_unicast_0_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %3 = aie.objectfifo.subview.access %2[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            %4 = arith.index_cast %arg2 : index to i32
            %c1_i32 = arith.constant 1 : i32
            %5 = arith.muli %4, %c1_i32 : i32
            %c0_i32 = arith.constant 0 : i32
            %6 = arith.addi %c0_i32, %5 : i32
            %7 = arith.index_cast %arg1 : index to i32
            %c8_i32 = arith.constant 8 : i32
            %8 = arith.muli %7, %c8_i32 : i32
            %c0_i32_2 = arith.constant 0 : i32
            %9 = arith.addi %c0_i32_2, %8 : i32
            %c0_3 = arith.constant 0 : index
            %c1_4 = arith.constant 1 : index
            memref.store %6, %flash_index_0_3[%c0_3] : memref<2xi32>
            memref.store %9, %flash_index_0_3[%c1_4] : memref<2xi32>
            %c64_i32 = arith.constant 64 : i32
            %c0_i32_5 = arith.constant 0 : i32
            %10 = arith.cmpi eq, %6, %c0_i32_5 : i32
            scf.if %10 {
              func.call @op0_init_scale_buffer(%flash_state_0_3, %c64_i32) : (memref<256xbf16>, i32) -> ()
            }
            %cst = arith.constant 1.4453125 : f32
            %11 = arith.truncf %cst : f32 to bf16
            %c64_i32_6 = arith.constant 64 : i32
            %c2048_i32 = arith.constant 2048 : i32
            %c2048_i32_7 = arith.constant 2048 : i32
            func.call @op0_partial_softmax(%3, %1, %flash_state_0_3, %flash_index_0_3, %11, %c64_i32, %c64_i32_6, %c2048_i32, %c2048_i32_7) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<256xbf16>, memref<2xi32>, bf16, i32, i32, i32, i32) -> ()
            %12 = aie.objectfifo.acquire @flash_scale_0_3(Produce, 1) : !aie.objectfifosubview<memref<256xbf16>>
            %13 = aie.objectfifo.subview.access %12[0] : !aie.objectfifosubview<memref<256xbf16>> -> memref<256xbf16>
            %c256_i32 = arith.constant 256 : i32
            func.call @op0_passThroughLine(%flash_state_0_3, %13, %c256_i32) : (memref<256xbf16>, memref<256xbf16>, i32) -> ()
            aie.objectfifo.release @flash_scale_0_3(Produce, 1)
            aie.objectfifo.release @of_7_unicast_0_0(Consume, 1)
            aie.objectfifo.release @of_8_unicast_0(Produce, 1)
          }
        }
      }
      aie.end
    } {link_with = "op0_mha.o"}
    %flash_state_1_3 = aie.buffer(%tile_1_3) {sym_name = "flash_state_1_3"} : memref<256xbf16> 
    %flash_index_1_3 = aie.buffer(%tile_1_3) {sym_name = "flash_index_1_3"} : memref<2xi32> 
    aie.objectfifo @flash_scale_1_3(%tile_1_3, {%tile_1_4}, 2 : i32) : !aie.objectfifo<memref<256xbf16>>  
    %core_1_3 = aie.core(%tile_1_3) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c4 = arith.constant 4 : index
        scf.for %arg1 = %c0_0 to %c4 step %c1_1 {
          %c32 = arith.constant 32 : index
          scf.for %arg2 = %c0_0 to %c32 step %c1_1 {
            %0 = aie.objectfifo.acquire @of_8_unicast_1(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            %2 = aie.objectfifo.acquire @of_7_unicast_1_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %3 = aie.objectfifo.subview.access %2[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            %4 = arith.index_cast %arg2 : index to i32
            %c1_i32 = arith.constant 1 : i32
            %5 = arith.muli %4, %c1_i32 : i32
            %c0_i32 = arith.constant 0 : i32
            %6 = arith.addi %c0_i32, %5 : i32
            %7 = arith.index_cast %arg1 : index to i32
            %c8_i32 = arith.constant 8 : i32
            %8 = arith.muli %7, %c8_i32 : i32
            %c1_i32_2 = arith.constant 1 : i32
            %9 = arith.addi %c1_i32_2, %8 : i32
            %c0_3 = arith.constant 0 : index
            %c1_4 = arith.constant 1 : index
            memref.store %6, %flash_index_1_3[%c0_3] : memref<2xi32>
            memref.store %9, %flash_index_1_3[%c1_4] : memref<2xi32>
            %c64_i32 = arith.constant 64 : i32
            %c0_i32_5 = arith.constant 0 : i32
            %10 = arith.cmpi eq, %6, %c0_i32_5 : i32
            scf.if %10 {
              func.call @op0_init_scale_buffer(%flash_state_1_3, %c64_i32) : (memref<256xbf16>, i32) -> ()
            }
            %cst = arith.constant 1.4453125 : f32
            %11 = arith.truncf %cst : f32 to bf16
            %c64_i32_6 = arith.constant 64 : i32
            %c2048_i32 = arith.constant 2048 : i32
            %c2048_i32_7 = arith.constant 2048 : i32
            func.call @op0_partial_softmax(%3, %1, %flash_state_1_3, %flash_index_1_3, %11, %c64_i32, %c64_i32_6, %c2048_i32, %c2048_i32_7) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<256xbf16>, memref<2xi32>, bf16, i32, i32, i32, i32) -> ()
            %12 = aie.objectfifo.acquire @flash_scale_1_3(Produce, 1) : !aie.objectfifosubview<memref<256xbf16>>
            %13 = aie.objectfifo.subview.access %12[0] : !aie.objectfifosubview<memref<256xbf16>> -> memref<256xbf16>
            %c256_i32 = arith.constant 256 : i32
            func.call @op0_passThroughLine(%flash_state_1_3, %13, %c256_i32) : (memref<256xbf16>, memref<256xbf16>, i32) -> ()
            aie.objectfifo.release @flash_scale_1_3(Produce, 1)
            aie.objectfifo.release @of_7_unicast_1_0(Consume, 1)
            aie.objectfifo.release @of_8_unicast_1(Produce, 1)
          }
        }
      }
      aie.end
    } {link_with = "op0_mha.o"}
    %flash_state_2_3 = aie.buffer(%tile_2_3) {sym_name = "flash_state_2_3"} : memref<256xbf16> 
    %flash_index_2_3 = aie.buffer(%tile_2_3) {sym_name = "flash_index_2_3"} : memref<2xi32> 
    aie.objectfifo @flash_scale_2_3(%tile_2_3, {%tile_2_4}, 2 : i32) : !aie.objectfifo<memref<256xbf16>>  
    %core_2_3 = aie.core(%tile_2_3) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c4 = arith.constant 4 : index
        scf.for %arg1 = %c0_0 to %c4 step %c1_1 {
          %c32 = arith.constant 32 : index
          scf.for %arg2 = %c0_0 to %c32 step %c1_1 {
            %0 = aie.objectfifo.acquire @of_8_unicast_2(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            %2 = aie.objectfifo.acquire @of_7_unicast_2_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %3 = aie.objectfifo.subview.access %2[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            %4 = arith.index_cast %arg2 : index to i32
            %c1_i32 = arith.constant 1 : i32
            %5 = arith.muli %4, %c1_i32 : i32
            %c0_i32 = arith.constant 0 : i32
            %6 = arith.addi %c0_i32, %5 : i32
            %7 = arith.index_cast %arg1 : index to i32
            %c8_i32 = arith.constant 8 : i32
            %8 = arith.muli %7, %c8_i32 : i32
            %c2_i32 = arith.constant 2 : i32
            %9 = arith.addi %c2_i32, %8 : i32
            %c0_2 = arith.constant 0 : index
            %c1_3 = arith.constant 1 : index
            memref.store %6, %flash_index_2_3[%c0_2] : memref<2xi32>
            memref.store %9, %flash_index_2_3[%c1_3] : memref<2xi32>
            %c64_i32 = arith.constant 64 : i32
            %c0_i32_4 = arith.constant 0 : i32
            %10 = arith.cmpi eq, %6, %c0_i32_4 : i32
            scf.if %10 {
              func.call @op0_init_scale_buffer(%flash_state_2_3, %c64_i32) : (memref<256xbf16>, i32) -> ()
            }
            %cst = arith.constant 1.4453125 : f32
            %11 = arith.truncf %cst : f32 to bf16
            %c64_i32_5 = arith.constant 64 : i32
            %c2048_i32 = arith.constant 2048 : i32
            %c2048_i32_6 = arith.constant 2048 : i32
            func.call @op0_partial_softmax(%3, %1, %flash_state_2_3, %flash_index_2_3, %11, %c64_i32, %c64_i32_5, %c2048_i32, %c2048_i32_6) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<256xbf16>, memref<2xi32>, bf16, i32, i32, i32, i32) -> ()
            %12 = aie.objectfifo.acquire @flash_scale_2_3(Produce, 1) : !aie.objectfifosubview<memref<256xbf16>>
            %13 = aie.objectfifo.subview.access %12[0] : !aie.objectfifosubview<memref<256xbf16>> -> memref<256xbf16>
            %c256_i32 = arith.constant 256 : i32
            func.call @op0_passThroughLine(%flash_state_2_3, %13, %c256_i32) : (memref<256xbf16>, memref<256xbf16>, i32) -> ()
            aie.objectfifo.release @flash_scale_2_3(Produce, 1)
            aie.objectfifo.release @of_7_unicast_2_0(Consume, 1)
            aie.objectfifo.release @of_8_unicast_2(Produce, 1)
          }
        }
      }
      aie.end
    } {link_with = "op0_mha.o"}
    %flash_state_3_3 = aie.buffer(%tile_3_3) {sym_name = "flash_state_3_3"} : memref<256xbf16> 
    %flash_index_3_3 = aie.buffer(%tile_3_3) {sym_name = "flash_index_3_3"} : memref<2xi32> 
    aie.objectfifo @flash_scale_3_3(%tile_3_3, {%tile_3_4}, 2 : i32) : !aie.objectfifo<memref<256xbf16>>  
    %core_3_3 = aie.core(%tile_3_3) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c4 = arith.constant 4 : index
        scf.for %arg1 = %c0_0 to %c4 step %c1_1 {
          %c32 = arith.constant 32 : index
          scf.for %arg2 = %c0_0 to %c32 step %c1_1 {
            %0 = aie.objectfifo.acquire @of_8_unicast_3(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            %2 = aie.objectfifo.acquire @of_7_unicast_3_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %3 = aie.objectfifo.subview.access %2[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            %4 = arith.index_cast %arg2 : index to i32
            %c1_i32 = arith.constant 1 : i32
            %5 = arith.muli %4, %c1_i32 : i32
            %c0_i32 = arith.constant 0 : i32
            %6 = arith.addi %c0_i32, %5 : i32
            %7 = arith.index_cast %arg1 : index to i32
            %c8_i32 = arith.constant 8 : i32
            %8 = arith.muli %7, %c8_i32 : i32
            %c3_i32 = arith.constant 3 : i32
            %9 = arith.addi %c3_i32, %8 : i32
            %c0_2 = arith.constant 0 : index
            %c1_3 = arith.constant 1 : index
            memref.store %6, %flash_index_3_3[%c0_2] : memref<2xi32>
            memref.store %9, %flash_index_3_3[%c1_3] : memref<2xi32>
            %c64_i32 = arith.constant 64 : i32
            %c0_i32_4 = arith.constant 0 : i32
            %10 = arith.cmpi eq, %6, %c0_i32_4 : i32
            scf.if %10 {
              func.call @op0_init_scale_buffer(%flash_state_3_3, %c64_i32) : (memref<256xbf16>, i32) -> ()
            }
            %cst = arith.constant 1.4453125 : f32
            %11 = arith.truncf %cst : f32 to bf16
            %c64_i32_5 = arith.constant 64 : i32
            %c2048_i32 = arith.constant 2048 : i32
            %c2048_i32_6 = arith.constant 2048 : i32
            func.call @op0_partial_softmax(%3, %1, %flash_state_3_3, %flash_index_3_3, %11, %c64_i32, %c64_i32_5, %c2048_i32, %c2048_i32_6) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<256xbf16>, memref<2xi32>, bf16, i32, i32, i32, i32) -> ()
            %12 = aie.objectfifo.acquire @flash_scale_3_3(Produce, 1) : !aie.objectfifosubview<memref<256xbf16>>
            %13 = aie.objectfifo.subview.access %12[0] : !aie.objectfifosubview<memref<256xbf16>> -> memref<256xbf16>
            %c256_i32 = arith.constant 256 : i32
            func.call @op0_passThroughLine(%flash_state_3_3, %13, %c256_i32) : (memref<256xbf16>, memref<256xbf16>, i32) -> ()
            aie.objectfifo.release @flash_scale_3_3(Produce, 1)
            aie.objectfifo.release @of_7_unicast_3_0(Consume, 1)
            aie.objectfifo.release @of_8_unicast_3(Produce, 1)
          }
        }
      }
      aie.end
    } {link_with = "op0_mha.o"}
    %flash_state_4_3 = aie.buffer(%tile_4_3) {sym_name = "flash_state_4_3"} : memref<256xbf16> 
    %flash_index_4_3 = aie.buffer(%tile_4_3) {sym_name = "flash_index_4_3"} : memref<2xi32> 
    aie.objectfifo @flash_scale_4_3(%tile_4_3, {%tile_4_4}, 2 : i32) : !aie.objectfifo<memref<256xbf16>>  
    %core_4_3 = aie.core(%tile_4_3) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c4 = arith.constant 4 : index
        scf.for %arg1 = %c0_0 to %c4 step %c1_1 {
          %c32 = arith.constant 32 : index
          scf.for %arg2 = %c0_0 to %c32 step %c1_1 {
            %0 = aie.objectfifo.acquire @of_8_unicast_4(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            %2 = aie.objectfifo.acquire @of_7_unicast_4_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %3 = aie.objectfifo.subview.access %2[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            %4 = arith.index_cast %arg2 : index to i32
            %c1_i32 = arith.constant 1 : i32
            %5 = arith.muli %4, %c1_i32 : i32
            %c0_i32 = arith.constant 0 : i32
            %6 = arith.addi %c0_i32, %5 : i32
            %7 = arith.index_cast %arg1 : index to i32
            %c8_i32 = arith.constant 8 : i32
            %8 = arith.muli %7, %c8_i32 : i32
            %c4_i32 = arith.constant 4 : i32
            %9 = arith.addi %c4_i32, %8 : i32
            %c0_2 = arith.constant 0 : index
            %c1_3 = arith.constant 1 : index
            memref.store %6, %flash_index_4_3[%c0_2] : memref<2xi32>
            memref.store %9, %flash_index_4_3[%c1_3] : memref<2xi32>
            %c64_i32 = arith.constant 64 : i32
            %c0_i32_4 = arith.constant 0 : i32
            %10 = arith.cmpi eq, %6, %c0_i32_4 : i32
            scf.if %10 {
              func.call @op0_init_scale_buffer(%flash_state_4_3, %c64_i32) : (memref<256xbf16>, i32) -> ()
            }
            %cst = arith.constant 1.4453125 : f32
            %11 = arith.truncf %cst : f32 to bf16
            %c64_i32_5 = arith.constant 64 : i32
            %c2048_i32 = arith.constant 2048 : i32
            %c2048_i32_6 = arith.constant 2048 : i32
            func.call @op0_partial_softmax(%3, %1, %flash_state_4_3, %flash_index_4_3, %11, %c64_i32, %c64_i32_5, %c2048_i32, %c2048_i32_6) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<256xbf16>, memref<2xi32>, bf16, i32, i32, i32, i32) -> ()
            %12 = aie.objectfifo.acquire @flash_scale_4_3(Produce, 1) : !aie.objectfifosubview<memref<256xbf16>>
            %13 = aie.objectfifo.subview.access %12[0] : !aie.objectfifosubview<memref<256xbf16>> -> memref<256xbf16>
            %c256_i32 = arith.constant 256 : i32
            func.call @op0_passThroughLine(%flash_state_4_3, %13, %c256_i32) : (memref<256xbf16>, memref<256xbf16>, i32) -> ()
            aie.objectfifo.release @flash_scale_4_3(Produce, 1)
            aie.objectfifo.release @of_7_unicast_4_0(Consume, 1)
            aie.objectfifo.release @of_8_unicast_4(Produce, 1)
          }
        }
      }
      aie.end
    } {link_with = "op0_mha.o"}
    %flash_state_5_3 = aie.buffer(%tile_5_3) {sym_name = "flash_state_5_3"} : memref<256xbf16> 
    %flash_index_5_3 = aie.buffer(%tile_5_3) {sym_name = "flash_index_5_3"} : memref<2xi32> 
    aie.objectfifo @flash_scale_5_3(%tile_5_3, {%tile_5_4}, 2 : i32) : !aie.objectfifo<memref<256xbf16>>  
    %core_5_3 = aie.core(%tile_5_3) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c4 = arith.constant 4 : index
        scf.for %arg1 = %c0_0 to %c4 step %c1_1 {
          %c32 = arith.constant 32 : index
          scf.for %arg2 = %c0_0 to %c32 step %c1_1 {
            %0 = aie.objectfifo.acquire @of_8_unicast_5(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            %2 = aie.objectfifo.acquire @of_7_unicast_5_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %3 = aie.objectfifo.subview.access %2[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            %4 = arith.index_cast %arg2 : index to i32
            %c1_i32 = arith.constant 1 : i32
            %5 = arith.muli %4, %c1_i32 : i32
            %c0_i32 = arith.constant 0 : i32
            %6 = arith.addi %c0_i32, %5 : i32
            %7 = arith.index_cast %arg1 : index to i32
            %c8_i32 = arith.constant 8 : i32
            %8 = arith.muli %7, %c8_i32 : i32
            %c5_i32 = arith.constant 5 : i32
            %9 = arith.addi %c5_i32, %8 : i32
            %c0_2 = arith.constant 0 : index
            %c1_3 = arith.constant 1 : index
            memref.store %6, %flash_index_5_3[%c0_2] : memref<2xi32>
            memref.store %9, %flash_index_5_3[%c1_3] : memref<2xi32>
            %c64_i32 = arith.constant 64 : i32
            %c0_i32_4 = arith.constant 0 : i32
            %10 = arith.cmpi eq, %6, %c0_i32_4 : i32
            scf.if %10 {
              func.call @op0_init_scale_buffer(%flash_state_5_3, %c64_i32) : (memref<256xbf16>, i32) -> ()
            }
            %cst = arith.constant 1.4453125 : f32
            %11 = arith.truncf %cst : f32 to bf16
            %c64_i32_5 = arith.constant 64 : i32
            %c2048_i32 = arith.constant 2048 : i32
            %c2048_i32_6 = arith.constant 2048 : i32
            func.call @op0_partial_softmax(%3, %1, %flash_state_5_3, %flash_index_5_3, %11, %c64_i32, %c64_i32_5, %c2048_i32, %c2048_i32_6) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<256xbf16>, memref<2xi32>, bf16, i32, i32, i32, i32) -> ()
            %12 = aie.objectfifo.acquire @flash_scale_5_3(Produce, 1) : !aie.objectfifosubview<memref<256xbf16>>
            %13 = aie.objectfifo.subview.access %12[0] : !aie.objectfifosubview<memref<256xbf16>> -> memref<256xbf16>
            %c256_i32 = arith.constant 256 : i32
            func.call @op0_passThroughLine(%flash_state_5_3, %13, %c256_i32) : (memref<256xbf16>, memref<256xbf16>, i32) -> ()
            aie.objectfifo.release @flash_scale_5_3(Produce, 1)
            aie.objectfifo.release @of_7_unicast_5_0(Consume, 1)
            aie.objectfifo.release @of_8_unicast_5(Produce, 1)
          }
        }
      }
      aie.end
    } {link_with = "op0_mha.o"}
    %flash_state_6_3 = aie.buffer(%tile_6_3) {sym_name = "flash_state_6_3"} : memref<256xbf16> 
    %flash_index_6_3 = aie.buffer(%tile_6_3) {sym_name = "flash_index_6_3"} : memref<2xi32> 
    aie.objectfifo @flash_scale_6_3(%tile_6_3, {%tile_6_4}, 2 : i32) : !aie.objectfifo<memref<256xbf16>>  
    %core_6_3 = aie.core(%tile_6_3) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c4 = arith.constant 4 : index
        scf.for %arg1 = %c0_0 to %c4 step %c1_1 {
          %c32 = arith.constant 32 : index
          scf.for %arg2 = %c0_0 to %c32 step %c1_1 {
            %0 = aie.objectfifo.acquire @of_8_unicast_6(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            %2 = aie.objectfifo.acquire @of_7_unicast_6_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %3 = aie.objectfifo.subview.access %2[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            %4 = arith.index_cast %arg2 : index to i32
            %c1_i32 = arith.constant 1 : i32
            %5 = arith.muli %4, %c1_i32 : i32
            %c0_i32 = arith.constant 0 : i32
            %6 = arith.addi %c0_i32, %5 : i32
            %7 = arith.index_cast %arg1 : index to i32
            %c8_i32 = arith.constant 8 : i32
            %8 = arith.muli %7, %c8_i32 : i32
            %c6_i32 = arith.constant 6 : i32
            %9 = arith.addi %c6_i32, %8 : i32
            %c0_2 = arith.constant 0 : index
            %c1_3 = arith.constant 1 : index
            memref.store %6, %flash_index_6_3[%c0_2] : memref<2xi32>
            memref.store %9, %flash_index_6_3[%c1_3] : memref<2xi32>
            %c64_i32 = arith.constant 64 : i32
            %c0_i32_4 = arith.constant 0 : i32
            %10 = arith.cmpi eq, %6, %c0_i32_4 : i32
            scf.if %10 {
              func.call @op0_init_scale_buffer(%flash_state_6_3, %c64_i32) : (memref<256xbf16>, i32) -> ()
            }
            %cst = arith.constant 1.4453125 : f32
            %11 = arith.truncf %cst : f32 to bf16
            %c64_i32_5 = arith.constant 64 : i32
            %c2048_i32 = arith.constant 2048 : i32
            %c2048_i32_6 = arith.constant 2048 : i32
            func.call @op0_partial_softmax(%3, %1, %flash_state_6_3, %flash_index_6_3, %11, %c64_i32, %c64_i32_5, %c2048_i32, %c2048_i32_6) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<256xbf16>, memref<2xi32>, bf16, i32, i32, i32, i32) -> ()
            %12 = aie.objectfifo.acquire @flash_scale_6_3(Produce, 1) : !aie.objectfifosubview<memref<256xbf16>>
            %13 = aie.objectfifo.subview.access %12[0] : !aie.objectfifosubview<memref<256xbf16>> -> memref<256xbf16>
            %c256_i32 = arith.constant 256 : i32
            func.call @op0_passThroughLine(%flash_state_6_3, %13, %c256_i32) : (memref<256xbf16>, memref<256xbf16>, i32) -> ()
            aie.objectfifo.release @flash_scale_6_3(Produce, 1)
            aie.objectfifo.release @of_7_unicast_6_0(Consume, 1)
            aie.objectfifo.release @of_8_unicast_6(Produce, 1)
          }
        }
      }
      aie.end
    } {link_with = "op0_mha.o"}
    %flash_state_7_3 = aie.buffer(%tile_7_3) {sym_name = "flash_state_7_3"} : memref<256xbf16> 
    %flash_index_7_3 = aie.buffer(%tile_7_3) {sym_name = "flash_index_7_3"} : memref<2xi32> 
    aie.objectfifo @flash_scale_7_3(%tile_7_3, {%tile_7_4}, 2 : i32) : !aie.objectfifo<memref<256xbf16>>  
    %core_7_3 = aie.core(%tile_7_3) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c4 = arith.constant 4 : index
        scf.for %arg1 = %c0_0 to %c4 step %c1_1 {
          %c32 = arith.constant 32 : index
          scf.for %arg2 = %c0_0 to %c32 step %c1_1 {
            %0 = aie.objectfifo.acquire @of_8_unicast_7(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            %2 = aie.objectfifo.acquire @of_7_unicast_7_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %3 = aie.objectfifo.subview.access %2[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            %4 = arith.index_cast %arg2 : index to i32
            %c1_i32 = arith.constant 1 : i32
            %5 = arith.muli %4, %c1_i32 : i32
            %c0_i32 = arith.constant 0 : i32
            %6 = arith.addi %c0_i32, %5 : i32
            %7 = arith.index_cast %arg1 : index to i32
            %c8_i32 = arith.constant 8 : i32
            %8 = arith.muli %7, %c8_i32 : i32
            %c7_i32 = arith.constant 7 : i32
            %9 = arith.addi %c7_i32, %8 : i32
            %c0_2 = arith.constant 0 : index
            %c1_3 = arith.constant 1 : index
            memref.store %6, %flash_index_7_3[%c0_2] : memref<2xi32>
            memref.store %9, %flash_index_7_3[%c1_3] : memref<2xi32>
            %c64_i32 = arith.constant 64 : i32
            %c0_i32_4 = arith.constant 0 : i32
            %10 = arith.cmpi eq, %6, %c0_i32_4 : i32
            scf.if %10 {
              func.call @op0_init_scale_buffer(%flash_state_7_3, %c64_i32) : (memref<256xbf16>, i32) -> ()
            }
            %cst = arith.constant 1.4453125 : f32
            %11 = arith.truncf %cst : f32 to bf16
            %c64_i32_5 = arith.constant 64 : i32
            %c2048_i32 = arith.constant 2048 : i32
            %c2048_i32_6 = arith.constant 2048 : i32
            func.call @op0_partial_softmax(%3, %1, %flash_state_7_3, %flash_index_7_3, %11, %c64_i32, %c64_i32_5, %c2048_i32, %c2048_i32_6) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<256xbf16>, memref<2xi32>, bf16, i32, i32, i32, i32) -> ()
            %12 = aie.objectfifo.acquire @flash_scale_7_3(Produce, 1) : !aie.objectfifosubview<memref<256xbf16>>
            %13 = aie.objectfifo.subview.access %12[0] : !aie.objectfifosubview<memref<256xbf16>> -> memref<256xbf16>
            %c256_i32 = arith.constant 256 : i32
            func.call @op0_passThroughLine(%flash_state_7_3, %13, %c256_i32) : (memref<256xbf16>, memref<256xbf16>, i32) -> ()
            aie.objectfifo.release @flash_scale_7_3(Produce, 1)
            aie.objectfifo.release @of_7_unicast_7_0(Consume, 1)
            aie.objectfifo.release @of_8_unicast_7(Produce, 1)
          }
        }
      }
      aie.end
    } {link_with = "op0_mha.o"}
    aie.objectfifo @of_0_mem_0(%shim_noc_tile_0_0, {%mem_tile_0_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_0_mem_1(%shim_noc_tile_1_0, {%mem_tile_1_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_0_mem_2(%shim_noc_tile_2_0, {%mem_tile_2_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_0_mem_3(%shim_noc_tile_3_0, {%mem_tile_3_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_0_mem_4(%shim_noc_tile_4_0, {%mem_tile_4_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_0_mem_5(%shim_noc_tile_5_0, {%mem_tile_5_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_0_mem_6(%shim_noc_tile_6_0, {%mem_tile_6_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_0_mem_7(%shim_noc_tile_7_0, {%mem_tile_7_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_1_mem(%shim_noc_tile_3_0, {%mem_tile_3_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_2_mem(%shim_noc_tile_4_0, {%mem_tile_4_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_3_unicast_0_0(%mem_tile_0_1 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%tile_0_2}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo.link [@of_0_mem_0] -> [@of_3_unicast_0_0]([] [])
    aie.objectfifo @of_3_unicast_1_0(%mem_tile_1_1 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%tile_1_2}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo.link [@of_0_mem_1] -> [@of_3_unicast_1_0]([] [])
    aie.objectfifo @of_3_unicast_2_0(%mem_tile_2_1 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%tile_2_2}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo.link [@of_0_mem_2] -> [@of_3_unicast_2_0]([] [])
    aie.objectfifo @of_3_unicast_3_0(%mem_tile_3_1 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%tile_3_2}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo.link [@of_0_mem_3] -> [@of_3_unicast_3_0]([] [])
    aie.objectfifo @of_3_unicast_4_0(%mem_tile_4_1 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%tile_4_2}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo.link [@of_0_mem_4] -> [@of_3_unicast_4_0]([] [])
    aie.objectfifo @of_3_unicast_5_0(%mem_tile_5_1 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%tile_5_2}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo.link [@of_0_mem_5] -> [@of_3_unicast_5_0]([] [])
    aie.objectfifo @of_3_unicast_6_0(%mem_tile_6_1 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%tile_6_2}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo.link [@of_0_mem_6] -> [@of_3_unicast_6_0]([] [])
    aie.objectfifo @of_3_unicast_7_0(%mem_tile_7_1 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%tile_7_2}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo.link [@of_0_mem_7] -> [@of_3_unicast_7_0]([] [])
    aie.objectfifo @of_4_broadcast_0_0(%mem_tile_3_1 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%tile_0_2, %tile_1_2, %tile_2_2, %tile_3_2, %tile_4_2, %tile_5_2, %tile_6_2, %tile_7_2}, [2 : i32, 2 : i32, 2 : i32, 2 : i32, 2 : i32, 2 : i32, 2 : i32, 2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo.link [@of_1_mem] -> [@of_4_broadcast_0_0]([] [])
    aie.objectfifo @of_5_broadcast_0_0(%mem_tile_4_1 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%tile_0_4, %tile_1_4, %tile_2_4, %tile_3_4, %tile_4_4, %tile_5_4, %tile_6_4, %tile_7_4}, [2 : i32, 2 : i32, 2 : i32, 2 : i32, 2 : i32, 2 : i32, 2 : i32, 2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo.link [@of_2_mem] -> [@of_5_broadcast_0_0]([] [])
    aie.objectfifo @of_6_unicast_0(%tile_0_2, {%mem_tile_0_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_6_unicast_1(%tile_1_2, {%mem_tile_1_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_6_unicast_2(%tile_2_2, {%mem_tile_2_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_6_unicast_3(%tile_3_2, {%mem_tile_3_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_6_unicast_4(%tile_4_2, {%mem_tile_4_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_6_unicast_5(%tile_5_2, {%mem_tile_5_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_6_unicast_6(%tile_6_2, {%mem_tile_6_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_6_unicast_7(%tile_7_2, {%mem_tile_7_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_7_unicast_0_0(%mem_tile_0_1 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%tile_0_3}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo.link [@of_6_unicast_0] -> [@of_7_unicast_0_0]([] [])
    aie.objectfifo @of_7_unicast_1_0(%mem_tile_1_1 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%tile_1_3}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo.link [@of_6_unicast_1] -> [@of_7_unicast_1_0]([] [])
    aie.objectfifo @of_7_unicast_2_0(%mem_tile_2_1 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%tile_2_3}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo.link [@of_6_unicast_2] -> [@of_7_unicast_2_0]([] [])
    aie.objectfifo @of_7_unicast_3_0(%mem_tile_3_1 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%tile_3_3}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo.link [@of_6_unicast_3] -> [@of_7_unicast_3_0]([] [])
    aie.objectfifo @of_7_unicast_4_0(%mem_tile_4_1 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%tile_4_3}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo.link [@of_6_unicast_4] -> [@of_7_unicast_4_0]([] [])
    aie.objectfifo @of_7_unicast_5_0(%mem_tile_5_1 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%tile_5_3}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo.link [@of_6_unicast_5] -> [@of_7_unicast_5_0]([] [])
    aie.objectfifo @of_7_unicast_6_0(%mem_tile_6_1 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%tile_6_3}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo.link [@of_6_unicast_6] -> [@of_7_unicast_6_0]([] [])
    aie.objectfifo @of_7_unicast_7_0(%mem_tile_7_1 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%tile_7_3}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo.link [@of_6_unicast_7] -> [@of_7_unicast_7_0]([] [])
    aie.objectfifo @of_8_unicast_0(%tile_0_3, {%mem_tile_0_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_8_unicast_1(%tile_1_3, {%mem_tile_1_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_8_unicast_2(%tile_2_3, {%mem_tile_2_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_8_unicast_3(%tile_3_3, {%mem_tile_3_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_8_unicast_4(%tile_4_3, {%mem_tile_4_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_8_unicast_5(%tile_5_3, {%mem_tile_5_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_8_unicast_6(%tile_6_3, {%mem_tile_6_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_8_unicast_7(%tile_7_3, {%mem_tile_7_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_9_unicast_0_0(%mem_tile_0_1 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%tile_0_4}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo.link [@of_8_unicast_0] -> [@of_9_unicast_0_0]([] [])
    aie.objectfifo @of_9_unicast_1_0(%mem_tile_1_1 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%tile_1_4}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo.link [@of_8_unicast_1] -> [@of_9_unicast_1_0]([] [])
    aie.objectfifo @of_9_unicast_2_0(%mem_tile_2_1 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%tile_2_4}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo.link [@of_8_unicast_2] -> [@of_9_unicast_2_0]([] [])
    aie.objectfifo @of_9_unicast_3_0(%mem_tile_3_1 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%tile_3_4}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo.link [@of_8_unicast_3] -> [@of_9_unicast_3_0]([] [])
    aie.objectfifo @of_9_unicast_4_0(%mem_tile_4_1 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%tile_4_4}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo.link [@of_8_unicast_4] -> [@of_9_unicast_4_0]([] [])
    aie.objectfifo @of_9_unicast_5_0(%mem_tile_5_1 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%tile_5_4}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo.link [@of_8_unicast_5] -> [@of_9_unicast_5_0]([] [])
    aie.objectfifo @of_9_unicast_6_0(%mem_tile_6_1 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%tile_6_4}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo.link [@of_8_unicast_6] -> [@of_9_unicast_6_0]([] [])
    aie.objectfifo @of_9_unicast_7_0(%mem_tile_7_1 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%tile_7_4}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo.link [@of_8_unicast_7] -> [@of_9_unicast_7_0]([] [])
    aie.objectfifo @of_10_unicast_0(%tile_0_4, {%mem_tile_0_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_10_unicast_1(%tile_1_4, {%mem_tile_1_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_10_unicast_2(%tile_2_4, {%mem_tile_2_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_10_unicast_3(%tile_3_4, {%mem_tile_3_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_10_unicast_4(%tile_4_4, {%mem_tile_4_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_10_unicast_5(%tile_5_4, {%mem_tile_5_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_10_unicast_6(%tile_6_4, {%mem_tile_6_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_10_unicast_7(%tile_7_4, {%mem_tile_7_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_11_mem_0(%mem_tile_0_1 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%shim_noc_tile_0_0}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo.link [@of_10_unicast_0] -> [@of_11_mem_0]([] [])
    aie.objectfifo @of_11_mem_1(%mem_tile_1_1 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%shim_noc_tile_1_0}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo.link [@of_10_unicast_1] -> [@of_11_mem_1]([] [])
    aie.objectfifo @of_11_mem_2(%mem_tile_2_1 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%shim_noc_tile_2_0}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo.link [@of_10_unicast_2] -> [@of_11_mem_2]([] [])
    aie.objectfifo @of_11_mem_3(%mem_tile_3_1 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%shim_noc_tile_3_0}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo.link [@of_10_unicast_3] -> [@of_11_mem_3]([] [])
    aie.objectfifo @of_11_mem_4(%mem_tile_4_1 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%shim_noc_tile_4_0}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo.link [@of_10_unicast_4] -> [@of_11_mem_4]([] [])
    aie.objectfifo @of_11_mem_5(%mem_tile_5_1 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%shim_noc_tile_5_0}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo.link [@of_10_unicast_5] -> [@of_11_mem_5]([] [])
    aie.objectfifo @of_11_mem_6(%mem_tile_6_1 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%shim_noc_tile_6_0}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo.link [@of_10_unicast_6] -> [@of_11_mem_6]([] [])
    aie.objectfifo @of_11_mem_7(%mem_tile_7_1 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%shim_noc_tile_7_0}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo.link [@of_10_unicast_7] -> [@of_11_mem_7]([] [])
    func.func private @op0_zero_bf16_64_64_64(memref<64x64xbf16>)
    func.func private @op0_matmul_bf16_bf16_64_64_64(memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>)
    func.func private @op0_rescale_O(memref<64x64xbf16>, memref<256xbf16>, i32, memref<2xi32>)
    func.func private @op0_zero_bf16(memref<64x64xbf16>)
    func.func private @op0_matmul_PV(memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>, memref<256xbf16>, i32, i32, memref<2xi32>)
    func.func private @op0_init_scale_buffer(memref<256xbf16>, i32)
    func.func private @op0_passThroughLine(memref<256xbf16>, memref<256xbf16>, i32) attributes {link_with = "op0_mha_passThrough.o"}
    func.func private @op0_partial_softmax(memref<64x64xbf16>, memref<64x64xbf16>, memref<256xbf16>, memref<2xi32>, bf16, i32, i32, i32, i32)
  }
  aie.device(npu2) @reset_device {
    aie.runtime_sequence() {
    }
  }
  aie.device(npu2) {
    aie.runtime_sequence(%arg0: memref<12582912xbf16>, %arg1: memref<4194304xbf16>, %arg2: memref<1xbf16>) {
      aiex.configure @op0__MHAStreamGroup {
        %subview = memref.subview %arg0[0] [131072] [1] : memref<12582912xbf16> to memref<131072xbf16>
        %reinterpret_cast = memref.reinterpret_cast %subview to offset: [0], sizes: [2048, 64], strides: [64, 1] : memref<131072xbf16> to memref<2048x64xbf16>
        %subview_0 = memref.subview %arg0[4194304] [131072] [1] : memref<12582912xbf16> to memref<131072xbf16, strided<[1], offset: 4194304>>
        %reinterpret_cast_1 = memref.reinterpret_cast %subview_0 to offset: [0], sizes: [64, 2048], strides: [2048, 1] : memref<131072xbf16, strided<[1], offset: 4194304>> to memref<64x2048xbf16>
        %subview_2 = memref.subview %arg0[8388608] [131072] [1] : memref<12582912xbf16> to memref<131072xbf16, strided<[1], offset: 8388608>>
        %reinterpret_cast_3 = memref.reinterpret_cast %subview_2 to offset: [0], sizes: [2048, 64], strides: [64, 1] : memref<131072xbf16, strided<[1], offset: 8388608>> to memref<2048x64xbf16>
        %subview_4 = memref.subview %arg1[0] [131072] [1] : memref<4194304xbf16> to memref<131072xbf16>
        %reinterpret_cast_5 = memref.reinterpret_cast %subview_4 to offset: [0], sizes: [2048, 64], strides: [64, 1] : memref<131072xbf16> to memref<2048x64xbf16>
        aiex.run @sequence(%reinterpret_cast, %reinterpret_cast_1, %reinterpret_cast_3, %reinterpret_cast_5) : (memref<2048x64xbf16>, memref<64x2048xbf16>, memref<2048x64xbf16>, memref<2048x64xbf16>)
        %subview_6 = memref.subview %arg0[131072] [131072] [1] : memref<12582912xbf16> to memref<131072xbf16, strided<[1], offset: 131072>>
        %reinterpret_cast_7 = memref.reinterpret_cast %subview_6 to offset: [0], sizes: [2048, 64], strides: [64, 1] : memref<131072xbf16, strided<[1], offset: 131072>> to memref<2048x64xbf16>
        %subview_8 = memref.subview %arg0[4325376] [131072] [1] : memref<12582912xbf16> to memref<131072xbf16, strided<[1], offset: 4325376>>
        %reinterpret_cast_9 = memref.reinterpret_cast %subview_8 to offset: [0], sizes: [64, 2048], strides: [2048, 1] : memref<131072xbf16, strided<[1], offset: 4325376>> to memref<64x2048xbf16>
        %subview_10 = memref.subview %arg0[8519680] [131072] [1] : memref<12582912xbf16> to memref<131072xbf16, strided<[1], offset: 8519680>>
        %reinterpret_cast_11 = memref.reinterpret_cast %subview_10 to offset: [0], sizes: [2048, 64], strides: [64, 1] : memref<131072xbf16, strided<[1], offset: 8519680>> to memref<2048x64xbf16>
        %subview_12 = memref.subview %arg1[131072] [131072] [1] : memref<4194304xbf16> to memref<131072xbf16, strided<[1], offset: 131072>>
        %reinterpret_cast_13 = memref.reinterpret_cast %subview_12 to offset: [0], sizes: [2048, 64], strides: [64, 1] : memref<131072xbf16, strided<[1], offset: 131072>> to memref<2048x64xbf16>
        aiex.run @sequence(%reinterpret_cast_7, %reinterpret_cast_9, %reinterpret_cast_11, %reinterpret_cast_13) : (memref<2048x64xbf16>, memref<64x2048xbf16>, memref<2048x64xbf16>, memref<2048x64xbf16>)
        %subview_14 = memref.subview %arg0[262144] [131072] [1] : memref<12582912xbf16> to memref<131072xbf16, strided<[1], offset: 262144>>
        %reinterpret_cast_15 = memref.reinterpret_cast %subview_14 to offset: [0], sizes: [2048, 64], strides: [64, 1] : memref<131072xbf16, strided<[1], offset: 262144>> to memref<2048x64xbf16>
        %subview_16 = memref.subview %arg0[4456448] [131072] [1] : memref<12582912xbf16> to memref<131072xbf16, strided<[1], offset: 4456448>>
        %reinterpret_cast_17 = memref.reinterpret_cast %subview_16 to offset: [0], sizes: [64, 2048], strides: [2048, 1] : memref<131072xbf16, strided<[1], offset: 4456448>> to memref<64x2048xbf16>
        %subview_18 = memref.subview %arg0[8650752] [131072] [1] : memref<12582912xbf16> to memref<131072xbf16, strided<[1], offset: 8650752>>
        %reinterpret_cast_19 = memref.reinterpret_cast %subview_18 to offset: [0], sizes: [2048, 64], strides: [64, 1] : memref<131072xbf16, strided<[1], offset: 8650752>> to memref<2048x64xbf16>
        %subview_20 = memref.subview %arg1[262144] [131072] [1] : memref<4194304xbf16> to memref<131072xbf16, strided<[1], offset: 262144>>
        %reinterpret_cast_21 = memref.reinterpret_cast %subview_20 to offset: [0], sizes: [2048, 64], strides: [64, 1] : memref<131072xbf16, strided<[1], offset: 262144>> to memref<2048x64xbf16>
        aiex.run @sequence(%reinterpret_cast_15, %reinterpret_cast_17, %reinterpret_cast_19, %reinterpret_cast_21) : (memref<2048x64xbf16>, memref<64x2048xbf16>, memref<2048x64xbf16>, memref<2048x64xbf16>)
        %subview_22 = memref.subview %arg0[393216] [131072] [1] : memref<12582912xbf16> to memref<131072xbf16, strided<[1], offset: 393216>>
        %reinterpret_cast_23 = memref.reinterpret_cast %subview_22 to offset: [0], sizes: [2048, 64], strides: [64, 1] : memref<131072xbf16, strided<[1], offset: 393216>> to memref<2048x64xbf16>
        %subview_24 = memref.subview %arg0[4587520] [131072] [1] : memref<12582912xbf16> to memref<131072xbf16, strided<[1], offset: 4587520>>
        %reinterpret_cast_25 = memref.reinterpret_cast %subview_24 to offset: [0], sizes: [64, 2048], strides: [2048, 1] : memref<131072xbf16, strided<[1], offset: 4587520>> to memref<64x2048xbf16>
        %subview_26 = memref.subview %arg0[8781824] [131072] [1] : memref<12582912xbf16> to memref<131072xbf16, strided<[1], offset: 8781824>>
        %reinterpret_cast_27 = memref.reinterpret_cast %subview_26 to offset: [0], sizes: [2048, 64], strides: [64, 1] : memref<131072xbf16, strided<[1], offset: 8781824>> to memref<2048x64xbf16>
        %subview_28 = memref.subview %arg1[393216] [131072] [1] : memref<4194304xbf16> to memref<131072xbf16, strided<[1], offset: 393216>>
        %reinterpret_cast_29 = memref.reinterpret_cast %subview_28 to offset: [0], sizes: [2048, 64], strides: [64, 1] : memref<131072xbf16, strided<[1], offset: 393216>> to memref<2048x64xbf16>
        aiex.run @sequence(%reinterpret_cast_23, %reinterpret_cast_25, %reinterpret_cast_27, %reinterpret_cast_29) : (memref<2048x64xbf16>, memref<64x2048xbf16>, memref<2048x64xbf16>, memref<2048x64xbf16>)
        %subview_30 = memref.subview %arg0[524288] [131072] [1] : memref<12582912xbf16> to memref<131072xbf16, strided<[1], offset: 524288>>
        %reinterpret_cast_31 = memref.reinterpret_cast %subview_30 to offset: [0], sizes: [2048, 64], strides: [64, 1] : memref<131072xbf16, strided<[1], offset: 524288>> to memref<2048x64xbf16>
        %subview_32 = memref.subview %arg0[4718592] [131072] [1] : memref<12582912xbf16> to memref<131072xbf16, strided<[1], offset: 4718592>>
        %reinterpret_cast_33 = memref.reinterpret_cast %subview_32 to offset: [0], sizes: [64, 2048], strides: [2048, 1] : memref<131072xbf16, strided<[1], offset: 4718592>> to memref<64x2048xbf16>
        %subview_34 = memref.subview %arg0[8912896] [131072] [1] : memref<12582912xbf16> to memref<131072xbf16, strided<[1], offset: 8912896>>
        %reinterpret_cast_35 = memref.reinterpret_cast %subview_34 to offset: [0], sizes: [2048, 64], strides: [64, 1] : memref<131072xbf16, strided<[1], offset: 8912896>> to memref<2048x64xbf16>
        %subview_36 = memref.subview %arg1[524288] [131072] [1] : memref<4194304xbf16> to memref<131072xbf16, strided<[1], offset: 524288>>
        %reinterpret_cast_37 = memref.reinterpret_cast %subview_36 to offset: [0], sizes: [2048, 64], strides: [64, 1] : memref<131072xbf16, strided<[1], offset: 524288>> to memref<2048x64xbf16>
        aiex.run @sequence(%reinterpret_cast_31, %reinterpret_cast_33, %reinterpret_cast_35, %reinterpret_cast_37) : (memref<2048x64xbf16>, memref<64x2048xbf16>, memref<2048x64xbf16>, memref<2048x64xbf16>)
        %subview_38 = memref.subview %arg0[655360] [131072] [1] : memref<12582912xbf16> to memref<131072xbf16, strided<[1], offset: 655360>>
        %reinterpret_cast_39 = memref.reinterpret_cast %subview_38 to offset: [0], sizes: [2048, 64], strides: [64, 1] : memref<131072xbf16, strided<[1], offset: 655360>> to memref<2048x64xbf16>
        %subview_40 = memref.subview %arg0[4849664] [131072] [1] : memref<12582912xbf16> to memref<131072xbf16, strided<[1], offset: 4849664>>
        %reinterpret_cast_41 = memref.reinterpret_cast %subview_40 to offset: [0], sizes: [64, 2048], strides: [2048, 1] : memref<131072xbf16, strided<[1], offset: 4849664>> to memref<64x2048xbf16>
        %subview_42 = memref.subview %arg0[9043968] [131072] [1] : memref<12582912xbf16> to memref<131072xbf16, strided<[1], offset: 9043968>>
        %reinterpret_cast_43 = memref.reinterpret_cast %subview_42 to offset: [0], sizes: [2048, 64], strides: [64, 1] : memref<131072xbf16, strided<[1], offset: 9043968>> to memref<2048x64xbf16>
        %subview_44 = memref.subview %arg1[655360] [131072] [1] : memref<4194304xbf16> to memref<131072xbf16, strided<[1], offset: 655360>>
        %reinterpret_cast_45 = memref.reinterpret_cast %subview_44 to offset: [0], sizes: [2048, 64], strides: [64, 1] : memref<131072xbf16, strided<[1], offset: 655360>> to memref<2048x64xbf16>
        aiex.run @sequence(%reinterpret_cast_39, %reinterpret_cast_41, %reinterpret_cast_43, %reinterpret_cast_45) : (memref<2048x64xbf16>, memref<64x2048xbf16>, memref<2048x64xbf16>, memref<2048x64xbf16>)
        %subview_46 = memref.subview %arg0[786432] [131072] [1] : memref<12582912xbf16> to memref<131072xbf16, strided<[1], offset: 786432>>
        %reinterpret_cast_47 = memref.reinterpret_cast %subview_46 to offset: [0], sizes: [2048, 64], strides: [64, 1] : memref<131072xbf16, strided<[1], offset: 786432>> to memref<2048x64xbf16>
        %subview_48 = memref.subview %arg0[4980736] [131072] [1] : memref<12582912xbf16> to memref<131072xbf16, strided<[1], offset: 4980736>>
        %reinterpret_cast_49 = memref.reinterpret_cast %subview_48 to offset: [0], sizes: [64, 2048], strides: [2048, 1] : memref<131072xbf16, strided<[1], offset: 4980736>> to memref<64x2048xbf16>
        %subview_50 = memref.subview %arg0[9175040] [131072] [1] : memref<12582912xbf16> to memref<131072xbf16, strided<[1], offset: 9175040>>
        %reinterpret_cast_51 = memref.reinterpret_cast %subview_50 to offset: [0], sizes: [2048, 64], strides: [64, 1] : memref<131072xbf16, strided<[1], offset: 9175040>> to memref<2048x64xbf16>
        %subview_52 = memref.subview %arg1[786432] [131072] [1] : memref<4194304xbf16> to memref<131072xbf16, strided<[1], offset: 786432>>
        %reinterpret_cast_53 = memref.reinterpret_cast %subview_52 to offset: [0], sizes: [2048, 64], strides: [64, 1] : memref<131072xbf16, strided<[1], offset: 786432>> to memref<2048x64xbf16>
        aiex.run @sequence(%reinterpret_cast_47, %reinterpret_cast_49, %reinterpret_cast_51, %reinterpret_cast_53) : (memref<2048x64xbf16>, memref<64x2048xbf16>, memref<2048x64xbf16>, memref<2048x64xbf16>)
        %subview_54 = memref.subview %arg0[917504] [131072] [1] : memref<12582912xbf16> to memref<131072xbf16, strided<[1], offset: 917504>>
        %reinterpret_cast_55 = memref.reinterpret_cast %subview_54 to offset: [0], sizes: [2048, 64], strides: [64, 1] : memref<131072xbf16, strided<[1], offset: 917504>> to memref<2048x64xbf16>
        %subview_56 = memref.subview %arg0[5111808] [131072] [1] : memref<12582912xbf16> to memref<131072xbf16, strided<[1], offset: 5111808>>
        %reinterpret_cast_57 = memref.reinterpret_cast %subview_56 to offset: [0], sizes: [64, 2048], strides: [2048, 1] : memref<131072xbf16, strided<[1], offset: 5111808>> to memref<64x2048xbf16>
        %subview_58 = memref.subview %arg0[9306112] [131072] [1] : memref<12582912xbf16> to memref<131072xbf16, strided<[1], offset: 9306112>>
        %reinterpret_cast_59 = memref.reinterpret_cast %subview_58 to offset: [0], sizes: [2048, 64], strides: [64, 1] : memref<131072xbf16, strided<[1], offset: 9306112>> to memref<2048x64xbf16>
        %subview_60 = memref.subview %arg1[917504] [131072] [1] : memref<4194304xbf16> to memref<131072xbf16, strided<[1], offset: 917504>>
        %reinterpret_cast_61 = memref.reinterpret_cast %subview_60 to offset: [0], sizes: [2048, 64], strides: [64, 1] : memref<131072xbf16, strided<[1], offset: 917504>> to memref<2048x64xbf16>
        aiex.run @sequence(%reinterpret_cast_55, %reinterpret_cast_57, %reinterpret_cast_59, %reinterpret_cast_61) : (memref<2048x64xbf16>, memref<64x2048xbf16>, memref<2048x64xbf16>, memref<2048x64xbf16>)
        %subview_62 = memref.subview %arg0[1048576] [131072] [1] : memref<12582912xbf16> to memref<131072xbf16, strided<[1], offset: 1048576>>
        %reinterpret_cast_63 = memref.reinterpret_cast %subview_62 to offset: [0], sizes: [2048, 64], strides: [64, 1] : memref<131072xbf16, strided<[1], offset: 1048576>> to memref<2048x64xbf16>
        %subview_64 = memref.subview %arg0[5242880] [131072] [1] : memref<12582912xbf16> to memref<131072xbf16, strided<[1], offset: 5242880>>
        %reinterpret_cast_65 = memref.reinterpret_cast %subview_64 to offset: [0], sizes: [64, 2048], strides: [2048, 1] : memref<131072xbf16, strided<[1], offset: 5242880>> to memref<64x2048xbf16>
        %subview_66 = memref.subview %arg0[9437184] [131072] [1] : memref<12582912xbf16> to memref<131072xbf16, strided<[1], offset: 9437184>>
        %reinterpret_cast_67 = memref.reinterpret_cast %subview_66 to offset: [0], sizes: [2048, 64], strides: [64, 1] : memref<131072xbf16, strided<[1], offset: 9437184>> to memref<2048x64xbf16>
        %subview_68 = memref.subview %arg1[1048576] [131072] [1] : memref<4194304xbf16> to memref<131072xbf16, strided<[1], offset: 1048576>>
        %reinterpret_cast_69 = memref.reinterpret_cast %subview_68 to offset: [0], sizes: [2048, 64], strides: [64, 1] : memref<131072xbf16, strided<[1], offset: 1048576>> to memref<2048x64xbf16>
        aiex.run @sequence(%reinterpret_cast_63, %reinterpret_cast_65, %reinterpret_cast_67, %reinterpret_cast_69) : (memref<2048x64xbf16>, memref<64x2048xbf16>, memref<2048x64xbf16>, memref<2048x64xbf16>)
        %subview_70 = memref.subview %arg0[1179648] [131072] [1] : memref<12582912xbf16> to memref<131072xbf16, strided<[1], offset: 1179648>>
        %reinterpret_cast_71 = memref.reinterpret_cast %subview_70 to offset: [0], sizes: [2048, 64], strides: [64, 1] : memref<131072xbf16, strided<[1], offset: 1179648>> to memref<2048x64xbf16>
        %subview_72 = memref.subview %arg0[5373952] [131072] [1] : memref<12582912xbf16> to memref<131072xbf16, strided<[1], offset: 5373952>>
        %reinterpret_cast_73 = memref.reinterpret_cast %subview_72 to offset: [0], sizes: [64, 2048], strides: [2048, 1] : memref<131072xbf16, strided<[1], offset: 5373952>> to memref<64x2048xbf16>
        %subview_74 = memref.subview %arg0[9568256] [131072] [1] : memref<12582912xbf16> to memref<131072xbf16, strided<[1], offset: 9568256>>
        %reinterpret_cast_75 = memref.reinterpret_cast %subview_74 to offset: [0], sizes: [2048, 64], strides: [64, 1] : memref<131072xbf16, strided<[1], offset: 9568256>> to memref<2048x64xbf16>
        %subview_76 = memref.subview %arg1[1179648] [131072] [1] : memref<4194304xbf16> to memref<131072xbf16, strided<[1], offset: 1179648>>
        %reinterpret_cast_77 = memref.reinterpret_cast %subview_76 to offset: [0], sizes: [2048, 64], strides: [64, 1] : memref<131072xbf16, strided<[1], offset: 1179648>> to memref<2048x64xbf16>
        aiex.run @sequence(%reinterpret_cast_71, %reinterpret_cast_73, %reinterpret_cast_75, %reinterpret_cast_77) : (memref<2048x64xbf16>, memref<64x2048xbf16>, memref<2048x64xbf16>, memref<2048x64xbf16>)
        %subview_78 = memref.subview %arg0[1310720] [131072] [1] : memref<12582912xbf16> to memref<131072xbf16, strided<[1], offset: 1310720>>
        %reinterpret_cast_79 = memref.reinterpret_cast %subview_78 to offset: [0], sizes: [2048, 64], strides: [64, 1] : memref<131072xbf16, strided<[1], offset: 1310720>> to memref<2048x64xbf16>
        %subview_80 = memref.subview %arg0[5505024] [131072] [1] : memref<12582912xbf16> to memref<131072xbf16, strided<[1], offset: 5505024>>
        %reinterpret_cast_81 = memref.reinterpret_cast %subview_80 to offset: [0], sizes: [64, 2048], strides: [2048, 1] : memref<131072xbf16, strided<[1], offset: 5505024>> to memref<64x2048xbf16>
        %subview_82 = memref.subview %arg0[9699328] [131072] [1] : memref<12582912xbf16> to memref<131072xbf16, strided<[1], offset: 9699328>>
        %reinterpret_cast_83 = memref.reinterpret_cast %subview_82 to offset: [0], sizes: [2048, 64], strides: [64, 1] : memref<131072xbf16, strided<[1], offset: 9699328>> to memref<2048x64xbf16>
        %subview_84 = memref.subview %arg1[1310720] [131072] [1] : memref<4194304xbf16> to memref<131072xbf16, strided<[1], offset: 1310720>>
        %reinterpret_cast_85 = memref.reinterpret_cast %subview_84 to offset: [0], sizes: [2048, 64], strides: [64, 1] : memref<131072xbf16, strided<[1], offset: 1310720>> to memref<2048x64xbf16>
        aiex.run @sequence(%reinterpret_cast_79, %reinterpret_cast_81, %reinterpret_cast_83, %reinterpret_cast_85) : (memref<2048x64xbf16>, memref<64x2048xbf16>, memref<2048x64xbf16>, memref<2048x64xbf16>)
        %subview_86 = memref.subview %arg0[1441792] [131072] [1] : memref<12582912xbf16> to memref<131072xbf16, strided<[1], offset: 1441792>>
        %reinterpret_cast_87 = memref.reinterpret_cast %subview_86 to offset: [0], sizes: [2048, 64], strides: [64, 1] : memref<131072xbf16, strided<[1], offset: 1441792>> to memref<2048x64xbf16>
        %subview_88 = memref.subview %arg0[5636096] [131072] [1] : memref<12582912xbf16> to memref<131072xbf16, strided<[1], offset: 5636096>>
        %reinterpret_cast_89 = memref.reinterpret_cast %subview_88 to offset: [0], sizes: [64, 2048], strides: [2048, 1] : memref<131072xbf16, strided<[1], offset: 5636096>> to memref<64x2048xbf16>
        %subview_90 = memref.subview %arg0[9830400] [131072] [1] : memref<12582912xbf16> to memref<131072xbf16, strided<[1], offset: 9830400>>
        %reinterpret_cast_91 = memref.reinterpret_cast %subview_90 to offset: [0], sizes: [2048, 64], strides: [64, 1] : memref<131072xbf16, strided<[1], offset: 9830400>> to memref<2048x64xbf16>
        %subview_92 = memref.subview %arg1[1441792] [131072] [1] : memref<4194304xbf16> to memref<131072xbf16, strided<[1], offset: 1441792>>
        %reinterpret_cast_93 = memref.reinterpret_cast %subview_92 to offset: [0], sizes: [2048, 64], strides: [64, 1] : memref<131072xbf16, strided<[1], offset: 1441792>> to memref<2048x64xbf16>
        aiex.run @sequence(%reinterpret_cast_87, %reinterpret_cast_89, %reinterpret_cast_91, %reinterpret_cast_93) : (memref<2048x64xbf16>, memref<64x2048xbf16>, memref<2048x64xbf16>, memref<2048x64xbf16>)
        %subview_94 = memref.subview %arg0[1572864] [131072] [1] : memref<12582912xbf16> to memref<131072xbf16, strided<[1], offset: 1572864>>
        %reinterpret_cast_95 = memref.reinterpret_cast %subview_94 to offset: [0], sizes: [2048, 64], strides: [64, 1] : memref<131072xbf16, strided<[1], offset: 1572864>> to memref<2048x64xbf16>
        %subview_96 = memref.subview %arg0[5767168] [131072] [1] : memref<12582912xbf16> to memref<131072xbf16, strided<[1], offset: 5767168>>
        %reinterpret_cast_97 = memref.reinterpret_cast %subview_96 to offset: [0], sizes: [64, 2048], strides: [2048, 1] : memref<131072xbf16, strided<[1], offset: 5767168>> to memref<64x2048xbf16>
        %subview_98 = memref.subview %arg0[9961472] [131072] [1] : memref<12582912xbf16> to memref<131072xbf16, strided<[1], offset: 9961472>>
        %reinterpret_cast_99 = memref.reinterpret_cast %subview_98 to offset: [0], sizes: [2048, 64], strides: [64, 1] : memref<131072xbf16, strided<[1], offset: 9961472>> to memref<2048x64xbf16>
        %subview_100 = memref.subview %arg1[1572864] [131072] [1] : memref<4194304xbf16> to memref<131072xbf16, strided<[1], offset: 1572864>>
        %reinterpret_cast_101 = memref.reinterpret_cast %subview_100 to offset: [0], sizes: [2048, 64], strides: [64, 1] : memref<131072xbf16, strided<[1], offset: 1572864>> to memref<2048x64xbf16>
        aiex.run @sequence(%reinterpret_cast_95, %reinterpret_cast_97, %reinterpret_cast_99, %reinterpret_cast_101) : (memref<2048x64xbf16>, memref<64x2048xbf16>, memref<2048x64xbf16>, memref<2048x64xbf16>)
        %subview_102 = memref.subview %arg0[1703936] [131072] [1] : memref<12582912xbf16> to memref<131072xbf16, strided<[1], offset: 1703936>>
        %reinterpret_cast_103 = memref.reinterpret_cast %subview_102 to offset: [0], sizes: [2048, 64], strides: [64, 1] : memref<131072xbf16, strided<[1], offset: 1703936>> to memref<2048x64xbf16>
        %subview_104 = memref.subview %arg0[5898240] [131072] [1] : memref<12582912xbf16> to memref<131072xbf16, strided<[1], offset: 5898240>>
        %reinterpret_cast_105 = memref.reinterpret_cast %subview_104 to offset: [0], sizes: [64, 2048], strides: [2048, 1] : memref<131072xbf16, strided<[1], offset: 5898240>> to memref<64x2048xbf16>
        %subview_106 = memref.subview %arg0[10092544] [131072] [1] : memref<12582912xbf16> to memref<131072xbf16, strided<[1], offset: 10092544>>
        %reinterpret_cast_107 = memref.reinterpret_cast %subview_106 to offset: [0], sizes: [2048, 64], strides: [64, 1] : memref<131072xbf16, strided<[1], offset: 10092544>> to memref<2048x64xbf16>
        %subview_108 = memref.subview %arg1[1703936] [131072] [1] : memref<4194304xbf16> to memref<131072xbf16, strided<[1], offset: 1703936>>
        %reinterpret_cast_109 = memref.reinterpret_cast %subview_108 to offset: [0], sizes: [2048, 64], strides: [64, 1] : memref<131072xbf16, strided<[1], offset: 1703936>> to memref<2048x64xbf16>
        aiex.run @sequence(%reinterpret_cast_103, %reinterpret_cast_105, %reinterpret_cast_107, %reinterpret_cast_109) : (memref<2048x64xbf16>, memref<64x2048xbf16>, memref<2048x64xbf16>, memref<2048x64xbf16>)
        %subview_110 = memref.subview %arg0[1835008] [131072] [1] : memref<12582912xbf16> to memref<131072xbf16, strided<[1], offset: 1835008>>
        %reinterpret_cast_111 = memref.reinterpret_cast %subview_110 to offset: [0], sizes: [2048, 64], strides: [64, 1] : memref<131072xbf16, strided<[1], offset: 1835008>> to memref<2048x64xbf16>
        %subview_112 = memref.subview %arg0[6029312] [131072] [1] : memref<12582912xbf16> to memref<131072xbf16, strided<[1], offset: 6029312>>
        %reinterpret_cast_113 = memref.reinterpret_cast %subview_112 to offset: [0], sizes: [64, 2048], strides: [2048, 1] : memref<131072xbf16, strided<[1], offset: 6029312>> to memref<64x2048xbf16>
        %subview_114 = memref.subview %arg0[10223616] [131072] [1] : memref<12582912xbf16> to memref<131072xbf16, strided<[1], offset: 10223616>>
        %reinterpret_cast_115 = memref.reinterpret_cast %subview_114 to offset: [0], sizes: [2048, 64], strides: [64, 1] : memref<131072xbf16, strided<[1], offset: 10223616>> to memref<2048x64xbf16>
        %subview_116 = memref.subview %arg1[1835008] [131072] [1] : memref<4194304xbf16> to memref<131072xbf16, strided<[1], offset: 1835008>>
        %reinterpret_cast_117 = memref.reinterpret_cast %subview_116 to offset: [0], sizes: [2048, 64], strides: [64, 1] : memref<131072xbf16, strided<[1], offset: 1835008>> to memref<2048x64xbf16>
        aiex.run @sequence(%reinterpret_cast_111, %reinterpret_cast_113, %reinterpret_cast_115, %reinterpret_cast_117) : (memref<2048x64xbf16>, memref<64x2048xbf16>, memref<2048x64xbf16>, memref<2048x64xbf16>)
        %subview_118 = memref.subview %arg0[1966080] [131072] [1] : memref<12582912xbf16> to memref<131072xbf16, strided<[1], offset: 1966080>>
        %reinterpret_cast_119 = memref.reinterpret_cast %subview_118 to offset: [0], sizes: [2048, 64], strides: [64, 1] : memref<131072xbf16, strided<[1], offset: 1966080>> to memref<2048x64xbf16>
        %subview_120 = memref.subview %arg0[6160384] [131072] [1] : memref<12582912xbf16> to memref<131072xbf16, strided<[1], offset: 6160384>>
        %reinterpret_cast_121 = memref.reinterpret_cast %subview_120 to offset: [0], sizes: [64, 2048], strides: [2048, 1] : memref<131072xbf16, strided<[1], offset: 6160384>> to memref<64x2048xbf16>
        %subview_122 = memref.subview %arg0[10354688] [131072] [1] : memref<12582912xbf16> to memref<131072xbf16, strided<[1], offset: 10354688>>
        %reinterpret_cast_123 = memref.reinterpret_cast %subview_122 to offset: [0], sizes: [2048, 64], strides: [64, 1] : memref<131072xbf16, strided<[1], offset: 10354688>> to memref<2048x64xbf16>
        %subview_124 = memref.subview %arg1[1966080] [131072] [1] : memref<4194304xbf16> to memref<131072xbf16, strided<[1], offset: 1966080>>
        %reinterpret_cast_125 = memref.reinterpret_cast %subview_124 to offset: [0], sizes: [2048, 64], strides: [64, 1] : memref<131072xbf16, strided<[1], offset: 1966080>> to memref<2048x64xbf16>
        aiex.run @sequence(%reinterpret_cast_119, %reinterpret_cast_121, %reinterpret_cast_123, %reinterpret_cast_125) : (memref<2048x64xbf16>, memref<64x2048xbf16>, memref<2048x64xbf16>, memref<2048x64xbf16>)
        %subview_126 = memref.subview %arg0[2097152] [131072] [1] : memref<12582912xbf16> to memref<131072xbf16, strided<[1], offset: 2097152>>
        %reinterpret_cast_127 = memref.reinterpret_cast %subview_126 to offset: [0], sizes: [2048, 64], strides: [64, 1] : memref<131072xbf16, strided<[1], offset: 2097152>> to memref<2048x64xbf16>
        %subview_128 = memref.subview %arg0[6291456] [131072] [1] : memref<12582912xbf16> to memref<131072xbf16, strided<[1], offset: 6291456>>
        %reinterpret_cast_129 = memref.reinterpret_cast %subview_128 to offset: [0], sizes: [64, 2048], strides: [2048, 1] : memref<131072xbf16, strided<[1], offset: 6291456>> to memref<64x2048xbf16>
        %subview_130 = memref.subview %arg0[10485760] [131072] [1] : memref<12582912xbf16> to memref<131072xbf16, strided<[1], offset: 10485760>>
        %reinterpret_cast_131 = memref.reinterpret_cast %subview_130 to offset: [0], sizes: [2048, 64], strides: [64, 1] : memref<131072xbf16, strided<[1], offset: 10485760>> to memref<2048x64xbf16>
        %subview_132 = memref.subview %arg1[2097152] [131072] [1] : memref<4194304xbf16> to memref<131072xbf16, strided<[1], offset: 2097152>>
        %reinterpret_cast_133 = memref.reinterpret_cast %subview_132 to offset: [0], sizes: [2048, 64], strides: [64, 1] : memref<131072xbf16, strided<[1], offset: 2097152>> to memref<2048x64xbf16>
        aiex.run @sequence(%reinterpret_cast_127, %reinterpret_cast_129, %reinterpret_cast_131, %reinterpret_cast_133) : (memref<2048x64xbf16>, memref<64x2048xbf16>, memref<2048x64xbf16>, memref<2048x64xbf16>)
        %subview_134 = memref.subview %arg0[2228224] [131072] [1] : memref<12582912xbf16> to memref<131072xbf16, strided<[1], offset: 2228224>>
        %reinterpret_cast_135 = memref.reinterpret_cast %subview_134 to offset: [0], sizes: [2048, 64], strides: [64, 1] : memref<131072xbf16, strided<[1], offset: 2228224>> to memref<2048x64xbf16>
        %subview_136 = memref.subview %arg0[6422528] [131072] [1] : memref<12582912xbf16> to memref<131072xbf16, strided<[1], offset: 6422528>>
        %reinterpret_cast_137 = memref.reinterpret_cast %subview_136 to offset: [0], sizes: [64, 2048], strides: [2048, 1] : memref<131072xbf16, strided<[1], offset: 6422528>> to memref<64x2048xbf16>
        %subview_138 = memref.subview %arg0[10616832] [131072] [1] : memref<12582912xbf16> to memref<131072xbf16, strided<[1], offset: 10616832>>
        %reinterpret_cast_139 = memref.reinterpret_cast %subview_138 to offset: [0], sizes: [2048, 64], strides: [64, 1] : memref<131072xbf16, strided<[1], offset: 10616832>> to memref<2048x64xbf16>
        %subview_140 = memref.subview %arg1[2228224] [131072] [1] : memref<4194304xbf16> to memref<131072xbf16, strided<[1], offset: 2228224>>
        %reinterpret_cast_141 = memref.reinterpret_cast %subview_140 to offset: [0], sizes: [2048, 64], strides: [64, 1] : memref<131072xbf16, strided<[1], offset: 2228224>> to memref<2048x64xbf16>
        aiex.run @sequence(%reinterpret_cast_135, %reinterpret_cast_137, %reinterpret_cast_139, %reinterpret_cast_141) : (memref<2048x64xbf16>, memref<64x2048xbf16>, memref<2048x64xbf16>, memref<2048x64xbf16>)
        %subview_142 = memref.subview %arg0[2359296] [131072] [1] : memref<12582912xbf16> to memref<131072xbf16, strided<[1], offset: 2359296>>
        %reinterpret_cast_143 = memref.reinterpret_cast %subview_142 to offset: [0], sizes: [2048, 64], strides: [64, 1] : memref<131072xbf16, strided<[1], offset: 2359296>> to memref<2048x64xbf16>
        %subview_144 = memref.subview %arg0[6553600] [131072] [1] : memref<12582912xbf16> to memref<131072xbf16, strided<[1], offset: 6553600>>
        %reinterpret_cast_145 = memref.reinterpret_cast %subview_144 to offset: [0], sizes: [64, 2048], strides: [2048, 1] : memref<131072xbf16, strided<[1], offset: 6553600>> to memref<64x2048xbf16>
        %subview_146 = memref.subview %arg0[10747904] [131072] [1] : memref<12582912xbf16> to memref<131072xbf16, strided<[1], offset: 10747904>>
        %reinterpret_cast_147 = memref.reinterpret_cast %subview_146 to offset: [0], sizes: [2048, 64], strides: [64, 1] : memref<131072xbf16, strided<[1], offset: 10747904>> to memref<2048x64xbf16>
        %subview_148 = memref.subview %arg1[2359296] [131072] [1] : memref<4194304xbf16> to memref<131072xbf16, strided<[1], offset: 2359296>>
        %reinterpret_cast_149 = memref.reinterpret_cast %subview_148 to offset: [0], sizes: [2048, 64], strides: [64, 1] : memref<131072xbf16, strided<[1], offset: 2359296>> to memref<2048x64xbf16>
        aiex.run @sequence(%reinterpret_cast_143, %reinterpret_cast_145, %reinterpret_cast_147, %reinterpret_cast_149) : (memref<2048x64xbf16>, memref<64x2048xbf16>, memref<2048x64xbf16>, memref<2048x64xbf16>)
        %subview_150 = memref.subview %arg0[2490368] [131072] [1] : memref<12582912xbf16> to memref<131072xbf16, strided<[1], offset: 2490368>>
        %reinterpret_cast_151 = memref.reinterpret_cast %subview_150 to offset: [0], sizes: [2048, 64], strides: [64, 1] : memref<131072xbf16, strided<[1], offset: 2490368>> to memref<2048x64xbf16>
        %subview_152 = memref.subview %arg0[6684672] [131072] [1] : memref<12582912xbf16> to memref<131072xbf16, strided<[1], offset: 6684672>>
        %reinterpret_cast_153 = memref.reinterpret_cast %subview_152 to offset: [0], sizes: [64, 2048], strides: [2048, 1] : memref<131072xbf16, strided<[1], offset: 6684672>> to memref<64x2048xbf16>
        %subview_154 = memref.subview %arg0[10878976] [131072] [1] : memref<12582912xbf16> to memref<131072xbf16, strided<[1], offset: 10878976>>
        %reinterpret_cast_155 = memref.reinterpret_cast %subview_154 to offset: [0], sizes: [2048, 64], strides: [64, 1] : memref<131072xbf16, strided<[1], offset: 10878976>> to memref<2048x64xbf16>
        %subview_156 = memref.subview %arg1[2490368] [131072] [1] : memref<4194304xbf16> to memref<131072xbf16, strided<[1], offset: 2490368>>
        %reinterpret_cast_157 = memref.reinterpret_cast %subview_156 to offset: [0], sizes: [2048, 64], strides: [64, 1] : memref<131072xbf16, strided<[1], offset: 2490368>> to memref<2048x64xbf16>
        aiex.run @sequence(%reinterpret_cast_151, %reinterpret_cast_153, %reinterpret_cast_155, %reinterpret_cast_157) : (memref<2048x64xbf16>, memref<64x2048xbf16>, memref<2048x64xbf16>, memref<2048x64xbf16>)
        %subview_158 = memref.subview %arg0[2621440] [131072] [1] : memref<12582912xbf16> to memref<131072xbf16, strided<[1], offset: 2621440>>
        %reinterpret_cast_159 = memref.reinterpret_cast %subview_158 to offset: [0], sizes: [2048, 64], strides: [64, 1] : memref<131072xbf16, strided<[1], offset: 2621440>> to memref<2048x64xbf16>
        %subview_160 = memref.subview %arg0[6815744] [131072] [1] : memref<12582912xbf16> to memref<131072xbf16, strided<[1], offset: 6815744>>
        %reinterpret_cast_161 = memref.reinterpret_cast %subview_160 to offset: [0], sizes: [64, 2048], strides: [2048, 1] : memref<131072xbf16, strided<[1], offset: 6815744>> to memref<64x2048xbf16>
        %subview_162 = memref.subview %arg0[11010048] [131072] [1] : memref<12582912xbf16> to memref<131072xbf16, strided<[1], offset: 11010048>>
        %reinterpret_cast_163 = memref.reinterpret_cast %subview_162 to offset: [0], sizes: [2048, 64], strides: [64, 1] : memref<131072xbf16, strided<[1], offset: 11010048>> to memref<2048x64xbf16>
        %subview_164 = memref.subview %arg1[2621440] [131072] [1] : memref<4194304xbf16> to memref<131072xbf16, strided<[1], offset: 2621440>>
        %reinterpret_cast_165 = memref.reinterpret_cast %subview_164 to offset: [0], sizes: [2048, 64], strides: [64, 1] : memref<131072xbf16, strided<[1], offset: 2621440>> to memref<2048x64xbf16>
        aiex.run @sequence(%reinterpret_cast_159, %reinterpret_cast_161, %reinterpret_cast_163, %reinterpret_cast_165) : (memref<2048x64xbf16>, memref<64x2048xbf16>, memref<2048x64xbf16>, memref<2048x64xbf16>)
        %subview_166 = memref.subview %arg0[2752512] [131072] [1] : memref<12582912xbf16> to memref<131072xbf16, strided<[1], offset: 2752512>>
        %reinterpret_cast_167 = memref.reinterpret_cast %subview_166 to offset: [0], sizes: [2048, 64], strides: [64, 1] : memref<131072xbf16, strided<[1], offset: 2752512>> to memref<2048x64xbf16>
        %subview_168 = memref.subview %arg0[6946816] [131072] [1] : memref<12582912xbf16> to memref<131072xbf16, strided<[1], offset: 6946816>>
        %reinterpret_cast_169 = memref.reinterpret_cast %subview_168 to offset: [0], sizes: [64, 2048], strides: [2048, 1] : memref<131072xbf16, strided<[1], offset: 6946816>> to memref<64x2048xbf16>
        %subview_170 = memref.subview %arg0[11141120] [131072] [1] : memref<12582912xbf16> to memref<131072xbf16, strided<[1], offset: 11141120>>
        %reinterpret_cast_171 = memref.reinterpret_cast %subview_170 to offset: [0], sizes: [2048, 64], strides: [64, 1] : memref<131072xbf16, strided<[1], offset: 11141120>> to memref<2048x64xbf16>
        %subview_172 = memref.subview %arg1[2752512] [131072] [1] : memref<4194304xbf16> to memref<131072xbf16, strided<[1], offset: 2752512>>
        %reinterpret_cast_173 = memref.reinterpret_cast %subview_172 to offset: [0], sizes: [2048, 64], strides: [64, 1] : memref<131072xbf16, strided<[1], offset: 2752512>> to memref<2048x64xbf16>
        aiex.run @sequence(%reinterpret_cast_167, %reinterpret_cast_169, %reinterpret_cast_171, %reinterpret_cast_173) : (memref<2048x64xbf16>, memref<64x2048xbf16>, memref<2048x64xbf16>, memref<2048x64xbf16>)
        %subview_174 = memref.subview %arg0[2883584] [131072] [1] : memref<12582912xbf16> to memref<131072xbf16, strided<[1], offset: 2883584>>
        %reinterpret_cast_175 = memref.reinterpret_cast %subview_174 to offset: [0], sizes: [2048, 64], strides: [64, 1] : memref<131072xbf16, strided<[1], offset: 2883584>> to memref<2048x64xbf16>
        %subview_176 = memref.subview %arg0[7077888] [131072] [1] : memref<12582912xbf16> to memref<131072xbf16, strided<[1], offset: 7077888>>
        %reinterpret_cast_177 = memref.reinterpret_cast %subview_176 to offset: [0], sizes: [64, 2048], strides: [2048, 1] : memref<131072xbf16, strided<[1], offset: 7077888>> to memref<64x2048xbf16>
        %subview_178 = memref.subview %arg0[11272192] [131072] [1] : memref<12582912xbf16> to memref<131072xbf16, strided<[1], offset: 11272192>>
        %reinterpret_cast_179 = memref.reinterpret_cast %subview_178 to offset: [0], sizes: [2048, 64], strides: [64, 1] : memref<131072xbf16, strided<[1], offset: 11272192>> to memref<2048x64xbf16>
        %subview_180 = memref.subview %arg1[2883584] [131072] [1] : memref<4194304xbf16> to memref<131072xbf16, strided<[1], offset: 2883584>>
        %reinterpret_cast_181 = memref.reinterpret_cast %subview_180 to offset: [0], sizes: [2048, 64], strides: [64, 1] : memref<131072xbf16, strided<[1], offset: 2883584>> to memref<2048x64xbf16>
        aiex.run @sequence(%reinterpret_cast_175, %reinterpret_cast_177, %reinterpret_cast_179, %reinterpret_cast_181) : (memref<2048x64xbf16>, memref<64x2048xbf16>, memref<2048x64xbf16>, memref<2048x64xbf16>)
        %subview_182 = memref.subview %arg0[3014656] [131072] [1] : memref<12582912xbf16> to memref<131072xbf16, strided<[1], offset: 3014656>>
        %reinterpret_cast_183 = memref.reinterpret_cast %subview_182 to offset: [0], sizes: [2048, 64], strides: [64, 1] : memref<131072xbf16, strided<[1], offset: 3014656>> to memref<2048x64xbf16>
        %subview_184 = memref.subview %arg0[7208960] [131072] [1] : memref<12582912xbf16> to memref<131072xbf16, strided<[1], offset: 7208960>>
        %reinterpret_cast_185 = memref.reinterpret_cast %subview_184 to offset: [0], sizes: [64, 2048], strides: [2048, 1] : memref<131072xbf16, strided<[1], offset: 7208960>> to memref<64x2048xbf16>
        %subview_186 = memref.subview %arg0[11403264] [131072] [1] : memref<12582912xbf16> to memref<131072xbf16, strided<[1], offset: 11403264>>
        %reinterpret_cast_187 = memref.reinterpret_cast %subview_186 to offset: [0], sizes: [2048, 64], strides: [64, 1] : memref<131072xbf16, strided<[1], offset: 11403264>> to memref<2048x64xbf16>
        %subview_188 = memref.subview %arg1[3014656] [131072] [1] : memref<4194304xbf16> to memref<131072xbf16, strided<[1], offset: 3014656>>
        %reinterpret_cast_189 = memref.reinterpret_cast %subview_188 to offset: [0], sizes: [2048, 64], strides: [64, 1] : memref<131072xbf16, strided<[1], offset: 3014656>> to memref<2048x64xbf16>
        aiex.run @sequence(%reinterpret_cast_183, %reinterpret_cast_185, %reinterpret_cast_187, %reinterpret_cast_189) : (memref<2048x64xbf16>, memref<64x2048xbf16>, memref<2048x64xbf16>, memref<2048x64xbf16>)
        %subview_190 = memref.subview %arg0[3145728] [131072] [1] : memref<12582912xbf16> to memref<131072xbf16, strided<[1], offset: 3145728>>
        %reinterpret_cast_191 = memref.reinterpret_cast %subview_190 to offset: [0], sizes: [2048, 64], strides: [64, 1] : memref<131072xbf16, strided<[1], offset: 3145728>> to memref<2048x64xbf16>
        %subview_192 = memref.subview %arg0[7340032] [131072] [1] : memref<12582912xbf16> to memref<131072xbf16, strided<[1], offset: 7340032>>
        %reinterpret_cast_193 = memref.reinterpret_cast %subview_192 to offset: [0], sizes: [64, 2048], strides: [2048, 1] : memref<131072xbf16, strided<[1], offset: 7340032>> to memref<64x2048xbf16>
        %subview_194 = memref.subview %arg0[11534336] [131072] [1] : memref<12582912xbf16> to memref<131072xbf16, strided<[1], offset: 11534336>>
        %reinterpret_cast_195 = memref.reinterpret_cast %subview_194 to offset: [0], sizes: [2048, 64], strides: [64, 1] : memref<131072xbf16, strided<[1], offset: 11534336>> to memref<2048x64xbf16>
        %subview_196 = memref.subview %arg1[3145728] [131072] [1] : memref<4194304xbf16> to memref<131072xbf16, strided<[1], offset: 3145728>>
        %reinterpret_cast_197 = memref.reinterpret_cast %subview_196 to offset: [0], sizes: [2048, 64], strides: [64, 1] : memref<131072xbf16, strided<[1], offset: 3145728>> to memref<2048x64xbf16>
        aiex.run @sequence(%reinterpret_cast_191, %reinterpret_cast_193, %reinterpret_cast_195, %reinterpret_cast_197) : (memref<2048x64xbf16>, memref<64x2048xbf16>, memref<2048x64xbf16>, memref<2048x64xbf16>)
        %subview_198 = memref.subview %arg0[3276800] [131072] [1] : memref<12582912xbf16> to memref<131072xbf16, strided<[1], offset: 3276800>>
        %reinterpret_cast_199 = memref.reinterpret_cast %subview_198 to offset: [0], sizes: [2048, 64], strides: [64, 1] : memref<131072xbf16, strided<[1], offset: 3276800>> to memref<2048x64xbf16>
        %subview_200 = memref.subview %arg0[7471104] [131072] [1] : memref<12582912xbf16> to memref<131072xbf16, strided<[1], offset: 7471104>>
        %reinterpret_cast_201 = memref.reinterpret_cast %subview_200 to offset: [0], sizes: [64, 2048], strides: [2048, 1] : memref<131072xbf16, strided<[1], offset: 7471104>> to memref<64x2048xbf16>
        %subview_202 = memref.subview %arg0[11665408] [131072] [1] : memref<12582912xbf16> to memref<131072xbf16, strided<[1], offset: 11665408>>
        %reinterpret_cast_203 = memref.reinterpret_cast %subview_202 to offset: [0], sizes: [2048, 64], strides: [64, 1] : memref<131072xbf16, strided<[1], offset: 11665408>> to memref<2048x64xbf16>
        %subview_204 = memref.subview %arg1[3276800] [131072] [1] : memref<4194304xbf16> to memref<131072xbf16, strided<[1], offset: 3276800>>
        %reinterpret_cast_205 = memref.reinterpret_cast %subview_204 to offset: [0], sizes: [2048, 64], strides: [64, 1] : memref<131072xbf16, strided<[1], offset: 3276800>> to memref<2048x64xbf16>
        aiex.run @sequence(%reinterpret_cast_199, %reinterpret_cast_201, %reinterpret_cast_203, %reinterpret_cast_205) : (memref<2048x64xbf16>, memref<64x2048xbf16>, memref<2048x64xbf16>, memref<2048x64xbf16>)
        %subview_206 = memref.subview %arg0[3407872] [131072] [1] : memref<12582912xbf16> to memref<131072xbf16, strided<[1], offset: 3407872>>
        %reinterpret_cast_207 = memref.reinterpret_cast %subview_206 to offset: [0], sizes: [2048, 64], strides: [64, 1] : memref<131072xbf16, strided<[1], offset: 3407872>> to memref<2048x64xbf16>
        %subview_208 = memref.subview %arg0[7602176] [131072] [1] : memref<12582912xbf16> to memref<131072xbf16, strided<[1], offset: 7602176>>
        %reinterpret_cast_209 = memref.reinterpret_cast %subview_208 to offset: [0], sizes: [64, 2048], strides: [2048, 1] : memref<131072xbf16, strided<[1], offset: 7602176>> to memref<64x2048xbf16>
        %subview_210 = memref.subview %arg0[11796480] [131072] [1] : memref<12582912xbf16> to memref<131072xbf16, strided<[1], offset: 11796480>>
        %reinterpret_cast_211 = memref.reinterpret_cast %subview_210 to offset: [0], sizes: [2048, 64], strides: [64, 1] : memref<131072xbf16, strided<[1], offset: 11796480>> to memref<2048x64xbf16>
        %subview_212 = memref.subview %arg1[3407872] [131072] [1] : memref<4194304xbf16> to memref<131072xbf16, strided<[1], offset: 3407872>>
        %reinterpret_cast_213 = memref.reinterpret_cast %subview_212 to offset: [0], sizes: [2048, 64], strides: [64, 1] : memref<131072xbf16, strided<[1], offset: 3407872>> to memref<2048x64xbf16>
        aiex.run @sequence(%reinterpret_cast_207, %reinterpret_cast_209, %reinterpret_cast_211, %reinterpret_cast_213) : (memref<2048x64xbf16>, memref<64x2048xbf16>, memref<2048x64xbf16>, memref<2048x64xbf16>)
        %subview_214 = memref.subview %arg0[3538944] [131072] [1] : memref<12582912xbf16> to memref<131072xbf16, strided<[1], offset: 3538944>>
        %reinterpret_cast_215 = memref.reinterpret_cast %subview_214 to offset: [0], sizes: [2048, 64], strides: [64, 1] : memref<131072xbf16, strided<[1], offset: 3538944>> to memref<2048x64xbf16>
        %subview_216 = memref.subview %arg0[7733248] [131072] [1] : memref<12582912xbf16> to memref<131072xbf16, strided<[1], offset: 7733248>>
        %reinterpret_cast_217 = memref.reinterpret_cast %subview_216 to offset: [0], sizes: [64, 2048], strides: [2048, 1] : memref<131072xbf16, strided<[1], offset: 7733248>> to memref<64x2048xbf16>
        %subview_218 = memref.subview %arg0[11927552] [131072] [1] : memref<12582912xbf16> to memref<131072xbf16, strided<[1], offset: 11927552>>
        %reinterpret_cast_219 = memref.reinterpret_cast %subview_218 to offset: [0], sizes: [2048, 64], strides: [64, 1] : memref<131072xbf16, strided<[1], offset: 11927552>> to memref<2048x64xbf16>
        %subview_220 = memref.subview %arg1[3538944] [131072] [1] : memref<4194304xbf16> to memref<131072xbf16, strided<[1], offset: 3538944>>
        %reinterpret_cast_221 = memref.reinterpret_cast %subview_220 to offset: [0], sizes: [2048, 64], strides: [64, 1] : memref<131072xbf16, strided<[1], offset: 3538944>> to memref<2048x64xbf16>
        aiex.run @sequence(%reinterpret_cast_215, %reinterpret_cast_217, %reinterpret_cast_219, %reinterpret_cast_221) : (memref<2048x64xbf16>, memref<64x2048xbf16>, memref<2048x64xbf16>, memref<2048x64xbf16>)
        %subview_222 = memref.subview %arg0[3670016] [131072] [1] : memref<12582912xbf16> to memref<131072xbf16, strided<[1], offset: 3670016>>
        %reinterpret_cast_223 = memref.reinterpret_cast %subview_222 to offset: [0], sizes: [2048, 64], strides: [64, 1] : memref<131072xbf16, strided<[1], offset: 3670016>> to memref<2048x64xbf16>
        %subview_224 = memref.subview %arg0[7864320] [131072] [1] : memref<12582912xbf16> to memref<131072xbf16, strided<[1], offset: 7864320>>
        %reinterpret_cast_225 = memref.reinterpret_cast %subview_224 to offset: [0], sizes: [64, 2048], strides: [2048, 1] : memref<131072xbf16, strided<[1], offset: 7864320>> to memref<64x2048xbf16>
        %subview_226 = memref.subview %arg0[12058624] [131072] [1] : memref<12582912xbf16> to memref<131072xbf16, strided<[1], offset: 12058624>>
        %reinterpret_cast_227 = memref.reinterpret_cast %subview_226 to offset: [0], sizes: [2048, 64], strides: [64, 1] : memref<131072xbf16, strided<[1], offset: 12058624>> to memref<2048x64xbf16>
        %subview_228 = memref.subview %arg1[3670016] [131072] [1] : memref<4194304xbf16> to memref<131072xbf16, strided<[1], offset: 3670016>>
        %reinterpret_cast_229 = memref.reinterpret_cast %subview_228 to offset: [0], sizes: [2048, 64], strides: [64, 1] : memref<131072xbf16, strided<[1], offset: 3670016>> to memref<2048x64xbf16>
        aiex.run @sequence(%reinterpret_cast_223, %reinterpret_cast_225, %reinterpret_cast_227, %reinterpret_cast_229) : (memref<2048x64xbf16>, memref<64x2048xbf16>, memref<2048x64xbf16>, memref<2048x64xbf16>)
        %subview_230 = memref.subview %arg0[3801088] [131072] [1] : memref<12582912xbf16> to memref<131072xbf16, strided<[1], offset: 3801088>>
        %reinterpret_cast_231 = memref.reinterpret_cast %subview_230 to offset: [0], sizes: [2048, 64], strides: [64, 1] : memref<131072xbf16, strided<[1], offset: 3801088>> to memref<2048x64xbf16>
        %subview_232 = memref.subview %arg0[7995392] [131072] [1] : memref<12582912xbf16> to memref<131072xbf16, strided<[1], offset: 7995392>>
        %reinterpret_cast_233 = memref.reinterpret_cast %subview_232 to offset: [0], sizes: [64, 2048], strides: [2048, 1] : memref<131072xbf16, strided<[1], offset: 7995392>> to memref<64x2048xbf16>
        %subview_234 = memref.subview %arg0[12189696] [131072] [1] : memref<12582912xbf16> to memref<131072xbf16, strided<[1], offset: 12189696>>
        %reinterpret_cast_235 = memref.reinterpret_cast %subview_234 to offset: [0], sizes: [2048, 64], strides: [64, 1] : memref<131072xbf16, strided<[1], offset: 12189696>> to memref<2048x64xbf16>
        %subview_236 = memref.subview %arg1[3801088] [131072] [1] : memref<4194304xbf16> to memref<131072xbf16, strided<[1], offset: 3801088>>
        %reinterpret_cast_237 = memref.reinterpret_cast %subview_236 to offset: [0], sizes: [2048, 64], strides: [64, 1] : memref<131072xbf16, strided<[1], offset: 3801088>> to memref<2048x64xbf16>
        aiex.run @sequence(%reinterpret_cast_231, %reinterpret_cast_233, %reinterpret_cast_235, %reinterpret_cast_237) : (memref<2048x64xbf16>, memref<64x2048xbf16>, memref<2048x64xbf16>, memref<2048x64xbf16>)
        %subview_238 = memref.subview %arg0[3932160] [131072] [1] : memref<12582912xbf16> to memref<131072xbf16, strided<[1], offset: 3932160>>
        %reinterpret_cast_239 = memref.reinterpret_cast %subview_238 to offset: [0], sizes: [2048, 64], strides: [64, 1] : memref<131072xbf16, strided<[1], offset: 3932160>> to memref<2048x64xbf16>
        %subview_240 = memref.subview %arg0[8126464] [131072] [1] : memref<12582912xbf16> to memref<131072xbf16, strided<[1], offset: 8126464>>
        %reinterpret_cast_241 = memref.reinterpret_cast %subview_240 to offset: [0], sizes: [64, 2048], strides: [2048, 1] : memref<131072xbf16, strided<[1], offset: 8126464>> to memref<64x2048xbf16>
        %subview_242 = memref.subview %arg0[12320768] [131072] [1] : memref<12582912xbf16> to memref<131072xbf16, strided<[1], offset: 12320768>>
        %reinterpret_cast_243 = memref.reinterpret_cast %subview_242 to offset: [0], sizes: [2048, 64], strides: [64, 1] : memref<131072xbf16, strided<[1], offset: 12320768>> to memref<2048x64xbf16>
        %subview_244 = memref.subview %arg1[3932160] [131072] [1] : memref<4194304xbf16> to memref<131072xbf16, strided<[1], offset: 3932160>>
        %reinterpret_cast_245 = memref.reinterpret_cast %subview_244 to offset: [0], sizes: [2048, 64], strides: [64, 1] : memref<131072xbf16, strided<[1], offset: 3932160>> to memref<2048x64xbf16>
        aiex.run @sequence(%reinterpret_cast_239, %reinterpret_cast_241, %reinterpret_cast_243, %reinterpret_cast_245) : (memref<2048x64xbf16>, memref<64x2048xbf16>, memref<2048x64xbf16>, memref<2048x64xbf16>)
        %subview_246 = memref.subview %arg0[4063232] [131072] [1] : memref<12582912xbf16> to memref<131072xbf16, strided<[1], offset: 4063232>>
        %reinterpret_cast_247 = memref.reinterpret_cast %subview_246 to offset: [0], sizes: [2048, 64], strides: [64, 1] : memref<131072xbf16, strided<[1], offset: 4063232>> to memref<2048x64xbf16>
        %subview_248 = memref.subview %arg0[8257536] [131072] [1] : memref<12582912xbf16> to memref<131072xbf16, strided<[1], offset: 8257536>>
        %reinterpret_cast_249 = memref.reinterpret_cast %subview_248 to offset: [0], sizes: [64, 2048], strides: [2048, 1] : memref<131072xbf16, strided<[1], offset: 8257536>> to memref<64x2048xbf16>
        %subview_250 = memref.subview %arg0[12451840] [131072] [1] : memref<12582912xbf16> to memref<131072xbf16, strided<[1], offset: 12451840>>
        %reinterpret_cast_251 = memref.reinterpret_cast %subview_250 to offset: [0], sizes: [2048, 64], strides: [64, 1] : memref<131072xbf16, strided<[1], offset: 12451840>> to memref<2048x64xbf16>
        %subview_252 = memref.subview %arg1[4063232] [131072] [1] : memref<4194304xbf16> to memref<131072xbf16, strided<[1], offset: 4063232>>
        %reinterpret_cast_253 = memref.reinterpret_cast %subview_252 to offset: [0], sizes: [2048, 64], strides: [64, 1] : memref<131072xbf16, strided<[1], offset: 4063232>> to memref<2048x64xbf16>
        aiex.run @sequence(%reinterpret_cast_247, %reinterpret_cast_249, %reinterpret_cast_251, %reinterpret_cast_253) : (memref<2048x64xbf16>, memref<64x2048xbf16>, memref<2048x64xbf16>, memref<2048x64xbf16>)
      }
      aiex.configure @reset_device {
      }
    }
  }
}
