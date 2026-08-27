module {
  aie.device(npu2) @op0__MHAStreamGroup {
    %shim_noc_tile_0_0 = aie.tile(0, 0)
    %shim_noc_tile_1_0 = aie.tile(1, 0)
    %shim_noc_tile_3_0 = aie.tile(3, 0)
    %shim_noc_tile_4_0 = aie.tile(4, 0)
    %shim_noc_tile_5_0 = aie.tile(5, 0)
    %shim_noc_tile_6_0 = aie.tile(6, 0)
    %shim_noc_tile_7_0 = aie.tile(7, 0)
    %mem_tile_0_1 = aie.tile(0, 1)
    %mem_tile_3_1 = aie.tile(3, 1)
    %mem_tile_6_1 = aie.tile(6, 1)
    %mem_tile_7_1 = aie.tile(7, 1)
    %mem_tile_5_1 = aie.tile(5, 1)
    %mem_tile_4_1 = aie.tile(4, 1)
    %tile_0_2 = aie.tile(0, 2)
    %tile_1_2 = aie.tile(1, 2)
    %tile_2_2 = aie.tile(2, 2)
    %tile_3_2 = aie.tile(3, 2)
    %tile_0_4 = aie.tile(0, 4)
    %tile_1_4 = aie.tile(1, 4)
    %tile_2_4 = aie.tile(2, 4)
    %tile_3_4 = aie.tile(3, 4)
    %mem_tile_2_1 = aie.tile(2, 1)
    %tile_0_3 = aie.tile(0, 3)
    %tile_1_3 = aie.tile(1, 3)
    %tile_2_3 = aie.tile(2, 3)
    %tile_3_3 = aie.tile(3, 3)
    %mem_tile_1_1 = aie.tile(1, 1)
    aie.runtime_sequence(%arg0: memref<256x64xbf16>, %arg1: memref<64x256xbf16>, %arg2: memref<256x64xbf16>, %arg3: memref<256x64xbf16>) {
      %0 = aiex.dma_configure_task_for @of_0_mem_0 {
        aie.dma_bd(%arg0 : memref<256x64xbf16> offset = 0 len = 4096 sizes = [1, 4, 32, 32] strides = [0, 4096, 32, 1])
        aie.end
      } {iteration_t = 0 : index}
      aiex.dma_start_task(%0)
      %1 = aiex.dma_configure_task_for @of_0_mem_1 {
        aie.dma_bd(%arg0 : memref<256x64xbf16> offset = 1024 len = 4096 sizes = [1, 4, 32, 32] strides = [0, 4096, 32, 1])
        aie.end
      } {iteration_t = 0 : index}
      aiex.dma_start_task(%1)
      %2 = aiex.dma_configure_task_for @of_0_mem_2 {
        aie.dma_bd(%arg0 : memref<256x64xbf16> offset = 2048 len = 4096 sizes = [1, 4, 32, 32] strides = [0, 4096, 32, 1])
        aie.end
      } {iteration_t = 0 : index}
      aiex.dma_start_task(%2)
      %3 = aiex.dma_configure_task_for @of_0_mem_3 {
        aie.dma_bd(%arg0 : memref<256x64xbf16> offset = 3072 len = 4096 sizes = [1, 4, 32, 32] strides = [0, 4096, 32, 1])
        aie.end
      } {iteration_t = 0 : index}
      aiex.dma_start_task(%3)
      %4 = aiex.dma_configure_task_for @of_1_mem {
        aie.dma_bd(%arg1 : memref<64x256xbf16> offset = 0 len = 16384 sizes = [1, 1, 128, 128] strides = [0, 0, 128, 1])
        aie.end
      } {iteration_t = 0 : index}
      aiex.dma_start_task(%4)
      %5 = aiex.dma_configure_task_for @of_2_mem {
        aie.dma_bd(%arg2 : memref<256x64xbf16> offset = 0 len = 16384 sizes = [1, 1, 128, 128] strides = [0, 0, 128, 1])
        aie.end
      } {iteration_t = 0 : index}
      aiex.dma_start_task(%5)
      %6 = aiex.dma_configure_task_for @of_11_mem_0 {
        aie.dma_bd(%arg3 : memref<256x64xbf16> offset = 0 len = 4096 sizes = [1, 4, 32, 32] strides = [0, 4096, 32, 1])
        aie.end
      } {issue_token = true, iteration_t = 0 : index}
      aiex.dma_start_task(%6)
      %7 = aiex.dma_configure_task_for @of_11_mem_1 {
        aie.dma_bd(%arg3 : memref<256x64xbf16> offset = 1024 len = 4096 sizes = [1, 4, 32, 32] strides = [0, 4096, 32, 1])
        aie.end
      } {issue_token = true, iteration_t = 0 : index}
      aiex.dma_start_task(%7)
      %8 = aiex.dma_configure_task_for @of_11_mem_2 {
        aie.dma_bd(%arg3 : memref<256x64xbf16> offset = 2048 len = 4096 sizes = [1, 4, 32, 32] strides = [0, 4096, 32, 1])
        aie.end
      } {issue_token = true, iteration_t = 0 : index}
      aiex.dma_start_task(%8)
      %9 = aiex.dma_configure_task_for @of_11_mem_3 {
        aie.dma_bd(%arg3 : memref<256x64xbf16> offset = 3072 len = 4096 sizes = [1, 4, 32, 32] strides = [0, 4096, 32, 1])
        aie.end
      } {issue_token = true, iteration_t = 0 : index}
      aiex.dma_start_task(%9)
      aiex.dma_await_task(%6)
      aiex.dma_await_task(%7)
      aiex.dma_await_task(%8)
      aiex.dma_await_task(%9)
    }
    %core_0_2 = aie.core(%tile_0_2) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %0 = aie.objectfifo.acquire @of_4_broadcast_0_0(Consume, 1) : !aie.objectfifosubview<memref<64x256xbf16>>
        %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<64x256xbf16>> -> memref<64x256xbf16>
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c4 = arith.constant 4 : index
        scf.for %arg1 = %c0_0 to %c4 step %c1_1 {
          %2 = aie.objectfifo.acquire @of_6_unicast_0(Produce, 1) : !aie.objectfifosubview<memref<16x256xbf16>>
          %3 = aie.objectfifo.subview.access %2[0] : !aie.objectfifosubview<memref<16x256xbf16>> -> memref<16x256xbf16>
          func.call @op0_zero_bf16_16_64_256(%3) : (memref<16x256xbf16>) -> ()
          %4 = aie.objectfifo.acquire @of_3_unicast_0_0(Consume, 1) : !aie.objectfifosubview<memref<16x64xbf16>>
          %5 = aie.objectfifo.subview.access %4[0] : !aie.objectfifosubview<memref<16x64xbf16>> -> memref<16x64xbf16>
          %c1_2 = arith.constant 1 : index
          %c0_3 = arith.constant 0 : index
          %6 = scf.index_switch %c0_3 -> memref<16x64xbf16> 
          case 0 {
            scf.yield %5 : memref<16x64xbf16>
          }
          default {
            scf.yield %5 : memref<16x64xbf16>
          }
          %c1_4 = arith.constant 1 : index
          %c0_5 = arith.constant 0 : index
          %7 = scf.index_switch %c0_5 -> memref<64x256xbf16> 
          case 0 {
            scf.yield %1 : memref<64x256xbf16>
          }
          default {
            scf.yield %1 : memref<64x256xbf16>
          }
          %c1_6 = arith.constant 1 : index
          %c0_7 = arith.constant 0 : index
          %8 = scf.index_switch %c0_7 -> memref<16x256xbf16> 
          case 0 {
            scf.yield %3 : memref<16x256xbf16>
          }
          default {
            scf.yield %3 : memref<16x256xbf16>
          }
          func.call @op0_matmul_bf16_bf16_16_64_256(%6, %7, %8) : (memref<16x64xbf16>, memref<64x256xbf16>, memref<16x256xbf16>) -> ()
          aie.objectfifo.release @of_3_unicast_0_0(Consume, 1)
          aie.objectfifo.release @of_6_unicast_0(Produce, 1)
        }
        aie.objectfifo.release @of_4_broadcast_0_0(Consume, 1)
      }
      aie.end
    } {link_with = "op0_mm_16_64_256.o"}
    %core_0_3 = aie.core(%tile_0_3) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c4 = arith.constant 4 : index
        scf.for %arg1 = %c0_0 to %c4 step %c1_1 {
          %0 = aie.objectfifo.acquire @of_8_unicast_0(Produce, 1) : !aie.objectfifosubview<memref<16x256xbf16>>
          %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<16x256xbf16>> -> memref<16x256xbf16>
          %2 = aie.objectfifo.acquire @of_7_unicast_0_0(Consume, 1) : !aie.objectfifosubview<memref<16x256xbf16>>
          %3 = aie.objectfifo.subview.access %2[0] : !aie.objectfifosubview<memref<16x256xbf16>> -> memref<16x256xbf16>
          %c1_2 = arith.constant 1 : index
          %c0_3 = arith.constant 0 : index
          %4 = scf.index_switch %c0_3 -> memref<16x256xbf16> 
          case 0 {
            scf.yield %3 : memref<16x256xbf16>
          }
          default {
            scf.yield %3 : memref<16x256xbf16>
          }
          %c1_4 = arith.constant 1 : index
          %c0_5 = arith.constant 0 : index
          %5 = scf.index_switch %c0_5 -> memref<16x256xbf16> 
          case 0 {
            scf.yield %1 : memref<16x256xbf16>
          }
          default {
            scf.yield %1 : memref<16x256xbf16>
          }
          %c16_i32 = arith.constant 16 : i32
          %c256_i32 = arith.constant 256 : i32
          func.call @op0_softmax_rows_bf16(%4, %5, %c16_i32, %c256_i32) : (memref<16x256xbf16>, memref<16x256xbf16>, i32, i32) -> ()
          aie.objectfifo.release @of_7_unicast_0_0(Consume, 1)
          aie.objectfifo.release @of_8_unicast_0(Produce, 1)
        }
      }
      aie.end
    } {link_with = "op0_softmax.o"}
    %core_0_4 = aie.core(%tile_0_4) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %0 = aie.objectfifo.acquire @of_5_broadcast_0_0(Consume, 1) : !aie.objectfifosubview<memref<256x64xbf16>>
        %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<256x64xbf16>> -> memref<256x64xbf16>
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c4 = arith.constant 4 : index
        scf.for %arg1 = %c0_0 to %c4 step %c1_1 {
          %2 = aie.objectfifo.acquire @of_10_unicast_0(Produce, 1) : !aie.objectfifosubview<memref<16x64xbf16>>
          %3 = aie.objectfifo.subview.access %2[0] : !aie.objectfifosubview<memref<16x64xbf16>> -> memref<16x64xbf16>
          func.call @op0_zero_bf16_16_256_64(%3) : (memref<16x64xbf16>) -> ()
          %4 = aie.objectfifo.acquire @of_9_unicast_0_0(Consume, 1) : !aie.objectfifosubview<memref<16x256xbf16>>
          %5 = aie.objectfifo.subview.access %4[0] : !aie.objectfifosubview<memref<16x256xbf16>> -> memref<16x256xbf16>
          %c1_2 = arith.constant 1 : index
          %c0_3 = arith.constant 0 : index
          %6 = scf.index_switch %c0_3 -> memref<256x64xbf16> 
          case 0 {
            scf.yield %1 : memref<256x64xbf16>
          }
          default {
            scf.yield %1 : memref<256x64xbf16>
          }
          %c1_4 = arith.constant 1 : index
          %c0_5 = arith.constant 0 : index
          %7 = scf.index_switch %c0_5 -> memref<16x256xbf16> 
          case 0 {
            scf.yield %5 : memref<16x256xbf16>
          }
          default {
            scf.yield %5 : memref<16x256xbf16>
          }
          %c1_6 = arith.constant 1 : index
          %c0_7 = arith.constant 0 : index
          %8 = scf.index_switch %c0_7 -> memref<16x64xbf16> 
          case 0 {
            scf.yield %3 : memref<16x64xbf16>
          }
          default {
            scf.yield %3 : memref<16x64xbf16>
          }
          func.call @op0_matmul_bf16_bf16_16_256_64(%7, %6, %8) : (memref<16x256xbf16>, memref<256x64xbf16>, memref<16x64xbf16>) -> ()
          aie.objectfifo.release @of_9_unicast_0_0(Consume, 1)
          aie.objectfifo.release @of_10_unicast_0(Produce, 1)
        }
        aie.objectfifo.release @of_5_broadcast_0_0(Consume, 1)
      }
      aie.end
    } {link_with = "op0_mm_16_256_64.o"}
    %core_1_2 = aie.core(%tile_1_2) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %0 = aie.objectfifo.acquire @of_4_broadcast_0_0(Consume, 1) : !aie.objectfifosubview<memref<64x256xbf16>>
        %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<64x256xbf16>> -> memref<64x256xbf16>
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c4 = arith.constant 4 : index
        scf.for %arg1 = %c0_0 to %c4 step %c1_1 {
          %2 = aie.objectfifo.acquire @of_6_unicast_1(Produce, 1) : !aie.objectfifosubview<memref<16x256xbf16>>
          %3 = aie.objectfifo.subview.access %2[0] : !aie.objectfifosubview<memref<16x256xbf16>> -> memref<16x256xbf16>
          func.call @op0_zero_bf16_16_64_256(%3) : (memref<16x256xbf16>) -> ()
          %4 = aie.objectfifo.acquire @of_3_unicast_1_0(Consume, 1) : !aie.objectfifosubview<memref<16x64xbf16>>
          %5 = aie.objectfifo.subview.access %4[0] : !aie.objectfifosubview<memref<16x64xbf16>> -> memref<16x64xbf16>
          %c1_2 = arith.constant 1 : index
          %c0_3 = arith.constant 0 : index
          %6 = scf.index_switch %c0_3 -> memref<16x64xbf16> 
          case 0 {
            scf.yield %5 : memref<16x64xbf16>
          }
          default {
            scf.yield %5 : memref<16x64xbf16>
          }
          %c1_4 = arith.constant 1 : index
          %c0_5 = arith.constant 0 : index
          %7 = scf.index_switch %c0_5 -> memref<64x256xbf16> 
          case 0 {
            scf.yield %1 : memref<64x256xbf16>
          }
          default {
            scf.yield %1 : memref<64x256xbf16>
          }
          %c1_6 = arith.constant 1 : index
          %c0_7 = arith.constant 0 : index
          %8 = scf.index_switch %c0_7 -> memref<16x256xbf16> 
          case 0 {
            scf.yield %3 : memref<16x256xbf16>
          }
          default {
            scf.yield %3 : memref<16x256xbf16>
          }
          func.call @op0_matmul_bf16_bf16_16_64_256(%6, %7, %8) : (memref<16x64xbf16>, memref<64x256xbf16>, memref<16x256xbf16>) -> ()
          aie.objectfifo.release @of_3_unicast_1_0(Consume, 1)
          aie.objectfifo.release @of_6_unicast_1(Produce, 1)
        }
        aie.objectfifo.release @of_4_broadcast_0_0(Consume, 1)
      }
      aie.end
    } {link_with = "op0_mm_16_64_256.o"}
    %core_1_3 = aie.core(%tile_1_3) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c4 = arith.constant 4 : index
        scf.for %arg1 = %c0_0 to %c4 step %c1_1 {
          %0 = aie.objectfifo.acquire @of_8_unicast_1(Produce, 1) : !aie.objectfifosubview<memref<16x256xbf16>>
          %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<16x256xbf16>> -> memref<16x256xbf16>
          %2 = aie.objectfifo.acquire @of_7_unicast_1_0(Consume, 1) : !aie.objectfifosubview<memref<16x256xbf16>>
          %3 = aie.objectfifo.subview.access %2[0] : !aie.objectfifosubview<memref<16x256xbf16>> -> memref<16x256xbf16>
          %c1_2 = arith.constant 1 : index
          %c0_3 = arith.constant 0 : index
          %4 = scf.index_switch %c0_3 -> memref<16x256xbf16> 
          case 0 {
            scf.yield %3 : memref<16x256xbf16>
          }
          default {
            scf.yield %3 : memref<16x256xbf16>
          }
          %c1_4 = arith.constant 1 : index
          %c0_5 = arith.constant 0 : index
          %5 = scf.index_switch %c0_5 -> memref<16x256xbf16> 
          case 0 {
            scf.yield %1 : memref<16x256xbf16>
          }
          default {
            scf.yield %1 : memref<16x256xbf16>
          }
          %c16_i32 = arith.constant 16 : i32
          %c256_i32 = arith.constant 256 : i32
          func.call @op0_softmax_rows_bf16(%4, %5, %c16_i32, %c256_i32) : (memref<16x256xbf16>, memref<16x256xbf16>, i32, i32) -> ()
          aie.objectfifo.release @of_7_unicast_1_0(Consume, 1)
          aie.objectfifo.release @of_8_unicast_1(Produce, 1)
        }
      }
      aie.end
    } {link_with = "op0_softmax.o"}
    %core_1_4 = aie.core(%tile_1_4) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %0 = aie.objectfifo.acquire @of_5_broadcast_0_0(Consume, 1) : !aie.objectfifosubview<memref<256x64xbf16>>
        %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<256x64xbf16>> -> memref<256x64xbf16>
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c4 = arith.constant 4 : index
        scf.for %arg1 = %c0_0 to %c4 step %c1_1 {
          %2 = aie.objectfifo.acquire @of_10_unicast_1(Produce, 1) : !aie.objectfifosubview<memref<16x64xbf16>>
          %3 = aie.objectfifo.subview.access %2[0] : !aie.objectfifosubview<memref<16x64xbf16>> -> memref<16x64xbf16>
          func.call @op0_zero_bf16_16_256_64(%3) : (memref<16x64xbf16>) -> ()
          %4 = aie.objectfifo.acquire @of_9_unicast_1_0(Consume, 1) : !aie.objectfifosubview<memref<16x256xbf16>>
          %5 = aie.objectfifo.subview.access %4[0] : !aie.objectfifosubview<memref<16x256xbf16>> -> memref<16x256xbf16>
          %c1_2 = arith.constant 1 : index
          %c0_3 = arith.constant 0 : index
          %6 = scf.index_switch %c0_3 -> memref<256x64xbf16> 
          case 0 {
            scf.yield %1 : memref<256x64xbf16>
          }
          default {
            scf.yield %1 : memref<256x64xbf16>
          }
          %c1_4 = arith.constant 1 : index
          %c0_5 = arith.constant 0 : index
          %7 = scf.index_switch %c0_5 -> memref<16x256xbf16> 
          case 0 {
            scf.yield %5 : memref<16x256xbf16>
          }
          default {
            scf.yield %5 : memref<16x256xbf16>
          }
          %c1_6 = arith.constant 1 : index
          %c0_7 = arith.constant 0 : index
          %8 = scf.index_switch %c0_7 -> memref<16x64xbf16> 
          case 0 {
            scf.yield %3 : memref<16x64xbf16>
          }
          default {
            scf.yield %3 : memref<16x64xbf16>
          }
          func.call @op0_matmul_bf16_bf16_16_256_64(%7, %6, %8) : (memref<16x256xbf16>, memref<256x64xbf16>, memref<16x64xbf16>) -> ()
          aie.objectfifo.release @of_9_unicast_1_0(Consume, 1)
          aie.objectfifo.release @of_10_unicast_1(Produce, 1)
        }
        aie.objectfifo.release @of_5_broadcast_0_0(Consume, 1)
      }
      aie.end
    } {link_with = "op0_mm_16_256_64.o"}
    %core_2_2 = aie.core(%tile_2_2) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %0 = aie.objectfifo.acquire @of_4_broadcast_0_0(Consume, 1) : !aie.objectfifosubview<memref<64x256xbf16>>
        %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<64x256xbf16>> -> memref<64x256xbf16>
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c4 = arith.constant 4 : index
        scf.for %arg1 = %c0_0 to %c4 step %c1_1 {
          %2 = aie.objectfifo.acquire @of_6_unicast_2(Produce, 1) : !aie.objectfifosubview<memref<16x256xbf16>>
          %3 = aie.objectfifo.subview.access %2[0] : !aie.objectfifosubview<memref<16x256xbf16>> -> memref<16x256xbf16>
          func.call @op0_zero_bf16_16_64_256(%3) : (memref<16x256xbf16>) -> ()
          %4 = aie.objectfifo.acquire @of_3_unicast_2_0(Consume, 1) : !aie.objectfifosubview<memref<16x64xbf16>>
          %5 = aie.objectfifo.subview.access %4[0] : !aie.objectfifosubview<memref<16x64xbf16>> -> memref<16x64xbf16>
          %c1_2 = arith.constant 1 : index
          %c0_3 = arith.constant 0 : index
          %6 = scf.index_switch %c0_3 -> memref<16x64xbf16> 
          case 0 {
            scf.yield %5 : memref<16x64xbf16>
          }
          default {
            scf.yield %5 : memref<16x64xbf16>
          }
          %c1_4 = arith.constant 1 : index
          %c0_5 = arith.constant 0 : index
          %7 = scf.index_switch %c0_5 -> memref<64x256xbf16> 
          case 0 {
            scf.yield %1 : memref<64x256xbf16>
          }
          default {
            scf.yield %1 : memref<64x256xbf16>
          }
          %c1_6 = arith.constant 1 : index
          %c0_7 = arith.constant 0 : index
          %8 = scf.index_switch %c0_7 -> memref<16x256xbf16> 
          case 0 {
            scf.yield %3 : memref<16x256xbf16>
          }
          default {
            scf.yield %3 : memref<16x256xbf16>
          }
          func.call @op0_matmul_bf16_bf16_16_64_256(%6, %7, %8) : (memref<16x64xbf16>, memref<64x256xbf16>, memref<16x256xbf16>) -> ()
          aie.objectfifo.release @of_3_unicast_2_0(Consume, 1)
          aie.objectfifo.release @of_6_unicast_2(Produce, 1)
        }
        aie.objectfifo.release @of_4_broadcast_0_0(Consume, 1)
      }
      aie.end
    } {link_with = "op0_mm_16_64_256.o"}
    %core_2_3 = aie.core(%tile_2_3) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c4 = arith.constant 4 : index
        scf.for %arg1 = %c0_0 to %c4 step %c1_1 {
          %0 = aie.objectfifo.acquire @of_8_unicast_2(Produce, 1) : !aie.objectfifosubview<memref<16x256xbf16>>
          %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<16x256xbf16>> -> memref<16x256xbf16>
          %2 = aie.objectfifo.acquire @of_7_unicast_2_0(Consume, 1) : !aie.objectfifosubview<memref<16x256xbf16>>
          %3 = aie.objectfifo.subview.access %2[0] : !aie.objectfifosubview<memref<16x256xbf16>> -> memref<16x256xbf16>
          %c1_2 = arith.constant 1 : index
          %c0_3 = arith.constant 0 : index
          %4 = scf.index_switch %c0_3 -> memref<16x256xbf16> 
          case 0 {
            scf.yield %3 : memref<16x256xbf16>
          }
          default {
            scf.yield %3 : memref<16x256xbf16>
          }
          %c1_4 = arith.constant 1 : index
          %c0_5 = arith.constant 0 : index
          %5 = scf.index_switch %c0_5 -> memref<16x256xbf16> 
          case 0 {
            scf.yield %1 : memref<16x256xbf16>
          }
          default {
            scf.yield %1 : memref<16x256xbf16>
          }
          %c16_i32 = arith.constant 16 : i32
          %c256_i32 = arith.constant 256 : i32
          func.call @op0_softmax_rows_bf16(%4, %5, %c16_i32, %c256_i32) : (memref<16x256xbf16>, memref<16x256xbf16>, i32, i32) -> ()
          aie.objectfifo.release @of_7_unicast_2_0(Consume, 1)
          aie.objectfifo.release @of_8_unicast_2(Produce, 1)
        }
      }
      aie.end
    } {link_with = "op0_softmax.o"}
    %core_2_4 = aie.core(%tile_2_4) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %0 = aie.objectfifo.acquire @of_5_broadcast_0_0(Consume, 1) : !aie.objectfifosubview<memref<256x64xbf16>>
        %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<256x64xbf16>> -> memref<256x64xbf16>
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c4 = arith.constant 4 : index
        scf.for %arg1 = %c0_0 to %c4 step %c1_1 {
          %2 = aie.objectfifo.acquire @of_10_unicast_2(Produce, 1) : !aie.objectfifosubview<memref<16x64xbf16>>
          %3 = aie.objectfifo.subview.access %2[0] : !aie.objectfifosubview<memref<16x64xbf16>> -> memref<16x64xbf16>
          func.call @op0_zero_bf16_16_256_64(%3) : (memref<16x64xbf16>) -> ()
          %4 = aie.objectfifo.acquire @of_9_unicast_2_0(Consume, 1) : !aie.objectfifosubview<memref<16x256xbf16>>
          %5 = aie.objectfifo.subview.access %4[0] : !aie.objectfifosubview<memref<16x256xbf16>> -> memref<16x256xbf16>
          %c1_2 = arith.constant 1 : index
          %c0_3 = arith.constant 0 : index
          %6 = scf.index_switch %c0_3 -> memref<256x64xbf16> 
          case 0 {
            scf.yield %1 : memref<256x64xbf16>
          }
          default {
            scf.yield %1 : memref<256x64xbf16>
          }
          %c1_4 = arith.constant 1 : index
          %c0_5 = arith.constant 0 : index
          %7 = scf.index_switch %c0_5 -> memref<16x256xbf16> 
          case 0 {
            scf.yield %5 : memref<16x256xbf16>
          }
          default {
            scf.yield %5 : memref<16x256xbf16>
          }
          %c1_6 = arith.constant 1 : index
          %c0_7 = arith.constant 0 : index
          %8 = scf.index_switch %c0_7 -> memref<16x64xbf16> 
          case 0 {
            scf.yield %3 : memref<16x64xbf16>
          }
          default {
            scf.yield %3 : memref<16x64xbf16>
          }
          func.call @op0_matmul_bf16_bf16_16_256_64(%7, %6, %8) : (memref<16x256xbf16>, memref<256x64xbf16>, memref<16x64xbf16>) -> ()
          aie.objectfifo.release @of_9_unicast_2_0(Consume, 1)
          aie.objectfifo.release @of_10_unicast_2(Produce, 1)
        }
        aie.objectfifo.release @of_5_broadcast_0_0(Consume, 1)
      }
      aie.end
    } {link_with = "op0_mm_16_256_64.o"}
    %core_3_2 = aie.core(%tile_3_2) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %0 = aie.objectfifo.acquire @of_4_broadcast_0_0(Consume, 1) : !aie.objectfifosubview<memref<64x256xbf16>>
        %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<64x256xbf16>> -> memref<64x256xbf16>
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c4 = arith.constant 4 : index
        scf.for %arg1 = %c0_0 to %c4 step %c1_1 {
          %2 = aie.objectfifo.acquire @of_6_unicast_3(Produce, 1) : !aie.objectfifosubview<memref<16x256xbf16>>
          %3 = aie.objectfifo.subview.access %2[0] : !aie.objectfifosubview<memref<16x256xbf16>> -> memref<16x256xbf16>
          func.call @op0_zero_bf16_16_64_256(%3) : (memref<16x256xbf16>) -> ()
          %4 = aie.objectfifo.acquire @of_3_unicast_3_0(Consume, 1) : !aie.objectfifosubview<memref<16x64xbf16>>
          %5 = aie.objectfifo.subview.access %4[0] : !aie.objectfifosubview<memref<16x64xbf16>> -> memref<16x64xbf16>
          %c1_2 = arith.constant 1 : index
          %c0_3 = arith.constant 0 : index
          %6 = scf.index_switch %c0_3 -> memref<16x64xbf16> 
          case 0 {
            scf.yield %5 : memref<16x64xbf16>
          }
          default {
            scf.yield %5 : memref<16x64xbf16>
          }
          %c1_4 = arith.constant 1 : index
          %c0_5 = arith.constant 0 : index
          %7 = scf.index_switch %c0_5 -> memref<64x256xbf16> 
          case 0 {
            scf.yield %1 : memref<64x256xbf16>
          }
          default {
            scf.yield %1 : memref<64x256xbf16>
          }
          %c1_6 = arith.constant 1 : index
          %c0_7 = arith.constant 0 : index
          %8 = scf.index_switch %c0_7 -> memref<16x256xbf16> 
          case 0 {
            scf.yield %3 : memref<16x256xbf16>
          }
          default {
            scf.yield %3 : memref<16x256xbf16>
          }
          func.call @op0_matmul_bf16_bf16_16_64_256(%6, %7, %8) : (memref<16x64xbf16>, memref<64x256xbf16>, memref<16x256xbf16>) -> ()
          aie.objectfifo.release @of_3_unicast_3_0(Consume, 1)
          aie.objectfifo.release @of_6_unicast_3(Produce, 1)
        }
        aie.objectfifo.release @of_4_broadcast_0_0(Consume, 1)
      }
      aie.end
    } {link_with = "op0_mm_16_64_256.o"}
    %core_3_3 = aie.core(%tile_3_3) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c4 = arith.constant 4 : index
        scf.for %arg1 = %c0_0 to %c4 step %c1_1 {
          %0 = aie.objectfifo.acquire @of_8_unicast_3(Produce, 1) : !aie.objectfifosubview<memref<16x256xbf16>>
          %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<16x256xbf16>> -> memref<16x256xbf16>
          %2 = aie.objectfifo.acquire @of_7_unicast_3_0(Consume, 1) : !aie.objectfifosubview<memref<16x256xbf16>>
          %3 = aie.objectfifo.subview.access %2[0] : !aie.objectfifosubview<memref<16x256xbf16>> -> memref<16x256xbf16>
          %c1_2 = arith.constant 1 : index
          %c0_3 = arith.constant 0 : index
          %4 = scf.index_switch %c0_3 -> memref<16x256xbf16> 
          case 0 {
            scf.yield %3 : memref<16x256xbf16>
          }
          default {
            scf.yield %3 : memref<16x256xbf16>
          }
          %c1_4 = arith.constant 1 : index
          %c0_5 = arith.constant 0 : index
          %5 = scf.index_switch %c0_5 -> memref<16x256xbf16> 
          case 0 {
            scf.yield %1 : memref<16x256xbf16>
          }
          default {
            scf.yield %1 : memref<16x256xbf16>
          }
          %c16_i32 = arith.constant 16 : i32
          %c256_i32 = arith.constant 256 : i32
          func.call @op0_softmax_rows_bf16(%4, %5, %c16_i32, %c256_i32) : (memref<16x256xbf16>, memref<16x256xbf16>, i32, i32) -> ()
          aie.objectfifo.release @of_7_unicast_3_0(Consume, 1)
          aie.objectfifo.release @of_8_unicast_3(Produce, 1)
        }
      }
      aie.end
    } {link_with = "op0_softmax.o"}
    %core_3_4 = aie.core(%tile_3_4) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %0 = aie.objectfifo.acquire @of_5_broadcast_0_0(Consume, 1) : !aie.objectfifosubview<memref<256x64xbf16>>
        %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<256x64xbf16>> -> memref<256x64xbf16>
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c4 = arith.constant 4 : index
        scf.for %arg1 = %c0_0 to %c4 step %c1_1 {
          %2 = aie.objectfifo.acquire @of_10_unicast_3(Produce, 1) : !aie.objectfifosubview<memref<16x64xbf16>>
          %3 = aie.objectfifo.subview.access %2[0] : !aie.objectfifosubview<memref<16x64xbf16>> -> memref<16x64xbf16>
          func.call @op0_zero_bf16_16_256_64(%3) : (memref<16x64xbf16>) -> ()
          %4 = aie.objectfifo.acquire @of_9_unicast_3_0(Consume, 1) : !aie.objectfifosubview<memref<16x256xbf16>>
          %5 = aie.objectfifo.subview.access %4[0] : !aie.objectfifosubview<memref<16x256xbf16>> -> memref<16x256xbf16>
          %c1_2 = arith.constant 1 : index
          %c0_3 = arith.constant 0 : index
          %6 = scf.index_switch %c0_3 -> memref<256x64xbf16> 
          case 0 {
            scf.yield %1 : memref<256x64xbf16>
          }
          default {
            scf.yield %1 : memref<256x64xbf16>
          }
          %c1_4 = arith.constant 1 : index
          %c0_5 = arith.constant 0 : index
          %7 = scf.index_switch %c0_5 -> memref<16x256xbf16> 
          case 0 {
            scf.yield %5 : memref<16x256xbf16>
          }
          default {
            scf.yield %5 : memref<16x256xbf16>
          }
          %c1_6 = arith.constant 1 : index
          %c0_7 = arith.constant 0 : index
          %8 = scf.index_switch %c0_7 -> memref<16x64xbf16> 
          case 0 {
            scf.yield %3 : memref<16x64xbf16>
          }
          default {
            scf.yield %3 : memref<16x64xbf16>
          }
          func.call @op0_matmul_bf16_bf16_16_256_64(%7, %6, %8) : (memref<16x256xbf16>, memref<256x64xbf16>, memref<16x64xbf16>) -> ()
          aie.objectfifo.release @of_9_unicast_3_0(Consume, 1)
          aie.objectfifo.release @of_10_unicast_3(Produce, 1)
        }
        aie.objectfifo.release @of_5_broadcast_0_0(Consume, 1)
      }
      aie.end
    } {link_with = "op0_mm_16_256_64.o"}
    aie.objectfifo @of_0_mem_0(%shim_noc_tile_0_0, {%mem_tile_0_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<16x64xbf16>>  
    aie.objectfifo @of_0_mem_1(%shim_noc_tile_3_0, {%mem_tile_3_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<16x64xbf16>>  
    aie.objectfifo @of_0_mem_2(%shim_noc_tile_6_0, {%mem_tile_6_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<16x64xbf16>>  
    aie.objectfifo @of_0_mem_3(%shim_noc_tile_7_0, {%mem_tile_7_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<16x64xbf16>>  
    aie.objectfifo @of_1_mem(%shim_noc_tile_5_0, {%mem_tile_5_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x256xbf16>>  
    aie.objectfifo @of_2_mem(%shim_noc_tile_4_0, {%mem_tile_4_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<256x64xbf16>>  
    aie.objectfifo @of_3_unicast_0_0(%mem_tile_0_1 dimensionsToStream [<size = 2, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%tile_0_2}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<16x64xbf16>>  
    aie.objectfifo.link [@of_0_mem_0] -> [@of_3_unicast_0_0]([] [0])
    aie.objectfifo @of_3_unicast_1_0(%mem_tile_3_1 dimensionsToStream [<size = 2, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%tile_1_2}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<16x64xbf16>>  
    aie.objectfifo.link [@of_0_mem_1] -> [@of_3_unicast_1_0]([] [0])
    aie.objectfifo @of_3_unicast_2_0(%mem_tile_6_1 dimensionsToStream [<size = 2, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%tile_2_2}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<16x64xbf16>>  
    aie.objectfifo.link [@of_0_mem_2] -> [@of_3_unicast_2_0]([] [0])
    aie.objectfifo @of_3_unicast_3_0(%mem_tile_7_1 dimensionsToStream [<size = 2, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%tile_3_2}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<16x64xbf16>>  
    aie.objectfifo.link [@of_0_mem_3] -> [@of_3_unicast_3_0]([] [0])
    aie.objectfifo @of_4_broadcast_0_0(%mem_tile_5_1 dimensionsToStream [<size = 8, stride = 2048>, <size = 32, stride = 8>, <size = 8, stride = 256>, <size = 8, stride = 1>], {%tile_0_2, %tile_1_2, %tile_2_2, %tile_3_2}, [2 : i32, 1 : i32, 1 : i32, 1 : i32, 1 : i32]) : !aie.objectfifo<memref<64x256xbf16>>  
    aie.objectfifo.link [@of_1_mem] -> [@of_4_broadcast_0_0]([] [0])
    aie.objectfifo @of_5_broadcast_0_0(%mem_tile_4_1 dimensionsToStream [<size = 32, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%tile_0_4, %tile_1_4, %tile_2_4, %tile_3_4}, [2 : i32, 1 : i32, 1 : i32, 1 : i32, 1 : i32]) : !aie.objectfifo<memref<256x64xbf16>>  
    aie.objectfifo.link [@of_2_mem] -> [@of_5_broadcast_0_0]([] [0])
    aie.objectfifo @of_6_unicast_0(%tile_0_2, {%mem_tile_2_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<16x256xbf16>>  
    aie.objectfifo @of_6_unicast_1(%tile_1_2, {%mem_tile_4_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<16x256xbf16>>  
    aie.objectfifo @of_6_unicast_2(%tile_2_2, {%mem_tile_6_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<16x256xbf16>>  
    aie.objectfifo @of_6_unicast_3(%tile_3_2, {%mem_tile_7_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<16x256xbf16>>  
    aie.objectfifo @of_7_unicast_0_0(%mem_tile_2_1 dimensionsToStream [<size = 2, stride = 2048>, <size = 8, stride = 8>, <size = 32, stride = 64>, <size = 8, stride = 1>], {%tile_0_3}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<16x256xbf16>>  
    aie.objectfifo.link [@of_6_unicast_0] -> [@of_7_unicast_0_0]([] [0])
    aie.objectfifo @of_7_unicast_1_0(%mem_tile_4_1 dimensionsToStream [<size = 2, stride = 2048>, <size = 8, stride = 8>, <size = 32, stride = 64>, <size = 8, stride = 1>], {%tile_1_3}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<16x256xbf16>>  
    aie.objectfifo.link [@of_6_unicast_1] -> [@of_7_unicast_1_0]([] [0])
    aie.objectfifo @of_7_unicast_2_0(%mem_tile_6_1 dimensionsToStream [<size = 2, stride = 2048>, <size = 8, stride = 8>, <size = 32, stride = 64>, <size = 8, stride = 1>], {%tile_2_3}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<16x256xbf16>>  
    aie.objectfifo.link [@of_6_unicast_2] -> [@of_7_unicast_2_0]([] [0])
    aie.objectfifo @of_7_unicast_3_0(%mem_tile_7_1 dimensionsToStream [<size = 2, stride = 2048>, <size = 8, stride = 8>, <size = 32, stride = 64>, <size = 8, stride = 1>], {%tile_3_3}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<16x256xbf16>>  
    aie.objectfifo.link [@of_6_unicast_3] -> [@of_7_unicast_3_0]([] [0])
    aie.objectfifo @of_8_unicast_0(%tile_0_3, {%mem_tile_2_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<16x256xbf16>>  
    aie.objectfifo @of_8_unicast_1(%tile_1_3, {%mem_tile_3_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<16x256xbf16>>  
    aie.objectfifo @of_8_unicast_2(%tile_2_3, {%mem_tile_5_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<16x256xbf16>>  
    aie.objectfifo @of_8_unicast_3(%tile_3_3, {%mem_tile_7_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<16x256xbf16>>  
    aie.objectfifo @of_9_unicast_0_0(%mem_tile_2_1 dimensionsToStream [<size = 2, stride = 2048>, <size = 32, stride = 8>, <size = 8, stride = 256>, <size = 8, stride = 1>], {%tile_0_4}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<16x256xbf16>>  
    aie.objectfifo.link [@of_8_unicast_0] -> [@of_9_unicast_0_0]([] [0])
    aie.objectfifo @of_9_unicast_1_0(%mem_tile_3_1 dimensionsToStream [<size = 2, stride = 2048>, <size = 32, stride = 8>, <size = 8, stride = 256>, <size = 8, stride = 1>], {%tile_1_4}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<16x256xbf16>>  
    aie.objectfifo.link [@of_8_unicast_1] -> [@of_9_unicast_1_0]([] [0])
    aie.objectfifo @of_9_unicast_2_0(%mem_tile_5_1 dimensionsToStream [<size = 2, stride = 2048>, <size = 32, stride = 8>, <size = 8, stride = 256>, <size = 8, stride = 1>], {%tile_2_4}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<16x256xbf16>>  
    aie.objectfifo.link [@of_8_unicast_2] -> [@of_9_unicast_2_0]([] [0])
    aie.objectfifo @of_9_unicast_3_0(%mem_tile_7_1 dimensionsToStream [<size = 2, stride = 2048>, <size = 32, stride = 8>, <size = 8, stride = 256>, <size = 8, stride = 1>], {%tile_3_4}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<16x256xbf16>>  
    aie.objectfifo.link [@of_8_unicast_3] -> [@of_9_unicast_3_0]([] [0])
    aie.objectfifo @of_10_unicast_0(%tile_0_4, {%mem_tile_1_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<16x64xbf16>>  
    aie.objectfifo @of_10_unicast_1(%tile_1_4, {%mem_tile_3_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<16x64xbf16>>  
    aie.objectfifo @of_10_unicast_2(%tile_2_4, {%mem_tile_5_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<16x64xbf16>>  
    aie.objectfifo @of_10_unicast_3(%tile_3_4, {%mem_tile_6_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<16x64xbf16>>  
    aie.objectfifo @of_11_mem_0(%mem_tile_1_1 dimensionsToStream [<size = 2, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%shim_noc_tile_1_0}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<16x64xbf16>>  
    aie.objectfifo.link [@of_10_unicast_0] -> [@of_11_mem_0]([] [])
    aie.objectfifo @of_11_mem_1(%mem_tile_3_1 dimensionsToStream [<size = 2, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%shim_noc_tile_3_0}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<16x64xbf16>>  
    aie.objectfifo.link [@of_10_unicast_1] -> [@of_11_mem_1]([] [])
    aie.objectfifo @of_11_mem_2(%mem_tile_5_1 dimensionsToStream [<size = 2, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%shim_noc_tile_5_0}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<16x64xbf16>>  
    aie.objectfifo.link [@of_10_unicast_2] -> [@of_11_mem_2]([] [])
    aie.objectfifo @of_11_mem_3(%mem_tile_6_1 dimensionsToStream [<size = 2, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%shim_noc_tile_6_0}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<16x64xbf16>>  
    aie.objectfifo.link [@of_10_unicast_3] -> [@of_11_mem_3]([] [])
    func.func private @op0_zero_bf16_16_64_256(memref<16x256xbf16>)
    func.func private @op0_matmul_bf16_bf16_16_64_256(memref<16x64xbf16>, memref<64x256xbf16>, memref<16x256xbf16>)
    func.func private @op0_zero_bf16_16_256_64(memref<16x64xbf16>)
    func.func private @op0_matmul_bf16_bf16_16_256_64(memref<16x256xbf16>, memref<256x64xbf16>, memref<16x64xbf16>)
    func.func private @op0_softmax_rows_bf16(memref<16x256xbf16>, memref<16x256xbf16>, i32, i32)
  }
  aie.device(npu2) @reset_device {
    aie.runtime_sequence() {
    }
  }
  aie.device(npu2) {
    aie.runtime_sequence(%arg0: memref<49152xbf16>, %arg1: memref<16384xbf16>, %arg2: memref<1xbf16>) {
      aiex.configure @op0__MHAStreamGroup {
        %subview = memref.subview %arg0[0] [16384] [1] : memref<49152xbf16> to memref<16384xbf16>
        %reinterpret_cast = memref.reinterpret_cast %subview to offset: [0], sizes: [256, 64], strides: [64, 1] : memref<16384xbf16> to memref<256x64xbf16>
        %subview_0 = memref.subview %arg0[16384] [16384] [1] : memref<49152xbf16> to memref<16384xbf16, strided<[1], offset: 16384>>
        %reinterpret_cast_1 = memref.reinterpret_cast %subview_0 to offset: [0], sizes: [64, 256], strides: [256, 1] : memref<16384xbf16, strided<[1], offset: 16384>> to memref<64x256xbf16>
        %subview_2 = memref.subview %arg0[32768] [16384] [1] : memref<49152xbf16> to memref<16384xbf16, strided<[1], offset: 32768>>
        %reinterpret_cast_3 = memref.reinterpret_cast %subview_2 to offset: [0], sizes: [256, 64], strides: [64, 1] : memref<16384xbf16, strided<[1], offset: 32768>> to memref<256x64xbf16>
        %subview_4 = memref.subview %arg1[0] [16384] [1] : memref<16384xbf16> to memref<16384xbf16>
        %reinterpret_cast_5 = memref.reinterpret_cast %subview_4 to offset: [0], sizes: [256, 64], strides: [64, 1] : memref<16384xbf16> to memref<256x64xbf16>
        aiex.run @sequence(%reinterpret_cast, %reinterpret_cast_1, %reinterpret_cast_3, %reinterpret_cast_5) : (memref<256x64xbf16>, memref<64x256xbf16>, memref<256x64xbf16>, memref<256x64xbf16>)
      }
      aiex.configure @reset_device {
      }
    }
  }
}
