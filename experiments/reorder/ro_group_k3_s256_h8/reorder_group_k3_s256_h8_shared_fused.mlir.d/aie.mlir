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
    aie.runtime_sequence(%arg0: memref<393216xbf16>, %arg1: memref<131072xbf16>, %arg2: memref<1048576xbf16>) {
      aiex.configure @op0__MHAStreamGroup {
        %subview = memref.subview %arg0[0] [16384] [1] : memref<393216xbf16> to memref<16384xbf16>
        %reinterpret_cast = memref.reinterpret_cast %subview to offset: [0], sizes: [256, 64], strides: [64, 1] : memref<16384xbf16> to memref<256x64xbf16>
        %subview_0 = memref.subview %arg0[131072] [16384] [1] : memref<393216xbf16> to memref<16384xbf16, strided<[1], offset: 131072>>
        %reinterpret_cast_1 = memref.reinterpret_cast %subview_0 to offset: [0], sizes: [64, 256], strides: [256, 1] : memref<16384xbf16, strided<[1], offset: 131072>> to memref<64x256xbf16>
        %subview_2 = memref.subview %arg2[0] [65536] [1] : memref<1048576xbf16> to memref<65536xbf16>
        %reinterpret_cast_3 = memref.reinterpret_cast %subview_2 to offset: [0], sizes: [256, 256], strides: [256, 1] : memref<65536xbf16> to memref<256x256xbf16>
        aiex.run @sequence(%reinterpret_cast, %reinterpret_cast_1, %reinterpret_cast_3) : (memref<256x64xbf16>, memref<64x256xbf16>, memref<256x256xbf16>)
        %subview_4 = memref.subview %arg0[16384] [16384] [1] : memref<393216xbf16> to memref<16384xbf16, strided<[1], offset: 16384>>
        %reinterpret_cast_5 = memref.reinterpret_cast %subview_4 to offset: [0], sizes: [256, 64], strides: [64, 1] : memref<16384xbf16, strided<[1], offset: 16384>> to memref<256x64xbf16>
        %subview_6 = memref.subview %arg0[147456] [16384] [1] : memref<393216xbf16> to memref<16384xbf16, strided<[1], offset: 147456>>
        %reinterpret_cast_7 = memref.reinterpret_cast %subview_6 to offset: [0], sizes: [64, 256], strides: [256, 1] : memref<16384xbf16, strided<[1], offset: 147456>> to memref<64x256xbf16>
        %subview_8 = memref.subview %arg2[65536] [65536] [1] : memref<1048576xbf16> to memref<65536xbf16, strided<[1], offset: 65536>>
        %reinterpret_cast_9 = memref.reinterpret_cast %subview_8 to offset: [0], sizes: [256, 256], strides: [256, 1] : memref<65536xbf16, strided<[1], offset: 65536>> to memref<256x256xbf16>
        aiex.run @sequence(%reinterpret_cast_5, %reinterpret_cast_7, %reinterpret_cast_9) : (memref<256x64xbf16>, memref<64x256xbf16>, memref<256x256xbf16>)
        %subview_10 = memref.subview %arg0[32768] [16384] [1] : memref<393216xbf16> to memref<16384xbf16, strided<[1], offset: 32768>>
        %reinterpret_cast_11 = memref.reinterpret_cast %subview_10 to offset: [0], sizes: [256, 64], strides: [64, 1] : memref<16384xbf16, strided<[1], offset: 32768>> to memref<256x64xbf16>
        %subview_12 = memref.subview %arg0[163840] [16384] [1] : memref<393216xbf16> to memref<16384xbf16, strided<[1], offset: 163840>>
        %reinterpret_cast_13 = memref.reinterpret_cast %subview_12 to offset: [0], sizes: [64, 256], strides: [256, 1] : memref<16384xbf16, strided<[1], offset: 163840>> to memref<64x256xbf16>
        %subview_14 = memref.subview %arg2[131072] [65536] [1] : memref<1048576xbf16> to memref<65536xbf16, strided<[1], offset: 131072>>
        %reinterpret_cast_15 = memref.reinterpret_cast %subview_14 to offset: [0], sizes: [256, 256], strides: [256, 1] : memref<65536xbf16, strided<[1], offset: 131072>> to memref<256x256xbf16>
        aiex.run @sequence(%reinterpret_cast_11, %reinterpret_cast_13, %reinterpret_cast_15) : (memref<256x64xbf16>, memref<64x256xbf16>, memref<256x256xbf16>)
        %subview_16 = memref.subview %arg0[49152] [16384] [1] : memref<393216xbf16> to memref<16384xbf16, strided<[1], offset: 49152>>
        %reinterpret_cast_17 = memref.reinterpret_cast %subview_16 to offset: [0], sizes: [256, 64], strides: [64, 1] : memref<16384xbf16, strided<[1], offset: 49152>> to memref<256x64xbf16>
        %subview_18 = memref.subview %arg0[180224] [16384] [1] : memref<393216xbf16> to memref<16384xbf16, strided<[1], offset: 180224>>
        %reinterpret_cast_19 = memref.reinterpret_cast %subview_18 to offset: [0], sizes: [64, 256], strides: [256, 1] : memref<16384xbf16, strided<[1], offset: 180224>> to memref<64x256xbf16>
        %subview_20 = memref.subview %arg2[196608] [65536] [1] : memref<1048576xbf16> to memref<65536xbf16, strided<[1], offset: 196608>>
        %reinterpret_cast_21 = memref.reinterpret_cast %subview_20 to offset: [0], sizes: [256, 256], strides: [256, 1] : memref<65536xbf16, strided<[1], offset: 196608>> to memref<256x256xbf16>
        aiex.run @sequence(%reinterpret_cast_17, %reinterpret_cast_19, %reinterpret_cast_21) : (memref<256x64xbf16>, memref<64x256xbf16>, memref<256x256xbf16>)
        %subview_22 = memref.subview %arg0[65536] [16384] [1] : memref<393216xbf16> to memref<16384xbf16, strided<[1], offset: 65536>>
        %reinterpret_cast_23 = memref.reinterpret_cast %subview_22 to offset: [0], sizes: [256, 64], strides: [64, 1] : memref<16384xbf16, strided<[1], offset: 65536>> to memref<256x64xbf16>
        %subview_24 = memref.subview %arg0[196608] [16384] [1] : memref<393216xbf16> to memref<16384xbf16, strided<[1], offset: 196608>>
        %reinterpret_cast_25 = memref.reinterpret_cast %subview_24 to offset: [0], sizes: [64, 256], strides: [256, 1] : memref<16384xbf16, strided<[1], offset: 196608>> to memref<64x256xbf16>
        %subview_26 = memref.subview %arg2[262144] [65536] [1] : memref<1048576xbf16> to memref<65536xbf16, strided<[1], offset: 262144>>
        %reinterpret_cast_27 = memref.reinterpret_cast %subview_26 to offset: [0], sizes: [256, 256], strides: [256, 1] : memref<65536xbf16, strided<[1], offset: 262144>> to memref<256x256xbf16>
        aiex.run @sequence(%reinterpret_cast_23, %reinterpret_cast_25, %reinterpret_cast_27) : (memref<256x64xbf16>, memref<64x256xbf16>, memref<256x256xbf16>)
        %subview_28 = memref.subview %arg0[81920] [16384] [1] : memref<393216xbf16> to memref<16384xbf16, strided<[1], offset: 81920>>
        %reinterpret_cast_29 = memref.reinterpret_cast %subview_28 to offset: [0], sizes: [256, 64], strides: [64, 1] : memref<16384xbf16, strided<[1], offset: 81920>> to memref<256x64xbf16>
        %subview_30 = memref.subview %arg0[212992] [16384] [1] : memref<393216xbf16> to memref<16384xbf16, strided<[1], offset: 212992>>
        %reinterpret_cast_31 = memref.reinterpret_cast %subview_30 to offset: [0], sizes: [64, 256], strides: [256, 1] : memref<16384xbf16, strided<[1], offset: 212992>> to memref<64x256xbf16>
        %subview_32 = memref.subview %arg2[327680] [65536] [1] : memref<1048576xbf16> to memref<65536xbf16, strided<[1], offset: 327680>>
        %reinterpret_cast_33 = memref.reinterpret_cast %subview_32 to offset: [0], sizes: [256, 256], strides: [256, 1] : memref<65536xbf16, strided<[1], offset: 327680>> to memref<256x256xbf16>
        aiex.run @sequence(%reinterpret_cast_29, %reinterpret_cast_31, %reinterpret_cast_33) : (memref<256x64xbf16>, memref<64x256xbf16>, memref<256x256xbf16>)
        %subview_34 = memref.subview %arg0[98304] [16384] [1] : memref<393216xbf16> to memref<16384xbf16, strided<[1], offset: 98304>>
        %reinterpret_cast_35 = memref.reinterpret_cast %subview_34 to offset: [0], sizes: [256, 64], strides: [64, 1] : memref<16384xbf16, strided<[1], offset: 98304>> to memref<256x64xbf16>
        %subview_36 = memref.subview %arg0[229376] [16384] [1] : memref<393216xbf16> to memref<16384xbf16, strided<[1], offset: 229376>>
        %reinterpret_cast_37 = memref.reinterpret_cast %subview_36 to offset: [0], sizes: [64, 256], strides: [256, 1] : memref<16384xbf16, strided<[1], offset: 229376>> to memref<64x256xbf16>
        %subview_38 = memref.subview %arg2[393216] [65536] [1] : memref<1048576xbf16> to memref<65536xbf16, strided<[1], offset: 393216>>
        %reinterpret_cast_39 = memref.reinterpret_cast %subview_38 to offset: [0], sizes: [256, 256], strides: [256, 1] : memref<65536xbf16, strided<[1], offset: 393216>> to memref<256x256xbf16>
        aiex.run @sequence(%reinterpret_cast_35, %reinterpret_cast_37, %reinterpret_cast_39) : (memref<256x64xbf16>, memref<64x256xbf16>, memref<256x256xbf16>)
        %subview_40 = memref.subview %arg0[114688] [16384] [1] : memref<393216xbf16> to memref<16384xbf16, strided<[1], offset: 114688>>
        %reinterpret_cast_41 = memref.reinterpret_cast %subview_40 to offset: [0], sizes: [256, 64], strides: [64, 1] : memref<16384xbf16, strided<[1], offset: 114688>> to memref<256x64xbf16>
        %subview_42 = memref.subview %arg0[245760] [16384] [1] : memref<393216xbf16> to memref<16384xbf16, strided<[1], offset: 245760>>
        %reinterpret_cast_43 = memref.reinterpret_cast %subview_42 to offset: [0], sizes: [64, 256], strides: [256, 1] : memref<16384xbf16, strided<[1], offset: 245760>> to memref<64x256xbf16>
        %subview_44 = memref.subview %arg2[458752] [65536] [1] : memref<1048576xbf16> to memref<65536xbf16, strided<[1], offset: 458752>>
        %reinterpret_cast_45 = memref.reinterpret_cast %subview_44 to offset: [0], sizes: [256, 256], strides: [256, 1] : memref<65536xbf16, strided<[1], offset: 458752>> to memref<256x256xbf16>
        aiex.run @sequence(%reinterpret_cast_41, %reinterpret_cast_43, %reinterpret_cast_45) : (memref<256x64xbf16>, memref<64x256xbf16>, memref<256x256xbf16>)
      }
      aiex.configure @op1__MHAStreamGroup {
        %subview = memref.subview %arg2[0] [65536] [1] : memref<1048576xbf16> to memref<65536xbf16>
        %reinterpret_cast = memref.reinterpret_cast %subview to offset: [0], sizes: [256, 256], strides: [256, 1] : memref<65536xbf16> to memref<256x256xbf16>
        %subview_0 = memref.subview %arg2[524288] [65536] [1] : memref<1048576xbf16> to memref<65536xbf16, strided<[1], offset: 524288>>
        %reinterpret_cast_1 = memref.reinterpret_cast %subview_0 to offset: [0], sizes: [256, 256], strides: [256, 1] : memref<65536xbf16, strided<[1], offset: 524288>> to memref<256x256xbf16>
        aiex.run @sequence(%reinterpret_cast, %reinterpret_cast_1) : (memref<256x256xbf16>, memref<256x256xbf16>)
        %subview_2 = memref.subview %arg2[65536] [65536] [1] : memref<1048576xbf16> to memref<65536xbf16, strided<[1], offset: 65536>>
        %reinterpret_cast_3 = memref.reinterpret_cast %subview_2 to offset: [0], sizes: [256, 256], strides: [256, 1] : memref<65536xbf16, strided<[1], offset: 65536>> to memref<256x256xbf16>
        %subview_4 = memref.subview %arg2[589824] [65536] [1] : memref<1048576xbf16> to memref<65536xbf16, strided<[1], offset: 589824>>
        %reinterpret_cast_5 = memref.reinterpret_cast %subview_4 to offset: [0], sizes: [256, 256], strides: [256, 1] : memref<65536xbf16, strided<[1], offset: 589824>> to memref<256x256xbf16>
        aiex.run @sequence(%reinterpret_cast_3, %reinterpret_cast_5) : (memref<256x256xbf16>, memref<256x256xbf16>)
        %subview_6 = memref.subview %arg2[131072] [65536] [1] : memref<1048576xbf16> to memref<65536xbf16, strided<[1], offset: 131072>>
        %reinterpret_cast_7 = memref.reinterpret_cast %subview_6 to offset: [0], sizes: [256, 256], strides: [256, 1] : memref<65536xbf16, strided<[1], offset: 131072>> to memref<256x256xbf16>
        %subview_8 = memref.subview %arg2[655360] [65536] [1] : memref<1048576xbf16> to memref<65536xbf16, strided<[1], offset: 655360>>
        %reinterpret_cast_9 = memref.reinterpret_cast %subview_8 to offset: [0], sizes: [256, 256], strides: [256, 1] : memref<65536xbf16, strided<[1], offset: 655360>> to memref<256x256xbf16>
        aiex.run @sequence(%reinterpret_cast_7, %reinterpret_cast_9) : (memref<256x256xbf16>, memref<256x256xbf16>)
        %subview_10 = memref.subview %arg2[196608] [65536] [1] : memref<1048576xbf16> to memref<65536xbf16, strided<[1], offset: 196608>>
        %reinterpret_cast_11 = memref.reinterpret_cast %subview_10 to offset: [0], sizes: [256, 256], strides: [256, 1] : memref<65536xbf16, strided<[1], offset: 196608>> to memref<256x256xbf16>
        %subview_12 = memref.subview %arg2[720896] [65536] [1] : memref<1048576xbf16> to memref<65536xbf16, strided<[1], offset: 720896>>
        %reinterpret_cast_13 = memref.reinterpret_cast %subview_12 to offset: [0], sizes: [256, 256], strides: [256, 1] : memref<65536xbf16, strided<[1], offset: 720896>> to memref<256x256xbf16>
        aiex.run @sequence(%reinterpret_cast_11, %reinterpret_cast_13) : (memref<256x256xbf16>, memref<256x256xbf16>)
        %subview_14 = memref.subview %arg2[262144] [65536] [1] : memref<1048576xbf16> to memref<65536xbf16, strided<[1], offset: 262144>>
        %reinterpret_cast_15 = memref.reinterpret_cast %subview_14 to offset: [0], sizes: [256, 256], strides: [256, 1] : memref<65536xbf16, strided<[1], offset: 262144>> to memref<256x256xbf16>
        %subview_16 = memref.subview %arg2[786432] [65536] [1] : memref<1048576xbf16> to memref<65536xbf16, strided<[1], offset: 786432>>
        %reinterpret_cast_17 = memref.reinterpret_cast %subview_16 to offset: [0], sizes: [256, 256], strides: [256, 1] : memref<65536xbf16, strided<[1], offset: 786432>> to memref<256x256xbf16>
        aiex.run @sequence(%reinterpret_cast_15, %reinterpret_cast_17) : (memref<256x256xbf16>, memref<256x256xbf16>)
        %subview_18 = memref.subview %arg2[327680] [65536] [1] : memref<1048576xbf16> to memref<65536xbf16, strided<[1], offset: 327680>>
        %reinterpret_cast_19 = memref.reinterpret_cast %subview_18 to offset: [0], sizes: [256, 256], strides: [256, 1] : memref<65536xbf16, strided<[1], offset: 327680>> to memref<256x256xbf16>
        %subview_20 = memref.subview %arg2[851968] [65536] [1] : memref<1048576xbf16> to memref<65536xbf16, strided<[1], offset: 851968>>
        %reinterpret_cast_21 = memref.reinterpret_cast %subview_20 to offset: [0], sizes: [256, 256], strides: [256, 1] : memref<65536xbf16, strided<[1], offset: 851968>> to memref<256x256xbf16>
        aiex.run @sequence(%reinterpret_cast_19, %reinterpret_cast_21) : (memref<256x256xbf16>, memref<256x256xbf16>)
        %subview_22 = memref.subview %arg2[393216] [65536] [1] : memref<1048576xbf16> to memref<65536xbf16, strided<[1], offset: 393216>>
        %reinterpret_cast_23 = memref.reinterpret_cast %subview_22 to offset: [0], sizes: [256, 256], strides: [256, 1] : memref<65536xbf16, strided<[1], offset: 393216>> to memref<256x256xbf16>
        %subview_24 = memref.subview %arg2[917504] [65536] [1] : memref<1048576xbf16> to memref<65536xbf16, strided<[1], offset: 917504>>
        %reinterpret_cast_25 = memref.reinterpret_cast %subview_24 to offset: [0], sizes: [256, 256], strides: [256, 1] : memref<65536xbf16, strided<[1], offset: 917504>> to memref<256x256xbf16>
        aiex.run @sequence(%reinterpret_cast_23, %reinterpret_cast_25) : (memref<256x256xbf16>, memref<256x256xbf16>)
        %subview_26 = memref.subview %arg2[458752] [65536] [1] : memref<1048576xbf16> to memref<65536xbf16, strided<[1], offset: 458752>>
        %reinterpret_cast_27 = memref.reinterpret_cast %subview_26 to offset: [0], sizes: [256, 256], strides: [256, 1] : memref<65536xbf16, strided<[1], offset: 458752>> to memref<256x256xbf16>
        %subview_28 = memref.subview %arg2[983040] [65536] [1] : memref<1048576xbf16> to memref<65536xbf16, strided<[1], offset: 983040>>
        %reinterpret_cast_29 = memref.reinterpret_cast %subview_28 to offset: [0], sizes: [256, 256], strides: [256, 1] : memref<65536xbf16, strided<[1], offset: 983040>> to memref<256x256xbf16>
        aiex.run @sequence(%reinterpret_cast_27, %reinterpret_cast_29) : (memref<256x256xbf16>, memref<256x256xbf16>)
      }
      aiex.configure @op2__MHAStreamGroup {
        %subview = memref.subview %arg2[524288] [65536] [1] : memref<1048576xbf16> to memref<65536xbf16, strided<[1], offset: 524288>>
        %reinterpret_cast = memref.reinterpret_cast %subview to offset: [0], sizes: [256, 256], strides: [256, 1] : memref<65536xbf16, strided<[1], offset: 524288>> to memref<256x256xbf16>
        %subview_0 = memref.subview %arg0[262144] [16384] [1] : memref<393216xbf16> to memref<16384xbf16, strided<[1], offset: 262144>>
        %reinterpret_cast_1 = memref.reinterpret_cast %subview_0 to offset: [0], sizes: [256, 64], strides: [64, 1] : memref<16384xbf16, strided<[1], offset: 262144>> to memref<256x64xbf16>
        %subview_2 = memref.subview %arg1[0] [16384] [1] : memref<131072xbf16> to memref<16384xbf16>
        %reinterpret_cast_3 = memref.reinterpret_cast %subview_2 to offset: [0], sizes: [256, 64], strides: [64, 1] : memref<16384xbf16> to memref<256x64xbf16>
        aiex.run @sequence(%reinterpret_cast, %reinterpret_cast_1, %reinterpret_cast_3) : (memref<256x256xbf16>, memref<256x64xbf16>, memref<256x64xbf16>)
        %subview_4 = memref.subview %arg2[589824] [65536] [1] : memref<1048576xbf16> to memref<65536xbf16, strided<[1], offset: 589824>>
        %reinterpret_cast_5 = memref.reinterpret_cast %subview_4 to offset: [0], sizes: [256, 256], strides: [256, 1] : memref<65536xbf16, strided<[1], offset: 589824>> to memref<256x256xbf16>
        %subview_6 = memref.subview %arg0[278528] [16384] [1] : memref<393216xbf16> to memref<16384xbf16, strided<[1], offset: 278528>>
        %reinterpret_cast_7 = memref.reinterpret_cast %subview_6 to offset: [0], sizes: [256, 64], strides: [64, 1] : memref<16384xbf16, strided<[1], offset: 278528>> to memref<256x64xbf16>
        %subview_8 = memref.subview %arg1[16384] [16384] [1] : memref<131072xbf16> to memref<16384xbf16, strided<[1], offset: 16384>>
        %reinterpret_cast_9 = memref.reinterpret_cast %subview_8 to offset: [0], sizes: [256, 64], strides: [64, 1] : memref<16384xbf16, strided<[1], offset: 16384>> to memref<256x64xbf16>
        aiex.run @sequence(%reinterpret_cast_5, %reinterpret_cast_7, %reinterpret_cast_9) : (memref<256x256xbf16>, memref<256x64xbf16>, memref<256x64xbf16>)
        %subview_10 = memref.subview %arg2[655360] [65536] [1] : memref<1048576xbf16> to memref<65536xbf16, strided<[1], offset: 655360>>
        %reinterpret_cast_11 = memref.reinterpret_cast %subview_10 to offset: [0], sizes: [256, 256], strides: [256, 1] : memref<65536xbf16, strided<[1], offset: 655360>> to memref<256x256xbf16>
        %subview_12 = memref.subview %arg0[294912] [16384] [1] : memref<393216xbf16> to memref<16384xbf16, strided<[1], offset: 294912>>
        %reinterpret_cast_13 = memref.reinterpret_cast %subview_12 to offset: [0], sizes: [256, 64], strides: [64, 1] : memref<16384xbf16, strided<[1], offset: 294912>> to memref<256x64xbf16>
        %subview_14 = memref.subview %arg1[32768] [16384] [1] : memref<131072xbf16> to memref<16384xbf16, strided<[1], offset: 32768>>
        %reinterpret_cast_15 = memref.reinterpret_cast %subview_14 to offset: [0], sizes: [256, 64], strides: [64, 1] : memref<16384xbf16, strided<[1], offset: 32768>> to memref<256x64xbf16>
        aiex.run @sequence(%reinterpret_cast_11, %reinterpret_cast_13, %reinterpret_cast_15) : (memref<256x256xbf16>, memref<256x64xbf16>, memref<256x64xbf16>)
        %subview_16 = memref.subview %arg2[720896] [65536] [1] : memref<1048576xbf16> to memref<65536xbf16, strided<[1], offset: 720896>>
        %reinterpret_cast_17 = memref.reinterpret_cast %subview_16 to offset: [0], sizes: [256, 256], strides: [256, 1] : memref<65536xbf16, strided<[1], offset: 720896>> to memref<256x256xbf16>
        %subview_18 = memref.subview %arg0[311296] [16384] [1] : memref<393216xbf16> to memref<16384xbf16, strided<[1], offset: 311296>>
        %reinterpret_cast_19 = memref.reinterpret_cast %subview_18 to offset: [0], sizes: [256, 64], strides: [64, 1] : memref<16384xbf16, strided<[1], offset: 311296>> to memref<256x64xbf16>
        %subview_20 = memref.subview %arg1[49152] [16384] [1] : memref<131072xbf16> to memref<16384xbf16, strided<[1], offset: 49152>>
        %reinterpret_cast_21 = memref.reinterpret_cast %subview_20 to offset: [0], sizes: [256, 64], strides: [64, 1] : memref<16384xbf16, strided<[1], offset: 49152>> to memref<256x64xbf16>
        aiex.run @sequence(%reinterpret_cast_17, %reinterpret_cast_19, %reinterpret_cast_21) : (memref<256x256xbf16>, memref<256x64xbf16>, memref<256x64xbf16>)
        %subview_22 = memref.subview %arg2[786432] [65536] [1] : memref<1048576xbf16> to memref<65536xbf16, strided<[1], offset: 786432>>
        %reinterpret_cast_23 = memref.reinterpret_cast %subview_22 to offset: [0], sizes: [256, 256], strides: [256, 1] : memref<65536xbf16, strided<[1], offset: 786432>> to memref<256x256xbf16>
        %subview_24 = memref.subview %arg0[327680] [16384] [1] : memref<393216xbf16> to memref<16384xbf16, strided<[1], offset: 327680>>
        %reinterpret_cast_25 = memref.reinterpret_cast %subview_24 to offset: [0], sizes: [256, 64], strides: [64, 1] : memref<16384xbf16, strided<[1], offset: 327680>> to memref<256x64xbf16>
        %subview_26 = memref.subview %arg1[65536] [16384] [1] : memref<131072xbf16> to memref<16384xbf16, strided<[1], offset: 65536>>
        %reinterpret_cast_27 = memref.reinterpret_cast %subview_26 to offset: [0], sizes: [256, 64], strides: [64, 1] : memref<16384xbf16, strided<[1], offset: 65536>> to memref<256x64xbf16>
        aiex.run @sequence(%reinterpret_cast_23, %reinterpret_cast_25, %reinterpret_cast_27) : (memref<256x256xbf16>, memref<256x64xbf16>, memref<256x64xbf16>)
        %subview_28 = memref.subview %arg2[851968] [65536] [1] : memref<1048576xbf16> to memref<65536xbf16, strided<[1], offset: 851968>>
        %reinterpret_cast_29 = memref.reinterpret_cast %subview_28 to offset: [0], sizes: [256, 256], strides: [256, 1] : memref<65536xbf16, strided<[1], offset: 851968>> to memref<256x256xbf16>
        %subview_30 = memref.subview %arg0[344064] [16384] [1] : memref<393216xbf16> to memref<16384xbf16, strided<[1], offset: 344064>>
        %reinterpret_cast_31 = memref.reinterpret_cast %subview_30 to offset: [0], sizes: [256, 64], strides: [64, 1] : memref<16384xbf16, strided<[1], offset: 344064>> to memref<256x64xbf16>
        %subview_32 = memref.subview %arg1[81920] [16384] [1] : memref<131072xbf16> to memref<16384xbf16, strided<[1], offset: 81920>>
        %reinterpret_cast_33 = memref.reinterpret_cast %subview_32 to offset: [0], sizes: [256, 64], strides: [64, 1] : memref<16384xbf16, strided<[1], offset: 81920>> to memref<256x64xbf16>
        aiex.run @sequence(%reinterpret_cast_29, %reinterpret_cast_31, %reinterpret_cast_33) : (memref<256x256xbf16>, memref<256x64xbf16>, memref<256x64xbf16>)
        %subview_34 = memref.subview %arg2[917504] [65536] [1] : memref<1048576xbf16> to memref<65536xbf16, strided<[1], offset: 917504>>
        %reinterpret_cast_35 = memref.reinterpret_cast %subview_34 to offset: [0], sizes: [256, 256], strides: [256, 1] : memref<65536xbf16, strided<[1], offset: 917504>> to memref<256x256xbf16>
        %subview_36 = memref.subview %arg0[360448] [16384] [1] : memref<393216xbf16> to memref<16384xbf16, strided<[1], offset: 360448>>
        %reinterpret_cast_37 = memref.reinterpret_cast %subview_36 to offset: [0], sizes: [256, 64], strides: [64, 1] : memref<16384xbf16, strided<[1], offset: 360448>> to memref<256x64xbf16>
        %subview_38 = memref.subview %arg1[98304] [16384] [1] : memref<131072xbf16> to memref<16384xbf16, strided<[1], offset: 98304>>
        %reinterpret_cast_39 = memref.reinterpret_cast %subview_38 to offset: [0], sizes: [256, 64], strides: [64, 1] : memref<16384xbf16, strided<[1], offset: 98304>> to memref<256x64xbf16>
        aiex.run @sequence(%reinterpret_cast_35, %reinterpret_cast_37, %reinterpret_cast_39) : (memref<256x256xbf16>, memref<256x64xbf16>, memref<256x64xbf16>)
        %subview_40 = memref.subview %arg2[983040] [65536] [1] : memref<1048576xbf16> to memref<65536xbf16, strided<[1], offset: 983040>>
        %reinterpret_cast_41 = memref.reinterpret_cast %subview_40 to offset: [0], sizes: [256, 256], strides: [256, 1] : memref<65536xbf16, strided<[1], offset: 983040>> to memref<256x256xbf16>
        %subview_42 = memref.subview %arg0[376832] [16384] [1] : memref<393216xbf16> to memref<16384xbf16, strided<[1], offset: 376832>>
        %reinterpret_cast_43 = memref.reinterpret_cast %subview_42 to offset: [0], sizes: [256, 64], strides: [64, 1] : memref<16384xbf16, strided<[1], offset: 376832>> to memref<256x64xbf16>
        %subview_44 = memref.subview %arg1[114688] [16384] [1] : memref<131072xbf16> to memref<16384xbf16, strided<[1], offset: 114688>>
        %reinterpret_cast_45 = memref.reinterpret_cast %subview_44 to offset: [0], sizes: [256, 64], strides: [64, 1] : memref<16384xbf16, strided<[1], offset: 114688>> to memref<256x64xbf16>
        aiex.run @sequence(%reinterpret_cast_41, %reinterpret_cast_43, %reinterpret_cast_45) : (memref<256x256xbf16>, memref<256x64xbf16>, memref<256x64xbf16>)
      }
      aiex.configure @reset_device {
      }
    }
  }
}
