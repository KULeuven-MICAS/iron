module {
  aie.device(npu2) @op0__MHAStreamGroup {
    %shim_noc_tile_1_0 = aie.tile(1, 0)
    %shim_noc_tile_2_0 = aie.tile(2, 0)
    %shim_noc_tile_3_0 = aie.tile(3, 0)
    %shim_noc_tile_4_0 = aie.tile(4, 0)
    %shim_noc_tile_5_0 = aie.tile(5, 0)
    %shim_noc_tile_6_0 = aie.tile(6, 0)
    %shim_noc_tile_7_0 = aie.tile(7, 0)
    %mem_tile_2_1 = aie.tile(2, 1)
    %mem_tile_5_1 = aie.tile(5, 1)
    %mem_tile_6_1 = aie.tile(6, 1)
    %mem_tile_7_1 = aie.tile(7, 1)
    %mem_tile_3_1 = aie.tile(3, 1)
    %mem_tile_1_1 = aie.tile(1, 1)
    %tile_0_2 = aie.tile(0, 2)
    %tile_1_2 = aie.tile(1, 2)
    %tile_2_2 = aie.tile(2, 2)
    %tile_3_2 = aie.tile(3, 2)
    %tile_0_4 = aie.tile(0, 4)
    %tile_1_4 = aie.tile(1, 4)
    %tile_2_4 = aie.tile(2, 4)
    %tile_3_4 = aie.tile(3, 4)
    %mem_tile_0_1 = aie.tile(0, 1)
    %mem_tile_4_1 = aie.tile(4, 1)
    %tile_0_3 = aie.tile(0, 3)
    %tile_1_3 = aie.tile(1, 3)
    %tile_2_3 = aie.tile(2, 3)
    %tile_3_3 = aie.tile(3, 3)
    %tile_0_5 = aie.tile(0, 5)
    %tile_1_5 = aie.tile(1, 5)
    %tile_2_5 = aie.tile(2, 5)
    %tile_3_5 = aie.tile(3, 5)
    aie.runtime_sequence(%arg0: memref<512x64xbf16>, %arg1: memref<64x512xbf16>, %arg2: memref<512x64xbf16>, %arg3: memref<512x64xbf16>) {
      %0 = aiex.dma_configure_task_for @of_0_mem_0 {
        aie.dma_bd(%arg0 : memref<512x64xbf16> offset = 0 len = 8192 sizes = [1, 2, 64, 64] strides = [0, 16384, 64, 1])
        aie.end
      } {issue_token = true, iteration_t = 0 : index}
      aiex.dma_start_task(%0)
      %1 = aiex.dma_configure_task_for @of_0_mem_1 {
        aie.dma_bd(%arg0 : memref<512x64xbf16> offset = 4096 len = 8192 sizes = [1, 2, 64, 64] strides = [0, 16384, 64, 1])
        aie.end
      } {issue_token = true, iteration_t = 0 : index}
      aiex.dma_start_task(%1)
      %2 = aiex.dma_configure_task_for @of_0_mem_2 {
        aie.dma_bd(%arg0 : memref<512x64xbf16> offset = 8192 len = 8192 sizes = [1, 2, 64, 64] strides = [0, 16384, 64, 1])
        aie.end
      } {issue_token = true, iteration_t = 0 : index}
      aiex.dma_start_task(%2)
      %3 = aiex.dma_configure_task_for @of_0_mem_3 {
        aie.dma_bd(%arg0 : memref<512x64xbf16> offset = 12288 len = 8192 sizes = [1, 2, 64, 64] strides = [0, 16384, 64, 1])
        aie.end
      } {issue_token = true, iteration_t = 0 : index}
      aiex.dma_start_task(%3)
      %4 = aiex.dma_configure_task_for @of_1_mem {
        aie.dma_bd(%arg1 : memref<64x512xbf16> offset = 0 len = 32768 sizes = [1, 8, 64, 64] strides = [0, 64, 512, 1])
        aie.end
      } {issue_token = true, iteration_t = 0 : index}
      aiex.dma_start_task(%4)
      %5 = aiex.dma_configure_task_for @of_2_mem {
        aie.dma_bd(%arg2 : memref<512x64xbf16> offset = 0 len = 32768 sizes = [1, 1, 128, 256] strides = [0, 0, 256, 1])
        aie.end
      } {issue_token = true, iteration_t = 0 : index}
      aiex.dma_start_task(%5)
      %6 = aiex.dma_configure_task_for @of_10_mem_0 {
        aie.dma_bd(%arg3 : memref<512x64xbf16> offset = 0 len = 8192 sizes = [1, 2, 64, 64] strides = [0, 16384, 64, 1])
        aie.end
      } {issue_token = true, iteration_t = 0 : index}
      aiex.dma_start_task(%6)
      %7 = aiex.dma_configure_task_for @of_10_mem_1 {
        aie.dma_bd(%arg3 : memref<512x64xbf16> offset = 4096 len = 8192 sizes = [1, 2, 64, 64] strides = [0, 16384, 64, 1])
        aie.end
      } {issue_token = true, iteration_t = 0 : index}
      aiex.dma_start_task(%7)
      %8 = aiex.dma_configure_task_for @of_10_mem_2 {
        aie.dma_bd(%arg3 : memref<512x64xbf16> offset = 8192 len = 8192 sizes = [1, 2, 64, 64] strides = [0, 16384, 64, 1])
        aie.end
      } {issue_token = true, iteration_t = 0 : index}
      aiex.dma_start_task(%8)
      %9 = aiex.dma_configure_task_for @of_10_mem_3 {
        aie.dma_bd(%arg3 : memref<512x64xbf16> offset = 12288 len = 8192 sizes = [1, 2, 64, 64] strides = [0, 16384, 64, 1])
        aie.end
      } {issue_token = true, iteration_t = 0 : index}
      aiex.dma_start_task(%9)
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
    }
    %core_0_2 = aie.core(%tile_0_2) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %0 = aie.objectfifo.acquire @of_3_unicast_0_0(Consume, 2) : !aie.objectfifosubview<memref<64x64xbf16>>
        %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
        %2 = aie.objectfifo.subview.access %0[1] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c8 = arith.constant 8 : index
        scf.for %arg1 = %c0_0 to %c8 step %c1_1 {
          %3 = aie.objectfifo.acquire @of_4_broadcast_0_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
          %4 = aie.objectfifo.subview.access %3[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
          %c2 = arith.constant 2 : index
          %5 = aie.objectfifo.acquire @of_6_unicast_0(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
          %6 = aie.objectfifo.acquire @of_6_unicast_0_relay_1(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
          %7 = aie.objectfifo.subview.access %5[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
          func.call @op0_zero_bf16_64_64_64(%7) : (memref<64x64xbf16>) -> ()
          %8 = aie.objectfifo.subview.access %6[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
          func.call @op0_zero_bf16_64_64_64(%8) : (memref<64x64xbf16>) -> ()
          scf.for %arg2 = %c0_0 to %c2 step %c1_1 {
            %9 = scf.index_switch %arg2 -> memref<64x64xbf16> 
            case 0 {
              scf.yield %7 : memref<64x64xbf16>
            }
            case 1 {
              scf.yield %8 : memref<64x64xbf16>
            }
            default {
              scf.yield %7 : memref<64x64xbf16>
            }
            %c1_2 = arith.constant 1 : index
            %c0_3 = arith.constant 0 : index
            %10 = arith.muli %c1_2, %arg2 : index
            %11 = arith.addi %c0_3, %10 : index
            %12 = arith.muli %c1_2, %c2 : index
            %13 = scf.index_switch %11 -> memref<64x64xbf16> 
            case 0 {
              scf.yield %1 : memref<64x64xbf16>
            }
            case 1 {
              scf.yield %2 : memref<64x64xbf16>
            }
            default {
              scf.yield %1 : memref<64x64xbf16>
            }
            %14 = arith.index_cast %arg1 : index to i32
            %c1_i32 = arith.constant 1 : i32
            %15 = arith.muli %14, %c1_i32 : i32
            %c0_i32 = arith.constant 0 : i32
            %16 = arith.addi %c0_i32, %15 : i32
            %17 = arith.index_cast %arg2 : index to i32
            %c4_i32 = arith.constant 4 : i32
            %18 = arith.muli %17, %c4_i32 : i32
            %c0_i32_4 = arith.constant 0 : i32
            %19 = arith.addi %c0_i32_4, %18 : i32
            %20 = arith.cmpi sle, %16, %19 : i32
            scf.if %20 {
              func.call @op0_matmul_bf16_bf16_64_64_64(%13, %4, %9) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>) -> ()
            }
          }
          aie.objectfifo.release @of_6_unicast_0(Produce, 1)
          aie.objectfifo.release @of_6_unicast_0_relay_1(Produce, 1)
          aie.objectfifo.release @of_4_broadcast_0_0(Consume, 1)
        }
        aie.objectfifo.release @of_3_unicast_0_0(Consume, 2)
      }
      aie.end
    } {link_with = "op0_mm_64_64_64.o"}
    %core_1_2 = aie.core(%tile_1_2) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %0 = aie.objectfifo.acquire @of_3_unicast_1_0(Consume, 2) : !aie.objectfifosubview<memref<64x64xbf16>>
        %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
        %2 = aie.objectfifo.subview.access %0[1] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c8 = arith.constant 8 : index
        scf.for %arg1 = %c0_0 to %c8 step %c1_1 {
          %3 = aie.objectfifo.acquire @of_4_broadcast_0_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
          %4 = aie.objectfifo.subview.access %3[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
          %c2 = arith.constant 2 : index
          %5 = aie.objectfifo.acquire @of_6_unicast_1(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
          %6 = aie.objectfifo.acquire @of_6_unicast_1_relay_1(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
          %7 = aie.objectfifo.subview.access %5[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
          func.call @op0_zero_bf16_64_64_64(%7) : (memref<64x64xbf16>) -> ()
          %8 = aie.objectfifo.subview.access %6[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
          func.call @op0_zero_bf16_64_64_64(%8) : (memref<64x64xbf16>) -> ()
          scf.for %arg2 = %c0_0 to %c2 step %c1_1 {
            %9 = scf.index_switch %arg2 -> memref<64x64xbf16> 
            case 0 {
              scf.yield %7 : memref<64x64xbf16>
            }
            case 1 {
              scf.yield %8 : memref<64x64xbf16>
            }
            default {
              scf.yield %7 : memref<64x64xbf16>
            }
            %c1_2 = arith.constant 1 : index
            %c0_3 = arith.constant 0 : index
            %10 = arith.muli %c1_2, %arg2 : index
            %11 = arith.addi %c0_3, %10 : index
            %12 = arith.muli %c1_2, %c2 : index
            %13 = scf.index_switch %11 -> memref<64x64xbf16> 
            case 0 {
              scf.yield %1 : memref<64x64xbf16>
            }
            case 1 {
              scf.yield %2 : memref<64x64xbf16>
            }
            default {
              scf.yield %1 : memref<64x64xbf16>
            }
            %14 = arith.index_cast %arg1 : index to i32
            %c1_i32 = arith.constant 1 : i32
            %15 = arith.muli %14, %c1_i32 : i32
            %c0_i32 = arith.constant 0 : i32
            %16 = arith.addi %c0_i32, %15 : i32
            %17 = arith.index_cast %arg2 : index to i32
            %c4_i32 = arith.constant 4 : i32
            %18 = arith.muli %17, %c4_i32 : i32
            %c1_i32_4 = arith.constant 1 : i32
            %19 = arith.addi %c1_i32_4, %18 : i32
            %20 = arith.cmpi sle, %16, %19 : i32
            scf.if %20 {
              func.call @op0_matmul_bf16_bf16_64_64_64(%13, %4, %9) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>) -> ()
            }
          }
          aie.objectfifo.release @of_6_unicast_1(Produce, 1)
          aie.objectfifo.release @of_6_unicast_1_relay_1(Produce, 1)
          aie.objectfifo.release @of_4_broadcast_0_0(Consume, 1)
        }
        aie.objectfifo.release @of_3_unicast_1_0(Consume, 2)
      }
      aie.end
    } {link_with = "op0_mm_64_64_64.o"}
    %core_2_2 = aie.core(%tile_2_2) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %0 = aie.objectfifo.acquire @of_3_unicast_2_0(Consume, 2) : !aie.objectfifosubview<memref<64x64xbf16>>
        %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
        %2 = aie.objectfifo.subview.access %0[1] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c8 = arith.constant 8 : index
        scf.for %arg1 = %c0_0 to %c8 step %c1_1 {
          %3 = aie.objectfifo.acquire @of_4_broadcast_0_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
          %4 = aie.objectfifo.subview.access %3[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
          %c2 = arith.constant 2 : index
          %5 = aie.objectfifo.acquire @of_6_unicast_2(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
          %6 = aie.objectfifo.acquire @of_6_unicast_2_relay_1(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
          %7 = aie.objectfifo.subview.access %5[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
          func.call @op0_zero_bf16_64_64_64(%7) : (memref<64x64xbf16>) -> ()
          %8 = aie.objectfifo.subview.access %6[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
          func.call @op0_zero_bf16_64_64_64(%8) : (memref<64x64xbf16>) -> ()
          scf.for %arg2 = %c0_0 to %c2 step %c1_1 {
            %9 = scf.index_switch %arg2 -> memref<64x64xbf16> 
            case 0 {
              scf.yield %7 : memref<64x64xbf16>
            }
            case 1 {
              scf.yield %8 : memref<64x64xbf16>
            }
            default {
              scf.yield %7 : memref<64x64xbf16>
            }
            %c1_2 = arith.constant 1 : index
            %c0_3 = arith.constant 0 : index
            %10 = arith.muli %c1_2, %arg2 : index
            %11 = arith.addi %c0_3, %10 : index
            %12 = arith.muli %c1_2, %c2 : index
            %13 = scf.index_switch %11 -> memref<64x64xbf16> 
            case 0 {
              scf.yield %1 : memref<64x64xbf16>
            }
            case 1 {
              scf.yield %2 : memref<64x64xbf16>
            }
            default {
              scf.yield %1 : memref<64x64xbf16>
            }
            %14 = arith.index_cast %arg1 : index to i32
            %c1_i32 = arith.constant 1 : i32
            %15 = arith.muli %14, %c1_i32 : i32
            %c0_i32 = arith.constant 0 : i32
            %16 = arith.addi %c0_i32, %15 : i32
            %17 = arith.index_cast %arg2 : index to i32
            %c4_i32 = arith.constant 4 : i32
            %18 = arith.muli %17, %c4_i32 : i32
            %c2_i32 = arith.constant 2 : i32
            %19 = arith.addi %c2_i32, %18 : i32
            %20 = arith.cmpi sle, %16, %19 : i32
            scf.if %20 {
              func.call @op0_matmul_bf16_bf16_64_64_64(%13, %4, %9) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>) -> ()
            }
          }
          aie.objectfifo.release @of_6_unicast_2(Produce, 1)
          aie.objectfifo.release @of_6_unicast_2_relay_1(Produce, 1)
          aie.objectfifo.release @of_4_broadcast_0_0(Consume, 1)
        }
        aie.objectfifo.release @of_3_unicast_2_0(Consume, 2)
      }
      aie.end
    } {link_with = "op0_mm_64_64_64.o"}
    %core_3_2 = aie.core(%tile_3_2) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %0 = aie.objectfifo.acquire @of_3_unicast_3_0(Consume, 2) : !aie.objectfifosubview<memref<64x64xbf16>>
        %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
        %2 = aie.objectfifo.subview.access %0[1] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c8 = arith.constant 8 : index
        scf.for %arg1 = %c0_0 to %c8 step %c1_1 {
          %3 = aie.objectfifo.acquire @of_4_broadcast_0_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
          %4 = aie.objectfifo.subview.access %3[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
          %c2 = arith.constant 2 : index
          %5 = aie.objectfifo.acquire @of_6_unicast_3(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
          %6 = aie.objectfifo.acquire @of_6_unicast_3_relay_1(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
          %7 = aie.objectfifo.subview.access %5[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
          func.call @op0_zero_bf16_64_64_64(%7) : (memref<64x64xbf16>) -> ()
          %8 = aie.objectfifo.subview.access %6[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
          func.call @op0_zero_bf16_64_64_64(%8) : (memref<64x64xbf16>) -> ()
          scf.for %arg2 = %c0_0 to %c2 step %c1_1 {
            %9 = scf.index_switch %arg2 -> memref<64x64xbf16> 
            case 0 {
              scf.yield %7 : memref<64x64xbf16>
            }
            case 1 {
              scf.yield %8 : memref<64x64xbf16>
            }
            default {
              scf.yield %7 : memref<64x64xbf16>
            }
            %c1_2 = arith.constant 1 : index
            %c0_3 = arith.constant 0 : index
            %10 = arith.muli %c1_2, %arg2 : index
            %11 = arith.addi %c0_3, %10 : index
            %12 = arith.muli %c1_2, %c2 : index
            %13 = scf.index_switch %11 -> memref<64x64xbf16> 
            case 0 {
              scf.yield %1 : memref<64x64xbf16>
            }
            case 1 {
              scf.yield %2 : memref<64x64xbf16>
            }
            default {
              scf.yield %1 : memref<64x64xbf16>
            }
            %14 = arith.index_cast %arg1 : index to i32
            %c1_i32 = arith.constant 1 : i32
            %15 = arith.muli %14, %c1_i32 : i32
            %c0_i32 = arith.constant 0 : i32
            %16 = arith.addi %c0_i32, %15 : i32
            %17 = arith.index_cast %arg2 : index to i32
            %c4_i32 = arith.constant 4 : i32
            %18 = arith.muli %17, %c4_i32 : i32
            %c3_i32 = arith.constant 3 : i32
            %19 = arith.addi %c3_i32, %18 : i32
            %20 = arith.cmpi sle, %16, %19 : i32
            scf.if %20 {
              func.call @op0_matmul_bf16_bf16_64_64_64(%13, %4, %9) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>) -> ()
            }
          }
          aie.objectfifo.release @of_6_unicast_3(Produce, 1)
          aie.objectfifo.release @of_6_unicast_3_relay_1(Produce, 1)
          aie.objectfifo.release @of_4_broadcast_0_0(Consume, 1)
        }
        aie.objectfifo.release @of_3_unicast_3_0(Consume, 2)
      }
      aie.end
    } {link_with = "op0_mm_64_64_64.o"}
    %flash_index_0_4 = aie.buffer(%tile_0_4) {sym_name = "flash_index_0_4"} : memref<2xi32> 
    %core_0_4 = aie.core(%tile_0_4) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %0 = aie.objectfifo.acquire @of_9_unicast_0(Produce, 2) : !aie.objectfifosubview<memref<64x64xbf16>>
        %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
        func.call @op0_zero_bf16(%1) : (memref<64x64xbf16>) -> ()
        %2 = aie.objectfifo.subview.access %0[1] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
        func.call @op0_zero_bf16(%2) : (memref<64x64xbf16>) -> ()
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c8 = arith.constant 8 : index
        scf.for %arg1 = %c0_0 to %c8 step %c1_1 {
          %3 = aie.objectfifo.acquire @of_5_broadcast_0_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
          %4 = aie.objectfifo.subview.access %3[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
          %c2 = arith.constant 2 : index
          %5 = aie.objectfifo.acquire @of_8_switch_join_0_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
          %6 = aie.objectfifo.acquire @of_8_switch_join_0_1(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
          %7 = aie.objectfifo.subview.access %5[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
          %8 = aie.objectfifo.subview.access %6[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
          scf.for %arg2 = %c0_0 to %c2 step %c1_1 {
            %c1_2 = arith.constant 1 : index
            %c0_3 = arith.constant 0 : index
            %9 = arith.muli %c1_2, %arg2 : index
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
            %13 = scf.index_switch %arg2 -> memref<64x64xbf16> 
            case 0 {
              scf.yield %7 : memref<64x64xbf16>
            }
            case 1 {
              scf.yield %8 : memref<64x64xbf16>
            }
            default {
              scf.yield %7 : memref<64x64xbf16>
            }
            %14 = arith.index_cast %arg1 : index to i32
            %c1_i32 = arith.constant 1 : i32
            %15 = arith.muli %14, %c1_i32 : i32
            %c0_i32 = arith.constant 0 : i32
            %16 = arith.addi %c0_i32, %15 : i32
            %17 = arith.index_cast %arg2 : index to i32
            %c4_i32 = arith.constant 4 : i32
            %18 = arith.muli %17, %c4_i32 : i32
            %c0_i32_4 = arith.constant 0 : i32
            %19 = arith.addi %c0_i32_4, %18 : i32
            %c0_5 = arith.constant 0 : index
            %c1_6 = arith.constant 1 : index
            memref.store %16, %flash_index_0_4[%c0_5] : memref<2xi32>
            memref.store %19, %flash_index_0_4[%c1_6] : memref<2xi32>
            scf.index_switch %arg2 
            case 0 {
              %20 = aie.objectfifo.acquire @flash_scale_0_3_0_4(Consume, 1) : !aie.objectfifosubview<memref<256xbf16>>
              %21 = aie.objectfifo.subview.access %20[0] : !aie.objectfifosubview<memref<256xbf16>> -> memref<256xbf16>
              %c64_i32 = arith.constant 64 : i32
              %c0_i32_7 = arith.constant 0 : i32
              %22 = arith.cmpi ne, %16, %c0_i32_7 : i32
              %23 = arith.extui %22 : i1 to i32
              func.call @op0_matmul_PV(%13, %4, %12, %21, %c64_i32, %23, %flash_index_0_4) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>, memref<256xbf16>, i32, i32, memref<2xi32>) -> ()
              %c7_i32 = arith.constant 7 : i32
              %24 = arith.cmpi eq, %16, %c7_i32 : i32
              scf.if %24 {
                func.call @op0_rescale_O(%12, %21, %c64_i32, %flash_index_0_4) : (memref<64x64xbf16>, memref<256xbf16>, i32, memref<2xi32>) -> ()
              }
              aie.objectfifo.release @flash_scale_0_3_0_4(Consume, 1)
              scf.yield
            }
            case 1 {
              %20 = aie.objectfifo.acquire @flash_scale_0_5_0_4(Consume, 1) : !aie.objectfifosubview<memref<256xbf16>>
              %21 = aie.objectfifo.subview.access %20[0] : !aie.objectfifosubview<memref<256xbf16>> -> memref<256xbf16>
              %c64_i32 = arith.constant 64 : i32
              %c0_i32_7 = arith.constant 0 : i32
              %22 = arith.cmpi ne, %16, %c0_i32_7 : i32
              %23 = arith.extui %22 : i1 to i32
              func.call @op0_matmul_PV(%13, %4, %12, %21, %c64_i32, %23, %flash_index_0_4) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>, memref<256xbf16>, i32, i32, memref<2xi32>) -> ()
              %c7_i32 = arith.constant 7 : i32
              %24 = arith.cmpi eq, %16, %c7_i32 : i32
              scf.if %24 {
                func.call @op0_rescale_O(%12, %21, %c64_i32, %flash_index_0_4) : (memref<64x64xbf16>, memref<256xbf16>, i32, memref<2xi32>) -> ()
              }
              aie.objectfifo.release @flash_scale_0_5_0_4(Consume, 1)
              scf.yield
            }
            default {
              %20 = aie.objectfifo.acquire @flash_scale_0_3_0_4(Consume, 1) : !aie.objectfifosubview<memref<256xbf16>>
              %21 = aie.objectfifo.subview.access %20[0] : !aie.objectfifosubview<memref<256xbf16>> -> memref<256xbf16>
              %c64_i32 = arith.constant 64 : i32
              %c0_i32_7 = arith.constant 0 : i32
              %22 = arith.cmpi ne, %16, %c0_i32_7 : i32
              %23 = arith.extui %22 : i1 to i32
              func.call @op0_matmul_PV(%13, %4, %12, %21, %c64_i32, %23, %flash_index_0_4) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>, memref<256xbf16>, i32, i32, memref<2xi32>) -> ()
              %c7_i32 = arith.constant 7 : i32
              %24 = arith.cmpi eq, %16, %c7_i32 : i32
              scf.if %24 {
                func.call @op0_rescale_O(%12, %21, %c64_i32, %flash_index_0_4) : (memref<64x64xbf16>, memref<256xbf16>, i32, memref<2xi32>) -> ()
              }
              aie.objectfifo.release @flash_scale_0_3_0_4(Consume, 1)
            }
          }
          aie.objectfifo.release @of_8_switch_join_0_0(Consume, 1)
          aie.objectfifo.release @of_8_switch_join_0_1(Consume, 1)
          aie.objectfifo.release @of_5_broadcast_0_0(Consume, 1)
        }
        aie.objectfifo.release @of_9_unicast_0(Produce, 2)
      }
      aie.end
    } {link_with = "op0_mha.o"}
    %flash_index_1_4 = aie.buffer(%tile_1_4) {sym_name = "flash_index_1_4"} : memref<2xi32> 
    %core_1_4 = aie.core(%tile_1_4) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %0 = aie.objectfifo.acquire @of_9_unicast_1(Produce, 2) : !aie.objectfifosubview<memref<64x64xbf16>>
        %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
        func.call @op0_zero_bf16(%1) : (memref<64x64xbf16>) -> ()
        %2 = aie.objectfifo.subview.access %0[1] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
        func.call @op0_zero_bf16(%2) : (memref<64x64xbf16>) -> ()
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c8 = arith.constant 8 : index
        scf.for %arg1 = %c0_0 to %c8 step %c1_1 {
          %3 = aie.objectfifo.acquire @of_5_broadcast_0_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
          %4 = aie.objectfifo.subview.access %3[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
          %c2 = arith.constant 2 : index
          %5 = aie.objectfifo.acquire @of_8_switch_join_1_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
          %6 = aie.objectfifo.acquire @of_8_switch_join_1_1(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
          %7 = aie.objectfifo.subview.access %5[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
          %8 = aie.objectfifo.subview.access %6[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
          scf.for %arg2 = %c0_0 to %c2 step %c1_1 {
            %c1_2 = arith.constant 1 : index
            %c0_3 = arith.constant 0 : index
            %9 = arith.muli %c1_2, %arg2 : index
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
            %13 = scf.index_switch %arg2 -> memref<64x64xbf16> 
            case 0 {
              scf.yield %7 : memref<64x64xbf16>
            }
            case 1 {
              scf.yield %8 : memref<64x64xbf16>
            }
            default {
              scf.yield %7 : memref<64x64xbf16>
            }
            %14 = arith.index_cast %arg1 : index to i32
            %c1_i32 = arith.constant 1 : i32
            %15 = arith.muli %14, %c1_i32 : i32
            %c0_i32 = arith.constant 0 : i32
            %16 = arith.addi %c0_i32, %15 : i32
            %17 = arith.index_cast %arg2 : index to i32
            %c4_i32 = arith.constant 4 : i32
            %18 = arith.muli %17, %c4_i32 : i32
            %c1_i32_4 = arith.constant 1 : i32
            %19 = arith.addi %c1_i32_4, %18 : i32
            %c0_5 = arith.constant 0 : index
            %c1_6 = arith.constant 1 : index
            memref.store %16, %flash_index_1_4[%c0_5] : memref<2xi32>
            memref.store %19, %flash_index_1_4[%c1_6] : memref<2xi32>
            scf.index_switch %arg2 
            case 0 {
              %20 = aie.objectfifo.acquire @flash_scale_1_3_1_4(Consume, 1) : !aie.objectfifosubview<memref<256xbf16>>
              %21 = aie.objectfifo.subview.access %20[0] : !aie.objectfifosubview<memref<256xbf16>> -> memref<256xbf16>
              %c64_i32 = arith.constant 64 : i32
              %c0_i32_7 = arith.constant 0 : i32
              %22 = arith.cmpi ne, %16, %c0_i32_7 : i32
              %23 = arith.extui %22 : i1 to i32
              func.call @op0_matmul_PV(%13, %4, %12, %21, %c64_i32, %23, %flash_index_1_4) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>, memref<256xbf16>, i32, i32, memref<2xi32>) -> ()
              %c7_i32 = arith.constant 7 : i32
              %24 = arith.cmpi eq, %16, %c7_i32 : i32
              scf.if %24 {
                func.call @op0_rescale_O(%12, %21, %c64_i32, %flash_index_1_4) : (memref<64x64xbf16>, memref<256xbf16>, i32, memref<2xi32>) -> ()
              }
              aie.objectfifo.release @flash_scale_1_3_1_4(Consume, 1)
              scf.yield
            }
            case 1 {
              %20 = aie.objectfifo.acquire @flash_scale_1_5_1_4(Consume, 1) : !aie.objectfifosubview<memref<256xbf16>>
              %21 = aie.objectfifo.subview.access %20[0] : !aie.objectfifosubview<memref<256xbf16>> -> memref<256xbf16>
              %c64_i32 = arith.constant 64 : i32
              %c0_i32_7 = arith.constant 0 : i32
              %22 = arith.cmpi ne, %16, %c0_i32_7 : i32
              %23 = arith.extui %22 : i1 to i32
              func.call @op0_matmul_PV(%13, %4, %12, %21, %c64_i32, %23, %flash_index_1_4) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>, memref<256xbf16>, i32, i32, memref<2xi32>) -> ()
              %c7_i32 = arith.constant 7 : i32
              %24 = arith.cmpi eq, %16, %c7_i32 : i32
              scf.if %24 {
                func.call @op0_rescale_O(%12, %21, %c64_i32, %flash_index_1_4) : (memref<64x64xbf16>, memref<256xbf16>, i32, memref<2xi32>) -> ()
              }
              aie.objectfifo.release @flash_scale_1_5_1_4(Consume, 1)
              scf.yield
            }
            default {
              %20 = aie.objectfifo.acquire @flash_scale_1_3_1_4(Consume, 1) : !aie.objectfifosubview<memref<256xbf16>>
              %21 = aie.objectfifo.subview.access %20[0] : !aie.objectfifosubview<memref<256xbf16>> -> memref<256xbf16>
              %c64_i32 = arith.constant 64 : i32
              %c0_i32_7 = arith.constant 0 : i32
              %22 = arith.cmpi ne, %16, %c0_i32_7 : i32
              %23 = arith.extui %22 : i1 to i32
              func.call @op0_matmul_PV(%13, %4, %12, %21, %c64_i32, %23, %flash_index_1_4) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>, memref<256xbf16>, i32, i32, memref<2xi32>) -> ()
              %c7_i32 = arith.constant 7 : i32
              %24 = arith.cmpi eq, %16, %c7_i32 : i32
              scf.if %24 {
                func.call @op0_rescale_O(%12, %21, %c64_i32, %flash_index_1_4) : (memref<64x64xbf16>, memref<256xbf16>, i32, memref<2xi32>) -> ()
              }
              aie.objectfifo.release @flash_scale_1_3_1_4(Consume, 1)
            }
          }
          aie.objectfifo.release @of_8_switch_join_1_0(Consume, 1)
          aie.objectfifo.release @of_8_switch_join_1_1(Consume, 1)
          aie.objectfifo.release @of_5_broadcast_0_0(Consume, 1)
        }
        aie.objectfifo.release @of_9_unicast_1(Produce, 2)
      }
      aie.end
    } {link_with = "op0_mha.o"}
    %flash_index_2_4 = aie.buffer(%tile_2_4) {sym_name = "flash_index_2_4"} : memref<2xi32> 
    %core_2_4 = aie.core(%tile_2_4) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %0 = aie.objectfifo.acquire @of_9_unicast_2(Produce, 2) : !aie.objectfifosubview<memref<64x64xbf16>>
        %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
        func.call @op0_zero_bf16(%1) : (memref<64x64xbf16>) -> ()
        %2 = aie.objectfifo.subview.access %0[1] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
        func.call @op0_zero_bf16(%2) : (memref<64x64xbf16>) -> ()
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c8 = arith.constant 8 : index
        scf.for %arg1 = %c0_0 to %c8 step %c1_1 {
          %3 = aie.objectfifo.acquire @of_5_broadcast_0_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
          %4 = aie.objectfifo.subview.access %3[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
          %c2 = arith.constant 2 : index
          %5 = aie.objectfifo.acquire @of_8_switch_join_2_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
          %6 = aie.objectfifo.acquire @of_8_switch_join_2_1(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
          %7 = aie.objectfifo.subview.access %5[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
          %8 = aie.objectfifo.subview.access %6[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
          scf.for %arg2 = %c0_0 to %c2 step %c1_1 {
            %c1_2 = arith.constant 1 : index
            %c0_3 = arith.constant 0 : index
            %9 = arith.muli %c1_2, %arg2 : index
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
            %13 = scf.index_switch %arg2 -> memref<64x64xbf16> 
            case 0 {
              scf.yield %7 : memref<64x64xbf16>
            }
            case 1 {
              scf.yield %8 : memref<64x64xbf16>
            }
            default {
              scf.yield %7 : memref<64x64xbf16>
            }
            %14 = arith.index_cast %arg1 : index to i32
            %c1_i32 = arith.constant 1 : i32
            %15 = arith.muli %14, %c1_i32 : i32
            %c0_i32 = arith.constant 0 : i32
            %16 = arith.addi %c0_i32, %15 : i32
            %17 = arith.index_cast %arg2 : index to i32
            %c4_i32 = arith.constant 4 : i32
            %18 = arith.muli %17, %c4_i32 : i32
            %c2_i32 = arith.constant 2 : i32
            %19 = arith.addi %c2_i32, %18 : i32
            %c0_4 = arith.constant 0 : index
            %c1_5 = arith.constant 1 : index
            memref.store %16, %flash_index_2_4[%c0_4] : memref<2xi32>
            memref.store %19, %flash_index_2_4[%c1_5] : memref<2xi32>
            scf.index_switch %arg2 
            case 0 {
              %20 = aie.objectfifo.acquire @flash_scale_2_3_2_4(Consume, 1) : !aie.objectfifosubview<memref<256xbf16>>
              %21 = aie.objectfifo.subview.access %20[0] : !aie.objectfifosubview<memref<256xbf16>> -> memref<256xbf16>
              %c64_i32 = arith.constant 64 : i32
              %c0_i32_6 = arith.constant 0 : i32
              %22 = arith.cmpi ne, %16, %c0_i32_6 : i32
              %23 = arith.extui %22 : i1 to i32
              func.call @op0_matmul_PV(%13, %4, %12, %21, %c64_i32, %23, %flash_index_2_4) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>, memref<256xbf16>, i32, i32, memref<2xi32>) -> ()
              %c7_i32 = arith.constant 7 : i32
              %24 = arith.cmpi eq, %16, %c7_i32 : i32
              scf.if %24 {
                func.call @op0_rescale_O(%12, %21, %c64_i32, %flash_index_2_4) : (memref<64x64xbf16>, memref<256xbf16>, i32, memref<2xi32>) -> ()
              }
              aie.objectfifo.release @flash_scale_2_3_2_4(Consume, 1)
              scf.yield
            }
            case 1 {
              %20 = aie.objectfifo.acquire @flash_scale_2_5_2_4(Consume, 1) : !aie.objectfifosubview<memref<256xbf16>>
              %21 = aie.objectfifo.subview.access %20[0] : !aie.objectfifosubview<memref<256xbf16>> -> memref<256xbf16>
              %c64_i32 = arith.constant 64 : i32
              %c0_i32_6 = arith.constant 0 : i32
              %22 = arith.cmpi ne, %16, %c0_i32_6 : i32
              %23 = arith.extui %22 : i1 to i32
              func.call @op0_matmul_PV(%13, %4, %12, %21, %c64_i32, %23, %flash_index_2_4) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>, memref<256xbf16>, i32, i32, memref<2xi32>) -> ()
              %c7_i32 = arith.constant 7 : i32
              %24 = arith.cmpi eq, %16, %c7_i32 : i32
              scf.if %24 {
                func.call @op0_rescale_O(%12, %21, %c64_i32, %flash_index_2_4) : (memref<64x64xbf16>, memref<256xbf16>, i32, memref<2xi32>) -> ()
              }
              aie.objectfifo.release @flash_scale_2_5_2_4(Consume, 1)
              scf.yield
            }
            default {
              %20 = aie.objectfifo.acquire @flash_scale_2_3_2_4(Consume, 1) : !aie.objectfifosubview<memref<256xbf16>>
              %21 = aie.objectfifo.subview.access %20[0] : !aie.objectfifosubview<memref<256xbf16>> -> memref<256xbf16>
              %c64_i32 = arith.constant 64 : i32
              %c0_i32_6 = arith.constant 0 : i32
              %22 = arith.cmpi ne, %16, %c0_i32_6 : i32
              %23 = arith.extui %22 : i1 to i32
              func.call @op0_matmul_PV(%13, %4, %12, %21, %c64_i32, %23, %flash_index_2_4) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>, memref<256xbf16>, i32, i32, memref<2xi32>) -> ()
              %c7_i32 = arith.constant 7 : i32
              %24 = arith.cmpi eq, %16, %c7_i32 : i32
              scf.if %24 {
                func.call @op0_rescale_O(%12, %21, %c64_i32, %flash_index_2_4) : (memref<64x64xbf16>, memref<256xbf16>, i32, memref<2xi32>) -> ()
              }
              aie.objectfifo.release @flash_scale_2_3_2_4(Consume, 1)
            }
          }
          aie.objectfifo.release @of_8_switch_join_2_0(Consume, 1)
          aie.objectfifo.release @of_8_switch_join_2_1(Consume, 1)
          aie.objectfifo.release @of_5_broadcast_0_0(Consume, 1)
        }
        aie.objectfifo.release @of_9_unicast_2(Produce, 2)
      }
      aie.end
    } {link_with = "op0_mha.o"}
    %flash_index_3_4 = aie.buffer(%tile_3_4) {sym_name = "flash_index_3_4"} : memref<2xi32> 
    %core_3_4 = aie.core(%tile_3_4) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %0 = aie.objectfifo.acquire @of_9_unicast_3(Produce, 2) : !aie.objectfifosubview<memref<64x64xbf16>>
        %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
        func.call @op0_zero_bf16(%1) : (memref<64x64xbf16>) -> ()
        %2 = aie.objectfifo.subview.access %0[1] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
        func.call @op0_zero_bf16(%2) : (memref<64x64xbf16>) -> ()
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c8 = arith.constant 8 : index
        scf.for %arg1 = %c0_0 to %c8 step %c1_1 {
          %3 = aie.objectfifo.acquire @of_5_broadcast_0_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
          %4 = aie.objectfifo.subview.access %3[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
          %c2 = arith.constant 2 : index
          %5 = aie.objectfifo.acquire @of_8_switch_join_3_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
          %6 = aie.objectfifo.acquire @of_8_switch_join_3_1(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
          %7 = aie.objectfifo.subview.access %5[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
          %8 = aie.objectfifo.subview.access %6[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
          scf.for %arg2 = %c0_0 to %c2 step %c1_1 {
            %c1_2 = arith.constant 1 : index
            %c0_3 = arith.constant 0 : index
            %9 = arith.muli %c1_2, %arg2 : index
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
            %13 = scf.index_switch %arg2 -> memref<64x64xbf16> 
            case 0 {
              scf.yield %7 : memref<64x64xbf16>
            }
            case 1 {
              scf.yield %8 : memref<64x64xbf16>
            }
            default {
              scf.yield %7 : memref<64x64xbf16>
            }
            %14 = arith.index_cast %arg1 : index to i32
            %c1_i32 = arith.constant 1 : i32
            %15 = arith.muli %14, %c1_i32 : i32
            %c0_i32 = arith.constant 0 : i32
            %16 = arith.addi %c0_i32, %15 : i32
            %17 = arith.index_cast %arg2 : index to i32
            %c4_i32 = arith.constant 4 : i32
            %18 = arith.muli %17, %c4_i32 : i32
            %c3_i32 = arith.constant 3 : i32
            %19 = arith.addi %c3_i32, %18 : i32
            %c0_4 = arith.constant 0 : index
            %c1_5 = arith.constant 1 : index
            memref.store %16, %flash_index_3_4[%c0_4] : memref<2xi32>
            memref.store %19, %flash_index_3_4[%c1_5] : memref<2xi32>
            scf.index_switch %arg2 
            case 0 {
              %20 = aie.objectfifo.acquire @flash_scale_3_3_3_4(Consume, 1) : !aie.objectfifosubview<memref<256xbf16>>
              %21 = aie.objectfifo.subview.access %20[0] : !aie.objectfifosubview<memref<256xbf16>> -> memref<256xbf16>
              %c64_i32 = arith.constant 64 : i32
              %c0_i32_6 = arith.constant 0 : i32
              %22 = arith.cmpi ne, %16, %c0_i32_6 : i32
              %23 = arith.extui %22 : i1 to i32
              func.call @op0_matmul_PV(%13, %4, %12, %21, %c64_i32, %23, %flash_index_3_4) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>, memref<256xbf16>, i32, i32, memref<2xi32>) -> ()
              %c7_i32 = arith.constant 7 : i32
              %24 = arith.cmpi eq, %16, %c7_i32 : i32
              scf.if %24 {
                func.call @op0_rescale_O(%12, %21, %c64_i32, %flash_index_3_4) : (memref<64x64xbf16>, memref<256xbf16>, i32, memref<2xi32>) -> ()
              }
              aie.objectfifo.release @flash_scale_3_3_3_4(Consume, 1)
              scf.yield
            }
            case 1 {
              %20 = aie.objectfifo.acquire @flash_scale_3_5_3_4(Consume, 1) : !aie.objectfifosubview<memref<256xbf16>>
              %21 = aie.objectfifo.subview.access %20[0] : !aie.objectfifosubview<memref<256xbf16>> -> memref<256xbf16>
              %c64_i32 = arith.constant 64 : i32
              %c0_i32_6 = arith.constant 0 : i32
              %22 = arith.cmpi ne, %16, %c0_i32_6 : i32
              %23 = arith.extui %22 : i1 to i32
              func.call @op0_matmul_PV(%13, %4, %12, %21, %c64_i32, %23, %flash_index_3_4) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>, memref<256xbf16>, i32, i32, memref<2xi32>) -> ()
              %c7_i32 = arith.constant 7 : i32
              %24 = arith.cmpi eq, %16, %c7_i32 : i32
              scf.if %24 {
                func.call @op0_rescale_O(%12, %21, %c64_i32, %flash_index_3_4) : (memref<64x64xbf16>, memref<256xbf16>, i32, memref<2xi32>) -> ()
              }
              aie.objectfifo.release @flash_scale_3_5_3_4(Consume, 1)
              scf.yield
            }
            default {
              %20 = aie.objectfifo.acquire @flash_scale_3_3_3_4(Consume, 1) : !aie.objectfifosubview<memref<256xbf16>>
              %21 = aie.objectfifo.subview.access %20[0] : !aie.objectfifosubview<memref<256xbf16>> -> memref<256xbf16>
              %c64_i32 = arith.constant 64 : i32
              %c0_i32_6 = arith.constant 0 : i32
              %22 = arith.cmpi ne, %16, %c0_i32_6 : i32
              %23 = arith.extui %22 : i1 to i32
              func.call @op0_matmul_PV(%13, %4, %12, %21, %c64_i32, %23, %flash_index_3_4) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>, memref<256xbf16>, i32, i32, memref<2xi32>) -> ()
              %c7_i32 = arith.constant 7 : i32
              %24 = arith.cmpi eq, %16, %c7_i32 : i32
              scf.if %24 {
                func.call @op0_rescale_O(%12, %21, %c64_i32, %flash_index_3_4) : (memref<64x64xbf16>, memref<256xbf16>, i32, memref<2xi32>) -> ()
              }
              aie.objectfifo.release @flash_scale_3_3_3_4(Consume, 1)
            }
          }
          aie.objectfifo.release @of_8_switch_join_3_0(Consume, 1)
          aie.objectfifo.release @of_8_switch_join_3_1(Consume, 1)
          aie.objectfifo.release @of_5_broadcast_0_0(Consume, 1)
        }
        aie.objectfifo.release @of_9_unicast_3(Produce, 2)
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
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c8 = arith.constant 8 : index
        scf.for %arg1 = %c0_0 to %c8 step %c1_1 {
          %0 = aie.objectfifo.acquire @of_8_switch_join_0_0(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
          %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
          %2 = aie.objectfifo.acquire @of_7_distribute_0_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
          %3 = aie.objectfifo.subview.access %2[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
          %4 = arith.index_cast %arg1 : index to i32
          %c1_i32 = arith.constant 1 : i32
          %5 = arith.muli %4, %c1_i32 : i32
          %c0_i32 = arith.constant 0 : i32
          %6 = arith.addi %c0_i32, %5 : i32
          %c0_i32_2 = arith.constant 0 : i32
          %c0_3 = arith.constant 0 : index
          %c1_4 = arith.constant 1 : index
          memref.store %6, %flash_index_0_3[%c0_3] : memref<2xi32>
          memref.store %c0_i32_2, %flash_index_0_3[%c1_4] : memref<2xi32>
          %c64_i32 = arith.constant 64 : i32
          %c0_i32_5 = arith.constant 0 : i32
          %7 = arith.cmpi eq, %6, %c0_i32_5 : i32
          scf.if %7 {
            func.call @op0_init_scale_buffer(%flash_state_0_3, %c64_i32) : (memref<256xbf16>, i32) -> ()
          }
          %cst = arith.constant 1.4453125 : f32
          %8 = arith.truncf %cst : f32 to bf16
          %c64_i32_6 = arith.constant 64 : i32
          %c512_i32 = arith.constant 512 : i32
          %c512_i32_7 = arith.constant 512 : i32
          %c2_i32 = arith.constant 2 : i32
          func.call @op0_partial_softmax_mode(%3, %1, %flash_state_0_3, %flash_index_0_3, %8, %c64_i32, %c64_i32_6, %c512_i32, %c512_i32_7, %c2_i32) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<256xbf16>, memref<2xi32>, bf16, i32, i32, i32, i32, i32) -> ()
          %c256_i32 = arith.constant 256 : i32
          %9 = aie.objectfifo.acquire @flash_scale_0_3_0_4(Produce, 1) : !aie.objectfifosubview<memref<256xbf16>>
          %10 = aie.objectfifo.subview.access %9[0] : !aie.objectfifosubview<memref<256xbf16>> -> memref<256xbf16>
          func.call @op0_passThroughLine(%flash_state_0_3, %10, %c256_i32) : (memref<256xbf16>, memref<256xbf16>, i32) -> ()
          aie.objectfifo.release @flash_scale_0_3_0_4(Produce, 1)
          aie.objectfifo.release @of_7_distribute_0_0(Consume, 1)
          aie.objectfifo.release @of_8_switch_join_0_0(Produce, 1)
        }
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
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c8 = arith.constant 8 : index
        scf.for %arg1 = %c0_0 to %c8 step %c1_1 {
          %0 = aie.objectfifo.acquire @of_8_switch_join_1_0(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
          %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
          %2 = aie.objectfifo.acquire @of_7_distribute_1_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
          %3 = aie.objectfifo.subview.access %2[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
          %4 = arith.index_cast %arg1 : index to i32
          %c1_i32 = arith.constant 1 : i32
          %5 = arith.muli %4, %c1_i32 : i32
          %c0_i32 = arith.constant 0 : i32
          %6 = arith.addi %c0_i32, %5 : i32
          %c1_i32_2 = arith.constant 1 : i32
          %c0_3 = arith.constant 0 : index
          %c1_4 = arith.constant 1 : index
          memref.store %6, %flash_index_1_3[%c0_3] : memref<2xi32>
          memref.store %c1_i32_2, %flash_index_1_3[%c1_4] : memref<2xi32>
          %c64_i32 = arith.constant 64 : i32
          %c0_i32_5 = arith.constant 0 : i32
          %7 = arith.cmpi eq, %6, %c0_i32_5 : i32
          scf.if %7 {
            func.call @op0_init_scale_buffer(%flash_state_1_3, %c64_i32) : (memref<256xbf16>, i32) -> ()
          }
          %cst = arith.constant 1.4453125 : f32
          %8 = arith.truncf %cst : f32 to bf16
          %c64_i32_6 = arith.constant 64 : i32
          %c512_i32 = arith.constant 512 : i32
          %c512_i32_7 = arith.constant 512 : i32
          %c2_i32 = arith.constant 2 : i32
          func.call @op0_partial_softmax_mode(%3, %1, %flash_state_1_3, %flash_index_1_3, %8, %c64_i32, %c64_i32_6, %c512_i32, %c512_i32_7, %c2_i32) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<256xbf16>, memref<2xi32>, bf16, i32, i32, i32, i32, i32) -> ()
          %c256_i32 = arith.constant 256 : i32
          %9 = aie.objectfifo.acquire @flash_scale_1_3_1_4(Produce, 1) : !aie.objectfifosubview<memref<256xbf16>>
          %10 = aie.objectfifo.subview.access %9[0] : !aie.objectfifosubview<memref<256xbf16>> -> memref<256xbf16>
          func.call @op0_passThroughLine(%flash_state_1_3, %10, %c256_i32) : (memref<256xbf16>, memref<256xbf16>, i32) -> ()
          aie.objectfifo.release @flash_scale_1_3_1_4(Produce, 1)
          aie.objectfifo.release @of_7_distribute_1_0(Consume, 1)
          aie.objectfifo.release @of_8_switch_join_1_0(Produce, 1)
        }
      }
      aie.end
    } {link_with = "op0_mha.o"}
    %flash_state_2_3 = aie.buffer(%tile_2_3) {sym_name = "flash_state_2_3"} : memref<256xbf16> 
    %flash_index_2_3 = aie.buffer(%tile_2_3) {sym_name = "flash_index_2_3"} : memref<2xi32> 
    aie.objectfifo @flash_scale_2_3_2_4(%tile_2_3, {%tile_2_4}, 2 : i32) : !aie.objectfifo<memref<256xbf16>>  
    %core_2_3 = aie.core(%tile_2_3) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c8 = arith.constant 8 : index
        scf.for %arg1 = %c0_0 to %c8 step %c1_1 {
          %0 = aie.objectfifo.acquire @of_8_switch_join_2_0(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
          %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
          %2 = aie.objectfifo.acquire @of_7_distribute_2_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
          %3 = aie.objectfifo.subview.access %2[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
          %4 = arith.index_cast %arg1 : index to i32
          %c1_i32 = arith.constant 1 : i32
          %5 = arith.muli %4, %c1_i32 : i32
          %c0_i32 = arith.constant 0 : i32
          %6 = arith.addi %c0_i32, %5 : i32
          %c2_i32 = arith.constant 2 : i32
          %c0_2 = arith.constant 0 : index
          %c1_3 = arith.constant 1 : index
          memref.store %6, %flash_index_2_3[%c0_2] : memref<2xi32>
          memref.store %c2_i32, %flash_index_2_3[%c1_3] : memref<2xi32>
          %c64_i32 = arith.constant 64 : i32
          %c0_i32_4 = arith.constant 0 : i32
          %7 = arith.cmpi eq, %6, %c0_i32_4 : i32
          scf.if %7 {
            func.call @op0_init_scale_buffer(%flash_state_2_3, %c64_i32) : (memref<256xbf16>, i32) -> ()
          }
          %cst = arith.constant 1.4453125 : f32
          %8 = arith.truncf %cst : f32 to bf16
          %c64_i32_5 = arith.constant 64 : i32
          %c512_i32 = arith.constant 512 : i32
          %c512_i32_6 = arith.constant 512 : i32
          %c2_i32_7 = arith.constant 2 : i32
          func.call @op0_partial_softmax_mode(%3, %1, %flash_state_2_3, %flash_index_2_3, %8, %c64_i32, %c64_i32_5, %c512_i32, %c512_i32_6, %c2_i32_7) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<256xbf16>, memref<2xi32>, bf16, i32, i32, i32, i32, i32) -> ()
          %c256_i32 = arith.constant 256 : i32
          %9 = aie.objectfifo.acquire @flash_scale_2_3_2_4(Produce, 1) : !aie.objectfifosubview<memref<256xbf16>>
          %10 = aie.objectfifo.subview.access %9[0] : !aie.objectfifosubview<memref<256xbf16>> -> memref<256xbf16>
          func.call @op0_passThroughLine(%flash_state_2_3, %10, %c256_i32) : (memref<256xbf16>, memref<256xbf16>, i32) -> ()
          aie.objectfifo.release @flash_scale_2_3_2_4(Produce, 1)
          aie.objectfifo.release @of_7_distribute_2_0(Consume, 1)
          aie.objectfifo.release @of_8_switch_join_2_0(Produce, 1)
        }
      }
      aie.end
    } {link_with = "op0_mha.o"}
    %flash_state_3_3 = aie.buffer(%tile_3_3) {sym_name = "flash_state_3_3"} : memref<256xbf16> 
    %flash_index_3_3 = aie.buffer(%tile_3_3) {sym_name = "flash_index_3_3"} : memref<2xi32> 
    aie.objectfifo @flash_scale_3_3_3_4(%tile_3_3, {%tile_3_4}, 2 : i32) : !aie.objectfifo<memref<256xbf16>>  
    %core_3_3 = aie.core(%tile_3_3) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c8 = arith.constant 8 : index
        scf.for %arg1 = %c0_0 to %c8 step %c1_1 {
          %0 = aie.objectfifo.acquire @of_8_switch_join_3_0(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
          %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
          %2 = aie.objectfifo.acquire @of_7_distribute_3_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
          %3 = aie.objectfifo.subview.access %2[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
          %4 = arith.index_cast %arg1 : index to i32
          %c1_i32 = arith.constant 1 : i32
          %5 = arith.muli %4, %c1_i32 : i32
          %c0_i32 = arith.constant 0 : i32
          %6 = arith.addi %c0_i32, %5 : i32
          %c3_i32 = arith.constant 3 : i32
          %c0_2 = arith.constant 0 : index
          %c1_3 = arith.constant 1 : index
          memref.store %6, %flash_index_3_3[%c0_2] : memref<2xi32>
          memref.store %c3_i32, %flash_index_3_3[%c1_3] : memref<2xi32>
          %c64_i32 = arith.constant 64 : i32
          %c0_i32_4 = arith.constant 0 : i32
          %7 = arith.cmpi eq, %6, %c0_i32_4 : i32
          scf.if %7 {
            func.call @op0_init_scale_buffer(%flash_state_3_3, %c64_i32) : (memref<256xbf16>, i32) -> ()
          }
          %cst = arith.constant 1.4453125 : f32
          %8 = arith.truncf %cst : f32 to bf16
          %c64_i32_5 = arith.constant 64 : i32
          %c512_i32 = arith.constant 512 : i32
          %c512_i32_6 = arith.constant 512 : i32
          %c2_i32 = arith.constant 2 : i32
          func.call @op0_partial_softmax_mode(%3, %1, %flash_state_3_3, %flash_index_3_3, %8, %c64_i32, %c64_i32_5, %c512_i32, %c512_i32_6, %c2_i32) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<256xbf16>, memref<2xi32>, bf16, i32, i32, i32, i32, i32) -> ()
          %c256_i32 = arith.constant 256 : i32
          %9 = aie.objectfifo.acquire @flash_scale_3_3_3_4(Produce, 1) : !aie.objectfifosubview<memref<256xbf16>>
          %10 = aie.objectfifo.subview.access %9[0] : !aie.objectfifosubview<memref<256xbf16>> -> memref<256xbf16>
          func.call @op0_passThroughLine(%flash_state_3_3, %10, %c256_i32) : (memref<256xbf16>, memref<256xbf16>, i32) -> ()
          aie.objectfifo.release @flash_scale_3_3_3_4(Produce, 1)
          aie.objectfifo.release @of_7_distribute_3_0(Consume, 1)
          aie.objectfifo.release @of_8_switch_join_3_0(Produce, 1)
        }
      }
      aie.end
    } {link_with = "op0_mha.o"}
    %flash_state_0_5 = aie.buffer(%tile_0_5) {sym_name = "flash_state_0_5"} : memref<256xbf16> 
    %flash_index_0_5 = aie.buffer(%tile_0_5) {sym_name = "flash_index_0_5"} : memref<2xi32> 
    aie.objectfifo @flash_scale_0_5_0_4(%tile_0_5, {%tile_0_4}, 2 : i32) : !aie.objectfifo<memref<256xbf16>>  
    %core_0_5 = aie.core(%tile_0_5) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c8 = arith.constant 8 : index
        scf.for %arg1 = %c0_0 to %c8 step %c1_1 {
          %0 = aie.objectfifo.acquire @of_8_switch_join_0_1(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
          %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
          %2 = aie.objectfifo.acquire @of_7_distribute_0_1(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
          %3 = aie.objectfifo.subview.access %2[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
          %4 = arith.index_cast %arg1 : index to i32
          %c1_i32 = arith.constant 1 : i32
          %5 = arith.muli %4, %c1_i32 : i32
          %c0_i32 = arith.constant 0 : i32
          %6 = arith.addi %c0_i32, %5 : i32
          %c4_i32 = arith.constant 4 : i32
          %c0_2 = arith.constant 0 : index
          %c1_3 = arith.constant 1 : index
          memref.store %6, %flash_index_0_5[%c0_2] : memref<2xi32>
          memref.store %c4_i32, %flash_index_0_5[%c1_3] : memref<2xi32>
          %c64_i32 = arith.constant 64 : i32
          %c0_i32_4 = arith.constant 0 : i32
          %7 = arith.cmpi eq, %6, %c0_i32_4 : i32
          scf.if %7 {
            func.call @op0_init_scale_buffer(%flash_state_0_5, %c64_i32) : (memref<256xbf16>, i32) -> ()
          }
          %cst = arith.constant 1.4453125 : f32
          %8 = arith.truncf %cst : f32 to bf16
          %c64_i32_5 = arith.constant 64 : i32
          %c512_i32 = arith.constant 512 : i32
          %c512_i32_6 = arith.constant 512 : i32
          %c2_i32 = arith.constant 2 : i32
          func.call @op0_partial_softmax_mode(%3, %1, %flash_state_0_5, %flash_index_0_5, %8, %c64_i32, %c64_i32_5, %c512_i32, %c512_i32_6, %c2_i32) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<256xbf16>, memref<2xi32>, bf16, i32, i32, i32, i32, i32) -> ()
          %c256_i32 = arith.constant 256 : i32
          %9 = aie.objectfifo.acquire @flash_scale_0_5_0_4(Produce, 1) : !aie.objectfifosubview<memref<256xbf16>>
          %10 = aie.objectfifo.subview.access %9[0] : !aie.objectfifosubview<memref<256xbf16>> -> memref<256xbf16>
          func.call @op0_passThroughLine(%flash_state_0_5, %10, %c256_i32) : (memref<256xbf16>, memref<256xbf16>, i32) -> ()
          aie.objectfifo.release @flash_scale_0_5_0_4(Produce, 1)
          aie.objectfifo.release @of_7_distribute_0_1(Consume, 1)
          aie.objectfifo.release @of_8_switch_join_0_1(Produce, 1)
        }
      }
      aie.end
    } {link_with = "op0_mha.o"}
    %flash_state_1_5 = aie.buffer(%tile_1_5) {sym_name = "flash_state_1_5"} : memref<256xbf16> 
    %flash_index_1_5 = aie.buffer(%tile_1_5) {sym_name = "flash_index_1_5"} : memref<2xi32> 
    aie.objectfifo @flash_scale_1_5_1_4(%tile_1_5, {%tile_1_4}, 2 : i32) : !aie.objectfifo<memref<256xbf16>>  
    %core_1_5 = aie.core(%tile_1_5) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c8 = arith.constant 8 : index
        scf.for %arg1 = %c0_0 to %c8 step %c1_1 {
          %0 = aie.objectfifo.acquire @of_8_switch_join_1_1(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
          %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
          %2 = aie.objectfifo.acquire @of_7_distribute_1_1(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
          %3 = aie.objectfifo.subview.access %2[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
          %4 = arith.index_cast %arg1 : index to i32
          %c1_i32 = arith.constant 1 : i32
          %5 = arith.muli %4, %c1_i32 : i32
          %c0_i32 = arith.constant 0 : i32
          %6 = arith.addi %c0_i32, %5 : i32
          %c5_i32 = arith.constant 5 : i32
          %c0_2 = arith.constant 0 : index
          %c1_3 = arith.constant 1 : index
          memref.store %6, %flash_index_1_5[%c0_2] : memref<2xi32>
          memref.store %c5_i32, %flash_index_1_5[%c1_3] : memref<2xi32>
          %c64_i32 = arith.constant 64 : i32
          %c0_i32_4 = arith.constant 0 : i32
          %7 = arith.cmpi eq, %6, %c0_i32_4 : i32
          scf.if %7 {
            func.call @op0_init_scale_buffer(%flash_state_1_5, %c64_i32) : (memref<256xbf16>, i32) -> ()
          }
          %cst = arith.constant 1.4453125 : f32
          %8 = arith.truncf %cst : f32 to bf16
          %c64_i32_5 = arith.constant 64 : i32
          %c512_i32 = arith.constant 512 : i32
          %c512_i32_6 = arith.constant 512 : i32
          %c2_i32 = arith.constant 2 : i32
          func.call @op0_partial_softmax_mode(%3, %1, %flash_state_1_5, %flash_index_1_5, %8, %c64_i32, %c64_i32_5, %c512_i32, %c512_i32_6, %c2_i32) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<256xbf16>, memref<2xi32>, bf16, i32, i32, i32, i32, i32) -> ()
          %c256_i32 = arith.constant 256 : i32
          %9 = aie.objectfifo.acquire @flash_scale_1_5_1_4(Produce, 1) : !aie.objectfifosubview<memref<256xbf16>>
          %10 = aie.objectfifo.subview.access %9[0] : !aie.objectfifosubview<memref<256xbf16>> -> memref<256xbf16>
          func.call @op0_passThroughLine(%flash_state_1_5, %10, %c256_i32) : (memref<256xbf16>, memref<256xbf16>, i32) -> ()
          aie.objectfifo.release @flash_scale_1_5_1_4(Produce, 1)
          aie.objectfifo.release @of_7_distribute_1_1(Consume, 1)
          aie.objectfifo.release @of_8_switch_join_1_1(Produce, 1)
        }
      }
      aie.end
    } {link_with = "op0_mha.o"}
    %flash_state_2_5 = aie.buffer(%tile_2_5) {sym_name = "flash_state_2_5"} : memref<256xbf16> 
    %flash_index_2_5 = aie.buffer(%tile_2_5) {sym_name = "flash_index_2_5"} : memref<2xi32> 
    aie.objectfifo @flash_scale_2_5_2_4(%tile_2_5, {%tile_2_4}, 2 : i32) : !aie.objectfifo<memref<256xbf16>>  
    %core_2_5 = aie.core(%tile_2_5) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c8 = arith.constant 8 : index
        scf.for %arg1 = %c0_0 to %c8 step %c1_1 {
          %0 = aie.objectfifo.acquire @of_8_switch_join_2_1(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
          %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
          %2 = aie.objectfifo.acquire @of_7_distribute_2_1(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
          %3 = aie.objectfifo.subview.access %2[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
          %4 = arith.index_cast %arg1 : index to i32
          %c1_i32 = arith.constant 1 : i32
          %5 = arith.muli %4, %c1_i32 : i32
          %c0_i32 = arith.constant 0 : i32
          %6 = arith.addi %c0_i32, %5 : i32
          %c6_i32 = arith.constant 6 : i32
          %c0_2 = arith.constant 0 : index
          %c1_3 = arith.constant 1 : index
          memref.store %6, %flash_index_2_5[%c0_2] : memref<2xi32>
          memref.store %c6_i32, %flash_index_2_5[%c1_3] : memref<2xi32>
          %c64_i32 = arith.constant 64 : i32
          %c0_i32_4 = arith.constant 0 : i32
          %7 = arith.cmpi eq, %6, %c0_i32_4 : i32
          scf.if %7 {
            func.call @op0_init_scale_buffer(%flash_state_2_5, %c64_i32) : (memref<256xbf16>, i32) -> ()
          }
          %cst = arith.constant 1.4453125 : f32
          %8 = arith.truncf %cst : f32 to bf16
          %c64_i32_5 = arith.constant 64 : i32
          %c512_i32 = arith.constant 512 : i32
          %c512_i32_6 = arith.constant 512 : i32
          %c2_i32 = arith.constant 2 : i32
          func.call @op0_partial_softmax_mode(%3, %1, %flash_state_2_5, %flash_index_2_5, %8, %c64_i32, %c64_i32_5, %c512_i32, %c512_i32_6, %c2_i32) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<256xbf16>, memref<2xi32>, bf16, i32, i32, i32, i32, i32) -> ()
          %c256_i32 = arith.constant 256 : i32
          %9 = aie.objectfifo.acquire @flash_scale_2_5_2_4(Produce, 1) : !aie.objectfifosubview<memref<256xbf16>>
          %10 = aie.objectfifo.subview.access %9[0] : !aie.objectfifosubview<memref<256xbf16>> -> memref<256xbf16>
          func.call @op0_passThroughLine(%flash_state_2_5, %10, %c256_i32) : (memref<256xbf16>, memref<256xbf16>, i32) -> ()
          aie.objectfifo.release @flash_scale_2_5_2_4(Produce, 1)
          aie.objectfifo.release @of_7_distribute_2_1(Consume, 1)
          aie.objectfifo.release @of_8_switch_join_2_1(Produce, 1)
        }
      }
      aie.end
    } {link_with = "op0_mha.o"}
    %flash_state_3_5 = aie.buffer(%tile_3_5) {sym_name = "flash_state_3_5"} : memref<256xbf16> 
    %flash_index_3_5 = aie.buffer(%tile_3_5) {sym_name = "flash_index_3_5"} : memref<2xi32> 
    aie.objectfifo @flash_scale_3_5_3_4(%tile_3_5, {%tile_3_4}, 2 : i32) : !aie.objectfifo<memref<256xbf16>>  
    %core_3_5 = aie.core(%tile_3_5) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c8 = arith.constant 8 : index
        scf.for %arg1 = %c0_0 to %c8 step %c1_1 {
          %0 = aie.objectfifo.acquire @of_8_switch_join_3_1(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
          %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
          %2 = aie.objectfifo.acquire @of_7_distribute_3_1(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
          %3 = aie.objectfifo.subview.access %2[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
          %4 = arith.index_cast %arg1 : index to i32
          %c1_i32 = arith.constant 1 : i32
          %5 = arith.muli %4, %c1_i32 : i32
          %c0_i32 = arith.constant 0 : i32
          %6 = arith.addi %c0_i32, %5 : i32
          %c7_i32 = arith.constant 7 : i32
          %c0_2 = arith.constant 0 : index
          %c1_3 = arith.constant 1 : index
          memref.store %6, %flash_index_3_5[%c0_2] : memref<2xi32>
          memref.store %c7_i32, %flash_index_3_5[%c1_3] : memref<2xi32>
          %c64_i32 = arith.constant 64 : i32
          %c0_i32_4 = arith.constant 0 : i32
          %7 = arith.cmpi eq, %6, %c0_i32_4 : i32
          scf.if %7 {
            func.call @op0_init_scale_buffer(%flash_state_3_5, %c64_i32) : (memref<256xbf16>, i32) -> ()
          }
          %cst = arith.constant 1.4453125 : f32
          %8 = arith.truncf %cst : f32 to bf16
          %c64_i32_5 = arith.constant 64 : i32
          %c512_i32 = arith.constant 512 : i32
          %c512_i32_6 = arith.constant 512 : i32
          %c2_i32 = arith.constant 2 : i32
          func.call @op0_partial_softmax_mode(%3, %1, %flash_state_3_5, %flash_index_3_5, %8, %c64_i32, %c64_i32_5, %c512_i32, %c512_i32_6, %c2_i32) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<256xbf16>, memref<2xi32>, bf16, i32, i32, i32, i32, i32) -> ()
          %c256_i32 = arith.constant 256 : i32
          %9 = aie.objectfifo.acquire @flash_scale_3_5_3_4(Produce, 1) : !aie.objectfifosubview<memref<256xbf16>>
          %10 = aie.objectfifo.subview.access %9[0] : !aie.objectfifosubview<memref<256xbf16>> -> memref<256xbf16>
          func.call @op0_passThroughLine(%flash_state_3_5, %10, %c256_i32) : (memref<256xbf16>, memref<256xbf16>, i32) -> ()
          aie.objectfifo.release @flash_scale_3_5_3_4(Produce, 1)
          aie.objectfifo.release @of_7_distribute_3_1(Consume, 1)
          aie.objectfifo.release @of_8_switch_join_3_1(Produce, 1)
        }
      }
      aie.end
    } {link_with = "op0_mha.o"}
    aie.objectfifo @of_0_mem_0(%shim_noc_tile_2_0, {%mem_tile_2_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<2x64x64xbf16>>  
    aie.objectfifo @of_0_mem_1(%shim_noc_tile_5_0, {%mem_tile_5_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<2x64x64xbf16>>  
    aie.objectfifo @of_0_mem_2(%shim_noc_tile_6_0, {%mem_tile_6_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<2x64x64xbf16>>  
    aie.objectfifo @of_0_mem_3(%shim_noc_tile_7_0, {%mem_tile_7_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<2x64x64xbf16>>  
    aie.objectfifo @of_1_mem(%shim_noc_tile_3_0, {%mem_tile_3_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_2_mem(%shim_noc_tile_1_0, {%mem_tile_1_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_3_unicast_0_0(%mem_tile_2_1 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%tile_0_2}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo.link [@of_0_mem_0] -> [@of_3_unicast_0_0]([] [])
    aie.objectfifo @of_3_unicast_1_0(%mem_tile_5_1 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%tile_1_2}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo.link [@of_0_mem_1] -> [@of_3_unicast_1_0]([] [])
    aie.objectfifo @of_3_unicast_2_0(%mem_tile_6_1 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%tile_2_2}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo.link [@of_0_mem_2] -> [@of_3_unicast_2_0]([] [])
    aie.objectfifo @of_3_unicast_3_0(%mem_tile_7_1 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%tile_3_2}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo.link [@of_0_mem_3] -> [@of_3_unicast_3_0]([] [])
    aie.objectfifo @of_4_broadcast_0_0(%mem_tile_3_1 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%tile_0_2, %tile_1_2, %tile_2_2, %tile_3_2}, [2 : i32, 2 : i32, 2 : i32, 2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo.link [@of_1_mem] -> [@of_4_broadcast_0_0]([] [])
    aie.objectfifo @of_5_broadcast_0_0(%mem_tile_1_1 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%tile_0_4, %tile_1_4, %tile_2_4, %tile_3_4}, [2 : i32, 2 : i32, 2 : i32, 2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo.link [@of_2_mem] -> [@of_5_broadcast_0_0]([] [])
    aie.objectfifo @of_6_unicast_0(%tile_0_2, {%mem_tile_0_1}, [1 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_6_unicast_0_relay_1(%tile_0_2, {%mem_tile_0_1}, [1 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_6_unicast_1(%tile_1_2, {%mem_tile_3_1}, [1 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_6_unicast_1_relay_1(%tile_1_2, {%mem_tile_3_1}, [1 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_6_unicast_2(%tile_2_2, {%mem_tile_4_1}, [1 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_6_unicast_2_relay_1(%tile_2_2, {%mem_tile_4_1}, [1 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_6_unicast_3(%tile_3_2, {%mem_tile_5_1}, [1 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_6_unicast_3_relay_1(%tile_3_2, {%mem_tile_5_1}, [1 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_7_distribute_0_0(%mem_tile_0_1 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%tile_0_3}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_7_distribute_0_1(%mem_tile_0_1 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%tile_0_5}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo.link [@of_6_unicast_0] -> [@of_7_distribute_0_0]([] [])
    aie.objectfifo.link [@of_6_unicast_0_relay_1] -> [@of_7_distribute_0_1]([] [])
    aie.objectfifo @of_7_distribute_1_0(%mem_tile_3_1 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%tile_1_3}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_7_distribute_1_1(%mem_tile_3_1 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%tile_1_5}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo.link [@of_6_unicast_1] -> [@of_7_distribute_1_0]([] [])
    aie.objectfifo.link [@of_6_unicast_1_relay_1] -> [@of_7_distribute_1_1]([] [])
    aie.objectfifo @of_7_distribute_2_0(%mem_tile_4_1 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%tile_2_3}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_7_distribute_2_1(%mem_tile_4_1 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%tile_2_5}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo.link [@of_6_unicast_2] -> [@of_7_distribute_2_0]([] [])
    aie.objectfifo.link [@of_6_unicast_2_relay_1] -> [@of_7_distribute_2_1]([] [])
    aie.objectfifo @of_7_distribute_3_0(%mem_tile_5_1 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%tile_3_3}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_7_distribute_3_1(%mem_tile_5_1 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%tile_3_5}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo.link [@of_6_unicast_3] -> [@of_7_distribute_3_0]([] [])
    aie.objectfifo.link [@of_6_unicast_3_relay_1] -> [@of_7_distribute_3_1]([] [])
    aie.objectfifo @of_8_switch_join_0_0(%tile_0_3, {%tile_0_4}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_8_switch_join_0_1(%tile_0_5, {%tile_0_4}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_8_switch_join_1_0(%tile_1_3, {%tile_1_4}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_8_switch_join_1_1(%tile_1_5, {%tile_1_4}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_8_switch_join_2_0(%tile_2_3, {%tile_2_4}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_8_switch_join_2_1(%tile_2_5, {%tile_2_4}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_8_switch_join_3_0(%tile_3_3, {%tile_3_4}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_8_switch_join_3_1(%tile_3_5, {%tile_3_4}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_9_unicast_0(%tile_0_4, {%mem_tile_1_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_9_unicast_1(%tile_1_4, {%mem_tile_4_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_9_unicast_2(%tile_2_4, {%mem_tile_6_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_9_unicast_3(%tile_3_4, {%mem_tile_7_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_10_mem_0(%mem_tile_1_1 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%shim_noc_tile_1_0}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<2x64x64xbf16>>  
    aie.objectfifo.link [@of_9_unicast_0] -> [@of_10_mem_0]([] [])
    aie.objectfifo @of_10_mem_1(%mem_tile_4_1 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%shim_noc_tile_4_0}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<2x64x64xbf16>>  
    aie.objectfifo.link [@of_9_unicast_1] -> [@of_10_mem_1]([] [])
    aie.objectfifo @of_10_mem_2(%mem_tile_6_1 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%shim_noc_tile_6_0}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<2x64x64xbf16>>  
    aie.objectfifo.link [@of_9_unicast_2] -> [@of_10_mem_2]([] [])
    aie.objectfifo @of_10_mem_3(%mem_tile_7_1 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%shim_noc_tile_7_0}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<2x64x64xbf16>>  
    aie.objectfifo.link [@of_9_unicast_3] -> [@of_10_mem_3]([] [])
    func.func private @op0_zero_bf16_64_64_64(memref<64x64xbf16>)
    func.func private @op0_matmul_bf16_bf16_64_64_64(memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>)
    func.func private @op0_rescale_O(memref<64x64xbf16>, memref<256xbf16>, i32, memref<2xi32>)
    func.func private @op0_zero_bf16(memref<64x64xbf16>)
    func.func private @op0_matmul_PV(memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>, memref<256xbf16>, i32, i32, memref<2xi32>)
    func.func private @op0_init_scale_buffer(memref<256xbf16>, i32)
    func.func private @op0_passThroughLine(memref<256xbf16>, memref<256xbf16>, i32) attributes {link_with = "op0_mha_passThrough.o"}
    func.func private @op0_partial_softmax_mode(memref<64x64xbf16>, memref<64x64xbf16>, memref<256xbf16>, memref<2xi32>, bf16, i32, i32, i32, i32, i32)
  }
  aie.device(npu2) @reset_device {
    aie.runtime_sequence() {
    }
  }
  aie.device(npu2) {
    aie.runtime_sequence(%arg0: memref<2359296xbf16>, %arg1: memref<786432xbf16>, %arg2: memref<1xbf16>) {
      aiex.configure @op0__MHAStreamGroup {
        %subview = memref.subview %arg0[0] [32768] [1] : memref<2359296xbf16> to memref<32768xbf16>
        %reinterpret_cast = memref.reinterpret_cast %subview to offset: [0], sizes: [512, 64], strides: [64, 1] : memref<32768xbf16> to memref<512x64xbf16>
        %subview_0 = memref.subview %arg0[786432] [32768] [1] : memref<2359296xbf16> to memref<32768xbf16, strided<[1], offset: 786432>>
        %reinterpret_cast_1 = memref.reinterpret_cast %subview_0 to offset: [0], sizes: [64, 512], strides: [512, 1] : memref<32768xbf16, strided<[1], offset: 786432>> to memref<64x512xbf16>
        %subview_2 = memref.subview %arg0[1572864] [32768] [1] : memref<2359296xbf16> to memref<32768xbf16, strided<[1], offset: 1572864>>
        %reinterpret_cast_3 = memref.reinterpret_cast %subview_2 to offset: [0], sizes: [512, 64], strides: [64, 1] : memref<32768xbf16, strided<[1], offset: 1572864>> to memref<512x64xbf16>
        %subview_4 = memref.subview %arg1[0] [32768] [1] : memref<786432xbf16> to memref<32768xbf16>
        %reinterpret_cast_5 = memref.reinterpret_cast %subview_4 to offset: [0], sizes: [512, 64], strides: [64, 1] : memref<32768xbf16> to memref<512x64xbf16>
        aiex.run @sequence(%reinterpret_cast, %reinterpret_cast_1, %reinterpret_cast_3, %reinterpret_cast_5) : (memref<512x64xbf16>, memref<64x512xbf16>, memref<512x64xbf16>, memref<512x64xbf16>)
        %subview_6 = memref.subview %arg0[32768] [32768] [1] : memref<2359296xbf16> to memref<32768xbf16, strided<[1], offset: 32768>>
        %reinterpret_cast_7 = memref.reinterpret_cast %subview_6 to offset: [0], sizes: [512, 64], strides: [64, 1] : memref<32768xbf16, strided<[1], offset: 32768>> to memref<512x64xbf16>
        %subview_8 = memref.subview %arg0[819200] [32768] [1] : memref<2359296xbf16> to memref<32768xbf16, strided<[1], offset: 819200>>
        %reinterpret_cast_9 = memref.reinterpret_cast %subview_8 to offset: [0], sizes: [64, 512], strides: [512, 1] : memref<32768xbf16, strided<[1], offset: 819200>> to memref<64x512xbf16>
        %subview_10 = memref.subview %arg0[1605632] [32768] [1] : memref<2359296xbf16> to memref<32768xbf16, strided<[1], offset: 1605632>>
        %reinterpret_cast_11 = memref.reinterpret_cast %subview_10 to offset: [0], sizes: [512, 64], strides: [64, 1] : memref<32768xbf16, strided<[1], offset: 1605632>> to memref<512x64xbf16>
        %subview_12 = memref.subview %arg1[32768] [32768] [1] : memref<786432xbf16> to memref<32768xbf16, strided<[1], offset: 32768>>
        %reinterpret_cast_13 = memref.reinterpret_cast %subview_12 to offset: [0], sizes: [512, 64], strides: [64, 1] : memref<32768xbf16, strided<[1], offset: 32768>> to memref<512x64xbf16>
        aiex.run @sequence(%reinterpret_cast_7, %reinterpret_cast_9, %reinterpret_cast_11, %reinterpret_cast_13) : (memref<512x64xbf16>, memref<64x512xbf16>, memref<512x64xbf16>, memref<512x64xbf16>)
        %subview_14 = memref.subview %arg0[65536] [32768] [1] : memref<2359296xbf16> to memref<32768xbf16, strided<[1], offset: 65536>>
        %reinterpret_cast_15 = memref.reinterpret_cast %subview_14 to offset: [0], sizes: [512, 64], strides: [64, 1] : memref<32768xbf16, strided<[1], offset: 65536>> to memref<512x64xbf16>
        %subview_16 = memref.subview %arg0[851968] [32768] [1] : memref<2359296xbf16> to memref<32768xbf16, strided<[1], offset: 851968>>
        %reinterpret_cast_17 = memref.reinterpret_cast %subview_16 to offset: [0], sizes: [64, 512], strides: [512, 1] : memref<32768xbf16, strided<[1], offset: 851968>> to memref<64x512xbf16>
        %subview_18 = memref.subview %arg0[1638400] [32768] [1] : memref<2359296xbf16> to memref<32768xbf16, strided<[1], offset: 1638400>>
        %reinterpret_cast_19 = memref.reinterpret_cast %subview_18 to offset: [0], sizes: [512, 64], strides: [64, 1] : memref<32768xbf16, strided<[1], offset: 1638400>> to memref<512x64xbf16>
        %subview_20 = memref.subview %arg1[65536] [32768] [1] : memref<786432xbf16> to memref<32768xbf16, strided<[1], offset: 65536>>
        %reinterpret_cast_21 = memref.reinterpret_cast %subview_20 to offset: [0], sizes: [512, 64], strides: [64, 1] : memref<32768xbf16, strided<[1], offset: 65536>> to memref<512x64xbf16>
        aiex.run @sequence(%reinterpret_cast_15, %reinterpret_cast_17, %reinterpret_cast_19, %reinterpret_cast_21) : (memref<512x64xbf16>, memref<64x512xbf16>, memref<512x64xbf16>, memref<512x64xbf16>)
        %subview_22 = memref.subview %arg0[98304] [32768] [1] : memref<2359296xbf16> to memref<32768xbf16, strided<[1], offset: 98304>>
        %reinterpret_cast_23 = memref.reinterpret_cast %subview_22 to offset: [0], sizes: [512, 64], strides: [64, 1] : memref<32768xbf16, strided<[1], offset: 98304>> to memref<512x64xbf16>
        %subview_24 = memref.subview %arg0[884736] [32768] [1] : memref<2359296xbf16> to memref<32768xbf16, strided<[1], offset: 884736>>
        %reinterpret_cast_25 = memref.reinterpret_cast %subview_24 to offset: [0], sizes: [64, 512], strides: [512, 1] : memref<32768xbf16, strided<[1], offset: 884736>> to memref<64x512xbf16>
        %subview_26 = memref.subview %arg0[1671168] [32768] [1] : memref<2359296xbf16> to memref<32768xbf16, strided<[1], offset: 1671168>>
        %reinterpret_cast_27 = memref.reinterpret_cast %subview_26 to offset: [0], sizes: [512, 64], strides: [64, 1] : memref<32768xbf16, strided<[1], offset: 1671168>> to memref<512x64xbf16>
        %subview_28 = memref.subview %arg1[98304] [32768] [1] : memref<786432xbf16> to memref<32768xbf16, strided<[1], offset: 98304>>
        %reinterpret_cast_29 = memref.reinterpret_cast %subview_28 to offset: [0], sizes: [512, 64], strides: [64, 1] : memref<32768xbf16, strided<[1], offset: 98304>> to memref<512x64xbf16>
        aiex.run @sequence(%reinterpret_cast_23, %reinterpret_cast_25, %reinterpret_cast_27, %reinterpret_cast_29) : (memref<512x64xbf16>, memref<64x512xbf16>, memref<512x64xbf16>, memref<512x64xbf16>)
        %subview_30 = memref.subview %arg0[131072] [32768] [1] : memref<2359296xbf16> to memref<32768xbf16, strided<[1], offset: 131072>>
        %reinterpret_cast_31 = memref.reinterpret_cast %subview_30 to offset: [0], sizes: [512, 64], strides: [64, 1] : memref<32768xbf16, strided<[1], offset: 131072>> to memref<512x64xbf16>
        %subview_32 = memref.subview %arg0[917504] [32768] [1] : memref<2359296xbf16> to memref<32768xbf16, strided<[1], offset: 917504>>
        %reinterpret_cast_33 = memref.reinterpret_cast %subview_32 to offset: [0], sizes: [64, 512], strides: [512, 1] : memref<32768xbf16, strided<[1], offset: 917504>> to memref<64x512xbf16>
        %subview_34 = memref.subview %arg0[1703936] [32768] [1] : memref<2359296xbf16> to memref<32768xbf16, strided<[1], offset: 1703936>>
        %reinterpret_cast_35 = memref.reinterpret_cast %subview_34 to offset: [0], sizes: [512, 64], strides: [64, 1] : memref<32768xbf16, strided<[1], offset: 1703936>> to memref<512x64xbf16>
        %subview_36 = memref.subview %arg1[131072] [32768] [1] : memref<786432xbf16> to memref<32768xbf16, strided<[1], offset: 131072>>
        %reinterpret_cast_37 = memref.reinterpret_cast %subview_36 to offset: [0], sizes: [512, 64], strides: [64, 1] : memref<32768xbf16, strided<[1], offset: 131072>> to memref<512x64xbf16>
        aiex.run @sequence(%reinterpret_cast_31, %reinterpret_cast_33, %reinterpret_cast_35, %reinterpret_cast_37) : (memref<512x64xbf16>, memref<64x512xbf16>, memref<512x64xbf16>, memref<512x64xbf16>)
        %subview_38 = memref.subview %arg0[163840] [32768] [1] : memref<2359296xbf16> to memref<32768xbf16, strided<[1], offset: 163840>>
        %reinterpret_cast_39 = memref.reinterpret_cast %subview_38 to offset: [0], sizes: [512, 64], strides: [64, 1] : memref<32768xbf16, strided<[1], offset: 163840>> to memref<512x64xbf16>
        %subview_40 = memref.subview %arg0[950272] [32768] [1] : memref<2359296xbf16> to memref<32768xbf16, strided<[1], offset: 950272>>
        %reinterpret_cast_41 = memref.reinterpret_cast %subview_40 to offset: [0], sizes: [64, 512], strides: [512, 1] : memref<32768xbf16, strided<[1], offset: 950272>> to memref<64x512xbf16>
        %subview_42 = memref.subview %arg0[1736704] [32768] [1] : memref<2359296xbf16> to memref<32768xbf16, strided<[1], offset: 1736704>>
        %reinterpret_cast_43 = memref.reinterpret_cast %subview_42 to offset: [0], sizes: [512, 64], strides: [64, 1] : memref<32768xbf16, strided<[1], offset: 1736704>> to memref<512x64xbf16>
        %subview_44 = memref.subview %arg1[163840] [32768] [1] : memref<786432xbf16> to memref<32768xbf16, strided<[1], offset: 163840>>
        %reinterpret_cast_45 = memref.reinterpret_cast %subview_44 to offset: [0], sizes: [512, 64], strides: [64, 1] : memref<32768xbf16, strided<[1], offset: 163840>> to memref<512x64xbf16>
        aiex.run @sequence(%reinterpret_cast_39, %reinterpret_cast_41, %reinterpret_cast_43, %reinterpret_cast_45) : (memref<512x64xbf16>, memref<64x512xbf16>, memref<512x64xbf16>, memref<512x64xbf16>)
        %subview_46 = memref.subview %arg0[196608] [32768] [1] : memref<2359296xbf16> to memref<32768xbf16, strided<[1], offset: 196608>>
        %reinterpret_cast_47 = memref.reinterpret_cast %subview_46 to offset: [0], sizes: [512, 64], strides: [64, 1] : memref<32768xbf16, strided<[1], offset: 196608>> to memref<512x64xbf16>
        %subview_48 = memref.subview %arg0[983040] [32768] [1] : memref<2359296xbf16> to memref<32768xbf16, strided<[1], offset: 983040>>
        %reinterpret_cast_49 = memref.reinterpret_cast %subview_48 to offset: [0], sizes: [64, 512], strides: [512, 1] : memref<32768xbf16, strided<[1], offset: 983040>> to memref<64x512xbf16>
        %subview_50 = memref.subview %arg0[1769472] [32768] [1] : memref<2359296xbf16> to memref<32768xbf16, strided<[1], offset: 1769472>>
        %reinterpret_cast_51 = memref.reinterpret_cast %subview_50 to offset: [0], sizes: [512, 64], strides: [64, 1] : memref<32768xbf16, strided<[1], offset: 1769472>> to memref<512x64xbf16>
        %subview_52 = memref.subview %arg1[196608] [32768] [1] : memref<786432xbf16> to memref<32768xbf16, strided<[1], offset: 196608>>
        %reinterpret_cast_53 = memref.reinterpret_cast %subview_52 to offset: [0], sizes: [512, 64], strides: [64, 1] : memref<32768xbf16, strided<[1], offset: 196608>> to memref<512x64xbf16>
        aiex.run @sequence(%reinterpret_cast_47, %reinterpret_cast_49, %reinterpret_cast_51, %reinterpret_cast_53) : (memref<512x64xbf16>, memref<64x512xbf16>, memref<512x64xbf16>, memref<512x64xbf16>)
        %subview_54 = memref.subview %arg0[229376] [32768] [1] : memref<2359296xbf16> to memref<32768xbf16, strided<[1], offset: 229376>>
        %reinterpret_cast_55 = memref.reinterpret_cast %subview_54 to offset: [0], sizes: [512, 64], strides: [64, 1] : memref<32768xbf16, strided<[1], offset: 229376>> to memref<512x64xbf16>
        %subview_56 = memref.subview %arg0[1015808] [32768] [1] : memref<2359296xbf16> to memref<32768xbf16, strided<[1], offset: 1015808>>
        %reinterpret_cast_57 = memref.reinterpret_cast %subview_56 to offset: [0], sizes: [64, 512], strides: [512, 1] : memref<32768xbf16, strided<[1], offset: 1015808>> to memref<64x512xbf16>
        %subview_58 = memref.subview %arg0[1802240] [32768] [1] : memref<2359296xbf16> to memref<32768xbf16, strided<[1], offset: 1802240>>
        %reinterpret_cast_59 = memref.reinterpret_cast %subview_58 to offset: [0], sizes: [512, 64], strides: [64, 1] : memref<32768xbf16, strided<[1], offset: 1802240>> to memref<512x64xbf16>
        %subview_60 = memref.subview %arg1[229376] [32768] [1] : memref<786432xbf16> to memref<32768xbf16, strided<[1], offset: 229376>>
        %reinterpret_cast_61 = memref.reinterpret_cast %subview_60 to offset: [0], sizes: [512, 64], strides: [64, 1] : memref<32768xbf16, strided<[1], offset: 229376>> to memref<512x64xbf16>
        aiex.run @sequence(%reinterpret_cast_55, %reinterpret_cast_57, %reinterpret_cast_59, %reinterpret_cast_61) : (memref<512x64xbf16>, memref<64x512xbf16>, memref<512x64xbf16>, memref<512x64xbf16>)
        %subview_62 = memref.subview %arg0[262144] [32768] [1] : memref<2359296xbf16> to memref<32768xbf16, strided<[1], offset: 262144>>
        %reinterpret_cast_63 = memref.reinterpret_cast %subview_62 to offset: [0], sizes: [512, 64], strides: [64, 1] : memref<32768xbf16, strided<[1], offset: 262144>> to memref<512x64xbf16>
        %subview_64 = memref.subview %arg0[1048576] [32768] [1] : memref<2359296xbf16> to memref<32768xbf16, strided<[1], offset: 1048576>>
        %reinterpret_cast_65 = memref.reinterpret_cast %subview_64 to offset: [0], sizes: [64, 512], strides: [512, 1] : memref<32768xbf16, strided<[1], offset: 1048576>> to memref<64x512xbf16>
        %subview_66 = memref.subview %arg0[1835008] [32768] [1] : memref<2359296xbf16> to memref<32768xbf16, strided<[1], offset: 1835008>>
        %reinterpret_cast_67 = memref.reinterpret_cast %subview_66 to offset: [0], sizes: [512, 64], strides: [64, 1] : memref<32768xbf16, strided<[1], offset: 1835008>> to memref<512x64xbf16>
        %subview_68 = memref.subview %arg1[262144] [32768] [1] : memref<786432xbf16> to memref<32768xbf16, strided<[1], offset: 262144>>
        %reinterpret_cast_69 = memref.reinterpret_cast %subview_68 to offset: [0], sizes: [512, 64], strides: [64, 1] : memref<32768xbf16, strided<[1], offset: 262144>> to memref<512x64xbf16>
        aiex.run @sequence(%reinterpret_cast_63, %reinterpret_cast_65, %reinterpret_cast_67, %reinterpret_cast_69) : (memref<512x64xbf16>, memref<64x512xbf16>, memref<512x64xbf16>, memref<512x64xbf16>)
        %subview_70 = memref.subview %arg0[294912] [32768] [1] : memref<2359296xbf16> to memref<32768xbf16, strided<[1], offset: 294912>>
        %reinterpret_cast_71 = memref.reinterpret_cast %subview_70 to offset: [0], sizes: [512, 64], strides: [64, 1] : memref<32768xbf16, strided<[1], offset: 294912>> to memref<512x64xbf16>
        %subview_72 = memref.subview %arg0[1081344] [32768] [1] : memref<2359296xbf16> to memref<32768xbf16, strided<[1], offset: 1081344>>
        %reinterpret_cast_73 = memref.reinterpret_cast %subview_72 to offset: [0], sizes: [64, 512], strides: [512, 1] : memref<32768xbf16, strided<[1], offset: 1081344>> to memref<64x512xbf16>
        %subview_74 = memref.subview %arg0[1867776] [32768] [1] : memref<2359296xbf16> to memref<32768xbf16, strided<[1], offset: 1867776>>
        %reinterpret_cast_75 = memref.reinterpret_cast %subview_74 to offset: [0], sizes: [512, 64], strides: [64, 1] : memref<32768xbf16, strided<[1], offset: 1867776>> to memref<512x64xbf16>
        %subview_76 = memref.subview %arg1[294912] [32768] [1] : memref<786432xbf16> to memref<32768xbf16, strided<[1], offset: 294912>>
        %reinterpret_cast_77 = memref.reinterpret_cast %subview_76 to offset: [0], sizes: [512, 64], strides: [64, 1] : memref<32768xbf16, strided<[1], offset: 294912>> to memref<512x64xbf16>
        aiex.run @sequence(%reinterpret_cast_71, %reinterpret_cast_73, %reinterpret_cast_75, %reinterpret_cast_77) : (memref<512x64xbf16>, memref<64x512xbf16>, memref<512x64xbf16>, memref<512x64xbf16>)
        %subview_78 = memref.subview %arg0[327680] [32768] [1] : memref<2359296xbf16> to memref<32768xbf16, strided<[1], offset: 327680>>
        %reinterpret_cast_79 = memref.reinterpret_cast %subview_78 to offset: [0], sizes: [512, 64], strides: [64, 1] : memref<32768xbf16, strided<[1], offset: 327680>> to memref<512x64xbf16>
        %subview_80 = memref.subview %arg0[1114112] [32768] [1] : memref<2359296xbf16> to memref<32768xbf16, strided<[1], offset: 1114112>>
        %reinterpret_cast_81 = memref.reinterpret_cast %subview_80 to offset: [0], sizes: [64, 512], strides: [512, 1] : memref<32768xbf16, strided<[1], offset: 1114112>> to memref<64x512xbf16>
        %subview_82 = memref.subview %arg0[1900544] [32768] [1] : memref<2359296xbf16> to memref<32768xbf16, strided<[1], offset: 1900544>>
        %reinterpret_cast_83 = memref.reinterpret_cast %subview_82 to offset: [0], sizes: [512, 64], strides: [64, 1] : memref<32768xbf16, strided<[1], offset: 1900544>> to memref<512x64xbf16>
        %subview_84 = memref.subview %arg1[327680] [32768] [1] : memref<786432xbf16> to memref<32768xbf16, strided<[1], offset: 327680>>
        %reinterpret_cast_85 = memref.reinterpret_cast %subview_84 to offset: [0], sizes: [512, 64], strides: [64, 1] : memref<32768xbf16, strided<[1], offset: 327680>> to memref<512x64xbf16>
        aiex.run @sequence(%reinterpret_cast_79, %reinterpret_cast_81, %reinterpret_cast_83, %reinterpret_cast_85) : (memref<512x64xbf16>, memref<64x512xbf16>, memref<512x64xbf16>, memref<512x64xbf16>)
        %subview_86 = memref.subview %arg0[360448] [32768] [1] : memref<2359296xbf16> to memref<32768xbf16, strided<[1], offset: 360448>>
        %reinterpret_cast_87 = memref.reinterpret_cast %subview_86 to offset: [0], sizes: [512, 64], strides: [64, 1] : memref<32768xbf16, strided<[1], offset: 360448>> to memref<512x64xbf16>
        %subview_88 = memref.subview %arg0[1146880] [32768] [1] : memref<2359296xbf16> to memref<32768xbf16, strided<[1], offset: 1146880>>
        %reinterpret_cast_89 = memref.reinterpret_cast %subview_88 to offset: [0], sizes: [64, 512], strides: [512, 1] : memref<32768xbf16, strided<[1], offset: 1146880>> to memref<64x512xbf16>
        %subview_90 = memref.subview %arg0[1933312] [32768] [1] : memref<2359296xbf16> to memref<32768xbf16, strided<[1], offset: 1933312>>
        %reinterpret_cast_91 = memref.reinterpret_cast %subview_90 to offset: [0], sizes: [512, 64], strides: [64, 1] : memref<32768xbf16, strided<[1], offset: 1933312>> to memref<512x64xbf16>
        %subview_92 = memref.subview %arg1[360448] [32768] [1] : memref<786432xbf16> to memref<32768xbf16, strided<[1], offset: 360448>>
        %reinterpret_cast_93 = memref.reinterpret_cast %subview_92 to offset: [0], sizes: [512, 64], strides: [64, 1] : memref<32768xbf16, strided<[1], offset: 360448>> to memref<512x64xbf16>
        aiex.run @sequence(%reinterpret_cast_87, %reinterpret_cast_89, %reinterpret_cast_91, %reinterpret_cast_93) : (memref<512x64xbf16>, memref<64x512xbf16>, memref<512x64xbf16>, memref<512x64xbf16>)
        %subview_94 = memref.subview %arg0[393216] [32768] [1] : memref<2359296xbf16> to memref<32768xbf16, strided<[1], offset: 393216>>
        %reinterpret_cast_95 = memref.reinterpret_cast %subview_94 to offset: [0], sizes: [512, 64], strides: [64, 1] : memref<32768xbf16, strided<[1], offset: 393216>> to memref<512x64xbf16>
        %subview_96 = memref.subview %arg0[1179648] [32768] [1] : memref<2359296xbf16> to memref<32768xbf16, strided<[1], offset: 1179648>>
        %reinterpret_cast_97 = memref.reinterpret_cast %subview_96 to offset: [0], sizes: [64, 512], strides: [512, 1] : memref<32768xbf16, strided<[1], offset: 1179648>> to memref<64x512xbf16>
        %subview_98 = memref.subview %arg0[1966080] [32768] [1] : memref<2359296xbf16> to memref<32768xbf16, strided<[1], offset: 1966080>>
        %reinterpret_cast_99 = memref.reinterpret_cast %subview_98 to offset: [0], sizes: [512, 64], strides: [64, 1] : memref<32768xbf16, strided<[1], offset: 1966080>> to memref<512x64xbf16>
        %subview_100 = memref.subview %arg1[393216] [32768] [1] : memref<786432xbf16> to memref<32768xbf16, strided<[1], offset: 393216>>
        %reinterpret_cast_101 = memref.reinterpret_cast %subview_100 to offset: [0], sizes: [512, 64], strides: [64, 1] : memref<32768xbf16, strided<[1], offset: 393216>> to memref<512x64xbf16>
        aiex.run @sequence(%reinterpret_cast_95, %reinterpret_cast_97, %reinterpret_cast_99, %reinterpret_cast_101) : (memref<512x64xbf16>, memref<64x512xbf16>, memref<512x64xbf16>, memref<512x64xbf16>)
        %subview_102 = memref.subview %arg0[425984] [32768] [1] : memref<2359296xbf16> to memref<32768xbf16, strided<[1], offset: 425984>>
        %reinterpret_cast_103 = memref.reinterpret_cast %subview_102 to offset: [0], sizes: [512, 64], strides: [64, 1] : memref<32768xbf16, strided<[1], offset: 425984>> to memref<512x64xbf16>
        %subview_104 = memref.subview %arg0[1212416] [32768] [1] : memref<2359296xbf16> to memref<32768xbf16, strided<[1], offset: 1212416>>
        %reinterpret_cast_105 = memref.reinterpret_cast %subview_104 to offset: [0], sizes: [64, 512], strides: [512, 1] : memref<32768xbf16, strided<[1], offset: 1212416>> to memref<64x512xbf16>
        %subview_106 = memref.subview %arg0[1998848] [32768] [1] : memref<2359296xbf16> to memref<32768xbf16, strided<[1], offset: 1998848>>
        %reinterpret_cast_107 = memref.reinterpret_cast %subview_106 to offset: [0], sizes: [512, 64], strides: [64, 1] : memref<32768xbf16, strided<[1], offset: 1998848>> to memref<512x64xbf16>
        %subview_108 = memref.subview %arg1[425984] [32768] [1] : memref<786432xbf16> to memref<32768xbf16, strided<[1], offset: 425984>>
        %reinterpret_cast_109 = memref.reinterpret_cast %subview_108 to offset: [0], sizes: [512, 64], strides: [64, 1] : memref<32768xbf16, strided<[1], offset: 425984>> to memref<512x64xbf16>
        aiex.run @sequence(%reinterpret_cast_103, %reinterpret_cast_105, %reinterpret_cast_107, %reinterpret_cast_109) : (memref<512x64xbf16>, memref<64x512xbf16>, memref<512x64xbf16>, memref<512x64xbf16>)
        %subview_110 = memref.subview %arg0[458752] [32768] [1] : memref<2359296xbf16> to memref<32768xbf16, strided<[1], offset: 458752>>
        %reinterpret_cast_111 = memref.reinterpret_cast %subview_110 to offset: [0], sizes: [512, 64], strides: [64, 1] : memref<32768xbf16, strided<[1], offset: 458752>> to memref<512x64xbf16>
        %subview_112 = memref.subview %arg0[1245184] [32768] [1] : memref<2359296xbf16> to memref<32768xbf16, strided<[1], offset: 1245184>>
        %reinterpret_cast_113 = memref.reinterpret_cast %subview_112 to offset: [0], sizes: [64, 512], strides: [512, 1] : memref<32768xbf16, strided<[1], offset: 1245184>> to memref<64x512xbf16>
        %subview_114 = memref.subview %arg0[2031616] [32768] [1] : memref<2359296xbf16> to memref<32768xbf16, strided<[1], offset: 2031616>>
        %reinterpret_cast_115 = memref.reinterpret_cast %subview_114 to offset: [0], sizes: [512, 64], strides: [64, 1] : memref<32768xbf16, strided<[1], offset: 2031616>> to memref<512x64xbf16>
        %subview_116 = memref.subview %arg1[458752] [32768] [1] : memref<786432xbf16> to memref<32768xbf16, strided<[1], offset: 458752>>
        %reinterpret_cast_117 = memref.reinterpret_cast %subview_116 to offset: [0], sizes: [512, 64], strides: [64, 1] : memref<32768xbf16, strided<[1], offset: 458752>> to memref<512x64xbf16>
        aiex.run @sequence(%reinterpret_cast_111, %reinterpret_cast_113, %reinterpret_cast_115, %reinterpret_cast_117) : (memref<512x64xbf16>, memref<64x512xbf16>, memref<512x64xbf16>, memref<512x64xbf16>)
        %subview_118 = memref.subview %arg0[491520] [32768] [1] : memref<2359296xbf16> to memref<32768xbf16, strided<[1], offset: 491520>>
        %reinterpret_cast_119 = memref.reinterpret_cast %subview_118 to offset: [0], sizes: [512, 64], strides: [64, 1] : memref<32768xbf16, strided<[1], offset: 491520>> to memref<512x64xbf16>
        %subview_120 = memref.subview %arg0[1277952] [32768] [1] : memref<2359296xbf16> to memref<32768xbf16, strided<[1], offset: 1277952>>
        %reinterpret_cast_121 = memref.reinterpret_cast %subview_120 to offset: [0], sizes: [64, 512], strides: [512, 1] : memref<32768xbf16, strided<[1], offset: 1277952>> to memref<64x512xbf16>
        %subview_122 = memref.subview %arg0[2064384] [32768] [1] : memref<2359296xbf16> to memref<32768xbf16, strided<[1], offset: 2064384>>
        %reinterpret_cast_123 = memref.reinterpret_cast %subview_122 to offset: [0], sizes: [512, 64], strides: [64, 1] : memref<32768xbf16, strided<[1], offset: 2064384>> to memref<512x64xbf16>
        %subview_124 = memref.subview %arg1[491520] [32768] [1] : memref<786432xbf16> to memref<32768xbf16, strided<[1], offset: 491520>>
        %reinterpret_cast_125 = memref.reinterpret_cast %subview_124 to offset: [0], sizes: [512, 64], strides: [64, 1] : memref<32768xbf16, strided<[1], offset: 491520>> to memref<512x64xbf16>
        aiex.run @sequence(%reinterpret_cast_119, %reinterpret_cast_121, %reinterpret_cast_123, %reinterpret_cast_125) : (memref<512x64xbf16>, memref<64x512xbf16>, memref<512x64xbf16>, memref<512x64xbf16>)
        %subview_126 = memref.subview %arg0[524288] [32768] [1] : memref<2359296xbf16> to memref<32768xbf16, strided<[1], offset: 524288>>
        %reinterpret_cast_127 = memref.reinterpret_cast %subview_126 to offset: [0], sizes: [512, 64], strides: [64, 1] : memref<32768xbf16, strided<[1], offset: 524288>> to memref<512x64xbf16>
        %subview_128 = memref.subview %arg0[1310720] [32768] [1] : memref<2359296xbf16> to memref<32768xbf16, strided<[1], offset: 1310720>>
        %reinterpret_cast_129 = memref.reinterpret_cast %subview_128 to offset: [0], sizes: [64, 512], strides: [512, 1] : memref<32768xbf16, strided<[1], offset: 1310720>> to memref<64x512xbf16>
        %subview_130 = memref.subview %arg0[2097152] [32768] [1] : memref<2359296xbf16> to memref<32768xbf16, strided<[1], offset: 2097152>>
        %reinterpret_cast_131 = memref.reinterpret_cast %subview_130 to offset: [0], sizes: [512, 64], strides: [64, 1] : memref<32768xbf16, strided<[1], offset: 2097152>> to memref<512x64xbf16>
        %subview_132 = memref.subview %arg1[524288] [32768] [1] : memref<786432xbf16> to memref<32768xbf16, strided<[1], offset: 524288>>
        %reinterpret_cast_133 = memref.reinterpret_cast %subview_132 to offset: [0], sizes: [512, 64], strides: [64, 1] : memref<32768xbf16, strided<[1], offset: 524288>> to memref<512x64xbf16>
        aiex.run @sequence(%reinterpret_cast_127, %reinterpret_cast_129, %reinterpret_cast_131, %reinterpret_cast_133) : (memref<512x64xbf16>, memref<64x512xbf16>, memref<512x64xbf16>, memref<512x64xbf16>)
        %subview_134 = memref.subview %arg0[557056] [32768] [1] : memref<2359296xbf16> to memref<32768xbf16, strided<[1], offset: 557056>>
        %reinterpret_cast_135 = memref.reinterpret_cast %subview_134 to offset: [0], sizes: [512, 64], strides: [64, 1] : memref<32768xbf16, strided<[1], offset: 557056>> to memref<512x64xbf16>
        %subview_136 = memref.subview %arg0[1343488] [32768] [1] : memref<2359296xbf16> to memref<32768xbf16, strided<[1], offset: 1343488>>
        %reinterpret_cast_137 = memref.reinterpret_cast %subview_136 to offset: [0], sizes: [64, 512], strides: [512, 1] : memref<32768xbf16, strided<[1], offset: 1343488>> to memref<64x512xbf16>
        %subview_138 = memref.subview %arg0[2129920] [32768] [1] : memref<2359296xbf16> to memref<32768xbf16, strided<[1], offset: 2129920>>
        %reinterpret_cast_139 = memref.reinterpret_cast %subview_138 to offset: [0], sizes: [512, 64], strides: [64, 1] : memref<32768xbf16, strided<[1], offset: 2129920>> to memref<512x64xbf16>
        %subview_140 = memref.subview %arg1[557056] [32768] [1] : memref<786432xbf16> to memref<32768xbf16, strided<[1], offset: 557056>>
        %reinterpret_cast_141 = memref.reinterpret_cast %subview_140 to offset: [0], sizes: [512, 64], strides: [64, 1] : memref<32768xbf16, strided<[1], offset: 557056>> to memref<512x64xbf16>
        aiex.run @sequence(%reinterpret_cast_135, %reinterpret_cast_137, %reinterpret_cast_139, %reinterpret_cast_141) : (memref<512x64xbf16>, memref<64x512xbf16>, memref<512x64xbf16>, memref<512x64xbf16>)
        %subview_142 = memref.subview %arg0[589824] [32768] [1] : memref<2359296xbf16> to memref<32768xbf16, strided<[1], offset: 589824>>
        %reinterpret_cast_143 = memref.reinterpret_cast %subview_142 to offset: [0], sizes: [512, 64], strides: [64, 1] : memref<32768xbf16, strided<[1], offset: 589824>> to memref<512x64xbf16>
        %subview_144 = memref.subview %arg0[1376256] [32768] [1] : memref<2359296xbf16> to memref<32768xbf16, strided<[1], offset: 1376256>>
        %reinterpret_cast_145 = memref.reinterpret_cast %subview_144 to offset: [0], sizes: [64, 512], strides: [512, 1] : memref<32768xbf16, strided<[1], offset: 1376256>> to memref<64x512xbf16>
        %subview_146 = memref.subview %arg0[2162688] [32768] [1] : memref<2359296xbf16> to memref<32768xbf16, strided<[1], offset: 2162688>>
        %reinterpret_cast_147 = memref.reinterpret_cast %subview_146 to offset: [0], sizes: [512, 64], strides: [64, 1] : memref<32768xbf16, strided<[1], offset: 2162688>> to memref<512x64xbf16>
        %subview_148 = memref.subview %arg1[589824] [32768] [1] : memref<786432xbf16> to memref<32768xbf16, strided<[1], offset: 589824>>
        %reinterpret_cast_149 = memref.reinterpret_cast %subview_148 to offset: [0], sizes: [512, 64], strides: [64, 1] : memref<32768xbf16, strided<[1], offset: 589824>> to memref<512x64xbf16>
        aiex.run @sequence(%reinterpret_cast_143, %reinterpret_cast_145, %reinterpret_cast_147, %reinterpret_cast_149) : (memref<512x64xbf16>, memref<64x512xbf16>, memref<512x64xbf16>, memref<512x64xbf16>)
        %subview_150 = memref.subview %arg0[622592] [32768] [1] : memref<2359296xbf16> to memref<32768xbf16, strided<[1], offset: 622592>>
        %reinterpret_cast_151 = memref.reinterpret_cast %subview_150 to offset: [0], sizes: [512, 64], strides: [64, 1] : memref<32768xbf16, strided<[1], offset: 622592>> to memref<512x64xbf16>
        %subview_152 = memref.subview %arg0[1409024] [32768] [1] : memref<2359296xbf16> to memref<32768xbf16, strided<[1], offset: 1409024>>
        %reinterpret_cast_153 = memref.reinterpret_cast %subview_152 to offset: [0], sizes: [64, 512], strides: [512, 1] : memref<32768xbf16, strided<[1], offset: 1409024>> to memref<64x512xbf16>
        %subview_154 = memref.subview %arg0[2195456] [32768] [1] : memref<2359296xbf16> to memref<32768xbf16, strided<[1], offset: 2195456>>
        %reinterpret_cast_155 = memref.reinterpret_cast %subview_154 to offset: [0], sizes: [512, 64], strides: [64, 1] : memref<32768xbf16, strided<[1], offset: 2195456>> to memref<512x64xbf16>
        %subview_156 = memref.subview %arg1[622592] [32768] [1] : memref<786432xbf16> to memref<32768xbf16, strided<[1], offset: 622592>>
        %reinterpret_cast_157 = memref.reinterpret_cast %subview_156 to offset: [0], sizes: [512, 64], strides: [64, 1] : memref<32768xbf16, strided<[1], offset: 622592>> to memref<512x64xbf16>
        aiex.run @sequence(%reinterpret_cast_151, %reinterpret_cast_153, %reinterpret_cast_155, %reinterpret_cast_157) : (memref<512x64xbf16>, memref<64x512xbf16>, memref<512x64xbf16>, memref<512x64xbf16>)
        %subview_158 = memref.subview %arg0[655360] [32768] [1] : memref<2359296xbf16> to memref<32768xbf16, strided<[1], offset: 655360>>
        %reinterpret_cast_159 = memref.reinterpret_cast %subview_158 to offset: [0], sizes: [512, 64], strides: [64, 1] : memref<32768xbf16, strided<[1], offset: 655360>> to memref<512x64xbf16>
        %subview_160 = memref.subview %arg0[1441792] [32768] [1] : memref<2359296xbf16> to memref<32768xbf16, strided<[1], offset: 1441792>>
        %reinterpret_cast_161 = memref.reinterpret_cast %subview_160 to offset: [0], sizes: [64, 512], strides: [512, 1] : memref<32768xbf16, strided<[1], offset: 1441792>> to memref<64x512xbf16>
        %subview_162 = memref.subview %arg0[2228224] [32768] [1] : memref<2359296xbf16> to memref<32768xbf16, strided<[1], offset: 2228224>>
        %reinterpret_cast_163 = memref.reinterpret_cast %subview_162 to offset: [0], sizes: [512, 64], strides: [64, 1] : memref<32768xbf16, strided<[1], offset: 2228224>> to memref<512x64xbf16>
        %subview_164 = memref.subview %arg1[655360] [32768] [1] : memref<786432xbf16> to memref<32768xbf16, strided<[1], offset: 655360>>
        %reinterpret_cast_165 = memref.reinterpret_cast %subview_164 to offset: [0], sizes: [512, 64], strides: [64, 1] : memref<32768xbf16, strided<[1], offset: 655360>> to memref<512x64xbf16>
        aiex.run @sequence(%reinterpret_cast_159, %reinterpret_cast_161, %reinterpret_cast_163, %reinterpret_cast_165) : (memref<512x64xbf16>, memref<64x512xbf16>, memref<512x64xbf16>, memref<512x64xbf16>)
        %subview_166 = memref.subview %arg0[688128] [32768] [1] : memref<2359296xbf16> to memref<32768xbf16, strided<[1], offset: 688128>>
        %reinterpret_cast_167 = memref.reinterpret_cast %subview_166 to offset: [0], sizes: [512, 64], strides: [64, 1] : memref<32768xbf16, strided<[1], offset: 688128>> to memref<512x64xbf16>
        %subview_168 = memref.subview %arg0[1474560] [32768] [1] : memref<2359296xbf16> to memref<32768xbf16, strided<[1], offset: 1474560>>
        %reinterpret_cast_169 = memref.reinterpret_cast %subview_168 to offset: [0], sizes: [64, 512], strides: [512, 1] : memref<32768xbf16, strided<[1], offset: 1474560>> to memref<64x512xbf16>
        %subview_170 = memref.subview %arg0[2260992] [32768] [1] : memref<2359296xbf16> to memref<32768xbf16, strided<[1], offset: 2260992>>
        %reinterpret_cast_171 = memref.reinterpret_cast %subview_170 to offset: [0], sizes: [512, 64], strides: [64, 1] : memref<32768xbf16, strided<[1], offset: 2260992>> to memref<512x64xbf16>
        %subview_172 = memref.subview %arg1[688128] [32768] [1] : memref<786432xbf16> to memref<32768xbf16, strided<[1], offset: 688128>>
        %reinterpret_cast_173 = memref.reinterpret_cast %subview_172 to offset: [0], sizes: [512, 64], strides: [64, 1] : memref<32768xbf16, strided<[1], offset: 688128>> to memref<512x64xbf16>
        aiex.run @sequence(%reinterpret_cast_167, %reinterpret_cast_169, %reinterpret_cast_171, %reinterpret_cast_173) : (memref<512x64xbf16>, memref<64x512xbf16>, memref<512x64xbf16>, memref<512x64xbf16>)
        %subview_174 = memref.subview %arg0[720896] [32768] [1] : memref<2359296xbf16> to memref<32768xbf16, strided<[1], offset: 720896>>
        %reinterpret_cast_175 = memref.reinterpret_cast %subview_174 to offset: [0], sizes: [512, 64], strides: [64, 1] : memref<32768xbf16, strided<[1], offset: 720896>> to memref<512x64xbf16>
        %subview_176 = memref.subview %arg0[1507328] [32768] [1] : memref<2359296xbf16> to memref<32768xbf16, strided<[1], offset: 1507328>>
        %reinterpret_cast_177 = memref.reinterpret_cast %subview_176 to offset: [0], sizes: [64, 512], strides: [512, 1] : memref<32768xbf16, strided<[1], offset: 1507328>> to memref<64x512xbf16>
        %subview_178 = memref.subview %arg0[2293760] [32768] [1] : memref<2359296xbf16> to memref<32768xbf16, strided<[1], offset: 2293760>>
        %reinterpret_cast_179 = memref.reinterpret_cast %subview_178 to offset: [0], sizes: [512, 64], strides: [64, 1] : memref<32768xbf16, strided<[1], offset: 2293760>> to memref<512x64xbf16>
        %subview_180 = memref.subview %arg1[720896] [32768] [1] : memref<786432xbf16> to memref<32768xbf16, strided<[1], offset: 720896>>
        %reinterpret_cast_181 = memref.reinterpret_cast %subview_180 to offset: [0], sizes: [512, 64], strides: [64, 1] : memref<32768xbf16, strided<[1], offset: 720896>> to memref<512x64xbf16>
        aiex.run @sequence(%reinterpret_cast_175, %reinterpret_cast_177, %reinterpret_cast_179, %reinterpret_cast_181) : (memref<512x64xbf16>, memref<64x512xbf16>, memref<512x64xbf16>, memref<512x64xbf16>)
        %subview_182 = memref.subview %arg0[753664] [32768] [1] : memref<2359296xbf16> to memref<32768xbf16, strided<[1], offset: 753664>>
        %reinterpret_cast_183 = memref.reinterpret_cast %subview_182 to offset: [0], sizes: [512, 64], strides: [64, 1] : memref<32768xbf16, strided<[1], offset: 753664>> to memref<512x64xbf16>
        %subview_184 = memref.subview %arg0[1540096] [32768] [1] : memref<2359296xbf16> to memref<32768xbf16, strided<[1], offset: 1540096>>
        %reinterpret_cast_185 = memref.reinterpret_cast %subview_184 to offset: [0], sizes: [64, 512], strides: [512, 1] : memref<32768xbf16, strided<[1], offset: 1540096>> to memref<64x512xbf16>
        %subview_186 = memref.subview %arg0[2326528] [32768] [1] : memref<2359296xbf16> to memref<32768xbf16, strided<[1], offset: 2326528>>
        %reinterpret_cast_187 = memref.reinterpret_cast %subview_186 to offset: [0], sizes: [512, 64], strides: [64, 1] : memref<32768xbf16, strided<[1], offset: 2326528>> to memref<512x64xbf16>
        %subview_188 = memref.subview %arg1[753664] [32768] [1] : memref<786432xbf16> to memref<32768xbf16, strided<[1], offset: 753664>>
        %reinterpret_cast_189 = memref.reinterpret_cast %subview_188 to offset: [0], sizes: [512, 64], strides: [64, 1] : memref<32768xbf16, strided<[1], offset: 753664>> to memref<512x64xbf16>
        aiex.run @sequence(%reinterpret_cast_183, %reinterpret_cast_185, %reinterpret_cast_187, %reinterpret_cast_189) : (memref<512x64xbf16>, memref<64x512xbf16>, memref<512x64xbf16>, memref<512x64xbf16>)
      }
      aiex.configure @reset_device {
      }
    }
  }
}
