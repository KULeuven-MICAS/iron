module {
  aie.device(npu2) {
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
    aie.runtime_sequence(%arg0: memref<4096x64xbf16>, %arg1: memref<64x4096xbf16>, %arg2: memref<4096x64xbf16>, %arg3: memref<4096x64xbf16>) {
      %0 = aiex.dma_configure_task_for @of_0_mem_0 {
        aie.dma_bd(%arg0 : memref<4096x64xbf16> offset = 0 len = 32768 sizes = [1, 8, 64, 64] strides = [0, 32768, 64, 1])
        aie.end
      } {issue_token = true, iteration_t = 0 : index}
      aiex.dma_start_task(%0)
      %1 = aiex.dma_configure_task_for @of_0_mem_1 {
        aie.dma_bd(%arg0 : memref<4096x64xbf16> offset = 4096 len = 32768 sizes = [1, 8, 64, 64] strides = [0, 32768, 64, 1])
        aie.end
      } {issue_token = true, iteration_t = 0 : index}
      aiex.dma_start_task(%1)
      %2 = aiex.dma_configure_task_for @of_0_mem_2 {
        aie.dma_bd(%arg0 : memref<4096x64xbf16> offset = 8192 len = 32768 sizes = [1, 8, 64, 64] strides = [0, 32768, 64, 1])
        aie.end
      } {issue_token = true, iteration_t = 0 : index}
      aiex.dma_start_task(%2)
      %3 = aiex.dma_configure_task_for @of_0_mem_3 {
        aie.dma_bd(%arg0 : memref<4096x64xbf16> offset = 12288 len = 32768 sizes = [1, 8, 64, 64] strides = [0, 32768, 64, 1])
        aie.end
      } {issue_token = true, iteration_t = 0 : index}
      aiex.dma_start_task(%3)
      %4 = aiex.dma_configure_task_for @of_0_mem_4 {
        aie.dma_bd(%arg0 : memref<4096x64xbf16> offset = 16384 len = 32768 sizes = [1, 8, 64, 64] strides = [0, 32768, 64, 1])
        aie.end
      } {issue_token = true, iteration_t = 0 : index}
      aiex.dma_start_task(%4)
      %5 = aiex.dma_configure_task_for @of_0_mem_5 {
        aie.dma_bd(%arg0 : memref<4096x64xbf16> offset = 20480 len = 32768 sizes = [1, 8, 64, 64] strides = [0, 32768, 64, 1])
        aie.end
      } {issue_token = true, iteration_t = 0 : index}
      aiex.dma_start_task(%5)
      %6 = aiex.dma_configure_task_for @of_0_mem_6 {
        aie.dma_bd(%arg0 : memref<4096x64xbf16> offset = 24576 len = 32768 sizes = [1, 8, 64, 64] strides = [0, 32768, 64, 1])
        aie.end
      } {issue_token = true, iteration_t = 0 : index}
      aiex.dma_start_task(%6)
      %7 = aiex.dma_configure_task_for @of_0_mem_7 {
        aie.dma_bd(%arg0 : memref<4096x64xbf16> offset = 28672 len = 32768 sizes = [1, 8, 64, 64] strides = [0, 32768, 64, 1])
        aie.end
      } {issue_token = true, iteration_t = 0 : index}
      aiex.dma_start_task(%7)
      %8 = aiex.dma_configure_task_for @of_1_mem {
        aie.dma_bd(%arg1 : memref<64x4096xbf16> offset = 0 len = 262144 sizes = [4, 64, 64, 64] strides = [0, 64, 4096, 1])
        aie.end
      } {issue_token = true, iteration_t = 0 : index, repeat_count = 3 : i32}
      aiex.dma_start_task(%8)
      %9 = aiex.dma_configure_task_for @of_2_mem {
        aie.dma_bd(%arg2 : memref<4096x64xbf16> offset = 0 len = 262144 sizes = [4, 1, 512, 512] strides = [0, 0, 512, 1])
        aie.end
      } {issue_token = true, iteration_t = 0 : index, repeat_count = 3 : i32}
      aiex.dma_start_task(%9)
      %10 = aiex.dma_configure_task_for @of_8_mem_0 {
        aie.dma_bd(%arg3 : memref<4096x64xbf16> offset = 0 len = 32768 sizes = [1, 8, 64, 64] strides = [0, 32768, 64, 1])
        aie.end
      } {issue_token = true, iteration_t = 0 : index}
      aiex.dma_start_task(%10)
      %11 = aiex.dma_configure_task_for @of_8_mem_1 {
        aie.dma_bd(%arg3 : memref<4096x64xbf16> offset = 4096 len = 32768 sizes = [1, 8, 64, 64] strides = [0, 32768, 64, 1])
        aie.end
      } {issue_token = true, iteration_t = 0 : index}
      aiex.dma_start_task(%11)
      %12 = aiex.dma_configure_task_for @of_8_mem_2 {
        aie.dma_bd(%arg3 : memref<4096x64xbf16> offset = 8192 len = 32768 sizes = [1, 8, 64, 64] strides = [0, 32768, 64, 1])
        aie.end
      } {issue_token = true, iteration_t = 0 : index}
      aiex.dma_start_task(%12)
      %13 = aiex.dma_configure_task_for @of_8_mem_3 {
        aie.dma_bd(%arg3 : memref<4096x64xbf16> offset = 12288 len = 32768 sizes = [1, 8, 64, 64] strides = [0, 32768, 64, 1])
        aie.end
      } {issue_token = true, iteration_t = 0 : index}
      aiex.dma_start_task(%13)
      %14 = aiex.dma_configure_task_for @of_8_mem_4 {
        aie.dma_bd(%arg3 : memref<4096x64xbf16> offset = 16384 len = 32768 sizes = [1, 8, 64, 64] strides = [0, 32768, 64, 1])
        aie.end
      } {issue_token = true, iteration_t = 0 : index}
      aiex.dma_start_task(%14)
      %15 = aiex.dma_configure_task_for @of_8_mem_5 {
        aie.dma_bd(%arg3 : memref<4096x64xbf16> offset = 20480 len = 32768 sizes = [1, 8, 64, 64] strides = [0, 32768, 64, 1])
        aie.end
      } {issue_token = true, iteration_t = 0 : index}
      aiex.dma_start_task(%15)
      %16 = aiex.dma_configure_task_for @of_8_mem_6 {
        aie.dma_bd(%arg3 : memref<4096x64xbf16> offset = 24576 len = 32768 sizes = [1, 8, 64, 64] strides = [0, 32768, 64, 1])
        aie.end
      } {issue_token = true, iteration_t = 0 : index}
      aiex.dma_start_task(%16)
      %17 = aiex.dma_configure_task_for @of_8_mem_7 {
        aie.dma_bd(%arg3 : memref<4096x64xbf16> offset = 28672 len = 32768 sizes = [1, 8, 64, 64] strides = [0, 32768, 64, 1])
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
          %0 = aie.objectfifo.acquire @of_3_distribute_0_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
          %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
          %c64 = arith.constant 64 : index
          scf.for %arg2 = %c0_0 to %c64 step %c1_1 {
            %2 = aie.objectfifo.acquire @of_6_switch_join_0_0(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
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
            %c16_i32 = arith.constant 16 : i32
            %10 = arith.muli %9, %c16_i32 : i32
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
            %c4096_i32 = arith.constant 4096 : i32
            %c4096_i32_7 = arith.constant 4096 : i32
            func.call @op0_matmul_softmax(%1, %5, %3, %flash_state_0_2, %flash_index_0_2, %13, %c64_i32, %c64_i32_6, %c4096_i32, %c4096_i32_7) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>, memref<256xbf16>, memref<2xi32>, bf16, i32, i32, i32, i32) -> ()
            %14 = aie.objectfifo.acquire @flash_scale_0_2(Produce, 1) : !aie.objectfifosubview<memref<256xbf16>>
            %15 = aie.objectfifo.subview.access %14[0] : !aie.objectfifosubview<memref<256xbf16>> -> memref<256xbf16>
            %c256_i32 = arith.constant 256 : i32
            func.call @op0_passThroughLine(%flash_state_0_2, %15, %c256_i32) : (memref<256xbf16>, memref<256xbf16>, i32) -> ()
            aie.objectfifo.release @flash_scale_0_2(Produce, 1)
            aie.objectfifo.release @of_4_broadcast_0_0(Consume, 1)
            aie.objectfifo.release @of_6_switch_join_0_0(Produce, 1)
          }
          aie.objectfifo.release @of_3_distribute_0_0(Consume, 1)
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
          %0 = aie.objectfifo.acquire @of_3_distribute_1_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
          %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
          %c64 = arith.constant 64 : index
          scf.for %arg2 = %c0_0 to %c64 step %c1_1 {
            %2 = aie.objectfifo.acquire @of_6_switch_join_1_0(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
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
            %c16_i32 = arith.constant 16 : i32
            %10 = arith.muli %9, %c16_i32 : i32
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
            %c4096_i32 = arith.constant 4096 : i32
            %c4096_i32_7 = arith.constant 4096 : i32
            func.call @op0_matmul_softmax(%1, %5, %3, %flash_state_1_2, %flash_index_1_2, %13, %c64_i32, %c64_i32_6, %c4096_i32, %c4096_i32_7) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>, memref<256xbf16>, memref<2xi32>, bf16, i32, i32, i32, i32) -> ()
            %14 = aie.objectfifo.acquire @flash_scale_1_2(Produce, 1) : !aie.objectfifosubview<memref<256xbf16>>
            %15 = aie.objectfifo.subview.access %14[0] : !aie.objectfifosubview<memref<256xbf16>> -> memref<256xbf16>
            %c256_i32 = arith.constant 256 : i32
            func.call @op0_passThroughLine(%flash_state_1_2, %15, %c256_i32) : (memref<256xbf16>, memref<256xbf16>, i32) -> ()
            aie.objectfifo.release @flash_scale_1_2(Produce, 1)
            aie.objectfifo.release @of_4_broadcast_0_0(Consume, 1)
            aie.objectfifo.release @of_6_switch_join_1_0(Produce, 1)
          }
          aie.objectfifo.release @of_3_distribute_1_0(Consume, 1)
        }
      }
      aie.end
    } {link_with = "op0_mha.o"}
    %flash_state_2_2 = aie.buffer(%tile_2_2) {sym_name = "flash_state_2_2"} : memref<256xbf16> 
    %flash_index_2_2 = aie.buffer(%tile_2_2) {sym_name = "flash_index_2_2"} : memref<2xi32> 
    %core_2_2 = aie.core(%tile_2_2) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c4 = arith.constant 4 : index
        scf.for %arg1 = %c0_0 to %c4 step %c1_1 {
          %0 = aie.objectfifo.acquire @of_3_distribute_2_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
          %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
          %c64 = arith.constant 64 : index
          scf.for %arg2 = %c0_0 to %c64 step %c1_1 {
            %2 = aie.objectfifo.acquire @of_6_switch_join_2_0(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
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
            %c16_i32 = arith.constant 16 : i32
            %10 = arith.muli %9, %c16_i32 : i32
            %c2_i32 = arith.constant 2 : i32
            %11 = arith.addi %c2_i32, %10 : i32
            %c0_2 = arith.constant 0 : index
            %c1_3 = arith.constant 1 : index
            memref.store %8, %flash_index_2_2[%c0_2] : memref<2xi32>
            memref.store %11, %flash_index_2_2[%c1_3] : memref<2xi32>
            %c64_i32 = arith.constant 64 : i32
            %c0_i32_4 = arith.constant 0 : i32
            %12 = arith.cmpi eq, %8, %c0_i32_4 : i32
            scf.if %12 {
              func.call @op0_init_scale_buffer(%flash_state_2_2, %c64_i32) : (memref<256xbf16>, i32) -> ()
            }
            %cst = arith.constant 1.4453125 : f32
            %13 = arith.truncf %cst : f32 to bf16
            %c64_i32_5 = arith.constant 64 : i32
            %c4096_i32 = arith.constant 4096 : i32
            %c4096_i32_6 = arith.constant 4096 : i32
            func.call @op0_matmul_softmax(%1, %5, %3, %flash_state_2_2, %flash_index_2_2, %13, %c64_i32, %c64_i32_5, %c4096_i32, %c4096_i32_6) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>, memref<256xbf16>, memref<2xi32>, bf16, i32, i32, i32, i32) -> ()
            %14 = aie.objectfifo.acquire @flash_scale_2_2(Produce, 1) : !aie.objectfifosubview<memref<256xbf16>>
            %15 = aie.objectfifo.subview.access %14[0] : !aie.objectfifosubview<memref<256xbf16>> -> memref<256xbf16>
            %c256_i32 = arith.constant 256 : i32
            func.call @op0_passThroughLine(%flash_state_2_2, %15, %c256_i32) : (memref<256xbf16>, memref<256xbf16>, i32) -> ()
            aie.objectfifo.release @flash_scale_2_2(Produce, 1)
            aie.objectfifo.release @of_4_broadcast_0_0(Consume, 1)
            aie.objectfifo.release @of_6_switch_join_2_0(Produce, 1)
          }
          aie.objectfifo.release @of_3_distribute_2_0(Consume, 1)
        }
      }
      aie.end
    } {link_with = "op0_mha.o"}
    %flash_state_3_2 = aie.buffer(%tile_3_2) {sym_name = "flash_state_3_2"} : memref<256xbf16> 
    %flash_index_3_2 = aie.buffer(%tile_3_2) {sym_name = "flash_index_3_2"} : memref<2xi32> 
    %core_3_2 = aie.core(%tile_3_2) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c4 = arith.constant 4 : index
        scf.for %arg1 = %c0_0 to %c4 step %c1_1 {
          %0 = aie.objectfifo.acquire @of_3_distribute_3_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
          %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
          %c64 = arith.constant 64 : index
          scf.for %arg2 = %c0_0 to %c64 step %c1_1 {
            %2 = aie.objectfifo.acquire @of_6_switch_join_3_0(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
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
            %c16_i32 = arith.constant 16 : i32
            %10 = arith.muli %9, %c16_i32 : i32
            %c3_i32 = arith.constant 3 : i32
            %11 = arith.addi %c3_i32, %10 : i32
            %c0_2 = arith.constant 0 : index
            %c1_3 = arith.constant 1 : index
            memref.store %8, %flash_index_3_2[%c0_2] : memref<2xi32>
            memref.store %11, %flash_index_3_2[%c1_3] : memref<2xi32>
            %c64_i32 = arith.constant 64 : i32
            %c0_i32_4 = arith.constant 0 : i32
            %12 = arith.cmpi eq, %8, %c0_i32_4 : i32
            scf.if %12 {
              func.call @op0_init_scale_buffer(%flash_state_3_2, %c64_i32) : (memref<256xbf16>, i32) -> ()
            }
            %cst = arith.constant 1.4453125 : f32
            %13 = arith.truncf %cst : f32 to bf16
            %c64_i32_5 = arith.constant 64 : i32
            %c4096_i32 = arith.constant 4096 : i32
            %c4096_i32_6 = arith.constant 4096 : i32
            func.call @op0_matmul_softmax(%1, %5, %3, %flash_state_3_2, %flash_index_3_2, %13, %c64_i32, %c64_i32_5, %c4096_i32, %c4096_i32_6) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>, memref<256xbf16>, memref<2xi32>, bf16, i32, i32, i32, i32) -> ()
            %14 = aie.objectfifo.acquire @flash_scale_3_2(Produce, 1) : !aie.objectfifosubview<memref<256xbf16>>
            %15 = aie.objectfifo.subview.access %14[0] : !aie.objectfifosubview<memref<256xbf16>> -> memref<256xbf16>
            %c256_i32 = arith.constant 256 : i32
            func.call @op0_passThroughLine(%flash_state_3_2, %15, %c256_i32) : (memref<256xbf16>, memref<256xbf16>, i32) -> ()
            aie.objectfifo.release @flash_scale_3_2(Produce, 1)
            aie.objectfifo.release @of_4_broadcast_0_0(Consume, 1)
            aie.objectfifo.release @of_6_switch_join_3_0(Produce, 1)
          }
          aie.objectfifo.release @of_3_distribute_3_0(Consume, 1)
        }
      }
      aie.end
    } {link_with = "op0_mha.o"}
    %flash_state_4_2 = aie.buffer(%tile_4_2) {sym_name = "flash_state_4_2"} : memref<256xbf16> 
    %flash_index_4_2 = aie.buffer(%tile_4_2) {sym_name = "flash_index_4_2"} : memref<2xi32> 
    %core_4_2 = aie.core(%tile_4_2) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c4 = arith.constant 4 : index
        scf.for %arg1 = %c0_0 to %c4 step %c1_1 {
          %0 = aie.objectfifo.acquire @of_3_distribute_4_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
          %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
          %c64 = arith.constant 64 : index
          scf.for %arg2 = %c0_0 to %c64 step %c1_1 {
            %2 = aie.objectfifo.acquire @of_6_switch_join_4_0(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
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
            %c16_i32 = arith.constant 16 : i32
            %10 = arith.muli %9, %c16_i32 : i32
            %c4_i32 = arith.constant 4 : i32
            %11 = arith.addi %c4_i32, %10 : i32
            %c0_2 = arith.constant 0 : index
            %c1_3 = arith.constant 1 : index
            memref.store %8, %flash_index_4_2[%c0_2] : memref<2xi32>
            memref.store %11, %flash_index_4_2[%c1_3] : memref<2xi32>
            %c64_i32 = arith.constant 64 : i32
            %c0_i32_4 = arith.constant 0 : i32
            %12 = arith.cmpi eq, %8, %c0_i32_4 : i32
            scf.if %12 {
              func.call @op0_init_scale_buffer(%flash_state_4_2, %c64_i32) : (memref<256xbf16>, i32) -> ()
            }
            %cst = arith.constant 1.4453125 : f32
            %13 = arith.truncf %cst : f32 to bf16
            %c64_i32_5 = arith.constant 64 : i32
            %c4096_i32 = arith.constant 4096 : i32
            %c4096_i32_6 = arith.constant 4096 : i32
            func.call @op0_matmul_softmax(%1, %5, %3, %flash_state_4_2, %flash_index_4_2, %13, %c64_i32, %c64_i32_5, %c4096_i32, %c4096_i32_6) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>, memref<256xbf16>, memref<2xi32>, bf16, i32, i32, i32, i32) -> ()
            %14 = aie.objectfifo.acquire @flash_scale_4_2(Produce, 1) : !aie.objectfifosubview<memref<256xbf16>>
            %15 = aie.objectfifo.subview.access %14[0] : !aie.objectfifosubview<memref<256xbf16>> -> memref<256xbf16>
            %c256_i32 = arith.constant 256 : i32
            func.call @op0_passThroughLine(%flash_state_4_2, %15, %c256_i32) : (memref<256xbf16>, memref<256xbf16>, i32) -> ()
            aie.objectfifo.release @flash_scale_4_2(Produce, 1)
            aie.objectfifo.release @of_4_broadcast_0_0(Consume, 1)
            aie.objectfifo.release @of_6_switch_join_4_0(Produce, 1)
          }
          aie.objectfifo.release @of_3_distribute_4_0(Consume, 1)
        }
      }
      aie.end
    } {link_with = "op0_mha.o"}
    %flash_state_5_2 = aie.buffer(%tile_5_2) {sym_name = "flash_state_5_2"} : memref<256xbf16> 
    %flash_index_5_2 = aie.buffer(%tile_5_2) {sym_name = "flash_index_5_2"} : memref<2xi32> 
    %core_5_2 = aie.core(%tile_5_2) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c4 = arith.constant 4 : index
        scf.for %arg1 = %c0_0 to %c4 step %c1_1 {
          %0 = aie.objectfifo.acquire @of_3_distribute_5_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
          %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
          %c64 = arith.constant 64 : index
          scf.for %arg2 = %c0_0 to %c64 step %c1_1 {
            %2 = aie.objectfifo.acquire @of_6_switch_join_5_0(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
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
            %c16_i32 = arith.constant 16 : i32
            %10 = arith.muli %9, %c16_i32 : i32
            %c5_i32 = arith.constant 5 : i32
            %11 = arith.addi %c5_i32, %10 : i32
            %c0_2 = arith.constant 0 : index
            %c1_3 = arith.constant 1 : index
            memref.store %8, %flash_index_5_2[%c0_2] : memref<2xi32>
            memref.store %11, %flash_index_5_2[%c1_3] : memref<2xi32>
            %c64_i32 = arith.constant 64 : i32
            %c0_i32_4 = arith.constant 0 : i32
            %12 = arith.cmpi eq, %8, %c0_i32_4 : i32
            scf.if %12 {
              func.call @op0_init_scale_buffer(%flash_state_5_2, %c64_i32) : (memref<256xbf16>, i32) -> ()
            }
            %cst = arith.constant 1.4453125 : f32
            %13 = arith.truncf %cst : f32 to bf16
            %c64_i32_5 = arith.constant 64 : i32
            %c4096_i32 = arith.constant 4096 : i32
            %c4096_i32_6 = arith.constant 4096 : i32
            func.call @op0_matmul_softmax(%1, %5, %3, %flash_state_5_2, %flash_index_5_2, %13, %c64_i32, %c64_i32_5, %c4096_i32, %c4096_i32_6) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>, memref<256xbf16>, memref<2xi32>, bf16, i32, i32, i32, i32) -> ()
            %14 = aie.objectfifo.acquire @flash_scale_5_2(Produce, 1) : !aie.objectfifosubview<memref<256xbf16>>
            %15 = aie.objectfifo.subview.access %14[0] : !aie.objectfifosubview<memref<256xbf16>> -> memref<256xbf16>
            %c256_i32 = arith.constant 256 : i32
            func.call @op0_passThroughLine(%flash_state_5_2, %15, %c256_i32) : (memref<256xbf16>, memref<256xbf16>, i32) -> ()
            aie.objectfifo.release @flash_scale_5_2(Produce, 1)
            aie.objectfifo.release @of_4_broadcast_0_0(Consume, 1)
            aie.objectfifo.release @of_6_switch_join_5_0(Produce, 1)
          }
          aie.objectfifo.release @of_3_distribute_5_0(Consume, 1)
        }
      }
      aie.end
    } {link_with = "op0_mha.o"}
    %flash_state_6_2 = aie.buffer(%tile_6_2) {sym_name = "flash_state_6_2"} : memref<256xbf16> 
    %flash_index_6_2 = aie.buffer(%tile_6_2) {sym_name = "flash_index_6_2"} : memref<2xi32> 
    %core_6_2 = aie.core(%tile_6_2) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c4 = arith.constant 4 : index
        scf.for %arg1 = %c0_0 to %c4 step %c1_1 {
          %0 = aie.objectfifo.acquire @of_3_distribute_6_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
          %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
          %c64 = arith.constant 64 : index
          scf.for %arg2 = %c0_0 to %c64 step %c1_1 {
            %2 = aie.objectfifo.acquire @of_6_switch_join_6_0(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
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
            %c16_i32 = arith.constant 16 : i32
            %10 = arith.muli %9, %c16_i32 : i32
            %c6_i32 = arith.constant 6 : i32
            %11 = arith.addi %c6_i32, %10 : i32
            %c0_2 = arith.constant 0 : index
            %c1_3 = arith.constant 1 : index
            memref.store %8, %flash_index_6_2[%c0_2] : memref<2xi32>
            memref.store %11, %flash_index_6_2[%c1_3] : memref<2xi32>
            %c64_i32 = arith.constant 64 : i32
            %c0_i32_4 = arith.constant 0 : i32
            %12 = arith.cmpi eq, %8, %c0_i32_4 : i32
            scf.if %12 {
              func.call @op0_init_scale_buffer(%flash_state_6_2, %c64_i32) : (memref<256xbf16>, i32) -> ()
            }
            %cst = arith.constant 1.4453125 : f32
            %13 = arith.truncf %cst : f32 to bf16
            %c64_i32_5 = arith.constant 64 : i32
            %c4096_i32 = arith.constant 4096 : i32
            %c4096_i32_6 = arith.constant 4096 : i32
            func.call @op0_matmul_softmax(%1, %5, %3, %flash_state_6_2, %flash_index_6_2, %13, %c64_i32, %c64_i32_5, %c4096_i32, %c4096_i32_6) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>, memref<256xbf16>, memref<2xi32>, bf16, i32, i32, i32, i32) -> ()
            %14 = aie.objectfifo.acquire @flash_scale_6_2(Produce, 1) : !aie.objectfifosubview<memref<256xbf16>>
            %15 = aie.objectfifo.subview.access %14[0] : !aie.objectfifosubview<memref<256xbf16>> -> memref<256xbf16>
            %c256_i32 = arith.constant 256 : i32
            func.call @op0_passThroughLine(%flash_state_6_2, %15, %c256_i32) : (memref<256xbf16>, memref<256xbf16>, i32) -> ()
            aie.objectfifo.release @flash_scale_6_2(Produce, 1)
            aie.objectfifo.release @of_4_broadcast_0_0(Consume, 1)
            aie.objectfifo.release @of_6_switch_join_6_0(Produce, 1)
          }
          aie.objectfifo.release @of_3_distribute_6_0(Consume, 1)
        }
      }
      aie.end
    } {link_with = "op0_mha.o"}
    %flash_state_7_2 = aie.buffer(%tile_7_2) {sym_name = "flash_state_7_2"} : memref<256xbf16> 
    %flash_index_7_2 = aie.buffer(%tile_7_2) {sym_name = "flash_index_7_2"} : memref<2xi32> 
    %core_7_2 = aie.core(%tile_7_2) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c4 = arith.constant 4 : index
        scf.for %arg1 = %c0_0 to %c4 step %c1_1 {
          %0 = aie.objectfifo.acquire @of_3_distribute_7_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
          %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
          %c64 = arith.constant 64 : index
          scf.for %arg2 = %c0_0 to %c64 step %c1_1 {
            %2 = aie.objectfifo.acquire @of_6_switch_join_7_0(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
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
            %c16_i32 = arith.constant 16 : i32
            %10 = arith.muli %9, %c16_i32 : i32
            %c7_i32 = arith.constant 7 : i32
            %11 = arith.addi %c7_i32, %10 : i32
            %c0_2 = arith.constant 0 : index
            %c1_3 = arith.constant 1 : index
            memref.store %8, %flash_index_7_2[%c0_2] : memref<2xi32>
            memref.store %11, %flash_index_7_2[%c1_3] : memref<2xi32>
            %c64_i32 = arith.constant 64 : i32
            %c0_i32_4 = arith.constant 0 : i32
            %12 = arith.cmpi eq, %8, %c0_i32_4 : i32
            scf.if %12 {
              func.call @op0_init_scale_buffer(%flash_state_7_2, %c64_i32) : (memref<256xbf16>, i32) -> ()
            }
            %cst = arith.constant 1.4453125 : f32
            %13 = arith.truncf %cst : f32 to bf16
            %c64_i32_5 = arith.constant 64 : i32
            %c4096_i32 = arith.constant 4096 : i32
            %c4096_i32_6 = arith.constant 4096 : i32
            func.call @op0_matmul_softmax(%1, %5, %3, %flash_state_7_2, %flash_index_7_2, %13, %c64_i32, %c64_i32_5, %c4096_i32, %c4096_i32_6) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>, memref<256xbf16>, memref<2xi32>, bf16, i32, i32, i32, i32) -> ()
            %14 = aie.objectfifo.acquire @flash_scale_7_2(Produce, 1) : !aie.objectfifosubview<memref<256xbf16>>
            %15 = aie.objectfifo.subview.access %14[0] : !aie.objectfifosubview<memref<256xbf16>> -> memref<256xbf16>
            %c256_i32 = arith.constant 256 : i32
            func.call @op0_passThroughLine(%flash_state_7_2, %15, %c256_i32) : (memref<256xbf16>, memref<256xbf16>, i32) -> ()
            aie.objectfifo.release @flash_scale_7_2(Produce, 1)
            aie.objectfifo.release @of_4_broadcast_0_0(Consume, 1)
            aie.objectfifo.release @of_6_switch_join_7_0(Produce, 1)
          }
          aie.objectfifo.release @of_3_distribute_7_0(Consume, 1)
        }
      }
      aie.end
    } {link_with = "op0_mha.o"}
    %flash_state_0_4 = aie.buffer(%tile_0_4) {sym_name = "flash_state_0_4"} : memref<256xbf16> 
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
          %0 = aie.objectfifo.acquire @of_3_distribute_0_1(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
          %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
          %c64 = arith.constant 64 : index
          scf.for %arg2 = %c0_0 to %c64 step %c1_1 {
            %2 = aie.objectfifo.acquire @of_6_switch_join_0_1(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
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
            %c16_i32 = arith.constant 16 : i32
            %10 = arith.muli %9, %c16_i32 : i32
            %c8_i32 = arith.constant 8 : i32
            %11 = arith.addi %c8_i32, %10 : i32
            %c0_2 = arith.constant 0 : index
            %c1_3 = arith.constant 1 : index
            memref.store %8, %flash_index_0_4[%c0_2] : memref<2xi32>
            memref.store %11, %flash_index_0_4[%c1_3] : memref<2xi32>
            %c64_i32 = arith.constant 64 : i32
            %c0_i32_4 = arith.constant 0 : i32
            %12 = arith.cmpi eq, %8, %c0_i32_4 : i32
            scf.if %12 {
              func.call @op0_init_scale_buffer(%flash_state_0_4, %c64_i32) : (memref<256xbf16>, i32) -> ()
            }
            %cst = arith.constant 1.4453125 : f32
            %13 = arith.truncf %cst : f32 to bf16
            %c64_i32_5 = arith.constant 64 : i32
            %c4096_i32 = arith.constant 4096 : i32
            %c4096_i32_6 = arith.constant 4096 : i32
            func.call @op0_matmul_softmax(%1, %5, %3, %flash_state_0_4, %flash_index_0_4, %13, %c64_i32, %c64_i32_5, %c4096_i32, %c4096_i32_6) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>, memref<256xbf16>, memref<2xi32>, bf16, i32, i32, i32, i32) -> ()
            %14 = aie.objectfifo.acquire @flash_scale_0_4(Produce, 1) : !aie.objectfifosubview<memref<256xbf16>>
            %15 = aie.objectfifo.subview.access %14[0] : !aie.objectfifosubview<memref<256xbf16>> -> memref<256xbf16>
            %c256_i32 = arith.constant 256 : i32
            func.call @op0_passThroughLine(%flash_state_0_4, %15, %c256_i32) : (memref<256xbf16>, memref<256xbf16>, i32) -> ()
            aie.objectfifo.release @flash_scale_0_4(Produce, 1)
            aie.objectfifo.release @of_4_broadcast_0_0(Consume, 1)
            aie.objectfifo.release @of_6_switch_join_0_1(Produce, 1)
          }
          aie.objectfifo.release @of_3_distribute_0_1(Consume, 1)
        }
      }
      aie.end
    } {link_with = "op0_mha.o"}
    %flash_state_1_4 = aie.buffer(%tile_1_4) {sym_name = "flash_state_1_4"} : memref<256xbf16> 
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
          %0 = aie.objectfifo.acquire @of_3_distribute_1_1(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
          %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
          %c64 = arith.constant 64 : index
          scf.for %arg2 = %c0_0 to %c64 step %c1_1 {
            %2 = aie.objectfifo.acquire @of_6_switch_join_1_1(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
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
            %c16_i32 = arith.constant 16 : i32
            %10 = arith.muli %9, %c16_i32 : i32
            %c9_i32 = arith.constant 9 : i32
            %11 = arith.addi %c9_i32, %10 : i32
            %c0_2 = arith.constant 0 : index
            %c1_3 = arith.constant 1 : index
            memref.store %8, %flash_index_1_4[%c0_2] : memref<2xi32>
            memref.store %11, %flash_index_1_4[%c1_3] : memref<2xi32>
            %c64_i32 = arith.constant 64 : i32
            %c0_i32_4 = arith.constant 0 : i32
            %12 = arith.cmpi eq, %8, %c0_i32_4 : i32
            scf.if %12 {
              func.call @op0_init_scale_buffer(%flash_state_1_4, %c64_i32) : (memref<256xbf16>, i32) -> ()
            }
            %cst = arith.constant 1.4453125 : f32
            %13 = arith.truncf %cst : f32 to bf16
            %c64_i32_5 = arith.constant 64 : i32
            %c4096_i32 = arith.constant 4096 : i32
            %c4096_i32_6 = arith.constant 4096 : i32
            func.call @op0_matmul_softmax(%1, %5, %3, %flash_state_1_4, %flash_index_1_4, %13, %c64_i32, %c64_i32_5, %c4096_i32, %c4096_i32_6) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>, memref<256xbf16>, memref<2xi32>, bf16, i32, i32, i32, i32) -> ()
            %14 = aie.objectfifo.acquire @flash_scale_1_4(Produce, 1) : !aie.objectfifosubview<memref<256xbf16>>
            %15 = aie.objectfifo.subview.access %14[0] : !aie.objectfifosubview<memref<256xbf16>> -> memref<256xbf16>
            %c256_i32 = arith.constant 256 : i32
            func.call @op0_passThroughLine(%flash_state_1_4, %15, %c256_i32) : (memref<256xbf16>, memref<256xbf16>, i32) -> ()
            aie.objectfifo.release @flash_scale_1_4(Produce, 1)
            aie.objectfifo.release @of_4_broadcast_0_0(Consume, 1)
            aie.objectfifo.release @of_6_switch_join_1_1(Produce, 1)
          }
          aie.objectfifo.release @of_3_distribute_1_1(Consume, 1)
        }
      }
      aie.end
    } {link_with = "op0_mha.o"}
    %flash_state_2_4 = aie.buffer(%tile_2_4) {sym_name = "flash_state_2_4"} : memref<256xbf16> 
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
          %0 = aie.objectfifo.acquire @of_3_distribute_2_1(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
          %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
          %c64 = arith.constant 64 : index
          scf.for %arg2 = %c0_0 to %c64 step %c1_1 {
            %2 = aie.objectfifo.acquire @of_6_switch_join_2_1(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
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
            %c16_i32 = arith.constant 16 : i32
            %10 = arith.muli %9, %c16_i32 : i32
            %c10_i32 = arith.constant 10 : i32
            %11 = arith.addi %c10_i32, %10 : i32
            %c0_2 = arith.constant 0 : index
            %c1_3 = arith.constant 1 : index
            memref.store %8, %flash_index_2_4[%c0_2] : memref<2xi32>
            memref.store %11, %flash_index_2_4[%c1_3] : memref<2xi32>
            %c64_i32 = arith.constant 64 : i32
            %c0_i32_4 = arith.constant 0 : i32
            %12 = arith.cmpi eq, %8, %c0_i32_4 : i32
            scf.if %12 {
              func.call @op0_init_scale_buffer(%flash_state_2_4, %c64_i32) : (memref<256xbf16>, i32) -> ()
            }
            %cst = arith.constant 1.4453125 : f32
            %13 = arith.truncf %cst : f32 to bf16
            %c64_i32_5 = arith.constant 64 : i32
            %c4096_i32 = arith.constant 4096 : i32
            %c4096_i32_6 = arith.constant 4096 : i32
            func.call @op0_matmul_softmax(%1, %5, %3, %flash_state_2_4, %flash_index_2_4, %13, %c64_i32, %c64_i32_5, %c4096_i32, %c4096_i32_6) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>, memref<256xbf16>, memref<2xi32>, bf16, i32, i32, i32, i32) -> ()
            %14 = aie.objectfifo.acquire @flash_scale_2_4(Produce, 1) : !aie.objectfifosubview<memref<256xbf16>>
            %15 = aie.objectfifo.subview.access %14[0] : !aie.objectfifosubview<memref<256xbf16>> -> memref<256xbf16>
            %c256_i32 = arith.constant 256 : i32
            func.call @op0_passThroughLine(%flash_state_2_4, %15, %c256_i32) : (memref<256xbf16>, memref<256xbf16>, i32) -> ()
            aie.objectfifo.release @flash_scale_2_4(Produce, 1)
            aie.objectfifo.release @of_4_broadcast_0_0(Consume, 1)
            aie.objectfifo.release @of_6_switch_join_2_1(Produce, 1)
          }
          aie.objectfifo.release @of_3_distribute_2_1(Consume, 1)
        }
      }
      aie.end
    } {link_with = "op0_mha.o"}
    %flash_state_3_4 = aie.buffer(%tile_3_4) {sym_name = "flash_state_3_4"} : memref<256xbf16> 
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
          %0 = aie.objectfifo.acquire @of_3_distribute_3_1(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
          %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
          %c64 = arith.constant 64 : index
          scf.for %arg2 = %c0_0 to %c64 step %c1_1 {
            %2 = aie.objectfifo.acquire @of_6_switch_join_3_1(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
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
            %c16_i32 = arith.constant 16 : i32
            %10 = arith.muli %9, %c16_i32 : i32
            %c11_i32 = arith.constant 11 : i32
            %11 = arith.addi %c11_i32, %10 : i32
            %c0_2 = arith.constant 0 : index
            %c1_3 = arith.constant 1 : index
            memref.store %8, %flash_index_3_4[%c0_2] : memref<2xi32>
            memref.store %11, %flash_index_3_4[%c1_3] : memref<2xi32>
            %c64_i32 = arith.constant 64 : i32
            %c0_i32_4 = arith.constant 0 : i32
            %12 = arith.cmpi eq, %8, %c0_i32_4 : i32
            scf.if %12 {
              func.call @op0_init_scale_buffer(%flash_state_3_4, %c64_i32) : (memref<256xbf16>, i32) -> ()
            }
            %cst = arith.constant 1.4453125 : f32
            %13 = arith.truncf %cst : f32 to bf16
            %c64_i32_5 = arith.constant 64 : i32
            %c4096_i32 = arith.constant 4096 : i32
            %c4096_i32_6 = arith.constant 4096 : i32
            func.call @op0_matmul_softmax(%1, %5, %3, %flash_state_3_4, %flash_index_3_4, %13, %c64_i32, %c64_i32_5, %c4096_i32, %c4096_i32_6) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>, memref<256xbf16>, memref<2xi32>, bf16, i32, i32, i32, i32) -> ()
            %14 = aie.objectfifo.acquire @flash_scale_3_4(Produce, 1) : !aie.objectfifosubview<memref<256xbf16>>
            %15 = aie.objectfifo.subview.access %14[0] : !aie.objectfifosubview<memref<256xbf16>> -> memref<256xbf16>
            %c256_i32 = arith.constant 256 : i32
            func.call @op0_passThroughLine(%flash_state_3_4, %15, %c256_i32) : (memref<256xbf16>, memref<256xbf16>, i32) -> ()
            aie.objectfifo.release @flash_scale_3_4(Produce, 1)
            aie.objectfifo.release @of_4_broadcast_0_0(Consume, 1)
            aie.objectfifo.release @of_6_switch_join_3_1(Produce, 1)
          }
          aie.objectfifo.release @of_3_distribute_3_1(Consume, 1)
        }
      }
      aie.end
    } {link_with = "op0_mha.o"}
    %flash_state_4_4 = aie.buffer(%tile_4_4) {sym_name = "flash_state_4_4"} : memref<256xbf16> 
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
          %0 = aie.objectfifo.acquire @of_3_distribute_4_1(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
          %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
          %c64 = arith.constant 64 : index
          scf.for %arg2 = %c0_0 to %c64 step %c1_1 {
            %2 = aie.objectfifo.acquire @of_6_switch_join_4_1(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
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
            %c16_i32 = arith.constant 16 : i32
            %10 = arith.muli %9, %c16_i32 : i32
            %c12_i32 = arith.constant 12 : i32
            %11 = arith.addi %c12_i32, %10 : i32
            %c0_2 = arith.constant 0 : index
            %c1_3 = arith.constant 1 : index
            memref.store %8, %flash_index_4_4[%c0_2] : memref<2xi32>
            memref.store %11, %flash_index_4_4[%c1_3] : memref<2xi32>
            %c64_i32 = arith.constant 64 : i32
            %c0_i32_4 = arith.constant 0 : i32
            %12 = arith.cmpi eq, %8, %c0_i32_4 : i32
            scf.if %12 {
              func.call @op0_init_scale_buffer(%flash_state_4_4, %c64_i32) : (memref<256xbf16>, i32) -> ()
            }
            %cst = arith.constant 1.4453125 : f32
            %13 = arith.truncf %cst : f32 to bf16
            %c64_i32_5 = arith.constant 64 : i32
            %c4096_i32 = arith.constant 4096 : i32
            %c4096_i32_6 = arith.constant 4096 : i32
            func.call @op0_matmul_softmax(%1, %5, %3, %flash_state_4_4, %flash_index_4_4, %13, %c64_i32, %c64_i32_5, %c4096_i32, %c4096_i32_6) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>, memref<256xbf16>, memref<2xi32>, bf16, i32, i32, i32, i32) -> ()
            %14 = aie.objectfifo.acquire @flash_scale_4_4(Produce, 1) : !aie.objectfifosubview<memref<256xbf16>>
            %15 = aie.objectfifo.subview.access %14[0] : !aie.objectfifosubview<memref<256xbf16>> -> memref<256xbf16>
            %c256_i32 = arith.constant 256 : i32
            func.call @op0_passThroughLine(%flash_state_4_4, %15, %c256_i32) : (memref<256xbf16>, memref<256xbf16>, i32) -> ()
            aie.objectfifo.release @flash_scale_4_4(Produce, 1)
            aie.objectfifo.release @of_4_broadcast_0_0(Consume, 1)
            aie.objectfifo.release @of_6_switch_join_4_1(Produce, 1)
          }
          aie.objectfifo.release @of_3_distribute_4_1(Consume, 1)
        }
      }
      aie.end
    } {link_with = "op0_mha.o"}
    %flash_state_5_4 = aie.buffer(%tile_5_4) {sym_name = "flash_state_5_4"} : memref<256xbf16> 
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
          %0 = aie.objectfifo.acquire @of_3_distribute_5_1(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
          %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
          %c64 = arith.constant 64 : index
          scf.for %arg2 = %c0_0 to %c64 step %c1_1 {
            %2 = aie.objectfifo.acquire @of_6_switch_join_5_1(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
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
            %c16_i32 = arith.constant 16 : i32
            %10 = arith.muli %9, %c16_i32 : i32
            %c13_i32 = arith.constant 13 : i32
            %11 = arith.addi %c13_i32, %10 : i32
            %c0_2 = arith.constant 0 : index
            %c1_3 = arith.constant 1 : index
            memref.store %8, %flash_index_5_4[%c0_2] : memref<2xi32>
            memref.store %11, %flash_index_5_4[%c1_3] : memref<2xi32>
            %c64_i32 = arith.constant 64 : i32
            %c0_i32_4 = arith.constant 0 : i32
            %12 = arith.cmpi eq, %8, %c0_i32_4 : i32
            scf.if %12 {
              func.call @op0_init_scale_buffer(%flash_state_5_4, %c64_i32) : (memref<256xbf16>, i32) -> ()
            }
            %cst = arith.constant 1.4453125 : f32
            %13 = arith.truncf %cst : f32 to bf16
            %c64_i32_5 = arith.constant 64 : i32
            %c4096_i32 = arith.constant 4096 : i32
            %c4096_i32_6 = arith.constant 4096 : i32
            func.call @op0_matmul_softmax(%1, %5, %3, %flash_state_5_4, %flash_index_5_4, %13, %c64_i32, %c64_i32_5, %c4096_i32, %c4096_i32_6) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>, memref<256xbf16>, memref<2xi32>, bf16, i32, i32, i32, i32) -> ()
            %14 = aie.objectfifo.acquire @flash_scale_5_4(Produce, 1) : !aie.objectfifosubview<memref<256xbf16>>
            %15 = aie.objectfifo.subview.access %14[0] : !aie.objectfifosubview<memref<256xbf16>> -> memref<256xbf16>
            %c256_i32 = arith.constant 256 : i32
            func.call @op0_passThroughLine(%flash_state_5_4, %15, %c256_i32) : (memref<256xbf16>, memref<256xbf16>, i32) -> ()
            aie.objectfifo.release @flash_scale_5_4(Produce, 1)
            aie.objectfifo.release @of_4_broadcast_0_0(Consume, 1)
            aie.objectfifo.release @of_6_switch_join_5_1(Produce, 1)
          }
          aie.objectfifo.release @of_3_distribute_5_1(Consume, 1)
        }
      }
      aie.end
    } {link_with = "op0_mha.o"}
    %flash_state_6_4 = aie.buffer(%tile_6_4) {sym_name = "flash_state_6_4"} : memref<256xbf16> 
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
          %0 = aie.objectfifo.acquire @of_3_distribute_6_1(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
          %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
          %c64 = arith.constant 64 : index
          scf.for %arg2 = %c0_0 to %c64 step %c1_1 {
            %2 = aie.objectfifo.acquire @of_6_switch_join_6_1(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
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
            %c16_i32 = arith.constant 16 : i32
            %10 = arith.muli %9, %c16_i32 : i32
            %c14_i32 = arith.constant 14 : i32
            %11 = arith.addi %c14_i32, %10 : i32
            %c0_2 = arith.constant 0 : index
            %c1_3 = arith.constant 1 : index
            memref.store %8, %flash_index_6_4[%c0_2] : memref<2xi32>
            memref.store %11, %flash_index_6_4[%c1_3] : memref<2xi32>
            %c64_i32 = arith.constant 64 : i32
            %c0_i32_4 = arith.constant 0 : i32
            %12 = arith.cmpi eq, %8, %c0_i32_4 : i32
            scf.if %12 {
              func.call @op0_init_scale_buffer(%flash_state_6_4, %c64_i32) : (memref<256xbf16>, i32) -> ()
            }
            %cst = arith.constant 1.4453125 : f32
            %13 = arith.truncf %cst : f32 to bf16
            %c64_i32_5 = arith.constant 64 : i32
            %c4096_i32 = arith.constant 4096 : i32
            %c4096_i32_6 = arith.constant 4096 : i32
            func.call @op0_matmul_softmax(%1, %5, %3, %flash_state_6_4, %flash_index_6_4, %13, %c64_i32, %c64_i32_5, %c4096_i32, %c4096_i32_6) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>, memref<256xbf16>, memref<2xi32>, bf16, i32, i32, i32, i32) -> ()
            %14 = aie.objectfifo.acquire @flash_scale_6_4(Produce, 1) : !aie.objectfifosubview<memref<256xbf16>>
            %15 = aie.objectfifo.subview.access %14[0] : !aie.objectfifosubview<memref<256xbf16>> -> memref<256xbf16>
            %c256_i32 = arith.constant 256 : i32
            func.call @op0_passThroughLine(%flash_state_6_4, %15, %c256_i32) : (memref<256xbf16>, memref<256xbf16>, i32) -> ()
            aie.objectfifo.release @flash_scale_6_4(Produce, 1)
            aie.objectfifo.release @of_4_broadcast_0_0(Consume, 1)
            aie.objectfifo.release @of_6_switch_join_6_1(Produce, 1)
          }
          aie.objectfifo.release @of_3_distribute_6_1(Consume, 1)
        }
      }
      aie.end
    } {link_with = "op0_mha.o"}
    %flash_state_7_4 = aie.buffer(%tile_7_4) {sym_name = "flash_state_7_4"} : memref<256xbf16> 
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
          %0 = aie.objectfifo.acquire @of_3_distribute_7_1(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
          %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
          %c64 = arith.constant 64 : index
          scf.for %arg2 = %c0_0 to %c64 step %c1_1 {
            %2 = aie.objectfifo.acquire @of_6_switch_join_7_1(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
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
            %c16_i32 = arith.constant 16 : i32
            %10 = arith.muli %9, %c16_i32 : i32
            %c15_i32 = arith.constant 15 : i32
            %11 = arith.addi %c15_i32, %10 : i32
            %c0_2 = arith.constant 0 : index
            %c1_3 = arith.constant 1 : index
            memref.store %8, %flash_index_7_4[%c0_2] : memref<2xi32>
            memref.store %11, %flash_index_7_4[%c1_3] : memref<2xi32>
            %c64_i32 = arith.constant 64 : i32
            %c0_i32_4 = arith.constant 0 : i32
            %12 = arith.cmpi eq, %8, %c0_i32_4 : i32
            scf.if %12 {
              func.call @op0_init_scale_buffer(%flash_state_7_4, %c64_i32) : (memref<256xbf16>, i32) -> ()
            }
            %cst = arith.constant 1.4453125 : f32
            %13 = arith.truncf %cst : f32 to bf16
            %c64_i32_5 = arith.constant 64 : i32
            %c4096_i32 = arith.constant 4096 : i32
            %c4096_i32_6 = arith.constant 4096 : i32
            func.call @op0_matmul_softmax(%1, %5, %3, %flash_state_7_4, %flash_index_7_4, %13, %c64_i32, %c64_i32_5, %c4096_i32, %c4096_i32_6) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>, memref<256xbf16>, memref<2xi32>, bf16, i32, i32, i32, i32) -> ()
            %14 = aie.objectfifo.acquire @flash_scale_7_4(Produce, 1) : !aie.objectfifosubview<memref<256xbf16>>
            %15 = aie.objectfifo.subview.access %14[0] : !aie.objectfifosubview<memref<256xbf16>> -> memref<256xbf16>
            %c256_i32 = arith.constant 256 : i32
            func.call @op0_passThroughLine(%flash_state_7_4, %15, %c256_i32) : (memref<256xbf16>, memref<256xbf16>, i32) -> ()
            aie.objectfifo.release @flash_scale_7_4(Produce, 1)
            aie.objectfifo.release @of_4_broadcast_0_0(Consume, 1)
            aie.objectfifo.release @of_6_switch_join_7_1(Produce, 1)
          }
          aie.objectfifo.release @of_3_distribute_7_1(Consume, 1)
        }
      }
      aie.end
    } {link_with = "op0_mha.o"}
    %flash_index_0_3 = aie.buffer(%tile_0_3) {sym_name = "flash_index_0_3"} : memref<2xi32> 
    aie.objectfifo @flash_scale_0_4(%tile_0_4, {%tile_0_3}, 2 : i32) : !aie.objectfifo<memref<256xbf16>>  
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
          %0 = aie.objectfifo.acquire @of_7_unicast_0(Produce, 2) : !aie.objectfifosubview<memref<64x64xbf16>>
          %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
          func.call @op0_zero_bf16(%1) : (memref<64x64xbf16>) -> ()
          %2 = aie.objectfifo.subview.access %0[1] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
          func.call @op0_zero_bf16(%2) : (memref<64x64xbf16>) -> ()
          %c64 = arith.constant 64 : index
          scf.for %arg2 = %c0_0 to %c64 step %c1_1 {
            %3 = aie.objectfifo.acquire @of_5_broadcast_0_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %4 = aie.objectfifo.subview.access %3[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            %c2 = arith.constant 2 : index
            %5 = aie.objectfifo.acquire @of_6_switch_join_0_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %6 = aie.objectfifo.acquire @of_6_switch_join_0_1(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %7 = aie.objectfifo.subview.access %5[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            %8 = aie.objectfifo.subview.access %6[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            scf.for %arg3 = %c0_0 to %c2 step %c1_1 {
              %c1_2 = arith.constant 1 : index
              %c0_3 = arith.constant 0 : index
              %9 = arith.muli %c1_2, %arg3 : index
              %10 = arith.addi %c0_3, %9 : index
              %11 = arith.muli %c1_2, %c2 : index
              %12 = scf.index_switch %10 -> memref<64x64xbf16> 
              case 0 {
                scf.yield %1 : memref<64x64xbf16>
              }
              case 1 {
                scf.yield %2 : memref<64x64xbf16>
              }
              default {
                scf.yield %1 : memref<64x64xbf16>
              }
              %13 = scf.index_switch %arg3 -> memref<64x64xbf16> 
              case 0 {
                scf.yield %7 : memref<64x64xbf16>
              }
              case 1 {
                scf.yield %8 : memref<64x64xbf16>
              }
              default {
                scf.yield %7 : memref<64x64xbf16>
              }
              %14 = arith.index_cast %arg2 : index to i32
              %c1_i32 = arith.constant 1 : i32
              %15 = arith.muli %14, %c1_i32 : i32
              %c0_i32 = arith.constant 0 : i32
              %16 = arith.addi %c0_i32, %15 : i32
              %17 = arith.index_cast %arg3 : index to i32
              %c8_i32 = arith.constant 8 : i32
              %18 = arith.muli %17, %c8_i32 : i32
              %19 = arith.index_cast %arg1 : index to i32
              %c16_i32 = arith.constant 16 : i32
              %20 = arith.muli %19, %c16_i32 : i32
              %c0_i32_4 = arith.constant 0 : i32
              %21 = arith.addi %c0_i32_4, %18 : i32
              %22 = arith.addi %21, %20 : i32
              %c0_5 = arith.constant 0 : index
              %c1_6 = arith.constant 1 : index
              memref.store %16, %flash_index_0_3[%c0_5] : memref<2xi32>
              memref.store %22, %flash_index_0_3[%c1_6] : memref<2xi32>
              scf.index_switch %arg3 
              case 0 {
                %23 = aie.objectfifo.acquire @flash_scale_0_2(Consume, 1) : !aie.objectfifosubview<memref<256xbf16>>
                %24 = aie.objectfifo.subview.access %23[0] : !aie.objectfifosubview<memref<256xbf16>> -> memref<256xbf16>
                %c64_i32 = arith.constant 64 : i32
                %c0_i32_7 = arith.constant 0 : i32
                %25 = arith.cmpi ne, %16, %c0_i32_7 : i32
                %26 = arith.extui %25 : i1 to i32
                func.call @op0_matmul_PV(%13, %4, %12, %24, %c64_i32, %26, %flash_index_0_3) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>, memref<256xbf16>, i32, i32, memref<2xi32>) -> ()
                %c63_i32 = arith.constant 63 : i32
                %27 = arith.cmpi eq, %16, %c63_i32 : i32
                scf.if %27 {
                  func.call @op0_rescale_O(%12, %24, %c64_i32, %flash_index_0_3) : (memref<64x64xbf16>, memref<256xbf16>, i32, memref<2xi32>) -> ()
                }
                aie.objectfifo.release @flash_scale_0_2(Consume, 1)
                scf.yield
              }
              case 1 {
                %23 = aie.objectfifo.acquire @flash_scale_0_4(Consume, 1) : !aie.objectfifosubview<memref<256xbf16>>
                %24 = aie.objectfifo.subview.access %23[0] : !aie.objectfifosubview<memref<256xbf16>> -> memref<256xbf16>
                %c64_i32 = arith.constant 64 : i32
                %c0_i32_7 = arith.constant 0 : i32
                %25 = arith.cmpi ne, %16, %c0_i32_7 : i32
                %26 = arith.extui %25 : i1 to i32
                func.call @op0_matmul_PV(%13, %4, %12, %24, %c64_i32, %26, %flash_index_0_3) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>, memref<256xbf16>, i32, i32, memref<2xi32>) -> ()
                %c63_i32 = arith.constant 63 : i32
                %27 = arith.cmpi eq, %16, %c63_i32 : i32
                scf.if %27 {
                  func.call @op0_rescale_O(%12, %24, %c64_i32, %flash_index_0_3) : (memref<64x64xbf16>, memref<256xbf16>, i32, memref<2xi32>) -> ()
                }
                aie.objectfifo.release @flash_scale_0_4(Consume, 1)
                scf.yield
              }
              default {
                %23 = aie.objectfifo.acquire @flash_scale_0_2(Consume, 1) : !aie.objectfifosubview<memref<256xbf16>>
                %24 = aie.objectfifo.subview.access %23[0] : !aie.objectfifosubview<memref<256xbf16>> -> memref<256xbf16>
                %c64_i32 = arith.constant 64 : i32
                %c0_i32_7 = arith.constant 0 : i32
                %25 = arith.cmpi ne, %16, %c0_i32_7 : i32
                %26 = arith.extui %25 : i1 to i32
                func.call @op0_matmul_PV(%13, %4, %12, %24, %c64_i32, %26, %flash_index_0_3) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>, memref<256xbf16>, i32, i32, memref<2xi32>) -> ()
                %c63_i32 = arith.constant 63 : i32
                %27 = arith.cmpi eq, %16, %c63_i32 : i32
                scf.if %27 {
                  func.call @op0_rescale_O(%12, %24, %c64_i32, %flash_index_0_3) : (memref<64x64xbf16>, memref<256xbf16>, i32, memref<2xi32>) -> ()
                }
                aie.objectfifo.release @flash_scale_0_2(Consume, 1)
              }
            }
            aie.objectfifo.release @of_6_switch_join_0_0(Consume, 1)
            aie.objectfifo.release @of_6_switch_join_0_1(Consume, 1)
            aie.objectfifo.release @of_5_broadcast_0_0(Consume, 1)
          }
          aie.objectfifo.release @of_7_unicast_0(Produce, 2)
        }
      }
      aie.end
    } {link_with = "op0_mha.o"}
    %flash_index_1_3 = aie.buffer(%tile_1_3) {sym_name = "flash_index_1_3"} : memref<2xi32> 
    aie.objectfifo @flash_scale_1_4(%tile_1_4, {%tile_1_3}, 2 : i32) : !aie.objectfifo<memref<256xbf16>>  
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
          %0 = aie.objectfifo.acquire @of_7_unicast_1(Produce, 2) : !aie.objectfifosubview<memref<64x64xbf16>>
          %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
          func.call @op0_zero_bf16(%1) : (memref<64x64xbf16>) -> ()
          %2 = aie.objectfifo.subview.access %0[1] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
          func.call @op0_zero_bf16(%2) : (memref<64x64xbf16>) -> ()
          %c64 = arith.constant 64 : index
          scf.for %arg2 = %c0_0 to %c64 step %c1_1 {
            %3 = aie.objectfifo.acquire @of_5_broadcast_0_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %4 = aie.objectfifo.subview.access %3[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            %c2 = arith.constant 2 : index
            %5 = aie.objectfifo.acquire @of_6_switch_join_1_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %6 = aie.objectfifo.acquire @of_6_switch_join_1_1(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %7 = aie.objectfifo.subview.access %5[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            %8 = aie.objectfifo.subview.access %6[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            scf.for %arg3 = %c0_0 to %c2 step %c1_1 {
              %c1_2 = arith.constant 1 : index
              %c0_3 = arith.constant 0 : index
              %9 = arith.muli %c1_2, %arg3 : index
              %10 = arith.addi %c0_3, %9 : index
              %11 = arith.muli %c1_2, %c2 : index
              %12 = scf.index_switch %10 -> memref<64x64xbf16> 
              case 0 {
                scf.yield %1 : memref<64x64xbf16>
              }
              case 1 {
                scf.yield %2 : memref<64x64xbf16>
              }
              default {
                scf.yield %1 : memref<64x64xbf16>
              }
              %13 = scf.index_switch %arg3 -> memref<64x64xbf16> 
              case 0 {
                scf.yield %7 : memref<64x64xbf16>
              }
              case 1 {
                scf.yield %8 : memref<64x64xbf16>
              }
              default {
                scf.yield %7 : memref<64x64xbf16>
              }
              %14 = arith.index_cast %arg2 : index to i32
              %c1_i32 = arith.constant 1 : i32
              %15 = arith.muli %14, %c1_i32 : i32
              %c0_i32 = arith.constant 0 : i32
              %16 = arith.addi %c0_i32, %15 : i32
              %17 = arith.index_cast %arg3 : index to i32
              %c8_i32 = arith.constant 8 : i32
              %18 = arith.muli %17, %c8_i32 : i32
              %19 = arith.index_cast %arg1 : index to i32
              %c16_i32 = arith.constant 16 : i32
              %20 = arith.muli %19, %c16_i32 : i32
              %c1_i32_4 = arith.constant 1 : i32
              %21 = arith.addi %c1_i32_4, %18 : i32
              %22 = arith.addi %21, %20 : i32
              %c0_5 = arith.constant 0 : index
              %c1_6 = arith.constant 1 : index
              memref.store %16, %flash_index_1_3[%c0_5] : memref<2xi32>
              memref.store %22, %flash_index_1_3[%c1_6] : memref<2xi32>
              scf.index_switch %arg3 
              case 0 {
                %23 = aie.objectfifo.acquire @flash_scale_1_2(Consume, 1) : !aie.objectfifosubview<memref<256xbf16>>
                %24 = aie.objectfifo.subview.access %23[0] : !aie.objectfifosubview<memref<256xbf16>> -> memref<256xbf16>
                %c64_i32 = arith.constant 64 : i32
                %c0_i32_7 = arith.constant 0 : i32
                %25 = arith.cmpi ne, %16, %c0_i32_7 : i32
                %26 = arith.extui %25 : i1 to i32
                func.call @op0_matmul_PV(%13, %4, %12, %24, %c64_i32, %26, %flash_index_1_3) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>, memref<256xbf16>, i32, i32, memref<2xi32>) -> ()
                %c63_i32 = arith.constant 63 : i32
                %27 = arith.cmpi eq, %16, %c63_i32 : i32
                scf.if %27 {
                  func.call @op0_rescale_O(%12, %24, %c64_i32, %flash_index_1_3) : (memref<64x64xbf16>, memref<256xbf16>, i32, memref<2xi32>) -> ()
                }
                aie.objectfifo.release @flash_scale_1_2(Consume, 1)
                scf.yield
              }
              case 1 {
                %23 = aie.objectfifo.acquire @flash_scale_1_4(Consume, 1) : !aie.objectfifosubview<memref<256xbf16>>
                %24 = aie.objectfifo.subview.access %23[0] : !aie.objectfifosubview<memref<256xbf16>> -> memref<256xbf16>
                %c64_i32 = arith.constant 64 : i32
                %c0_i32_7 = arith.constant 0 : i32
                %25 = arith.cmpi ne, %16, %c0_i32_7 : i32
                %26 = arith.extui %25 : i1 to i32
                func.call @op0_matmul_PV(%13, %4, %12, %24, %c64_i32, %26, %flash_index_1_3) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>, memref<256xbf16>, i32, i32, memref<2xi32>) -> ()
                %c63_i32 = arith.constant 63 : i32
                %27 = arith.cmpi eq, %16, %c63_i32 : i32
                scf.if %27 {
                  func.call @op0_rescale_O(%12, %24, %c64_i32, %flash_index_1_3) : (memref<64x64xbf16>, memref<256xbf16>, i32, memref<2xi32>) -> ()
                }
                aie.objectfifo.release @flash_scale_1_4(Consume, 1)
                scf.yield
              }
              default {
                %23 = aie.objectfifo.acquire @flash_scale_1_2(Consume, 1) : !aie.objectfifosubview<memref<256xbf16>>
                %24 = aie.objectfifo.subview.access %23[0] : !aie.objectfifosubview<memref<256xbf16>> -> memref<256xbf16>
                %c64_i32 = arith.constant 64 : i32
                %c0_i32_7 = arith.constant 0 : i32
                %25 = arith.cmpi ne, %16, %c0_i32_7 : i32
                %26 = arith.extui %25 : i1 to i32
                func.call @op0_matmul_PV(%13, %4, %12, %24, %c64_i32, %26, %flash_index_1_3) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>, memref<256xbf16>, i32, i32, memref<2xi32>) -> ()
                %c63_i32 = arith.constant 63 : i32
                %27 = arith.cmpi eq, %16, %c63_i32 : i32
                scf.if %27 {
                  func.call @op0_rescale_O(%12, %24, %c64_i32, %flash_index_1_3) : (memref<64x64xbf16>, memref<256xbf16>, i32, memref<2xi32>) -> ()
                }
                aie.objectfifo.release @flash_scale_1_2(Consume, 1)
              }
            }
            aie.objectfifo.release @of_6_switch_join_1_0(Consume, 1)
            aie.objectfifo.release @of_6_switch_join_1_1(Consume, 1)
            aie.objectfifo.release @of_5_broadcast_0_0(Consume, 1)
          }
          aie.objectfifo.release @of_7_unicast_1(Produce, 2)
        }
      }
      aie.end
    } {link_with = "op0_mha.o"}
    %flash_index_2_3 = aie.buffer(%tile_2_3) {sym_name = "flash_index_2_3"} : memref<2xi32> 
    aie.objectfifo @flash_scale_2_4(%tile_2_4, {%tile_2_3}, 2 : i32) : !aie.objectfifo<memref<256xbf16>>  
    aie.objectfifo @flash_scale_2_2(%tile_2_2, {%tile_2_3}, 2 : i32) : !aie.objectfifo<memref<256xbf16>>  
    %core_2_3 = aie.core(%tile_2_3) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c4 = arith.constant 4 : index
        scf.for %arg1 = %c0_0 to %c4 step %c1_1 {
          %0 = aie.objectfifo.acquire @of_7_unicast_2(Produce, 2) : !aie.objectfifosubview<memref<64x64xbf16>>
          %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
          func.call @op0_zero_bf16(%1) : (memref<64x64xbf16>) -> ()
          %2 = aie.objectfifo.subview.access %0[1] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
          func.call @op0_zero_bf16(%2) : (memref<64x64xbf16>) -> ()
          %c64 = arith.constant 64 : index
          scf.for %arg2 = %c0_0 to %c64 step %c1_1 {
            %3 = aie.objectfifo.acquire @of_5_broadcast_0_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %4 = aie.objectfifo.subview.access %3[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            %c2 = arith.constant 2 : index
            %5 = aie.objectfifo.acquire @of_6_switch_join_2_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %6 = aie.objectfifo.acquire @of_6_switch_join_2_1(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %7 = aie.objectfifo.subview.access %5[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            %8 = aie.objectfifo.subview.access %6[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            scf.for %arg3 = %c0_0 to %c2 step %c1_1 {
              %c1_2 = arith.constant 1 : index
              %c0_3 = arith.constant 0 : index
              %9 = arith.muli %c1_2, %arg3 : index
              %10 = arith.addi %c0_3, %9 : index
              %11 = arith.muli %c1_2, %c2 : index
              %12 = scf.index_switch %10 -> memref<64x64xbf16> 
              case 0 {
                scf.yield %1 : memref<64x64xbf16>
              }
              case 1 {
                scf.yield %2 : memref<64x64xbf16>
              }
              default {
                scf.yield %1 : memref<64x64xbf16>
              }
              %13 = scf.index_switch %arg3 -> memref<64x64xbf16> 
              case 0 {
                scf.yield %7 : memref<64x64xbf16>
              }
              case 1 {
                scf.yield %8 : memref<64x64xbf16>
              }
              default {
                scf.yield %7 : memref<64x64xbf16>
              }
              %14 = arith.index_cast %arg2 : index to i32
              %c1_i32 = arith.constant 1 : i32
              %15 = arith.muli %14, %c1_i32 : i32
              %c0_i32 = arith.constant 0 : i32
              %16 = arith.addi %c0_i32, %15 : i32
              %17 = arith.index_cast %arg3 : index to i32
              %c8_i32 = arith.constant 8 : i32
              %18 = arith.muli %17, %c8_i32 : i32
              %19 = arith.index_cast %arg1 : index to i32
              %c16_i32 = arith.constant 16 : i32
              %20 = arith.muli %19, %c16_i32 : i32
              %c2_i32 = arith.constant 2 : i32
              %21 = arith.addi %c2_i32, %18 : i32
              %22 = arith.addi %21, %20 : i32
              %c0_4 = arith.constant 0 : index
              %c1_5 = arith.constant 1 : index
              memref.store %16, %flash_index_2_3[%c0_4] : memref<2xi32>
              memref.store %22, %flash_index_2_3[%c1_5] : memref<2xi32>
              scf.index_switch %arg3 
              case 0 {
                %23 = aie.objectfifo.acquire @flash_scale_2_2(Consume, 1) : !aie.objectfifosubview<memref<256xbf16>>
                %24 = aie.objectfifo.subview.access %23[0] : !aie.objectfifosubview<memref<256xbf16>> -> memref<256xbf16>
                %c64_i32 = arith.constant 64 : i32
                %c0_i32_6 = arith.constant 0 : i32
                %25 = arith.cmpi ne, %16, %c0_i32_6 : i32
                %26 = arith.extui %25 : i1 to i32
                func.call @op0_matmul_PV(%13, %4, %12, %24, %c64_i32, %26, %flash_index_2_3) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>, memref<256xbf16>, i32, i32, memref<2xi32>) -> ()
                %c63_i32 = arith.constant 63 : i32
                %27 = arith.cmpi eq, %16, %c63_i32 : i32
                scf.if %27 {
                  func.call @op0_rescale_O(%12, %24, %c64_i32, %flash_index_2_3) : (memref<64x64xbf16>, memref<256xbf16>, i32, memref<2xi32>) -> ()
                }
                aie.objectfifo.release @flash_scale_2_2(Consume, 1)
                scf.yield
              }
              case 1 {
                %23 = aie.objectfifo.acquire @flash_scale_2_4(Consume, 1) : !aie.objectfifosubview<memref<256xbf16>>
                %24 = aie.objectfifo.subview.access %23[0] : !aie.objectfifosubview<memref<256xbf16>> -> memref<256xbf16>
                %c64_i32 = arith.constant 64 : i32
                %c0_i32_6 = arith.constant 0 : i32
                %25 = arith.cmpi ne, %16, %c0_i32_6 : i32
                %26 = arith.extui %25 : i1 to i32
                func.call @op0_matmul_PV(%13, %4, %12, %24, %c64_i32, %26, %flash_index_2_3) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>, memref<256xbf16>, i32, i32, memref<2xi32>) -> ()
                %c63_i32 = arith.constant 63 : i32
                %27 = arith.cmpi eq, %16, %c63_i32 : i32
                scf.if %27 {
                  func.call @op0_rescale_O(%12, %24, %c64_i32, %flash_index_2_3) : (memref<64x64xbf16>, memref<256xbf16>, i32, memref<2xi32>) -> ()
                }
                aie.objectfifo.release @flash_scale_2_4(Consume, 1)
                scf.yield
              }
              default {
                %23 = aie.objectfifo.acquire @flash_scale_2_2(Consume, 1) : !aie.objectfifosubview<memref<256xbf16>>
                %24 = aie.objectfifo.subview.access %23[0] : !aie.objectfifosubview<memref<256xbf16>> -> memref<256xbf16>
                %c64_i32 = arith.constant 64 : i32
                %c0_i32_6 = arith.constant 0 : i32
                %25 = arith.cmpi ne, %16, %c0_i32_6 : i32
                %26 = arith.extui %25 : i1 to i32
                func.call @op0_matmul_PV(%13, %4, %12, %24, %c64_i32, %26, %flash_index_2_3) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>, memref<256xbf16>, i32, i32, memref<2xi32>) -> ()
                %c63_i32 = arith.constant 63 : i32
                %27 = arith.cmpi eq, %16, %c63_i32 : i32
                scf.if %27 {
                  func.call @op0_rescale_O(%12, %24, %c64_i32, %flash_index_2_3) : (memref<64x64xbf16>, memref<256xbf16>, i32, memref<2xi32>) -> ()
                }
                aie.objectfifo.release @flash_scale_2_2(Consume, 1)
              }
            }
            aie.objectfifo.release @of_6_switch_join_2_0(Consume, 1)
            aie.objectfifo.release @of_6_switch_join_2_1(Consume, 1)
            aie.objectfifo.release @of_5_broadcast_0_0(Consume, 1)
          }
          aie.objectfifo.release @of_7_unicast_2(Produce, 2)
        }
      }
      aie.end
    } {link_with = "op0_mha.o"}
    %flash_index_3_3 = aie.buffer(%tile_3_3) {sym_name = "flash_index_3_3"} : memref<2xi32> 
    aie.objectfifo @flash_scale_3_4(%tile_3_4, {%tile_3_3}, 2 : i32) : !aie.objectfifo<memref<256xbf16>>  
    aie.objectfifo @flash_scale_3_2(%tile_3_2, {%tile_3_3}, 2 : i32) : !aie.objectfifo<memref<256xbf16>>  
    %core_3_3 = aie.core(%tile_3_3) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c4 = arith.constant 4 : index
        scf.for %arg1 = %c0_0 to %c4 step %c1_1 {
          %0 = aie.objectfifo.acquire @of_7_unicast_3(Produce, 2) : !aie.objectfifosubview<memref<64x64xbf16>>
          %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
          func.call @op0_zero_bf16(%1) : (memref<64x64xbf16>) -> ()
          %2 = aie.objectfifo.subview.access %0[1] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
          func.call @op0_zero_bf16(%2) : (memref<64x64xbf16>) -> ()
          %c64 = arith.constant 64 : index
          scf.for %arg2 = %c0_0 to %c64 step %c1_1 {
            %3 = aie.objectfifo.acquire @of_5_broadcast_0_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %4 = aie.objectfifo.subview.access %3[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            %c2 = arith.constant 2 : index
            %5 = aie.objectfifo.acquire @of_6_switch_join_3_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %6 = aie.objectfifo.acquire @of_6_switch_join_3_1(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %7 = aie.objectfifo.subview.access %5[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            %8 = aie.objectfifo.subview.access %6[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            scf.for %arg3 = %c0_0 to %c2 step %c1_1 {
              %c1_2 = arith.constant 1 : index
              %c0_3 = arith.constant 0 : index
              %9 = arith.muli %c1_2, %arg3 : index
              %10 = arith.addi %c0_3, %9 : index
              %11 = arith.muli %c1_2, %c2 : index
              %12 = scf.index_switch %10 -> memref<64x64xbf16> 
              case 0 {
                scf.yield %1 : memref<64x64xbf16>
              }
              case 1 {
                scf.yield %2 : memref<64x64xbf16>
              }
              default {
                scf.yield %1 : memref<64x64xbf16>
              }
              %13 = scf.index_switch %arg3 -> memref<64x64xbf16> 
              case 0 {
                scf.yield %7 : memref<64x64xbf16>
              }
              case 1 {
                scf.yield %8 : memref<64x64xbf16>
              }
              default {
                scf.yield %7 : memref<64x64xbf16>
              }
              %14 = arith.index_cast %arg2 : index to i32
              %c1_i32 = arith.constant 1 : i32
              %15 = arith.muli %14, %c1_i32 : i32
              %c0_i32 = arith.constant 0 : i32
              %16 = arith.addi %c0_i32, %15 : i32
              %17 = arith.index_cast %arg3 : index to i32
              %c8_i32 = arith.constant 8 : i32
              %18 = arith.muli %17, %c8_i32 : i32
              %19 = arith.index_cast %arg1 : index to i32
              %c16_i32 = arith.constant 16 : i32
              %20 = arith.muli %19, %c16_i32 : i32
              %c3_i32 = arith.constant 3 : i32
              %21 = arith.addi %c3_i32, %18 : i32
              %22 = arith.addi %21, %20 : i32
              %c0_4 = arith.constant 0 : index
              %c1_5 = arith.constant 1 : index
              memref.store %16, %flash_index_3_3[%c0_4] : memref<2xi32>
              memref.store %22, %flash_index_3_3[%c1_5] : memref<2xi32>
              scf.index_switch %arg3 
              case 0 {
                %23 = aie.objectfifo.acquire @flash_scale_3_2(Consume, 1) : !aie.objectfifosubview<memref<256xbf16>>
                %24 = aie.objectfifo.subview.access %23[0] : !aie.objectfifosubview<memref<256xbf16>> -> memref<256xbf16>
                %c64_i32 = arith.constant 64 : i32
                %c0_i32_6 = arith.constant 0 : i32
                %25 = arith.cmpi ne, %16, %c0_i32_6 : i32
                %26 = arith.extui %25 : i1 to i32
                func.call @op0_matmul_PV(%13, %4, %12, %24, %c64_i32, %26, %flash_index_3_3) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>, memref<256xbf16>, i32, i32, memref<2xi32>) -> ()
                %c63_i32 = arith.constant 63 : i32
                %27 = arith.cmpi eq, %16, %c63_i32 : i32
                scf.if %27 {
                  func.call @op0_rescale_O(%12, %24, %c64_i32, %flash_index_3_3) : (memref<64x64xbf16>, memref<256xbf16>, i32, memref<2xi32>) -> ()
                }
                aie.objectfifo.release @flash_scale_3_2(Consume, 1)
                scf.yield
              }
              case 1 {
                %23 = aie.objectfifo.acquire @flash_scale_3_4(Consume, 1) : !aie.objectfifosubview<memref<256xbf16>>
                %24 = aie.objectfifo.subview.access %23[0] : !aie.objectfifosubview<memref<256xbf16>> -> memref<256xbf16>
                %c64_i32 = arith.constant 64 : i32
                %c0_i32_6 = arith.constant 0 : i32
                %25 = arith.cmpi ne, %16, %c0_i32_6 : i32
                %26 = arith.extui %25 : i1 to i32
                func.call @op0_matmul_PV(%13, %4, %12, %24, %c64_i32, %26, %flash_index_3_3) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>, memref<256xbf16>, i32, i32, memref<2xi32>) -> ()
                %c63_i32 = arith.constant 63 : i32
                %27 = arith.cmpi eq, %16, %c63_i32 : i32
                scf.if %27 {
                  func.call @op0_rescale_O(%12, %24, %c64_i32, %flash_index_3_3) : (memref<64x64xbf16>, memref<256xbf16>, i32, memref<2xi32>) -> ()
                }
                aie.objectfifo.release @flash_scale_3_4(Consume, 1)
                scf.yield
              }
              default {
                %23 = aie.objectfifo.acquire @flash_scale_3_2(Consume, 1) : !aie.objectfifosubview<memref<256xbf16>>
                %24 = aie.objectfifo.subview.access %23[0] : !aie.objectfifosubview<memref<256xbf16>> -> memref<256xbf16>
                %c64_i32 = arith.constant 64 : i32
                %c0_i32_6 = arith.constant 0 : i32
                %25 = arith.cmpi ne, %16, %c0_i32_6 : i32
                %26 = arith.extui %25 : i1 to i32
                func.call @op0_matmul_PV(%13, %4, %12, %24, %c64_i32, %26, %flash_index_3_3) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>, memref<256xbf16>, i32, i32, memref<2xi32>) -> ()
                %c63_i32 = arith.constant 63 : i32
                %27 = arith.cmpi eq, %16, %c63_i32 : i32
                scf.if %27 {
                  func.call @op0_rescale_O(%12, %24, %c64_i32, %flash_index_3_3) : (memref<64x64xbf16>, memref<256xbf16>, i32, memref<2xi32>) -> ()
                }
                aie.objectfifo.release @flash_scale_3_2(Consume, 1)
              }
            }
            aie.objectfifo.release @of_6_switch_join_3_0(Consume, 1)
            aie.objectfifo.release @of_6_switch_join_3_1(Consume, 1)
            aie.objectfifo.release @of_5_broadcast_0_0(Consume, 1)
          }
          aie.objectfifo.release @of_7_unicast_3(Produce, 2)
        }
      }
      aie.end
    } {link_with = "op0_mha.o"}
    %flash_index_4_3 = aie.buffer(%tile_4_3) {sym_name = "flash_index_4_3"} : memref<2xi32> 
    aie.objectfifo @flash_scale_4_4(%tile_4_4, {%tile_4_3}, 2 : i32) : !aie.objectfifo<memref<256xbf16>>  
    aie.objectfifo @flash_scale_4_2(%tile_4_2, {%tile_4_3}, 2 : i32) : !aie.objectfifo<memref<256xbf16>>  
    %core_4_3 = aie.core(%tile_4_3) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c4 = arith.constant 4 : index
        scf.for %arg1 = %c0_0 to %c4 step %c1_1 {
          %0 = aie.objectfifo.acquire @of_7_unicast_4(Produce, 2) : !aie.objectfifosubview<memref<64x64xbf16>>
          %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
          func.call @op0_zero_bf16(%1) : (memref<64x64xbf16>) -> ()
          %2 = aie.objectfifo.subview.access %0[1] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
          func.call @op0_zero_bf16(%2) : (memref<64x64xbf16>) -> ()
          %c64 = arith.constant 64 : index
          scf.for %arg2 = %c0_0 to %c64 step %c1_1 {
            %3 = aie.objectfifo.acquire @of_5_broadcast_0_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %4 = aie.objectfifo.subview.access %3[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            %c2 = arith.constant 2 : index
            %5 = aie.objectfifo.acquire @of_6_switch_join_4_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %6 = aie.objectfifo.acquire @of_6_switch_join_4_1(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %7 = aie.objectfifo.subview.access %5[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            %8 = aie.objectfifo.subview.access %6[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            scf.for %arg3 = %c0_0 to %c2 step %c1_1 {
              %c1_2 = arith.constant 1 : index
              %c0_3 = arith.constant 0 : index
              %9 = arith.muli %c1_2, %arg3 : index
              %10 = arith.addi %c0_3, %9 : index
              %11 = arith.muli %c1_2, %c2 : index
              %12 = scf.index_switch %10 -> memref<64x64xbf16> 
              case 0 {
                scf.yield %1 : memref<64x64xbf16>
              }
              case 1 {
                scf.yield %2 : memref<64x64xbf16>
              }
              default {
                scf.yield %1 : memref<64x64xbf16>
              }
              %13 = scf.index_switch %arg3 -> memref<64x64xbf16> 
              case 0 {
                scf.yield %7 : memref<64x64xbf16>
              }
              case 1 {
                scf.yield %8 : memref<64x64xbf16>
              }
              default {
                scf.yield %7 : memref<64x64xbf16>
              }
              %14 = arith.index_cast %arg2 : index to i32
              %c1_i32 = arith.constant 1 : i32
              %15 = arith.muli %14, %c1_i32 : i32
              %c0_i32 = arith.constant 0 : i32
              %16 = arith.addi %c0_i32, %15 : i32
              %17 = arith.index_cast %arg3 : index to i32
              %c8_i32 = arith.constant 8 : i32
              %18 = arith.muli %17, %c8_i32 : i32
              %19 = arith.index_cast %arg1 : index to i32
              %c16_i32 = arith.constant 16 : i32
              %20 = arith.muli %19, %c16_i32 : i32
              %c4_i32 = arith.constant 4 : i32
              %21 = arith.addi %c4_i32, %18 : i32
              %22 = arith.addi %21, %20 : i32
              %c0_4 = arith.constant 0 : index
              %c1_5 = arith.constant 1 : index
              memref.store %16, %flash_index_4_3[%c0_4] : memref<2xi32>
              memref.store %22, %flash_index_4_3[%c1_5] : memref<2xi32>
              scf.index_switch %arg3 
              case 0 {
                %23 = aie.objectfifo.acquire @flash_scale_4_2(Consume, 1) : !aie.objectfifosubview<memref<256xbf16>>
                %24 = aie.objectfifo.subview.access %23[0] : !aie.objectfifosubview<memref<256xbf16>> -> memref<256xbf16>
                %c64_i32 = arith.constant 64 : i32
                %c0_i32_6 = arith.constant 0 : i32
                %25 = arith.cmpi ne, %16, %c0_i32_6 : i32
                %26 = arith.extui %25 : i1 to i32
                func.call @op0_matmul_PV(%13, %4, %12, %24, %c64_i32, %26, %flash_index_4_3) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>, memref<256xbf16>, i32, i32, memref<2xi32>) -> ()
                %c63_i32 = arith.constant 63 : i32
                %27 = arith.cmpi eq, %16, %c63_i32 : i32
                scf.if %27 {
                  func.call @op0_rescale_O(%12, %24, %c64_i32, %flash_index_4_3) : (memref<64x64xbf16>, memref<256xbf16>, i32, memref<2xi32>) -> ()
                }
                aie.objectfifo.release @flash_scale_4_2(Consume, 1)
                scf.yield
              }
              case 1 {
                %23 = aie.objectfifo.acquire @flash_scale_4_4(Consume, 1) : !aie.objectfifosubview<memref<256xbf16>>
                %24 = aie.objectfifo.subview.access %23[0] : !aie.objectfifosubview<memref<256xbf16>> -> memref<256xbf16>
                %c64_i32 = arith.constant 64 : i32
                %c0_i32_6 = arith.constant 0 : i32
                %25 = arith.cmpi ne, %16, %c0_i32_6 : i32
                %26 = arith.extui %25 : i1 to i32
                func.call @op0_matmul_PV(%13, %4, %12, %24, %c64_i32, %26, %flash_index_4_3) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>, memref<256xbf16>, i32, i32, memref<2xi32>) -> ()
                %c63_i32 = arith.constant 63 : i32
                %27 = arith.cmpi eq, %16, %c63_i32 : i32
                scf.if %27 {
                  func.call @op0_rescale_O(%12, %24, %c64_i32, %flash_index_4_3) : (memref<64x64xbf16>, memref<256xbf16>, i32, memref<2xi32>) -> ()
                }
                aie.objectfifo.release @flash_scale_4_4(Consume, 1)
                scf.yield
              }
              default {
                %23 = aie.objectfifo.acquire @flash_scale_4_2(Consume, 1) : !aie.objectfifosubview<memref<256xbf16>>
                %24 = aie.objectfifo.subview.access %23[0] : !aie.objectfifosubview<memref<256xbf16>> -> memref<256xbf16>
                %c64_i32 = arith.constant 64 : i32
                %c0_i32_6 = arith.constant 0 : i32
                %25 = arith.cmpi ne, %16, %c0_i32_6 : i32
                %26 = arith.extui %25 : i1 to i32
                func.call @op0_matmul_PV(%13, %4, %12, %24, %c64_i32, %26, %flash_index_4_3) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>, memref<256xbf16>, i32, i32, memref<2xi32>) -> ()
                %c63_i32 = arith.constant 63 : i32
                %27 = arith.cmpi eq, %16, %c63_i32 : i32
                scf.if %27 {
                  func.call @op0_rescale_O(%12, %24, %c64_i32, %flash_index_4_3) : (memref<64x64xbf16>, memref<256xbf16>, i32, memref<2xi32>) -> ()
                }
                aie.objectfifo.release @flash_scale_4_2(Consume, 1)
              }
            }
            aie.objectfifo.release @of_6_switch_join_4_0(Consume, 1)
            aie.objectfifo.release @of_6_switch_join_4_1(Consume, 1)
            aie.objectfifo.release @of_5_broadcast_0_0(Consume, 1)
          }
          aie.objectfifo.release @of_7_unicast_4(Produce, 2)
        }
      }
      aie.end
    } {link_with = "op0_mha.o"}
    %flash_index_5_3 = aie.buffer(%tile_5_3) {sym_name = "flash_index_5_3"} : memref<2xi32> 
    aie.objectfifo @flash_scale_5_4(%tile_5_4, {%tile_5_3}, 2 : i32) : !aie.objectfifo<memref<256xbf16>>  
    aie.objectfifo @flash_scale_5_2(%tile_5_2, {%tile_5_3}, 2 : i32) : !aie.objectfifo<memref<256xbf16>>  
    %core_5_3 = aie.core(%tile_5_3) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c4 = arith.constant 4 : index
        scf.for %arg1 = %c0_0 to %c4 step %c1_1 {
          %0 = aie.objectfifo.acquire @of_7_unicast_5(Produce, 2) : !aie.objectfifosubview<memref<64x64xbf16>>
          %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
          func.call @op0_zero_bf16(%1) : (memref<64x64xbf16>) -> ()
          %2 = aie.objectfifo.subview.access %0[1] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
          func.call @op0_zero_bf16(%2) : (memref<64x64xbf16>) -> ()
          %c64 = arith.constant 64 : index
          scf.for %arg2 = %c0_0 to %c64 step %c1_1 {
            %3 = aie.objectfifo.acquire @of_5_broadcast_0_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %4 = aie.objectfifo.subview.access %3[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            %c2 = arith.constant 2 : index
            %5 = aie.objectfifo.acquire @of_6_switch_join_5_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %6 = aie.objectfifo.acquire @of_6_switch_join_5_1(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %7 = aie.objectfifo.subview.access %5[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            %8 = aie.objectfifo.subview.access %6[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            scf.for %arg3 = %c0_0 to %c2 step %c1_1 {
              %c1_2 = arith.constant 1 : index
              %c0_3 = arith.constant 0 : index
              %9 = arith.muli %c1_2, %arg3 : index
              %10 = arith.addi %c0_3, %9 : index
              %11 = arith.muli %c1_2, %c2 : index
              %12 = scf.index_switch %10 -> memref<64x64xbf16> 
              case 0 {
                scf.yield %1 : memref<64x64xbf16>
              }
              case 1 {
                scf.yield %2 : memref<64x64xbf16>
              }
              default {
                scf.yield %1 : memref<64x64xbf16>
              }
              %13 = scf.index_switch %arg3 -> memref<64x64xbf16> 
              case 0 {
                scf.yield %7 : memref<64x64xbf16>
              }
              case 1 {
                scf.yield %8 : memref<64x64xbf16>
              }
              default {
                scf.yield %7 : memref<64x64xbf16>
              }
              %14 = arith.index_cast %arg2 : index to i32
              %c1_i32 = arith.constant 1 : i32
              %15 = arith.muli %14, %c1_i32 : i32
              %c0_i32 = arith.constant 0 : i32
              %16 = arith.addi %c0_i32, %15 : i32
              %17 = arith.index_cast %arg3 : index to i32
              %c8_i32 = arith.constant 8 : i32
              %18 = arith.muli %17, %c8_i32 : i32
              %19 = arith.index_cast %arg1 : index to i32
              %c16_i32 = arith.constant 16 : i32
              %20 = arith.muli %19, %c16_i32 : i32
              %c5_i32 = arith.constant 5 : i32
              %21 = arith.addi %c5_i32, %18 : i32
              %22 = arith.addi %21, %20 : i32
              %c0_4 = arith.constant 0 : index
              %c1_5 = arith.constant 1 : index
              memref.store %16, %flash_index_5_3[%c0_4] : memref<2xi32>
              memref.store %22, %flash_index_5_3[%c1_5] : memref<2xi32>
              scf.index_switch %arg3 
              case 0 {
                %23 = aie.objectfifo.acquire @flash_scale_5_2(Consume, 1) : !aie.objectfifosubview<memref<256xbf16>>
                %24 = aie.objectfifo.subview.access %23[0] : !aie.objectfifosubview<memref<256xbf16>> -> memref<256xbf16>
                %c64_i32 = arith.constant 64 : i32
                %c0_i32_6 = arith.constant 0 : i32
                %25 = arith.cmpi ne, %16, %c0_i32_6 : i32
                %26 = arith.extui %25 : i1 to i32
                func.call @op0_matmul_PV(%13, %4, %12, %24, %c64_i32, %26, %flash_index_5_3) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>, memref<256xbf16>, i32, i32, memref<2xi32>) -> ()
                %c63_i32 = arith.constant 63 : i32
                %27 = arith.cmpi eq, %16, %c63_i32 : i32
                scf.if %27 {
                  func.call @op0_rescale_O(%12, %24, %c64_i32, %flash_index_5_3) : (memref<64x64xbf16>, memref<256xbf16>, i32, memref<2xi32>) -> ()
                }
                aie.objectfifo.release @flash_scale_5_2(Consume, 1)
                scf.yield
              }
              case 1 {
                %23 = aie.objectfifo.acquire @flash_scale_5_4(Consume, 1) : !aie.objectfifosubview<memref<256xbf16>>
                %24 = aie.objectfifo.subview.access %23[0] : !aie.objectfifosubview<memref<256xbf16>> -> memref<256xbf16>
                %c64_i32 = arith.constant 64 : i32
                %c0_i32_6 = arith.constant 0 : i32
                %25 = arith.cmpi ne, %16, %c0_i32_6 : i32
                %26 = arith.extui %25 : i1 to i32
                func.call @op0_matmul_PV(%13, %4, %12, %24, %c64_i32, %26, %flash_index_5_3) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>, memref<256xbf16>, i32, i32, memref<2xi32>) -> ()
                %c63_i32 = arith.constant 63 : i32
                %27 = arith.cmpi eq, %16, %c63_i32 : i32
                scf.if %27 {
                  func.call @op0_rescale_O(%12, %24, %c64_i32, %flash_index_5_3) : (memref<64x64xbf16>, memref<256xbf16>, i32, memref<2xi32>) -> ()
                }
                aie.objectfifo.release @flash_scale_5_4(Consume, 1)
                scf.yield
              }
              default {
                %23 = aie.objectfifo.acquire @flash_scale_5_2(Consume, 1) : !aie.objectfifosubview<memref<256xbf16>>
                %24 = aie.objectfifo.subview.access %23[0] : !aie.objectfifosubview<memref<256xbf16>> -> memref<256xbf16>
                %c64_i32 = arith.constant 64 : i32
                %c0_i32_6 = arith.constant 0 : i32
                %25 = arith.cmpi ne, %16, %c0_i32_6 : i32
                %26 = arith.extui %25 : i1 to i32
                func.call @op0_matmul_PV(%13, %4, %12, %24, %c64_i32, %26, %flash_index_5_3) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>, memref<256xbf16>, i32, i32, memref<2xi32>) -> ()
                %c63_i32 = arith.constant 63 : i32
                %27 = arith.cmpi eq, %16, %c63_i32 : i32
                scf.if %27 {
                  func.call @op0_rescale_O(%12, %24, %c64_i32, %flash_index_5_3) : (memref<64x64xbf16>, memref<256xbf16>, i32, memref<2xi32>) -> ()
                }
                aie.objectfifo.release @flash_scale_5_2(Consume, 1)
              }
            }
            aie.objectfifo.release @of_6_switch_join_5_0(Consume, 1)
            aie.objectfifo.release @of_6_switch_join_5_1(Consume, 1)
            aie.objectfifo.release @of_5_broadcast_0_0(Consume, 1)
          }
          aie.objectfifo.release @of_7_unicast_5(Produce, 2)
        }
      }
      aie.end
    } {link_with = "op0_mha.o"}
    %flash_index_6_3 = aie.buffer(%tile_6_3) {sym_name = "flash_index_6_3"} : memref<2xi32> 
    aie.objectfifo @flash_scale_6_4(%tile_6_4, {%tile_6_3}, 2 : i32) : !aie.objectfifo<memref<256xbf16>>  
    aie.objectfifo @flash_scale_6_2(%tile_6_2, {%tile_6_3}, 2 : i32) : !aie.objectfifo<memref<256xbf16>>  
    %core_6_3 = aie.core(%tile_6_3) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c4 = arith.constant 4 : index
        scf.for %arg1 = %c0_0 to %c4 step %c1_1 {
          %0 = aie.objectfifo.acquire @of_7_unicast_6(Produce, 2) : !aie.objectfifosubview<memref<64x64xbf16>>
          %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
          func.call @op0_zero_bf16(%1) : (memref<64x64xbf16>) -> ()
          %2 = aie.objectfifo.subview.access %0[1] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
          func.call @op0_zero_bf16(%2) : (memref<64x64xbf16>) -> ()
          %c64 = arith.constant 64 : index
          scf.for %arg2 = %c0_0 to %c64 step %c1_1 {
            %3 = aie.objectfifo.acquire @of_5_broadcast_0_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %4 = aie.objectfifo.subview.access %3[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            %c2 = arith.constant 2 : index
            %5 = aie.objectfifo.acquire @of_6_switch_join_6_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %6 = aie.objectfifo.acquire @of_6_switch_join_6_1(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %7 = aie.objectfifo.subview.access %5[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            %8 = aie.objectfifo.subview.access %6[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            scf.for %arg3 = %c0_0 to %c2 step %c1_1 {
              %c1_2 = arith.constant 1 : index
              %c0_3 = arith.constant 0 : index
              %9 = arith.muli %c1_2, %arg3 : index
              %10 = arith.addi %c0_3, %9 : index
              %11 = arith.muli %c1_2, %c2 : index
              %12 = scf.index_switch %10 -> memref<64x64xbf16> 
              case 0 {
                scf.yield %1 : memref<64x64xbf16>
              }
              case 1 {
                scf.yield %2 : memref<64x64xbf16>
              }
              default {
                scf.yield %1 : memref<64x64xbf16>
              }
              %13 = scf.index_switch %arg3 -> memref<64x64xbf16> 
              case 0 {
                scf.yield %7 : memref<64x64xbf16>
              }
              case 1 {
                scf.yield %8 : memref<64x64xbf16>
              }
              default {
                scf.yield %7 : memref<64x64xbf16>
              }
              %14 = arith.index_cast %arg2 : index to i32
              %c1_i32 = arith.constant 1 : i32
              %15 = arith.muli %14, %c1_i32 : i32
              %c0_i32 = arith.constant 0 : i32
              %16 = arith.addi %c0_i32, %15 : i32
              %17 = arith.index_cast %arg3 : index to i32
              %c8_i32 = arith.constant 8 : i32
              %18 = arith.muli %17, %c8_i32 : i32
              %19 = arith.index_cast %arg1 : index to i32
              %c16_i32 = arith.constant 16 : i32
              %20 = arith.muli %19, %c16_i32 : i32
              %c6_i32 = arith.constant 6 : i32
              %21 = arith.addi %c6_i32, %18 : i32
              %22 = arith.addi %21, %20 : i32
              %c0_4 = arith.constant 0 : index
              %c1_5 = arith.constant 1 : index
              memref.store %16, %flash_index_6_3[%c0_4] : memref<2xi32>
              memref.store %22, %flash_index_6_3[%c1_5] : memref<2xi32>
              scf.index_switch %arg3 
              case 0 {
                %23 = aie.objectfifo.acquire @flash_scale_6_2(Consume, 1) : !aie.objectfifosubview<memref<256xbf16>>
                %24 = aie.objectfifo.subview.access %23[0] : !aie.objectfifosubview<memref<256xbf16>> -> memref<256xbf16>
                %c64_i32 = arith.constant 64 : i32
                %c0_i32_6 = arith.constant 0 : i32
                %25 = arith.cmpi ne, %16, %c0_i32_6 : i32
                %26 = arith.extui %25 : i1 to i32
                func.call @op0_matmul_PV(%13, %4, %12, %24, %c64_i32, %26, %flash_index_6_3) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>, memref<256xbf16>, i32, i32, memref<2xi32>) -> ()
                %c63_i32 = arith.constant 63 : i32
                %27 = arith.cmpi eq, %16, %c63_i32 : i32
                scf.if %27 {
                  func.call @op0_rescale_O(%12, %24, %c64_i32, %flash_index_6_3) : (memref<64x64xbf16>, memref<256xbf16>, i32, memref<2xi32>) -> ()
                }
                aie.objectfifo.release @flash_scale_6_2(Consume, 1)
                scf.yield
              }
              case 1 {
                %23 = aie.objectfifo.acquire @flash_scale_6_4(Consume, 1) : !aie.objectfifosubview<memref<256xbf16>>
                %24 = aie.objectfifo.subview.access %23[0] : !aie.objectfifosubview<memref<256xbf16>> -> memref<256xbf16>
                %c64_i32 = arith.constant 64 : i32
                %c0_i32_6 = arith.constant 0 : i32
                %25 = arith.cmpi ne, %16, %c0_i32_6 : i32
                %26 = arith.extui %25 : i1 to i32
                func.call @op0_matmul_PV(%13, %4, %12, %24, %c64_i32, %26, %flash_index_6_3) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>, memref<256xbf16>, i32, i32, memref<2xi32>) -> ()
                %c63_i32 = arith.constant 63 : i32
                %27 = arith.cmpi eq, %16, %c63_i32 : i32
                scf.if %27 {
                  func.call @op0_rescale_O(%12, %24, %c64_i32, %flash_index_6_3) : (memref<64x64xbf16>, memref<256xbf16>, i32, memref<2xi32>) -> ()
                }
                aie.objectfifo.release @flash_scale_6_4(Consume, 1)
                scf.yield
              }
              default {
                %23 = aie.objectfifo.acquire @flash_scale_6_2(Consume, 1) : !aie.objectfifosubview<memref<256xbf16>>
                %24 = aie.objectfifo.subview.access %23[0] : !aie.objectfifosubview<memref<256xbf16>> -> memref<256xbf16>
                %c64_i32 = arith.constant 64 : i32
                %c0_i32_6 = arith.constant 0 : i32
                %25 = arith.cmpi ne, %16, %c0_i32_6 : i32
                %26 = arith.extui %25 : i1 to i32
                func.call @op0_matmul_PV(%13, %4, %12, %24, %c64_i32, %26, %flash_index_6_3) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>, memref<256xbf16>, i32, i32, memref<2xi32>) -> ()
                %c63_i32 = arith.constant 63 : i32
                %27 = arith.cmpi eq, %16, %c63_i32 : i32
                scf.if %27 {
                  func.call @op0_rescale_O(%12, %24, %c64_i32, %flash_index_6_3) : (memref<64x64xbf16>, memref<256xbf16>, i32, memref<2xi32>) -> ()
                }
                aie.objectfifo.release @flash_scale_6_2(Consume, 1)
              }
            }
            aie.objectfifo.release @of_6_switch_join_6_0(Consume, 1)
            aie.objectfifo.release @of_6_switch_join_6_1(Consume, 1)
            aie.objectfifo.release @of_5_broadcast_0_0(Consume, 1)
          }
          aie.objectfifo.release @of_7_unicast_6(Produce, 2)
        }
      }
      aie.end
    } {link_with = "op0_mha.o"}
    %flash_index_7_3 = aie.buffer(%tile_7_3) {sym_name = "flash_index_7_3"} : memref<2xi32> 
    aie.objectfifo @flash_scale_7_4(%tile_7_4, {%tile_7_3}, 2 : i32) : !aie.objectfifo<memref<256xbf16>>  
    aie.objectfifo @flash_scale_7_2(%tile_7_2, {%tile_7_3}, 2 : i32) : !aie.objectfifo<memref<256xbf16>>  
    %core_7_3 = aie.core(%tile_7_3) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c4 = arith.constant 4 : index
        scf.for %arg1 = %c0_0 to %c4 step %c1_1 {
          %0 = aie.objectfifo.acquire @of_7_unicast_7(Produce, 2) : !aie.objectfifosubview<memref<64x64xbf16>>
          %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
          func.call @op0_zero_bf16(%1) : (memref<64x64xbf16>) -> ()
          %2 = aie.objectfifo.subview.access %0[1] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
          func.call @op0_zero_bf16(%2) : (memref<64x64xbf16>) -> ()
          %c64 = arith.constant 64 : index
          scf.for %arg2 = %c0_0 to %c64 step %c1_1 {
            %3 = aie.objectfifo.acquire @of_5_broadcast_0_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %4 = aie.objectfifo.subview.access %3[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            %c2 = arith.constant 2 : index
            %5 = aie.objectfifo.acquire @of_6_switch_join_7_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %6 = aie.objectfifo.acquire @of_6_switch_join_7_1(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %7 = aie.objectfifo.subview.access %5[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            %8 = aie.objectfifo.subview.access %6[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            scf.for %arg3 = %c0_0 to %c2 step %c1_1 {
              %c1_2 = arith.constant 1 : index
              %c0_3 = arith.constant 0 : index
              %9 = arith.muli %c1_2, %arg3 : index
              %10 = arith.addi %c0_3, %9 : index
              %11 = arith.muli %c1_2, %c2 : index
              %12 = scf.index_switch %10 -> memref<64x64xbf16> 
              case 0 {
                scf.yield %1 : memref<64x64xbf16>
              }
              case 1 {
                scf.yield %2 : memref<64x64xbf16>
              }
              default {
                scf.yield %1 : memref<64x64xbf16>
              }
              %13 = scf.index_switch %arg3 -> memref<64x64xbf16> 
              case 0 {
                scf.yield %7 : memref<64x64xbf16>
              }
              case 1 {
                scf.yield %8 : memref<64x64xbf16>
              }
              default {
                scf.yield %7 : memref<64x64xbf16>
              }
              %14 = arith.index_cast %arg2 : index to i32
              %c1_i32 = arith.constant 1 : i32
              %15 = arith.muli %14, %c1_i32 : i32
              %c0_i32 = arith.constant 0 : i32
              %16 = arith.addi %c0_i32, %15 : i32
              %17 = arith.index_cast %arg3 : index to i32
              %c8_i32 = arith.constant 8 : i32
              %18 = arith.muli %17, %c8_i32 : i32
              %19 = arith.index_cast %arg1 : index to i32
              %c16_i32 = arith.constant 16 : i32
              %20 = arith.muli %19, %c16_i32 : i32
              %c7_i32 = arith.constant 7 : i32
              %21 = arith.addi %c7_i32, %18 : i32
              %22 = arith.addi %21, %20 : i32
              %c0_4 = arith.constant 0 : index
              %c1_5 = arith.constant 1 : index
              memref.store %16, %flash_index_7_3[%c0_4] : memref<2xi32>
              memref.store %22, %flash_index_7_3[%c1_5] : memref<2xi32>
              scf.index_switch %arg3 
              case 0 {
                %23 = aie.objectfifo.acquire @flash_scale_7_2(Consume, 1) : !aie.objectfifosubview<memref<256xbf16>>
                %24 = aie.objectfifo.subview.access %23[0] : !aie.objectfifosubview<memref<256xbf16>> -> memref<256xbf16>
                %c64_i32 = arith.constant 64 : i32
                %c0_i32_6 = arith.constant 0 : i32
                %25 = arith.cmpi ne, %16, %c0_i32_6 : i32
                %26 = arith.extui %25 : i1 to i32
                func.call @op0_matmul_PV(%13, %4, %12, %24, %c64_i32, %26, %flash_index_7_3) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>, memref<256xbf16>, i32, i32, memref<2xi32>) -> ()
                %c63_i32 = arith.constant 63 : i32
                %27 = arith.cmpi eq, %16, %c63_i32 : i32
                scf.if %27 {
                  func.call @op0_rescale_O(%12, %24, %c64_i32, %flash_index_7_3) : (memref<64x64xbf16>, memref<256xbf16>, i32, memref<2xi32>) -> ()
                }
                aie.objectfifo.release @flash_scale_7_2(Consume, 1)
                scf.yield
              }
              case 1 {
                %23 = aie.objectfifo.acquire @flash_scale_7_4(Consume, 1) : !aie.objectfifosubview<memref<256xbf16>>
                %24 = aie.objectfifo.subview.access %23[0] : !aie.objectfifosubview<memref<256xbf16>> -> memref<256xbf16>
                %c64_i32 = arith.constant 64 : i32
                %c0_i32_6 = arith.constant 0 : i32
                %25 = arith.cmpi ne, %16, %c0_i32_6 : i32
                %26 = arith.extui %25 : i1 to i32
                func.call @op0_matmul_PV(%13, %4, %12, %24, %c64_i32, %26, %flash_index_7_3) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>, memref<256xbf16>, i32, i32, memref<2xi32>) -> ()
                %c63_i32 = arith.constant 63 : i32
                %27 = arith.cmpi eq, %16, %c63_i32 : i32
                scf.if %27 {
                  func.call @op0_rescale_O(%12, %24, %c64_i32, %flash_index_7_3) : (memref<64x64xbf16>, memref<256xbf16>, i32, memref<2xi32>) -> ()
                }
                aie.objectfifo.release @flash_scale_7_4(Consume, 1)
                scf.yield
              }
              default {
                %23 = aie.objectfifo.acquire @flash_scale_7_2(Consume, 1) : !aie.objectfifosubview<memref<256xbf16>>
                %24 = aie.objectfifo.subview.access %23[0] : !aie.objectfifosubview<memref<256xbf16>> -> memref<256xbf16>
                %c64_i32 = arith.constant 64 : i32
                %c0_i32_6 = arith.constant 0 : i32
                %25 = arith.cmpi ne, %16, %c0_i32_6 : i32
                %26 = arith.extui %25 : i1 to i32
                func.call @op0_matmul_PV(%13, %4, %12, %24, %c64_i32, %26, %flash_index_7_3) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>, memref<256xbf16>, i32, i32, memref<2xi32>) -> ()
                %c63_i32 = arith.constant 63 : i32
                %27 = arith.cmpi eq, %16, %c63_i32 : i32
                scf.if %27 {
                  func.call @op0_rescale_O(%12, %24, %c64_i32, %flash_index_7_3) : (memref<64x64xbf16>, memref<256xbf16>, i32, memref<2xi32>) -> ()
                }
                aie.objectfifo.release @flash_scale_7_2(Consume, 1)
              }
            }
            aie.objectfifo.release @of_6_switch_join_7_0(Consume, 1)
            aie.objectfifo.release @of_6_switch_join_7_1(Consume, 1)
            aie.objectfifo.release @of_5_broadcast_0_0(Consume, 1)
          }
          aie.objectfifo.release @of_7_unicast_7(Produce, 2)
        }
      }
      aie.end
    } {link_with = "op0_mha.o"}
    aie.objectfifo @of_0_mem_0(%shim_noc_tile_0_0, {%mem_tile_0_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<2x64x64xbf16>>  
    aie.objectfifo @of_0_mem_1(%shim_noc_tile_1_0, {%mem_tile_1_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<2x64x64xbf16>>  
    aie.objectfifo @of_0_mem_2(%shim_noc_tile_2_0, {%mem_tile_2_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<2x64x64xbf16>>  
    aie.objectfifo @of_0_mem_3(%shim_noc_tile_3_0, {%mem_tile_3_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<2x64x64xbf16>>  
    aie.objectfifo @of_0_mem_4(%shim_noc_tile_4_0, {%mem_tile_4_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<2x64x64xbf16>>  
    aie.objectfifo @of_0_mem_5(%shim_noc_tile_5_0, {%mem_tile_5_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<2x64x64xbf16>>  
    aie.objectfifo @of_0_mem_6(%shim_noc_tile_6_0, {%mem_tile_6_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<2x64x64xbf16>>  
    aie.objectfifo @of_0_mem_7(%shim_noc_tile_7_0, {%mem_tile_7_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<2x64x64xbf16>>  
    aie.objectfifo @of_1_mem(%shim_noc_tile_7_0, {%mem_tile_7_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_2_mem(%shim_noc_tile_1_0, {%mem_tile_1_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_3_distribute_0_0(%mem_tile_0_1 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%tile_0_2}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_3_distribute_0_1(%mem_tile_0_1 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%tile_0_4}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo.link [@of_0_mem_0] -> [@of_3_distribute_0_0, @of_3_distribute_0_1]([] [0, 4096])
    aie.objectfifo @of_3_distribute_1_0(%mem_tile_1_1 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%tile_1_2}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_3_distribute_1_1(%mem_tile_1_1 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%tile_1_4}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo.link [@of_0_mem_1] -> [@of_3_distribute_1_0, @of_3_distribute_1_1]([] [0, 4096])
    aie.objectfifo @of_3_distribute_2_0(%mem_tile_2_1 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%tile_2_2}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_3_distribute_2_1(%mem_tile_2_1 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%tile_2_4}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo.link [@of_0_mem_2] -> [@of_3_distribute_2_0, @of_3_distribute_2_1]([] [0, 4096])
    aie.objectfifo @of_3_distribute_3_0(%mem_tile_3_1 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%tile_3_2}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_3_distribute_3_1(%mem_tile_3_1 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%tile_3_4}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo.link [@of_0_mem_3] -> [@of_3_distribute_3_0, @of_3_distribute_3_1]([] [0, 4096])
    aie.objectfifo @of_3_distribute_4_0(%mem_tile_4_1 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%tile_4_2}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_3_distribute_4_1(%mem_tile_4_1 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%tile_4_4}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo.link [@of_0_mem_4] -> [@of_3_distribute_4_0, @of_3_distribute_4_1]([] [0, 4096])
    aie.objectfifo @of_3_distribute_5_0(%mem_tile_5_1 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%tile_5_2}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_3_distribute_5_1(%mem_tile_5_1 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%tile_5_4}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo.link [@of_0_mem_5] -> [@of_3_distribute_5_0, @of_3_distribute_5_1]([] [0, 4096])
    aie.objectfifo @of_3_distribute_6_0(%mem_tile_6_1 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%tile_6_2}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_3_distribute_6_1(%mem_tile_6_1 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%tile_6_4}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo.link [@of_0_mem_6] -> [@of_3_distribute_6_0, @of_3_distribute_6_1]([] [0, 4096])
    aie.objectfifo @of_3_distribute_7_0(%mem_tile_7_1 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%tile_7_2}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_3_distribute_7_1(%mem_tile_7_1 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%tile_7_4}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo.link [@of_0_mem_7] -> [@of_3_distribute_7_0, @of_3_distribute_7_1]([] [0, 4096])
    aie.objectfifo @of_4_broadcast_0_0(%mem_tile_7_1 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%tile_0_2, %tile_1_2, %tile_2_2, %tile_3_2, %tile_4_2, %tile_5_2, %tile_6_2, %tile_7_2, %tile_0_4, %tile_1_4, %tile_2_4, %tile_3_4, %tile_4_4, %tile_5_4, %tile_6_4, %tile_7_4}, [2 : i32, 2 : i32, 2 : i32, 2 : i32, 2 : i32, 2 : i32, 2 : i32, 2 : i32, 2 : i32, 2 : i32, 2 : i32, 2 : i32, 2 : i32, 2 : i32, 2 : i32, 2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo.link [@of_1_mem] -> [@of_4_broadcast_0_0]([] [])
    aie.objectfifo @of_5_broadcast_0_0(%mem_tile_1_1 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%tile_0_3, %tile_1_3, %tile_2_3, %tile_3_3, %tile_4_3, %tile_5_3, %tile_6_3, %tile_7_3}, [2 : i32, 2 : i32, 2 : i32, 2 : i32, 2 : i32, 2 : i32, 2 : i32, 2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo.link [@of_2_mem] -> [@of_5_broadcast_0_0]([] [])
    aie.objectfifo @of_6_switch_join_0_0(%tile_0_2, {%tile_0_3}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_6_switch_join_0_1(%tile_0_4, {%tile_0_3}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_6_switch_join_1_0(%tile_1_2, {%tile_1_3}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_6_switch_join_1_1(%tile_1_4, {%tile_1_3}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_6_switch_join_2_0(%tile_2_2, {%tile_2_3}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_6_switch_join_2_1(%tile_2_4, {%tile_2_3}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_6_switch_join_3_0(%tile_3_2, {%tile_3_3}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_6_switch_join_3_1(%tile_3_4, {%tile_3_3}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_6_switch_join_4_0(%tile_4_2, {%tile_4_3}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_6_switch_join_4_1(%tile_4_4, {%tile_4_3}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_6_switch_join_5_0(%tile_5_2, {%tile_5_3}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_6_switch_join_5_1(%tile_5_4, {%tile_5_3}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_6_switch_join_6_0(%tile_6_2, {%tile_6_3}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_6_switch_join_6_1(%tile_6_4, {%tile_6_3}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_6_switch_join_7_0(%tile_7_2, {%tile_7_3}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_6_switch_join_7_1(%tile_7_4, {%tile_7_3}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_7_unicast_0(%tile_0_3, {%mem_tile_0_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_7_unicast_1(%tile_1_3, {%mem_tile_1_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_7_unicast_2(%tile_2_3, {%mem_tile_2_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_7_unicast_3(%tile_3_3, {%mem_tile_3_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_7_unicast_4(%tile_4_3, {%mem_tile_4_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_7_unicast_5(%tile_5_3, {%mem_tile_5_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_7_unicast_6(%tile_6_3, {%mem_tile_6_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_7_unicast_7(%tile_7_3, {%mem_tile_7_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_8_mem_0(%mem_tile_0_1 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%shim_noc_tile_0_0}, [4 : i32, 4 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo.link [@of_7_unicast_0] -> [@of_8_mem_0]([] [])
    aie.objectfifo @of_8_mem_1(%mem_tile_1_1 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%shim_noc_tile_1_0}, [4 : i32, 4 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo.link [@of_7_unicast_1] -> [@of_8_mem_1]([] [])
    aie.objectfifo @of_8_mem_2(%mem_tile_2_1 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%shim_noc_tile_2_0}, [4 : i32, 4 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo.link [@of_7_unicast_2] -> [@of_8_mem_2]([] [])
    aie.objectfifo @of_8_mem_3(%mem_tile_3_1 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%shim_noc_tile_3_0}, [4 : i32, 4 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo.link [@of_7_unicast_3] -> [@of_8_mem_3]([] [])
    aie.objectfifo @of_8_mem_4(%mem_tile_4_1 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%shim_noc_tile_4_0}, [4 : i32, 4 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo.link [@of_7_unicast_4] -> [@of_8_mem_4]([] [])
    aie.objectfifo @of_8_mem_5(%mem_tile_5_1 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%shim_noc_tile_5_0}, [4 : i32, 4 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo.link [@of_7_unicast_5] -> [@of_8_mem_5]([] [])
    aie.objectfifo @of_8_mem_6(%mem_tile_6_1 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%shim_noc_tile_6_0}, [4 : i32, 4 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo.link [@of_7_unicast_6] -> [@of_8_mem_6]([] [])
    aie.objectfifo @of_8_mem_7(%mem_tile_7_1 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%shim_noc_tile_7_0}, [4 : i32, 4 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo.link [@of_7_unicast_7] -> [@of_8_mem_7]([] [])
    func.func private @op0_init_scale_buffer(memref<256xbf16>, i32)
    func.func private @op0_passThroughLine(memref<256xbf16>, memref<256xbf16>, i32) attributes {link_with = "op0_mha_passThrough.o"}
    func.func private @op0_zero_bf16(memref<64x64xbf16>)
    func.func private @op0_matmul_softmax(memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>, memref<256xbf16>, memref<2xi32>, bf16, i32, i32, i32, i32)
    func.func private @op0_rescale_O(memref<64x64xbf16>, memref<256xbf16>, i32, memref<2xi32>)
    func.func private @op0_matmul_PV(memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>, memref<256xbf16>, i32, i32, memref<2xi32>)
  }
}
