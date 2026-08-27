module {
  aie.device(npu2) {
    %shim_noc_tile_1_0 = aie.tile(1, 0)
    %shim_noc_tile_4_0 = aie.tile(4, 0)
    %shim_noc_tile_7_0 = aie.tile(7, 0)
    %mem_tile_4_1 = aie.tile(4, 1)
    %mem_tile_7_1 = aie.tile(7, 1)
    %tile_0_2 = aie.tile(0, 2)
    %tile_0_3 = aie.tile(0, 3)
    %tile_0_4 = aie.tile(0, 4)
    %tile_0_5 = aie.tile(0, 5)
    %mem_tile_1_1 = aie.tile(1, 1)
    aie.runtime_sequence(%arg0: memref<256x256xbf16>, %arg1: memref<256x64xbf16>, %arg2: memref<256x64xbf16>) {
      %0 = aiex.dma_configure_task_for @of_0_mem {
        aie.dma_bd(%arg0 : memref<256x256xbf16> offset = 0 len = 65536 sizes = [1, 4, 256, 64] strides = [0, 64, 256, 1])
        aie.end
      } {iteration_t = 0 : index}
      aiex.dma_start_task(%0)
      %1 = aiex.dma_configure_task_for @of_1_mem {
        aie.dma_bd(%arg1 : memref<256x64xbf16> offset = 0 len = 16384 sizes = [1, 1, 128, 128] strides = [0, 0, 128, 1])
        aie.end
      } {iteration_t = 0 : index}
      aiex.dma_start_task(%1)
      %2 = aiex.dma_configure_task_for @of_5_mem {
        aie.dma_bd(%arg2 : memref<256x64xbf16> offset = 0 len = 16384 sizes = [1, 1, 128, 128] strides = [0, 0, 128, 1])
        aie.end
      } {issue_token = true, iteration_t = 0 : index}
      aiex.dma_start_task(%2)
      aiex.dma_await_task(%2)
    }
    %core_0_2 = aie.core(%tile_0_2) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %0 = aie.objectfifo.acquire @of_4_join_0_0(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
        %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
        func.call @op2_zero_bf16_64_64_64(%1) : (memref<64x64xbf16>) -> ()
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c4 = arith.constant 4 : index
        scf.for %arg1 = %c0_0 to %c4 step %c1_1 {
          %2 = aie.objectfifo.acquire @of_3_broadcast_0_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
          %3 = aie.objectfifo.subview.access %2[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
          %4 = aie.objectfifo.acquire @of_2_distribute_0_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
          %5 = aie.objectfifo.subview.access %4[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
          %c1_2 = arith.constant 1 : index
          %c0_3 = arith.constant 0 : index
          %6 = scf.index_switch %c0_3 -> memref<64x64xbf16> 
          case 0 {
            scf.yield %5 : memref<64x64xbf16>
          }
          default {
            scf.yield %5 : memref<64x64xbf16>
          }
          %c1_4 = arith.constant 1 : index
          %c0_5 = arith.constant 0 : index
          %7 = scf.index_switch %c0_5 -> memref<64x64xbf16> 
          case 0 {
            scf.yield %3 : memref<64x64xbf16>
          }
          default {
            scf.yield %3 : memref<64x64xbf16>
          }
          %c1_6 = arith.constant 1 : index
          %c0_7 = arith.constant 0 : index
          %8 = scf.index_switch %c0_7 -> memref<64x64xbf16> 
          case 0 {
            scf.yield %1 : memref<64x64xbf16>
          }
          default {
            scf.yield %1 : memref<64x64xbf16>
          }
          func.call @op2_matmul_bf16_bf16_64_64_64(%6, %7, %8) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>) -> ()
          aie.objectfifo.release @of_2_distribute_0_0(Consume, 1)
          aie.objectfifo.release @of_3_broadcast_0_0(Consume, 1)
        }
        aie.objectfifo.release @of_4_join_0_0(Produce, 1)
      }
      aie.end
    } {link_with = "op2_mm_64_64_64.o"}
    %core_0_3 = aie.core(%tile_0_3) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %0 = aie.objectfifo.acquire @of_4_join_0_1(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
        %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
        func.call @op2_zero_bf16_64_64_64(%1) : (memref<64x64xbf16>) -> ()
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c4 = arith.constant 4 : index
        scf.for %arg1 = %c0_0 to %c4 step %c1_1 {
          %2 = aie.objectfifo.acquire @of_3_broadcast_0_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
          %3 = aie.objectfifo.subview.access %2[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
          %4 = aie.objectfifo.acquire @of_2_distribute_0_1(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
          %5 = aie.objectfifo.subview.access %4[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
          %c1_2 = arith.constant 1 : index
          %c0_3 = arith.constant 0 : index
          %6 = scf.index_switch %c0_3 -> memref<64x64xbf16> 
          case 0 {
            scf.yield %5 : memref<64x64xbf16>
          }
          default {
            scf.yield %5 : memref<64x64xbf16>
          }
          %c1_4 = arith.constant 1 : index
          %c0_5 = arith.constant 0 : index
          %7 = scf.index_switch %c0_5 -> memref<64x64xbf16> 
          case 0 {
            scf.yield %3 : memref<64x64xbf16>
          }
          default {
            scf.yield %3 : memref<64x64xbf16>
          }
          %c1_6 = arith.constant 1 : index
          %c0_7 = arith.constant 0 : index
          %8 = scf.index_switch %c0_7 -> memref<64x64xbf16> 
          case 0 {
            scf.yield %1 : memref<64x64xbf16>
          }
          default {
            scf.yield %1 : memref<64x64xbf16>
          }
          func.call @op2_matmul_bf16_bf16_64_64_64(%6, %7, %8) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>) -> ()
          aie.objectfifo.release @of_2_distribute_0_1(Consume, 1)
          aie.objectfifo.release @of_3_broadcast_0_0(Consume, 1)
        }
        aie.objectfifo.release @of_4_join_0_1(Produce, 1)
      }
      aie.end
    } {link_with = "op2_mm_64_64_64.o"}
    %core_0_4 = aie.core(%tile_0_4) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %0 = aie.objectfifo.acquire @of_4_join_0_2(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
        %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
        func.call @op2_zero_bf16_64_64_64(%1) : (memref<64x64xbf16>) -> ()
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c4 = arith.constant 4 : index
        scf.for %arg1 = %c0_0 to %c4 step %c1_1 {
          %2 = aie.objectfifo.acquire @of_3_broadcast_0_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
          %3 = aie.objectfifo.subview.access %2[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
          %4 = aie.objectfifo.acquire @of_2_distribute_0_2(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
          %5 = aie.objectfifo.subview.access %4[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
          %c1_2 = arith.constant 1 : index
          %c0_3 = arith.constant 0 : index
          %6 = scf.index_switch %c0_3 -> memref<64x64xbf16> 
          case 0 {
            scf.yield %5 : memref<64x64xbf16>
          }
          default {
            scf.yield %5 : memref<64x64xbf16>
          }
          %c1_4 = arith.constant 1 : index
          %c0_5 = arith.constant 0 : index
          %7 = scf.index_switch %c0_5 -> memref<64x64xbf16> 
          case 0 {
            scf.yield %3 : memref<64x64xbf16>
          }
          default {
            scf.yield %3 : memref<64x64xbf16>
          }
          %c1_6 = arith.constant 1 : index
          %c0_7 = arith.constant 0 : index
          %8 = scf.index_switch %c0_7 -> memref<64x64xbf16> 
          case 0 {
            scf.yield %1 : memref<64x64xbf16>
          }
          default {
            scf.yield %1 : memref<64x64xbf16>
          }
          func.call @op2_matmul_bf16_bf16_64_64_64(%6, %7, %8) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>) -> ()
          aie.objectfifo.release @of_2_distribute_0_2(Consume, 1)
          aie.objectfifo.release @of_3_broadcast_0_0(Consume, 1)
        }
        aie.objectfifo.release @of_4_join_0_2(Produce, 1)
      }
      aie.end
    } {link_with = "op2_mm_64_64_64.o"}
    %core_0_5 = aie.core(%tile_0_5) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %0 = aie.objectfifo.acquire @of_4_join_0_3(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
        %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
        func.call @op2_zero_bf16_64_64_64(%1) : (memref<64x64xbf16>) -> ()
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c4 = arith.constant 4 : index
        scf.for %arg1 = %c0_0 to %c4 step %c1_1 {
          %2 = aie.objectfifo.acquire @of_3_broadcast_0_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
          %3 = aie.objectfifo.subview.access %2[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
          %4 = aie.objectfifo.acquire @of_2_distribute_0_3(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
          %5 = aie.objectfifo.subview.access %4[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
          %c1_2 = arith.constant 1 : index
          %c0_3 = arith.constant 0 : index
          %6 = scf.index_switch %c0_3 -> memref<64x64xbf16> 
          case 0 {
            scf.yield %5 : memref<64x64xbf16>
          }
          default {
            scf.yield %5 : memref<64x64xbf16>
          }
          %c1_4 = arith.constant 1 : index
          %c0_5 = arith.constant 0 : index
          %7 = scf.index_switch %c0_5 -> memref<64x64xbf16> 
          case 0 {
            scf.yield %3 : memref<64x64xbf16>
          }
          default {
            scf.yield %3 : memref<64x64xbf16>
          }
          %c1_6 = arith.constant 1 : index
          %c0_7 = arith.constant 0 : index
          %8 = scf.index_switch %c0_7 -> memref<64x64xbf16> 
          case 0 {
            scf.yield %1 : memref<64x64xbf16>
          }
          default {
            scf.yield %1 : memref<64x64xbf16>
          }
          func.call @op2_matmul_bf16_bf16_64_64_64(%6, %7, %8) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>) -> ()
          aie.objectfifo.release @of_2_distribute_0_3(Consume, 1)
          aie.objectfifo.release @of_3_broadcast_0_0(Consume, 1)
        }
        aie.objectfifo.release @of_4_join_0_3(Produce, 1)
      }
      aie.end
    } {link_with = "op2_mm_64_64_64.o"}
    aie.objectfifo @of_0_mem(%shim_noc_tile_4_0, {%mem_tile_4_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<4x64x64xbf16>>  
    aie.objectfifo @of_1_mem(%shim_noc_tile_7_0, {%mem_tile_7_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_2_distribute_0_0(%mem_tile_4_1 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%tile_0_2}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_2_distribute_0_1(%mem_tile_4_1 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%tile_0_3}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_2_distribute_0_2(%mem_tile_4_1 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%tile_0_4}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_2_distribute_0_3(%mem_tile_4_1 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%tile_0_5}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo.link [@of_0_mem] -> [@of_2_distribute_0_0, @of_2_distribute_0_1, @of_2_distribute_0_2, @of_2_distribute_0_3]([] [0, 4096, 8192, 12288])
    aie.objectfifo @of_3_broadcast_0_0(%mem_tile_7_1 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%tile_0_2, %tile_0_3, %tile_0_4, %tile_0_5}, [2 : i32, 2 : i32, 2 : i32, 2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo.link [@of_1_mem] -> [@of_3_broadcast_0_0]([] [0])
    aie.objectfifo @of_4_join_0_0(%tile_0_2, {%mem_tile_1_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_4_join_0_1(%tile_0_3, {%mem_tile_1_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_4_join_0_2(%tile_0_4, {%mem_tile_1_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_4_join_0_3(%tile_0_5, {%mem_tile_1_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_5_mem(%mem_tile_1_1 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%shim_noc_tile_1_0}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<4x64x64xbf16>>  
    aie.objectfifo.link [@of_4_join_0_0, @of_4_join_0_1, @of_4_join_0_2, @of_4_join_0_3] -> [@of_5_mem]([0, 4096, 8192, 12288] [])
    func.func private @op2_zero_bf16_64_64_64(memref<64x64xbf16>)
    func.func private @op2_matmul_bf16_bf16_64_64_64(memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>)
  }
}
