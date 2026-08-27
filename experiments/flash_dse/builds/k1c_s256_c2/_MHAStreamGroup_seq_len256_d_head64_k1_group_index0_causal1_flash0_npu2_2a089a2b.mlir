module {
  aie.device(npu2) {
    %shim_noc_tile_0_0 = aie.tile(0, 0)
    %shim_noc_tile_1_0 = aie.tile(1, 0)
    %shim_noc_tile_2_0 = aie.tile(2, 0)
    %shim_noc_tile_3_0 = aie.tile(3, 0)
    %shim_noc_tile_6_0 = aie.tile(6, 0)
    %shim_noc_tile_7_0 = aie.tile(7, 0)
    %mem_tile_2_1 = aie.tile(2, 1)
    %mem_tile_3_1 = aie.tile(3, 1)
    %mem_tile_6_1 = aie.tile(6, 1)
    %mem_tile_1_1 = aie.tile(1, 1)
    %tile_0_2 = aie.tile(0, 2)
    %tile_1_2 = aie.tile(1, 2)
    %tile_0_4 = aie.tile(0, 4)
    %tile_1_4 = aie.tile(1, 4)
    %mem_tile_4_1 = aie.tile(4, 1)
    %mem_tile_5_1 = aie.tile(5, 1)
    %tile_0_3 = aie.tile(0, 3)
    %tile_1_3 = aie.tile(1, 3)
    %mem_tile_0_1 = aie.tile(0, 1)
    %mem_tile_7_1 = aie.tile(7, 1)
    aie.runtime_sequence(%arg0: memref<256x64xbf16>, %arg1: memref<64x256xbf16>, %arg2: memref<256x64xbf16>, %arg3: memref<256x64xbf16>) {
      %0 = aiex.dma_configure_task_for @of_0_mem_0 {
        aie.dma_bd(%arg0 : memref<256x64xbf16> offset = 0 len = 8192 sizes = [1, 8, 32, 32] strides = [0, 2048, 32, 1])
        aie.end
      } {iteration_t = 0 : index}
      aiex.dma_start_task(%0)
      %1 = aiex.dma_configure_task_for @of_0_mem_1 {
        aie.dma_bd(%arg0 : memref<256x64xbf16> offset = 1024 len = 8192 sizes = [1, 8, 32, 32] strides = [0, 2048, 32, 1])
        aie.end
      } {iteration_t = 0 : index}
      aiex.dma_start_task(%1)
      %2 = aiex.dma_configure_task_for @of_1_mem {
        aie.dma_bd(%arg1 : memref<64x256xbf16> offset = 0 len = 16384 sizes = [1, 1, 128, 128] strides = [0, 0, 128, 1])
        aie.end
      } {iteration_t = 0 : index}
      aiex.dma_start_task(%2)
      %3 = aiex.dma_configure_task_for @of_2_mem {
        aie.dma_bd(%arg2 : memref<256x64xbf16> offset = 0 len = 16384 sizes = [1, 1, 128, 128] strides = [0, 0, 128, 1])
        aie.end
      } {iteration_t = 0 : index}
      aiex.dma_start_task(%3)
      %4 = aiex.dma_configure_task_for @of_11_mem_0 {
        aie.dma_bd(%arg3 : memref<256x64xbf16> offset = 0 len = 8192 sizes = [1, 8, 32, 32] strides = [0, 2048, 32, 1])
        aie.end
      } {issue_token = true, iteration_t = 0 : index}
      aiex.dma_start_task(%4)
      %5 = aiex.dma_configure_task_for @of_11_mem_1 {
        aie.dma_bd(%arg3 : memref<256x64xbf16> offset = 1024 len = 8192 sizes = [1, 8, 32, 32] strides = [0, 2048, 32, 1])
        aie.end
      } {issue_token = true, iteration_t = 0 : index}
      aiex.dma_start_task(%5)
      aiex.dma_await_task(%4)
      aiex.dma_await_task(%5)
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
        %c8 = arith.constant 8 : index
        scf.for %arg1 = %c0_0 to %c8 step %c1_1 {
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
        %c8 = arith.constant 8 : index
        scf.for %arg1 = %c0_0 to %c8 step %c1_1 {
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
          %6 = arith.index_cast %arg1 : index to i32
          %c32_i32 = arith.constant 32 : i32
          %7 = arith.muli %6, %c32_i32 : i32
          %c0_i32 = arith.constant 0 : i32
          %8 = arith.addi %c0_i32, %7 : i32
          func.call @op0_softmax_rows_causal_bf16(%4, %5, %c16_i32, %c256_i32, %8) : (memref<16x256xbf16>, memref<16x256xbf16>, i32, i32, i32) -> ()
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
        %c8 = arith.constant 8 : index
        scf.for %arg1 = %c0_0 to %c8 step %c1_1 {
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
        %c8 = arith.constant 8 : index
        scf.for %arg1 = %c0_0 to %c8 step %c1_1 {
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
        %c8 = arith.constant 8 : index
        scf.for %arg1 = %c0_0 to %c8 step %c1_1 {
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
          %6 = arith.index_cast %arg1 : index to i32
          %c32_i32 = arith.constant 32 : i32
          %7 = arith.muli %6, %c32_i32 : i32
          %c16_i32_6 = arith.constant 16 : i32
          %8 = arith.addi %c16_i32_6, %7 : i32
          func.call @op0_softmax_rows_causal_bf16(%4, %5, %c16_i32, %c256_i32, %8) : (memref<16x256xbf16>, memref<16x256xbf16>, i32, i32, i32) -> ()
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
        %c8 = arith.constant 8 : index
        scf.for %arg1 = %c0_0 to %c8 step %c1_1 {
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
    aie.objectfifo @of_0_mem_0(%shim_noc_tile_2_0, {%mem_tile_2_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<16x64xbf16>>  
    aie.objectfifo @of_0_mem_1(%shim_noc_tile_3_0, {%mem_tile_3_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<16x64xbf16>>  
    aie.objectfifo @of_1_mem(%shim_noc_tile_6_0, {%mem_tile_6_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x256xbf16>>  
    aie.objectfifo @of_2_mem(%shim_noc_tile_1_0, {%mem_tile_1_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<256x64xbf16>>  
    aie.objectfifo @of_3_unicast_0_0(%mem_tile_2_1 dimensionsToStream [<size = 2, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%tile_0_2}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<16x64xbf16>>  
    aie.objectfifo.link [@of_0_mem_0] -> [@of_3_unicast_0_0]([] [0])
    aie.objectfifo @of_3_unicast_1_0(%mem_tile_3_1 dimensionsToStream [<size = 2, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%tile_1_2}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<16x64xbf16>>  
    aie.objectfifo.link [@of_0_mem_1] -> [@of_3_unicast_1_0]([] [0])
    aie.objectfifo @of_4_broadcast_0_0(%mem_tile_6_1 dimensionsToStream [<size = 8, stride = 2048>, <size = 32, stride = 8>, <size = 8, stride = 256>, <size = 8, stride = 1>], {%tile_0_2, %tile_1_2}, [2 : i32, 1 : i32, 1 : i32]) : !aie.objectfifo<memref<64x256xbf16>>  
    aie.objectfifo.link [@of_1_mem] -> [@of_4_broadcast_0_0]([] [0])
    aie.objectfifo @of_5_broadcast_0_0(%mem_tile_1_1 dimensionsToStream [<size = 32, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%tile_0_4, %tile_1_4}, [2 : i32, 1 : i32, 1 : i32]) : !aie.objectfifo<memref<256x64xbf16>>  
    aie.objectfifo.link [@of_2_mem] -> [@of_5_broadcast_0_0]([] [0])
    aie.objectfifo @of_6_unicast_0(%tile_0_2, {%mem_tile_4_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<16x256xbf16>>  
    aie.objectfifo @of_6_unicast_1(%tile_1_2, {%mem_tile_5_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<16x256xbf16>>  
    aie.objectfifo @of_7_unicast_0_0(%mem_tile_4_1 dimensionsToStream [<size = 2, stride = 2048>, <size = 8, stride = 8>, <size = 32, stride = 64>, <size = 8, stride = 1>], {%tile_0_3}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<16x256xbf16>>  
    aie.objectfifo.link [@of_6_unicast_0] -> [@of_7_unicast_0_0]([] [0])
    aie.objectfifo @of_7_unicast_1_0(%mem_tile_5_1 dimensionsToStream [<size = 2, stride = 2048>, <size = 8, stride = 8>, <size = 32, stride = 64>, <size = 8, stride = 1>], {%tile_1_3}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<16x256xbf16>>  
    aie.objectfifo.link [@of_6_unicast_1] -> [@of_7_unicast_1_0]([] [0])
    aie.objectfifo @of_8_unicast_0(%tile_0_3, {%mem_tile_1_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<16x256xbf16>>  
    aie.objectfifo @of_8_unicast_1(%tile_1_3, {%mem_tile_3_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<16x256xbf16>>  
    aie.objectfifo @of_9_unicast_0_0(%mem_tile_1_1 dimensionsToStream [<size = 2, stride = 2048>, <size = 32, stride = 8>, <size = 8, stride = 256>, <size = 8, stride = 1>], {%tile_0_4}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<16x256xbf16>>  
    aie.objectfifo.link [@of_8_unicast_0] -> [@of_9_unicast_0_0]([] [0])
    aie.objectfifo @of_9_unicast_1_0(%mem_tile_3_1 dimensionsToStream [<size = 2, stride = 2048>, <size = 32, stride = 8>, <size = 8, stride = 256>, <size = 8, stride = 1>], {%tile_1_4}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<16x256xbf16>>  
    aie.objectfifo.link [@of_8_unicast_1] -> [@of_9_unicast_1_0]([] [0])
    aie.objectfifo @of_10_unicast_0(%tile_0_4, {%mem_tile_0_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<16x64xbf16>>  
    aie.objectfifo @of_10_unicast_1(%tile_1_4, {%mem_tile_7_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<16x64xbf16>>  
    aie.objectfifo @of_11_mem_0(%mem_tile_0_1 dimensionsToStream [<size = 2, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%shim_noc_tile_0_0}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<16x64xbf16>>  
    aie.objectfifo.link [@of_10_unicast_0] -> [@of_11_mem_0]([] [])
    aie.objectfifo @of_11_mem_1(%mem_tile_7_1 dimensionsToStream [<size = 2, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%shim_noc_tile_7_0}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<16x64xbf16>>  
    aie.objectfifo.link [@of_10_unicast_1] -> [@of_11_mem_1]([] [])
    func.func private @op0_zero_bf16_16_64_256(memref<16x256xbf16>)
    func.func private @op0_matmul_bf16_bf16_16_64_256(memref<16x64xbf16>, memref<64x256xbf16>, memref<16x256xbf16>)
    func.func private @op0_zero_bf16_16_256_64(memref<16x64xbf16>)
    func.func private @op0_matmul_bf16_bf16_16_256_64(memref<16x256xbf16>, memref<256x64xbf16>, memref<16x64xbf16>)
    func.func private @op0_softmax_rows_causal_bf16(memref<16x256xbf16>, memref<16x256xbf16>, i32, i32, i32)
  }
}
