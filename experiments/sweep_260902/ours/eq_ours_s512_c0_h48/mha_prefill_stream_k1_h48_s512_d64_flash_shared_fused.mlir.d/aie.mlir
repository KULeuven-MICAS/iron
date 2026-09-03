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
    aie.runtime_sequence(%arg0: memref<512x64xbf16>, %arg1: memref<64x512xbf16>, %arg2: memref<512x64xbf16>, %arg3: memref<512x64xbf16>) {
      %0 = aiex.dma_configure_task_for @of_0_mem_0 {
        aie.dma_bd(%arg0 : memref<512x64xbf16> offset = 0 len = 4096 sizes = [1, 1, 64, 64] strides = [0, 0, 64, 1])
        aie.end
      } {issue_token = true, iteration_t = 0 : index}
      aiex.dma_start_task(%0)
      %1 = aiex.dma_configure_task_for @of_0_mem_1 {
        aie.dma_bd(%arg0 : memref<512x64xbf16> offset = 4096 len = 4096 sizes = [1, 1, 64, 64] strides = [0, 0, 64, 1])
        aie.end
      } {issue_token = true, iteration_t = 0 : index}
      aiex.dma_start_task(%1)
      %2 = aiex.dma_configure_task_for @of_0_mem_2 {
        aie.dma_bd(%arg0 : memref<512x64xbf16> offset = 8192 len = 4096 sizes = [1, 1, 64, 64] strides = [0, 0, 64, 1])
        aie.end
      } {issue_token = true, iteration_t = 0 : index}
      aiex.dma_start_task(%2)
      %3 = aiex.dma_configure_task_for @of_0_mem_3 {
        aie.dma_bd(%arg0 : memref<512x64xbf16> offset = 12288 len = 4096 sizes = [1, 1, 64, 64] strides = [0, 0, 64, 1])
        aie.end
      } {issue_token = true, iteration_t = 0 : index}
      aiex.dma_start_task(%3)
      %4 = aiex.dma_configure_task_for @of_0_mem_4 {
        aie.dma_bd(%arg0 : memref<512x64xbf16> offset = 16384 len = 4096 sizes = [1, 1, 64, 64] strides = [0, 0, 64, 1])
        aie.end
      } {issue_token = true, iteration_t = 0 : index}
      aiex.dma_start_task(%4)
      %5 = aiex.dma_configure_task_for @of_0_mem_5 {
        aie.dma_bd(%arg0 : memref<512x64xbf16> offset = 20480 len = 4096 sizes = [1, 1, 64, 64] strides = [0, 0, 64, 1])
        aie.end
      } {issue_token = true, iteration_t = 0 : index}
      aiex.dma_start_task(%5)
      %6 = aiex.dma_configure_task_for @of_0_mem_6 {
        aie.dma_bd(%arg0 : memref<512x64xbf16> offset = 24576 len = 4096 sizes = [1, 1, 64, 64] strides = [0, 0, 64, 1])
        aie.end
      } {issue_token = true, iteration_t = 0 : index}
      aiex.dma_start_task(%6)
      %7 = aiex.dma_configure_task_for @of_0_mem_7 {
        aie.dma_bd(%arg0 : memref<512x64xbf16> offset = 28672 len = 4096 sizes = [1, 1, 64, 64] strides = [0, 0, 64, 1])
        aie.end
      } {issue_token = true, iteration_t = 0 : index}
      aiex.dma_start_task(%7)
      %8 = aiex.dma_configure_task_for @of_1_mem {
        aie.dma_bd(%arg1 : memref<64x512xbf16> offset = 0 len = 32768 sizes = [1, 8, 64, 64] strides = [0, 64, 512, 1])
        aie.end
      } {issue_token = true, iteration_t = 0 : index}
      aiex.dma_start_task(%8)
      %9 = aiex.dma_configure_task_for @of_2_mem {
        aie.dma_bd(%arg2 : memref<512x64xbf16> offset = 0 len = 32768 sizes = [1, 1, 128, 256] strides = [0, 0, 256, 1])
        aie.end
      } {issue_token = true, iteration_t = 0 : index}
      aiex.dma_start_task(%9)
      %10 = aiex.dma_configure_task_for @of_11_mem_0 {
        aie.dma_bd(%arg3 : memref<512x64xbf16> offset = 0 len = 4096 sizes = [1, 1, 64, 64] strides = [0, 0, 64, 1])
        aie.end
      } {issue_token = true, iteration_t = 0 : index}
      aiex.dma_start_task(%10)
      %11 = aiex.dma_configure_task_for @of_11_mem_1 {
        aie.dma_bd(%arg3 : memref<512x64xbf16> offset = 4096 len = 4096 sizes = [1, 1, 64, 64] strides = [0, 0, 64, 1])
        aie.end
      } {issue_token = true, iteration_t = 0 : index}
      aiex.dma_start_task(%11)
      %12 = aiex.dma_configure_task_for @of_11_mem_2 {
        aie.dma_bd(%arg3 : memref<512x64xbf16> offset = 8192 len = 4096 sizes = [1, 1, 64, 64] strides = [0, 0, 64, 1])
        aie.end
      } {issue_token = true, iteration_t = 0 : index}
      aiex.dma_start_task(%12)
      %13 = aiex.dma_configure_task_for @of_11_mem_3 {
        aie.dma_bd(%arg3 : memref<512x64xbf16> offset = 12288 len = 4096 sizes = [1, 1, 64, 64] strides = [0, 0, 64, 1])
        aie.end
      } {issue_token = true, iteration_t = 0 : index}
      aiex.dma_start_task(%13)
      %14 = aiex.dma_configure_task_for @of_11_mem_4 {
        aie.dma_bd(%arg3 : memref<512x64xbf16> offset = 16384 len = 4096 sizes = [1, 1, 64, 64] strides = [0, 0, 64, 1])
        aie.end
      } {issue_token = true, iteration_t = 0 : index}
      aiex.dma_start_task(%14)
      %15 = aiex.dma_configure_task_for @of_11_mem_5 {
        aie.dma_bd(%arg3 : memref<512x64xbf16> offset = 20480 len = 4096 sizes = [1, 1, 64, 64] strides = [0, 0, 64, 1])
        aie.end
      } {issue_token = true, iteration_t = 0 : index}
      aiex.dma_start_task(%15)
      %16 = aiex.dma_configure_task_for @of_11_mem_6 {
        aie.dma_bd(%arg3 : memref<512x64xbf16> offset = 24576 len = 4096 sizes = [1, 1, 64, 64] strides = [0, 0, 64, 1])
        aie.end
      } {issue_token = true, iteration_t = 0 : index}
      aiex.dma_start_task(%16)
      %17 = aiex.dma_configure_task_for @of_11_mem_7 {
        aie.dma_bd(%arg3 : memref<512x64xbf16> offset = 28672 len = 4096 sizes = [1, 1, 64, 64] strides = [0, 0, 64, 1])
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
        %0 = aie.objectfifo.acquire @of_3_unicast_0_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
        %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c8 = arith.constant 8 : index
        scf.for %arg1 = %c0_0 to %c8 step %c1_1 {
          %2 = aie.objectfifo.acquire @of_6_unicast_0(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
          %3 = aie.objectfifo.subview.access %2[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
          func.call @op0_zero_bf16_64_64_64(%3) : (memref<64x64xbf16>) -> ()
          %4 = aie.objectfifo.acquire @of_4_broadcast_0_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
          %5 = aie.objectfifo.subview.access %4[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
          %6 = arith.index_cast %arg1 : index to i32
          %c1_i32 = arith.constant 1 : i32
          %7 = arith.muli %6, %c1_i32 : i32
          %c0_i32 = arith.constant 0 : i32
          %8 = arith.addi %c0_i32, %7 : i32
          %c0_i32_2 = arith.constant 0 : i32
          %9 = arith.cmpi sle, %8, %c0_i32_2 : i32
          scf.if %9 {
            func.call @op0_matmul_bf16_bf16_64_64_64(%1, %5, %3) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>) -> ()
          }
          aie.objectfifo.release @of_4_broadcast_0_0(Consume, 1)
          aie.objectfifo.release @of_6_unicast_0(Produce, 1)
        }
        aie.objectfifo.release @of_3_unicast_0_0(Consume, 1)
      }
      aie.end
    } {link_with = "op0_mm_64_64_64.o"}
    %core_1_2 = aie.core(%tile_1_2) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %0 = aie.objectfifo.acquire @of_3_unicast_1_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
        %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c8 = arith.constant 8 : index
        scf.for %arg1 = %c0_0 to %c8 step %c1_1 {
          %2 = aie.objectfifo.acquire @of_6_unicast_1(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
          %3 = aie.objectfifo.subview.access %2[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
          func.call @op0_zero_bf16_64_64_64(%3) : (memref<64x64xbf16>) -> ()
          %4 = aie.objectfifo.acquire @of_4_broadcast_0_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
          %5 = aie.objectfifo.subview.access %4[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
          %6 = arith.index_cast %arg1 : index to i32
          %c1_i32 = arith.constant 1 : i32
          %7 = arith.muli %6, %c1_i32 : i32
          %c0_i32 = arith.constant 0 : i32
          %8 = arith.addi %c0_i32, %7 : i32
          %c1_i32_2 = arith.constant 1 : i32
          %9 = arith.cmpi sle, %8, %c1_i32_2 : i32
          scf.if %9 {
            func.call @op0_matmul_bf16_bf16_64_64_64(%1, %5, %3) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>) -> ()
          }
          aie.objectfifo.release @of_4_broadcast_0_0(Consume, 1)
          aie.objectfifo.release @of_6_unicast_1(Produce, 1)
        }
        aie.objectfifo.release @of_3_unicast_1_0(Consume, 1)
      }
      aie.end
    } {link_with = "op0_mm_64_64_64.o"}
    %core_2_2 = aie.core(%tile_2_2) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %0 = aie.objectfifo.acquire @of_3_unicast_2_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
        %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c8 = arith.constant 8 : index
        scf.for %arg1 = %c0_0 to %c8 step %c1_1 {
          %2 = aie.objectfifo.acquire @of_6_unicast_2(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
          %3 = aie.objectfifo.subview.access %2[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
          func.call @op0_zero_bf16_64_64_64(%3) : (memref<64x64xbf16>) -> ()
          %4 = aie.objectfifo.acquire @of_4_broadcast_0_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
          %5 = aie.objectfifo.subview.access %4[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
          %6 = arith.index_cast %arg1 : index to i32
          %c1_i32 = arith.constant 1 : i32
          %7 = arith.muli %6, %c1_i32 : i32
          %c0_i32 = arith.constant 0 : i32
          %8 = arith.addi %c0_i32, %7 : i32
          %c2_i32 = arith.constant 2 : i32
          %9 = arith.cmpi sle, %8, %c2_i32 : i32
          scf.if %9 {
            func.call @op0_matmul_bf16_bf16_64_64_64(%1, %5, %3) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>) -> ()
          }
          aie.objectfifo.release @of_4_broadcast_0_0(Consume, 1)
          aie.objectfifo.release @of_6_unicast_2(Produce, 1)
        }
        aie.objectfifo.release @of_3_unicast_2_0(Consume, 1)
      }
      aie.end
    } {link_with = "op0_mm_64_64_64.o"}
    %core_3_2 = aie.core(%tile_3_2) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %0 = aie.objectfifo.acquire @of_3_unicast_3_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
        %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c8 = arith.constant 8 : index
        scf.for %arg1 = %c0_0 to %c8 step %c1_1 {
          %2 = aie.objectfifo.acquire @of_6_unicast_3(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
          %3 = aie.objectfifo.subview.access %2[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
          func.call @op0_zero_bf16_64_64_64(%3) : (memref<64x64xbf16>) -> ()
          %4 = aie.objectfifo.acquire @of_4_broadcast_0_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
          %5 = aie.objectfifo.subview.access %4[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
          %6 = arith.index_cast %arg1 : index to i32
          %c1_i32 = arith.constant 1 : i32
          %7 = arith.muli %6, %c1_i32 : i32
          %c0_i32 = arith.constant 0 : i32
          %8 = arith.addi %c0_i32, %7 : i32
          %c3_i32 = arith.constant 3 : i32
          %9 = arith.cmpi sle, %8, %c3_i32 : i32
          scf.if %9 {
            func.call @op0_matmul_bf16_bf16_64_64_64(%1, %5, %3) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>) -> ()
          }
          aie.objectfifo.release @of_4_broadcast_0_0(Consume, 1)
          aie.objectfifo.release @of_6_unicast_3(Produce, 1)
        }
        aie.objectfifo.release @of_3_unicast_3_0(Consume, 1)
      }
      aie.end
    } {link_with = "op0_mm_64_64_64.o"}
    %core_4_2 = aie.core(%tile_4_2) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %0 = aie.objectfifo.acquire @of_3_unicast_4_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
        %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c8 = arith.constant 8 : index
        scf.for %arg1 = %c0_0 to %c8 step %c1_1 {
          %2 = aie.objectfifo.acquire @of_6_unicast_4(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
          %3 = aie.objectfifo.subview.access %2[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
          func.call @op0_zero_bf16_64_64_64(%3) : (memref<64x64xbf16>) -> ()
          %4 = aie.objectfifo.acquire @of_4_broadcast_0_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
          %5 = aie.objectfifo.subview.access %4[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
          %6 = arith.index_cast %arg1 : index to i32
          %c1_i32 = arith.constant 1 : i32
          %7 = arith.muli %6, %c1_i32 : i32
          %c0_i32 = arith.constant 0 : i32
          %8 = arith.addi %c0_i32, %7 : i32
          %c4_i32 = arith.constant 4 : i32
          %9 = arith.cmpi sle, %8, %c4_i32 : i32
          scf.if %9 {
            func.call @op0_matmul_bf16_bf16_64_64_64(%1, %5, %3) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>) -> ()
          }
          aie.objectfifo.release @of_4_broadcast_0_0(Consume, 1)
          aie.objectfifo.release @of_6_unicast_4(Produce, 1)
        }
        aie.objectfifo.release @of_3_unicast_4_0(Consume, 1)
      }
      aie.end
    } {link_with = "op0_mm_64_64_64.o"}
    %core_5_2 = aie.core(%tile_5_2) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %0 = aie.objectfifo.acquire @of_3_unicast_5_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
        %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c8 = arith.constant 8 : index
        scf.for %arg1 = %c0_0 to %c8 step %c1_1 {
          %2 = aie.objectfifo.acquire @of_6_unicast_5(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
          %3 = aie.objectfifo.subview.access %2[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
          func.call @op0_zero_bf16_64_64_64(%3) : (memref<64x64xbf16>) -> ()
          %4 = aie.objectfifo.acquire @of_4_broadcast_0_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
          %5 = aie.objectfifo.subview.access %4[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
          %6 = arith.index_cast %arg1 : index to i32
          %c1_i32 = arith.constant 1 : i32
          %7 = arith.muli %6, %c1_i32 : i32
          %c0_i32 = arith.constant 0 : i32
          %8 = arith.addi %c0_i32, %7 : i32
          %c5_i32 = arith.constant 5 : i32
          %9 = arith.cmpi sle, %8, %c5_i32 : i32
          scf.if %9 {
            func.call @op0_matmul_bf16_bf16_64_64_64(%1, %5, %3) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>) -> ()
          }
          aie.objectfifo.release @of_4_broadcast_0_0(Consume, 1)
          aie.objectfifo.release @of_6_unicast_5(Produce, 1)
        }
        aie.objectfifo.release @of_3_unicast_5_0(Consume, 1)
      }
      aie.end
    } {link_with = "op0_mm_64_64_64.o"}
    %core_6_2 = aie.core(%tile_6_2) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %0 = aie.objectfifo.acquire @of_3_unicast_6_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
        %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c8 = arith.constant 8 : index
        scf.for %arg1 = %c0_0 to %c8 step %c1_1 {
          %2 = aie.objectfifo.acquire @of_6_unicast_6(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
          %3 = aie.objectfifo.subview.access %2[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
          func.call @op0_zero_bf16_64_64_64(%3) : (memref<64x64xbf16>) -> ()
          %4 = aie.objectfifo.acquire @of_4_broadcast_0_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
          %5 = aie.objectfifo.subview.access %4[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
          %6 = arith.index_cast %arg1 : index to i32
          %c1_i32 = arith.constant 1 : i32
          %7 = arith.muli %6, %c1_i32 : i32
          %c0_i32 = arith.constant 0 : i32
          %8 = arith.addi %c0_i32, %7 : i32
          %c6_i32 = arith.constant 6 : i32
          %9 = arith.cmpi sle, %8, %c6_i32 : i32
          scf.if %9 {
            func.call @op0_matmul_bf16_bf16_64_64_64(%1, %5, %3) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>) -> ()
          }
          aie.objectfifo.release @of_4_broadcast_0_0(Consume, 1)
          aie.objectfifo.release @of_6_unicast_6(Produce, 1)
        }
        aie.objectfifo.release @of_3_unicast_6_0(Consume, 1)
      }
      aie.end
    } {link_with = "op0_mm_64_64_64.o"}
    %core_7_2 = aie.core(%tile_7_2) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %0 = aie.objectfifo.acquire @of_3_unicast_7_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
        %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c8 = arith.constant 8 : index
        scf.for %arg1 = %c0_0 to %c8 step %c1_1 {
          %2 = aie.objectfifo.acquire @of_6_unicast_7(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
          %3 = aie.objectfifo.subview.access %2[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
          func.call @op0_zero_bf16_64_64_64(%3) : (memref<64x64xbf16>) -> ()
          %4 = aie.objectfifo.acquire @of_4_broadcast_0_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
          %5 = aie.objectfifo.subview.access %4[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
          %6 = arith.index_cast %arg1 : index to i32
          %c1_i32 = arith.constant 1 : i32
          %7 = arith.muli %6, %c1_i32 : i32
          %c0_i32 = arith.constant 0 : i32
          %8 = arith.addi %c0_i32, %7 : i32
          %c7_i32 = arith.constant 7 : i32
          %9 = arith.cmpi sle, %8, %c7_i32 : i32
          scf.if %9 {
            func.call @op0_matmul_bf16_bf16_64_64_64(%1, %5, %3) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>) -> ()
          }
          aie.objectfifo.release @of_4_broadcast_0_0(Consume, 1)
          aie.objectfifo.release @of_6_unicast_7(Produce, 1)
        }
        aie.objectfifo.release @of_3_unicast_7_0(Consume, 1)
      }
      aie.end
    } {link_with = "op0_mm_64_64_64.o"}
    %flash_index_0_4 = aie.buffer(%tile_0_4) {sym_name = "flash_index_0_4"} : memref<2xi32> 
    %core_0_4 = aie.core(%tile_0_4) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %0 = aie.objectfifo.acquire @of_10_unicast_0(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
        %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
        func.call @op0_zero_bf16(%1) : (memref<64x64xbf16>) -> ()
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c8 = arith.constant 8 : index
        scf.for %arg1 = %c0_0 to %c8 step %c1_1 {
          %2 = aie.objectfifo.acquire @of_9_unicast_0_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
          %3 = aie.objectfifo.subview.access %2[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
          %4 = aie.objectfifo.acquire @of_5_broadcast_0_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
          %5 = aie.objectfifo.subview.access %4[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
          %6 = arith.index_cast %arg1 : index to i32
          %c1_i32 = arith.constant 1 : i32
          %7 = arith.muli %6, %c1_i32 : i32
          %c0_i32 = arith.constant 0 : i32
          %8 = arith.addi %c0_i32, %7 : i32
          %c0_i32_2 = arith.constant 0 : i32
          %c0_3 = arith.constant 0 : index
          %c1_4 = arith.constant 1 : index
          memref.store %8, %flash_index_0_4[%c0_3] : memref<2xi32>
          memref.store %c0_i32_2, %flash_index_0_4[%c1_4] : memref<2xi32>
          %9 = aie.objectfifo.acquire @flash_scale_0_3_0_4(Consume, 1) : !aie.objectfifosubview<memref<256xbf16>>
          %10 = aie.objectfifo.subview.access %9[0] : !aie.objectfifosubview<memref<256xbf16>> -> memref<256xbf16>
          %c64_i32 = arith.constant 64 : i32
          %c0_i32_5 = arith.constant 0 : i32
          %11 = arith.cmpi ne, %8, %c0_i32_5 : i32
          %12 = arith.extui %11 : i1 to i32
          func.call @op0_matmul_PV(%3, %5, %1, %10, %c64_i32, %12, %flash_index_0_4) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>, memref<256xbf16>, i32, i32, memref<2xi32>) -> ()
          %c7_i32 = arith.constant 7 : i32
          %13 = arith.cmpi eq, %8, %c7_i32 : i32
          scf.if %13 {
            func.call @op0_rescale_O(%1, %10, %c64_i32, %flash_index_0_4) : (memref<64x64xbf16>, memref<256xbf16>, i32, memref<2xi32>) -> ()
          }
          aie.objectfifo.release @flash_scale_0_3_0_4(Consume, 1)
          aie.objectfifo.release @of_5_broadcast_0_0(Consume, 1)
          aie.objectfifo.release @of_9_unicast_0_0(Consume, 1)
        }
        aie.objectfifo.release @of_10_unicast_0(Produce, 1)
      }
      aie.end
    } {link_with = "op0_mha.o"}
    %flash_index_1_4 = aie.buffer(%tile_1_4) {sym_name = "flash_index_1_4"} : memref<2xi32> 
    %core_1_4 = aie.core(%tile_1_4) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %0 = aie.objectfifo.acquire @of_10_unicast_1(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
        %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
        func.call @op0_zero_bf16(%1) : (memref<64x64xbf16>) -> ()
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c8 = arith.constant 8 : index
        scf.for %arg1 = %c0_0 to %c8 step %c1_1 {
          %2 = aie.objectfifo.acquire @of_9_unicast_1_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
          %3 = aie.objectfifo.subview.access %2[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
          %4 = aie.objectfifo.acquire @of_5_broadcast_0_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
          %5 = aie.objectfifo.subview.access %4[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
          %6 = arith.index_cast %arg1 : index to i32
          %c1_i32 = arith.constant 1 : i32
          %7 = arith.muli %6, %c1_i32 : i32
          %c0_i32 = arith.constant 0 : i32
          %8 = arith.addi %c0_i32, %7 : i32
          %c1_i32_2 = arith.constant 1 : i32
          %c0_3 = arith.constant 0 : index
          %c1_4 = arith.constant 1 : index
          memref.store %8, %flash_index_1_4[%c0_3] : memref<2xi32>
          memref.store %c1_i32_2, %flash_index_1_4[%c1_4] : memref<2xi32>
          %9 = aie.objectfifo.acquire @flash_scale_1_3_1_4(Consume, 1) : !aie.objectfifosubview<memref<256xbf16>>
          %10 = aie.objectfifo.subview.access %9[0] : !aie.objectfifosubview<memref<256xbf16>> -> memref<256xbf16>
          %c64_i32 = arith.constant 64 : i32
          %c0_i32_5 = arith.constant 0 : i32
          %11 = arith.cmpi ne, %8, %c0_i32_5 : i32
          %12 = arith.extui %11 : i1 to i32
          func.call @op0_matmul_PV(%3, %5, %1, %10, %c64_i32, %12, %flash_index_1_4) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>, memref<256xbf16>, i32, i32, memref<2xi32>) -> ()
          %c7_i32 = arith.constant 7 : i32
          %13 = arith.cmpi eq, %8, %c7_i32 : i32
          scf.if %13 {
            func.call @op0_rescale_O(%1, %10, %c64_i32, %flash_index_1_4) : (memref<64x64xbf16>, memref<256xbf16>, i32, memref<2xi32>) -> ()
          }
          aie.objectfifo.release @flash_scale_1_3_1_4(Consume, 1)
          aie.objectfifo.release @of_5_broadcast_0_0(Consume, 1)
          aie.objectfifo.release @of_9_unicast_1_0(Consume, 1)
        }
        aie.objectfifo.release @of_10_unicast_1(Produce, 1)
      }
      aie.end
    } {link_with = "op0_mha.o"}
    %flash_index_2_4 = aie.buffer(%tile_2_4) {sym_name = "flash_index_2_4"} : memref<2xi32> 
    %core_2_4 = aie.core(%tile_2_4) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %0 = aie.objectfifo.acquire @of_10_unicast_2(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
        %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
        func.call @op0_zero_bf16(%1) : (memref<64x64xbf16>) -> ()
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c8 = arith.constant 8 : index
        scf.for %arg1 = %c0_0 to %c8 step %c1_1 {
          %2 = aie.objectfifo.acquire @of_9_unicast_2_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
          %3 = aie.objectfifo.subview.access %2[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
          %4 = aie.objectfifo.acquire @of_5_broadcast_0_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
          %5 = aie.objectfifo.subview.access %4[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
          %6 = arith.index_cast %arg1 : index to i32
          %c1_i32 = arith.constant 1 : i32
          %7 = arith.muli %6, %c1_i32 : i32
          %c0_i32 = arith.constant 0 : i32
          %8 = arith.addi %c0_i32, %7 : i32
          %c2_i32 = arith.constant 2 : i32
          %c0_2 = arith.constant 0 : index
          %c1_3 = arith.constant 1 : index
          memref.store %8, %flash_index_2_4[%c0_2] : memref<2xi32>
          memref.store %c2_i32, %flash_index_2_4[%c1_3] : memref<2xi32>
          %9 = aie.objectfifo.acquire @flash_scale_2_3_2_4(Consume, 1) : !aie.objectfifosubview<memref<256xbf16>>
          %10 = aie.objectfifo.subview.access %9[0] : !aie.objectfifosubview<memref<256xbf16>> -> memref<256xbf16>
          %c64_i32 = arith.constant 64 : i32
          %c0_i32_4 = arith.constant 0 : i32
          %11 = arith.cmpi ne, %8, %c0_i32_4 : i32
          %12 = arith.extui %11 : i1 to i32
          func.call @op0_matmul_PV(%3, %5, %1, %10, %c64_i32, %12, %flash_index_2_4) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>, memref<256xbf16>, i32, i32, memref<2xi32>) -> ()
          %c7_i32 = arith.constant 7 : i32
          %13 = arith.cmpi eq, %8, %c7_i32 : i32
          scf.if %13 {
            func.call @op0_rescale_O(%1, %10, %c64_i32, %flash_index_2_4) : (memref<64x64xbf16>, memref<256xbf16>, i32, memref<2xi32>) -> ()
          }
          aie.objectfifo.release @flash_scale_2_3_2_4(Consume, 1)
          aie.objectfifo.release @of_5_broadcast_0_0(Consume, 1)
          aie.objectfifo.release @of_9_unicast_2_0(Consume, 1)
        }
        aie.objectfifo.release @of_10_unicast_2(Produce, 1)
      }
      aie.end
    } {link_with = "op0_mha.o"}
    %flash_index_3_4 = aie.buffer(%tile_3_4) {sym_name = "flash_index_3_4"} : memref<2xi32> 
    %core_3_4 = aie.core(%tile_3_4) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %0 = aie.objectfifo.acquire @of_10_unicast_3(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
        %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
        func.call @op0_zero_bf16(%1) : (memref<64x64xbf16>) -> ()
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c8 = arith.constant 8 : index
        scf.for %arg1 = %c0_0 to %c8 step %c1_1 {
          %2 = aie.objectfifo.acquire @of_9_unicast_3_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
          %3 = aie.objectfifo.subview.access %2[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
          %4 = aie.objectfifo.acquire @of_5_broadcast_0_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
          %5 = aie.objectfifo.subview.access %4[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
          %6 = arith.index_cast %arg1 : index to i32
          %c1_i32 = arith.constant 1 : i32
          %7 = arith.muli %6, %c1_i32 : i32
          %c0_i32 = arith.constant 0 : i32
          %8 = arith.addi %c0_i32, %7 : i32
          %c3_i32 = arith.constant 3 : i32
          %c0_2 = arith.constant 0 : index
          %c1_3 = arith.constant 1 : index
          memref.store %8, %flash_index_3_4[%c0_2] : memref<2xi32>
          memref.store %c3_i32, %flash_index_3_4[%c1_3] : memref<2xi32>
          %9 = aie.objectfifo.acquire @flash_scale_3_3_3_4(Consume, 1) : !aie.objectfifosubview<memref<256xbf16>>
          %10 = aie.objectfifo.subview.access %9[0] : !aie.objectfifosubview<memref<256xbf16>> -> memref<256xbf16>
          %c64_i32 = arith.constant 64 : i32
          %c0_i32_4 = arith.constant 0 : i32
          %11 = arith.cmpi ne, %8, %c0_i32_4 : i32
          %12 = arith.extui %11 : i1 to i32
          func.call @op0_matmul_PV(%3, %5, %1, %10, %c64_i32, %12, %flash_index_3_4) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>, memref<256xbf16>, i32, i32, memref<2xi32>) -> ()
          %c7_i32 = arith.constant 7 : i32
          %13 = arith.cmpi eq, %8, %c7_i32 : i32
          scf.if %13 {
            func.call @op0_rescale_O(%1, %10, %c64_i32, %flash_index_3_4) : (memref<64x64xbf16>, memref<256xbf16>, i32, memref<2xi32>) -> ()
          }
          aie.objectfifo.release @flash_scale_3_3_3_4(Consume, 1)
          aie.objectfifo.release @of_5_broadcast_0_0(Consume, 1)
          aie.objectfifo.release @of_9_unicast_3_0(Consume, 1)
        }
        aie.objectfifo.release @of_10_unicast_3(Produce, 1)
      }
      aie.end
    } {link_with = "op0_mha.o"}
    %flash_index_4_4 = aie.buffer(%tile_4_4) {sym_name = "flash_index_4_4"} : memref<2xi32> 
    %core_4_4 = aie.core(%tile_4_4) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %0 = aie.objectfifo.acquire @of_10_unicast_4(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
        %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
        func.call @op0_zero_bf16(%1) : (memref<64x64xbf16>) -> ()
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c8 = arith.constant 8 : index
        scf.for %arg1 = %c0_0 to %c8 step %c1_1 {
          %2 = aie.objectfifo.acquire @of_9_unicast_4_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
          %3 = aie.objectfifo.subview.access %2[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
          %4 = aie.objectfifo.acquire @of_5_broadcast_0_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
          %5 = aie.objectfifo.subview.access %4[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
          %6 = arith.index_cast %arg1 : index to i32
          %c1_i32 = arith.constant 1 : i32
          %7 = arith.muli %6, %c1_i32 : i32
          %c0_i32 = arith.constant 0 : i32
          %8 = arith.addi %c0_i32, %7 : i32
          %c4_i32 = arith.constant 4 : i32
          %c0_2 = arith.constant 0 : index
          %c1_3 = arith.constant 1 : index
          memref.store %8, %flash_index_4_4[%c0_2] : memref<2xi32>
          memref.store %c4_i32, %flash_index_4_4[%c1_3] : memref<2xi32>
          %9 = aie.objectfifo.acquire @flash_scale_4_3_4_4(Consume, 1) : !aie.objectfifosubview<memref<256xbf16>>
          %10 = aie.objectfifo.subview.access %9[0] : !aie.objectfifosubview<memref<256xbf16>> -> memref<256xbf16>
          %c64_i32 = arith.constant 64 : i32
          %c0_i32_4 = arith.constant 0 : i32
          %11 = arith.cmpi ne, %8, %c0_i32_4 : i32
          %12 = arith.extui %11 : i1 to i32
          func.call @op0_matmul_PV(%3, %5, %1, %10, %c64_i32, %12, %flash_index_4_4) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>, memref<256xbf16>, i32, i32, memref<2xi32>) -> ()
          %c7_i32 = arith.constant 7 : i32
          %13 = arith.cmpi eq, %8, %c7_i32 : i32
          scf.if %13 {
            func.call @op0_rescale_O(%1, %10, %c64_i32, %flash_index_4_4) : (memref<64x64xbf16>, memref<256xbf16>, i32, memref<2xi32>) -> ()
          }
          aie.objectfifo.release @flash_scale_4_3_4_4(Consume, 1)
          aie.objectfifo.release @of_5_broadcast_0_0(Consume, 1)
          aie.objectfifo.release @of_9_unicast_4_0(Consume, 1)
        }
        aie.objectfifo.release @of_10_unicast_4(Produce, 1)
      }
      aie.end
    } {link_with = "op0_mha.o"}
    %flash_index_5_4 = aie.buffer(%tile_5_4) {sym_name = "flash_index_5_4"} : memref<2xi32> 
    %core_5_4 = aie.core(%tile_5_4) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %0 = aie.objectfifo.acquire @of_10_unicast_5(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
        %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
        func.call @op0_zero_bf16(%1) : (memref<64x64xbf16>) -> ()
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c8 = arith.constant 8 : index
        scf.for %arg1 = %c0_0 to %c8 step %c1_1 {
          %2 = aie.objectfifo.acquire @of_9_unicast_5_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
          %3 = aie.objectfifo.subview.access %2[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
          %4 = aie.objectfifo.acquire @of_5_broadcast_0_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
          %5 = aie.objectfifo.subview.access %4[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
          %6 = arith.index_cast %arg1 : index to i32
          %c1_i32 = arith.constant 1 : i32
          %7 = arith.muli %6, %c1_i32 : i32
          %c0_i32 = arith.constant 0 : i32
          %8 = arith.addi %c0_i32, %7 : i32
          %c5_i32 = arith.constant 5 : i32
          %c0_2 = arith.constant 0 : index
          %c1_3 = arith.constant 1 : index
          memref.store %8, %flash_index_5_4[%c0_2] : memref<2xi32>
          memref.store %c5_i32, %flash_index_5_4[%c1_3] : memref<2xi32>
          %9 = aie.objectfifo.acquire @flash_scale_5_3_5_4(Consume, 1) : !aie.objectfifosubview<memref<256xbf16>>
          %10 = aie.objectfifo.subview.access %9[0] : !aie.objectfifosubview<memref<256xbf16>> -> memref<256xbf16>
          %c64_i32 = arith.constant 64 : i32
          %c0_i32_4 = arith.constant 0 : i32
          %11 = arith.cmpi ne, %8, %c0_i32_4 : i32
          %12 = arith.extui %11 : i1 to i32
          func.call @op0_matmul_PV(%3, %5, %1, %10, %c64_i32, %12, %flash_index_5_4) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>, memref<256xbf16>, i32, i32, memref<2xi32>) -> ()
          %c7_i32 = arith.constant 7 : i32
          %13 = arith.cmpi eq, %8, %c7_i32 : i32
          scf.if %13 {
            func.call @op0_rescale_O(%1, %10, %c64_i32, %flash_index_5_4) : (memref<64x64xbf16>, memref<256xbf16>, i32, memref<2xi32>) -> ()
          }
          aie.objectfifo.release @flash_scale_5_3_5_4(Consume, 1)
          aie.objectfifo.release @of_5_broadcast_0_0(Consume, 1)
          aie.objectfifo.release @of_9_unicast_5_0(Consume, 1)
        }
        aie.objectfifo.release @of_10_unicast_5(Produce, 1)
      }
      aie.end
    } {link_with = "op0_mha.o"}
    %flash_index_6_4 = aie.buffer(%tile_6_4) {sym_name = "flash_index_6_4"} : memref<2xi32> 
    %core_6_4 = aie.core(%tile_6_4) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %0 = aie.objectfifo.acquire @of_10_unicast_6(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
        %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
        func.call @op0_zero_bf16(%1) : (memref<64x64xbf16>) -> ()
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c8 = arith.constant 8 : index
        scf.for %arg1 = %c0_0 to %c8 step %c1_1 {
          %2 = aie.objectfifo.acquire @of_9_unicast_6_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
          %3 = aie.objectfifo.subview.access %2[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
          %4 = aie.objectfifo.acquire @of_5_broadcast_0_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
          %5 = aie.objectfifo.subview.access %4[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
          %6 = arith.index_cast %arg1 : index to i32
          %c1_i32 = arith.constant 1 : i32
          %7 = arith.muli %6, %c1_i32 : i32
          %c0_i32 = arith.constant 0 : i32
          %8 = arith.addi %c0_i32, %7 : i32
          %c6_i32 = arith.constant 6 : i32
          %c0_2 = arith.constant 0 : index
          %c1_3 = arith.constant 1 : index
          memref.store %8, %flash_index_6_4[%c0_2] : memref<2xi32>
          memref.store %c6_i32, %flash_index_6_4[%c1_3] : memref<2xi32>
          %9 = aie.objectfifo.acquire @flash_scale_6_3_6_4(Consume, 1) : !aie.objectfifosubview<memref<256xbf16>>
          %10 = aie.objectfifo.subview.access %9[0] : !aie.objectfifosubview<memref<256xbf16>> -> memref<256xbf16>
          %c64_i32 = arith.constant 64 : i32
          %c0_i32_4 = arith.constant 0 : i32
          %11 = arith.cmpi ne, %8, %c0_i32_4 : i32
          %12 = arith.extui %11 : i1 to i32
          func.call @op0_matmul_PV(%3, %5, %1, %10, %c64_i32, %12, %flash_index_6_4) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>, memref<256xbf16>, i32, i32, memref<2xi32>) -> ()
          %c7_i32 = arith.constant 7 : i32
          %13 = arith.cmpi eq, %8, %c7_i32 : i32
          scf.if %13 {
            func.call @op0_rescale_O(%1, %10, %c64_i32, %flash_index_6_4) : (memref<64x64xbf16>, memref<256xbf16>, i32, memref<2xi32>) -> ()
          }
          aie.objectfifo.release @flash_scale_6_3_6_4(Consume, 1)
          aie.objectfifo.release @of_5_broadcast_0_0(Consume, 1)
          aie.objectfifo.release @of_9_unicast_6_0(Consume, 1)
        }
        aie.objectfifo.release @of_10_unicast_6(Produce, 1)
      }
      aie.end
    } {link_with = "op0_mha.o"}
    %flash_index_7_4 = aie.buffer(%tile_7_4) {sym_name = "flash_index_7_4"} : memref<2xi32> 
    %core_7_4 = aie.core(%tile_7_4) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %0 = aie.objectfifo.acquire @of_10_unicast_7(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
        %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
        func.call @op0_zero_bf16(%1) : (memref<64x64xbf16>) -> ()
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c8 = arith.constant 8 : index
        scf.for %arg1 = %c0_0 to %c8 step %c1_1 {
          %2 = aie.objectfifo.acquire @of_9_unicast_7_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
          %3 = aie.objectfifo.subview.access %2[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
          %4 = aie.objectfifo.acquire @of_5_broadcast_0_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
          %5 = aie.objectfifo.subview.access %4[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
          %6 = arith.index_cast %arg1 : index to i32
          %c1_i32 = arith.constant 1 : i32
          %7 = arith.muli %6, %c1_i32 : i32
          %c0_i32 = arith.constant 0 : i32
          %8 = arith.addi %c0_i32, %7 : i32
          %c7_i32 = arith.constant 7 : i32
          %c0_2 = arith.constant 0 : index
          %c1_3 = arith.constant 1 : index
          memref.store %8, %flash_index_7_4[%c0_2] : memref<2xi32>
          memref.store %c7_i32, %flash_index_7_4[%c1_3] : memref<2xi32>
          %9 = aie.objectfifo.acquire @flash_scale_7_3_7_4(Consume, 1) : !aie.objectfifosubview<memref<256xbf16>>
          %10 = aie.objectfifo.subview.access %9[0] : !aie.objectfifosubview<memref<256xbf16>> -> memref<256xbf16>
          %c64_i32 = arith.constant 64 : i32
          %c0_i32_4 = arith.constant 0 : i32
          %11 = arith.cmpi ne, %8, %c0_i32_4 : i32
          %12 = arith.extui %11 : i1 to i32
          func.call @op0_matmul_PV(%3, %5, %1, %10, %c64_i32, %12, %flash_index_7_4) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>, memref<256xbf16>, i32, i32, memref<2xi32>) -> ()
          %c7_i32_5 = arith.constant 7 : i32
          %13 = arith.cmpi eq, %8, %c7_i32_5 : i32
          scf.if %13 {
            func.call @op0_rescale_O(%1, %10, %c64_i32, %flash_index_7_4) : (memref<64x64xbf16>, memref<256xbf16>, i32, memref<2xi32>) -> ()
          }
          aie.objectfifo.release @flash_scale_7_3_7_4(Consume, 1)
          aie.objectfifo.release @of_5_broadcast_0_0(Consume, 1)
          aie.objectfifo.release @of_9_unicast_7_0(Consume, 1)
        }
        aie.objectfifo.release @of_10_unicast_7(Produce, 1)
      }
      aie.end
    } {link_with = "op0_mha.o"}
    %flash_state_0_3 = aie.buffer(%tile_0_3) {sym_name = "flash_state_0_3"} : memref<256xbf16> 
    %flash_index_0_3 = aie.buffer(%tile_0_3) {sym_name = "flash_index_0_3"} : memref<2xi32> 
    aie.objectfifo @flash_scale_0_3_0_4(%tile_0_3, {%tile_0_4}, 2 : i32) : !aie.objectfifo<memref<256xbf16>>  
    %core_0_3 = aie.core(%tile_0_3) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c8 = arith.constant 8 : index
        scf.for %arg1 = %c0_0 to %c8 step %c1_1 {
          %0 = aie.objectfifo.acquire @of_8_unicast_0(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
          %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
          %2 = aie.objectfifo.acquire @of_7_unicast_0_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
          %3 = aie.objectfifo.subview.access %2[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
          %4 = arith.index_cast %arg1 : index to i32
          %c1_i32 = arith.constant 1 : i32
          %5 = arith.muli %4, %c1_i32 : i32
          %c0_i32 = arith.constant 0 : i32
          %6 = arith.addi %c0_i32, %5 : i32
          %c0_i32_2 = arith.constant 0 : i32
          %c0_3 = arith.constant 0 : index
          %c1_4 = arith.constant 1 : index
          memref.store %6, %flash_index_0_3[%c0_3] : memref<2xi32>
          memref.store %c0_i32_2, %flash_index_0_3[%c1_4] : memref<2xi32>
          %c64_i32 = arith.constant 64 : i32
          %c0_i32_5 = arith.constant 0 : i32
          %7 = arith.cmpi eq, %6, %c0_i32_5 : i32
          scf.if %7 {
            func.call @op0_init_scale_buffer(%flash_state_0_3, %c64_i32) : (memref<256xbf16>, i32) -> ()
          }
          %cst = arith.constant 1.4453125 : f32
          %8 = arith.truncf %cst : f32 to bf16
          %c64_i32_6 = arith.constant 64 : i32
          %c512_i32 = arith.constant 512 : i32
          %c512_i32_7 = arith.constant 512 : i32
          %c0_i32_8 = arith.constant 0 : i32
          func.call @op0_partial_softmax(%3, %1, %flash_state_0_3, %flash_index_0_3, %8, %c64_i32, %c64_i32_6, %c512_i32, %c512_i32_7) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<256xbf16>, memref<2xi32>, bf16, i32, i32, i32, i32) -> ()
          %c256_i32 = arith.constant 256 : i32
          %9 = aie.objectfifo.acquire @flash_scale_0_3_0_4(Produce, 1) : !aie.objectfifosubview<memref<256xbf16>>
          %10 = aie.objectfifo.subview.access %9[0] : !aie.objectfifosubview<memref<256xbf16>> -> memref<256xbf16>
          func.call @op0_passThroughLine(%flash_state_0_3, %10, %c256_i32) : (memref<256xbf16>, memref<256xbf16>, i32) -> ()
          aie.objectfifo.release @flash_scale_0_3_0_4(Produce, 1)
          aie.objectfifo.release @of_7_unicast_0_0(Consume, 1)
          aie.objectfifo.release @of_8_unicast_0(Produce, 1)
        }
      }
      aie.end
    } {link_with = "op0_mha.o"}
    %flash_state_1_3 = aie.buffer(%tile_1_3) {sym_name = "flash_state_1_3"} : memref<256xbf16> 
    %flash_index_1_3 = aie.buffer(%tile_1_3) {sym_name = "flash_index_1_3"} : memref<2xi32> 
    aie.objectfifo @flash_scale_1_3_1_4(%tile_1_3, {%tile_1_4}, 2 : i32) : !aie.objectfifo<memref<256xbf16>>  
    %core_1_3 = aie.core(%tile_1_3) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c8 = arith.constant 8 : index
        scf.for %arg1 = %c0_0 to %c8 step %c1_1 {
          %0 = aie.objectfifo.acquire @of_8_unicast_1(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
          %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
          %2 = aie.objectfifo.acquire @of_7_unicast_1_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
          %3 = aie.objectfifo.subview.access %2[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
          %4 = arith.index_cast %arg1 : index to i32
          %c1_i32 = arith.constant 1 : i32
          %5 = arith.muli %4, %c1_i32 : i32
          %c0_i32 = arith.constant 0 : i32
          %6 = arith.addi %c0_i32, %5 : i32
          %c1_i32_2 = arith.constant 1 : i32
          %c0_3 = arith.constant 0 : index
          %c1_4 = arith.constant 1 : index
          memref.store %6, %flash_index_1_3[%c0_3] : memref<2xi32>
          memref.store %c1_i32_2, %flash_index_1_3[%c1_4] : memref<2xi32>
          %c64_i32 = arith.constant 64 : i32
          %c0_i32_5 = arith.constant 0 : i32
          %7 = arith.cmpi eq, %6, %c0_i32_5 : i32
          scf.if %7 {
            func.call @op0_init_scale_buffer(%flash_state_1_3, %c64_i32) : (memref<256xbf16>, i32) -> ()
          }
          %cst = arith.constant 1.4453125 : f32
          %8 = arith.truncf %cst : f32 to bf16
          %c64_i32_6 = arith.constant 64 : i32
          %c512_i32 = arith.constant 512 : i32
          %c512_i32_7 = arith.constant 512 : i32
          %c0_i32_8 = arith.constant 0 : i32
          func.call @op0_partial_softmax(%3, %1, %flash_state_1_3, %flash_index_1_3, %8, %c64_i32, %c64_i32_6, %c512_i32, %c512_i32_7) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<256xbf16>, memref<2xi32>, bf16, i32, i32, i32, i32) -> ()
          %c256_i32 = arith.constant 256 : i32
          %9 = aie.objectfifo.acquire @flash_scale_1_3_1_4(Produce, 1) : !aie.objectfifosubview<memref<256xbf16>>
          %10 = aie.objectfifo.subview.access %9[0] : !aie.objectfifosubview<memref<256xbf16>> -> memref<256xbf16>
          func.call @op0_passThroughLine(%flash_state_1_3, %10, %c256_i32) : (memref<256xbf16>, memref<256xbf16>, i32) -> ()
          aie.objectfifo.release @flash_scale_1_3_1_4(Produce, 1)
          aie.objectfifo.release @of_7_unicast_1_0(Consume, 1)
          aie.objectfifo.release @of_8_unicast_1(Produce, 1)
        }
      }
      aie.end
    } {link_with = "op0_mha.o"}
    %flash_state_2_3 = aie.buffer(%tile_2_3) {sym_name = "flash_state_2_3"} : memref<256xbf16> 
    %flash_index_2_3 = aie.buffer(%tile_2_3) {sym_name = "flash_index_2_3"} : memref<2xi32> 
    aie.objectfifo @flash_scale_2_3_2_4(%tile_2_3, {%tile_2_4}, 2 : i32) : !aie.objectfifo<memref<256xbf16>>  
    %core_2_3 = aie.core(%tile_2_3) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c8 = arith.constant 8 : index
        scf.for %arg1 = %c0_0 to %c8 step %c1_1 {
          %0 = aie.objectfifo.acquire @of_8_unicast_2(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
          %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
          %2 = aie.objectfifo.acquire @of_7_unicast_2_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
          %3 = aie.objectfifo.subview.access %2[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
          %4 = arith.index_cast %arg1 : index to i32
          %c1_i32 = arith.constant 1 : i32
          %5 = arith.muli %4, %c1_i32 : i32
          %c0_i32 = arith.constant 0 : i32
          %6 = arith.addi %c0_i32, %5 : i32
          %c2_i32 = arith.constant 2 : i32
          %c0_2 = arith.constant 0 : index
          %c1_3 = arith.constant 1 : index
          memref.store %6, %flash_index_2_3[%c0_2] : memref<2xi32>
          memref.store %c2_i32, %flash_index_2_3[%c1_3] : memref<2xi32>
          %c64_i32 = arith.constant 64 : i32
          %c0_i32_4 = arith.constant 0 : i32
          %7 = arith.cmpi eq, %6, %c0_i32_4 : i32
          scf.if %7 {
            func.call @op0_init_scale_buffer(%flash_state_2_3, %c64_i32) : (memref<256xbf16>, i32) -> ()
          }
          %cst = arith.constant 1.4453125 : f32
          %8 = arith.truncf %cst : f32 to bf16
          %c64_i32_5 = arith.constant 64 : i32
          %c512_i32 = arith.constant 512 : i32
          %c512_i32_6 = arith.constant 512 : i32
          %c0_i32_7 = arith.constant 0 : i32
          func.call @op0_partial_softmax(%3, %1, %flash_state_2_3, %flash_index_2_3, %8, %c64_i32, %c64_i32_5, %c512_i32, %c512_i32_6) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<256xbf16>, memref<2xi32>, bf16, i32, i32, i32, i32) -> ()
          %c256_i32 = arith.constant 256 : i32
          %9 = aie.objectfifo.acquire @flash_scale_2_3_2_4(Produce, 1) : !aie.objectfifosubview<memref<256xbf16>>
          %10 = aie.objectfifo.subview.access %9[0] : !aie.objectfifosubview<memref<256xbf16>> -> memref<256xbf16>
          func.call @op0_passThroughLine(%flash_state_2_3, %10, %c256_i32) : (memref<256xbf16>, memref<256xbf16>, i32) -> ()
          aie.objectfifo.release @flash_scale_2_3_2_4(Produce, 1)
          aie.objectfifo.release @of_7_unicast_2_0(Consume, 1)
          aie.objectfifo.release @of_8_unicast_2(Produce, 1)
        }
      }
      aie.end
    } {link_with = "op0_mha.o"}
    %flash_state_3_3 = aie.buffer(%tile_3_3) {sym_name = "flash_state_3_3"} : memref<256xbf16> 
    %flash_index_3_3 = aie.buffer(%tile_3_3) {sym_name = "flash_index_3_3"} : memref<2xi32> 
    aie.objectfifo @flash_scale_3_3_3_4(%tile_3_3, {%tile_3_4}, 2 : i32) : !aie.objectfifo<memref<256xbf16>>  
    %core_3_3 = aie.core(%tile_3_3) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c8 = arith.constant 8 : index
        scf.for %arg1 = %c0_0 to %c8 step %c1_1 {
          %0 = aie.objectfifo.acquire @of_8_unicast_3(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
          %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
          %2 = aie.objectfifo.acquire @of_7_unicast_3_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
          %3 = aie.objectfifo.subview.access %2[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
          %4 = arith.index_cast %arg1 : index to i32
          %c1_i32 = arith.constant 1 : i32
          %5 = arith.muli %4, %c1_i32 : i32
          %c0_i32 = arith.constant 0 : i32
          %6 = arith.addi %c0_i32, %5 : i32
          %c3_i32 = arith.constant 3 : i32
          %c0_2 = arith.constant 0 : index
          %c1_3 = arith.constant 1 : index
          memref.store %6, %flash_index_3_3[%c0_2] : memref<2xi32>
          memref.store %c3_i32, %flash_index_3_3[%c1_3] : memref<2xi32>
          %c64_i32 = arith.constant 64 : i32
          %c0_i32_4 = arith.constant 0 : i32
          %7 = arith.cmpi eq, %6, %c0_i32_4 : i32
          scf.if %7 {
            func.call @op0_init_scale_buffer(%flash_state_3_3, %c64_i32) : (memref<256xbf16>, i32) -> ()
          }
          %cst = arith.constant 1.4453125 : f32
          %8 = arith.truncf %cst : f32 to bf16
          %c64_i32_5 = arith.constant 64 : i32
          %c512_i32 = arith.constant 512 : i32
          %c512_i32_6 = arith.constant 512 : i32
          %c0_i32_7 = arith.constant 0 : i32
          func.call @op0_partial_softmax(%3, %1, %flash_state_3_3, %flash_index_3_3, %8, %c64_i32, %c64_i32_5, %c512_i32, %c512_i32_6) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<256xbf16>, memref<2xi32>, bf16, i32, i32, i32, i32) -> ()
          %c256_i32 = arith.constant 256 : i32
          %9 = aie.objectfifo.acquire @flash_scale_3_3_3_4(Produce, 1) : !aie.objectfifosubview<memref<256xbf16>>
          %10 = aie.objectfifo.subview.access %9[0] : !aie.objectfifosubview<memref<256xbf16>> -> memref<256xbf16>
          func.call @op0_passThroughLine(%flash_state_3_3, %10, %c256_i32) : (memref<256xbf16>, memref<256xbf16>, i32) -> ()
          aie.objectfifo.release @flash_scale_3_3_3_4(Produce, 1)
          aie.objectfifo.release @of_7_unicast_3_0(Consume, 1)
          aie.objectfifo.release @of_8_unicast_3(Produce, 1)
        }
      }
      aie.end
    } {link_with = "op0_mha.o"}
    %flash_state_4_3 = aie.buffer(%tile_4_3) {sym_name = "flash_state_4_3"} : memref<256xbf16> 
    %flash_index_4_3 = aie.buffer(%tile_4_3) {sym_name = "flash_index_4_3"} : memref<2xi32> 
    aie.objectfifo @flash_scale_4_3_4_4(%tile_4_3, {%tile_4_4}, 2 : i32) : !aie.objectfifo<memref<256xbf16>>  
    %core_4_3 = aie.core(%tile_4_3) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c8 = arith.constant 8 : index
        scf.for %arg1 = %c0_0 to %c8 step %c1_1 {
          %0 = aie.objectfifo.acquire @of_8_unicast_4(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
          %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
          %2 = aie.objectfifo.acquire @of_7_unicast_4_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
          %3 = aie.objectfifo.subview.access %2[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
          %4 = arith.index_cast %arg1 : index to i32
          %c1_i32 = arith.constant 1 : i32
          %5 = arith.muli %4, %c1_i32 : i32
          %c0_i32 = arith.constant 0 : i32
          %6 = arith.addi %c0_i32, %5 : i32
          %c4_i32 = arith.constant 4 : i32
          %c0_2 = arith.constant 0 : index
          %c1_3 = arith.constant 1 : index
          memref.store %6, %flash_index_4_3[%c0_2] : memref<2xi32>
          memref.store %c4_i32, %flash_index_4_3[%c1_3] : memref<2xi32>
          %c64_i32 = arith.constant 64 : i32
          %c0_i32_4 = arith.constant 0 : i32
          %7 = arith.cmpi eq, %6, %c0_i32_4 : i32
          scf.if %7 {
            func.call @op0_init_scale_buffer(%flash_state_4_3, %c64_i32) : (memref<256xbf16>, i32) -> ()
          }
          %cst = arith.constant 1.4453125 : f32
          %8 = arith.truncf %cst : f32 to bf16
          %c64_i32_5 = arith.constant 64 : i32
          %c512_i32 = arith.constant 512 : i32
          %c512_i32_6 = arith.constant 512 : i32
          %c0_i32_7 = arith.constant 0 : i32
          func.call @op0_partial_softmax(%3, %1, %flash_state_4_3, %flash_index_4_3, %8, %c64_i32, %c64_i32_5, %c512_i32, %c512_i32_6) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<256xbf16>, memref<2xi32>, bf16, i32, i32, i32, i32) -> ()
          %c256_i32 = arith.constant 256 : i32
          %9 = aie.objectfifo.acquire @flash_scale_4_3_4_4(Produce, 1) : !aie.objectfifosubview<memref<256xbf16>>
          %10 = aie.objectfifo.subview.access %9[0] : !aie.objectfifosubview<memref<256xbf16>> -> memref<256xbf16>
          func.call @op0_passThroughLine(%flash_state_4_3, %10, %c256_i32) : (memref<256xbf16>, memref<256xbf16>, i32) -> ()
          aie.objectfifo.release @flash_scale_4_3_4_4(Produce, 1)
          aie.objectfifo.release @of_7_unicast_4_0(Consume, 1)
          aie.objectfifo.release @of_8_unicast_4(Produce, 1)
        }
      }
      aie.end
    } {link_with = "op0_mha.o"}
    %flash_state_5_3 = aie.buffer(%tile_5_3) {sym_name = "flash_state_5_3"} : memref<256xbf16> 
    %flash_index_5_3 = aie.buffer(%tile_5_3) {sym_name = "flash_index_5_3"} : memref<2xi32> 
    aie.objectfifo @flash_scale_5_3_5_4(%tile_5_3, {%tile_5_4}, 2 : i32) : !aie.objectfifo<memref<256xbf16>>  
    %core_5_3 = aie.core(%tile_5_3) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c8 = arith.constant 8 : index
        scf.for %arg1 = %c0_0 to %c8 step %c1_1 {
          %0 = aie.objectfifo.acquire @of_8_unicast_5(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
          %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
          %2 = aie.objectfifo.acquire @of_7_unicast_5_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
          %3 = aie.objectfifo.subview.access %2[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
          %4 = arith.index_cast %arg1 : index to i32
          %c1_i32 = arith.constant 1 : i32
          %5 = arith.muli %4, %c1_i32 : i32
          %c0_i32 = arith.constant 0 : i32
          %6 = arith.addi %c0_i32, %5 : i32
          %c5_i32 = arith.constant 5 : i32
          %c0_2 = arith.constant 0 : index
          %c1_3 = arith.constant 1 : index
          memref.store %6, %flash_index_5_3[%c0_2] : memref<2xi32>
          memref.store %c5_i32, %flash_index_5_3[%c1_3] : memref<2xi32>
          %c64_i32 = arith.constant 64 : i32
          %c0_i32_4 = arith.constant 0 : i32
          %7 = arith.cmpi eq, %6, %c0_i32_4 : i32
          scf.if %7 {
            func.call @op0_init_scale_buffer(%flash_state_5_3, %c64_i32) : (memref<256xbf16>, i32) -> ()
          }
          %cst = arith.constant 1.4453125 : f32
          %8 = arith.truncf %cst : f32 to bf16
          %c64_i32_5 = arith.constant 64 : i32
          %c512_i32 = arith.constant 512 : i32
          %c512_i32_6 = arith.constant 512 : i32
          %c0_i32_7 = arith.constant 0 : i32
          func.call @op0_partial_softmax(%3, %1, %flash_state_5_3, %flash_index_5_3, %8, %c64_i32, %c64_i32_5, %c512_i32, %c512_i32_6) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<256xbf16>, memref<2xi32>, bf16, i32, i32, i32, i32) -> ()
          %c256_i32 = arith.constant 256 : i32
          %9 = aie.objectfifo.acquire @flash_scale_5_3_5_4(Produce, 1) : !aie.objectfifosubview<memref<256xbf16>>
          %10 = aie.objectfifo.subview.access %9[0] : !aie.objectfifosubview<memref<256xbf16>> -> memref<256xbf16>
          func.call @op0_passThroughLine(%flash_state_5_3, %10, %c256_i32) : (memref<256xbf16>, memref<256xbf16>, i32) -> ()
          aie.objectfifo.release @flash_scale_5_3_5_4(Produce, 1)
          aie.objectfifo.release @of_7_unicast_5_0(Consume, 1)
          aie.objectfifo.release @of_8_unicast_5(Produce, 1)
        }
      }
      aie.end
    } {link_with = "op0_mha.o"}
    %flash_state_6_3 = aie.buffer(%tile_6_3) {sym_name = "flash_state_6_3"} : memref<256xbf16> 
    %flash_index_6_3 = aie.buffer(%tile_6_3) {sym_name = "flash_index_6_3"} : memref<2xi32> 
    aie.objectfifo @flash_scale_6_3_6_4(%tile_6_3, {%tile_6_4}, 2 : i32) : !aie.objectfifo<memref<256xbf16>>  
    %core_6_3 = aie.core(%tile_6_3) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c8 = arith.constant 8 : index
        scf.for %arg1 = %c0_0 to %c8 step %c1_1 {
          %0 = aie.objectfifo.acquire @of_8_unicast_6(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
          %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
          %2 = aie.objectfifo.acquire @of_7_unicast_6_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
          %3 = aie.objectfifo.subview.access %2[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
          %4 = arith.index_cast %arg1 : index to i32
          %c1_i32 = arith.constant 1 : i32
          %5 = arith.muli %4, %c1_i32 : i32
          %c0_i32 = arith.constant 0 : i32
          %6 = arith.addi %c0_i32, %5 : i32
          %c6_i32 = arith.constant 6 : i32
          %c0_2 = arith.constant 0 : index
          %c1_3 = arith.constant 1 : index
          memref.store %6, %flash_index_6_3[%c0_2] : memref<2xi32>
          memref.store %c6_i32, %flash_index_6_3[%c1_3] : memref<2xi32>
          %c64_i32 = arith.constant 64 : i32
          %c0_i32_4 = arith.constant 0 : i32
          %7 = arith.cmpi eq, %6, %c0_i32_4 : i32
          scf.if %7 {
            func.call @op0_init_scale_buffer(%flash_state_6_3, %c64_i32) : (memref<256xbf16>, i32) -> ()
          }
          %cst = arith.constant 1.4453125 : f32
          %8 = arith.truncf %cst : f32 to bf16
          %c64_i32_5 = arith.constant 64 : i32
          %c512_i32 = arith.constant 512 : i32
          %c512_i32_6 = arith.constant 512 : i32
          %c0_i32_7 = arith.constant 0 : i32
          func.call @op0_partial_softmax(%3, %1, %flash_state_6_3, %flash_index_6_3, %8, %c64_i32, %c64_i32_5, %c512_i32, %c512_i32_6) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<256xbf16>, memref<2xi32>, bf16, i32, i32, i32, i32) -> ()
          %c256_i32 = arith.constant 256 : i32
          %9 = aie.objectfifo.acquire @flash_scale_6_3_6_4(Produce, 1) : !aie.objectfifosubview<memref<256xbf16>>
          %10 = aie.objectfifo.subview.access %9[0] : !aie.objectfifosubview<memref<256xbf16>> -> memref<256xbf16>
          func.call @op0_passThroughLine(%flash_state_6_3, %10, %c256_i32) : (memref<256xbf16>, memref<256xbf16>, i32) -> ()
          aie.objectfifo.release @flash_scale_6_3_6_4(Produce, 1)
          aie.objectfifo.release @of_7_unicast_6_0(Consume, 1)
          aie.objectfifo.release @of_8_unicast_6(Produce, 1)
        }
      }
      aie.end
    } {link_with = "op0_mha.o"}
    %flash_state_7_3 = aie.buffer(%tile_7_3) {sym_name = "flash_state_7_3"} : memref<256xbf16> 
    %flash_index_7_3 = aie.buffer(%tile_7_3) {sym_name = "flash_index_7_3"} : memref<2xi32> 
    aie.objectfifo @flash_scale_7_3_7_4(%tile_7_3, {%tile_7_4}, 2 : i32) : !aie.objectfifo<memref<256xbf16>>  
    %core_7_3 = aie.core(%tile_7_3) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c8 = arith.constant 8 : index
        scf.for %arg1 = %c0_0 to %c8 step %c1_1 {
          %0 = aie.objectfifo.acquire @of_8_unicast_7(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
          %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
          %2 = aie.objectfifo.acquire @of_7_unicast_7_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
          %3 = aie.objectfifo.subview.access %2[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
          %4 = arith.index_cast %arg1 : index to i32
          %c1_i32 = arith.constant 1 : i32
          %5 = arith.muli %4, %c1_i32 : i32
          %c0_i32 = arith.constant 0 : i32
          %6 = arith.addi %c0_i32, %5 : i32
          %c7_i32 = arith.constant 7 : i32
          %c0_2 = arith.constant 0 : index
          %c1_3 = arith.constant 1 : index
          memref.store %6, %flash_index_7_3[%c0_2] : memref<2xi32>
          memref.store %c7_i32, %flash_index_7_3[%c1_3] : memref<2xi32>
          %c64_i32 = arith.constant 64 : i32
          %c0_i32_4 = arith.constant 0 : i32
          %7 = arith.cmpi eq, %6, %c0_i32_4 : i32
          scf.if %7 {
            func.call @op0_init_scale_buffer(%flash_state_7_3, %c64_i32) : (memref<256xbf16>, i32) -> ()
          }
          %cst = arith.constant 1.4453125 : f32
          %8 = arith.truncf %cst : f32 to bf16
          %c64_i32_5 = arith.constant 64 : i32
          %c512_i32 = arith.constant 512 : i32
          %c512_i32_6 = arith.constant 512 : i32
          %c0_i32_7 = arith.constant 0 : i32
          func.call @op0_partial_softmax(%3, %1, %flash_state_7_3, %flash_index_7_3, %8, %c64_i32, %c64_i32_5, %c512_i32, %c512_i32_6) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<256xbf16>, memref<2xi32>, bf16, i32, i32, i32, i32) -> ()
          %c256_i32 = arith.constant 256 : i32
          %9 = aie.objectfifo.acquire @flash_scale_7_3_7_4(Produce, 1) : !aie.objectfifosubview<memref<256xbf16>>
          %10 = aie.objectfifo.subview.access %9[0] : !aie.objectfifosubview<memref<256xbf16>> -> memref<256xbf16>
          func.call @op0_passThroughLine(%flash_state_7_3, %10, %c256_i32) : (memref<256xbf16>, memref<256xbf16>, i32) -> ()
          aie.objectfifo.release @flash_scale_7_3_7_4(Produce, 1)
          aie.objectfifo.release @of_7_unicast_7_0(Consume, 1)
          aie.objectfifo.release @of_8_unicast_7(Produce, 1)
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
    aie.objectfifo @of_1_mem(%shim_noc_tile_1_0, {%mem_tile_1_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_2_mem(%shim_noc_tile_3_0, {%mem_tile_3_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_3_unicast_0_0(%mem_tile_0_1 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%tile_0_2}, [2 : i32, 1 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo.link [@of_0_mem_0] -> [@of_3_unicast_0_0]([] [])
    aie.objectfifo @of_3_unicast_1_0(%mem_tile_1_1 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%tile_1_2}, [2 : i32, 1 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo.link [@of_0_mem_1] -> [@of_3_unicast_1_0]([] [])
    aie.objectfifo @of_3_unicast_2_0(%mem_tile_2_1 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%tile_2_2}, [2 : i32, 1 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo.link [@of_0_mem_2] -> [@of_3_unicast_2_0]([] [])
    aie.objectfifo @of_3_unicast_3_0(%mem_tile_3_1 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%tile_3_2}, [2 : i32, 1 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo.link [@of_0_mem_3] -> [@of_3_unicast_3_0]([] [])
    aie.objectfifo @of_3_unicast_4_0(%mem_tile_4_1 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%tile_4_2}, [2 : i32, 1 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo.link [@of_0_mem_4] -> [@of_3_unicast_4_0]([] [])
    aie.objectfifo @of_3_unicast_5_0(%mem_tile_5_1 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%tile_5_2}, [2 : i32, 1 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo.link [@of_0_mem_5] -> [@of_3_unicast_5_0]([] [])
    aie.objectfifo @of_3_unicast_6_0(%mem_tile_6_1 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%tile_6_2}, [2 : i32, 1 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo.link [@of_0_mem_6] -> [@of_3_unicast_6_0]([] [])
    aie.objectfifo @of_3_unicast_7_0(%mem_tile_7_1 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%tile_7_2}, [2 : i32, 1 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo.link [@of_0_mem_7] -> [@of_3_unicast_7_0]([] [])
    aie.objectfifo @of_4_broadcast_0_0(%mem_tile_1_1 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%tile_0_2, %tile_1_2, %tile_2_2, %tile_3_2, %tile_4_2, %tile_5_2, %tile_6_2, %tile_7_2}, [2 : i32, 2 : i32, 2 : i32, 2 : i32, 2 : i32, 2 : i32, 2 : i32, 2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo.link [@of_1_mem] -> [@of_4_broadcast_0_0]([] [])
    aie.objectfifo @of_5_broadcast_0_0(%mem_tile_3_1 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%tile_0_4, %tile_1_4, %tile_2_4, %tile_3_4, %tile_4_4, %tile_5_4, %tile_6_4, %tile_7_4}, [2 : i32, 2 : i32, 2 : i32, 2 : i32, 2 : i32, 2 : i32, 2 : i32, 2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
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
    aie.runtime_sequence(%arg0: memref<4718592xbf16>, %arg1: memref<1572864xbf16>, %arg2: memref<1xbf16>) {
      aiex.configure @op0__MHAStreamGroup {
        %subview = memref.subview %arg0[0] [32768] [1] : memref<4718592xbf16> to memref<32768xbf16>
        %reinterpret_cast = memref.reinterpret_cast %subview to offset: [0], sizes: [512, 64], strides: [64, 1] : memref<32768xbf16> to memref<512x64xbf16>
        %subview_0 = memref.subview %arg0[1572864] [32768] [1] : memref<4718592xbf16> to memref<32768xbf16, strided<[1], offset: 1572864>>
        %reinterpret_cast_1 = memref.reinterpret_cast %subview_0 to offset: [0], sizes: [64, 512], strides: [512, 1] : memref<32768xbf16, strided<[1], offset: 1572864>> to memref<64x512xbf16>
        %subview_2 = memref.subview %arg0[3145728] [32768] [1] : memref<4718592xbf16> to memref<32768xbf16, strided<[1], offset: 3145728>>
        %reinterpret_cast_3 = memref.reinterpret_cast %subview_2 to offset: [0], sizes: [512, 64], strides: [64, 1] : memref<32768xbf16, strided<[1], offset: 3145728>> to memref<512x64xbf16>
        %subview_4 = memref.subview %arg1[0] [32768] [1] : memref<1572864xbf16> to memref<32768xbf16>
        %reinterpret_cast_5 = memref.reinterpret_cast %subview_4 to offset: [0], sizes: [512, 64], strides: [64, 1] : memref<32768xbf16> to memref<512x64xbf16>
        aiex.run @sequence(%reinterpret_cast, %reinterpret_cast_1, %reinterpret_cast_3, %reinterpret_cast_5) : (memref<512x64xbf16>, memref<64x512xbf16>, memref<512x64xbf16>, memref<512x64xbf16>)
        %subview_6 = memref.subview %arg0[32768] [32768] [1] : memref<4718592xbf16> to memref<32768xbf16, strided<[1], offset: 32768>>
        %reinterpret_cast_7 = memref.reinterpret_cast %subview_6 to offset: [0], sizes: [512, 64], strides: [64, 1] : memref<32768xbf16, strided<[1], offset: 32768>> to memref<512x64xbf16>
        %subview_8 = memref.subview %arg0[1605632] [32768] [1] : memref<4718592xbf16> to memref<32768xbf16, strided<[1], offset: 1605632>>
        %reinterpret_cast_9 = memref.reinterpret_cast %subview_8 to offset: [0], sizes: [64, 512], strides: [512, 1] : memref<32768xbf16, strided<[1], offset: 1605632>> to memref<64x512xbf16>
        %subview_10 = memref.subview %arg0[3178496] [32768] [1] : memref<4718592xbf16> to memref<32768xbf16, strided<[1], offset: 3178496>>
        %reinterpret_cast_11 = memref.reinterpret_cast %subview_10 to offset: [0], sizes: [512, 64], strides: [64, 1] : memref<32768xbf16, strided<[1], offset: 3178496>> to memref<512x64xbf16>
        %subview_12 = memref.subview %arg1[32768] [32768] [1] : memref<1572864xbf16> to memref<32768xbf16, strided<[1], offset: 32768>>
        %reinterpret_cast_13 = memref.reinterpret_cast %subview_12 to offset: [0], sizes: [512, 64], strides: [64, 1] : memref<32768xbf16, strided<[1], offset: 32768>> to memref<512x64xbf16>
        aiex.run @sequence(%reinterpret_cast_7, %reinterpret_cast_9, %reinterpret_cast_11, %reinterpret_cast_13) : (memref<512x64xbf16>, memref<64x512xbf16>, memref<512x64xbf16>, memref<512x64xbf16>)
        %subview_14 = memref.subview %arg0[65536] [32768] [1] : memref<4718592xbf16> to memref<32768xbf16, strided<[1], offset: 65536>>
        %reinterpret_cast_15 = memref.reinterpret_cast %subview_14 to offset: [0], sizes: [512, 64], strides: [64, 1] : memref<32768xbf16, strided<[1], offset: 65536>> to memref<512x64xbf16>
        %subview_16 = memref.subview %arg0[1638400] [32768] [1] : memref<4718592xbf16> to memref<32768xbf16, strided<[1], offset: 1638400>>
        %reinterpret_cast_17 = memref.reinterpret_cast %subview_16 to offset: [0], sizes: [64, 512], strides: [512, 1] : memref<32768xbf16, strided<[1], offset: 1638400>> to memref<64x512xbf16>
        %subview_18 = memref.subview %arg0[3211264] [32768] [1] : memref<4718592xbf16> to memref<32768xbf16, strided<[1], offset: 3211264>>
        %reinterpret_cast_19 = memref.reinterpret_cast %subview_18 to offset: [0], sizes: [512, 64], strides: [64, 1] : memref<32768xbf16, strided<[1], offset: 3211264>> to memref<512x64xbf16>
        %subview_20 = memref.subview %arg1[65536] [32768] [1] : memref<1572864xbf16> to memref<32768xbf16, strided<[1], offset: 65536>>
        %reinterpret_cast_21 = memref.reinterpret_cast %subview_20 to offset: [0], sizes: [512, 64], strides: [64, 1] : memref<32768xbf16, strided<[1], offset: 65536>> to memref<512x64xbf16>
        aiex.run @sequence(%reinterpret_cast_15, %reinterpret_cast_17, %reinterpret_cast_19, %reinterpret_cast_21) : (memref<512x64xbf16>, memref<64x512xbf16>, memref<512x64xbf16>, memref<512x64xbf16>)
        %subview_22 = memref.subview %arg0[98304] [32768] [1] : memref<4718592xbf16> to memref<32768xbf16, strided<[1], offset: 98304>>
        %reinterpret_cast_23 = memref.reinterpret_cast %subview_22 to offset: [0], sizes: [512, 64], strides: [64, 1] : memref<32768xbf16, strided<[1], offset: 98304>> to memref<512x64xbf16>
        %subview_24 = memref.subview %arg0[1671168] [32768] [1] : memref<4718592xbf16> to memref<32768xbf16, strided<[1], offset: 1671168>>
        %reinterpret_cast_25 = memref.reinterpret_cast %subview_24 to offset: [0], sizes: [64, 512], strides: [512, 1] : memref<32768xbf16, strided<[1], offset: 1671168>> to memref<64x512xbf16>
        %subview_26 = memref.subview %arg0[3244032] [32768] [1] : memref<4718592xbf16> to memref<32768xbf16, strided<[1], offset: 3244032>>
        %reinterpret_cast_27 = memref.reinterpret_cast %subview_26 to offset: [0], sizes: [512, 64], strides: [64, 1] : memref<32768xbf16, strided<[1], offset: 3244032>> to memref<512x64xbf16>
        %subview_28 = memref.subview %arg1[98304] [32768] [1] : memref<1572864xbf16> to memref<32768xbf16, strided<[1], offset: 98304>>
        %reinterpret_cast_29 = memref.reinterpret_cast %subview_28 to offset: [0], sizes: [512, 64], strides: [64, 1] : memref<32768xbf16, strided<[1], offset: 98304>> to memref<512x64xbf16>
        aiex.run @sequence(%reinterpret_cast_23, %reinterpret_cast_25, %reinterpret_cast_27, %reinterpret_cast_29) : (memref<512x64xbf16>, memref<64x512xbf16>, memref<512x64xbf16>, memref<512x64xbf16>)
        %subview_30 = memref.subview %arg0[131072] [32768] [1] : memref<4718592xbf16> to memref<32768xbf16, strided<[1], offset: 131072>>
        %reinterpret_cast_31 = memref.reinterpret_cast %subview_30 to offset: [0], sizes: [512, 64], strides: [64, 1] : memref<32768xbf16, strided<[1], offset: 131072>> to memref<512x64xbf16>
        %subview_32 = memref.subview %arg0[1703936] [32768] [1] : memref<4718592xbf16> to memref<32768xbf16, strided<[1], offset: 1703936>>
        %reinterpret_cast_33 = memref.reinterpret_cast %subview_32 to offset: [0], sizes: [64, 512], strides: [512, 1] : memref<32768xbf16, strided<[1], offset: 1703936>> to memref<64x512xbf16>
        %subview_34 = memref.subview %arg0[3276800] [32768] [1] : memref<4718592xbf16> to memref<32768xbf16, strided<[1], offset: 3276800>>
        %reinterpret_cast_35 = memref.reinterpret_cast %subview_34 to offset: [0], sizes: [512, 64], strides: [64, 1] : memref<32768xbf16, strided<[1], offset: 3276800>> to memref<512x64xbf16>
        %subview_36 = memref.subview %arg1[131072] [32768] [1] : memref<1572864xbf16> to memref<32768xbf16, strided<[1], offset: 131072>>
        %reinterpret_cast_37 = memref.reinterpret_cast %subview_36 to offset: [0], sizes: [512, 64], strides: [64, 1] : memref<32768xbf16, strided<[1], offset: 131072>> to memref<512x64xbf16>
        aiex.run @sequence(%reinterpret_cast_31, %reinterpret_cast_33, %reinterpret_cast_35, %reinterpret_cast_37) : (memref<512x64xbf16>, memref<64x512xbf16>, memref<512x64xbf16>, memref<512x64xbf16>)
        %subview_38 = memref.subview %arg0[163840] [32768] [1] : memref<4718592xbf16> to memref<32768xbf16, strided<[1], offset: 163840>>
        %reinterpret_cast_39 = memref.reinterpret_cast %subview_38 to offset: [0], sizes: [512, 64], strides: [64, 1] : memref<32768xbf16, strided<[1], offset: 163840>> to memref<512x64xbf16>
        %subview_40 = memref.subview %arg0[1736704] [32768] [1] : memref<4718592xbf16> to memref<32768xbf16, strided<[1], offset: 1736704>>
        %reinterpret_cast_41 = memref.reinterpret_cast %subview_40 to offset: [0], sizes: [64, 512], strides: [512, 1] : memref<32768xbf16, strided<[1], offset: 1736704>> to memref<64x512xbf16>
        %subview_42 = memref.subview %arg0[3309568] [32768] [1] : memref<4718592xbf16> to memref<32768xbf16, strided<[1], offset: 3309568>>
        %reinterpret_cast_43 = memref.reinterpret_cast %subview_42 to offset: [0], sizes: [512, 64], strides: [64, 1] : memref<32768xbf16, strided<[1], offset: 3309568>> to memref<512x64xbf16>
        %subview_44 = memref.subview %arg1[163840] [32768] [1] : memref<1572864xbf16> to memref<32768xbf16, strided<[1], offset: 163840>>
        %reinterpret_cast_45 = memref.reinterpret_cast %subview_44 to offset: [0], sizes: [512, 64], strides: [64, 1] : memref<32768xbf16, strided<[1], offset: 163840>> to memref<512x64xbf16>
        aiex.run @sequence(%reinterpret_cast_39, %reinterpret_cast_41, %reinterpret_cast_43, %reinterpret_cast_45) : (memref<512x64xbf16>, memref<64x512xbf16>, memref<512x64xbf16>, memref<512x64xbf16>)
        %subview_46 = memref.subview %arg0[196608] [32768] [1] : memref<4718592xbf16> to memref<32768xbf16, strided<[1], offset: 196608>>
        %reinterpret_cast_47 = memref.reinterpret_cast %subview_46 to offset: [0], sizes: [512, 64], strides: [64, 1] : memref<32768xbf16, strided<[1], offset: 196608>> to memref<512x64xbf16>
        %subview_48 = memref.subview %arg0[1769472] [32768] [1] : memref<4718592xbf16> to memref<32768xbf16, strided<[1], offset: 1769472>>
        %reinterpret_cast_49 = memref.reinterpret_cast %subview_48 to offset: [0], sizes: [64, 512], strides: [512, 1] : memref<32768xbf16, strided<[1], offset: 1769472>> to memref<64x512xbf16>
        %subview_50 = memref.subview %arg0[3342336] [32768] [1] : memref<4718592xbf16> to memref<32768xbf16, strided<[1], offset: 3342336>>
        %reinterpret_cast_51 = memref.reinterpret_cast %subview_50 to offset: [0], sizes: [512, 64], strides: [64, 1] : memref<32768xbf16, strided<[1], offset: 3342336>> to memref<512x64xbf16>
        %subview_52 = memref.subview %arg1[196608] [32768] [1] : memref<1572864xbf16> to memref<32768xbf16, strided<[1], offset: 196608>>
        %reinterpret_cast_53 = memref.reinterpret_cast %subview_52 to offset: [0], sizes: [512, 64], strides: [64, 1] : memref<32768xbf16, strided<[1], offset: 196608>> to memref<512x64xbf16>
        aiex.run @sequence(%reinterpret_cast_47, %reinterpret_cast_49, %reinterpret_cast_51, %reinterpret_cast_53) : (memref<512x64xbf16>, memref<64x512xbf16>, memref<512x64xbf16>, memref<512x64xbf16>)
        %subview_54 = memref.subview %arg0[229376] [32768] [1] : memref<4718592xbf16> to memref<32768xbf16, strided<[1], offset: 229376>>
        %reinterpret_cast_55 = memref.reinterpret_cast %subview_54 to offset: [0], sizes: [512, 64], strides: [64, 1] : memref<32768xbf16, strided<[1], offset: 229376>> to memref<512x64xbf16>
        %subview_56 = memref.subview %arg0[1802240] [32768] [1] : memref<4718592xbf16> to memref<32768xbf16, strided<[1], offset: 1802240>>
        %reinterpret_cast_57 = memref.reinterpret_cast %subview_56 to offset: [0], sizes: [64, 512], strides: [512, 1] : memref<32768xbf16, strided<[1], offset: 1802240>> to memref<64x512xbf16>
        %subview_58 = memref.subview %arg0[3375104] [32768] [1] : memref<4718592xbf16> to memref<32768xbf16, strided<[1], offset: 3375104>>
        %reinterpret_cast_59 = memref.reinterpret_cast %subview_58 to offset: [0], sizes: [512, 64], strides: [64, 1] : memref<32768xbf16, strided<[1], offset: 3375104>> to memref<512x64xbf16>
        %subview_60 = memref.subview %arg1[229376] [32768] [1] : memref<1572864xbf16> to memref<32768xbf16, strided<[1], offset: 229376>>
        %reinterpret_cast_61 = memref.reinterpret_cast %subview_60 to offset: [0], sizes: [512, 64], strides: [64, 1] : memref<32768xbf16, strided<[1], offset: 229376>> to memref<512x64xbf16>
        aiex.run @sequence(%reinterpret_cast_55, %reinterpret_cast_57, %reinterpret_cast_59, %reinterpret_cast_61) : (memref<512x64xbf16>, memref<64x512xbf16>, memref<512x64xbf16>, memref<512x64xbf16>)
        %subview_62 = memref.subview %arg0[262144] [32768] [1] : memref<4718592xbf16> to memref<32768xbf16, strided<[1], offset: 262144>>
        %reinterpret_cast_63 = memref.reinterpret_cast %subview_62 to offset: [0], sizes: [512, 64], strides: [64, 1] : memref<32768xbf16, strided<[1], offset: 262144>> to memref<512x64xbf16>
        %subview_64 = memref.subview %arg0[1835008] [32768] [1] : memref<4718592xbf16> to memref<32768xbf16, strided<[1], offset: 1835008>>
        %reinterpret_cast_65 = memref.reinterpret_cast %subview_64 to offset: [0], sizes: [64, 512], strides: [512, 1] : memref<32768xbf16, strided<[1], offset: 1835008>> to memref<64x512xbf16>
        %subview_66 = memref.subview %arg0[3407872] [32768] [1] : memref<4718592xbf16> to memref<32768xbf16, strided<[1], offset: 3407872>>
        %reinterpret_cast_67 = memref.reinterpret_cast %subview_66 to offset: [0], sizes: [512, 64], strides: [64, 1] : memref<32768xbf16, strided<[1], offset: 3407872>> to memref<512x64xbf16>
        %subview_68 = memref.subview %arg1[262144] [32768] [1] : memref<1572864xbf16> to memref<32768xbf16, strided<[1], offset: 262144>>
        %reinterpret_cast_69 = memref.reinterpret_cast %subview_68 to offset: [0], sizes: [512, 64], strides: [64, 1] : memref<32768xbf16, strided<[1], offset: 262144>> to memref<512x64xbf16>
        aiex.run @sequence(%reinterpret_cast_63, %reinterpret_cast_65, %reinterpret_cast_67, %reinterpret_cast_69) : (memref<512x64xbf16>, memref<64x512xbf16>, memref<512x64xbf16>, memref<512x64xbf16>)
        %subview_70 = memref.subview %arg0[294912] [32768] [1] : memref<4718592xbf16> to memref<32768xbf16, strided<[1], offset: 294912>>
        %reinterpret_cast_71 = memref.reinterpret_cast %subview_70 to offset: [0], sizes: [512, 64], strides: [64, 1] : memref<32768xbf16, strided<[1], offset: 294912>> to memref<512x64xbf16>
        %subview_72 = memref.subview %arg0[1867776] [32768] [1] : memref<4718592xbf16> to memref<32768xbf16, strided<[1], offset: 1867776>>
        %reinterpret_cast_73 = memref.reinterpret_cast %subview_72 to offset: [0], sizes: [64, 512], strides: [512, 1] : memref<32768xbf16, strided<[1], offset: 1867776>> to memref<64x512xbf16>
        %subview_74 = memref.subview %arg0[3440640] [32768] [1] : memref<4718592xbf16> to memref<32768xbf16, strided<[1], offset: 3440640>>
        %reinterpret_cast_75 = memref.reinterpret_cast %subview_74 to offset: [0], sizes: [512, 64], strides: [64, 1] : memref<32768xbf16, strided<[1], offset: 3440640>> to memref<512x64xbf16>
        %subview_76 = memref.subview %arg1[294912] [32768] [1] : memref<1572864xbf16> to memref<32768xbf16, strided<[1], offset: 294912>>
        %reinterpret_cast_77 = memref.reinterpret_cast %subview_76 to offset: [0], sizes: [512, 64], strides: [64, 1] : memref<32768xbf16, strided<[1], offset: 294912>> to memref<512x64xbf16>
        aiex.run @sequence(%reinterpret_cast_71, %reinterpret_cast_73, %reinterpret_cast_75, %reinterpret_cast_77) : (memref<512x64xbf16>, memref<64x512xbf16>, memref<512x64xbf16>, memref<512x64xbf16>)
        %subview_78 = memref.subview %arg0[327680] [32768] [1] : memref<4718592xbf16> to memref<32768xbf16, strided<[1], offset: 327680>>
        %reinterpret_cast_79 = memref.reinterpret_cast %subview_78 to offset: [0], sizes: [512, 64], strides: [64, 1] : memref<32768xbf16, strided<[1], offset: 327680>> to memref<512x64xbf16>
        %subview_80 = memref.subview %arg0[1900544] [32768] [1] : memref<4718592xbf16> to memref<32768xbf16, strided<[1], offset: 1900544>>
        %reinterpret_cast_81 = memref.reinterpret_cast %subview_80 to offset: [0], sizes: [64, 512], strides: [512, 1] : memref<32768xbf16, strided<[1], offset: 1900544>> to memref<64x512xbf16>
        %subview_82 = memref.subview %arg0[3473408] [32768] [1] : memref<4718592xbf16> to memref<32768xbf16, strided<[1], offset: 3473408>>
        %reinterpret_cast_83 = memref.reinterpret_cast %subview_82 to offset: [0], sizes: [512, 64], strides: [64, 1] : memref<32768xbf16, strided<[1], offset: 3473408>> to memref<512x64xbf16>
        %subview_84 = memref.subview %arg1[327680] [32768] [1] : memref<1572864xbf16> to memref<32768xbf16, strided<[1], offset: 327680>>
        %reinterpret_cast_85 = memref.reinterpret_cast %subview_84 to offset: [0], sizes: [512, 64], strides: [64, 1] : memref<32768xbf16, strided<[1], offset: 327680>> to memref<512x64xbf16>
        aiex.run @sequence(%reinterpret_cast_79, %reinterpret_cast_81, %reinterpret_cast_83, %reinterpret_cast_85) : (memref<512x64xbf16>, memref<64x512xbf16>, memref<512x64xbf16>, memref<512x64xbf16>)
        %subview_86 = memref.subview %arg0[360448] [32768] [1] : memref<4718592xbf16> to memref<32768xbf16, strided<[1], offset: 360448>>
        %reinterpret_cast_87 = memref.reinterpret_cast %subview_86 to offset: [0], sizes: [512, 64], strides: [64, 1] : memref<32768xbf16, strided<[1], offset: 360448>> to memref<512x64xbf16>
        %subview_88 = memref.subview %arg0[1933312] [32768] [1] : memref<4718592xbf16> to memref<32768xbf16, strided<[1], offset: 1933312>>
        %reinterpret_cast_89 = memref.reinterpret_cast %subview_88 to offset: [0], sizes: [64, 512], strides: [512, 1] : memref<32768xbf16, strided<[1], offset: 1933312>> to memref<64x512xbf16>
        %subview_90 = memref.subview %arg0[3506176] [32768] [1] : memref<4718592xbf16> to memref<32768xbf16, strided<[1], offset: 3506176>>
        %reinterpret_cast_91 = memref.reinterpret_cast %subview_90 to offset: [0], sizes: [512, 64], strides: [64, 1] : memref<32768xbf16, strided<[1], offset: 3506176>> to memref<512x64xbf16>
        %subview_92 = memref.subview %arg1[360448] [32768] [1] : memref<1572864xbf16> to memref<32768xbf16, strided<[1], offset: 360448>>
        %reinterpret_cast_93 = memref.reinterpret_cast %subview_92 to offset: [0], sizes: [512, 64], strides: [64, 1] : memref<32768xbf16, strided<[1], offset: 360448>> to memref<512x64xbf16>
        aiex.run @sequence(%reinterpret_cast_87, %reinterpret_cast_89, %reinterpret_cast_91, %reinterpret_cast_93) : (memref<512x64xbf16>, memref<64x512xbf16>, memref<512x64xbf16>, memref<512x64xbf16>)
        %subview_94 = memref.subview %arg0[393216] [32768] [1] : memref<4718592xbf16> to memref<32768xbf16, strided<[1], offset: 393216>>
        %reinterpret_cast_95 = memref.reinterpret_cast %subview_94 to offset: [0], sizes: [512, 64], strides: [64, 1] : memref<32768xbf16, strided<[1], offset: 393216>> to memref<512x64xbf16>
        %subview_96 = memref.subview %arg0[1966080] [32768] [1] : memref<4718592xbf16> to memref<32768xbf16, strided<[1], offset: 1966080>>
        %reinterpret_cast_97 = memref.reinterpret_cast %subview_96 to offset: [0], sizes: [64, 512], strides: [512, 1] : memref<32768xbf16, strided<[1], offset: 1966080>> to memref<64x512xbf16>
        %subview_98 = memref.subview %arg0[3538944] [32768] [1] : memref<4718592xbf16> to memref<32768xbf16, strided<[1], offset: 3538944>>
        %reinterpret_cast_99 = memref.reinterpret_cast %subview_98 to offset: [0], sizes: [512, 64], strides: [64, 1] : memref<32768xbf16, strided<[1], offset: 3538944>> to memref<512x64xbf16>
        %subview_100 = memref.subview %arg1[393216] [32768] [1] : memref<1572864xbf16> to memref<32768xbf16, strided<[1], offset: 393216>>
        %reinterpret_cast_101 = memref.reinterpret_cast %subview_100 to offset: [0], sizes: [512, 64], strides: [64, 1] : memref<32768xbf16, strided<[1], offset: 393216>> to memref<512x64xbf16>
        aiex.run @sequence(%reinterpret_cast_95, %reinterpret_cast_97, %reinterpret_cast_99, %reinterpret_cast_101) : (memref<512x64xbf16>, memref<64x512xbf16>, memref<512x64xbf16>, memref<512x64xbf16>)
        %subview_102 = memref.subview %arg0[425984] [32768] [1] : memref<4718592xbf16> to memref<32768xbf16, strided<[1], offset: 425984>>
        %reinterpret_cast_103 = memref.reinterpret_cast %subview_102 to offset: [0], sizes: [512, 64], strides: [64, 1] : memref<32768xbf16, strided<[1], offset: 425984>> to memref<512x64xbf16>
        %subview_104 = memref.subview %arg0[1998848] [32768] [1] : memref<4718592xbf16> to memref<32768xbf16, strided<[1], offset: 1998848>>
        %reinterpret_cast_105 = memref.reinterpret_cast %subview_104 to offset: [0], sizes: [64, 512], strides: [512, 1] : memref<32768xbf16, strided<[1], offset: 1998848>> to memref<64x512xbf16>
        %subview_106 = memref.subview %arg0[3571712] [32768] [1] : memref<4718592xbf16> to memref<32768xbf16, strided<[1], offset: 3571712>>
        %reinterpret_cast_107 = memref.reinterpret_cast %subview_106 to offset: [0], sizes: [512, 64], strides: [64, 1] : memref<32768xbf16, strided<[1], offset: 3571712>> to memref<512x64xbf16>
        %subview_108 = memref.subview %arg1[425984] [32768] [1] : memref<1572864xbf16> to memref<32768xbf16, strided<[1], offset: 425984>>
        %reinterpret_cast_109 = memref.reinterpret_cast %subview_108 to offset: [0], sizes: [512, 64], strides: [64, 1] : memref<32768xbf16, strided<[1], offset: 425984>> to memref<512x64xbf16>
        aiex.run @sequence(%reinterpret_cast_103, %reinterpret_cast_105, %reinterpret_cast_107, %reinterpret_cast_109) : (memref<512x64xbf16>, memref<64x512xbf16>, memref<512x64xbf16>, memref<512x64xbf16>)
        %subview_110 = memref.subview %arg0[458752] [32768] [1] : memref<4718592xbf16> to memref<32768xbf16, strided<[1], offset: 458752>>
        %reinterpret_cast_111 = memref.reinterpret_cast %subview_110 to offset: [0], sizes: [512, 64], strides: [64, 1] : memref<32768xbf16, strided<[1], offset: 458752>> to memref<512x64xbf16>
        %subview_112 = memref.subview %arg0[2031616] [32768] [1] : memref<4718592xbf16> to memref<32768xbf16, strided<[1], offset: 2031616>>
        %reinterpret_cast_113 = memref.reinterpret_cast %subview_112 to offset: [0], sizes: [64, 512], strides: [512, 1] : memref<32768xbf16, strided<[1], offset: 2031616>> to memref<64x512xbf16>
        %subview_114 = memref.subview %arg0[3604480] [32768] [1] : memref<4718592xbf16> to memref<32768xbf16, strided<[1], offset: 3604480>>
        %reinterpret_cast_115 = memref.reinterpret_cast %subview_114 to offset: [0], sizes: [512, 64], strides: [64, 1] : memref<32768xbf16, strided<[1], offset: 3604480>> to memref<512x64xbf16>
        %subview_116 = memref.subview %arg1[458752] [32768] [1] : memref<1572864xbf16> to memref<32768xbf16, strided<[1], offset: 458752>>
        %reinterpret_cast_117 = memref.reinterpret_cast %subview_116 to offset: [0], sizes: [512, 64], strides: [64, 1] : memref<32768xbf16, strided<[1], offset: 458752>> to memref<512x64xbf16>
        aiex.run @sequence(%reinterpret_cast_111, %reinterpret_cast_113, %reinterpret_cast_115, %reinterpret_cast_117) : (memref<512x64xbf16>, memref<64x512xbf16>, memref<512x64xbf16>, memref<512x64xbf16>)
        %subview_118 = memref.subview %arg0[491520] [32768] [1] : memref<4718592xbf16> to memref<32768xbf16, strided<[1], offset: 491520>>
        %reinterpret_cast_119 = memref.reinterpret_cast %subview_118 to offset: [0], sizes: [512, 64], strides: [64, 1] : memref<32768xbf16, strided<[1], offset: 491520>> to memref<512x64xbf16>
        %subview_120 = memref.subview %arg0[2064384] [32768] [1] : memref<4718592xbf16> to memref<32768xbf16, strided<[1], offset: 2064384>>
        %reinterpret_cast_121 = memref.reinterpret_cast %subview_120 to offset: [0], sizes: [64, 512], strides: [512, 1] : memref<32768xbf16, strided<[1], offset: 2064384>> to memref<64x512xbf16>
        %subview_122 = memref.subview %arg0[3637248] [32768] [1] : memref<4718592xbf16> to memref<32768xbf16, strided<[1], offset: 3637248>>
        %reinterpret_cast_123 = memref.reinterpret_cast %subview_122 to offset: [0], sizes: [512, 64], strides: [64, 1] : memref<32768xbf16, strided<[1], offset: 3637248>> to memref<512x64xbf16>
        %subview_124 = memref.subview %arg1[491520] [32768] [1] : memref<1572864xbf16> to memref<32768xbf16, strided<[1], offset: 491520>>
        %reinterpret_cast_125 = memref.reinterpret_cast %subview_124 to offset: [0], sizes: [512, 64], strides: [64, 1] : memref<32768xbf16, strided<[1], offset: 491520>> to memref<512x64xbf16>
        aiex.run @sequence(%reinterpret_cast_119, %reinterpret_cast_121, %reinterpret_cast_123, %reinterpret_cast_125) : (memref<512x64xbf16>, memref<64x512xbf16>, memref<512x64xbf16>, memref<512x64xbf16>)
        %subview_126 = memref.subview %arg0[524288] [32768] [1] : memref<4718592xbf16> to memref<32768xbf16, strided<[1], offset: 524288>>
        %reinterpret_cast_127 = memref.reinterpret_cast %subview_126 to offset: [0], sizes: [512, 64], strides: [64, 1] : memref<32768xbf16, strided<[1], offset: 524288>> to memref<512x64xbf16>
        %subview_128 = memref.subview %arg0[2097152] [32768] [1] : memref<4718592xbf16> to memref<32768xbf16, strided<[1], offset: 2097152>>
        %reinterpret_cast_129 = memref.reinterpret_cast %subview_128 to offset: [0], sizes: [64, 512], strides: [512, 1] : memref<32768xbf16, strided<[1], offset: 2097152>> to memref<64x512xbf16>
        %subview_130 = memref.subview %arg0[3670016] [32768] [1] : memref<4718592xbf16> to memref<32768xbf16, strided<[1], offset: 3670016>>
        %reinterpret_cast_131 = memref.reinterpret_cast %subview_130 to offset: [0], sizes: [512, 64], strides: [64, 1] : memref<32768xbf16, strided<[1], offset: 3670016>> to memref<512x64xbf16>
        %subview_132 = memref.subview %arg1[524288] [32768] [1] : memref<1572864xbf16> to memref<32768xbf16, strided<[1], offset: 524288>>
        %reinterpret_cast_133 = memref.reinterpret_cast %subview_132 to offset: [0], sizes: [512, 64], strides: [64, 1] : memref<32768xbf16, strided<[1], offset: 524288>> to memref<512x64xbf16>
        aiex.run @sequence(%reinterpret_cast_127, %reinterpret_cast_129, %reinterpret_cast_131, %reinterpret_cast_133) : (memref<512x64xbf16>, memref<64x512xbf16>, memref<512x64xbf16>, memref<512x64xbf16>)
        %subview_134 = memref.subview %arg0[557056] [32768] [1] : memref<4718592xbf16> to memref<32768xbf16, strided<[1], offset: 557056>>
        %reinterpret_cast_135 = memref.reinterpret_cast %subview_134 to offset: [0], sizes: [512, 64], strides: [64, 1] : memref<32768xbf16, strided<[1], offset: 557056>> to memref<512x64xbf16>
        %subview_136 = memref.subview %arg0[2129920] [32768] [1] : memref<4718592xbf16> to memref<32768xbf16, strided<[1], offset: 2129920>>
        %reinterpret_cast_137 = memref.reinterpret_cast %subview_136 to offset: [0], sizes: [64, 512], strides: [512, 1] : memref<32768xbf16, strided<[1], offset: 2129920>> to memref<64x512xbf16>
        %subview_138 = memref.subview %arg0[3702784] [32768] [1] : memref<4718592xbf16> to memref<32768xbf16, strided<[1], offset: 3702784>>
        %reinterpret_cast_139 = memref.reinterpret_cast %subview_138 to offset: [0], sizes: [512, 64], strides: [64, 1] : memref<32768xbf16, strided<[1], offset: 3702784>> to memref<512x64xbf16>
        %subview_140 = memref.subview %arg1[557056] [32768] [1] : memref<1572864xbf16> to memref<32768xbf16, strided<[1], offset: 557056>>
        %reinterpret_cast_141 = memref.reinterpret_cast %subview_140 to offset: [0], sizes: [512, 64], strides: [64, 1] : memref<32768xbf16, strided<[1], offset: 557056>> to memref<512x64xbf16>
        aiex.run @sequence(%reinterpret_cast_135, %reinterpret_cast_137, %reinterpret_cast_139, %reinterpret_cast_141) : (memref<512x64xbf16>, memref<64x512xbf16>, memref<512x64xbf16>, memref<512x64xbf16>)
        %subview_142 = memref.subview %arg0[589824] [32768] [1] : memref<4718592xbf16> to memref<32768xbf16, strided<[1], offset: 589824>>
        %reinterpret_cast_143 = memref.reinterpret_cast %subview_142 to offset: [0], sizes: [512, 64], strides: [64, 1] : memref<32768xbf16, strided<[1], offset: 589824>> to memref<512x64xbf16>
        %subview_144 = memref.subview %arg0[2162688] [32768] [1] : memref<4718592xbf16> to memref<32768xbf16, strided<[1], offset: 2162688>>
        %reinterpret_cast_145 = memref.reinterpret_cast %subview_144 to offset: [0], sizes: [64, 512], strides: [512, 1] : memref<32768xbf16, strided<[1], offset: 2162688>> to memref<64x512xbf16>
        %subview_146 = memref.subview %arg0[3735552] [32768] [1] : memref<4718592xbf16> to memref<32768xbf16, strided<[1], offset: 3735552>>
        %reinterpret_cast_147 = memref.reinterpret_cast %subview_146 to offset: [0], sizes: [512, 64], strides: [64, 1] : memref<32768xbf16, strided<[1], offset: 3735552>> to memref<512x64xbf16>
        %subview_148 = memref.subview %arg1[589824] [32768] [1] : memref<1572864xbf16> to memref<32768xbf16, strided<[1], offset: 589824>>
        %reinterpret_cast_149 = memref.reinterpret_cast %subview_148 to offset: [0], sizes: [512, 64], strides: [64, 1] : memref<32768xbf16, strided<[1], offset: 589824>> to memref<512x64xbf16>
        aiex.run @sequence(%reinterpret_cast_143, %reinterpret_cast_145, %reinterpret_cast_147, %reinterpret_cast_149) : (memref<512x64xbf16>, memref<64x512xbf16>, memref<512x64xbf16>, memref<512x64xbf16>)
        %subview_150 = memref.subview %arg0[622592] [32768] [1] : memref<4718592xbf16> to memref<32768xbf16, strided<[1], offset: 622592>>
        %reinterpret_cast_151 = memref.reinterpret_cast %subview_150 to offset: [0], sizes: [512, 64], strides: [64, 1] : memref<32768xbf16, strided<[1], offset: 622592>> to memref<512x64xbf16>
        %subview_152 = memref.subview %arg0[2195456] [32768] [1] : memref<4718592xbf16> to memref<32768xbf16, strided<[1], offset: 2195456>>
        %reinterpret_cast_153 = memref.reinterpret_cast %subview_152 to offset: [0], sizes: [64, 512], strides: [512, 1] : memref<32768xbf16, strided<[1], offset: 2195456>> to memref<64x512xbf16>
        %subview_154 = memref.subview %arg0[3768320] [32768] [1] : memref<4718592xbf16> to memref<32768xbf16, strided<[1], offset: 3768320>>
        %reinterpret_cast_155 = memref.reinterpret_cast %subview_154 to offset: [0], sizes: [512, 64], strides: [64, 1] : memref<32768xbf16, strided<[1], offset: 3768320>> to memref<512x64xbf16>
        %subview_156 = memref.subview %arg1[622592] [32768] [1] : memref<1572864xbf16> to memref<32768xbf16, strided<[1], offset: 622592>>
        %reinterpret_cast_157 = memref.reinterpret_cast %subview_156 to offset: [0], sizes: [512, 64], strides: [64, 1] : memref<32768xbf16, strided<[1], offset: 622592>> to memref<512x64xbf16>
        aiex.run @sequence(%reinterpret_cast_151, %reinterpret_cast_153, %reinterpret_cast_155, %reinterpret_cast_157) : (memref<512x64xbf16>, memref<64x512xbf16>, memref<512x64xbf16>, memref<512x64xbf16>)
        %subview_158 = memref.subview %arg0[655360] [32768] [1] : memref<4718592xbf16> to memref<32768xbf16, strided<[1], offset: 655360>>
        %reinterpret_cast_159 = memref.reinterpret_cast %subview_158 to offset: [0], sizes: [512, 64], strides: [64, 1] : memref<32768xbf16, strided<[1], offset: 655360>> to memref<512x64xbf16>
        %subview_160 = memref.subview %arg0[2228224] [32768] [1] : memref<4718592xbf16> to memref<32768xbf16, strided<[1], offset: 2228224>>
        %reinterpret_cast_161 = memref.reinterpret_cast %subview_160 to offset: [0], sizes: [64, 512], strides: [512, 1] : memref<32768xbf16, strided<[1], offset: 2228224>> to memref<64x512xbf16>
        %subview_162 = memref.subview %arg0[3801088] [32768] [1] : memref<4718592xbf16> to memref<32768xbf16, strided<[1], offset: 3801088>>
        %reinterpret_cast_163 = memref.reinterpret_cast %subview_162 to offset: [0], sizes: [512, 64], strides: [64, 1] : memref<32768xbf16, strided<[1], offset: 3801088>> to memref<512x64xbf16>
        %subview_164 = memref.subview %arg1[655360] [32768] [1] : memref<1572864xbf16> to memref<32768xbf16, strided<[1], offset: 655360>>
        %reinterpret_cast_165 = memref.reinterpret_cast %subview_164 to offset: [0], sizes: [512, 64], strides: [64, 1] : memref<32768xbf16, strided<[1], offset: 655360>> to memref<512x64xbf16>
        aiex.run @sequence(%reinterpret_cast_159, %reinterpret_cast_161, %reinterpret_cast_163, %reinterpret_cast_165) : (memref<512x64xbf16>, memref<64x512xbf16>, memref<512x64xbf16>, memref<512x64xbf16>)
        %subview_166 = memref.subview %arg0[688128] [32768] [1] : memref<4718592xbf16> to memref<32768xbf16, strided<[1], offset: 688128>>
        %reinterpret_cast_167 = memref.reinterpret_cast %subview_166 to offset: [0], sizes: [512, 64], strides: [64, 1] : memref<32768xbf16, strided<[1], offset: 688128>> to memref<512x64xbf16>
        %subview_168 = memref.subview %arg0[2260992] [32768] [1] : memref<4718592xbf16> to memref<32768xbf16, strided<[1], offset: 2260992>>
        %reinterpret_cast_169 = memref.reinterpret_cast %subview_168 to offset: [0], sizes: [64, 512], strides: [512, 1] : memref<32768xbf16, strided<[1], offset: 2260992>> to memref<64x512xbf16>
        %subview_170 = memref.subview %arg0[3833856] [32768] [1] : memref<4718592xbf16> to memref<32768xbf16, strided<[1], offset: 3833856>>
        %reinterpret_cast_171 = memref.reinterpret_cast %subview_170 to offset: [0], sizes: [512, 64], strides: [64, 1] : memref<32768xbf16, strided<[1], offset: 3833856>> to memref<512x64xbf16>
        %subview_172 = memref.subview %arg1[688128] [32768] [1] : memref<1572864xbf16> to memref<32768xbf16, strided<[1], offset: 688128>>
        %reinterpret_cast_173 = memref.reinterpret_cast %subview_172 to offset: [0], sizes: [512, 64], strides: [64, 1] : memref<32768xbf16, strided<[1], offset: 688128>> to memref<512x64xbf16>
        aiex.run @sequence(%reinterpret_cast_167, %reinterpret_cast_169, %reinterpret_cast_171, %reinterpret_cast_173) : (memref<512x64xbf16>, memref<64x512xbf16>, memref<512x64xbf16>, memref<512x64xbf16>)
        %subview_174 = memref.subview %arg0[720896] [32768] [1] : memref<4718592xbf16> to memref<32768xbf16, strided<[1], offset: 720896>>
        %reinterpret_cast_175 = memref.reinterpret_cast %subview_174 to offset: [0], sizes: [512, 64], strides: [64, 1] : memref<32768xbf16, strided<[1], offset: 720896>> to memref<512x64xbf16>
        %subview_176 = memref.subview %arg0[2293760] [32768] [1] : memref<4718592xbf16> to memref<32768xbf16, strided<[1], offset: 2293760>>
        %reinterpret_cast_177 = memref.reinterpret_cast %subview_176 to offset: [0], sizes: [64, 512], strides: [512, 1] : memref<32768xbf16, strided<[1], offset: 2293760>> to memref<64x512xbf16>
        %subview_178 = memref.subview %arg0[3866624] [32768] [1] : memref<4718592xbf16> to memref<32768xbf16, strided<[1], offset: 3866624>>
        %reinterpret_cast_179 = memref.reinterpret_cast %subview_178 to offset: [0], sizes: [512, 64], strides: [64, 1] : memref<32768xbf16, strided<[1], offset: 3866624>> to memref<512x64xbf16>
        %subview_180 = memref.subview %arg1[720896] [32768] [1] : memref<1572864xbf16> to memref<32768xbf16, strided<[1], offset: 720896>>
        %reinterpret_cast_181 = memref.reinterpret_cast %subview_180 to offset: [0], sizes: [512, 64], strides: [64, 1] : memref<32768xbf16, strided<[1], offset: 720896>> to memref<512x64xbf16>
        aiex.run @sequence(%reinterpret_cast_175, %reinterpret_cast_177, %reinterpret_cast_179, %reinterpret_cast_181) : (memref<512x64xbf16>, memref<64x512xbf16>, memref<512x64xbf16>, memref<512x64xbf16>)
        %subview_182 = memref.subview %arg0[753664] [32768] [1] : memref<4718592xbf16> to memref<32768xbf16, strided<[1], offset: 753664>>
        %reinterpret_cast_183 = memref.reinterpret_cast %subview_182 to offset: [0], sizes: [512, 64], strides: [64, 1] : memref<32768xbf16, strided<[1], offset: 753664>> to memref<512x64xbf16>
        %subview_184 = memref.subview %arg0[2326528] [32768] [1] : memref<4718592xbf16> to memref<32768xbf16, strided<[1], offset: 2326528>>
        %reinterpret_cast_185 = memref.reinterpret_cast %subview_184 to offset: [0], sizes: [64, 512], strides: [512, 1] : memref<32768xbf16, strided<[1], offset: 2326528>> to memref<64x512xbf16>
        %subview_186 = memref.subview %arg0[3899392] [32768] [1] : memref<4718592xbf16> to memref<32768xbf16, strided<[1], offset: 3899392>>
        %reinterpret_cast_187 = memref.reinterpret_cast %subview_186 to offset: [0], sizes: [512, 64], strides: [64, 1] : memref<32768xbf16, strided<[1], offset: 3899392>> to memref<512x64xbf16>
        %subview_188 = memref.subview %arg1[753664] [32768] [1] : memref<1572864xbf16> to memref<32768xbf16, strided<[1], offset: 753664>>
        %reinterpret_cast_189 = memref.reinterpret_cast %subview_188 to offset: [0], sizes: [512, 64], strides: [64, 1] : memref<32768xbf16, strided<[1], offset: 753664>> to memref<512x64xbf16>
        aiex.run @sequence(%reinterpret_cast_183, %reinterpret_cast_185, %reinterpret_cast_187, %reinterpret_cast_189) : (memref<512x64xbf16>, memref<64x512xbf16>, memref<512x64xbf16>, memref<512x64xbf16>)
        %subview_190 = memref.subview %arg0[786432] [32768] [1] : memref<4718592xbf16> to memref<32768xbf16, strided<[1], offset: 786432>>
        %reinterpret_cast_191 = memref.reinterpret_cast %subview_190 to offset: [0], sizes: [512, 64], strides: [64, 1] : memref<32768xbf16, strided<[1], offset: 786432>> to memref<512x64xbf16>
        %subview_192 = memref.subview %arg0[2359296] [32768] [1] : memref<4718592xbf16> to memref<32768xbf16, strided<[1], offset: 2359296>>
        %reinterpret_cast_193 = memref.reinterpret_cast %subview_192 to offset: [0], sizes: [64, 512], strides: [512, 1] : memref<32768xbf16, strided<[1], offset: 2359296>> to memref<64x512xbf16>
        %subview_194 = memref.subview %arg0[3932160] [32768] [1] : memref<4718592xbf16> to memref<32768xbf16, strided<[1], offset: 3932160>>
        %reinterpret_cast_195 = memref.reinterpret_cast %subview_194 to offset: [0], sizes: [512, 64], strides: [64, 1] : memref<32768xbf16, strided<[1], offset: 3932160>> to memref<512x64xbf16>
        %subview_196 = memref.subview %arg1[786432] [32768] [1] : memref<1572864xbf16> to memref<32768xbf16, strided<[1], offset: 786432>>
        %reinterpret_cast_197 = memref.reinterpret_cast %subview_196 to offset: [0], sizes: [512, 64], strides: [64, 1] : memref<32768xbf16, strided<[1], offset: 786432>> to memref<512x64xbf16>
        aiex.run @sequence(%reinterpret_cast_191, %reinterpret_cast_193, %reinterpret_cast_195, %reinterpret_cast_197) : (memref<512x64xbf16>, memref<64x512xbf16>, memref<512x64xbf16>, memref<512x64xbf16>)
        %subview_198 = memref.subview %arg0[819200] [32768] [1] : memref<4718592xbf16> to memref<32768xbf16, strided<[1], offset: 819200>>
        %reinterpret_cast_199 = memref.reinterpret_cast %subview_198 to offset: [0], sizes: [512, 64], strides: [64, 1] : memref<32768xbf16, strided<[1], offset: 819200>> to memref<512x64xbf16>
        %subview_200 = memref.subview %arg0[2392064] [32768] [1] : memref<4718592xbf16> to memref<32768xbf16, strided<[1], offset: 2392064>>
        %reinterpret_cast_201 = memref.reinterpret_cast %subview_200 to offset: [0], sizes: [64, 512], strides: [512, 1] : memref<32768xbf16, strided<[1], offset: 2392064>> to memref<64x512xbf16>
        %subview_202 = memref.subview %arg0[3964928] [32768] [1] : memref<4718592xbf16> to memref<32768xbf16, strided<[1], offset: 3964928>>
        %reinterpret_cast_203 = memref.reinterpret_cast %subview_202 to offset: [0], sizes: [512, 64], strides: [64, 1] : memref<32768xbf16, strided<[1], offset: 3964928>> to memref<512x64xbf16>
        %subview_204 = memref.subview %arg1[819200] [32768] [1] : memref<1572864xbf16> to memref<32768xbf16, strided<[1], offset: 819200>>
        %reinterpret_cast_205 = memref.reinterpret_cast %subview_204 to offset: [0], sizes: [512, 64], strides: [64, 1] : memref<32768xbf16, strided<[1], offset: 819200>> to memref<512x64xbf16>
        aiex.run @sequence(%reinterpret_cast_199, %reinterpret_cast_201, %reinterpret_cast_203, %reinterpret_cast_205) : (memref<512x64xbf16>, memref<64x512xbf16>, memref<512x64xbf16>, memref<512x64xbf16>)
        %subview_206 = memref.subview %arg0[851968] [32768] [1] : memref<4718592xbf16> to memref<32768xbf16, strided<[1], offset: 851968>>
        %reinterpret_cast_207 = memref.reinterpret_cast %subview_206 to offset: [0], sizes: [512, 64], strides: [64, 1] : memref<32768xbf16, strided<[1], offset: 851968>> to memref<512x64xbf16>
        %subview_208 = memref.subview %arg0[2424832] [32768] [1] : memref<4718592xbf16> to memref<32768xbf16, strided<[1], offset: 2424832>>
        %reinterpret_cast_209 = memref.reinterpret_cast %subview_208 to offset: [0], sizes: [64, 512], strides: [512, 1] : memref<32768xbf16, strided<[1], offset: 2424832>> to memref<64x512xbf16>
        %subview_210 = memref.subview %arg0[3997696] [32768] [1] : memref<4718592xbf16> to memref<32768xbf16, strided<[1], offset: 3997696>>
        %reinterpret_cast_211 = memref.reinterpret_cast %subview_210 to offset: [0], sizes: [512, 64], strides: [64, 1] : memref<32768xbf16, strided<[1], offset: 3997696>> to memref<512x64xbf16>
        %subview_212 = memref.subview %arg1[851968] [32768] [1] : memref<1572864xbf16> to memref<32768xbf16, strided<[1], offset: 851968>>
        %reinterpret_cast_213 = memref.reinterpret_cast %subview_212 to offset: [0], sizes: [512, 64], strides: [64, 1] : memref<32768xbf16, strided<[1], offset: 851968>> to memref<512x64xbf16>
        aiex.run @sequence(%reinterpret_cast_207, %reinterpret_cast_209, %reinterpret_cast_211, %reinterpret_cast_213) : (memref<512x64xbf16>, memref<64x512xbf16>, memref<512x64xbf16>, memref<512x64xbf16>)
        %subview_214 = memref.subview %arg0[884736] [32768] [1] : memref<4718592xbf16> to memref<32768xbf16, strided<[1], offset: 884736>>
        %reinterpret_cast_215 = memref.reinterpret_cast %subview_214 to offset: [0], sizes: [512, 64], strides: [64, 1] : memref<32768xbf16, strided<[1], offset: 884736>> to memref<512x64xbf16>
        %subview_216 = memref.subview %arg0[2457600] [32768] [1] : memref<4718592xbf16> to memref<32768xbf16, strided<[1], offset: 2457600>>
        %reinterpret_cast_217 = memref.reinterpret_cast %subview_216 to offset: [0], sizes: [64, 512], strides: [512, 1] : memref<32768xbf16, strided<[1], offset: 2457600>> to memref<64x512xbf16>
        %subview_218 = memref.subview %arg0[4030464] [32768] [1] : memref<4718592xbf16> to memref<32768xbf16, strided<[1], offset: 4030464>>
        %reinterpret_cast_219 = memref.reinterpret_cast %subview_218 to offset: [0], sizes: [512, 64], strides: [64, 1] : memref<32768xbf16, strided<[1], offset: 4030464>> to memref<512x64xbf16>
        %subview_220 = memref.subview %arg1[884736] [32768] [1] : memref<1572864xbf16> to memref<32768xbf16, strided<[1], offset: 884736>>
        %reinterpret_cast_221 = memref.reinterpret_cast %subview_220 to offset: [0], sizes: [512, 64], strides: [64, 1] : memref<32768xbf16, strided<[1], offset: 884736>> to memref<512x64xbf16>
        aiex.run @sequence(%reinterpret_cast_215, %reinterpret_cast_217, %reinterpret_cast_219, %reinterpret_cast_221) : (memref<512x64xbf16>, memref<64x512xbf16>, memref<512x64xbf16>, memref<512x64xbf16>)
        %subview_222 = memref.subview %arg0[917504] [32768] [1] : memref<4718592xbf16> to memref<32768xbf16, strided<[1], offset: 917504>>
        %reinterpret_cast_223 = memref.reinterpret_cast %subview_222 to offset: [0], sizes: [512, 64], strides: [64, 1] : memref<32768xbf16, strided<[1], offset: 917504>> to memref<512x64xbf16>
        %subview_224 = memref.subview %arg0[2490368] [32768] [1] : memref<4718592xbf16> to memref<32768xbf16, strided<[1], offset: 2490368>>
        %reinterpret_cast_225 = memref.reinterpret_cast %subview_224 to offset: [0], sizes: [64, 512], strides: [512, 1] : memref<32768xbf16, strided<[1], offset: 2490368>> to memref<64x512xbf16>
        %subview_226 = memref.subview %arg0[4063232] [32768] [1] : memref<4718592xbf16> to memref<32768xbf16, strided<[1], offset: 4063232>>
        %reinterpret_cast_227 = memref.reinterpret_cast %subview_226 to offset: [0], sizes: [512, 64], strides: [64, 1] : memref<32768xbf16, strided<[1], offset: 4063232>> to memref<512x64xbf16>
        %subview_228 = memref.subview %arg1[917504] [32768] [1] : memref<1572864xbf16> to memref<32768xbf16, strided<[1], offset: 917504>>
        %reinterpret_cast_229 = memref.reinterpret_cast %subview_228 to offset: [0], sizes: [512, 64], strides: [64, 1] : memref<32768xbf16, strided<[1], offset: 917504>> to memref<512x64xbf16>
        aiex.run @sequence(%reinterpret_cast_223, %reinterpret_cast_225, %reinterpret_cast_227, %reinterpret_cast_229) : (memref<512x64xbf16>, memref<64x512xbf16>, memref<512x64xbf16>, memref<512x64xbf16>)
        %subview_230 = memref.subview %arg0[950272] [32768] [1] : memref<4718592xbf16> to memref<32768xbf16, strided<[1], offset: 950272>>
        %reinterpret_cast_231 = memref.reinterpret_cast %subview_230 to offset: [0], sizes: [512, 64], strides: [64, 1] : memref<32768xbf16, strided<[1], offset: 950272>> to memref<512x64xbf16>
        %subview_232 = memref.subview %arg0[2523136] [32768] [1] : memref<4718592xbf16> to memref<32768xbf16, strided<[1], offset: 2523136>>
        %reinterpret_cast_233 = memref.reinterpret_cast %subview_232 to offset: [0], sizes: [64, 512], strides: [512, 1] : memref<32768xbf16, strided<[1], offset: 2523136>> to memref<64x512xbf16>
        %subview_234 = memref.subview %arg0[4096000] [32768] [1] : memref<4718592xbf16> to memref<32768xbf16, strided<[1], offset: 4096000>>
        %reinterpret_cast_235 = memref.reinterpret_cast %subview_234 to offset: [0], sizes: [512, 64], strides: [64, 1] : memref<32768xbf16, strided<[1], offset: 4096000>> to memref<512x64xbf16>
        %subview_236 = memref.subview %arg1[950272] [32768] [1] : memref<1572864xbf16> to memref<32768xbf16, strided<[1], offset: 950272>>
        %reinterpret_cast_237 = memref.reinterpret_cast %subview_236 to offset: [0], sizes: [512, 64], strides: [64, 1] : memref<32768xbf16, strided<[1], offset: 950272>> to memref<512x64xbf16>
        aiex.run @sequence(%reinterpret_cast_231, %reinterpret_cast_233, %reinterpret_cast_235, %reinterpret_cast_237) : (memref<512x64xbf16>, memref<64x512xbf16>, memref<512x64xbf16>, memref<512x64xbf16>)
        %subview_238 = memref.subview %arg0[983040] [32768] [1] : memref<4718592xbf16> to memref<32768xbf16, strided<[1], offset: 983040>>
        %reinterpret_cast_239 = memref.reinterpret_cast %subview_238 to offset: [0], sizes: [512, 64], strides: [64, 1] : memref<32768xbf16, strided<[1], offset: 983040>> to memref<512x64xbf16>
        %subview_240 = memref.subview %arg0[2555904] [32768] [1] : memref<4718592xbf16> to memref<32768xbf16, strided<[1], offset: 2555904>>
        %reinterpret_cast_241 = memref.reinterpret_cast %subview_240 to offset: [0], sizes: [64, 512], strides: [512, 1] : memref<32768xbf16, strided<[1], offset: 2555904>> to memref<64x512xbf16>
        %subview_242 = memref.subview %arg0[4128768] [32768] [1] : memref<4718592xbf16> to memref<32768xbf16, strided<[1], offset: 4128768>>
        %reinterpret_cast_243 = memref.reinterpret_cast %subview_242 to offset: [0], sizes: [512, 64], strides: [64, 1] : memref<32768xbf16, strided<[1], offset: 4128768>> to memref<512x64xbf16>
        %subview_244 = memref.subview %arg1[983040] [32768] [1] : memref<1572864xbf16> to memref<32768xbf16, strided<[1], offset: 983040>>
        %reinterpret_cast_245 = memref.reinterpret_cast %subview_244 to offset: [0], sizes: [512, 64], strides: [64, 1] : memref<32768xbf16, strided<[1], offset: 983040>> to memref<512x64xbf16>
        aiex.run @sequence(%reinterpret_cast_239, %reinterpret_cast_241, %reinterpret_cast_243, %reinterpret_cast_245) : (memref<512x64xbf16>, memref<64x512xbf16>, memref<512x64xbf16>, memref<512x64xbf16>)
        %subview_246 = memref.subview %arg0[1015808] [32768] [1] : memref<4718592xbf16> to memref<32768xbf16, strided<[1], offset: 1015808>>
        %reinterpret_cast_247 = memref.reinterpret_cast %subview_246 to offset: [0], sizes: [512, 64], strides: [64, 1] : memref<32768xbf16, strided<[1], offset: 1015808>> to memref<512x64xbf16>
        %subview_248 = memref.subview %arg0[2588672] [32768] [1] : memref<4718592xbf16> to memref<32768xbf16, strided<[1], offset: 2588672>>
        %reinterpret_cast_249 = memref.reinterpret_cast %subview_248 to offset: [0], sizes: [64, 512], strides: [512, 1] : memref<32768xbf16, strided<[1], offset: 2588672>> to memref<64x512xbf16>
        %subview_250 = memref.subview %arg0[4161536] [32768] [1] : memref<4718592xbf16> to memref<32768xbf16, strided<[1], offset: 4161536>>
        %reinterpret_cast_251 = memref.reinterpret_cast %subview_250 to offset: [0], sizes: [512, 64], strides: [64, 1] : memref<32768xbf16, strided<[1], offset: 4161536>> to memref<512x64xbf16>
        %subview_252 = memref.subview %arg1[1015808] [32768] [1] : memref<1572864xbf16> to memref<32768xbf16, strided<[1], offset: 1015808>>
        %reinterpret_cast_253 = memref.reinterpret_cast %subview_252 to offset: [0], sizes: [512, 64], strides: [64, 1] : memref<32768xbf16, strided<[1], offset: 1015808>> to memref<512x64xbf16>
        aiex.run @sequence(%reinterpret_cast_247, %reinterpret_cast_249, %reinterpret_cast_251, %reinterpret_cast_253) : (memref<512x64xbf16>, memref<64x512xbf16>, memref<512x64xbf16>, memref<512x64xbf16>)
        %subview_254 = memref.subview %arg0[1048576] [32768] [1] : memref<4718592xbf16> to memref<32768xbf16, strided<[1], offset: 1048576>>
        %reinterpret_cast_255 = memref.reinterpret_cast %subview_254 to offset: [0], sizes: [512, 64], strides: [64, 1] : memref<32768xbf16, strided<[1], offset: 1048576>> to memref<512x64xbf16>
        %subview_256 = memref.subview %arg0[2621440] [32768] [1] : memref<4718592xbf16> to memref<32768xbf16, strided<[1], offset: 2621440>>
        %reinterpret_cast_257 = memref.reinterpret_cast %subview_256 to offset: [0], sizes: [64, 512], strides: [512, 1] : memref<32768xbf16, strided<[1], offset: 2621440>> to memref<64x512xbf16>
        %subview_258 = memref.subview %arg0[4194304] [32768] [1] : memref<4718592xbf16> to memref<32768xbf16, strided<[1], offset: 4194304>>
        %reinterpret_cast_259 = memref.reinterpret_cast %subview_258 to offset: [0], sizes: [512, 64], strides: [64, 1] : memref<32768xbf16, strided<[1], offset: 4194304>> to memref<512x64xbf16>
        %subview_260 = memref.subview %arg1[1048576] [32768] [1] : memref<1572864xbf16> to memref<32768xbf16, strided<[1], offset: 1048576>>
        %reinterpret_cast_261 = memref.reinterpret_cast %subview_260 to offset: [0], sizes: [512, 64], strides: [64, 1] : memref<32768xbf16, strided<[1], offset: 1048576>> to memref<512x64xbf16>
        aiex.run @sequence(%reinterpret_cast_255, %reinterpret_cast_257, %reinterpret_cast_259, %reinterpret_cast_261) : (memref<512x64xbf16>, memref<64x512xbf16>, memref<512x64xbf16>, memref<512x64xbf16>)
        %subview_262 = memref.subview %arg0[1081344] [32768] [1] : memref<4718592xbf16> to memref<32768xbf16, strided<[1], offset: 1081344>>
        %reinterpret_cast_263 = memref.reinterpret_cast %subview_262 to offset: [0], sizes: [512, 64], strides: [64, 1] : memref<32768xbf16, strided<[1], offset: 1081344>> to memref<512x64xbf16>
        %subview_264 = memref.subview %arg0[2654208] [32768] [1] : memref<4718592xbf16> to memref<32768xbf16, strided<[1], offset: 2654208>>
        %reinterpret_cast_265 = memref.reinterpret_cast %subview_264 to offset: [0], sizes: [64, 512], strides: [512, 1] : memref<32768xbf16, strided<[1], offset: 2654208>> to memref<64x512xbf16>
        %subview_266 = memref.subview %arg0[4227072] [32768] [1] : memref<4718592xbf16> to memref<32768xbf16, strided<[1], offset: 4227072>>
        %reinterpret_cast_267 = memref.reinterpret_cast %subview_266 to offset: [0], sizes: [512, 64], strides: [64, 1] : memref<32768xbf16, strided<[1], offset: 4227072>> to memref<512x64xbf16>
        %subview_268 = memref.subview %arg1[1081344] [32768] [1] : memref<1572864xbf16> to memref<32768xbf16, strided<[1], offset: 1081344>>
        %reinterpret_cast_269 = memref.reinterpret_cast %subview_268 to offset: [0], sizes: [512, 64], strides: [64, 1] : memref<32768xbf16, strided<[1], offset: 1081344>> to memref<512x64xbf16>
        aiex.run @sequence(%reinterpret_cast_263, %reinterpret_cast_265, %reinterpret_cast_267, %reinterpret_cast_269) : (memref<512x64xbf16>, memref<64x512xbf16>, memref<512x64xbf16>, memref<512x64xbf16>)
        %subview_270 = memref.subview %arg0[1114112] [32768] [1] : memref<4718592xbf16> to memref<32768xbf16, strided<[1], offset: 1114112>>
        %reinterpret_cast_271 = memref.reinterpret_cast %subview_270 to offset: [0], sizes: [512, 64], strides: [64, 1] : memref<32768xbf16, strided<[1], offset: 1114112>> to memref<512x64xbf16>
        %subview_272 = memref.subview %arg0[2686976] [32768] [1] : memref<4718592xbf16> to memref<32768xbf16, strided<[1], offset: 2686976>>
        %reinterpret_cast_273 = memref.reinterpret_cast %subview_272 to offset: [0], sizes: [64, 512], strides: [512, 1] : memref<32768xbf16, strided<[1], offset: 2686976>> to memref<64x512xbf16>
        %subview_274 = memref.subview %arg0[4259840] [32768] [1] : memref<4718592xbf16> to memref<32768xbf16, strided<[1], offset: 4259840>>
        %reinterpret_cast_275 = memref.reinterpret_cast %subview_274 to offset: [0], sizes: [512, 64], strides: [64, 1] : memref<32768xbf16, strided<[1], offset: 4259840>> to memref<512x64xbf16>
        %subview_276 = memref.subview %arg1[1114112] [32768] [1] : memref<1572864xbf16> to memref<32768xbf16, strided<[1], offset: 1114112>>
        %reinterpret_cast_277 = memref.reinterpret_cast %subview_276 to offset: [0], sizes: [512, 64], strides: [64, 1] : memref<32768xbf16, strided<[1], offset: 1114112>> to memref<512x64xbf16>
        aiex.run @sequence(%reinterpret_cast_271, %reinterpret_cast_273, %reinterpret_cast_275, %reinterpret_cast_277) : (memref<512x64xbf16>, memref<64x512xbf16>, memref<512x64xbf16>, memref<512x64xbf16>)
        %subview_278 = memref.subview %arg0[1146880] [32768] [1] : memref<4718592xbf16> to memref<32768xbf16, strided<[1], offset: 1146880>>
        %reinterpret_cast_279 = memref.reinterpret_cast %subview_278 to offset: [0], sizes: [512, 64], strides: [64, 1] : memref<32768xbf16, strided<[1], offset: 1146880>> to memref<512x64xbf16>
        %subview_280 = memref.subview %arg0[2719744] [32768] [1] : memref<4718592xbf16> to memref<32768xbf16, strided<[1], offset: 2719744>>
        %reinterpret_cast_281 = memref.reinterpret_cast %subview_280 to offset: [0], sizes: [64, 512], strides: [512, 1] : memref<32768xbf16, strided<[1], offset: 2719744>> to memref<64x512xbf16>
        %subview_282 = memref.subview %arg0[4292608] [32768] [1] : memref<4718592xbf16> to memref<32768xbf16, strided<[1], offset: 4292608>>
        %reinterpret_cast_283 = memref.reinterpret_cast %subview_282 to offset: [0], sizes: [512, 64], strides: [64, 1] : memref<32768xbf16, strided<[1], offset: 4292608>> to memref<512x64xbf16>
        %subview_284 = memref.subview %arg1[1146880] [32768] [1] : memref<1572864xbf16> to memref<32768xbf16, strided<[1], offset: 1146880>>
        %reinterpret_cast_285 = memref.reinterpret_cast %subview_284 to offset: [0], sizes: [512, 64], strides: [64, 1] : memref<32768xbf16, strided<[1], offset: 1146880>> to memref<512x64xbf16>
        aiex.run @sequence(%reinterpret_cast_279, %reinterpret_cast_281, %reinterpret_cast_283, %reinterpret_cast_285) : (memref<512x64xbf16>, memref<64x512xbf16>, memref<512x64xbf16>, memref<512x64xbf16>)
        %subview_286 = memref.subview %arg0[1179648] [32768] [1] : memref<4718592xbf16> to memref<32768xbf16, strided<[1], offset: 1179648>>
        %reinterpret_cast_287 = memref.reinterpret_cast %subview_286 to offset: [0], sizes: [512, 64], strides: [64, 1] : memref<32768xbf16, strided<[1], offset: 1179648>> to memref<512x64xbf16>
        %subview_288 = memref.subview %arg0[2752512] [32768] [1] : memref<4718592xbf16> to memref<32768xbf16, strided<[1], offset: 2752512>>
        %reinterpret_cast_289 = memref.reinterpret_cast %subview_288 to offset: [0], sizes: [64, 512], strides: [512, 1] : memref<32768xbf16, strided<[1], offset: 2752512>> to memref<64x512xbf16>
        %subview_290 = memref.subview %arg0[4325376] [32768] [1] : memref<4718592xbf16> to memref<32768xbf16, strided<[1], offset: 4325376>>
        %reinterpret_cast_291 = memref.reinterpret_cast %subview_290 to offset: [0], sizes: [512, 64], strides: [64, 1] : memref<32768xbf16, strided<[1], offset: 4325376>> to memref<512x64xbf16>
        %subview_292 = memref.subview %arg1[1179648] [32768] [1] : memref<1572864xbf16> to memref<32768xbf16, strided<[1], offset: 1179648>>
        %reinterpret_cast_293 = memref.reinterpret_cast %subview_292 to offset: [0], sizes: [512, 64], strides: [64, 1] : memref<32768xbf16, strided<[1], offset: 1179648>> to memref<512x64xbf16>
        aiex.run @sequence(%reinterpret_cast_287, %reinterpret_cast_289, %reinterpret_cast_291, %reinterpret_cast_293) : (memref<512x64xbf16>, memref<64x512xbf16>, memref<512x64xbf16>, memref<512x64xbf16>)
        %subview_294 = memref.subview %arg0[1212416] [32768] [1] : memref<4718592xbf16> to memref<32768xbf16, strided<[1], offset: 1212416>>
        %reinterpret_cast_295 = memref.reinterpret_cast %subview_294 to offset: [0], sizes: [512, 64], strides: [64, 1] : memref<32768xbf16, strided<[1], offset: 1212416>> to memref<512x64xbf16>
        %subview_296 = memref.subview %arg0[2785280] [32768] [1] : memref<4718592xbf16> to memref<32768xbf16, strided<[1], offset: 2785280>>
        %reinterpret_cast_297 = memref.reinterpret_cast %subview_296 to offset: [0], sizes: [64, 512], strides: [512, 1] : memref<32768xbf16, strided<[1], offset: 2785280>> to memref<64x512xbf16>
        %subview_298 = memref.subview %arg0[4358144] [32768] [1] : memref<4718592xbf16> to memref<32768xbf16, strided<[1], offset: 4358144>>
        %reinterpret_cast_299 = memref.reinterpret_cast %subview_298 to offset: [0], sizes: [512, 64], strides: [64, 1] : memref<32768xbf16, strided<[1], offset: 4358144>> to memref<512x64xbf16>
        %subview_300 = memref.subview %arg1[1212416] [32768] [1] : memref<1572864xbf16> to memref<32768xbf16, strided<[1], offset: 1212416>>
        %reinterpret_cast_301 = memref.reinterpret_cast %subview_300 to offset: [0], sizes: [512, 64], strides: [64, 1] : memref<32768xbf16, strided<[1], offset: 1212416>> to memref<512x64xbf16>
        aiex.run @sequence(%reinterpret_cast_295, %reinterpret_cast_297, %reinterpret_cast_299, %reinterpret_cast_301) : (memref<512x64xbf16>, memref<64x512xbf16>, memref<512x64xbf16>, memref<512x64xbf16>)
        %subview_302 = memref.subview %arg0[1245184] [32768] [1] : memref<4718592xbf16> to memref<32768xbf16, strided<[1], offset: 1245184>>
        %reinterpret_cast_303 = memref.reinterpret_cast %subview_302 to offset: [0], sizes: [512, 64], strides: [64, 1] : memref<32768xbf16, strided<[1], offset: 1245184>> to memref<512x64xbf16>
        %subview_304 = memref.subview %arg0[2818048] [32768] [1] : memref<4718592xbf16> to memref<32768xbf16, strided<[1], offset: 2818048>>
        %reinterpret_cast_305 = memref.reinterpret_cast %subview_304 to offset: [0], sizes: [64, 512], strides: [512, 1] : memref<32768xbf16, strided<[1], offset: 2818048>> to memref<64x512xbf16>
        %subview_306 = memref.subview %arg0[4390912] [32768] [1] : memref<4718592xbf16> to memref<32768xbf16, strided<[1], offset: 4390912>>
        %reinterpret_cast_307 = memref.reinterpret_cast %subview_306 to offset: [0], sizes: [512, 64], strides: [64, 1] : memref<32768xbf16, strided<[1], offset: 4390912>> to memref<512x64xbf16>
        %subview_308 = memref.subview %arg1[1245184] [32768] [1] : memref<1572864xbf16> to memref<32768xbf16, strided<[1], offset: 1245184>>
        %reinterpret_cast_309 = memref.reinterpret_cast %subview_308 to offset: [0], sizes: [512, 64], strides: [64, 1] : memref<32768xbf16, strided<[1], offset: 1245184>> to memref<512x64xbf16>
        aiex.run @sequence(%reinterpret_cast_303, %reinterpret_cast_305, %reinterpret_cast_307, %reinterpret_cast_309) : (memref<512x64xbf16>, memref<64x512xbf16>, memref<512x64xbf16>, memref<512x64xbf16>)
        %subview_310 = memref.subview %arg0[1277952] [32768] [1] : memref<4718592xbf16> to memref<32768xbf16, strided<[1], offset: 1277952>>
        %reinterpret_cast_311 = memref.reinterpret_cast %subview_310 to offset: [0], sizes: [512, 64], strides: [64, 1] : memref<32768xbf16, strided<[1], offset: 1277952>> to memref<512x64xbf16>
        %subview_312 = memref.subview %arg0[2850816] [32768] [1] : memref<4718592xbf16> to memref<32768xbf16, strided<[1], offset: 2850816>>
        %reinterpret_cast_313 = memref.reinterpret_cast %subview_312 to offset: [0], sizes: [64, 512], strides: [512, 1] : memref<32768xbf16, strided<[1], offset: 2850816>> to memref<64x512xbf16>
        %subview_314 = memref.subview %arg0[4423680] [32768] [1] : memref<4718592xbf16> to memref<32768xbf16, strided<[1], offset: 4423680>>
        %reinterpret_cast_315 = memref.reinterpret_cast %subview_314 to offset: [0], sizes: [512, 64], strides: [64, 1] : memref<32768xbf16, strided<[1], offset: 4423680>> to memref<512x64xbf16>
        %subview_316 = memref.subview %arg1[1277952] [32768] [1] : memref<1572864xbf16> to memref<32768xbf16, strided<[1], offset: 1277952>>
        %reinterpret_cast_317 = memref.reinterpret_cast %subview_316 to offset: [0], sizes: [512, 64], strides: [64, 1] : memref<32768xbf16, strided<[1], offset: 1277952>> to memref<512x64xbf16>
        aiex.run @sequence(%reinterpret_cast_311, %reinterpret_cast_313, %reinterpret_cast_315, %reinterpret_cast_317) : (memref<512x64xbf16>, memref<64x512xbf16>, memref<512x64xbf16>, memref<512x64xbf16>)
        %subview_318 = memref.subview %arg0[1310720] [32768] [1] : memref<4718592xbf16> to memref<32768xbf16, strided<[1], offset: 1310720>>
        %reinterpret_cast_319 = memref.reinterpret_cast %subview_318 to offset: [0], sizes: [512, 64], strides: [64, 1] : memref<32768xbf16, strided<[1], offset: 1310720>> to memref<512x64xbf16>
        %subview_320 = memref.subview %arg0[2883584] [32768] [1] : memref<4718592xbf16> to memref<32768xbf16, strided<[1], offset: 2883584>>
        %reinterpret_cast_321 = memref.reinterpret_cast %subview_320 to offset: [0], sizes: [64, 512], strides: [512, 1] : memref<32768xbf16, strided<[1], offset: 2883584>> to memref<64x512xbf16>
        %subview_322 = memref.subview %arg0[4456448] [32768] [1] : memref<4718592xbf16> to memref<32768xbf16, strided<[1], offset: 4456448>>
        %reinterpret_cast_323 = memref.reinterpret_cast %subview_322 to offset: [0], sizes: [512, 64], strides: [64, 1] : memref<32768xbf16, strided<[1], offset: 4456448>> to memref<512x64xbf16>
        %subview_324 = memref.subview %arg1[1310720] [32768] [1] : memref<1572864xbf16> to memref<32768xbf16, strided<[1], offset: 1310720>>
        %reinterpret_cast_325 = memref.reinterpret_cast %subview_324 to offset: [0], sizes: [512, 64], strides: [64, 1] : memref<32768xbf16, strided<[1], offset: 1310720>> to memref<512x64xbf16>
        aiex.run @sequence(%reinterpret_cast_319, %reinterpret_cast_321, %reinterpret_cast_323, %reinterpret_cast_325) : (memref<512x64xbf16>, memref<64x512xbf16>, memref<512x64xbf16>, memref<512x64xbf16>)
        %subview_326 = memref.subview %arg0[1343488] [32768] [1] : memref<4718592xbf16> to memref<32768xbf16, strided<[1], offset: 1343488>>
        %reinterpret_cast_327 = memref.reinterpret_cast %subview_326 to offset: [0], sizes: [512, 64], strides: [64, 1] : memref<32768xbf16, strided<[1], offset: 1343488>> to memref<512x64xbf16>
        %subview_328 = memref.subview %arg0[2916352] [32768] [1] : memref<4718592xbf16> to memref<32768xbf16, strided<[1], offset: 2916352>>
        %reinterpret_cast_329 = memref.reinterpret_cast %subview_328 to offset: [0], sizes: [64, 512], strides: [512, 1] : memref<32768xbf16, strided<[1], offset: 2916352>> to memref<64x512xbf16>
        %subview_330 = memref.subview %arg0[4489216] [32768] [1] : memref<4718592xbf16> to memref<32768xbf16, strided<[1], offset: 4489216>>
        %reinterpret_cast_331 = memref.reinterpret_cast %subview_330 to offset: [0], sizes: [512, 64], strides: [64, 1] : memref<32768xbf16, strided<[1], offset: 4489216>> to memref<512x64xbf16>
        %subview_332 = memref.subview %arg1[1343488] [32768] [1] : memref<1572864xbf16> to memref<32768xbf16, strided<[1], offset: 1343488>>
        %reinterpret_cast_333 = memref.reinterpret_cast %subview_332 to offset: [0], sizes: [512, 64], strides: [64, 1] : memref<32768xbf16, strided<[1], offset: 1343488>> to memref<512x64xbf16>
        aiex.run @sequence(%reinterpret_cast_327, %reinterpret_cast_329, %reinterpret_cast_331, %reinterpret_cast_333) : (memref<512x64xbf16>, memref<64x512xbf16>, memref<512x64xbf16>, memref<512x64xbf16>)
        %subview_334 = memref.subview %arg0[1376256] [32768] [1] : memref<4718592xbf16> to memref<32768xbf16, strided<[1], offset: 1376256>>
        %reinterpret_cast_335 = memref.reinterpret_cast %subview_334 to offset: [0], sizes: [512, 64], strides: [64, 1] : memref<32768xbf16, strided<[1], offset: 1376256>> to memref<512x64xbf16>
        %subview_336 = memref.subview %arg0[2949120] [32768] [1] : memref<4718592xbf16> to memref<32768xbf16, strided<[1], offset: 2949120>>
        %reinterpret_cast_337 = memref.reinterpret_cast %subview_336 to offset: [0], sizes: [64, 512], strides: [512, 1] : memref<32768xbf16, strided<[1], offset: 2949120>> to memref<64x512xbf16>
        %subview_338 = memref.subview %arg0[4521984] [32768] [1] : memref<4718592xbf16> to memref<32768xbf16, strided<[1], offset: 4521984>>
        %reinterpret_cast_339 = memref.reinterpret_cast %subview_338 to offset: [0], sizes: [512, 64], strides: [64, 1] : memref<32768xbf16, strided<[1], offset: 4521984>> to memref<512x64xbf16>
        %subview_340 = memref.subview %arg1[1376256] [32768] [1] : memref<1572864xbf16> to memref<32768xbf16, strided<[1], offset: 1376256>>
        %reinterpret_cast_341 = memref.reinterpret_cast %subview_340 to offset: [0], sizes: [512, 64], strides: [64, 1] : memref<32768xbf16, strided<[1], offset: 1376256>> to memref<512x64xbf16>
        aiex.run @sequence(%reinterpret_cast_335, %reinterpret_cast_337, %reinterpret_cast_339, %reinterpret_cast_341) : (memref<512x64xbf16>, memref<64x512xbf16>, memref<512x64xbf16>, memref<512x64xbf16>)
        %subview_342 = memref.subview %arg0[1409024] [32768] [1] : memref<4718592xbf16> to memref<32768xbf16, strided<[1], offset: 1409024>>
        %reinterpret_cast_343 = memref.reinterpret_cast %subview_342 to offset: [0], sizes: [512, 64], strides: [64, 1] : memref<32768xbf16, strided<[1], offset: 1409024>> to memref<512x64xbf16>
        %subview_344 = memref.subview %arg0[2981888] [32768] [1] : memref<4718592xbf16> to memref<32768xbf16, strided<[1], offset: 2981888>>
        %reinterpret_cast_345 = memref.reinterpret_cast %subview_344 to offset: [0], sizes: [64, 512], strides: [512, 1] : memref<32768xbf16, strided<[1], offset: 2981888>> to memref<64x512xbf16>
        %subview_346 = memref.subview %arg0[4554752] [32768] [1] : memref<4718592xbf16> to memref<32768xbf16, strided<[1], offset: 4554752>>
        %reinterpret_cast_347 = memref.reinterpret_cast %subview_346 to offset: [0], sizes: [512, 64], strides: [64, 1] : memref<32768xbf16, strided<[1], offset: 4554752>> to memref<512x64xbf16>
        %subview_348 = memref.subview %arg1[1409024] [32768] [1] : memref<1572864xbf16> to memref<32768xbf16, strided<[1], offset: 1409024>>
        %reinterpret_cast_349 = memref.reinterpret_cast %subview_348 to offset: [0], sizes: [512, 64], strides: [64, 1] : memref<32768xbf16, strided<[1], offset: 1409024>> to memref<512x64xbf16>
        aiex.run @sequence(%reinterpret_cast_343, %reinterpret_cast_345, %reinterpret_cast_347, %reinterpret_cast_349) : (memref<512x64xbf16>, memref<64x512xbf16>, memref<512x64xbf16>, memref<512x64xbf16>)
        %subview_350 = memref.subview %arg0[1441792] [32768] [1] : memref<4718592xbf16> to memref<32768xbf16, strided<[1], offset: 1441792>>
        %reinterpret_cast_351 = memref.reinterpret_cast %subview_350 to offset: [0], sizes: [512, 64], strides: [64, 1] : memref<32768xbf16, strided<[1], offset: 1441792>> to memref<512x64xbf16>
        %subview_352 = memref.subview %arg0[3014656] [32768] [1] : memref<4718592xbf16> to memref<32768xbf16, strided<[1], offset: 3014656>>
        %reinterpret_cast_353 = memref.reinterpret_cast %subview_352 to offset: [0], sizes: [64, 512], strides: [512, 1] : memref<32768xbf16, strided<[1], offset: 3014656>> to memref<64x512xbf16>
        %subview_354 = memref.subview %arg0[4587520] [32768] [1] : memref<4718592xbf16> to memref<32768xbf16, strided<[1], offset: 4587520>>
        %reinterpret_cast_355 = memref.reinterpret_cast %subview_354 to offset: [0], sizes: [512, 64], strides: [64, 1] : memref<32768xbf16, strided<[1], offset: 4587520>> to memref<512x64xbf16>
        %subview_356 = memref.subview %arg1[1441792] [32768] [1] : memref<1572864xbf16> to memref<32768xbf16, strided<[1], offset: 1441792>>
        %reinterpret_cast_357 = memref.reinterpret_cast %subview_356 to offset: [0], sizes: [512, 64], strides: [64, 1] : memref<32768xbf16, strided<[1], offset: 1441792>> to memref<512x64xbf16>
        aiex.run @sequence(%reinterpret_cast_351, %reinterpret_cast_353, %reinterpret_cast_355, %reinterpret_cast_357) : (memref<512x64xbf16>, memref<64x512xbf16>, memref<512x64xbf16>, memref<512x64xbf16>)
        %subview_358 = memref.subview %arg0[1474560] [32768] [1] : memref<4718592xbf16> to memref<32768xbf16, strided<[1], offset: 1474560>>
        %reinterpret_cast_359 = memref.reinterpret_cast %subview_358 to offset: [0], sizes: [512, 64], strides: [64, 1] : memref<32768xbf16, strided<[1], offset: 1474560>> to memref<512x64xbf16>
        %subview_360 = memref.subview %arg0[3047424] [32768] [1] : memref<4718592xbf16> to memref<32768xbf16, strided<[1], offset: 3047424>>
        %reinterpret_cast_361 = memref.reinterpret_cast %subview_360 to offset: [0], sizes: [64, 512], strides: [512, 1] : memref<32768xbf16, strided<[1], offset: 3047424>> to memref<64x512xbf16>
        %subview_362 = memref.subview %arg0[4620288] [32768] [1] : memref<4718592xbf16> to memref<32768xbf16, strided<[1], offset: 4620288>>
        %reinterpret_cast_363 = memref.reinterpret_cast %subview_362 to offset: [0], sizes: [512, 64], strides: [64, 1] : memref<32768xbf16, strided<[1], offset: 4620288>> to memref<512x64xbf16>
        %subview_364 = memref.subview %arg1[1474560] [32768] [1] : memref<1572864xbf16> to memref<32768xbf16, strided<[1], offset: 1474560>>
        %reinterpret_cast_365 = memref.reinterpret_cast %subview_364 to offset: [0], sizes: [512, 64], strides: [64, 1] : memref<32768xbf16, strided<[1], offset: 1474560>> to memref<512x64xbf16>
        aiex.run @sequence(%reinterpret_cast_359, %reinterpret_cast_361, %reinterpret_cast_363, %reinterpret_cast_365) : (memref<512x64xbf16>, memref<64x512xbf16>, memref<512x64xbf16>, memref<512x64xbf16>)
        %subview_366 = memref.subview %arg0[1507328] [32768] [1] : memref<4718592xbf16> to memref<32768xbf16, strided<[1], offset: 1507328>>
        %reinterpret_cast_367 = memref.reinterpret_cast %subview_366 to offset: [0], sizes: [512, 64], strides: [64, 1] : memref<32768xbf16, strided<[1], offset: 1507328>> to memref<512x64xbf16>
        %subview_368 = memref.subview %arg0[3080192] [32768] [1] : memref<4718592xbf16> to memref<32768xbf16, strided<[1], offset: 3080192>>
        %reinterpret_cast_369 = memref.reinterpret_cast %subview_368 to offset: [0], sizes: [64, 512], strides: [512, 1] : memref<32768xbf16, strided<[1], offset: 3080192>> to memref<64x512xbf16>
        %subview_370 = memref.subview %arg0[4653056] [32768] [1] : memref<4718592xbf16> to memref<32768xbf16, strided<[1], offset: 4653056>>
        %reinterpret_cast_371 = memref.reinterpret_cast %subview_370 to offset: [0], sizes: [512, 64], strides: [64, 1] : memref<32768xbf16, strided<[1], offset: 4653056>> to memref<512x64xbf16>
        %subview_372 = memref.subview %arg1[1507328] [32768] [1] : memref<1572864xbf16> to memref<32768xbf16, strided<[1], offset: 1507328>>
        %reinterpret_cast_373 = memref.reinterpret_cast %subview_372 to offset: [0], sizes: [512, 64], strides: [64, 1] : memref<32768xbf16, strided<[1], offset: 1507328>> to memref<512x64xbf16>
        aiex.run @sequence(%reinterpret_cast_367, %reinterpret_cast_369, %reinterpret_cast_371, %reinterpret_cast_373) : (memref<512x64xbf16>, memref<64x512xbf16>, memref<512x64xbf16>, memref<512x64xbf16>)
        %subview_374 = memref.subview %arg0[1540096] [32768] [1] : memref<4718592xbf16> to memref<32768xbf16, strided<[1], offset: 1540096>>
        %reinterpret_cast_375 = memref.reinterpret_cast %subview_374 to offset: [0], sizes: [512, 64], strides: [64, 1] : memref<32768xbf16, strided<[1], offset: 1540096>> to memref<512x64xbf16>
        %subview_376 = memref.subview %arg0[3112960] [32768] [1] : memref<4718592xbf16> to memref<32768xbf16, strided<[1], offset: 3112960>>
        %reinterpret_cast_377 = memref.reinterpret_cast %subview_376 to offset: [0], sizes: [64, 512], strides: [512, 1] : memref<32768xbf16, strided<[1], offset: 3112960>> to memref<64x512xbf16>
        %subview_378 = memref.subview %arg0[4685824] [32768] [1] : memref<4718592xbf16> to memref<32768xbf16, strided<[1], offset: 4685824>>
        %reinterpret_cast_379 = memref.reinterpret_cast %subview_378 to offset: [0], sizes: [512, 64], strides: [64, 1] : memref<32768xbf16, strided<[1], offset: 4685824>> to memref<512x64xbf16>
        %subview_380 = memref.subview %arg1[1540096] [32768] [1] : memref<1572864xbf16> to memref<32768xbf16, strided<[1], offset: 1540096>>
        %reinterpret_cast_381 = memref.reinterpret_cast %subview_380 to offset: [0], sizes: [512, 64], strides: [64, 1] : memref<32768xbf16, strided<[1], offset: 1540096>> to memref<512x64xbf16>
        aiex.run @sequence(%reinterpret_cast_375, %reinterpret_cast_377, %reinterpret_cast_379, %reinterpret_cast_381) : (memref<512x64xbf16>, memref<64x512xbf16>, memref<512x64xbf16>, memref<512x64xbf16>)
      }
      aiex.configure @reset_device {
      }
    }
  }
}
