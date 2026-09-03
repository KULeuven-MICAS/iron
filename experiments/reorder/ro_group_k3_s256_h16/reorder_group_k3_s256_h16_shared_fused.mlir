module {
  aie.device(npu2) @op0__MHAStreamGroup {
    %shim_noc_tile_0_0 = aie.tile(0, 0)
    %shim_noc_tile_2_0 = aie.tile(2, 0)
    %shim_noc_tile_6_0 = aie.tile(6, 0)
    %mem_tile_0_1 = aie.tile(0, 1)
    %mem_tile_2_1 = aie.tile(2, 1)
    %tile_0_2 = aie.tile(0, 2)
    %tile_0_3 = aie.tile(0, 3)
    %tile_0_4 = aie.tile(0, 4)
    %tile_0_5 = aie.tile(0, 5)
    %mem_tile_6_1 = aie.tile(6, 1)
    aie.runtime_sequence(%arg0: memref<256x64xbf16>, %arg1: memref<64x256xbf16>, %arg2: memref<256x256xbf16>) {
      %0 = aiex.dma_configure_task_for @of_0_mem {
        aie.dma_bd(%arg0 : memref<256x64xbf16> offset = 0 len = 16384 sizes = [1, 1, 128, 128] strides = [0, 0, 128, 1])
        aie.end
      } {issue_token = true, iteration_t = 0 : index}
      aiex.dma_start_task(%0)
      %1 = aiex.dma_configure_task_for @of_1_mem {
        aie.dma_bd(%arg1 : memref<64x256xbf16> offset = 0 len = 16384 sizes = [1, 4, 64, 64] strides = [0, 64, 256, 1])
        aie.end
      } {issue_token = true, iteration_t = 0 : index}
      aiex.dma_start_task(%1)
      %2 = aiex.dma_configure_task_for @of_5_mem {
        aie.dma_bd(%arg2 : memref<256x256xbf16> offset = 0 len = 65536 sizes = [1, 4, 256, 64] strides = [0, 64, 256, 1])
        aie.end
      } {issue_token = true, iteration_t = 0 : index}
      aiex.dma_start_task(%2)
      aiex.dma_await_task(%0)
      aiex.dma_await_task(%1)
      aiex.dma_await_task(%2)
    }
    %core_0_2 = aie.core(%tile_0_2) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %0 = aie.objectfifo.acquire @of_2_distribute_0_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
        %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c4 = arith.constant 4 : index
        scf.for %arg1 = %c0_0 to %c4 step %c1_1 {
          %2 = aie.objectfifo.acquire @of_4_join_0_0(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
          %3 = aie.objectfifo.subview.access %2[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
          func.call @op0_zero_bf16_64_64_64(%3) : (memref<64x64xbf16>) -> ()
          %4 = aie.objectfifo.acquire @of_3_broadcast_0_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
          %5 = aie.objectfifo.subview.access %4[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
          func.call @op0_matmul_bf16_bf16_64_64_64(%1, %5, %3) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>) -> ()
          aie.objectfifo.release @of_3_broadcast_0_0(Consume, 1)
          aie.objectfifo.release @of_4_join_0_0(Produce, 1)
        }
        aie.objectfifo.release @of_2_distribute_0_0(Consume, 1)
      }
      aie.end
    } {link_with = "op0_mm_64_64_64.o"}
    %core_0_3 = aie.core(%tile_0_3) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %0 = aie.objectfifo.acquire @of_2_distribute_0_1(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
        %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c4 = arith.constant 4 : index
        scf.for %arg1 = %c0_0 to %c4 step %c1_1 {
          %2 = aie.objectfifo.acquire @of_4_join_0_1(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
          %3 = aie.objectfifo.subview.access %2[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
          func.call @op0_zero_bf16_64_64_64(%3) : (memref<64x64xbf16>) -> ()
          %4 = aie.objectfifo.acquire @of_3_broadcast_0_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
          %5 = aie.objectfifo.subview.access %4[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
          func.call @op0_matmul_bf16_bf16_64_64_64(%1, %5, %3) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>) -> ()
          aie.objectfifo.release @of_3_broadcast_0_0(Consume, 1)
          aie.objectfifo.release @of_4_join_0_1(Produce, 1)
        }
        aie.objectfifo.release @of_2_distribute_0_1(Consume, 1)
      }
      aie.end
    } {link_with = "op0_mm_64_64_64.o"}
    %core_0_4 = aie.core(%tile_0_4) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %0 = aie.objectfifo.acquire @of_2_distribute_0_2(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
        %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c4 = arith.constant 4 : index
        scf.for %arg1 = %c0_0 to %c4 step %c1_1 {
          %2 = aie.objectfifo.acquire @of_4_join_0_2(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
          %3 = aie.objectfifo.subview.access %2[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
          func.call @op0_zero_bf16_64_64_64(%3) : (memref<64x64xbf16>) -> ()
          %4 = aie.objectfifo.acquire @of_3_broadcast_0_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
          %5 = aie.objectfifo.subview.access %4[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
          func.call @op0_matmul_bf16_bf16_64_64_64(%1, %5, %3) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>) -> ()
          aie.objectfifo.release @of_3_broadcast_0_0(Consume, 1)
          aie.objectfifo.release @of_4_join_0_2(Produce, 1)
        }
        aie.objectfifo.release @of_2_distribute_0_2(Consume, 1)
      }
      aie.end
    } {link_with = "op0_mm_64_64_64.o"}
    %core_0_5 = aie.core(%tile_0_5) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %0 = aie.objectfifo.acquire @of_2_distribute_0_3(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
        %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c4 = arith.constant 4 : index
        scf.for %arg1 = %c0_0 to %c4 step %c1_1 {
          %2 = aie.objectfifo.acquire @of_4_join_0_3(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
          %3 = aie.objectfifo.subview.access %2[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
          func.call @op0_zero_bf16_64_64_64(%3) : (memref<64x64xbf16>) -> ()
          %4 = aie.objectfifo.acquire @of_3_broadcast_0_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
          %5 = aie.objectfifo.subview.access %4[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
          func.call @op0_matmul_bf16_bf16_64_64_64(%1, %5, %3) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>) -> ()
          aie.objectfifo.release @of_3_broadcast_0_0(Consume, 1)
          aie.objectfifo.release @of_4_join_0_3(Produce, 1)
        }
        aie.objectfifo.release @of_2_distribute_0_3(Consume, 1)
      }
      aie.end
    } {link_with = "op0_mm_64_64_64.o"}
    aie.objectfifo @of_0_mem(%shim_noc_tile_0_0, {%mem_tile_0_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<4x64x64xbf16>>  
    aie.objectfifo @of_1_mem(%shim_noc_tile_2_0, {%mem_tile_2_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_2_distribute_0_0(%mem_tile_0_1 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%tile_0_2}, [2 : i32, 1 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_2_distribute_0_1(%mem_tile_0_1 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%tile_0_3}, [2 : i32, 1 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_2_distribute_0_2(%mem_tile_0_1 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%tile_0_4}, [2 : i32, 1 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_2_distribute_0_3(%mem_tile_0_1 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%tile_0_5}, [2 : i32, 1 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo.link [@of_0_mem] -> [@of_2_distribute_0_0, @of_2_distribute_0_1, @of_2_distribute_0_2, @of_2_distribute_0_3]([] [0, 4096, 8192, 12288])
    aie.objectfifo @of_3_broadcast_0_0(%mem_tile_2_1 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%tile_0_2, %tile_0_3, %tile_0_4, %tile_0_5}, [2 : i32, 2 : i32, 2 : i32, 2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo.link [@of_1_mem] -> [@of_3_broadcast_0_0]([] [])
    aie.objectfifo @of_4_join_0_0(%tile_0_2, {%mem_tile_6_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_4_join_0_1(%tile_0_3, {%mem_tile_6_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_4_join_0_2(%tile_0_4, {%mem_tile_6_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_4_join_0_3(%tile_0_5, {%mem_tile_6_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_5_mem(%mem_tile_6_1 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%shim_noc_tile_6_0}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<4x64x64xbf16>>  
    aie.objectfifo.link [@of_4_join_0_0, @of_4_join_0_1, @of_4_join_0_2, @of_4_join_0_3] -> [@of_5_mem]([0, 4096, 8192, 12288] [])
    func.func private @op0_zero_bf16_64_64_64(memref<64x64xbf16>)
    func.func private @op0_matmul_bf16_bf16_64_64_64(memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>)
  }
  aie.device(npu2) @op1__MHAStreamGroup {
    %shim_noc_tile_0_0 = aie.tile(0, 0)
    %shim_noc_tile_1_0 = aie.tile(1, 0)
    %mem_tile_1_1 = aie.tile(1, 1)
    %tile_0_2 = aie.tile(0, 2)
    %tile_0_3 = aie.tile(0, 3)
    %tile_0_4 = aie.tile(0, 4)
    %tile_0_5 = aie.tile(0, 5)
    %mem_tile_0_1 = aie.tile(0, 1)
    aie.runtime_sequence(%arg0: memref<256x256xbf16>, %arg1: memref<256x256xbf16>) {
      %0 = aiex.dma_configure_task_for @of_0_mem {
        aie.dma_bd(%arg0 : memref<256x256xbf16> offset = 0 len = 65536 sizes = [1, 1, 256, 256] strides = [0, 0, 256, 1])
        aie.end
      } {issue_token = true, iteration_t = 0 : index}
      aiex.dma_start_task(%0)
      %1 = aiex.dma_configure_task_for @of_3_mem {
        aie.dma_bd(%arg1 : memref<256x256xbf16> offset = 0 len = 65536 sizes = [1, 1, 256, 256] strides = [0, 0, 256, 1])
        aie.end
      } {issue_token = true, iteration_t = 0 : index}
      aiex.dma_start_task(%1)
      aiex.dma_await_task(%0)
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
          %c1_i32 = arith.constant 1 : i32
          %c256_i32 = arith.constant 256 : i32
          %4 = arith.index_cast %arg1 : index to i32
          %c4_i32 = arith.constant 4 : i32
          %5 = arith.muli %4, %c4_i32 : i32
          %c0_i32 = arith.constant 0 : i32
          %6 = arith.addi %c0_i32, %5 : i32
          func.call @op1_softmax_rows_causal_bf16(%3, %1, %c1_i32, %c256_i32, %6) : (memref<1x256xbf16>, memref<1x256xbf16>, i32, i32, i32) -> ()
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
          %c1_i32 = arith.constant 1 : i32
          %c256_i32 = arith.constant 256 : i32
          %4 = arith.index_cast %arg1 : index to i32
          %c4_i32 = arith.constant 4 : i32
          %5 = arith.muli %4, %c4_i32 : i32
          %c1_i32_2 = arith.constant 1 : i32
          %6 = arith.addi %c1_i32_2, %5 : i32
          func.call @op1_softmax_rows_causal_bf16(%3, %1, %c1_i32, %c256_i32, %6) : (memref<1x256xbf16>, memref<1x256xbf16>, i32, i32, i32) -> ()
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
          %c1_i32 = arith.constant 1 : i32
          %c256_i32 = arith.constant 256 : i32
          %4 = arith.index_cast %arg1 : index to i32
          %c4_i32 = arith.constant 4 : i32
          %5 = arith.muli %4, %c4_i32 : i32
          %c2_i32 = arith.constant 2 : i32
          %6 = arith.addi %c2_i32, %5 : i32
          func.call @op1_softmax_rows_causal_bf16(%3, %1, %c1_i32, %c256_i32, %6) : (memref<1x256xbf16>, memref<1x256xbf16>, i32, i32, i32) -> ()
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
          %c1_i32 = arith.constant 1 : i32
          %c256_i32 = arith.constant 256 : i32
          %4 = arith.index_cast %arg1 : index to i32
          %c4_i32 = arith.constant 4 : i32
          %5 = arith.muli %4, %c4_i32 : i32
          %c3_i32 = arith.constant 3 : i32
          %6 = arith.addi %c3_i32, %5 : i32
          func.call @op1_softmax_rows_causal_bf16(%3, %1, %c1_i32, %c256_i32, %6) : (memref<1x256xbf16>, memref<1x256xbf16>, i32, i32, i32) -> ()
          aie.objectfifo.release @of_1_distribute_0_3(Consume, 1)
          aie.objectfifo.release @of_2_join_0_3(Produce, 1)
        }
      }
      aie.end
    } {link_with = "op1_softmax.o"}
    aie.objectfifo @of_0_mem(%shim_noc_tile_1_0, {%mem_tile_1_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<4x1x256xbf16>>  
    aie.objectfifo @of_1_distribute_0_0(%mem_tile_1_1, {%tile_0_2}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<1x256xbf16>>  
    aie.objectfifo @of_1_distribute_0_1(%mem_tile_1_1, {%tile_0_3}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<1x256xbf16>>  
    aie.objectfifo @of_1_distribute_0_2(%mem_tile_1_1, {%tile_0_4}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<1x256xbf16>>  
    aie.objectfifo @of_1_distribute_0_3(%mem_tile_1_1, {%tile_0_5}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<1x256xbf16>>  
    aie.objectfifo.link [@of_0_mem] -> [@of_1_distribute_0_0, @of_1_distribute_0_1, @of_1_distribute_0_2, @of_1_distribute_0_3]([] [0, 256, 512, 768])
    aie.objectfifo @of_2_join_0_0(%tile_0_2, {%mem_tile_0_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<1x256xbf16>>  
    aie.objectfifo @of_2_join_0_1(%tile_0_3, {%mem_tile_0_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<1x256xbf16>>  
    aie.objectfifo @of_2_join_0_2(%tile_0_4, {%mem_tile_0_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<1x256xbf16>>  
    aie.objectfifo @of_2_join_0_3(%tile_0_5, {%mem_tile_0_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<1x256xbf16>>  
    aie.objectfifo @of_3_mem(%mem_tile_0_1, {%shim_noc_tile_0_0}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<4x1x256xbf16>>  
    aie.objectfifo.link [@of_2_join_0_0, @of_2_join_0_1, @of_2_join_0_2, @of_2_join_0_3] -> [@of_3_mem]([0, 256, 512, 768] [])
    func.func private @op1_softmax_rows_causal_bf16(memref<1x256xbf16>, memref<1x256xbf16>, i32, i32, i32)
  }
  aie.device(npu2) @op2__MHAStreamGroup {
    %shim_noc_tile_0_0 = aie.tile(0, 0)
    %shim_noc_tile_1_0 = aie.tile(1, 0)
    %shim_noc_tile_6_0 = aie.tile(6, 0)
    %mem_tile_6_1 = aie.tile(6, 1)
    %mem_tile_0_1 = aie.tile(0, 1)
    %tile_0_2 = aie.tile(0, 2)
    %tile_0_3 = aie.tile(0, 3)
    %tile_0_4 = aie.tile(0, 4)
    %tile_0_5 = aie.tile(0, 5)
    %mem_tile_1_1 = aie.tile(1, 1)
    aie.runtime_sequence(%arg0: memref<256x256xbf16>, %arg1: memref<256x64xbf16>, %arg2: memref<256x64xbf16>) {
      %0 = aiex.dma_configure_task_for @of_0_mem {
        aie.dma_bd(%arg0 : memref<256x256xbf16> offset = 0 len = 65536 sizes = [1, 4, 256, 64] strides = [0, 64, 256, 1])
        aie.end
      } {issue_token = true, iteration_t = 0 : index}
      aiex.dma_start_task(%0)
      %1 = aiex.dma_configure_task_for @of_1_mem {
        aie.dma_bd(%arg1 : memref<256x64xbf16> offset = 0 len = 16384 sizes = [1, 1, 128, 128] strides = [0, 0, 128, 1])
        aie.end
      } {issue_token = true, iteration_t = 0 : index}
      aiex.dma_start_task(%1)
      %2 = aiex.dma_configure_task_for @of_5_mem {
        aie.dma_bd(%arg2 : memref<256x64xbf16> offset = 0 len = 16384 sizes = [1, 1, 128, 128] strides = [0, 0, 128, 1])
        aie.end
      } {issue_token = true, iteration_t = 0 : index}
      aiex.dma_start_task(%2)
      aiex.dma_await_task(%0)
      aiex.dma_await_task(%1)
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
          func.call @op2_matmul_bf16_bf16_64_64_64(%5, %3, %1) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>) -> ()
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
          func.call @op2_matmul_bf16_bf16_64_64_64(%5, %3, %1) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>) -> ()
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
          func.call @op2_matmul_bf16_bf16_64_64_64(%5, %3, %1) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>) -> ()
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
          func.call @op2_matmul_bf16_bf16_64_64_64(%5, %3, %1) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>) -> ()
          aie.objectfifo.release @of_2_distribute_0_3(Consume, 1)
          aie.objectfifo.release @of_3_broadcast_0_0(Consume, 1)
        }
        aie.objectfifo.release @of_4_join_0_3(Produce, 1)
      }
      aie.end
    } {link_with = "op2_mm_64_64_64.o"}
    aie.objectfifo @of_0_mem(%shim_noc_tile_6_0, {%mem_tile_6_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<4x64x64xbf16>>  
    aie.objectfifo @of_1_mem(%shim_noc_tile_0_0, {%mem_tile_0_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_2_distribute_0_0(%mem_tile_6_1 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%tile_0_2}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_2_distribute_0_1(%mem_tile_6_1 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%tile_0_3}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_2_distribute_0_2(%mem_tile_6_1 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%tile_0_4}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_2_distribute_0_3(%mem_tile_6_1 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%tile_0_5}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo.link [@of_0_mem] -> [@of_2_distribute_0_0, @of_2_distribute_0_1, @of_2_distribute_0_2, @of_2_distribute_0_3]([] [0, 4096, 8192, 12288])
    aie.objectfifo @of_3_broadcast_0_0(%mem_tile_0_1 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%tile_0_2, %tile_0_3, %tile_0_4, %tile_0_5}, [2 : i32, 2 : i32, 2 : i32, 2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo.link [@of_1_mem] -> [@of_3_broadcast_0_0]([] [])
    aie.objectfifo @of_4_join_0_0(%tile_0_2, {%mem_tile_1_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_4_join_0_1(%tile_0_3, {%mem_tile_1_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_4_join_0_2(%tile_0_4, {%mem_tile_1_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_4_join_0_3(%tile_0_5, {%mem_tile_1_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_5_mem(%mem_tile_1_1 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%shim_noc_tile_1_0}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<4x64x64xbf16>>  
    aie.objectfifo.link [@of_4_join_0_0, @of_4_join_0_1, @of_4_join_0_2, @of_4_join_0_3] -> [@of_5_mem]([0, 4096, 8192, 12288] [])
    func.func private @op2_zero_bf16_64_64_64(memref<64x64xbf16>)
    func.func private @op2_matmul_bf16_bf16_64_64_64(memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>)
  }
  aie.device(npu2) @reset_device {
    aie.runtime_sequence() {
    }
  }
  aie.device(npu2) {
    aie.runtime_sequence(%arg0: memref<786432xbf16>, %arg1: memref<262144xbf16>, %arg2: memref<2097152xbf16>) {
      aiex.configure @op0__MHAStreamGroup {
        %subview = memref.subview %arg0[0] [16384] [1] : memref<786432xbf16> to memref<16384xbf16>
        %reinterpret_cast = memref.reinterpret_cast %subview to offset: [0], sizes: [256, 64], strides: [64, 1] : memref<16384xbf16> to memref<256x64xbf16>
        %subview_0 = memref.subview %arg0[262144] [16384] [1] : memref<786432xbf16> to memref<16384xbf16, strided<[1], offset: 262144>>
        %reinterpret_cast_1 = memref.reinterpret_cast %subview_0 to offset: [0], sizes: [64, 256], strides: [256, 1] : memref<16384xbf16, strided<[1], offset: 262144>> to memref<64x256xbf16>
        %subview_2 = memref.subview %arg2[0] [65536] [1] : memref<2097152xbf16> to memref<65536xbf16>
        %reinterpret_cast_3 = memref.reinterpret_cast %subview_2 to offset: [0], sizes: [256, 256], strides: [256, 1] : memref<65536xbf16> to memref<256x256xbf16>
        aiex.run @sequence(%reinterpret_cast, %reinterpret_cast_1, %reinterpret_cast_3) : (memref<256x64xbf16>, memref<64x256xbf16>, memref<256x256xbf16>)
        %subview_4 = memref.subview %arg0[16384] [16384] [1] : memref<786432xbf16> to memref<16384xbf16, strided<[1], offset: 16384>>
        %reinterpret_cast_5 = memref.reinterpret_cast %subview_4 to offset: [0], sizes: [256, 64], strides: [64, 1] : memref<16384xbf16, strided<[1], offset: 16384>> to memref<256x64xbf16>
        %subview_6 = memref.subview %arg0[278528] [16384] [1] : memref<786432xbf16> to memref<16384xbf16, strided<[1], offset: 278528>>
        %reinterpret_cast_7 = memref.reinterpret_cast %subview_6 to offset: [0], sizes: [64, 256], strides: [256, 1] : memref<16384xbf16, strided<[1], offset: 278528>> to memref<64x256xbf16>
        %subview_8 = memref.subview %arg2[65536] [65536] [1] : memref<2097152xbf16> to memref<65536xbf16, strided<[1], offset: 65536>>
        %reinterpret_cast_9 = memref.reinterpret_cast %subview_8 to offset: [0], sizes: [256, 256], strides: [256, 1] : memref<65536xbf16, strided<[1], offset: 65536>> to memref<256x256xbf16>
        aiex.run @sequence(%reinterpret_cast_5, %reinterpret_cast_7, %reinterpret_cast_9) : (memref<256x64xbf16>, memref<64x256xbf16>, memref<256x256xbf16>)
        %subview_10 = memref.subview %arg0[32768] [16384] [1] : memref<786432xbf16> to memref<16384xbf16, strided<[1], offset: 32768>>
        %reinterpret_cast_11 = memref.reinterpret_cast %subview_10 to offset: [0], sizes: [256, 64], strides: [64, 1] : memref<16384xbf16, strided<[1], offset: 32768>> to memref<256x64xbf16>
        %subview_12 = memref.subview %arg0[294912] [16384] [1] : memref<786432xbf16> to memref<16384xbf16, strided<[1], offset: 294912>>
        %reinterpret_cast_13 = memref.reinterpret_cast %subview_12 to offset: [0], sizes: [64, 256], strides: [256, 1] : memref<16384xbf16, strided<[1], offset: 294912>> to memref<64x256xbf16>
        %subview_14 = memref.subview %arg2[131072] [65536] [1] : memref<2097152xbf16> to memref<65536xbf16, strided<[1], offset: 131072>>
        %reinterpret_cast_15 = memref.reinterpret_cast %subview_14 to offset: [0], sizes: [256, 256], strides: [256, 1] : memref<65536xbf16, strided<[1], offset: 131072>> to memref<256x256xbf16>
        aiex.run @sequence(%reinterpret_cast_11, %reinterpret_cast_13, %reinterpret_cast_15) : (memref<256x64xbf16>, memref<64x256xbf16>, memref<256x256xbf16>)
        %subview_16 = memref.subview %arg0[49152] [16384] [1] : memref<786432xbf16> to memref<16384xbf16, strided<[1], offset: 49152>>
        %reinterpret_cast_17 = memref.reinterpret_cast %subview_16 to offset: [0], sizes: [256, 64], strides: [64, 1] : memref<16384xbf16, strided<[1], offset: 49152>> to memref<256x64xbf16>
        %subview_18 = memref.subview %arg0[311296] [16384] [1] : memref<786432xbf16> to memref<16384xbf16, strided<[1], offset: 311296>>
        %reinterpret_cast_19 = memref.reinterpret_cast %subview_18 to offset: [0], sizes: [64, 256], strides: [256, 1] : memref<16384xbf16, strided<[1], offset: 311296>> to memref<64x256xbf16>
        %subview_20 = memref.subview %arg2[196608] [65536] [1] : memref<2097152xbf16> to memref<65536xbf16, strided<[1], offset: 196608>>
        %reinterpret_cast_21 = memref.reinterpret_cast %subview_20 to offset: [0], sizes: [256, 256], strides: [256, 1] : memref<65536xbf16, strided<[1], offset: 196608>> to memref<256x256xbf16>
        aiex.run @sequence(%reinterpret_cast_17, %reinterpret_cast_19, %reinterpret_cast_21) : (memref<256x64xbf16>, memref<64x256xbf16>, memref<256x256xbf16>)
        %subview_22 = memref.subview %arg0[65536] [16384] [1] : memref<786432xbf16> to memref<16384xbf16, strided<[1], offset: 65536>>
        %reinterpret_cast_23 = memref.reinterpret_cast %subview_22 to offset: [0], sizes: [256, 64], strides: [64, 1] : memref<16384xbf16, strided<[1], offset: 65536>> to memref<256x64xbf16>
        %subview_24 = memref.subview %arg0[327680] [16384] [1] : memref<786432xbf16> to memref<16384xbf16, strided<[1], offset: 327680>>
        %reinterpret_cast_25 = memref.reinterpret_cast %subview_24 to offset: [0], sizes: [64, 256], strides: [256, 1] : memref<16384xbf16, strided<[1], offset: 327680>> to memref<64x256xbf16>
        %subview_26 = memref.subview %arg2[262144] [65536] [1] : memref<2097152xbf16> to memref<65536xbf16, strided<[1], offset: 262144>>
        %reinterpret_cast_27 = memref.reinterpret_cast %subview_26 to offset: [0], sizes: [256, 256], strides: [256, 1] : memref<65536xbf16, strided<[1], offset: 262144>> to memref<256x256xbf16>
        aiex.run @sequence(%reinterpret_cast_23, %reinterpret_cast_25, %reinterpret_cast_27) : (memref<256x64xbf16>, memref<64x256xbf16>, memref<256x256xbf16>)
        %subview_28 = memref.subview %arg0[81920] [16384] [1] : memref<786432xbf16> to memref<16384xbf16, strided<[1], offset: 81920>>
        %reinterpret_cast_29 = memref.reinterpret_cast %subview_28 to offset: [0], sizes: [256, 64], strides: [64, 1] : memref<16384xbf16, strided<[1], offset: 81920>> to memref<256x64xbf16>
        %subview_30 = memref.subview %arg0[344064] [16384] [1] : memref<786432xbf16> to memref<16384xbf16, strided<[1], offset: 344064>>
        %reinterpret_cast_31 = memref.reinterpret_cast %subview_30 to offset: [0], sizes: [64, 256], strides: [256, 1] : memref<16384xbf16, strided<[1], offset: 344064>> to memref<64x256xbf16>
        %subview_32 = memref.subview %arg2[327680] [65536] [1] : memref<2097152xbf16> to memref<65536xbf16, strided<[1], offset: 327680>>
        %reinterpret_cast_33 = memref.reinterpret_cast %subview_32 to offset: [0], sizes: [256, 256], strides: [256, 1] : memref<65536xbf16, strided<[1], offset: 327680>> to memref<256x256xbf16>
        aiex.run @sequence(%reinterpret_cast_29, %reinterpret_cast_31, %reinterpret_cast_33) : (memref<256x64xbf16>, memref<64x256xbf16>, memref<256x256xbf16>)
        %subview_34 = memref.subview %arg0[98304] [16384] [1] : memref<786432xbf16> to memref<16384xbf16, strided<[1], offset: 98304>>
        %reinterpret_cast_35 = memref.reinterpret_cast %subview_34 to offset: [0], sizes: [256, 64], strides: [64, 1] : memref<16384xbf16, strided<[1], offset: 98304>> to memref<256x64xbf16>
        %subview_36 = memref.subview %arg0[360448] [16384] [1] : memref<786432xbf16> to memref<16384xbf16, strided<[1], offset: 360448>>
        %reinterpret_cast_37 = memref.reinterpret_cast %subview_36 to offset: [0], sizes: [64, 256], strides: [256, 1] : memref<16384xbf16, strided<[1], offset: 360448>> to memref<64x256xbf16>
        %subview_38 = memref.subview %arg2[393216] [65536] [1] : memref<2097152xbf16> to memref<65536xbf16, strided<[1], offset: 393216>>
        %reinterpret_cast_39 = memref.reinterpret_cast %subview_38 to offset: [0], sizes: [256, 256], strides: [256, 1] : memref<65536xbf16, strided<[1], offset: 393216>> to memref<256x256xbf16>
        aiex.run @sequence(%reinterpret_cast_35, %reinterpret_cast_37, %reinterpret_cast_39) : (memref<256x64xbf16>, memref<64x256xbf16>, memref<256x256xbf16>)
        %subview_40 = memref.subview %arg0[114688] [16384] [1] : memref<786432xbf16> to memref<16384xbf16, strided<[1], offset: 114688>>
        %reinterpret_cast_41 = memref.reinterpret_cast %subview_40 to offset: [0], sizes: [256, 64], strides: [64, 1] : memref<16384xbf16, strided<[1], offset: 114688>> to memref<256x64xbf16>
        %subview_42 = memref.subview %arg0[376832] [16384] [1] : memref<786432xbf16> to memref<16384xbf16, strided<[1], offset: 376832>>
        %reinterpret_cast_43 = memref.reinterpret_cast %subview_42 to offset: [0], sizes: [64, 256], strides: [256, 1] : memref<16384xbf16, strided<[1], offset: 376832>> to memref<64x256xbf16>
        %subview_44 = memref.subview %arg2[458752] [65536] [1] : memref<2097152xbf16> to memref<65536xbf16, strided<[1], offset: 458752>>
        %reinterpret_cast_45 = memref.reinterpret_cast %subview_44 to offset: [0], sizes: [256, 256], strides: [256, 1] : memref<65536xbf16, strided<[1], offset: 458752>> to memref<256x256xbf16>
        aiex.run @sequence(%reinterpret_cast_41, %reinterpret_cast_43, %reinterpret_cast_45) : (memref<256x64xbf16>, memref<64x256xbf16>, memref<256x256xbf16>)
        %subview_46 = memref.subview %arg0[131072] [16384] [1] : memref<786432xbf16> to memref<16384xbf16, strided<[1], offset: 131072>>
        %reinterpret_cast_47 = memref.reinterpret_cast %subview_46 to offset: [0], sizes: [256, 64], strides: [64, 1] : memref<16384xbf16, strided<[1], offset: 131072>> to memref<256x64xbf16>
        %subview_48 = memref.subview %arg0[393216] [16384] [1] : memref<786432xbf16> to memref<16384xbf16, strided<[1], offset: 393216>>
        %reinterpret_cast_49 = memref.reinterpret_cast %subview_48 to offset: [0], sizes: [64, 256], strides: [256, 1] : memref<16384xbf16, strided<[1], offset: 393216>> to memref<64x256xbf16>
        %subview_50 = memref.subview %arg2[524288] [65536] [1] : memref<2097152xbf16> to memref<65536xbf16, strided<[1], offset: 524288>>
        %reinterpret_cast_51 = memref.reinterpret_cast %subview_50 to offset: [0], sizes: [256, 256], strides: [256, 1] : memref<65536xbf16, strided<[1], offset: 524288>> to memref<256x256xbf16>
        aiex.run @sequence(%reinterpret_cast_47, %reinterpret_cast_49, %reinterpret_cast_51) : (memref<256x64xbf16>, memref<64x256xbf16>, memref<256x256xbf16>)
        %subview_52 = memref.subview %arg0[147456] [16384] [1] : memref<786432xbf16> to memref<16384xbf16, strided<[1], offset: 147456>>
        %reinterpret_cast_53 = memref.reinterpret_cast %subview_52 to offset: [0], sizes: [256, 64], strides: [64, 1] : memref<16384xbf16, strided<[1], offset: 147456>> to memref<256x64xbf16>
        %subview_54 = memref.subview %arg0[409600] [16384] [1] : memref<786432xbf16> to memref<16384xbf16, strided<[1], offset: 409600>>
        %reinterpret_cast_55 = memref.reinterpret_cast %subview_54 to offset: [0], sizes: [64, 256], strides: [256, 1] : memref<16384xbf16, strided<[1], offset: 409600>> to memref<64x256xbf16>
        %subview_56 = memref.subview %arg2[589824] [65536] [1] : memref<2097152xbf16> to memref<65536xbf16, strided<[1], offset: 589824>>
        %reinterpret_cast_57 = memref.reinterpret_cast %subview_56 to offset: [0], sizes: [256, 256], strides: [256, 1] : memref<65536xbf16, strided<[1], offset: 589824>> to memref<256x256xbf16>
        aiex.run @sequence(%reinterpret_cast_53, %reinterpret_cast_55, %reinterpret_cast_57) : (memref<256x64xbf16>, memref<64x256xbf16>, memref<256x256xbf16>)
        %subview_58 = memref.subview %arg0[163840] [16384] [1] : memref<786432xbf16> to memref<16384xbf16, strided<[1], offset: 163840>>
        %reinterpret_cast_59 = memref.reinterpret_cast %subview_58 to offset: [0], sizes: [256, 64], strides: [64, 1] : memref<16384xbf16, strided<[1], offset: 163840>> to memref<256x64xbf16>
        %subview_60 = memref.subview %arg0[425984] [16384] [1] : memref<786432xbf16> to memref<16384xbf16, strided<[1], offset: 425984>>
        %reinterpret_cast_61 = memref.reinterpret_cast %subview_60 to offset: [0], sizes: [64, 256], strides: [256, 1] : memref<16384xbf16, strided<[1], offset: 425984>> to memref<64x256xbf16>
        %subview_62 = memref.subview %arg2[655360] [65536] [1] : memref<2097152xbf16> to memref<65536xbf16, strided<[1], offset: 655360>>
        %reinterpret_cast_63 = memref.reinterpret_cast %subview_62 to offset: [0], sizes: [256, 256], strides: [256, 1] : memref<65536xbf16, strided<[1], offset: 655360>> to memref<256x256xbf16>
        aiex.run @sequence(%reinterpret_cast_59, %reinterpret_cast_61, %reinterpret_cast_63) : (memref<256x64xbf16>, memref<64x256xbf16>, memref<256x256xbf16>)
        %subview_64 = memref.subview %arg0[180224] [16384] [1] : memref<786432xbf16> to memref<16384xbf16, strided<[1], offset: 180224>>
        %reinterpret_cast_65 = memref.reinterpret_cast %subview_64 to offset: [0], sizes: [256, 64], strides: [64, 1] : memref<16384xbf16, strided<[1], offset: 180224>> to memref<256x64xbf16>
        %subview_66 = memref.subview %arg0[442368] [16384] [1] : memref<786432xbf16> to memref<16384xbf16, strided<[1], offset: 442368>>
        %reinterpret_cast_67 = memref.reinterpret_cast %subview_66 to offset: [0], sizes: [64, 256], strides: [256, 1] : memref<16384xbf16, strided<[1], offset: 442368>> to memref<64x256xbf16>
        %subview_68 = memref.subview %arg2[720896] [65536] [1] : memref<2097152xbf16> to memref<65536xbf16, strided<[1], offset: 720896>>
        %reinterpret_cast_69 = memref.reinterpret_cast %subview_68 to offset: [0], sizes: [256, 256], strides: [256, 1] : memref<65536xbf16, strided<[1], offset: 720896>> to memref<256x256xbf16>
        aiex.run @sequence(%reinterpret_cast_65, %reinterpret_cast_67, %reinterpret_cast_69) : (memref<256x64xbf16>, memref<64x256xbf16>, memref<256x256xbf16>)
        %subview_70 = memref.subview %arg0[196608] [16384] [1] : memref<786432xbf16> to memref<16384xbf16, strided<[1], offset: 196608>>
        %reinterpret_cast_71 = memref.reinterpret_cast %subview_70 to offset: [0], sizes: [256, 64], strides: [64, 1] : memref<16384xbf16, strided<[1], offset: 196608>> to memref<256x64xbf16>
        %subview_72 = memref.subview %arg0[458752] [16384] [1] : memref<786432xbf16> to memref<16384xbf16, strided<[1], offset: 458752>>
        %reinterpret_cast_73 = memref.reinterpret_cast %subview_72 to offset: [0], sizes: [64, 256], strides: [256, 1] : memref<16384xbf16, strided<[1], offset: 458752>> to memref<64x256xbf16>
        %subview_74 = memref.subview %arg2[786432] [65536] [1] : memref<2097152xbf16> to memref<65536xbf16, strided<[1], offset: 786432>>
        %reinterpret_cast_75 = memref.reinterpret_cast %subview_74 to offset: [0], sizes: [256, 256], strides: [256, 1] : memref<65536xbf16, strided<[1], offset: 786432>> to memref<256x256xbf16>
        aiex.run @sequence(%reinterpret_cast_71, %reinterpret_cast_73, %reinterpret_cast_75) : (memref<256x64xbf16>, memref<64x256xbf16>, memref<256x256xbf16>)
        %subview_76 = memref.subview %arg0[212992] [16384] [1] : memref<786432xbf16> to memref<16384xbf16, strided<[1], offset: 212992>>
        %reinterpret_cast_77 = memref.reinterpret_cast %subview_76 to offset: [0], sizes: [256, 64], strides: [64, 1] : memref<16384xbf16, strided<[1], offset: 212992>> to memref<256x64xbf16>
        %subview_78 = memref.subview %arg0[475136] [16384] [1] : memref<786432xbf16> to memref<16384xbf16, strided<[1], offset: 475136>>
        %reinterpret_cast_79 = memref.reinterpret_cast %subview_78 to offset: [0], sizes: [64, 256], strides: [256, 1] : memref<16384xbf16, strided<[1], offset: 475136>> to memref<64x256xbf16>
        %subview_80 = memref.subview %arg2[851968] [65536] [1] : memref<2097152xbf16> to memref<65536xbf16, strided<[1], offset: 851968>>
        %reinterpret_cast_81 = memref.reinterpret_cast %subview_80 to offset: [0], sizes: [256, 256], strides: [256, 1] : memref<65536xbf16, strided<[1], offset: 851968>> to memref<256x256xbf16>
        aiex.run @sequence(%reinterpret_cast_77, %reinterpret_cast_79, %reinterpret_cast_81) : (memref<256x64xbf16>, memref<64x256xbf16>, memref<256x256xbf16>)
        %subview_82 = memref.subview %arg0[229376] [16384] [1] : memref<786432xbf16> to memref<16384xbf16, strided<[1], offset: 229376>>
        %reinterpret_cast_83 = memref.reinterpret_cast %subview_82 to offset: [0], sizes: [256, 64], strides: [64, 1] : memref<16384xbf16, strided<[1], offset: 229376>> to memref<256x64xbf16>
        %subview_84 = memref.subview %arg0[491520] [16384] [1] : memref<786432xbf16> to memref<16384xbf16, strided<[1], offset: 491520>>
        %reinterpret_cast_85 = memref.reinterpret_cast %subview_84 to offset: [0], sizes: [64, 256], strides: [256, 1] : memref<16384xbf16, strided<[1], offset: 491520>> to memref<64x256xbf16>
        %subview_86 = memref.subview %arg2[917504] [65536] [1] : memref<2097152xbf16> to memref<65536xbf16, strided<[1], offset: 917504>>
        %reinterpret_cast_87 = memref.reinterpret_cast %subview_86 to offset: [0], sizes: [256, 256], strides: [256, 1] : memref<65536xbf16, strided<[1], offset: 917504>> to memref<256x256xbf16>
        aiex.run @sequence(%reinterpret_cast_83, %reinterpret_cast_85, %reinterpret_cast_87) : (memref<256x64xbf16>, memref<64x256xbf16>, memref<256x256xbf16>)
        %subview_88 = memref.subview %arg0[245760] [16384] [1] : memref<786432xbf16> to memref<16384xbf16, strided<[1], offset: 245760>>
        %reinterpret_cast_89 = memref.reinterpret_cast %subview_88 to offset: [0], sizes: [256, 64], strides: [64, 1] : memref<16384xbf16, strided<[1], offset: 245760>> to memref<256x64xbf16>
        %subview_90 = memref.subview %arg0[507904] [16384] [1] : memref<786432xbf16> to memref<16384xbf16, strided<[1], offset: 507904>>
        %reinterpret_cast_91 = memref.reinterpret_cast %subview_90 to offset: [0], sizes: [64, 256], strides: [256, 1] : memref<16384xbf16, strided<[1], offset: 507904>> to memref<64x256xbf16>
        %subview_92 = memref.subview %arg2[983040] [65536] [1] : memref<2097152xbf16> to memref<65536xbf16, strided<[1], offset: 983040>>
        %reinterpret_cast_93 = memref.reinterpret_cast %subview_92 to offset: [0], sizes: [256, 256], strides: [256, 1] : memref<65536xbf16, strided<[1], offset: 983040>> to memref<256x256xbf16>
        aiex.run @sequence(%reinterpret_cast_89, %reinterpret_cast_91, %reinterpret_cast_93) : (memref<256x64xbf16>, memref<64x256xbf16>, memref<256x256xbf16>)
      }
      aiex.configure @op1__MHAStreamGroup {
        %subview = memref.subview %arg2[0] [65536] [1] : memref<2097152xbf16> to memref<65536xbf16>
        %reinterpret_cast = memref.reinterpret_cast %subview to offset: [0], sizes: [256, 256], strides: [256, 1] : memref<65536xbf16> to memref<256x256xbf16>
        %subview_0 = memref.subview %arg2[1048576] [65536] [1] : memref<2097152xbf16> to memref<65536xbf16, strided<[1], offset: 1048576>>
        %reinterpret_cast_1 = memref.reinterpret_cast %subview_0 to offset: [0], sizes: [256, 256], strides: [256, 1] : memref<65536xbf16, strided<[1], offset: 1048576>> to memref<256x256xbf16>
        aiex.run @sequence(%reinterpret_cast, %reinterpret_cast_1) : (memref<256x256xbf16>, memref<256x256xbf16>)
        %subview_2 = memref.subview %arg2[65536] [65536] [1] : memref<2097152xbf16> to memref<65536xbf16, strided<[1], offset: 65536>>
        %reinterpret_cast_3 = memref.reinterpret_cast %subview_2 to offset: [0], sizes: [256, 256], strides: [256, 1] : memref<65536xbf16, strided<[1], offset: 65536>> to memref<256x256xbf16>
        %subview_4 = memref.subview %arg2[1114112] [65536] [1] : memref<2097152xbf16> to memref<65536xbf16, strided<[1], offset: 1114112>>
        %reinterpret_cast_5 = memref.reinterpret_cast %subview_4 to offset: [0], sizes: [256, 256], strides: [256, 1] : memref<65536xbf16, strided<[1], offset: 1114112>> to memref<256x256xbf16>
        aiex.run @sequence(%reinterpret_cast_3, %reinterpret_cast_5) : (memref<256x256xbf16>, memref<256x256xbf16>)
        %subview_6 = memref.subview %arg2[131072] [65536] [1] : memref<2097152xbf16> to memref<65536xbf16, strided<[1], offset: 131072>>
        %reinterpret_cast_7 = memref.reinterpret_cast %subview_6 to offset: [0], sizes: [256, 256], strides: [256, 1] : memref<65536xbf16, strided<[1], offset: 131072>> to memref<256x256xbf16>
        %subview_8 = memref.subview %arg2[1179648] [65536] [1] : memref<2097152xbf16> to memref<65536xbf16, strided<[1], offset: 1179648>>
        %reinterpret_cast_9 = memref.reinterpret_cast %subview_8 to offset: [0], sizes: [256, 256], strides: [256, 1] : memref<65536xbf16, strided<[1], offset: 1179648>> to memref<256x256xbf16>
        aiex.run @sequence(%reinterpret_cast_7, %reinterpret_cast_9) : (memref<256x256xbf16>, memref<256x256xbf16>)
        %subview_10 = memref.subview %arg2[196608] [65536] [1] : memref<2097152xbf16> to memref<65536xbf16, strided<[1], offset: 196608>>
        %reinterpret_cast_11 = memref.reinterpret_cast %subview_10 to offset: [0], sizes: [256, 256], strides: [256, 1] : memref<65536xbf16, strided<[1], offset: 196608>> to memref<256x256xbf16>
        %subview_12 = memref.subview %arg2[1245184] [65536] [1] : memref<2097152xbf16> to memref<65536xbf16, strided<[1], offset: 1245184>>
        %reinterpret_cast_13 = memref.reinterpret_cast %subview_12 to offset: [0], sizes: [256, 256], strides: [256, 1] : memref<65536xbf16, strided<[1], offset: 1245184>> to memref<256x256xbf16>
        aiex.run @sequence(%reinterpret_cast_11, %reinterpret_cast_13) : (memref<256x256xbf16>, memref<256x256xbf16>)
        %subview_14 = memref.subview %arg2[262144] [65536] [1] : memref<2097152xbf16> to memref<65536xbf16, strided<[1], offset: 262144>>
        %reinterpret_cast_15 = memref.reinterpret_cast %subview_14 to offset: [0], sizes: [256, 256], strides: [256, 1] : memref<65536xbf16, strided<[1], offset: 262144>> to memref<256x256xbf16>
        %subview_16 = memref.subview %arg2[1310720] [65536] [1] : memref<2097152xbf16> to memref<65536xbf16, strided<[1], offset: 1310720>>
        %reinterpret_cast_17 = memref.reinterpret_cast %subview_16 to offset: [0], sizes: [256, 256], strides: [256, 1] : memref<65536xbf16, strided<[1], offset: 1310720>> to memref<256x256xbf16>
        aiex.run @sequence(%reinterpret_cast_15, %reinterpret_cast_17) : (memref<256x256xbf16>, memref<256x256xbf16>)
        %subview_18 = memref.subview %arg2[327680] [65536] [1] : memref<2097152xbf16> to memref<65536xbf16, strided<[1], offset: 327680>>
        %reinterpret_cast_19 = memref.reinterpret_cast %subview_18 to offset: [0], sizes: [256, 256], strides: [256, 1] : memref<65536xbf16, strided<[1], offset: 327680>> to memref<256x256xbf16>
        %subview_20 = memref.subview %arg2[1376256] [65536] [1] : memref<2097152xbf16> to memref<65536xbf16, strided<[1], offset: 1376256>>
        %reinterpret_cast_21 = memref.reinterpret_cast %subview_20 to offset: [0], sizes: [256, 256], strides: [256, 1] : memref<65536xbf16, strided<[1], offset: 1376256>> to memref<256x256xbf16>
        aiex.run @sequence(%reinterpret_cast_19, %reinterpret_cast_21) : (memref<256x256xbf16>, memref<256x256xbf16>)
        %subview_22 = memref.subview %arg2[393216] [65536] [1] : memref<2097152xbf16> to memref<65536xbf16, strided<[1], offset: 393216>>
        %reinterpret_cast_23 = memref.reinterpret_cast %subview_22 to offset: [0], sizes: [256, 256], strides: [256, 1] : memref<65536xbf16, strided<[1], offset: 393216>> to memref<256x256xbf16>
        %subview_24 = memref.subview %arg2[1441792] [65536] [1] : memref<2097152xbf16> to memref<65536xbf16, strided<[1], offset: 1441792>>
        %reinterpret_cast_25 = memref.reinterpret_cast %subview_24 to offset: [0], sizes: [256, 256], strides: [256, 1] : memref<65536xbf16, strided<[1], offset: 1441792>> to memref<256x256xbf16>
        aiex.run @sequence(%reinterpret_cast_23, %reinterpret_cast_25) : (memref<256x256xbf16>, memref<256x256xbf16>)
        %subview_26 = memref.subview %arg2[458752] [65536] [1] : memref<2097152xbf16> to memref<65536xbf16, strided<[1], offset: 458752>>
        %reinterpret_cast_27 = memref.reinterpret_cast %subview_26 to offset: [0], sizes: [256, 256], strides: [256, 1] : memref<65536xbf16, strided<[1], offset: 458752>> to memref<256x256xbf16>
        %subview_28 = memref.subview %arg2[1507328] [65536] [1] : memref<2097152xbf16> to memref<65536xbf16, strided<[1], offset: 1507328>>
        %reinterpret_cast_29 = memref.reinterpret_cast %subview_28 to offset: [0], sizes: [256, 256], strides: [256, 1] : memref<65536xbf16, strided<[1], offset: 1507328>> to memref<256x256xbf16>
        aiex.run @sequence(%reinterpret_cast_27, %reinterpret_cast_29) : (memref<256x256xbf16>, memref<256x256xbf16>)
        %subview_30 = memref.subview %arg2[524288] [65536] [1] : memref<2097152xbf16> to memref<65536xbf16, strided<[1], offset: 524288>>
        %reinterpret_cast_31 = memref.reinterpret_cast %subview_30 to offset: [0], sizes: [256, 256], strides: [256, 1] : memref<65536xbf16, strided<[1], offset: 524288>> to memref<256x256xbf16>
        %subview_32 = memref.subview %arg2[1572864] [65536] [1] : memref<2097152xbf16> to memref<65536xbf16, strided<[1], offset: 1572864>>
        %reinterpret_cast_33 = memref.reinterpret_cast %subview_32 to offset: [0], sizes: [256, 256], strides: [256, 1] : memref<65536xbf16, strided<[1], offset: 1572864>> to memref<256x256xbf16>
        aiex.run @sequence(%reinterpret_cast_31, %reinterpret_cast_33) : (memref<256x256xbf16>, memref<256x256xbf16>)
        %subview_34 = memref.subview %arg2[589824] [65536] [1] : memref<2097152xbf16> to memref<65536xbf16, strided<[1], offset: 589824>>
        %reinterpret_cast_35 = memref.reinterpret_cast %subview_34 to offset: [0], sizes: [256, 256], strides: [256, 1] : memref<65536xbf16, strided<[1], offset: 589824>> to memref<256x256xbf16>
        %subview_36 = memref.subview %arg2[1638400] [65536] [1] : memref<2097152xbf16> to memref<65536xbf16, strided<[1], offset: 1638400>>
        %reinterpret_cast_37 = memref.reinterpret_cast %subview_36 to offset: [0], sizes: [256, 256], strides: [256, 1] : memref<65536xbf16, strided<[1], offset: 1638400>> to memref<256x256xbf16>
        aiex.run @sequence(%reinterpret_cast_35, %reinterpret_cast_37) : (memref<256x256xbf16>, memref<256x256xbf16>)
        %subview_38 = memref.subview %arg2[655360] [65536] [1] : memref<2097152xbf16> to memref<65536xbf16, strided<[1], offset: 655360>>
        %reinterpret_cast_39 = memref.reinterpret_cast %subview_38 to offset: [0], sizes: [256, 256], strides: [256, 1] : memref<65536xbf16, strided<[1], offset: 655360>> to memref<256x256xbf16>
        %subview_40 = memref.subview %arg2[1703936] [65536] [1] : memref<2097152xbf16> to memref<65536xbf16, strided<[1], offset: 1703936>>
        %reinterpret_cast_41 = memref.reinterpret_cast %subview_40 to offset: [0], sizes: [256, 256], strides: [256, 1] : memref<65536xbf16, strided<[1], offset: 1703936>> to memref<256x256xbf16>
        aiex.run @sequence(%reinterpret_cast_39, %reinterpret_cast_41) : (memref<256x256xbf16>, memref<256x256xbf16>)
        %subview_42 = memref.subview %arg2[720896] [65536] [1] : memref<2097152xbf16> to memref<65536xbf16, strided<[1], offset: 720896>>
        %reinterpret_cast_43 = memref.reinterpret_cast %subview_42 to offset: [0], sizes: [256, 256], strides: [256, 1] : memref<65536xbf16, strided<[1], offset: 720896>> to memref<256x256xbf16>
        %subview_44 = memref.subview %arg2[1769472] [65536] [1] : memref<2097152xbf16> to memref<65536xbf16, strided<[1], offset: 1769472>>
        %reinterpret_cast_45 = memref.reinterpret_cast %subview_44 to offset: [0], sizes: [256, 256], strides: [256, 1] : memref<65536xbf16, strided<[1], offset: 1769472>> to memref<256x256xbf16>
        aiex.run @sequence(%reinterpret_cast_43, %reinterpret_cast_45) : (memref<256x256xbf16>, memref<256x256xbf16>)
        %subview_46 = memref.subview %arg2[786432] [65536] [1] : memref<2097152xbf16> to memref<65536xbf16, strided<[1], offset: 786432>>
        %reinterpret_cast_47 = memref.reinterpret_cast %subview_46 to offset: [0], sizes: [256, 256], strides: [256, 1] : memref<65536xbf16, strided<[1], offset: 786432>> to memref<256x256xbf16>
        %subview_48 = memref.subview %arg2[1835008] [65536] [1] : memref<2097152xbf16> to memref<65536xbf16, strided<[1], offset: 1835008>>
        %reinterpret_cast_49 = memref.reinterpret_cast %subview_48 to offset: [0], sizes: [256, 256], strides: [256, 1] : memref<65536xbf16, strided<[1], offset: 1835008>> to memref<256x256xbf16>
        aiex.run @sequence(%reinterpret_cast_47, %reinterpret_cast_49) : (memref<256x256xbf16>, memref<256x256xbf16>)
        %subview_50 = memref.subview %arg2[851968] [65536] [1] : memref<2097152xbf16> to memref<65536xbf16, strided<[1], offset: 851968>>
        %reinterpret_cast_51 = memref.reinterpret_cast %subview_50 to offset: [0], sizes: [256, 256], strides: [256, 1] : memref<65536xbf16, strided<[1], offset: 851968>> to memref<256x256xbf16>
        %subview_52 = memref.subview %arg2[1900544] [65536] [1] : memref<2097152xbf16> to memref<65536xbf16, strided<[1], offset: 1900544>>
        %reinterpret_cast_53 = memref.reinterpret_cast %subview_52 to offset: [0], sizes: [256, 256], strides: [256, 1] : memref<65536xbf16, strided<[1], offset: 1900544>> to memref<256x256xbf16>
        aiex.run @sequence(%reinterpret_cast_51, %reinterpret_cast_53) : (memref<256x256xbf16>, memref<256x256xbf16>)
        %subview_54 = memref.subview %arg2[917504] [65536] [1] : memref<2097152xbf16> to memref<65536xbf16, strided<[1], offset: 917504>>
        %reinterpret_cast_55 = memref.reinterpret_cast %subview_54 to offset: [0], sizes: [256, 256], strides: [256, 1] : memref<65536xbf16, strided<[1], offset: 917504>> to memref<256x256xbf16>
        %subview_56 = memref.subview %arg2[1966080] [65536] [1] : memref<2097152xbf16> to memref<65536xbf16, strided<[1], offset: 1966080>>
        %reinterpret_cast_57 = memref.reinterpret_cast %subview_56 to offset: [0], sizes: [256, 256], strides: [256, 1] : memref<65536xbf16, strided<[1], offset: 1966080>> to memref<256x256xbf16>
        aiex.run @sequence(%reinterpret_cast_55, %reinterpret_cast_57) : (memref<256x256xbf16>, memref<256x256xbf16>)
        %subview_58 = memref.subview %arg2[983040] [65536] [1] : memref<2097152xbf16> to memref<65536xbf16, strided<[1], offset: 983040>>
        %reinterpret_cast_59 = memref.reinterpret_cast %subview_58 to offset: [0], sizes: [256, 256], strides: [256, 1] : memref<65536xbf16, strided<[1], offset: 983040>> to memref<256x256xbf16>
        %subview_60 = memref.subview %arg2[2031616] [65536] [1] : memref<2097152xbf16> to memref<65536xbf16, strided<[1], offset: 2031616>>
        %reinterpret_cast_61 = memref.reinterpret_cast %subview_60 to offset: [0], sizes: [256, 256], strides: [256, 1] : memref<65536xbf16, strided<[1], offset: 2031616>> to memref<256x256xbf16>
        aiex.run @sequence(%reinterpret_cast_59, %reinterpret_cast_61) : (memref<256x256xbf16>, memref<256x256xbf16>)
      }
      aiex.configure @op2__MHAStreamGroup {
        %subview = memref.subview %arg2[1048576] [65536] [1] : memref<2097152xbf16> to memref<65536xbf16, strided<[1], offset: 1048576>>
        %reinterpret_cast = memref.reinterpret_cast %subview to offset: [0], sizes: [256, 256], strides: [256, 1] : memref<65536xbf16, strided<[1], offset: 1048576>> to memref<256x256xbf16>
        %subview_0 = memref.subview %arg0[524288] [16384] [1] : memref<786432xbf16> to memref<16384xbf16, strided<[1], offset: 524288>>
        %reinterpret_cast_1 = memref.reinterpret_cast %subview_0 to offset: [0], sizes: [256, 64], strides: [64, 1] : memref<16384xbf16, strided<[1], offset: 524288>> to memref<256x64xbf16>
        %subview_2 = memref.subview %arg1[0] [16384] [1] : memref<262144xbf16> to memref<16384xbf16>
        %reinterpret_cast_3 = memref.reinterpret_cast %subview_2 to offset: [0], sizes: [256, 64], strides: [64, 1] : memref<16384xbf16> to memref<256x64xbf16>
        aiex.run @sequence(%reinterpret_cast, %reinterpret_cast_1, %reinterpret_cast_3) : (memref<256x256xbf16>, memref<256x64xbf16>, memref<256x64xbf16>)
        %subview_4 = memref.subview %arg2[1114112] [65536] [1] : memref<2097152xbf16> to memref<65536xbf16, strided<[1], offset: 1114112>>
        %reinterpret_cast_5 = memref.reinterpret_cast %subview_4 to offset: [0], sizes: [256, 256], strides: [256, 1] : memref<65536xbf16, strided<[1], offset: 1114112>> to memref<256x256xbf16>
        %subview_6 = memref.subview %arg0[540672] [16384] [1] : memref<786432xbf16> to memref<16384xbf16, strided<[1], offset: 540672>>
        %reinterpret_cast_7 = memref.reinterpret_cast %subview_6 to offset: [0], sizes: [256, 64], strides: [64, 1] : memref<16384xbf16, strided<[1], offset: 540672>> to memref<256x64xbf16>
        %subview_8 = memref.subview %arg1[16384] [16384] [1] : memref<262144xbf16> to memref<16384xbf16, strided<[1], offset: 16384>>
        %reinterpret_cast_9 = memref.reinterpret_cast %subview_8 to offset: [0], sizes: [256, 64], strides: [64, 1] : memref<16384xbf16, strided<[1], offset: 16384>> to memref<256x64xbf16>
        aiex.run @sequence(%reinterpret_cast_5, %reinterpret_cast_7, %reinterpret_cast_9) : (memref<256x256xbf16>, memref<256x64xbf16>, memref<256x64xbf16>)
        %subview_10 = memref.subview %arg2[1179648] [65536] [1] : memref<2097152xbf16> to memref<65536xbf16, strided<[1], offset: 1179648>>
        %reinterpret_cast_11 = memref.reinterpret_cast %subview_10 to offset: [0], sizes: [256, 256], strides: [256, 1] : memref<65536xbf16, strided<[1], offset: 1179648>> to memref<256x256xbf16>
        %subview_12 = memref.subview %arg0[557056] [16384] [1] : memref<786432xbf16> to memref<16384xbf16, strided<[1], offset: 557056>>
        %reinterpret_cast_13 = memref.reinterpret_cast %subview_12 to offset: [0], sizes: [256, 64], strides: [64, 1] : memref<16384xbf16, strided<[1], offset: 557056>> to memref<256x64xbf16>
        %subview_14 = memref.subview %arg1[32768] [16384] [1] : memref<262144xbf16> to memref<16384xbf16, strided<[1], offset: 32768>>
        %reinterpret_cast_15 = memref.reinterpret_cast %subview_14 to offset: [0], sizes: [256, 64], strides: [64, 1] : memref<16384xbf16, strided<[1], offset: 32768>> to memref<256x64xbf16>
        aiex.run @sequence(%reinterpret_cast_11, %reinterpret_cast_13, %reinterpret_cast_15) : (memref<256x256xbf16>, memref<256x64xbf16>, memref<256x64xbf16>)
        %subview_16 = memref.subview %arg2[1245184] [65536] [1] : memref<2097152xbf16> to memref<65536xbf16, strided<[1], offset: 1245184>>
        %reinterpret_cast_17 = memref.reinterpret_cast %subview_16 to offset: [0], sizes: [256, 256], strides: [256, 1] : memref<65536xbf16, strided<[1], offset: 1245184>> to memref<256x256xbf16>
        %subview_18 = memref.subview %arg0[573440] [16384] [1] : memref<786432xbf16> to memref<16384xbf16, strided<[1], offset: 573440>>
        %reinterpret_cast_19 = memref.reinterpret_cast %subview_18 to offset: [0], sizes: [256, 64], strides: [64, 1] : memref<16384xbf16, strided<[1], offset: 573440>> to memref<256x64xbf16>
        %subview_20 = memref.subview %arg1[49152] [16384] [1] : memref<262144xbf16> to memref<16384xbf16, strided<[1], offset: 49152>>
        %reinterpret_cast_21 = memref.reinterpret_cast %subview_20 to offset: [0], sizes: [256, 64], strides: [64, 1] : memref<16384xbf16, strided<[1], offset: 49152>> to memref<256x64xbf16>
        aiex.run @sequence(%reinterpret_cast_17, %reinterpret_cast_19, %reinterpret_cast_21) : (memref<256x256xbf16>, memref<256x64xbf16>, memref<256x64xbf16>)
        %subview_22 = memref.subview %arg2[1310720] [65536] [1] : memref<2097152xbf16> to memref<65536xbf16, strided<[1], offset: 1310720>>
        %reinterpret_cast_23 = memref.reinterpret_cast %subview_22 to offset: [0], sizes: [256, 256], strides: [256, 1] : memref<65536xbf16, strided<[1], offset: 1310720>> to memref<256x256xbf16>
        %subview_24 = memref.subview %arg0[589824] [16384] [1] : memref<786432xbf16> to memref<16384xbf16, strided<[1], offset: 589824>>
        %reinterpret_cast_25 = memref.reinterpret_cast %subview_24 to offset: [0], sizes: [256, 64], strides: [64, 1] : memref<16384xbf16, strided<[1], offset: 589824>> to memref<256x64xbf16>
        %subview_26 = memref.subview %arg1[65536] [16384] [1] : memref<262144xbf16> to memref<16384xbf16, strided<[1], offset: 65536>>
        %reinterpret_cast_27 = memref.reinterpret_cast %subview_26 to offset: [0], sizes: [256, 64], strides: [64, 1] : memref<16384xbf16, strided<[1], offset: 65536>> to memref<256x64xbf16>
        aiex.run @sequence(%reinterpret_cast_23, %reinterpret_cast_25, %reinterpret_cast_27) : (memref<256x256xbf16>, memref<256x64xbf16>, memref<256x64xbf16>)
        %subview_28 = memref.subview %arg2[1376256] [65536] [1] : memref<2097152xbf16> to memref<65536xbf16, strided<[1], offset: 1376256>>
        %reinterpret_cast_29 = memref.reinterpret_cast %subview_28 to offset: [0], sizes: [256, 256], strides: [256, 1] : memref<65536xbf16, strided<[1], offset: 1376256>> to memref<256x256xbf16>
        %subview_30 = memref.subview %arg0[606208] [16384] [1] : memref<786432xbf16> to memref<16384xbf16, strided<[1], offset: 606208>>
        %reinterpret_cast_31 = memref.reinterpret_cast %subview_30 to offset: [0], sizes: [256, 64], strides: [64, 1] : memref<16384xbf16, strided<[1], offset: 606208>> to memref<256x64xbf16>
        %subview_32 = memref.subview %arg1[81920] [16384] [1] : memref<262144xbf16> to memref<16384xbf16, strided<[1], offset: 81920>>
        %reinterpret_cast_33 = memref.reinterpret_cast %subview_32 to offset: [0], sizes: [256, 64], strides: [64, 1] : memref<16384xbf16, strided<[1], offset: 81920>> to memref<256x64xbf16>
        aiex.run @sequence(%reinterpret_cast_29, %reinterpret_cast_31, %reinterpret_cast_33) : (memref<256x256xbf16>, memref<256x64xbf16>, memref<256x64xbf16>)
        %subview_34 = memref.subview %arg2[1441792] [65536] [1] : memref<2097152xbf16> to memref<65536xbf16, strided<[1], offset: 1441792>>
        %reinterpret_cast_35 = memref.reinterpret_cast %subview_34 to offset: [0], sizes: [256, 256], strides: [256, 1] : memref<65536xbf16, strided<[1], offset: 1441792>> to memref<256x256xbf16>
        %subview_36 = memref.subview %arg0[622592] [16384] [1] : memref<786432xbf16> to memref<16384xbf16, strided<[1], offset: 622592>>
        %reinterpret_cast_37 = memref.reinterpret_cast %subview_36 to offset: [0], sizes: [256, 64], strides: [64, 1] : memref<16384xbf16, strided<[1], offset: 622592>> to memref<256x64xbf16>
        %subview_38 = memref.subview %arg1[98304] [16384] [1] : memref<262144xbf16> to memref<16384xbf16, strided<[1], offset: 98304>>
        %reinterpret_cast_39 = memref.reinterpret_cast %subview_38 to offset: [0], sizes: [256, 64], strides: [64, 1] : memref<16384xbf16, strided<[1], offset: 98304>> to memref<256x64xbf16>
        aiex.run @sequence(%reinterpret_cast_35, %reinterpret_cast_37, %reinterpret_cast_39) : (memref<256x256xbf16>, memref<256x64xbf16>, memref<256x64xbf16>)
        %subview_40 = memref.subview %arg2[1507328] [65536] [1] : memref<2097152xbf16> to memref<65536xbf16, strided<[1], offset: 1507328>>
        %reinterpret_cast_41 = memref.reinterpret_cast %subview_40 to offset: [0], sizes: [256, 256], strides: [256, 1] : memref<65536xbf16, strided<[1], offset: 1507328>> to memref<256x256xbf16>
        %subview_42 = memref.subview %arg0[638976] [16384] [1] : memref<786432xbf16> to memref<16384xbf16, strided<[1], offset: 638976>>
        %reinterpret_cast_43 = memref.reinterpret_cast %subview_42 to offset: [0], sizes: [256, 64], strides: [64, 1] : memref<16384xbf16, strided<[1], offset: 638976>> to memref<256x64xbf16>
        %subview_44 = memref.subview %arg1[114688] [16384] [1] : memref<262144xbf16> to memref<16384xbf16, strided<[1], offset: 114688>>
        %reinterpret_cast_45 = memref.reinterpret_cast %subview_44 to offset: [0], sizes: [256, 64], strides: [64, 1] : memref<16384xbf16, strided<[1], offset: 114688>> to memref<256x64xbf16>
        aiex.run @sequence(%reinterpret_cast_41, %reinterpret_cast_43, %reinterpret_cast_45) : (memref<256x256xbf16>, memref<256x64xbf16>, memref<256x64xbf16>)
        %subview_46 = memref.subview %arg2[1572864] [65536] [1] : memref<2097152xbf16> to memref<65536xbf16, strided<[1], offset: 1572864>>
        %reinterpret_cast_47 = memref.reinterpret_cast %subview_46 to offset: [0], sizes: [256, 256], strides: [256, 1] : memref<65536xbf16, strided<[1], offset: 1572864>> to memref<256x256xbf16>
        %subview_48 = memref.subview %arg0[655360] [16384] [1] : memref<786432xbf16> to memref<16384xbf16, strided<[1], offset: 655360>>
        %reinterpret_cast_49 = memref.reinterpret_cast %subview_48 to offset: [0], sizes: [256, 64], strides: [64, 1] : memref<16384xbf16, strided<[1], offset: 655360>> to memref<256x64xbf16>
        %subview_50 = memref.subview %arg1[131072] [16384] [1] : memref<262144xbf16> to memref<16384xbf16, strided<[1], offset: 131072>>
        %reinterpret_cast_51 = memref.reinterpret_cast %subview_50 to offset: [0], sizes: [256, 64], strides: [64, 1] : memref<16384xbf16, strided<[1], offset: 131072>> to memref<256x64xbf16>
        aiex.run @sequence(%reinterpret_cast_47, %reinterpret_cast_49, %reinterpret_cast_51) : (memref<256x256xbf16>, memref<256x64xbf16>, memref<256x64xbf16>)
        %subview_52 = memref.subview %arg2[1638400] [65536] [1] : memref<2097152xbf16> to memref<65536xbf16, strided<[1], offset: 1638400>>
        %reinterpret_cast_53 = memref.reinterpret_cast %subview_52 to offset: [0], sizes: [256, 256], strides: [256, 1] : memref<65536xbf16, strided<[1], offset: 1638400>> to memref<256x256xbf16>
        %subview_54 = memref.subview %arg0[671744] [16384] [1] : memref<786432xbf16> to memref<16384xbf16, strided<[1], offset: 671744>>
        %reinterpret_cast_55 = memref.reinterpret_cast %subview_54 to offset: [0], sizes: [256, 64], strides: [64, 1] : memref<16384xbf16, strided<[1], offset: 671744>> to memref<256x64xbf16>
        %subview_56 = memref.subview %arg1[147456] [16384] [1] : memref<262144xbf16> to memref<16384xbf16, strided<[1], offset: 147456>>
        %reinterpret_cast_57 = memref.reinterpret_cast %subview_56 to offset: [0], sizes: [256, 64], strides: [64, 1] : memref<16384xbf16, strided<[1], offset: 147456>> to memref<256x64xbf16>
        aiex.run @sequence(%reinterpret_cast_53, %reinterpret_cast_55, %reinterpret_cast_57) : (memref<256x256xbf16>, memref<256x64xbf16>, memref<256x64xbf16>)
        %subview_58 = memref.subview %arg2[1703936] [65536] [1] : memref<2097152xbf16> to memref<65536xbf16, strided<[1], offset: 1703936>>
        %reinterpret_cast_59 = memref.reinterpret_cast %subview_58 to offset: [0], sizes: [256, 256], strides: [256, 1] : memref<65536xbf16, strided<[1], offset: 1703936>> to memref<256x256xbf16>
        %subview_60 = memref.subview %arg0[688128] [16384] [1] : memref<786432xbf16> to memref<16384xbf16, strided<[1], offset: 688128>>
        %reinterpret_cast_61 = memref.reinterpret_cast %subview_60 to offset: [0], sizes: [256, 64], strides: [64, 1] : memref<16384xbf16, strided<[1], offset: 688128>> to memref<256x64xbf16>
        %subview_62 = memref.subview %arg1[163840] [16384] [1] : memref<262144xbf16> to memref<16384xbf16, strided<[1], offset: 163840>>
        %reinterpret_cast_63 = memref.reinterpret_cast %subview_62 to offset: [0], sizes: [256, 64], strides: [64, 1] : memref<16384xbf16, strided<[1], offset: 163840>> to memref<256x64xbf16>
        aiex.run @sequence(%reinterpret_cast_59, %reinterpret_cast_61, %reinterpret_cast_63) : (memref<256x256xbf16>, memref<256x64xbf16>, memref<256x64xbf16>)
        %subview_64 = memref.subview %arg2[1769472] [65536] [1] : memref<2097152xbf16> to memref<65536xbf16, strided<[1], offset: 1769472>>
        %reinterpret_cast_65 = memref.reinterpret_cast %subview_64 to offset: [0], sizes: [256, 256], strides: [256, 1] : memref<65536xbf16, strided<[1], offset: 1769472>> to memref<256x256xbf16>
        %subview_66 = memref.subview %arg0[704512] [16384] [1] : memref<786432xbf16> to memref<16384xbf16, strided<[1], offset: 704512>>
        %reinterpret_cast_67 = memref.reinterpret_cast %subview_66 to offset: [0], sizes: [256, 64], strides: [64, 1] : memref<16384xbf16, strided<[1], offset: 704512>> to memref<256x64xbf16>
        %subview_68 = memref.subview %arg1[180224] [16384] [1] : memref<262144xbf16> to memref<16384xbf16, strided<[1], offset: 180224>>
        %reinterpret_cast_69 = memref.reinterpret_cast %subview_68 to offset: [0], sizes: [256, 64], strides: [64, 1] : memref<16384xbf16, strided<[1], offset: 180224>> to memref<256x64xbf16>
        aiex.run @sequence(%reinterpret_cast_65, %reinterpret_cast_67, %reinterpret_cast_69) : (memref<256x256xbf16>, memref<256x64xbf16>, memref<256x64xbf16>)
        %subview_70 = memref.subview %arg2[1835008] [65536] [1] : memref<2097152xbf16> to memref<65536xbf16, strided<[1], offset: 1835008>>
        %reinterpret_cast_71 = memref.reinterpret_cast %subview_70 to offset: [0], sizes: [256, 256], strides: [256, 1] : memref<65536xbf16, strided<[1], offset: 1835008>> to memref<256x256xbf16>
        %subview_72 = memref.subview %arg0[720896] [16384] [1] : memref<786432xbf16> to memref<16384xbf16, strided<[1], offset: 720896>>
        %reinterpret_cast_73 = memref.reinterpret_cast %subview_72 to offset: [0], sizes: [256, 64], strides: [64, 1] : memref<16384xbf16, strided<[1], offset: 720896>> to memref<256x64xbf16>
        %subview_74 = memref.subview %arg1[196608] [16384] [1] : memref<262144xbf16> to memref<16384xbf16, strided<[1], offset: 196608>>
        %reinterpret_cast_75 = memref.reinterpret_cast %subview_74 to offset: [0], sizes: [256, 64], strides: [64, 1] : memref<16384xbf16, strided<[1], offset: 196608>> to memref<256x64xbf16>
        aiex.run @sequence(%reinterpret_cast_71, %reinterpret_cast_73, %reinterpret_cast_75) : (memref<256x256xbf16>, memref<256x64xbf16>, memref<256x64xbf16>)
        %subview_76 = memref.subview %arg2[1900544] [65536] [1] : memref<2097152xbf16> to memref<65536xbf16, strided<[1], offset: 1900544>>
        %reinterpret_cast_77 = memref.reinterpret_cast %subview_76 to offset: [0], sizes: [256, 256], strides: [256, 1] : memref<65536xbf16, strided<[1], offset: 1900544>> to memref<256x256xbf16>
        %subview_78 = memref.subview %arg0[737280] [16384] [1] : memref<786432xbf16> to memref<16384xbf16, strided<[1], offset: 737280>>
        %reinterpret_cast_79 = memref.reinterpret_cast %subview_78 to offset: [0], sizes: [256, 64], strides: [64, 1] : memref<16384xbf16, strided<[1], offset: 737280>> to memref<256x64xbf16>
        %subview_80 = memref.subview %arg1[212992] [16384] [1] : memref<262144xbf16> to memref<16384xbf16, strided<[1], offset: 212992>>
        %reinterpret_cast_81 = memref.reinterpret_cast %subview_80 to offset: [0], sizes: [256, 64], strides: [64, 1] : memref<16384xbf16, strided<[1], offset: 212992>> to memref<256x64xbf16>
        aiex.run @sequence(%reinterpret_cast_77, %reinterpret_cast_79, %reinterpret_cast_81) : (memref<256x256xbf16>, memref<256x64xbf16>, memref<256x64xbf16>)
        %subview_82 = memref.subview %arg2[1966080] [65536] [1] : memref<2097152xbf16> to memref<65536xbf16, strided<[1], offset: 1966080>>
        %reinterpret_cast_83 = memref.reinterpret_cast %subview_82 to offset: [0], sizes: [256, 256], strides: [256, 1] : memref<65536xbf16, strided<[1], offset: 1966080>> to memref<256x256xbf16>
        %subview_84 = memref.subview %arg0[753664] [16384] [1] : memref<786432xbf16> to memref<16384xbf16, strided<[1], offset: 753664>>
        %reinterpret_cast_85 = memref.reinterpret_cast %subview_84 to offset: [0], sizes: [256, 64], strides: [64, 1] : memref<16384xbf16, strided<[1], offset: 753664>> to memref<256x64xbf16>
        %subview_86 = memref.subview %arg1[229376] [16384] [1] : memref<262144xbf16> to memref<16384xbf16, strided<[1], offset: 229376>>
        %reinterpret_cast_87 = memref.reinterpret_cast %subview_86 to offset: [0], sizes: [256, 64], strides: [64, 1] : memref<16384xbf16, strided<[1], offset: 229376>> to memref<256x64xbf16>
        aiex.run @sequence(%reinterpret_cast_83, %reinterpret_cast_85, %reinterpret_cast_87) : (memref<256x256xbf16>, memref<256x64xbf16>, memref<256x64xbf16>)
        %subview_88 = memref.subview %arg2[2031616] [65536] [1] : memref<2097152xbf16> to memref<65536xbf16, strided<[1], offset: 2031616>>
        %reinterpret_cast_89 = memref.reinterpret_cast %subview_88 to offset: [0], sizes: [256, 256], strides: [256, 1] : memref<65536xbf16, strided<[1], offset: 2031616>> to memref<256x256xbf16>
        %subview_90 = memref.subview %arg0[770048] [16384] [1] : memref<786432xbf16> to memref<16384xbf16, strided<[1], offset: 770048>>
        %reinterpret_cast_91 = memref.reinterpret_cast %subview_90 to offset: [0], sizes: [256, 64], strides: [64, 1] : memref<16384xbf16, strided<[1], offset: 770048>> to memref<256x64xbf16>
        %subview_92 = memref.subview %arg1[245760] [16384] [1] : memref<262144xbf16> to memref<16384xbf16, strided<[1], offset: 245760>>
        %reinterpret_cast_93 = memref.reinterpret_cast %subview_92 to offset: [0], sizes: [256, 64], strides: [64, 1] : memref<16384xbf16, strided<[1], offset: 245760>> to memref<256x64xbf16>
        aiex.run @sequence(%reinterpret_cast_89, %reinterpret_cast_91, %reinterpret_cast_93) : (memref<256x256xbf16>, memref<256x64xbf16>, memref<256x64xbf16>)
      }
      aiex.configure @reset_device {
      }
    }
  }
}
