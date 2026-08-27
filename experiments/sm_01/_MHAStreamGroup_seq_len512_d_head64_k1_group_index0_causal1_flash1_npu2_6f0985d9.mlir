module {
  aie.device(npu2) {
    %shim_noc_tile_0_0 = aie.tile(0, 0)
    %shim_noc_tile_1_0 = aie.tile(1, 0)
    %shim_noc_tile_2_0 = aie.tile(2, 0)
    %shim_noc_tile_3_0 = aie.tile(3, 0)
    %shim_noc_tile_4_0 = aie.tile(4, 0)
    %shim_noc_tile_5_0 = aie.tile(5, 0)
    %mem_tile_4_1 = aie.tile(4, 1)
    %mem_tile_5_1 = aie.tile(5, 1)
    %mem_tile_1_1 = aie.tile(1, 1)
    %mem_tile_3_1 = aie.tile(3, 1)
    %tile_0_2 = aie.tile(0, 2)
    %tile_1_2 = aie.tile(1, 2)
    %tile_0_3 = aie.tile(0, 3)
    %tile_1_3 = aie.tile(1, 3)
    %mem_tile_0_1 = aie.tile(0, 1)
    %mem_tile_2_1 = aie.tile(2, 1)
    aie.runtime_sequence(%arg0: memref<512x64xbf16>, %arg1: memref<64x512xbf16>, %arg2: memref<512x64xbf16>, %arg3: memref<512x64xbf16>) {
      %0 = aiex.dma_configure_task_for @of_0_mem_0 {
        aie.dma_bd(%arg0 : memref<512x64xbf16> offset = 0 len = 16384 sizes = [1, 4, 64, 64] strides = [0, 8192, 64, 1])
        aie.end
      } {issue_token = true, iteration_t = 0 : index}
      aiex.dma_start_task(%0)
      %1 = aiex.dma_configure_task_for @of_0_mem_1 {
        aie.dma_bd(%arg0 : memref<512x64xbf16> offset = 4096 len = 16384 sizes = [1, 4, 64, 64] strides = [0, 8192, 64, 1])
        aie.end
      } {issue_token = true, iteration_t = 0 : index}
      aiex.dma_start_task(%1)
      %2 = aiex.dma_configure_task_for @of_1_mem {
        aie.dma_bd(%arg1 : memref<64x512xbf16> offset = 0 len = 32768 sizes = [4, 8, 64, 64] strides = [0, 64, 512, 1])
        aie.end
      } {issue_token = true, iteration_t = 0 : index, repeat_count = 3 : i32}
      aiex.dma_start_task(%2)
      %3 = aiex.dma_configure_task_for @of_2_mem {
        aie.dma_bd(%arg2 : memref<512x64xbf16> offset = 0 len = 32768 sizes = [4, 1, 128, 256] strides = [0, 0, 256, 1])
        aie.end
      } {issue_token = true, iteration_t = 0 : index, repeat_count = 3 : i32}
      aiex.dma_start_task(%3)
      %4 = aiex.dma_configure_task_for @of_8_mem_0 {
        aie.dma_bd(%arg3 : memref<512x64xbf16> offset = 0 len = 16384 sizes = [1, 4, 64, 64] strides = [0, 8192, 64, 1])
        aie.end
      } {issue_token = true, iteration_t = 0 : index}
      aiex.dma_start_task(%4)
      %5 = aiex.dma_configure_task_for @of_8_mem_1 {
        aie.dma_bd(%arg3 : memref<512x64xbf16> offset = 4096 len = 16384 sizes = [1, 4, 64, 64] strides = [0, 8192, 64, 1])
        aie.end
      } {issue_token = true, iteration_t = 0 : index}
      aiex.dma_start_task(%5)
      aiex.dma_await_task(%0)
      aiex.dma_await_task(%1)
      aiex.dma_await_task(%2)
      aiex.dma_await_task(%3)
      aiex.dma_await_task(%4)
      aiex.dma_await_task(%5)
    }
    %flash_state_0_2 = aie.buffer(%tile_0_2) {sym_name = "flash_state_0_2"} : memref<256xbf16> 
    %flash_index_0_2 = aie.buffer(%tile_0_2) {sym_name = "flash_index_0_2"} : memref<2xi32> 
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
          %c8 = arith.constant 8 : index
          scf.for %arg2 = %c0_0 to %c8 step %c1_1 {
            %2 = aie.objectfifo.acquire @of_6_unicast_0(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %3 = aie.objectfifo.subview.access %2[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            func.call @op0_zero_bf16(%3) : (memref<64x64xbf16>) -> ()
            %4 = aie.objectfifo.acquire @of_4_broadcast_0_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %5 = aie.objectfifo.subview.access %4[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            %6 = arith.index_cast %arg2 : index to i32
            %c1_i32 = arith.constant 1 : i32
            %7 = arith.muli %6, %c1_i32 : i32
            %c0_i32 = arith.constant 0 : i32
            %8 = arith.addi %c0_i32, %7 : i32
            %9 = arith.index_cast %arg1 : index to i32
            %c2_i32 = arith.constant 2 : i32
            %10 = arith.muli %9, %c2_i32 : i32
            %c0_i32_2 = arith.constant 0 : i32
            %11 = arith.addi %c0_i32_2, %10 : i32
            %c0_3 = arith.constant 0 : index
            %c1_4 = arith.constant 1 : index
            memref.store %8, %flash_index_0_2[%c0_3] : memref<2xi32>
            memref.store %11, %flash_index_0_2[%c1_4] : memref<2xi32>
            %c64_i32 = arith.constant 64 : i32
            %c0_i32_5 = arith.constant 0 : i32
            %12 = arith.cmpi eq, %8, %c0_i32_5 : i32
            scf.if %12 {
              func.call @op0_init_scale_buffer(%flash_state_0_2, %c64_i32) : (memref<256xbf16>, i32) -> ()
            }
            %cst = arith.constant 1.4453125 : f32
            %13 = arith.truncf %cst : f32 to bf16
            %c64_i32_6 = arith.constant 64 : i32
            %c512_i32 = arith.constant 512 : i32
            %c512_i32_7 = arith.constant 512 : i32
            func.call @op0_matmul_softmax(%1, %5, %3, %flash_state_0_2, %flash_index_0_2, %13, %c64_i32, %c64_i32_6, %c512_i32, %c512_i32_7) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>, memref<256xbf16>, memref<2xi32>, bf16, i32, i32, i32, i32) -> ()
            %14 = aie.objectfifo.acquire @flash_scale_0_2(Produce, 1) : !aie.objectfifosubview<memref<256xbf16>>
            %15 = aie.objectfifo.subview.access %14[0] : !aie.objectfifosubview<memref<256xbf16>> -> memref<256xbf16>
            %c256_i32 = arith.constant 256 : i32
            func.call @op0_passThroughLine(%flash_state_0_2, %15, %c256_i32) : (memref<256xbf16>, memref<256xbf16>, i32) -> ()
            aie.objectfifo.release @flash_scale_0_2(Produce, 1)
            aie.objectfifo.release @of_4_broadcast_0_0(Consume, 1)
            aie.objectfifo.release @of_6_unicast_0(Produce, 1)
          }
          aie.objectfifo.release @of_3_unicast_0_0(Consume, 1)
        }
      }
      aie.end
    } {link_with = "op0_mha.o"}
    %flash_state_1_2 = aie.buffer(%tile_1_2) {sym_name = "flash_state_1_2"} : memref<256xbf16> 
    %flash_index_1_2 = aie.buffer(%tile_1_2) {sym_name = "flash_index_1_2"} : memref<2xi32> 
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
          %c8 = arith.constant 8 : index
          scf.for %arg2 = %c0_0 to %c8 step %c1_1 {
            %2 = aie.objectfifo.acquire @of_6_unicast_1(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %3 = aie.objectfifo.subview.access %2[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            func.call @op0_zero_bf16(%3) : (memref<64x64xbf16>) -> ()
            %4 = aie.objectfifo.acquire @of_4_broadcast_0_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %5 = aie.objectfifo.subview.access %4[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            %6 = arith.index_cast %arg2 : index to i32
            %c1_i32 = arith.constant 1 : i32
            %7 = arith.muli %6, %c1_i32 : i32
            %c0_i32 = arith.constant 0 : i32
            %8 = arith.addi %c0_i32, %7 : i32
            %9 = arith.index_cast %arg1 : index to i32
            %c2_i32 = arith.constant 2 : i32
            %10 = arith.muli %9, %c2_i32 : i32
            %c1_i32_2 = arith.constant 1 : i32
            %11 = arith.addi %c1_i32_2, %10 : i32
            %c0_3 = arith.constant 0 : index
            %c1_4 = arith.constant 1 : index
            memref.store %8, %flash_index_1_2[%c0_3] : memref<2xi32>
            memref.store %11, %flash_index_1_2[%c1_4] : memref<2xi32>
            %c64_i32 = arith.constant 64 : i32
            %c0_i32_5 = arith.constant 0 : i32
            %12 = arith.cmpi eq, %8, %c0_i32_5 : i32
            scf.if %12 {
              func.call @op0_init_scale_buffer(%flash_state_1_2, %c64_i32) : (memref<256xbf16>, i32) -> ()
            }
            %cst = arith.constant 1.4453125 : f32
            %13 = arith.truncf %cst : f32 to bf16
            %c64_i32_6 = arith.constant 64 : i32
            %c512_i32 = arith.constant 512 : i32
            %c512_i32_7 = arith.constant 512 : i32
            func.call @op0_matmul_softmax(%1, %5, %3, %flash_state_1_2, %flash_index_1_2, %13, %c64_i32, %c64_i32_6, %c512_i32, %c512_i32_7) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>, memref<256xbf16>, memref<2xi32>, bf16, i32, i32, i32, i32) -> ()
            %14 = aie.objectfifo.acquire @flash_scale_1_2(Produce, 1) : !aie.objectfifosubview<memref<256xbf16>>
            %15 = aie.objectfifo.subview.access %14[0] : !aie.objectfifosubview<memref<256xbf16>> -> memref<256xbf16>
            %c256_i32 = arith.constant 256 : i32
            func.call @op0_passThroughLine(%flash_state_1_2, %15, %c256_i32) : (memref<256xbf16>, memref<256xbf16>, i32) -> ()
            aie.objectfifo.release @flash_scale_1_2(Produce, 1)
            aie.objectfifo.release @of_4_broadcast_0_0(Consume, 1)
            aie.objectfifo.release @of_6_unicast_1(Produce, 1)
          }
          aie.objectfifo.release @of_3_unicast_1_0(Consume, 1)
        }
      }
      aie.end
    } {link_with = "op0_mha.o"}
    %flash_index_0_3 = aie.buffer(%tile_0_3) {sym_name = "flash_index_0_3"} : memref<2xi32> 
    aie.objectfifo @flash_scale_0_2(%tile_0_2, {%tile_0_3}, 2 : i32) : !aie.objectfifo<memref<256xbf16>>  
    %core_0_3 = aie.core(%tile_0_3) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c4 = arith.constant 4 : index
        scf.for %arg1 = %c0_0 to %c4 step %c1_1 {
          %0 = aie.objectfifo.acquire @of_7_unicast_0(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
          %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
          func.call @op0_zero_bf16(%1) : (memref<64x64xbf16>) -> ()
          %c8 = arith.constant 8 : index
          scf.for %arg2 = %c0_0 to %c8 step %c1_1 {
            %2 = aie.objectfifo.acquire @of_6_unicast_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %3 = aie.objectfifo.subview.access %2[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            %4 = aie.objectfifo.acquire @of_5_broadcast_0_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %5 = aie.objectfifo.subview.access %4[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            %6 = arith.index_cast %arg2 : index to i32
            %c1_i32 = arith.constant 1 : i32
            %7 = arith.muli %6, %c1_i32 : i32
            %c0_i32 = arith.constant 0 : i32
            %8 = arith.addi %c0_i32, %7 : i32
            %9 = arith.index_cast %arg1 : index to i32
            %c2_i32 = arith.constant 2 : i32
            %10 = arith.muli %9, %c2_i32 : i32
            %c0_i32_2 = arith.constant 0 : i32
            %11 = arith.addi %c0_i32_2, %10 : i32
            %c0_3 = arith.constant 0 : index
            %c1_4 = arith.constant 1 : index
            memref.store %8, %flash_index_0_3[%c0_3] : memref<2xi32>
            memref.store %11, %flash_index_0_3[%c1_4] : memref<2xi32>
            %12 = aie.objectfifo.acquire @flash_scale_0_2(Consume, 1) : !aie.objectfifosubview<memref<256xbf16>>
            %13 = aie.objectfifo.subview.access %12[0] : !aie.objectfifosubview<memref<256xbf16>> -> memref<256xbf16>
            %c64_i32 = arith.constant 64 : i32
            %c0_i32_5 = arith.constant 0 : i32
            %14 = arith.cmpi ne, %8, %c0_i32_5 : i32
            %15 = arith.extui %14 : i1 to i32
            func.call @op0_matmul_PV(%3, %5, %1, %13, %c64_i32, %15, %flash_index_0_3) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>, memref<256xbf16>, i32, i32, memref<2xi32>) -> ()
            %c7_i32 = arith.constant 7 : i32
            %16 = arith.cmpi eq, %8, %c7_i32 : i32
            scf.if %16 {
              func.call @op0_rescale_O(%1, %13, %c64_i32, %flash_index_0_3) : (memref<64x64xbf16>, memref<256xbf16>, i32, memref<2xi32>) -> ()
            }
            aie.objectfifo.release @flash_scale_0_2(Consume, 1)
            aie.objectfifo.release @of_5_broadcast_0_0(Consume, 1)
            aie.objectfifo.release @of_6_unicast_0(Consume, 1)
          }
          aie.objectfifo.release @of_7_unicast_0(Produce, 1)
        }
      }
      aie.end
    } {link_with = "op0_mha.o"}
    %flash_index_1_3 = aie.buffer(%tile_1_3) {sym_name = "flash_index_1_3"} : memref<2xi32> 
    aie.objectfifo @flash_scale_1_2(%tile_1_2, {%tile_1_3}, 2 : i32) : !aie.objectfifo<memref<256xbf16>>  
    %core_1_3 = aie.core(%tile_1_3) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c4 = arith.constant 4 : index
        scf.for %arg1 = %c0_0 to %c4 step %c1_1 {
          %0 = aie.objectfifo.acquire @of_7_unicast_1(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
          %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
          func.call @op0_zero_bf16(%1) : (memref<64x64xbf16>) -> ()
          %c8 = arith.constant 8 : index
          scf.for %arg2 = %c0_0 to %c8 step %c1_1 {
            %2 = aie.objectfifo.acquire @of_6_unicast_1(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %3 = aie.objectfifo.subview.access %2[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            %4 = aie.objectfifo.acquire @of_5_broadcast_0_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %5 = aie.objectfifo.subview.access %4[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            %6 = arith.index_cast %arg2 : index to i32
            %c1_i32 = arith.constant 1 : i32
            %7 = arith.muli %6, %c1_i32 : i32
            %c0_i32 = arith.constant 0 : i32
            %8 = arith.addi %c0_i32, %7 : i32
            %9 = arith.index_cast %arg1 : index to i32
            %c2_i32 = arith.constant 2 : i32
            %10 = arith.muli %9, %c2_i32 : i32
            %c1_i32_2 = arith.constant 1 : i32
            %11 = arith.addi %c1_i32_2, %10 : i32
            %c0_3 = arith.constant 0 : index
            %c1_4 = arith.constant 1 : index
            memref.store %8, %flash_index_1_3[%c0_3] : memref<2xi32>
            memref.store %11, %flash_index_1_3[%c1_4] : memref<2xi32>
            %12 = aie.objectfifo.acquire @flash_scale_1_2(Consume, 1) : !aie.objectfifosubview<memref<256xbf16>>
            %13 = aie.objectfifo.subview.access %12[0] : !aie.objectfifosubview<memref<256xbf16>> -> memref<256xbf16>
            %c64_i32 = arith.constant 64 : i32
            %c0_i32_5 = arith.constant 0 : i32
            %14 = arith.cmpi ne, %8, %c0_i32_5 : i32
            %15 = arith.extui %14 : i1 to i32
            func.call @op0_matmul_PV(%3, %5, %1, %13, %c64_i32, %15, %flash_index_1_3) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>, memref<256xbf16>, i32, i32, memref<2xi32>) -> ()
            %c7_i32 = arith.constant 7 : i32
            %16 = arith.cmpi eq, %8, %c7_i32 : i32
            scf.if %16 {
              func.call @op0_rescale_O(%1, %13, %c64_i32, %flash_index_1_3) : (memref<64x64xbf16>, memref<256xbf16>, i32, memref<2xi32>) -> ()
            }
            aie.objectfifo.release @flash_scale_1_2(Consume, 1)
            aie.objectfifo.release @of_5_broadcast_0_0(Consume, 1)
            aie.objectfifo.release @of_6_unicast_1(Consume, 1)
          }
          aie.objectfifo.release @of_7_unicast_1(Produce, 1)
        }
      }
      aie.end
    } {link_with = "op0_mha.o"}
    aie.objectfifo @of_0_mem_0(%shim_noc_tile_4_0, {%mem_tile_4_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_0_mem_1(%shim_noc_tile_5_0, {%mem_tile_5_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_1_mem(%shim_noc_tile_1_0, {%mem_tile_1_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_2_mem(%shim_noc_tile_3_0, {%mem_tile_3_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_3_unicast_0_0(%mem_tile_4_1 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%tile_0_2}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo.link [@of_0_mem_0] -> [@of_3_unicast_0_0]([] [])
    aie.objectfifo @of_3_unicast_1_0(%mem_tile_5_1 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%tile_1_2}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo.link [@of_0_mem_1] -> [@of_3_unicast_1_0]([] [])
    aie.objectfifo @of_4_broadcast_0_0(%mem_tile_1_1 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%tile_0_2, %tile_1_2}, [2 : i32, 2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo.link [@of_1_mem] -> [@of_4_broadcast_0_0]([] [])
    aie.objectfifo @of_5_broadcast_0_0(%mem_tile_3_1 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%tile_0_3, %tile_1_3}, [2 : i32, 2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo.link [@of_2_mem] -> [@of_5_broadcast_0_0]([] [])
    aie.objectfifo @of_6_unicast_0(%tile_0_2, {%tile_0_3}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_6_unicast_1(%tile_1_2, {%tile_1_3}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_7_unicast_0(%tile_0_3, {%mem_tile_0_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_7_unicast_1(%tile_1_3, {%mem_tile_2_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_8_mem_0(%mem_tile_0_1 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%shim_noc_tile_0_0}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo.link [@of_7_unicast_0] -> [@of_8_mem_0]([] [])
    aie.objectfifo @of_8_mem_1(%mem_tile_2_1 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%shim_noc_tile_2_0}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo.link [@of_7_unicast_1] -> [@of_8_mem_1]([] [])
    func.func private @op0_init_scale_buffer(memref<256xbf16>, i32)
    func.func private @op0_passThroughLine(memref<256xbf16>, memref<256xbf16>, i32) attributes {link_with = "op0_mha_passThrough.o"}
    func.func private @op0_zero_bf16(memref<64x64xbf16>)
    func.func private @op0_matmul_softmax(memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>, memref<256xbf16>, memref<2xi32>, bf16, i32, i32, i32, i32)
    func.func private @op0_rescale_O(memref<64x64xbf16>, memref<256xbf16>, i32, memref<2xi32>)
    func.func private @op0_matmul_PV(memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>, memref<256xbf16>, i32, i32, memref<2xi32>)
  }
}
