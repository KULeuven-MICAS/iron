module {
  aie.device(npu2) {
    %shim_noc_tile_6_0 = aie.tile(6, 0)
    %shim_noc_tile_7_0 = aie.tile(7, 0)
    %mem_tile_6_1 = aie.tile(6, 1)
    %tile_0_2 = aie.tile(0, 2)
    %tile_0_3 = aie.tile(0, 3)
    %tile_0_4 = aie.tile(0, 4)
    %tile_0_5 = aie.tile(0, 5)
    %mem_tile_7_1 = aie.tile(7, 1)
    aie.runtime_sequence(%arg0: memref<256x256xbf16>, %arg1: memref<256x256xbf16>) {
      %0 = aiex.dma_configure_task_for @of_0_mem {
        aie.dma_bd(%arg0 : memref<256x256xbf16> offset = 0 len = 65536 sizes = [1, 1, 256, 256] strides = [0, 0, 256, 1])
        aie.end
      } {iteration_t = 0 : index}
      aiex.dma_start_task(%0)
      %1 = aiex.dma_configure_task_for @of_3_mem {
        aie.dma_bd(%arg1 : memref<256x256xbf16> offset = 0 len = 65536 sizes = [1, 1, 256, 256] strides = [0, 0, 256, 1])
        aie.end
      } {issue_token = true, iteration_t = 0 : index}
      aiex.dma_start_task(%1)
      aiex.dma_await_task(%1)
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
          %0 = aie.objectfifo.acquire @of_2_join_0_0(Produce, 1) : !aie.objectfifosubview<memref<1x256xbf16>>
          %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<1x256xbf16>> -> memref<1x256xbf16>
          %2 = aie.objectfifo.acquire @of_1_distribute_0_0(Consume, 1) : !aie.objectfifosubview<memref<1x256xbf16>>
          %3 = aie.objectfifo.subview.access %2[0] : !aie.objectfifosubview<memref<1x256xbf16>> -> memref<1x256xbf16>
          %c1_2 = arith.constant 1 : index
          %c0_3 = arith.constant 0 : index
          %4 = scf.index_switch %c0_3 -> memref<1x256xbf16> 
          case 0 {
            scf.yield %3 : memref<1x256xbf16>
          }
          default {
            scf.yield %3 : memref<1x256xbf16>
          }
          %c1_4 = arith.constant 1 : index
          %c0_5 = arith.constant 0 : index
          %5 = scf.index_switch %c0_5 -> memref<1x256xbf16> 
          case 0 {
            scf.yield %1 : memref<1x256xbf16>
          }
          default {
            scf.yield %1 : memref<1x256xbf16>
          }
          %c1_i32 = arith.constant 1 : i32
          %c256_i32 = arith.constant 256 : i32
          %6 = arith.index_cast %arg1 : index to i32
          %c4_i32 = arith.constant 4 : i32
          %7 = arith.muli %6, %c4_i32 : i32
          %c0_i32 = arith.constant 0 : i32
          %8 = arith.addi %c0_i32, %7 : i32
          func.call @op1_softmax_rows_causal_bf16(%4, %5, %c1_i32, %c256_i32, %8) : (memref<1x256xbf16>, memref<1x256xbf16>, i32, i32, i32) -> ()
          aie.objectfifo.release @of_1_distribute_0_0(Consume, 1)
          aie.objectfifo.release @of_2_join_0_0(Produce, 1)
        }
      }
      aie.end
    } {link_with = "op1_softmax.o"}
    %core_0_3 = aie.core(%tile_0_3) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c64 = arith.constant 64 : index
        scf.for %arg1 = %c0_0 to %c64 step %c1_1 {
          %0 = aie.objectfifo.acquire @of_2_join_0_1(Produce, 1) : !aie.objectfifosubview<memref<1x256xbf16>>
          %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<1x256xbf16>> -> memref<1x256xbf16>
          %2 = aie.objectfifo.acquire @of_1_distribute_0_1(Consume, 1) : !aie.objectfifosubview<memref<1x256xbf16>>
          %3 = aie.objectfifo.subview.access %2[0] : !aie.objectfifosubview<memref<1x256xbf16>> -> memref<1x256xbf16>
          %c1_2 = arith.constant 1 : index
          %c0_3 = arith.constant 0 : index
          %4 = scf.index_switch %c0_3 -> memref<1x256xbf16> 
          case 0 {
            scf.yield %3 : memref<1x256xbf16>
          }
          default {
            scf.yield %3 : memref<1x256xbf16>
          }
          %c1_4 = arith.constant 1 : index
          %c0_5 = arith.constant 0 : index
          %5 = scf.index_switch %c0_5 -> memref<1x256xbf16> 
          case 0 {
            scf.yield %1 : memref<1x256xbf16>
          }
          default {
            scf.yield %1 : memref<1x256xbf16>
          }
          %c1_i32 = arith.constant 1 : i32
          %c256_i32 = arith.constant 256 : i32
          %6 = arith.index_cast %arg1 : index to i32
          %c4_i32 = arith.constant 4 : i32
          %7 = arith.muli %6, %c4_i32 : i32
          %c1_i32_6 = arith.constant 1 : i32
          %8 = arith.addi %c1_i32_6, %7 : i32
          func.call @op1_softmax_rows_causal_bf16(%4, %5, %c1_i32, %c256_i32, %8) : (memref<1x256xbf16>, memref<1x256xbf16>, i32, i32, i32) -> ()
          aie.objectfifo.release @of_1_distribute_0_1(Consume, 1)
          aie.objectfifo.release @of_2_join_0_1(Produce, 1)
        }
      }
      aie.end
    } {link_with = "op1_softmax.o"}
    %core_0_4 = aie.core(%tile_0_4) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c64 = arith.constant 64 : index
        scf.for %arg1 = %c0_0 to %c64 step %c1_1 {
          %0 = aie.objectfifo.acquire @of_2_join_0_2(Produce, 1) : !aie.objectfifosubview<memref<1x256xbf16>>
          %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<1x256xbf16>> -> memref<1x256xbf16>
          %2 = aie.objectfifo.acquire @of_1_distribute_0_2(Consume, 1) : !aie.objectfifosubview<memref<1x256xbf16>>
          %3 = aie.objectfifo.subview.access %2[0] : !aie.objectfifosubview<memref<1x256xbf16>> -> memref<1x256xbf16>
          %c1_2 = arith.constant 1 : index
          %c0_3 = arith.constant 0 : index
          %4 = scf.index_switch %c0_3 -> memref<1x256xbf16> 
          case 0 {
            scf.yield %3 : memref<1x256xbf16>
          }
          default {
            scf.yield %3 : memref<1x256xbf16>
          }
          %c1_4 = arith.constant 1 : index
          %c0_5 = arith.constant 0 : index
          %5 = scf.index_switch %c0_5 -> memref<1x256xbf16> 
          case 0 {
            scf.yield %1 : memref<1x256xbf16>
          }
          default {
            scf.yield %1 : memref<1x256xbf16>
          }
          %c1_i32 = arith.constant 1 : i32
          %c256_i32 = arith.constant 256 : i32
          %6 = arith.index_cast %arg1 : index to i32
          %c4_i32 = arith.constant 4 : i32
          %7 = arith.muli %6, %c4_i32 : i32
          %c2_i32 = arith.constant 2 : i32
          %8 = arith.addi %c2_i32, %7 : i32
          func.call @op1_softmax_rows_causal_bf16(%4, %5, %c1_i32, %c256_i32, %8) : (memref<1x256xbf16>, memref<1x256xbf16>, i32, i32, i32) -> ()
          aie.objectfifo.release @of_1_distribute_0_2(Consume, 1)
          aie.objectfifo.release @of_2_join_0_2(Produce, 1)
        }
      }
      aie.end
    } {link_with = "op1_softmax.o"}
    %core_0_5 = aie.core(%tile_0_5) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c64 = arith.constant 64 : index
        scf.for %arg1 = %c0_0 to %c64 step %c1_1 {
          %0 = aie.objectfifo.acquire @of_2_join_0_3(Produce, 1) : !aie.objectfifosubview<memref<1x256xbf16>>
          %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<1x256xbf16>> -> memref<1x256xbf16>
          %2 = aie.objectfifo.acquire @of_1_distribute_0_3(Consume, 1) : !aie.objectfifosubview<memref<1x256xbf16>>
          %3 = aie.objectfifo.subview.access %2[0] : !aie.objectfifosubview<memref<1x256xbf16>> -> memref<1x256xbf16>
          %c1_2 = arith.constant 1 : index
          %c0_3 = arith.constant 0 : index
          %4 = scf.index_switch %c0_3 -> memref<1x256xbf16> 
          case 0 {
            scf.yield %3 : memref<1x256xbf16>
          }
          default {
            scf.yield %3 : memref<1x256xbf16>
          }
          %c1_4 = arith.constant 1 : index
          %c0_5 = arith.constant 0 : index
          %5 = scf.index_switch %c0_5 -> memref<1x256xbf16> 
          case 0 {
            scf.yield %1 : memref<1x256xbf16>
          }
          default {
            scf.yield %1 : memref<1x256xbf16>
          }
          %c1_i32 = arith.constant 1 : i32
          %c256_i32 = arith.constant 256 : i32
          %6 = arith.index_cast %arg1 : index to i32
          %c4_i32 = arith.constant 4 : i32
          %7 = arith.muli %6, %c4_i32 : i32
          %c3_i32 = arith.constant 3 : i32
          %8 = arith.addi %c3_i32, %7 : i32
          func.call @op1_softmax_rows_causal_bf16(%4, %5, %c1_i32, %c256_i32, %8) : (memref<1x256xbf16>, memref<1x256xbf16>, i32, i32, i32) -> ()
          aie.objectfifo.release @of_1_distribute_0_3(Consume, 1)
          aie.objectfifo.release @of_2_join_0_3(Produce, 1)
        }
      }
      aie.end
    } {link_with = "op1_softmax.o"}
    aie.objectfifo @of_0_mem(%shim_noc_tile_6_0, {%mem_tile_6_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<4x1x256xbf16>>  
    aie.objectfifo @of_1_distribute_0_0(%mem_tile_6_1, {%tile_0_2}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<1x256xbf16>>  
    aie.objectfifo @of_1_distribute_0_1(%mem_tile_6_1, {%tile_0_3}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<1x256xbf16>>  
    aie.objectfifo @of_1_distribute_0_2(%mem_tile_6_1, {%tile_0_4}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<1x256xbf16>>  
    aie.objectfifo @of_1_distribute_0_3(%mem_tile_6_1, {%tile_0_5}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<1x256xbf16>>  
    aie.objectfifo.link [@of_0_mem] -> [@of_1_distribute_0_0, @of_1_distribute_0_1, @of_1_distribute_0_2, @of_1_distribute_0_3]([] [0, 256, 512, 768])
    aie.objectfifo @of_2_join_0_0(%tile_0_2, {%mem_tile_7_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<1x256xbf16>>  
    aie.objectfifo @of_2_join_0_1(%tile_0_3, {%mem_tile_7_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<1x256xbf16>>  
    aie.objectfifo @of_2_join_0_2(%tile_0_4, {%mem_tile_7_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<1x256xbf16>>  
    aie.objectfifo @of_2_join_0_3(%tile_0_5, {%mem_tile_7_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<1x256xbf16>>  
    aie.objectfifo @of_3_mem(%mem_tile_7_1, {%shim_noc_tile_7_0}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<4x1x256xbf16>>  
    aie.objectfifo.link [@of_2_join_0_0, @of_2_join_0_1, @of_2_join_0_2, @of_2_join_0_3] -> [@of_3_mem]([0, 256, 512, 768] [])
    func.func private @op1_softmax_rows_causal_bf16(memref<1x256xbf16>, memref<1x256xbf16>, i32, i32, i32)
  }
}
