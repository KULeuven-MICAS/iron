module {
  aie.device(npu2) {
    %shim_noc_tile_0_0 = aie.tile(0, 0)
    %shim_noc_tile_1_0 = aie.tile(1, 0)
    %shim_noc_tile_2_0 = aie.tile(2, 0)
    %shim_noc_tile_3_0 = aie.tile(3, 0)
    %shim_noc_tile_6_0 = aie.tile(6, 0)
    %mem_tile_0_1 = aie.tile(0, 1)
    %mem_tile_3_1 = aie.tile(3, 1)
    %mem_tile_2_1 = aie.tile(2, 1)
    %mem_tile_1_1 = aie.tile(1, 1)
    %tile_0_2 = aie.tile(0, 2)
    %tile_1_2 = aie.tile(1, 2)
    %tile_0_4 = aie.tile(0, 4)
    %tile_1_4 = aie.tile(1, 4)
    %mem_tile_6_1 = aie.tile(6, 1)
    %tile_0_3 = aie.tile(0, 3)
    %tile_1_3 = aie.tile(1, 3)
    aie.runtime_sequence(%arg0: memref<128x64xbf16>, %arg1: memref<64x128xbf16>, %arg2: memref<128x64xbf16>, %arg3: memref<128x64xbf16>) {
      %0 = aiex.dma_configure_task_for @of_0_mem_0 {
        aie.dma_bd(%arg0 : memref<128x64xbf16> offset = 0 len = 4096 sizes = [1, 1, 64, 64] strides = [0, 0, 64, 1])
        aie.end
      } {issue_token = true, iteration_t = 0 : index}
      aiex.dma_start_task(%0)
      %1 = aiex.dma_configure_task_for @of_0_mem_1 {
        aie.dma_bd(%arg0 : memref<128x64xbf16> offset = 4096 len = 4096 sizes = [1, 1, 64, 64] strides = [0, 0, 64, 1])
        aie.end
      } {issue_token = true, iteration_t = 0 : index}
      aiex.dma_start_task(%1)
      %2 = aiex.dma_configure_task_for @of_1_mem {
        aie.dma_bd(%arg1 : memref<64x128xbf16> offset = 0 len = 8192 sizes = [1, 2, 64, 64] strides = [0, 64, 128, 1])
        aie.end
      } {issue_token = true, iteration_t = 0 : index}
      aiex.dma_start_task(%2)
      %3 = aiex.dma_configure_task_for @of_2_mem {
        aie.dma_bd(%arg2 : memref<128x64xbf16> offset = 0 len = 8192 sizes = [1, 1, 64, 128] strides = [0, 0, 128, 1])
        aie.end
      } {issue_token = true, iteration_t = 0 : index}
      aiex.dma_start_task(%3)
      %4 = aiex.dma_configure_task_for @of_11_mem_0 {
        aie.dma_bd(%arg3 : memref<128x64xbf16> offset = 0 len = 4096 sizes = [1, 1, 64, 64] strides = [0, 0, 64, 1])
        aie.end
      } {issue_token = true, iteration_t = 0 : index}
      aiex.dma_start_task(%4)
      %5 = aiex.dma_configure_task_for @of_11_mem_1 {
        aie.dma_bd(%arg3 : memref<128x64xbf16> offset = 4096 len = 4096 sizes = [1, 1, 64, 64] strides = [0, 0, 64, 1])
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
    %core_0_2 = aie.core(%tile_0_2) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %0 = aie.objectfifo.acquire @of_4_broadcast_0_0(Consume, 2) : !aie.objectfifosubview<memref<64x64xbf16>>
        %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
        %2 = aie.objectfifo.subview.access %0[1] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
        %3 = aie.objectfifo.acquire @of_3_unicast_0_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
        %4 = aie.objectfifo.subview.access %3[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c2 = arith.constant 2 : index
        scf.for %arg1 = %c0_0 to %c2 step %c1_1 {
          %5 = aie.objectfifo.acquire @of_6_unicast_0(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
          %6 = aie.objectfifo.subview.access %5[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
          func.call @op0_zero_bf16_64_64_64(%6) : (memref<64x64xbf16>) -> ()
          %c1_2 = arith.constant 1 : index
          %c0_3 = arith.constant 0 : index
          %7 = arith.muli %c1_2, %arg1 : index
          %8 = arith.addi %c0_3, %7 : index
          %9 = arith.muli %c1_2, %c2 : index
          %10 = scf.index_switch %8 -> memref<64x64xbf16> 
          case 0 {
            scf.yield %1 : memref<64x64xbf16>
          }
          case 1 {
            scf.yield %2 : memref<64x64xbf16>
          }
          default {
            scf.yield %1 : memref<64x64xbf16>
          }
          %11 = arith.index_cast %arg1 : index to i32
          %c1_i32 = arith.constant 1 : i32
          %12 = arith.muli %11, %c1_i32 : i32
          %c0_i32 = arith.constant 0 : i32
          %13 = arith.addi %c0_i32, %12 : i32
          %c0_i32_4 = arith.constant 0 : i32
          %14 = arith.cmpi sle, %13, %c0_i32_4 : i32
          scf.if %14 {
            func.call @op0_matmul_bf16_bf16_64_64_64(%4, %10, %6) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>) -> ()
          }
          aie.objectfifo.release @of_6_unicast_0(Produce, 1)
        }
        aie.objectfifo.release @of_3_unicast_0_0(Consume, 1)
        aie.objectfifo.release @of_4_broadcast_0_0(Consume, 2)
      }
      aie.end
    } {link_with = "op0_mm_64_64_64.o"}
    %core_1_2 = aie.core(%tile_1_2) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %0 = aie.objectfifo.acquire @of_4_broadcast_0_0(Consume, 2) : !aie.objectfifosubview<memref<64x64xbf16>>
        %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
        %2 = aie.objectfifo.subview.access %0[1] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
        %3 = aie.objectfifo.acquire @of_3_unicast_1_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
        %4 = aie.objectfifo.subview.access %3[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c2 = arith.constant 2 : index
        scf.for %arg1 = %c0_0 to %c2 step %c1_1 {
          %5 = aie.objectfifo.acquire @of_6_unicast_1(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
          %6 = aie.objectfifo.subview.access %5[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
          func.call @op0_zero_bf16_64_64_64(%6) : (memref<64x64xbf16>) -> ()
          %c1_2 = arith.constant 1 : index
          %c0_3 = arith.constant 0 : index
          %7 = arith.muli %c1_2, %arg1 : index
          %8 = arith.addi %c0_3, %7 : index
          %9 = arith.muli %c1_2, %c2 : index
          %10 = scf.index_switch %8 -> memref<64x64xbf16> 
          case 0 {
            scf.yield %1 : memref<64x64xbf16>
          }
          case 1 {
            scf.yield %2 : memref<64x64xbf16>
          }
          default {
            scf.yield %1 : memref<64x64xbf16>
          }
          %11 = arith.index_cast %arg1 : index to i32
          %c1_i32 = arith.constant 1 : i32
          %12 = arith.muli %11, %c1_i32 : i32
          %c0_i32 = arith.constant 0 : i32
          %13 = arith.addi %c0_i32, %12 : i32
          %c1_i32_4 = arith.constant 1 : i32
          %14 = arith.cmpi sle, %13, %c1_i32_4 : i32
          scf.if %14 {
            func.call @op0_matmul_bf16_bf16_64_64_64(%4, %10, %6) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>) -> ()
          }
          aie.objectfifo.release @of_6_unicast_1(Produce, 1)
        }
        aie.objectfifo.release @of_3_unicast_1_0(Consume, 1)
        aie.objectfifo.release @of_4_broadcast_0_0(Consume, 2)
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
        %2 = aie.objectfifo.acquire @of_9_unicast_0_0(Consume, 2) : !aie.objectfifosubview<memref<64x64xbf16>>
        %3 = aie.objectfifo.subview.access %2[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
        %4 = aie.objectfifo.subview.access %2[1] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
        %5 = aie.objectfifo.acquire @of_5_broadcast_0_0(Consume, 2) : !aie.objectfifosubview<memref<64x64xbf16>>
        %6 = aie.objectfifo.subview.access %5[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
        %7 = aie.objectfifo.subview.access %5[1] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c2 = arith.constant 2 : index
        scf.for %arg1 = %c0_0 to %c2 step %c1_1 {
          %c1_2 = arith.constant 1 : index
          %c0_3 = arith.constant 0 : index
          %8 = arith.muli %c1_2, %arg1 : index
          %9 = arith.addi %c0_3, %8 : index
          %10 = arith.muli %c1_2, %c2 : index
          %11 = scf.index_switch %9 -> memref<64x64xbf16> 
          case 0 {
            scf.yield %3 : memref<64x64xbf16>
          }
          case 1 {
            scf.yield %4 : memref<64x64xbf16>
          }
          default {
            scf.yield %3 : memref<64x64xbf16>
          }
          %c1_4 = arith.constant 1 : index
          %c0_5 = arith.constant 0 : index
          %12 = arith.muli %c1_4, %arg1 : index
          %13 = arith.addi %c0_5, %12 : index
          %14 = arith.muli %c1_4, %c2 : index
          %15 = scf.index_switch %13 -> memref<64x64xbf16> 
          case 0 {
            scf.yield %6 : memref<64x64xbf16>
          }
          case 1 {
            scf.yield %7 : memref<64x64xbf16>
          }
          default {
            scf.yield %6 : memref<64x64xbf16>
          }
          %16 = arith.index_cast %arg1 : index to i32
          %c1_i32 = arith.constant 1 : i32
          %17 = arith.muli %16, %c1_i32 : i32
          %c0_i32 = arith.constant 0 : i32
          %18 = arith.addi %c0_i32, %17 : i32
          %c0_i32_6 = arith.constant 0 : i32
          %c0_7 = arith.constant 0 : index
          %c1_8 = arith.constant 1 : index
          memref.store %18, %flash_index_0_4[%c0_7] : memref<2xi32>
          memref.store %c0_i32_6, %flash_index_0_4[%c1_8] : memref<2xi32>
          %19 = aie.objectfifo.acquire @flash_scale_0_3_0_4(Consume, 1) : !aie.objectfifosubview<memref<256xbf16>>
          %20 = aie.objectfifo.subview.access %19[0] : !aie.objectfifosubview<memref<256xbf16>> -> memref<256xbf16>
          %c64_i32 = arith.constant 64 : i32
          %c0_i32_9 = arith.constant 0 : i32
          %21 = arith.cmpi ne, %18, %c0_i32_9 : i32
          %22 = arith.extui %21 : i1 to i32
          func.call @op0_matmul_PV(%11, %15, %1, %20, %c64_i32, %22, %flash_index_0_4) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>, memref<256xbf16>, i32, i32, memref<2xi32>) -> ()
          %c1_i32_10 = arith.constant 1 : i32
          %23 = arith.cmpi eq, %18, %c1_i32_10 : i32
          scf.if %23 {
            func.call @op0_rescale_O(%1, %20, %c64_i32, %flash_index_0_4) : (memref<64x64xbf16>, memref<256xbf16>, i32, memref<2xi32>) -> ()
          }
          aie.objectfifo.release @flash_scale_0_3_0_4(Consume, 1)
        }
        aie.objectfifo.release @of_5_broadcast_0_0(Consume, 2)
        aie.objectfifo.release @of_9_unicast_0_0(Consume, 2)
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
        %2 = aie.objectfifo.acquire @of_9_unicast_1_0(Consume, 2) : !aie.objectfifosubview<memref<64x64xbf16>>
        %3 = aie.objectfifo.subview.access %2[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
        %4 = aie.objectfifo.subview.access %2[1] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
        %5 = aie.objectfifo.acquire @of_5_broadcast_0_0(Consume, 2) : !aie.objectfifosubview<memref<64x64xbf16>>
        %6 = aie.objectfifo.subview.access %5[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
        %7 = aie.objectfifo.subview.access %5[1] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c2 = arith.constant 2 : index
        scf.for %arg1 = %c0_0 to %c2 step %c1_1 {
          %c1_2 = arith.constant 1 : index
          %c0_3 = arith.constant 0 : index
          %8 = arith.muli %c1_2, %arg1 : index
          %9 = arith.addi %c0_3, %8 : index
          %10 = arith.muli %c1_2, %c2 : index
          %11 = scf.index_switch %9 -> memref<64x64xbf16> 
          case 0 {
            scf.yield %3 : memref<64x64xbf16>
          }
          case 1 {
            scf.yield %4 : memref<64x64xbf16>
          }
          default {
            scf.yield %3 : memref<64x64xbf16>
          }
          %c1_4 = arith.constant 1 : index
          %c0_5 = arith.constant 0 : index
          %12 = arith.muli %c1_4, %arg1 : index
          %13 = arith.addi %c0_5, %12 : index
          %14 = arith.muli %c1_4, %c2 : index
          %15 = scf.index_switch %13 -> memref<64x64xbf16> 
          case 0 {
            scf.yield %6 : memref<64x64xbf16>
          }
          case 1 {
            scf.yield %7 : memref<64x64xbf16>
          }
          default {
            scf.yield %6 : memref<64x64xbf16>
          }
          %16 = arith.index_cast %arg1 : index to i32
          %c1_i32 = arith.constant 1 : i32
          %17 = arith.muli %16, %c1_i32 : i32
          %c0_i32 = arith.constant 0 : i32
          %18 = arith.addi %c0_i32, %17 : i32
          %c1_i32_6 = arith.constant 1 : i32
          %c0_7 = arith.constant 0 : index
          %c1_8 = arith.constant 1 : index
          memref.store %18, %flash_index_1_4[%c0_7] : memref<2xi32>
          memref.store %c1_i32_6, %flash_index_1_4[%c1_8] : memref<2xi32>
          %19 = aie.objectfifo.acquire @flash_scale_1_3_1_4(Consume, 1) : !aie.objectfifosubview<memref<256xbf16>>
          %20 = aie.objectfifo.subview.access %19[0] : !aie.objectfifosubview<memref<256xbf16>> -> memref<256xbf16>
          %c64_i32 = arith.constant 64 : i32
          %c0_i32_9 = arith.constant 0 : i32
          %21 = arith.cmpi ne, %18, %c0_i32_9 : i32
          %22 = arith.extui %21 : i1 to i32
          func.call @op0_matmul_PV(%11, %15, %1, %20, %c64_i32, %22, %flash_index_1_4) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>, memref<256xbf16>, i32, i32, memref<2xi32>) -> ()
          %c1_i32_10 = arith.constant 1 : i32
          %23 = arith.cmpi eq, %18, %c1_i32_10 : i32
          scf.if %23 {
            func.call @op0_rescale_O(%1, %20, %c64_i32, %flash_index_1_4) : (memref<64x64xbf16>, memref<256xbf16>, i32, memref<2xi32>) -> ()
          }
          aie.objectfifo.release @flash_scale_1_3_1_4(Consume, 1)
        }
        aie.objectfifo.release @of_5_broadcast_0_0(Consume, 2)
        aie.objectfifo.release @of_9_unicast_1_0(Consume, 2)
        aie.objectfifo.release @of_10_unicast_1(Produce, 1)
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
        %0 = aie.objectfifo.acquire @of_7_unicast_0_0(Consume, 2) : !aie.objectfifosubview<memref<64x64xbf16>>
        %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
        %2 = aie.objectfifo.subview.access %0[1] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c2 = arith.constant 2 : index
        scf.for %arg1 = %c0_0 to %c2 step %c1_1 {
          %3 = aie.objectfifo.acquire @of_8_unicast_0(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
          %4 = aie.objectfifo.subview.access %3[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
          %c1_2 = arith.constant 1 : index
          %c0_3 = arith.constant 0 : index
          %5 = arith.muli %c1_2, %arg1 : index
          %6 = arith.addi %c0_3, %5 : index
          %7 = arith.muli %c1_2, %c2 : index
          %8 = scf.index_switch %6 -> memref<64x64xbf16> 
          case 0 {
            scf.yield %1 : memref<64x64xbf16>
          }
          case 1 {
            scf.yield %2 : memref<64x64xbf16>
          }
          default {
            scf.yield %1 : memref<64x64xbf16>
          }
          %9 = arith.index_cast %arg1 : index to i32
          %c1_i32 = arith.constant 1 : i32
          %10 = arith.muli %9, %c1_i32 : i32
          %c0_i32 = arith.constant 0 : i32
          %11 = arith.addi %c0_i32, %10 : i32
          %c0_i32_4 = arith.constant 0 : i32
          %c0_5 = arith.constant 0 : index
          %c1_6 = arith.constant 1 : index
          memref.store %11, %flash_index_0_3[%c0_5] : memref<2xi32>
          memref.store %c0_i32_4, %flash_index_0_3[%c1_6] : memref<2xi32>
          %c64_i32 = arith.constant 64 : i32
          %c0_i32_7 = arith.constant 0 : i32
          %12 = arith.cmpi eq, %11, %c0_i32_7 : i32
          scf.if %12 {
            func.call @op0_init_scale_buffer(%flash_state_0_3, %c64_i32) : (memref<256xbf16>, i32) -> ()
          }
          %cst = arith.constant 1.4453125 : f32
          %13 = arith.truncf %cst : f32 to bf16
          %c64_i32_8 = arith.constant 64 : i32
          %c128_i32 = arith.constant 128 : i32
          %c128_i32_9 = arith.constant 128 : i32
          %c0_i32_10 = arith.constant 0 : i32
          func.call @op0_partial_softmax(%8, %4, %flash_state_0_3, %flash_index_0_3, %13, %c64_i32, %c64_i32_8, %c128_i32, %c128_i32_9) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<256xbf16>, memref<2xi32>, bf16, i32, i32, i32, i32) -> ()
          %c256_i32 = arith.constant 256 : i32
          %14 = aie.objectfifo.acquire @flash_scale_0_3_0_4(Produce, 1) : !aie.objectfifosubview<memref<256xbf16>>
          %15 = aie.objectfifo.subview.access %14[0] : !aie.objectfifosubview<memref<256xbf16>> -> memref<256xbf16>
          func.call @op0_passThroughLine(%flash_state_0_3, %15, %c256_i32) : (memref<256xbf16>, memref<256xbf16>, i32) -> ()
          aie.objectfifo.release @flash_scale_0_3_0_4(Produce, 1)
          aie.objectfifo.release @of_8_unicast_0(Produce, 1)
        }
        aie.objectfifo.release @of_7_unicast_0_0(Consume, 2)
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
        %0 = aie.objectfifo.acquire @of_7_unicast_1_0(Consume, 2) : !aie.objectfifosubview<memref<64x64xbf16>>
        %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
        %2 = aie.objectfifo.subview.access %0[1] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c2 = arith.constant 2 : index
        scf.for %arg1 = %c0_0 to %c2 step %c1_1 {
          %3 = aie.objectfifo.acquire @of_8_unicast_1(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
          %4 = aie.objectfifo.subview.access %3[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
          %c1_2 = arith.constant 1 : index
          %c0_3 = arith.constant 0 : index
          %5 = arith.muli %c1_2, %arg1 : index
          %6 = arith.addi %c0_3, %5 : index
          %7 = arith.muli %c1_2, %c2 : index
          %8 = scf.index_switch %6 -> memref<64x64xbf16> 
          case 0 {
            scf.yield %1 : memref<64x64xbf16>
          }
          case 1 {
            scf.yield %2 : memref<64x64xbf16>
          }
          default {
            scf.yield %1 : memref<64x64xbf16>
          }
          %9 = arith.index_cast %arg1 : index to i32
          %c1_i32 = arith.constant 1 : i32
          %10 = arith.muli %9, %c1_i32 : i32
          %c0_i32 = arith.constant 0 : i32
          %11 = arith.addi %c0_i32, %10 : i32
          %c1_i32_4 = arith.constant 1 : i32
          %c0_5 = arith.constant 0 : index
          %c1_6 = arith.constant 1 : index
          memref.store %11, %flash_index_1_3[%c0_5] : memref<2xi32>
          memref.store %c1_i32_4, %flash_index_1_3[%c1_6] : memref<2xi32>
          %c64_i32 = arith.constant 64 : i32
          %c0_i32_7 = arith.constant 0 : i32
          %12 = arith.cmpi eq, %11, %c0_i32_7 : i32
          scf.if %12 {
            func.call @op0_init_scale_buffer(%flash_state_1_3, %c64_i32) : (memref<256xbf16>, i32) -> ()
          }
          %cst = arith.constant 1.4453125 : f32
          %13 = arith.truncf %cst : f32 to bf16
          %c64_i32_8 = arith.constant 64 : i32
          %c128_i32 = arith.constant 128 : i32
          %c128_i32_9 = arith.constant 128 : i32
          %c0_i32_10 = arith.constant 0 : i32
          func.call @op0_partial_softmax(%8, %4, %flash_state_1_3, %flash_index_1_3, %13, %c64_i32, %c64_i32_8, %c128_i32, %c128_i32_9) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<256xbf16>, memref<2xi32>, bf16, i32, i32, i32, i32) -> ()
          %c256_i32 = arith.constant 256 : i32
          %14 = aie.objectfifo.acquire @flash_scale_1_3_1_4(Produce, 1) : !aie.objectfifosubview<memref<256xbf16>>
          %15 = aie.objectfifo.subview.access %14[0] : !aie.objectfifosubview<memref<256xbf16>> -> memref<256xbf16>
          func.call @op0_passThroughLine(%flash_state_1_3, %15, %c256_i32) : (memref<256xbf16>, memref<256xbf16>, i32) -> ()
          aie.objectfifo.release @flash_scale_1_3_1_4(Produce, 1)
          aie.objectfifo.release @of_8_unicast_1(Produce, 1)
        }
        aie.objectfifo.release @of_7_unicast_1_0(Consume, 2)
      }
      aie.end
    } {link_with = "op0_mha.o"}
    aie.objectfifo @of_0_mem_0(%shim_noc_tile_0_0, {%mem_tile_0_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_0_mem_1(%shim_noc_tile_3_0, {%mem_tile_3_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_1_mem(%shim_noc_tile_2_0, {%mem_tile_2_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<2x64x64xbf16>>  
    aie.objectfifo @of_2_mem(%shim_noc_tile_1_0, {%mem_tile_1_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<2x64x64xbf16>>  
    aie.objectfifo @of_3_unicast_0_0(%mem_tile_0_1 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%tile_0_2}, [2 : i32, 1 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo.link [@of_0_mem_0] -> [@of_3_unicast_0_0]([] [])
    aie.objectfifo @of_3_unicast_1_0(%mem_tile_3_1 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%tile_1_2}, [2 : i32, 1 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo.link [@of_0_mem_1] -> [@of_3_unicast_1_0]([] [])
    aie.objectfifo @of_4_broadcast_0_0(%mem_tile_2_1 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%tile_0_2, %tile_1_2}, [2 : i32, 2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo.link [@of_1_mem] -> [@of_4_broadcast_0_0]([] [])
    aie.objectfifo @of_5_broadcast_0_0(%mem_tile_1_1 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%tile_0_4, %tile_1_4}, [2 : i32, 2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo.link [@of_2_mem] -> [@of_5_broadcast_0_0]([] [])
    aie.objectfifo @of_6_unicast_0(%tile_0_2, {%mem_tile_3_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_6_unicast_1(%tile_1_2, {%mem_tile_6_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_7_unicast_0_0(%mem_tile_3_1 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%tile_0_3}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo.link [@of_6_unicast_0] -> [@of_7_unicast_0_0]([] [])
    aie.objectfifo @of_7_unicast_1_0(%mem_tile_6_1 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%tile_1_3}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo.link [@of_6_unicast_1] -> [@of_7_unicast_1_0]([] [])
    aie.objectfifo @of_8_unicast_0(%tile_0_3, {%mem_tile_1_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_8_unicast_1(%tile_1_3, {%mem_tile_2_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_9_unicast_0_0(%mem_tile_1_1 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%tile_0_4}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo.link [@of_8_unicast_0] -> [@of_9_unicast_0_0]([] [])
    aie.objectfifo @of_9_unicast_1_0(%mem_tile_2_1 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%tile_1_4}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo.link [@of_8_unicast_1] -> [@of_9_unicast_1_0]([] [])
    aie.objectfifo @of_10_unicast_0(%tile_0_4, {%mem_tile_0_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_10_unicast_1(%tile_1_4, {%mem_tile_6_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_11_mem_0(%mem_tile_0_1 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%shim_noc_tile_0_0}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo.link [@of_10_unicast_0] -> [@of_11_mem_0]([] [])
    aie.objectfifo @of_11_mem_1(%mem_tile_6_1 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%shim_noc_tile_6_0}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo.link [@of_10_unicast_1] -> [@of_11_mem_1]([] [])
    func.func private @op0_zero_bf16_64_64_64(memref<64x64xbf16>)
    func.func private @op0_matmul_bf16_bf16_64_64_64(memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>)
    func.func private @op0_rescale_O(memref<64x64xbf16>, memref<256xbf16>, i32, memref<2xi32>)
    func.func private @op0_zero_bf16(memref<64x64xbf16>)
    func.func private @op0_matmul_PV(memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>, memref<256xbf16>, i32, i32, memref<2xi32>)
    func.func private @op0_init_scale_buffer(memref<256xbf16>, i32)
    func.func private @op0_passThroughLine(memref<256xbf16>, memref<256xbf16>, i32) attributes {link_with = "op0_mha_passThrough.o"}
    func.func private @op0_partial_softmax(memref<64x64xbf16>, memref<64x64xbf16>, memref<256xbf16>, memref<2xi32>, bf16, i32, i32, i32, i32)
  }
}
