module {
  aie.device(npu2) @op0__MHAStreamGroup {
    %shim_noc_tile_0_0 = aie.tile(0, 0)
    %shim_noc_tile_3_0 = aie.tile(3, 0)
    %shim_noc_tile_6_0 = aie.tile(6, 0)
    %mem_tile_0_1 = aie.tile(0, 1)
    %mem_tile_3_1 = aie.tile(3, 1)
    %tile_0_2 = aie.tile(0, 2)
    %tile_0_3 = aie.tile(0, 3)
    %tile_0_4 = aie.tile(0, 4)
    %tile_0_5 = aie.tile(0, 5)
    %mem_tile_6_1 = aie.tile(6, 1)
    aie.runtime_sequence(%arg0: memref<512x64xbf16>, %arg1: memref<64x512xbf16>, %arg2: memref<512x512xbf16>) {
      %0 = aiex.dma_configure_task_for @of_0_mem {
        aie.dma_bd(%arg0 : memref<512x64xbf16> offset = 0 len = 32768 sizes = [1, 1, 128, 256] strides = [0, 0, 256, 1])
        aie.end
      } {issue_token = true, iteration_t = 0 : index}
      aiex.dma_start_task(%0)
      %1 = aiex.dma_configure_task_for @of_1_mem {
        aie.dma_bd(%arg1 : memref<64x512xbf16> offset = 0 len = 32768 sizes = [1, 8, 64, 64] strides = [0, 64, 512, 1])
        aie.end
      } {issue_token = true, iteration_t = 0 : index}
      aiex.dma_start_task(%1)
      %2 = aiex.dma_configure_task_for @of_5_mem {
        aie.dma_bd(%arg2 : memref<512x512xbf16> offset = 0 len = 262144 sizes = [1, 8, 512, 64] strides = [0, 64, 512, 1])
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
        %0 = aie.objectfifo.acquire @of_2_distribute_0_0(Consume, 1) : !aie.objectfifosubview<memref<128x64xbf16>>
        %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<128x64xbf16>> -> memref<128x64xbf16>
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c8 = arith.constant 8 : index
        scf.for %arg1 = %c0_0 to %c8 step %c1_1 {
          %2 = aie.objectfifo.acquire @of_4_join_0_0(Produce, 1) : !aie.objectfifosubview<memref<128x64xbf16>>
          %3 = aie.objectfifo.subview.access %2[0] : !aie.objectfifosubview<memref<128x64xbf16>> -> memref<128x64xbf16>
          func.call @op0_zero_bf16_128_64_64(%3) : (memref<128x64xbf16>) -> ()
          %4 = aie.objectfifo.acquire @of_3_broadcast_0_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
          %5 = aie.objectfifo.subview.access %4[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
          func.call @op0_matmul_bf16_bf16_128_64_64(%1, %5, %3) : (memref<128x64xbf16>, memref<64x64xbf16>, memref<128x64xbf16>) -> ()
          aie.objectfifo.release @of_3_broadcast_0_0(Consume, 1)
          aie.objectfifo.release @of_4_join_0_0(Produce, 1)
        }
        aie.objectfifo.release @of_2_distribute_0_0(Consume, 1)
      }
      aie.end
    } {link_with = "op0_mm_128_64_64.o"}
    %core_0_3 = aie.core(%tile_0_3) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %0 = aie.objectfifo.acquire @of_2_distribute_0_1(Consume, 1) : !aie.objectfifosubview<memref<128x64xbf16>>
        %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<128x64xbf16>> -> memref<128x64xbf16>
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c8 = arith.constant 8 : index
        scf.for %arg1 = %c0_0 to %c8 step %c1_1 {
          %2 = aie.objectfifo.acquire @of_4_join_0_1(Produce, 1) : !aie.objectfifosubview<memref<128x64xbf16>>
          %3 = aie.objectfifo.subview.access %2[0] : !aie.objectfifosubview<memref<128x64xbf16>> -> memref<128x64xbf16>
          func.call @op0_zero_bf16_128_64_64(%3) : (memref<128x64xbf16>) -> ()
          %4 = aie.objectfifo.acquire @of_3_broadcast_0_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
          %5 = aie.objectfifo.subview.access %4[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
          func.call @op0_matmul_bf16_bf16_128_64_64(%1, %5, %3) : (memref<128x64xbf16>, memref<64x64xbf16>, memref<128x64xbf16>) -> ()
          aie.objectfifo.release @of_3_broadcast_0_0(Consume, 1)
          aie.objectfifo.release @of_4_join_0_1(Produce, 1)
        }
        aie.objectfifo.release @of_2_distribute_0_1(Consume, 1)
      }
      aie.end
    } {link_with = "op0_mm_128_64_64.o"}
    %core_0_4 = aie.core(%tile_0_4) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %0 = aie.objectfifo.acquire @of_2_distribute_0_2(Consume, 1) : !aie.objectfifosubview<memref<128x64xbf16>>
        %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<128x64xbf16>> -> memref<128x64xbf16>
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c8 = arith.constant 8 : index
        scf.for %arg1 = %c0_0 to %c8 step %c1_1 {
          %2 = aie.objectfifo.acquire @of_4_join_0_2(Produce, 1) : !aie.objectfifosubview<memref<128x64xbf16>>
          %3 = aie.objectfifo.subview.access %2[0] : !aie.objectfifosubview<memref<128x64xbf16>> -> memref<128x64xbf16>
          func.call @op0_zero_bf16_128_64_64(%3) : (memref<128x64xbf16>) -> ()
          %4 = aie.objectfifo.acquire @of_3_broadcast_0_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
          %5 = aie.objectfifo.subview.access %4[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
          func.call @op0_matmul_bf16_bf16_128_64_64(%1, %5, %3) : (memref<128x64xbf16>, memref<64x64xbf16>, memref<128x64xbf16>) -> ()
          aie.objectfifo.release @of_3_broadcast_0_0(Consume, 1)
          aie.objectfifo.release @of_4_join_0_2(Produce, 1)
        }
        aie.objectfifo.release @of_2_distribute_0_2(Consume, 1)
      }
      aie.end
    } {link_with = "op0_mm_128_64_64.o"}
    %core_0_5 = aie.core(%tile_0_5) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %0 = aie.objectfifo.acquire @of_2_distribute_0_3(Consume, 1) : !aie.objectfifosubview<memref<128x64xbf16>>
        %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<128x64xbf16>> -> memref<128x64xbf16>
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c8 = arith.constant 8 : index
        scf.for %arg1 = %c0_0 to %c8 step %c1_1 {
          %2 = aie.objectfifo.acquire @of_4_join_0_3(Produce, 1) : !aie.objectfifosubview<memref<128x64xbf16>>
          %3 = aie.objectfifo.subview.access %2[0] : !aie.objectfifosubview<memref<128x64xbf16>> -> memref<128x64xbf16>
          func.call @op0_zero_bf16_128_64_64(%3) : (memref<128x64xbf16>) -> ()
          %4 = aie.objectfifo.acquire @of_3_broadcast_0_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
          %5 = aie.objectfifo.subview.access %4[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
          func.call @op0_matmul_bf16_bf16_128_64_64(%1, %5, %3) : (memref<128x64xbf16>, memref<64x64xbf16>, memref<128x64xbf16>) -> ()
          aie.objectfifo.release @of_3_broadcast_0_0(Consume, 1)
          aie.objectfifo.release @of_4_join_0_3(Produce, 1)
        }
        aie.objectfifo.release @of_2_distribute_0_3(Consume, 1)
      }
      aie.end
    } {link_with = "op0_mm_128_64_64.o"}
    aie.objectfifo @of_0_mem(%shim_noc_tile_0_0, {%mem_tile_0_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<4x128x64xbf16>>  
    aie.objectfifo @of_1_mem(%shim_noc_tile_3_0, {%mem_tile_3_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_2_distribute_0_0(%mem_tile_0_1 dimensionsToStream [<size = 16, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%tile_0_2}, [2 : i32, 1 : i32]) : !aie.objectfifo<memref<128x64xbf16>>  
    aie.objectfifo @of_2_distribute_0_1(%mem_tile_0_1 dimensionsToStream [<size = 16, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%tile_0_3}, [2 : i32, 1 : i32]) : !aie.objectfifo<memref<128x64xbf16>>  
    aie.objectfifo @of_2_distribute_0_2(%mem_tile_0_1 dimensionsToStream [<size = 16, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%tile_0_4}, [2 : i32, 1 : i32]) : !aie.objectfifo<memref<128x64xbf16>>  
    aie.objectfifo @of_2_distribute_0_3(%mem_tile_0_1 dimensionsToStream [<size = 16, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%tile_0_5}, [2 : i32, 1 : i32]) : !aie.objectfifo<memref<128x64xbf16>>  
    aie.objectfifo.link [@of_0_mem] -> [@of_2_distribute_0_0, @of_2_distribute_0_1, @of_2_distribute_0_2, @of_2_distribute_0_3]([] [0, 8192, 16384, 24576])
    aie.objectfifo @of_3_broadcast_0_0(%mem_tile_3_1 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%tile_0_2, %tile_0_3, %tile_0_4, %tile_0_5}, [2 : i32, 2 : i32, 2 : i32, 2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo.link [@of_1_mem] -> [@of_3_broadcast_0_0]([] [])
    aie.objectfifo @of_4_join_0_0(%tile_0_2, {%mem_tile_6_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<128x64xbf16>>  
    aie.objectfifo @of_4_join_0_1(%tile_0_3, {%mem_tile_6_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<128x64xbf16>>  
    aie.objectfifo @of_4_join_0_2(%tile_0_4, {%mem_tile_6_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<128x64xbf16>>  
    aie.objectfifo @of_4_join_0_3(%tile_0_5, {%mem_tile_6_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<128x64xbf16>>  
    aie.objectfifo @of_5_mem(%mem_tile_6_1 dimensionsToStream [<size = 16, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%shim_noc_tile_6_0}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<4x128x64xbf16>>  
    aie.objectfifo.link [@of_4_join_0_0, @of_4_join_0_1, @of_4_join_0_2, @of_4_join_0_3] -> [@of_5_mem]([0, 8192, 16384, 24576] [])
    func.func private @op0_zero_bf16_128_64_64(memref<128x64xbf16>)
    func.func private @op0_matmul_bf16_bf16_128_64_64(memref<128x64xbf16>, memref<64x64xbf16>, memref<128x64xbf16>)
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
    aie.runtime_sequence(%arg0: memref<512x512xbf16>, %arg1: memref<512x512xbf16>) {
      %0 = aiex.dma_configure_task_for @of_0_mem {
        aie.dma_bd(%arg0 : memref<512x512xbf16> offset = 0 len = 262144 sizes = [1, 1, 512, 512] strides = [0, 0, 512, 1])
        aie.end
      } {issue_token = true, iteration_t = 0 : index}
      aiex.dma_start_task(%0)
      %1 = aiex.dma_configure_task_for @of_3_mem {
        aie.dma_bd(%arg1 : memref<512x512xbf16> offset = 0 len = 262144 sizes = [1, 1, 512, 512] strides = [0, 0, 512, 1])
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
        %c128 = arith.constant 128 : index
        scf.for %arg1 = %c0_0 to %c128 step %c1_1 {
          %0 = aie.objectfifo.acquire @of_2_join_0_0(Produce, 1) : !aie.objectfifosubview<memref<1x512xbf16>>
          %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<1x512xbf16>> -> memref<1x512xbf16>
          %2 = aie.objectfifo.acquire @of_1_distribute_0_0(Consume, 1) : !aie.objectfifosubview<memref<1x512xbf16>>
          %3 = aie.objectfifo.subview.access %2[0] : !aie.objectfifosubview<memref<1x512xbf16>> -> memref<1x512xbf16>
          %c1_i32 = arith.constant 1 : i32
          %c512_i32 = arith.constant 512 : i32
          %4 = arith.index_cast %arg1 : index to i32
          %c4_i32 = arith.constant 4 : i32
          %5 = arith.muli %4, %c4_i32 : i32
          %c0_i32 = arith.constant 0 : i32
          %6 = arith.addi %c0_i32, %5 : i32
          func.call @op1_softmax_rows_causal_bf16(%3, %1, %c1_i32, %c512_i32, %6) : (memref<1x512xbf16>, memref<1x512xbf16>, i32, i32, i32) -> ()
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
        %c128 = arith.constant 128 : index
        scf.for %arg1 = %c0_0 to %c128 step %c1_1 {
          %0 = aie.objectfifo.acquire @of_2_join_0_1(Produce, 1) : !aie.objectfifosubview<memref<1x512xbf16>>
          %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<1x512xbf16>> -> memref<1x512xbf16>
          %2 = aie.objectfifo.acquire @of_1_distribute_0_1(Consume, 1) : !aie.objectfifosubview<memref<1x512xbf16>>
          %3 = aie.objectfifo.subview.access %2[0] : !aie.objectfifosubview<memref<1x512xbf16>> -> memref<1x512xbf16>
          %c1_i32 = arith.constant 1 : i32
          %c512_i32 = arith.constant 512 : i32
          %4 = arith.index_cast %arg1 : index to i32
          %c4_i32 = arith.constant 4 : i32
          %5 = arith.muli %4, %c4_i32 : i32
          %c1_i32_2 = arith.constant 1 : i32
          %6 = arith.addi %c1_i32_2, %5 : i32
          func.call @op1_softmax_rows_causal_bf16(%3, %1, %c1_i32, %c512_i32, %6) : (memref<1x512xbf16>, memref<1x512xbf16>, i32, i32, i32) -> ()
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
        %c128 = arith.constant 128 : index
        scf.for %arg1 = %c0_0 to %c128 step %c1_1 {
          %0 = aie.objectfifo.acquire @of_2_join_0_2(Produce, 1) : !aie.objectfifosubview<memref<1x512xbf16>>
          %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<1x512xbf16>> -> memref<1x512xbf16>
          %2 = aie.objectfifo.acquire @of_1_distribute_0_2(Consume, 1) : !aie.objectfifosubview<memref<1x512xbf16>>
          %3 = aie.objectfifo.subview.access %2[0] : !aie.objectfifosubview<memref<1x512xbf16>> -> memref<1x512xbf16>
          %c1_i32 = arith.constant 1 : i32
          %c512_i32 = arith.constant 512 : i32
          %4 = arith.index_cast %arg1 : index to i32
          %c4_i32 = arith.constant 4 : i32
          %5 = arith.muli %4, %c4_i32 : i32
          %c2_i32 = arith.constant 2 : i32
          %6 = arith.addi %c2_i32, %5 : i32
          func.call @op1_softmax_rows_causal_bf16(%3, %1, %c1_i32, %c512_i32, %6) : (memref<1x512xbf16>, memref<1x512xbf16>, i32, i32, i32) -> ()
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
        %c128 = arith.constant 128 : index
        scf.for %arg1 = %c0_0 to %c128 step %c1_1 {
          %0 = aie.objectfifo.acquire @of_2_join_0_3(Produce, 1) : !aie.objectfifosubview<memref<1x512xbf16>>
          %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<1x512xbf16>> -> memref<1x512xbf16>
          %2 = aie.objectfifo.acquire @of_1_distribute_0_3(Consume, 1) : !aie.objectfifosubview<memref<1x512xbf16>>
          %3 = aie.objectfifo.subview.access %2[0] : !aie.objectfifosubview<memref<1x512xbf16>> -> memref<1x512xbf16>
          %c1_i32 = arith.constant 1 : i32
          %c512_i32 = arith.constant 512 : i32
          %4 = arith.index_cast %arg1 : index to i32
          %c4_i32 = arith.constant 4 : i32
          %5 = arith.muli %4, %c4_i32 : i32
          %c3_i32 = arith.constant 3 : i32
          %6 = arith.addi %c3_i32, %5 : i32
          func.call @op1_softmax_rows_causal_bf16(%3, %1, %c1_i32, %c512_i32, %6) : (memref<1x512xbf16>, memref<1x512xbf16>, i32, i32, i32) -> ()
          aie.objectfifo.release @of_1_distribute_0_3(Consume, 1)
          aie.objectfifo.release @of_2_join_0_3(Produce, 1)
        }
      }
      aie.end
    } {link_with = "op1_softmax.o"}
    aie.objectfifo @of_0_mem(%shim_noc_tile_1_0, {%mem_tile_1_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<4x1x512xbf16>>  
    aie.objectfifo @of_1_distribute_0_0(%mem_tile_1_1, {%tile_0_2}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<1x512xbf16>>  
    aie.objectfifo @of_1_distribute_0_1(%mem_tile_1_1, {%tile_0_3}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<1x512xbf16>>  
    aie.objectfifo @of_1_distribute_0_2(%mem_tile_1_1, {%tile_0_4}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<1x512xbf16>>  
    aie.objectfifo @of_1_distribute_0_3(%mem_tile_1_1, {%tile_0_5}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<1x512xbf16>>  
    aie.objectfifo.link [@of_0_mem] -> [@of_1_distribute_0_0, @of_1_distribute_0_1, @of_1_distribute_0_2, @of_1_distribute_0_3]([] [0, 512, 1024, 1536])
    aie.objectfifo @of_2_join_0_0(%tile_0_2, {%mem_tile_0_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<1x512xbf16>>  
    aie.objectfifo @of_2_join_0_1(%tile_0_3, {%mem_tile_0_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<1x512xbf16>>  
    aie.objectfifo @of_2_join_0_2(%tile_0_4, {%mem_tile_0_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<1x512xbf16>>  
    aie.objectfifo @of_2_join_0_3(%tile_0_5, {%mem_tile_0_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<1x512xbf16>>  
    aie.objectfifo @of_3_mem(%mem_tile_0_1, {%shim_noc_tile_0_0}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<4x1x512xbf16>>  
    aie.objectfifo.link [@of_2_join_0_0, @of_2_join_0_1, @of_2_join_0_2, @of_2_join_0_3] -> [@of_3_mem]([0, 512, 1024, 1536] [])
    func.func private @op1_softmax_rows_causal_bf16(memref<1x512xbf16>, memref<1x512xbf16>, i32, i32, i32)
  }
  aie.device(npu2) @op2__MHAStreamGroup {
    %shim_noc_tile_1_0 = aie.tile(1, 0)
    %shim_noc_tile_3_0 = aie.tile(3, 0)
    %shim_noc_tile_7_0 = aie.tile(7, 0)
    %mem_tile_7_1 = aie.tile(7, 1)
    %mem_tile_3_1 = aie.tile(3, 1)
    %tile_0_2 = aie.tile(0, 2)
    %tile_0_3 = aie.tile(0, 3)
    %tile_0_4 = aie.tile(0, 4)
    %tile_0_5 = aie.tile(0, 5)
    %mem_tile_1_1 = aie.tile(1, 1)
    aie.runtime_sequence(%arg0: memref<512x512xbf16>, %arg1: memref<512x64xbf16>, %arg2: memref<512x64xbf16>) {
      %0 = aiex.dma_configure_task_for @of_0_mem {
        aie.dma_bd(%arg0 : memref<512x512xbf16> offset = 0 len = 262144 sizes = [1, 8, 512, 64] strides = [0, 64, 512, 1])
        aie.end
      } {issue_token = true, iteration_t = 0 : index}
      aiex.dma_start_task(%0)
      %1 = aiex.dma_configure_task_for @of_1_mem {
        aie.dma_bd(%arg1 : memref<512x64xbf16> offset = 0 len = 32768 sizes = [1, 1, 128, 256] strides = [0, 0, 256, 1])
        aie.end
      } {issue_token = true, iteration_t = 0 : index}
      aiex.dma_start_task(%1)
      %2 = aiex.dma_configure_task_for @of_5_mem {
        aie.dma_bd(%arg2 : memref<512x64xbf16> offset = 0 len = 32768 sizes = [1, 1, 128, 256] strides = [0, 0, 256, 1])
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
        %0 = aie.objectfifo.acquire @of_4_join_0_0(Produce, 1) : !aie.objectfifosubview<memref<128x64xbf16>>
        %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<128x64xbf16>> -> memref<128x64xbf16>
        func.call @op2_zero_bf16_128_64_64(%1) : (memref<128x64xbf16>) -> ()
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c8 = arith.constant 8 : index
        scf.for %arg1 = %c0_0 to %c8 step %c1_1 {
          %2 = aie.objectfifo.acquire @of_3_broadcast_0_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
          %3 = aie.objectfifo.subview.access %2[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
          %4 = aie.objectfifo.acquire @of_2_distribute_0_0(Consume, 1) : !aie.objectfifosubview<memref<128x64xbf16>>
          %5 = aie.objectfifo.subview.access %4[0] : !aie.objectfifosubview<memref<128x64xbf16>> -> memref<128x64xbf16>
          func.call @op2_matmul_bf16_bf16_128_64_64(%5, %3, %1) : (memref<128x64xbf16>, memref<64x64xbf16>, memref<128x64xbf16>) -> ()
          aie.objectfifo.release @of_2_distribute_0_0(Consume, 1)
          aie.objectfifo.release @of_3_broadcast_0_0(Consume, 1)
        }
        aie.objectfifo.release @of_4_join_0_0(Produce, 1)
      }
      aie.end
    } {link_with = "op2_mm_128_64_64.o"}
    %core_0_3 = aie.core(%tile_0_3) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %0 = aie.objectfifo.acquire @of_4_join_0_1(Produce, 1) : !aie.objectfifosubview<memref<128x64xbf16>>
        %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<128x64xbf16>> -> memref<128x64xbf16>
        func.call @op2_zero_bf16_128_64_64(%1) : (memref<128x64xbf16>) -> ()
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c8 = arith.constant 8 : index
        scf.for %arg1 = %c0_0 to %c8 step %c1_1 {
          %2 = aie.objectfifo.acquire @of_3_broadcast_0_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
          %3 = aie.objectfifo.subview.access %2[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
          %4 = aie.objectfifo.acquire @of_2_distribute_0_1(Consume, 1) : !aie.objectfifosubview<memref<128x64xbf16>>
          %5 = aie.objectfifo.subview.access %4[0] : !aie.objectfifosubview<memref<128x64xbf16>> -> memref<128x64xbf16>
          func.call @op2_matmul_bf16_bf16_128_64_64(%5, %3, %1) : (memref<128x64xbf16>, memref<64x64xbf16>, memref<128x64xbf16>) -> ()
          aie.objectfifo.release @of_2_distribute_0_1(Consume, 1)
          aie.objectfifo.release @of_3_broadcast_0_0(Consume, 1)
        }
        aie.objectfifo.release @of_4_join_0_1(Produce, 1)
      }
      aie.end
    } {link_with = "op2_mm_128_64_64.o"}
    %core_0_4 = aie.core(%tile_0_4) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %0 = aie.objectfifo.acquire @of_4_join_0_2(Produce, 1) : !aie.objectfifosubview<memref<128x64xbf16>>
        %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<128x64xbf16>> -> memref<128x64xbf16>
        func.call @op2_zero_bf16_128_64_64(%1) : (memref<128x64xbf16>) -> ()
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c8 = arith.constant 8 : index
        scf.for %arg1 = %c0_0 to %c8 step %c1_1 {
          %2 = aie.objectfifo.acquire @of_3_broadcast_0_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
          %3 = aie.objectfifo.subview.access %2[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
          %4 = aie.objectfifo.acquire @of_2_distribute_0_2(Consume, 1) : !aie.objectfifosubview<memref<128x64xbf16>>
          %5 = aie.objectfifo.subview.access %4[0] : !aie.objectfifosubview<memref<128x64xbf16>> -> memref<128x64xbf16>
          func.call @op2_matmul_bf16_bf16_128_64_64(%5, %3, %1) : (memref<128x64xbf16>, memref<64x64xbf16>, memref<128x64xbf16>) -> ()
          aie.objectfifo.release @of_2_distribute_0_2(Consume, 1)
          aie.objectfifo.release @of_3_broadcast_0_0(Consume, 1)
        }
        aie.objectfifo.release @of_4_join_0_2(Produce, 1)
      }
      aie.end
    } {link_with = "op2_mm_128_64_64.o"}
    %core_0_5 = aie.core(%tile_0_5) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %0 = aie.objectfifo.acquire @of_4_join_0_3(Produce, 1) : !aie.objectfifosubview<memref<128x64xbf16>>
        %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<128x64xbf16>> -> memref<128x64xbf16>
        func.call @op2_zero_bf16_128_64_64(%1) : (memref<128x64xbf16>) -> ()
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c8 = arith.constant 8 : index
        scf.for %arg1 = %c0_0 to %c8 step %c1_1 {
          %2 = aie.objectfifo.acquire @of_3_broadcast_0_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
          %3 = aie.objectfifo.subview.access %2[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
          %4 = aie.objectfifo.acquire @of_2_distribute_0_3(Consume, 1) : !aie.objectfifosubview<memref<128x64xbf16>>
          %5 = aie.objectfifo.subview.access %4[0] : !aie.objectfifosubview<memref<128x64xbf16>> -> memref<128x64xbf16>
          func.call @op2_matmul_bf16_bf16_128_64_64(%5, %3, %1) : (memref<128x64xbf16>, memref<64x64xbf16>, memref<128x64xbf16>) -> ()
          aie.objectfifo.release @of_2_distribute_0_3(Consume, 1)
          aie.objectfifo.release @of_3_broadcast_0_0(Consume, 1)
        }
        aie.objectfifo.release @of_4_join_0_3(Produce, 1)
      }
      aie.end
    } {link_with = "op2_mm_128_64_64.o"}
    aie.objectfifo @of_0_mem(%shim_noc_tile_7_0, {%mem_tile_7_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<4x128x64xbf16>>  
    aie.objectfifo @of_1_mem(%shim_noc_tile_3_0, {%mem_tile_3_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_2_distribute_0_0(%mem_tile_7_1 dimensionsToStream [<size = 16, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%tile_0_2}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<128x64xbf16>>  
    aie.objectfifo @of_2_distribute_0_1(%mem_tile_7_1 dimensionsToStream [<size = 16, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%tile_0_3}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<128x64xbf16>>  
    aie.objectfifo @of_2_distribute_0_2(%mem_tile_7_1 dimensionsToStream [<size = 16, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%tile_0_4}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<128x64xbf16>>  
    aie.objectfifo @of_2_distribute_0_3(%mem_tile_7_1 dimensionsToStream [<size = 16, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%tile_0_5}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<128x64xbf16>>  
    aie.objectfifo.link [@of_0_mem] -> [@of_2_distribute_0_0, @of_2_distribute_0_1, @of_2_distribute_0_2, @of_2_distribute_0_3]([] [0, 8192, 16384, 24576])
    aie.objectfifo @of_3_broadcast_0_0(%mem_tile_3_1 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%tile_0_2, %tile_0_3, %tile_0_4, %tile_0_5}, [2 : i32, 2 : i32, 2 : i32, 2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo.link [@of_1_mem] -> [@of_3_broadcast_0_0]([] [])
    aie.objectfifo @of_4_join_0_0(%tile_0_2, {%mem_tile_1_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<128x64xbf16>>  
    aie.objectfifo @of_4_join_0_1(%tile_0_3, {%mem_tile_1_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<128x64xbf16>>  
    aie.objectfifo @of_4_join_0_2(%tile_0_4, {%mem_tile_1_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<128x64xbf16>>  
    aie.objectfifo @of_4_join_0_3(%tile_0_5, {%mem_tile_1_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<128x64xbf16>>  
    aie.objectfifo @of_5_mem(%mem_tile_1_1 dimensionsToStream [<size = 16, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%shim_noc_tile_1_0}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<4x128x64xbf16>>  
    aie.objectfifo.link [@of_4_join_0_0, @of_4_join_0_1, @of_4_join_0_2, @of_4_join_0_3] -> [@of_5_mem]([0, 8192, 16384, 24576] [])
    func.func private @op2_zero_bf16_128_64_64(memref<128x64xbf16>)
    func.func private @op2_matmul_bf16_bf16_128_64_64(memref<128x64xbf16>, memref<64x64xbf16>, memref<128x64xbf16>)
  }
  aie.device(npu2) @reset_device {
    aie.runtime_sequence() {
    }
  }
  aie.device(npu2) {
    aie.runtime_sequence(%arg0: memref<196608xbf16>, %arg1: memref<65536xbf16>, %arg2: memref<1048576xbf16>) {
      aiex.configure @op0__MHAStreamGroup {
        %subview = memref.subview %arg0[0] [32768] [1] : memref<196608xbf16> to memref<32768xbf16>
        %reinterpret_cast = memref.reinterpret_cast %subview to offset: [0], sizes: [512, 64], strides: [64, 1] : memref<32768xbf16> to memref<512x64xbf16>
        %subview_0 = memref.subview %arg0[65536] [32768] [1] : memref<196608xbf16> to memref<32768xbf16, strided<[1], offset: 65536>>
        %reinterpret_cast_1 = memref.reinterpret_cast %subview_0 to offset: [0], sizes: [64, 512], strides: [512, 1] : memref<32768xbf16, strided<[1], offset: 65536>> to memref<64x512xbf16>
        %subview_2 = memref.subview %arg2[0] [262144] [1] : memref<1048576xbf16> to memref<262144xbf16>
        %reinterpret_cast_3 = memref.reinterpret_cast %subview_2 to offset: [0], sizes: [512, 512], strides: [512, 1] : memref<262144xbf16> to memref<512x512xbf16>
        aiex.run @sequence(%reinterpret_cast, %reinterpret_cast_1, %reinterpret_cast_3) : (memref<512x64xbf16>, memref<64x512xbf16>, memref<512x512xbf16>)
        %subview_4 = memref.subview %arg0[32768] [32768] [1] : memref<196608xbf16> to memref<32768xbf16, strided<[1], offset: 32768>>
        %reinterpret_cast_5 = memref.reinterpret_cast %subview_4 to offset: [0], sizes: [512, 64], strides: [64, 1] : memref<32768xbf16, strided<[1], offset: 32768>> to memref<512x64xbf16>
        %subview_6 = memref.subview %arg0[98304] [32768] [1] : memref<196608xbf16> to memref<32768xbf16, strided<[1], offset: 98304>>
        %reinterpret_cast_7 = memref.reinterpret_cast %subview_6 to offset: [0], sizes: [64, 512], strides: [512, 1] : memref<32768xbf16, strided<[1], offset: 98304>> to memref<64x512xbf16>
        %subview_8 = memref.subview %arg2[262144] [262144] [1] : memref<1048576xbf16> to memref<262144xbf16, strided<[1], offset: 262144>>
        %reinterpret_cast_9 = memref.reinterpret_cast %subview_8 to offset: [0], sizes: [512, 512], strides: [512, 1] : memref<262144xbf16, strided<[1], offset: 262144>> to memref<512x512xbf16>
        aiex.run @sequence(%reinterpret_cast_5, %reinterpret_cast_7, %reinterpret_cast_9) : (memref<512x64xbf16>, memref<64x512xbf16>, memref<512x512xbf16>)
      }
      aiex.configure @op1__MHAStreamGroup {
        %subview = memref.subview %arg2[0] [262144] [1] : memref<1048576xbf16> to memref<262144xbf16>
        %reinterpret_cast = memref.reinterpret_cast %subview to offset: [0], sizes: [512, 512], strides: [512, 1] : memref<262144xbf16> to memref<512x512xbf16>
        %subview_0 = memref.subview %arg2[524288] [262144] [1] : memref<1048576xbf16> to memref<262144xbf16, strided<[1], offset: 524288>>
        %reinterpret_cast_1 = memref.reinterpret_cast %subview_0 to offset: [0], sizes: [512, 512], strides: [512, 1] : memref<262144xbf16, strided<[1], offset: 524288>> to memref<512x512xbf16>
        aiex.run @sequence(%reinterpret_cast, %reinterpret_cast_1) : (memref<512x512xbf16>, memref<512x512xbf16>)
        %subview_2 = memref.subview %arg2[262144] [262144] [1] : memref<1048576xbf16> to memref<262144xbf16, strided<[1], offset: 262144>>
        %reinterpret_cast_3 = memref.reinterpret_cast %subview_2 to offset: [0], sizes: [512, 512], strides: [512, 1] : memref<262144xbf16, strided<[1], offset: 262144>> to memref<512x512xbf16>
        %subview_4 = memref.subview %arg2[786432] [262144] [1] : memref<1048576xbf16> to memref<262144xbf16, strided<[1], offset: 786432>>
        %reinterpret_cast_5 = memref.reinterpret_cast %subview_4 to offset: [0], sizes: [512, 512], strides: [512, 1] : memref<262144xbf16, strided<[1], offset: 786432>> to memref<512x512xbf16>
        aiex.run @sequence(%reinterpret_cast_3, %reinterpret_cast_5) : (memref<512x512xbf16>, memref<512x512xbf16>)
      }
      aiex.configure @op2__MHAStreamGroup {
        %subview = memref.subview %arg2[524288] [262144] [1] : memref<1048576xbf16> to memref<262144xbf16, strided<[1], offset: 524288>>
        %reinterpret_cast = memref.reinterpret_cast %subview to offset: [0], sizes: [512, 512], strides: [512, 1] : memref<262144xbf16, strided<[1], offset: 524288>> to memref<512x512xbf16>
        %subview_0 = memref.subview %arg0[131072] [32768] [1] : memref<196608xbf16> to memref<32768xbf16, strided<[1], offset: 131072>>
        %reinterpret_cast_1 = memref.reinterpret_cast %subview_0 to offset: [0], sizes: [512, 64], strides: [64, 1] : memref<32768xbf16, strided<[1], offset: 131072>> to memref<512x64xbf16>
        %subview_2 = memref.subview %arg1[0] [32768] [1] : memref<65536xbf16> to memref<32768xbf16>
        %reinterpret_cast_3 = memref.reinterpret_cast %subview_2 to offset: [0], sizes: [512, 64], strides: [64, 1] : memref<32768xbf16> to memref<512x64xbf16>
        aiex.run @sequence(%reinterpret_cast, %reinterpret_cast_1, %reinterpret_cast_3) : (memref<512x512xbf16>, memref<512x64xbf16>, memref<512x64xbf16>)
        %subview_4 = memref.subview %arg2[786432] [262144] [1] : memref<1048576xbf16> to memref<262144xbf16, strided<[1], offset: 786432>>
        %reinterpret_cast_5 = memref.reinterpret_cast %subview_4 to offset: [0], sizes: [512, 512], strides: [512, 1] : memref<262144xbf16, strided<[1], offset: 786432>> to memref<512x512xbf16>
        %subview_6 = memref.subview %arg0[163840] [32768] [1] : memref<196608xbf16> to memref<32768xbf16, strided<[1], offset: 163840>>
        %reinterpret_cast_7 = memref.reinterpret_cast %subview_6 to offset: [0], sizes: [512, 64], strides: [64, 1] : memref<32768xbf16, strided<[1], offset: 163840>> to memref<512x64xbf16>
        %subview_8 = memref.subview %arg1[32768] [32768] [1] : memref<65536xbf16> to memref<32768xbf16, strided<[1], offset: 32768>>
        %reinterpret_cast_9 = memref.reinterpret_cast %subview_8 to offset: [0], sizes: [512, 64], strides: [64, 1] : memref<32768xbf16, strided<[1], offset: 32768>> to memref<512x64xbf16>
        aiex.run @sequence(%reinterpret_cast_5, %reinterpret_cast_7, %reinterpret_cast_9) : (memref<512x512xbf16>, memref<512x64xbf16>, memref<512x64xbf16>)
      }
      aiex.configure @reset_device {
      }
    }
  }
}
