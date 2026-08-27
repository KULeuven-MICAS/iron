module {
  aie.device(npu2) @op0__MHAStreamGroup {
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
    %tile_0_5 = aie.tile(0, 5)
    %tile_1_5 = aie.tile(1, 5)
    %tile_2_5 = aie.tile(2, 5)
    %tile_3_5 = aie.tile(3, 5)
    %tile_4_5 = aie.tile(4, 5)
    %tile_5_5 = aie.tile(5, 5)
    %tile_6_5 = aie.tile(6, 5)
    %tile_7_5 = aie.tile(7, 5)
    aie.runtime_sequence(%arg0: memref<1024x64xbf16>, %arg1: memref<64x1024xbf16>, %arg2: memref<1024x64xbf16>, %arg3: memref<1024x64xbf16>) {
      %0 = aiex.dma_configure_task_for @of_0_mem_0 {
        aie.dma_bd(%arg0 : memref<1024x64xbf16> offset = 0 len = 8192 sizes = [1, 2, 64, 64] strides = [0, 32768, 64, 1])
        aie.end
      } {issue_token = true, iteration_t = 0 : index}
      aiex.dma_start_task(%0)
      %1 = aiex.dma_configure_task_for @of_0_mem_1 {
        aie.dma_bd(%arg0 : memref<1024x64xbf16> offset = 4096 len = 8192 sizes = [1, 2, 64, 64] strides = [0, 32768, 64, 1])
        aie.end
      } {issue_token = true, iteration_t = 0 : index}
      aiex.dma_start_task(%1)
      %2 = aiex.dma_configure_task_for @of_0_mem_2 {
        aie.dma_bd(%arg0 : memref<1024x64xbf16> offset = 8192 len = 8192 sizes = [1, 2, 64, 64] strides = [0, 32768, 64, 1])
        aie.end
      } {issue_token = true, iteration_t = 0 : index}
      aiex.dma_start_task(%2)
      %3 = aiex.dma_configure_task_for @of_0_mem_3 {
        aie.dma_bd(%arg0 : memref<1024x64xbf16> offset = 12288 len = 8192 sizes = [1, 2, 64, 64] strides = [0, 32768, 64, 1])
        aie.end
      } {issue_token = true, iteration_t = 0 : index}
      aiex.dma_start_task(%3)
      %4 = aiex.dma_configure_task_for @of_0_mem_4 {
        aie.dma_bd(%arg0 : memref<1024x64xbf16> offset = 16384 len = 8192 sizes = [1, 2, 64, 64] strides = [0, 32768, 64, 1])
        aie.end
      } {issue_token = true, iteration_t = 0 : index}
      aiex.dma_start_task(%4)
      %5 = aiex.dma_configure_task_for @of_0_mem_5 {
        aie.dma_bd(%arg0 : memref<1024x64xbf16> offset = 20480 len = 8192 sizes = [1, 2, 64, 64] strides = [0, 32768, 64, 1])
        aie.end
      } {issue_token = true, iteration_t = 0 : index}
      aiex.dma_start_task(%5)
      %6 = aiex.dma_configure_task_for @of_0_mem_6 {
        aie.dma_bd(%arg0 : memref<1024x64xbf16> offset = 24576 len = 8192 sizes = [1, 2, 64, 64] strides = [0, 32768, 64, 1])
        aie.end
      } {issue_token = true, iteration_t = 0 : index}
      aiex.dma_start_task(%6)
      %7 = aiex.dma_configure_task_for @of_0_mem_7 {
        aie.dma_bd(%arg0 : memref<1024x64xbf16> offset = 28672 len = 8192 sizes = [1, 2, 64, 64] strides = [0, 32768, 64, 1])
        aie.end
      } {issue_token = true, iteration_t = 0 : index}
      aiex.dma_start_task(%7)
      %8 = aiex.dma_configure_task_for @of_1_mem {
        aie.dma_bd(%arg1 : memref<64x1024xbf16> offset = 0 len = 65536 sizes = [1, 16, 64, 64] strides = [0, 64, 1024, 1])
        aie.end
      } {issue_token = true, iteration_t = 0 : index}
      aiex.dma_start_task(%8)
      %9 = aiex.dma_configure_task_for @of_2_mem {
        aie.dma_bd(%arg2 : memref<1024x64xbf16> offset = 0 len = 65536 sizes = [1, 1, 256, 256] strides = [0, 0, 256, 1])
        aie.end
      } {issue_token = true, iteration_t = 0 : index}
      aiex.dma_start_task(%9)
      %10 = aiex.dma_configure_task_for @of_10_mem_0 {
        aie.dma_bd(%arg3 : memref<1024x64xbf16> offset = 0 len = 8192 sizes = [1, 2, 64, 64] strides = [0, 32768, 64, 1])
        aie.end
      } {issue_token = true, iteration_t = 0 : index}
      aiex.dma_start_task(%10)
      %11 = aiex.dma_configure_task_for @of_10_mem_1 {
        aie.dma_bd(%arg3 : memref<1024x64xbf16> offset = 4096 len = 8192 sizes = [1, 2, 64, 64] strides = [0, 32768, 64, 1])
        aie.end
      } {issue_token = true, iteration_t = 0 : index}
      aiex.dma_start_task(%11)
      %12 = aiex.dma_configure_task_for @of_10_mem_2 {
        aie.dma_bd(%arg3 : memref<1024x64xbf16> offset = 8192 len = 8192 sizes = [1, 2, 64, 64] strides = [0, 32768, 64, 1])
        aie.end
      } {issue_token = true, iteration_t = 0 : index}
      aiex.dma_start_task(%12)
      %13 = aiex.dma_configure_task_for @of_10_mem_3 {
        aie.dma_bd(%arg3 : memref<1024x64xbf16> offset = 12288 len = 8192 sizes = [1, 2, 64, 64] strides = [0, 32768, 64, 1])
        aie.end
      } {issue_token = true, iteration_t = 0 : index}
      aiex.dma_start_task(%13)
      %14 = aiex.dma_configure_task_for @of_10_mem_4 {
        aie.dma_bd(%arg3 : memref<1024x64xbf16> offset = 16384 len = 8192 sizes = [1, 2, 64, 64] strides = [0, 32768, 64, 1])
        aie.end
      } {issue_token = true, iteration_t = 0 : index}
      aiex.dma_start_task(%14)
      %15 = aiex.dma_configure_task_for @of_10_mem_5 {
        aie.dma_bd(%arg3 : memref<1024x64xbf16> offset = 20480 len = 8192 sizes = [1, 2, 64, 64] strides = [0, 32768, 64, 1])
        aie.end
      } {issue_token = true, iteration_t = 0 : index}
      aiex.dma_start_task(%15)
      %16 = aiex.dma_configure_task_for @of_10_mem_6 {
        aie.dma_bd(%arg3 : memref<1024x64xbf16> offset = 24576 len = 8192 sizes = [1, 2, 64, 64] strides = [0, 32768, 64, 1])
        aie.end
      } {issue_token = true, iteration_t = 0 : index}
      aiex.dma_start_task(%16)
      %17 = aiex.dma_configure_task_for @of_10_mem_7 {
        aie.dma_bd(%arg3 : memref<1024x64xbf16> offset = 28672 len = 8192 sizes = [1, 2, 64, 64] strides = [0, 32768, 64, 1])
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
        %c16 = arith.constant 16 : index
        scf.for %arg1 = %c0_0 to %c16 step %c1_1 {
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
            %c8_i32 = arith.constant 8 : i32
            %18 = arith.muli %17, %c8_i32 : i32
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
        %c16 = arith.constant 16 : index
        scf.for %arg1 = %c0_0 to %c16 step %c1_1 {
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
            %c8_i32 = arith.constant 8 : i32
            %18 = arith.muli %17, %c8_i32 : i32
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
        %c16 = arith.constant 16 : index
        scf.for %arg1 = %c0_0 to %c16 step %c1_1 {
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
            %c8_i32 = arith.constant 8 : i32
            %18 = arith.muli %17, %c8_i32 : i32
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
        %c16 = arith.constant 16 : index
        scf.for %arg1 = %c0_0 to %c16 step %c1_1 {
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
            %c8_i32 = arith.constant 8 : i32
            %18 = arith.muli %17, %c8_i32 : i32
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
    %core_4_2 = aie.core(%tile_4_2) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %0 = aie.objectfifo.acquire @of_3_unicast_4_0(Consume, 2) : !aie.objectfifosubview<memref<64x64xbf16>>
        %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
        %2 = aie.objectfifo.subview.access %0[1] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c16 = arith.constant 16 : index
        scf.for %arg1 = %c0_0 to %c16 step %c1_1 {
          %3 = aie.objectfifo.acquire @of_4_broadcast_0_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
          %4 = aie.objectfifo.subview.access %3[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
          %c2 = arith.constant 2 : index
          %5 = aie.objectfifo.acquire @of_6_unicast_4(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
          %6 = aie.objectfifo.acquire @of_6_unicast_4_relay_1(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
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
            %c8_i32 = arith.constant 8 : i32
            %18 = arith.muli %17, %c8_i32 : i32
            %c4_i32 = arith.constant 4 : i32
            %19 = arith.addi %c4_i32, %18 : i32
            %20 = arith.cmpi sle, %16, %19 : i32
            scf.if %20 {
              func.call @op0_matmul_bf16_bf16_64_64_64(%13, %4, %9) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>) -> ()
            }
          }
          aie.objectfifo.release @of_6_unicast_4(Produce, 1)
          aie.objectfifo.release @of_6_unicast_4_relay_1(Produce, 1)
          aie.objectfifo.release @of_4_broadcast_0_0(Consume, 1)
        }
        aie.objectfifo.release @of_3_unicast_4_0(Consume, 2)
      }
      aie.end
    } {link_with = "op0_mm_64_64_64.o"}
    %core_5_2 = aie.core(%tile_5_2) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %0 = aie.objectfifo.acquire @of_3_unicast_5_0(Consume, 2) : !aie.objectfifosubview<memref<64x64xbf16>>
        %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
        %2 = aie.objectfifo.subview.access %0[1] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c16 = arith.constant 16 : index
        scf.for %arg1 = %c0_0 to %c16 step %c1_1 {
          %3 = aie.objectfifo.acquire @of_4_broadcast_0_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
          %4 = aie.objectfifo.subview.access %3[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
          %c2 = arith.constant 2 : index
          %5 = aie.objectfifo.acquire @of_6_unicast_5(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
          %6 = aie.objectfifo.acquire @of_6_unicast_5_relay_1(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
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
            %c8_i32 = arith.constant 8 : i32
            %18 = arith.muli %17, %c8_i32 : i32
            %c5_i32 = arith.constant 5 : i32
            %19 = arith.addi %c5_i32, %18 : i32
            %20 = arith.cmpi sle, %16, %19 : i32
            scf.if %20 {
              func.call @op0_matmul_bf16_bf16_64_64_64(%13, %4, %9) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>) -> ()
            }
          }
          aie.objectfifo.release @of_6_unicast_5(Produce, 1)
          aie.objectfifo.release @of_6_unicast_5_relay_1(Produce, 1)
          aie.objectfifo.release @of_4_broadcast_0_0(Consume, 1)
        }
        aie.objectfifo.release @of_3_unicast_5_0(Consume, 2)
      }
      aie.end
    } {link_with = "op0_mm_64_64_64.o"}
    %core_6_2 = aie.core(%tile_6_2) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %0 = aie.objectfifo.acquire @of_3_unicast_6_0(Consume, 2) : !aie.objectfifosubview<memref<64x64xbf16>>
        %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
        %2 = aie.objectfifo.subview.access %0[1] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c16 = arith.constant 16 : index
        scf.for %arg1 = %c0_0 to %c16 step %c1_1 {
          %3 = aie.objectfifo.acquire @of_4_broadcast_0_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
          %4 = aie.objectfifo.subview.access %3[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
          %c2 = arith.constant 2 : index
          %5 = aie.objectfifo.acquire @of_6_unicast_6(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
          %6 = aie.objectfifo.acquire @of_6_unicast_6_relay_1(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
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
            %c8_i32 = arith.constant 8 : i32
            %18 = arith.muli %17, %c8_i32 : i32
            %c6_i32 = arith.constant 6 : i32
            %19 = arith.addi %c6_i32, %18 : i32
            %20 = arith.cmpi sle, %16, %19 : i32
            scf.if %20 {
              func.call @op0_matmul_bf16_bf16_64_64_64(%13, %4, %9) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>) -> ()
            }
          }
          aie.objectfifo.release @of_6_unicast_6(Produce, 1)
          aie.objectfifo.release @of_6_unicast_6_relay_1(Produce, 1)
          aie.objectfifo.release @of_4_broadcast_0_0(Consume, 1)
        }
        aie.objectfifo.release @of_3_unicast_6_0(Consume, 2)
      }
      aie.end
    } {link_with = "op0_mm_64_64_64.o"}
    %core_7_2 = aie.core(%tile_7_2) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %0 = aie.objectfifo.acquire @of_3_unicast_7_0(Consume, 2) : !aie.objectfifosubview<memref<64x64xbf16>>
        %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
        %2 = aie.objectfifo.subview.access %0[1] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c16 = arith.constant 16 : index
        scf.for %arg1 = %c0_0 to %c16 step %c1_1 {
          %3 = aie.objectfifo.acquire @of_4_broadcast_0_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
          %4 = aie.objectfifo.subview.access %3[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
          %c2 = arith.constant 2 : index
          %5 = aie.objectfifo.acquire @of_6_unicast_7(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
          %6 = aie.objectfifo.acquire @of_6_unicast_7_relay_1(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
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
            %c8_i32 = arith.constant 8 : i32
            %18 = arith.muli %17, %c8_i32 : i32
            %c7_i32 = arith.constant 7 : i32
            %19 = arith.addi %c7_i32, %18 : i32
            %20 = arith.cmpi sle, %16, %19 : i32
            scf.if %20 {
              func.call @op0_matmul_bf16_bf16_64_64_64(%13, %4, %9) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>) -> ()
            }
          }
          aie.objectfifo.release @of_6_unicast_7(Produce, 1)
          aie.objectfifo.release @of_6_unicast_7_relay_1(Produce, 1)
          aie.objectfifo.release @of_4_broadcast_0_0(Consume, 1)
        }
        aie.objectfifo.release @of_3_unicast_7_0(Consume, 2)
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
        %c16 = arith.constant 16 : index
        scf.for %arg1 = %c0_0 to %c16 step %c1_1 {
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
            %c8_i32 = arith.constant 8 : i32
            %18 = arith.muli %17, %c8_i32 : i32
            %c0_i32_4 = arith.constant 0 : i32
            %19 = arith.addi %c0_i32_4, %18 : i32
            %c0_5 = arith.constant 0 : index
            %c1_6 = arith.constant 1 : index
            memref.store %16, %flash_index_0_4[%c0_5] : memref<2xi32>
            memref.store %19, %flash_index_0_4[%c1_6] : memref<2xi32>
            scf.index_switch %arg2 
            case 0 {
              %20 = aie.objectfifo.acquire @flash_scale_0_3(Consume, 1) : !aie.objectfifosubview<memref<256xbf16>>
              %21 = aie.objectfifo.subview.access %20[0] : !aie.objectfifosubview<memref<256xbf16>> -> memref<256xbf16>
              %c64_i32 = arith.constant 64 : i32
              %c0_i32_7 = arith.constant 0 : i32
              %22 = arith.cmpi ne, %16, %c0_i32_7 : i32
              %23 = arith.extui %22 : i1 to i32
              func.call @op0_matmul_PV(%13, %4, %12, %21, %c64_i32, %23, %flash_index_0_4) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>, memref<256xbf16>, i32, i32, memref<2xi32>) -> ()
              %c15_i32 = arith.constant 15 : i32
              %24 = arith.cmpi eq, %16, %c15_i32 : i32
              scf.if %24 {
                func.call @op0_rescale_O(%12, %21, %c64_i32, %flash_index_0_4) : (memref<64x64xbf16>, memref<256xbf16>, i32, memref<2xi32>) -> ()
              }
              aie.objectfifo.release @flash_scale_0_3(Consume, 1)
              scf.yield
            }
            case 1 {
              %20 = aie.objectfifo.acquire @flash_scale_0_5(Consume, 1) : !aie.objectfifosubview<memref<256xbf16>>
              %21 = aie.objectfifo.subview.access %20[0] : !aie.objectfifosubview<memref<256xbf16>> -> memref<256xbf16>
              %c64_i32 = arith.constant 64 : i32
              %c0_i32_7 = arith.constant 0 : i32
              %22 = arith.cmpi ne, %16, %c0_i32_7 : i32
              %23 = arith.extui %22 : i1 to i32
              func.call @op0_matmul_PV(%13, %4, %12, %21, %c64_i32, %23, %flash_index_0_4) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>, memref<256xbf16>, i32, i32, memref<2xi32>) -> ()
              %c15_i32 = arith.constant 15 : i32
              %24 = arith.cmpi eq, %16, %c15_i32 : i32
              scf.if %24 {
                func.call @op0_rescale_O(%12, %21, %c64_i32, %flash_index_0_4) : (memref<64x64xbf16>, memref<256xbf16>, i32, memref<2xi32>) -> ()
              }
              aie.objectfifo.release @flash_scale_0_5(Consume, 1)
              scf.yield
            }
            default {
              %20 = aie.objectfifo.acquire @flash_scale_0_3(Consume, 1) : !aie.objectfifosubview<memref<256xbf16>>
              %21 = aie.objectfifo.subview.access %20[0] : !aie.objectfifosubview<memref<256xbf16>> -> memref<256xbf16>
              %c64_i32 = arith.constant 64 : i32
              %c0_i32_7 = arith.constant 0 : i32
              %22 = arith.cmpi ne, %16, %c0_i32_7 : i32
              %23 = arith.extui %22 : i1 to i32
              func.call @op0_matmul_PV(%13, %4, %12, %21, %c64_i32, %23, %flash_index_0_4) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>, memref<256xbf16>, i32, i32, memref<2xi32>) -> ()
              %c15_i32 = arith.constant 15 : i32
              %24 = arith.cmpi eq, %16, %c15_i32 : i32
              scf.if %24 {
                func.call @op0_rescale_O(%12, %21, %c64_i32, %flash_index_0_4) : (memref<64x64xbf16>, memref<256xbf16>, i32, memref<2xi32>) -> ()
              }
              aie.objectfifo.release @flash_scale_0_3(Consume, 1)
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
        %c16 = arith.constant 16 : index
        scf.for %arg1 = %c0_0 to %c16 step %c1_1 {
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
            %c8_i32 = arith.constant 8 : i32
            %18 = arith.muli %17, %c8_i32 : i32
            %c1_i32_4 = arith.constant 1 : i32
            %19 = arith.addi %c1_i32_4, %18 : i32
            %c0_5 = arith.constant 0 : index
            %c1_6 = arith.constant 1 : index
            memref.store %16, %flash_index_1_4[%c0_5] : memref<2xi32>
            memref.store %19, %flash_index_1_4[%c1_6] : memref<2xi32>
            scf.index_switch %arg2 
            case 0 {
              %20 = aie.objectfifo.acquire @flash_scale_1_3(Consume, 1) : !aie.objectfifosubview<memref<256xbf16>>
              %21 = aie.objectfifo.subview.access %20[0] : !aie.objectfifosubview<memref<256xbf16>> -> memref<256xbf16>
              %c64_i32 = arith.constant 64 : i32
              %c0_i32_7 = arith.constant 0 : i32
              %22 = arith.cmpi ne, %16, %c0_i32_7 : i32
              %23 = arith.extui %22 : i1 to i32
              func.call @op0_matmul_PV(%13, %4, %12, %21, %c64_i32, %23, %flash_index_1_4) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>, memref<256xbf16>, i32, i32, memref<2xi32>) -> ()
              %c15_i32 = arith.constant 15 : i32
              %24 = arith.cmpi eq, %16, %c15_i32 : i32
              scf.if %24 {
                func.call @op0_rescale_O(%12, %21, %c64_i32, %flash_index_1_4) : (memref<64x64xbf16>, memref<256xbf16>, i32, memref<2xi32>) -> ()
              }
              aie.objectfifo.release @flash_scale_1_3(Consume, 1)
              scf.yield
            }
            case 1 {
              %20 = aie.objectfifo.acquire @flash_scale_1_5(Consume, 1) : !aie.objectfifosubview<memref<256xbf16>>
              %21 = aie.objectfifo.subview.access %20[0] : !aie.objectfifosubview<memref<256xbf16>> -> memref<256xbf16>
              %c64_i32 = arith.constant 64 : i32
              %c0_i32_7 = arith.constant 0 : i32
              %22 = arith.cmpi ne, %16, %c0_i32_7 : i32
              %23 = arith.extui %22 : i1 to i32
              func.call @op0_matmul_PV(%13, %4, %12, %21, %c64_i32, %23, %flash_index_1_4) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>, memref<256xbf16>, i32, i32, memref<2xi32>) -> ()
              %c15_i32 = arith.constant 15 : i32
              %24 = arith.cmpi eq, %16, %c15_i32 : i32
              scf.if %24 {
                func.call @op0_rescale_O(%12, %21, %c64_i32, %flash_index_1_4) : (memref<64x64xbf16>, memref<256xbf16>, i32, memref<2xi32>) -> ()
              }
              aie.objectfifo.release @flash_scale_1_5(Consume, 1)
              scf.yield
            }
            default {
              %20 = aie.objectfifo.acquire @flash_scale_1_3(Consume, 1) : !aie.objectfifosubview<memref<256xbf16>>
              %21 = aie.objectfifo.subview.access %20[0] : !aie.objectfifosubview<memref<256xbf16>> -> memref<256xbf16>
              %c64_i32 = arith.constant 64 : i32
              %c0_i32_7 = arith.constant 0 : i32
              %22 = arith.cmpi ne, %16, %c0_i32_7 : i32
              %23 = arith.extui %22 : i1 to i32
              func.call @op0_matmul_PV(%13, %4, %12, %21, %c64_i32, %23, %flash_index_1_4) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>, memref<256xbf16>, i32, i32, memref<2xi32>) -> ()
              %c15_i32 = arith.constant 15 : i32
              %24 = arith.cmpi eq, %16, %c15_i32 : i32
              scf.if %24 {
                func.call @op0_rescale_O(%12, %21, %c64_i32, %flash_index_1_4) : (memref<64x64xbf16>, memref<256xbf16>, i32, memref<2xi32>) -> ()
              }
              aie.objectfifo.release @flash_scale_1_3(Consume, 1)
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
        %c16 = arith.constant 16 : index
        scf.for %arg1 = %c0_0 to %c16 step %c1_1 {
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
            %c8_i32 = arith.constant 8 : i32
            %18 = arith.muli %17, %c8_i32 : i32
            %c2_i32 = arith.constant 2 : i32
            %19 = arith.addi %c2_i32, %18 : i32
            %c0_4 = arith.constant 0 : index
            %c1_5 = arith.constant 1 : index
            memref.store %16, %flash_index_2_4[%c0_4] : memref<2xi32>
            memref.store %19, %flash_index_2_4[%c1_5] : memref<2xi32>
            scf.index_switch %arg2 
            case 0 {
              %20 = aie.objectfifo.acquire @flash_scale_2_3(Consume, 1) : !aie.objectfifosubview<memref<256xbf16>>
              %21 = aie.objectfifo.subview.access %20[0] : !aie.objectfifosubview<memref<256xbf16>> -> memref<256xbf16>
              %c64_i32 = arith.constant 64 : i32
              %c0_i32_6 = arith.constant 0 : i32
              %22 = arith.cmpi ne, %16, %c0_i32_6 : i32
              %23 = arith.extui %22 : i1 to i32
              func.call @op0_matmul_PV(%13, %4, %12, %21, %c64_i32, %23, %flash_index_2_4) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>, memref<256xbf16>, i32, i32, memref<2xi32>) -> ()
              %c15_i32 = arith.constant 15 : i32
              %24 = arith.cmpi eq, %16, %c15_i32 : i32
              scf.if %24 {
                func.call @op0_rescale_O(%12, %21, %c64_i32, %flash_index_2_4) : (memref<64x64xbf16>, memref<256xbf16>, i32, memref<2xi32>) -> ()
              }
              aie.objectfifo.release @flash_scale_2_3(Consume, 1)
              scf.yield
            }
            case 1 {
              %20 = aie.objectfifo.acquire @flash_scale_2_5(Consume, 1) : !aie.objectfifosubview<memref<256xbf16>>
              %21 = aie.objectfifo.subview.access %20[0] : !aie.objectfifosubview<memref<256xbf16>> -> memref<256xbf16>
              %c64_i32 = arith.constant 64 : i32
              %c0_i32_6 = arith.constant 0 : i32
              %22 = arith.cmpi ne, %16, %c0_i32_6 : i32
              %23 = arith.extui %22 : i1 to i32
              func.call @op0_matmul_PV(%13, %4, %12, %21, %c64_i32, %23, %flash_index_2_4) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>, memref<256xbf16>, i32, i32, memref<2xi32>) -> ()
              %c15_i32 = arith.constant 15 : i32
              %24 = arith.cmpi eq, %16, %c15_i32 : i32
              scf.if %24 {
                func.call @op0_rescale_O(%12, %21, %c64_i32, %flash_index_2_4) : (memref<64x64xbf16>, memref<256xbf16>, i32, memref<2xi32>) -> ()
              }
              aie.objectfifo.release @flash_scale_2_5(Consume, 1)
              scf.yield
            }
            default {
              %20 = aie.objectfifo.acquire @flash_scale_2_3(Consume, 1) : !aie.objectfifosubview<memref<256xbf16>>
              %21 = aie.objectfifo.subview.access %20[0] : !aie.objectfifosubview<memref<256xbf16>> -> memref<256xbf16>
              %c64_i32 = arith.constant 64 : i32
              %c0_i32_6 = arith.constant 0 : i32
              %22 = arith.cmpi ne, %16, %c0_i32_6 : i32
              %23 = arith.extui %22 : i1 to i32
              func.call @op0_matmul_PV(%13, %4, %12, %21, %c64_i32, %23, %flash_index_2_4) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>, memref<256xbf16>, i32, i32, memref<2xi32>) -> ()
              %c15_i32 = arith.constant 15 : i32
              %24 = arith.cmpi eq, %16, %c15_i32 : i32
              scf.if %24 {
                func.call @op0_rescale_O(%12, %21, %c64_i32, %flash_index_2_4) : (memref<64x64xbf16>, memref<256xbf16>, i32, memref<2xi32>) -> ()
              }
              aie.objectfifo.release @flash_scale_2_3(Consume, 1)
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
        %c16 = arith.constant 16 : index
        scf.for %arg1 = %c0_0 to %c16 step %c1_1 {
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
            %c8_i32 = arith.constant 8 : i32
            %18 = arith.muli %17, %c8_i32 : i32
            %c3_i32 = arith.constant 3 : i32
            %19 = arith.addi %c3_i32, %18 : i32
            %c0_4 = arith.constant 0 : index
            %c1_5 = arith.constant 1 : index
            memref.store %16, %flash_index_3_4[%c0_4] : memref<2xi32>
            memref.store %19, %flash_index_3_4[%c1_5] : memref<2xi32>
            scf.index_switch %arg2 
            case 0 {
              %20 = aie.objectfifo.acquire @flash_scale_3_3(Consume, 1) : !aie.objectfifosubview<memref<256xbf16>>
              %21 = aie.objectfifo.subview.access %20[0] : !aie.objectfifosubview<memref<256xbf16>> -> memref<256xbf16>
              %c64_i32 = arith.constant 64 : i32
              %c0_i32_6 = arith.constant 0 : i32
              %22 = arith.cmpi ne, %16, %c0_i32_6 : i32
              %23 = arith.extui %22 : i1 to i32
              func.call @op0_matmul_PV(%13, %4, %12, %21, %c64_i32, %23, %flash_index_3_4) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>, memref<256xbf16>, i32, i32, memref<2xi32>) -> ()
              %c15_i32 = arith.constant 15 : i32
              %24 = arith.cmpi eq, %16, %c15_i32 : i32
              scf.if %24 {
                func.call @op0_rescale_O(%12, %21, %c64_i32, %flash_index_3_4) : (memref<64x64xbf16>, memref<256xbf16>, i32, memref<2xi32>) -> ()
              }
              aie.objectfifo.release @flash_scale_3_3(Consume, 1)
              scf.yield
            }
            case 1 {
              %20 = aie.objectfifo.acquire @flash_scale_3_5(Consume, 1) : !aie.objectfifosubview<memref<256xbf16>>
              %21 = aie.objectfifo.subview.access %20[0] : !aie.objectfifosubview<memref<256xbf16>> -> memref<256xbf16>
              %c64_i32 = arith.constant 64 : i32
              %c0_i32_6 = arith.constant 0 : i32
              %22 = arith.cmpi ne, %16, %c0_i32_6 : i32
              %23 = arith.extui %22 : i1 to i32
              func.call @op0_matmul_PV(%13, %4, %12, %21, %c64_i32, %23, %flash_index_3_4) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>, memref<256xbf16>, i32, i32, memref<2xi32>) -> ()
              %c15_i32 = arith.constant 15 : i32
              %24 = arith.cmpi eq, %16, %c15_i32 : i32
              scf.if %24 {
                func.call @op0_rescale_O(%12, %21, %c64_i32, %flash_index_3_4) : (memref<64x64xbf16>, memref<256xbf16>, i32, memref<2xi32>) -> ()
              }
              aie.objectfifo.release @flash_scale_3_5(Consume, 1)
              scf.yield
            }
            default {
              %20 = aie.objectfifo.acquire @flash_scale_3_3(Consume, 1) : !aie.objectfifosubview<memref<256xbf16>>
              %21 = aie.objectfifo.subview.access %20[0] : !aie.objectfifosubview<memref<256xbf16>> -> memref<256xbf16>
              %c64_i32 = arith.constant 64 : i32
              %c0_i32_6 = arith.constant 0 : i32
              %22 = arith.cmpi ne, %16, %c0_i32_6 : i32
              %23 = arith.extui %22 : i1 to i32
              func.call @op0_matmul_PV(%13, %4, %12, %21, %c64_i32, %23, %flash_index_3_4) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>, memref<256xbf16>, i32, i32, memref<2xi32>) -> ()
              %c15_i32 = arith.constant 15 : i32
              %24 = arith.cmpi eq, %16, %c15_i32 : i32
              scf.if %24 {
                func.call @op0_rescale_O(%12, %21, %c64_i32, %flash_index_3_4) : (memref<64x64xbf16>, memref<256xbf16>, i32, memref<2xi32>) -> ()
              }
              aie.objectfifo.release @flash_scale_3_3(Consume, 1)
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
    %flash_index_4_4 = aie.buffer(%tile_4_4) {sym_name = "flash_index_4_4"} : memref<2xi32> 
    %core_4_4 = aie.core(%tile_4_4) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %0 = aie.objectfifo.acquire @of_9_unicast_4(Produce, 2) : !aie.objectfifosubview<memref<64x64xbf16>>
        %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
        func.call @op0_zero_bf16(%1) : (memref<64x64xbf16>) -> ()
        %2 = aie.objectfifo.subview.access %0[1] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
        func.call @op0_zero_bf16(%2) : (memref<64x64xbf16>) -> ()
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c16 = arith.constant 16 : index
        scf.for %arg1 = %c0_0 to %c16 step %c1_1 {
          %3 = aie.objectfifo.acquire @of_5_broadcast_0_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
          %4 = aie.objectfifo.subview.access %3[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
          %c2 = arith.constant 2 : index
          %5 = aie.objectfifo.acquire @of_8_switch_join_4_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
          %6 = aie.objectfifo.acquire @of_8_switch_join_4_1(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
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
            %c8_i32 = arith.constant 8 : i32
            %18 = arith.muli %17, %c8_i32 : i32
            %c4_i32 = arith.constant 4 : i32
            %19 = arith.addi %c4_i32, %18 : i32
            %c0_4 = arith.constant 0 : index
            %c1_5 = arith.constant 1 : index
            memref.store %16, %flash_index_4_4[%c0_4] : memref<2xi32>
            memref.store %19, %flash_index_4_4[%c1_5] : memref<2xi32>
            scf.index_switch %arg2 
            case 0 {
              %20 = aie.objectfifo.acquire @flash_scale_4_3(Consume, 1) : !aie.objectfifosubview<memref<256xbf16>>
              %21 = aie.objectfifo.subview.access %20[0] : !aie.objectfifosubview<memref<256xbf16>> -> memref<256xbf16>
              %c64_i32 = arith.constant 64 : i32
              %c0_i32_6 = arith.constant 0 : i32
              %22 = arith.cmpi ne, %16, %c0_i32_6 : i32
              %23 = arith.extui %22 : i1 to i32
              func.call @op0_matmul_PV(%13, %4, %12, %21, %c64_i32, %23, %flash_index_4_4) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>, memref<256xbf16>, i32, i32, memref<2xi32>) -> ()
              %c15_i32 = arith.constant 15 : i32
              %24 = arith.cmpi eq, %16, %c15_i32 : i32
              scf.if %24 {
                func.call @op0_rescale_O(%12, %21, %c64_i32, %flash_index_4_4) : (memref<64x64xbf16>, memref<256xbf16>, i32, memref<2xi32>) -> ()
              }
              aie.objectfifo.release @flash_scale_4_3(Consume, 1)
              scf.yield
            }
            case 1 {
              %20 = aie.objectfifo.acquire @flash_scale_4_5(Consume, 1) : !aie.objectfifosubview<memref<256xbf16>>
              %21 = aie.objectfifo.subview.access %20[0] : !aie.objectfifosubview<memref<256xbf16>> -> memref<256xbf16>
              %c64_i32 = arith.constant 64 : i32
              %c0_i32_6 = arith.constant 0 : i32
              %22 = arith.cmpi ne, %16, %c0_i32_6 : i32
              %23 = arith.extui %22 : i1 to i32
              func.call @op0_matmul_PV(%13, %4, %12, %21, %c64_i32, %23, %flash_index_4_4) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>, memref<256xbf16>, i32, i32, memref<2xi32>) -> ()
              %c15_i32 = arith.constant 15 : i32
              %24 = arith.cmpi eq, %16, %c15_i32 : i32
              scf.if %24 {
                func.call @op0_rescale_O(%12, %21, %c64_i32, %flash_index_4_4) : (memref<64x64xbf16>, memref<256xbf16>, i32, memref<2xi32>) -> ()
              }
              aie.objectfifo.release @flash_scale_4_5(Consume, 1)
              scf.yield
            }
            default {
              %20 = aie.objectfifo.acquire @flash_scale_4_3(Consume, 1) : !aie.objectfifosubview<memref<256xbf16>>
              %21 = aie.objectfifo.subview.access %20[0] : !aie.objectfifosubview<memref<256xbf16>> -> memref<256xbf16>
              %c64_i32 = arith.constant 64 : i32
              %c0_i32_6 = arith.constant 0 : i32
              %22 = arith.cmpi ne, %16, %c0_i32_6 : i32
              %23 = arith.extui %22 : i1 to i32
              func.call @op0_matmul_PV(%13, %4, %12, %21, %c64_i32, %23, %flash_index_4_4) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>, memref<256xbf16>, i32, i32, memref<2xi32>) -> ()
              %c15_i32 = arith.constant 15 : i32
              %24 = arith.cmpi eq, %16, %c15_i32 : i32
              scf.if %24 {
                func.call @op0_rescale_O(%12, %21, %c64_i32, %flash_index_4_4) : (memref<64x64xbf16>, memref<256xbf16>, i32, memref<2xi32>) -> ()
              }
              aie.objectfifo.release @flash_scale_4_3(Consume, 1)
            }
          }
          aie.objectfifo.release @of_8_switch_join_4_0(Consume, 1)
          aie.objectfifo.release @of_8_switch_join_4_1(Consume, 1)
          aie.objectfifo.release @of_5_broadcast_0_0(Consume, 1)
        }
        aie.objectfifo.release @of_9_unicast_4(Produce, 2)
      }
      aie.end
    } {link_with = "op0_mha.o"}
    %flash_index_5_4 = aie.buffer(%tile_5_4) {sym_name = "flash_index_5_4"} : memref<2xi32> 
    %core_5_4 = aie.core(%tile_5_4) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %0 = aie.objectfifo.acquire @of_9_unicast_5(Produce, 2) : !aie.objectfifosubview<memref<64x64xbf16>>
        %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
        func.call @op0_zero_bf16(%1) : (memref<64x64xbf16>) -> ()
        %2 = aie.objectfifo.subview.access %0[1] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
        func.call @op0_zero_bf16(%2) : (memref<64x64xbf16>) -> ()
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c16 = arith.constant 16 : index
        scf.for %arg1 = %c0_0 to %c16 step %c1_1 {
          %3 = aie.objectfifo.acquire @of_5_broadcast_0_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
          %4 = aie.objectfifo.subview.access %3[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
          %c2 = arith.constant 2 : index
          %5 = aie.objectfifo.acquire @of_8_switch_join_5_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
          %6 = aie.objectfifo.acquire @of_8_switch_join_5_1(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
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
            %c8_i32 = arith.constant 8 : i32
            %18 = arith.muli %17, %c8_i32 : i32
            %c5_i32 = arith.constant 5 : i32
            %19 = arith.addi %c5_i32, %18 : i32
            %c0_4 = arith.constant 0 : index
            %c1_5 = arith.constant 1 : index
            memref.store %16, %flash_index_5_4[%c0_4] : memref<2xi32>
            memref.store %19, %flash_index_5_4[%c1_5] : memref<2xi32>
            scf.index_switch %arg2 
            case 0 {
              %20 = aie.objectfifo.acquire @flash_scale_5_3(Consume, 1) : !aie.objectfifosubview<memref<256xbf16>>
              %21 = aie.objectfifo.subview.access %20[0] : !aie.objectfifosubview<memref<256xbf16>> -> memref<256xbf16>
              %c64_i32 = arith.constant 64 : i32
              %c0_i32_6 = arith.constant 0 : i32
              %22 = arith.cmpi ne, %16, %c0_i32_6 : i32
              %23 = arith.extui %22 : i1 to i32
              func.call @op0_matmul_PV(%13, %4, %12, %21, %c64_i32, %23, %flash_index_5_4) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>, memref<256xbf16>, i32, i32, memref<2xi32>) -> ()
              %c15_i32 = arith.constant 15 : i32
              %24 = arith.cmpi eq, %16, %c15_i32 : i32
              scf.if %24 {
                func.call @op0_rescale_O(%12, %21, %c64_i32, %flash_index_5_4) : (memref<64x64xbf16>, memref<256xbf16>, i32, memref<2xi32>) -> ()
              }
              aie.objectfifo.release @flash_scale_5_3(Consume, 1)
              scf.yield
            }
            case 1 {
              %20 = aie.objectfifo.acquire @flash_scale_5_5(Consume, 1) : !aie.objectfifosubview<memref<256xbf16>>
              %21 = aie.objectfifo.subview.access %20[0] : !aie.objectfifosubview<memref<256xbf16>> -> memref<256xbf16>
              %c64_i32 = arith.constant 64 : i32
              %c0_i32_6 = arith.constant 0 : i32
              %22 = arith.cmpi ne, %16, %c0_i32_6 : i32
              %23 = arith.extui %22 : i1 to i32
              func.call @op0_matmul_PV(%13, %4, %12, %21, %c64_i32, %23, %flash_index_5_4) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>, memref<256xbf16>, i32, i32, memref<2xi32>) -> ()
              %c15_i32 = arith.constant 15 : i32
              %24 = arith.cmpi eq, %16, %c15_i32 : i32
              scf.if %24 {
                func.call @op0_rescale_O(%12, %21, %c64_i32, %flash_index_5_4) : (memref<64x64xbf16>, memref<256xbf16>, i32, memref<2xi32>) -> ()
              }
              aie.objectfifo.release @flash_scale_5_5(Consume, 1)
              scf.yield
            }
            default {
              %20 = aie.objectfifo.acquire @flash_scale_5_3(Consume, 1) : !aie.objectfifosubview<memref<256xbf16>>
              %21 = aie.objectfifo.subview.access %20[0] : !aie.objectfifosubview<memref<256xbf16>> -> memref<256xbf16>
              %c64_i32 = arith.constant 64 : i32
              %c0_i32_6 = arith.constant 0 : i32
              %22 = arith.cmpi ne, %16, %c0_i32_6 : i32
              %23 = arith.extui %22 : i1 to i32
              func.call @op0_matmul_PV(%13, %4, %12, %21, %c64_i32, %23, %flash_index_5_4) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>, memref<256xbf16>, i32, i32, memref<2xi32>) -> ()
              %c15_i32 = arith.constant 15 : i32
              %24 = arith.cmpi eq, %16, %c15_i32 : i32
              scf.if %24 {
                func.call @op0_rescale_O(%12, %21, %c64_i32, %flash_index_5_4) : (memref<64x64xbf16>, memref<256xbf16>, i32, memref<2xi32>) -> ()
              }
              aie.objectfifo.release @flash_scale_5_3(Consume, 1)
            }
          }
          aie.objectfifo.release @of_8_switch_join_5_0(Consume, 1)
          aie.objectfifo.release @of_8_switch_join_5_1(Consume, 1)
          aie.objectfifo.release @of_5_broadcast_0_0(Consume, 1)
        }
        aie.objectfifo.release @of_9_unicast_5(Produce, 2)
      }
      aie.end
    } {link_with = "op0_mha.o"}
    %flash_index_6_4 = aie.buffer(%tile_6_4) {sym_name = "flash_index_6_4"} : memref<2xi32> 
    %core_6_4 = aie.core(%tile_6_4) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %0 = aie.objectfifo.acquire @of_9_unicast_6(Produce, 2) : !aie.objectfifosubview<memref<64x64xbf16>>
        %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
        func.call @op0_zero_bf16(%1) : (memref<64x64xbf16>) -> ()
        %2 = aie.objectfifo.subview.access %0[1] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
        func.call @op0_zero_bf16(%2) : (memref<64x64xbf16>) -> ()
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c16 = arith.constant 16 : index
        scf.for %arg1 = %c0_0 to %c16 step %c1_1 {
          %3 = aie.objectfifo.acquire @of_5_broadcast_0_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
          %4 = aie.objectfifo.subview.access %3[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
          %c2 = arith.constant 2 : index
          %5 = aie.objectfifo.acquire @of_8_switch_join_6_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
          %6 = aie.objectfifo.acquire @of_8_switch_join_6_1(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
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
            %c8_i32 = arith.constant 8 : i32
            %18 = arith.muli %17, %c8_i32 : i32
            %c6_i32 = arith.constant 6 : i32
            %19 = arith.addi %c6_i32, %18 : i32
            %c0_4 = arith.constant 0 : index
            %c1_5 = arith.constant 1 : index
            memref.store %16, %flash_index_6_4[%c0_4] : memref<2xi32>
            memref.store %19, %flash_index_6_4[%c1_5] : memref<2xi32>
            scf.index_switch %arg2 
            case 0 {
              %20 = aie.objectfifo.acquire @flash_scale_6_3(Consume, 1) : !aie.objectfifosubview<memref<256xbf16>>
              %21 = aie.objectfifo.subview.access %20[0] : !aie.objectfifosubview<memref<256xbf16>> -> memref<256xbf16>
              %c64_i32 = arith.constant 64 : i32
              %c0_i32_6 = arith.constant 0 : i32
              %22 = arith.cmpi ne, %16, %c0_i32_6 : i32
              %23 = arith.extui %22 : i1 to i32
              func.call @op0_matmul_PV(%13, %4, %12, %21, %c64_i32, %23, %flash_index_6_4) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>, memref<256xbf16>, i32, i32, memref<2xi32>) -> ()
              %c15_i32 = arith.constant 15 : i32
              %24 = arith.cmpi eq, %16, %c15_i32 : i32
              scf.if %24 {
                func.call @op0_rescale_O(%12, %21, %c64_i32, %flash_index_6_4) : (memref<64x64xbf16>, memref<256xbf16>, i32, memref<2xi32>) -> ()
              }
              aie.objectfifo.release @flash_scale_6_3(Consume, 1)
              scf.yield
            }
            case 1 {
              %20 = aie.objectfifo.acquire @flash_scale_6_5(Consume, 1) : !aie.objectfifosubview<memref<256xbf16>>
              %21 = aie.objectfifo.subview.access %20[0] : !aie.objectfifosubview<memref<256xbf16>> -> memref<256xbf16>
              %c64_i32 = arith.constant 64 : i32
              %c0_i32_6 = arith.constant 0 : i32
              %22 = arith.cmpi ne, %16, %c0_i32_6 : i32
              %23 = arith.extui %22 : i1 to i32
              func.call @op0_matmul_PV(%13, %4, %12, %21, %c64_i32, %23, %flash_index_6_4) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>, memref<256xbf16>, i32, i32, memref<2xi32>) -> ()
              %c15_i32 = arith.constant 15 : i32
              %24 = arith.cmpi eq, %16, %c15_i32 : i32
              scf.if %24 {
                func.call @op0_rescale_O(%12, %21, %c64_i32, %flash_index_6_4) : (memref<64x64xbf16>, memref<256xbf16>, i32, memref<2xi32>) -> ()
              }
              aie.objectfifo.release @flash_scale_6_5(Consume, 1)
              scf.yield
            }
            default {
              %20 = aie.objectfifo.acquire @flash_scale_6_3(Consume, 1) : !aie.objectfifosubview<memref<256xbf16>>
              %21 = aie.objectfifo.subview.access %20[0] : !aie.objectfifosubview<memref<256xbf16>> -> memref<256xbf16>
              %c64_i32 = arith.constant 64 : i32
              %c0_i32_6 = arith.constant 0 : i32
              %22 = arith.cmpi ne, %16, %c0_i32_6 : i32
              %23 = arith.extui %22 : i1 to i32
              func.call @op0_matmul_PV(%13, %4, %12, %21, %c64_i32, %23, %flash_index_6_4) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>, memref<256xbf16>, i32, i32, memref<2xi32>) -> ()
              %c15_i32 = arith.constant 15 : i32
              %24 = arith.cmpi eq, %16, %c15_i32 : i32
              scf.if %24 {
                func.call @op0_rescale_O(%12, %21, %c64_i32, %flash_index_6_4) : (memref<64x64xbf16>, memref<256xbf16>, i32, memref<2xi32>) -> ()
              }
              aie.objectfifo.release @flash_scale_6_3(Consume, 1)
            }
          }
          aie.objectfifo.release @of_8_switch_join_6_0(Consume, 1)
          aie.objectfifo.release @of_8_switch_join_6_1(Consume, 1)
          aie.objectfifo.release @of_5_broadcast_0_0(Consume, 1)
        }
        aie.objectfifo.release @of_9_unicast_6(Produce, 2)
      }
      aie.end
    } {link_with = "op0_mha.o"}
    %flash_index_7_4 = aie.buffer(%tile_7_4) {sym_name = "flash_index_7_4"} : memref<2xi32> 
    %core_7_4 = aie.core(%tile_7_4) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %0 = aie.objectfifo.acquire @of_9_unicast_7(Produce, 2) : !aie.objectfifosubview<memref<64x64xbf16>>
        %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
        func.call @op0_zero_bf16(%1) : (memref<64x64xbf16>) -> ()
        %2 = aie.objectfifo.subview.access %0[1] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
        func.call @op0_zero_bf16(%2) : (memref<64x64xbf16>) -> ()
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c16 = arith.constant 16 : index
        scf.for %arg1 = %c0_0 to %c16 step %c1_1 {
          %3 = aie.objectfifo.acquire @of_5_broadcast_0_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
          %4 = aie.objectfifo.subview.access %3[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
          %c2 = arith.constant 2 : index
          %5 = aie.objectfifo.acquire @of_8_switch_join_7_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
          %6 = aie.objectfifo.acquire @of_8_switch_join_7_1(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
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
            %c8_i32 = arith.constant 8 : i32
            %18 = arith.muli %17, %c8_i32 : i32
            %c7_i32 = arith.constant 7 : i32
            %19 = arith.addi %c7_i32, %18 : i32
            %c0_4 = arith.constant 0 : index
            %c1_5 = arith.constant 1 : index
            memref.store %16, %flash_index_7_4[%c0_4] : memref<2xi32>
            memref.store %19, %flash_index_7_4[%c1_5] : memref<2xi32>
            scf.index_switch %arg2 
            case 0 {
              %20 = aie.objectfifo.acquire @flash_scale_7_3(Consume, 1) : !aie.objectfifosubview<memref<256xbf16>>
              %21 = aie.objectfifo.subview.access %20[0] : !aie.objectfifosubview<memref<256xbf16>> -> memref<256xbf16>
              %c64_i32 = arith.constant 64 : i32
              %c0_i32_6 = arith.constant 0 : i32
              %22 = arith.cmpi ne, %16, %c0_i32_6 : i32
              %23 = arith.extui %22 : i1 to i32
              func.call @op0_matmul_PV(%13, %4, %12, %21, %c64_i32, %23, %flash_index_7_4) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>, memref<256xbf16>, i32, i32, memref<2xi32>) -> ()
              %c15_i32 = arith.constant 15 : i32
              %24 = arith.cmpi eq, %16, %c15_i32 : i32
              scf.if %24 {
                func.call @op0_rescale_O(%12, %21, %c64_i32, %flash_index_7_4) : (memref<64x64xbf16>, memref<256xbf16>, i32, memref<2xi32>) -> ()
              }
              aie.objectfifo.release @flash_scale_7_3(Consume, 1)
              scf.yield
            }
            case 1 {
              %20 = aie.objectfifo.acquire @flash_scale_7_5(Consume, 1) : !aie.objectfifosubview<memref<256xbf16>>
              %21 = aie.objectfifo.subview.access %20[0] : !aie.objectfifosubview<memref<256xbf16>> -> memref<256xbf16>
              %c64_i32 = arith.constant 64 : i32
              %c0_i32_6 = arith.constant 0 : i32
              %22 = arith.cmpi ne, %16, %c0_i32_6 : i32
              %23 = arith.extui %22 : i1 to i32
              func.call @op0_matmul_PV(%13, %4, %12, %21, %c64_i32, %23, %flash_index_7_4) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>, memref<256xbf16>, i32, i32, memref<2xi32>) -> ()
              %c15_i32 = arith.constant 15 : i32
              %24 = arith.cmpi eq, %16, %c15_i32 : i32
              scf.if %24 {
                func.call @op0_rescale_O(%12, %21, %c64_i32, %flash_index_7_4) : (memref<64x64xbf16>, memref<256xbf16>, i32, memref<2xi32>) -> ()
              }
              aie.objectfifo.release @flash_scale_7_5(Consume, 1)
              scf.yield
            }
            default {
              %20 = aie.objectfifo.acquire @flash_scale_7_3(Consume, 1) : !aie.objectfifosubview<memref<256xbf16>>
              %21 = aie.objectfifo.subview.access %20[0] : !aie.objectfifosubview<memref<256xbf16>> -> memref<256xbf16>
              %c64_i32 = arith.constant 64 : i32
              %c0_i32_6 = arith.constant 0 : i32
              %22 = arith.cmpi ne, %16, %c0_i32_6 : i32
              %23 = arith.extui %22 : i1 to i32
              func.call @op0_matmul_PV(%13, %4, %12, %21, %c64_i32, %23, %flash_index_7_4) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>, memref<256xbf16>, i32, i32, memref<2xi32>) -> ()
              %c15_i32 = arith.constant 15 : i32
              %24 = arith.cmpi eq, %16, %c15_i32 : i32
              scf.if %24 {
                func.call @op0_rescale_O(%12, %21, %c64_i32, %flash_index_7_4) : (memref<64x64xbf16>, memref<256xbf16>, i32, memref<2xi32>) -> ()
              }
              aie.objectfifo.release @flash_scale_7_3(Consume, 1)
            }
          }
          aie.objectfifo.release @of_8_switch_join_7_0(Consume, 1)
          aie.objectfifo.release @of_8_switch_join_7_1(Consume, 1)
          aie.objectfifo.release @of_5_broadcast_0_0(Consume, 1)
        }
        aie.objectfifo.release @of_9_unicast_7(Produce, 2)
      }
      aie.end
    } {link_with = "op0_mha.o"}
    %flash_state_0_3 = aie.buffer(%tile_0_3) {sym_name = "flash_state_0_3"} : memref<256xbf16> 
    %flash_index_0_3 = aie.buffer(%tile_0_3) {sym_name = "flash_index_0_3"} : memref<2xi32> 
    aie.objectfifo @flash_scale_0_3(%tile_0_3, {%tile_0_4}, 2 : i32) : !aie.objectfifo<memref<256xbf16>>  
    %core_0_3 = aie.core(%tile_0_3) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c16 = arith.constant 16 : index
        scf.for %arg1 = %c0_0 to %c16 step %c1_1 {
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
          %c1024_i32 = arith.constant 1024 : i32
          %c1024_i32_7 = arith.constant 1024 : i32
          %c2_i32 = arith.constant 2 : i32
          func.call @op0_partial_softmax_mode(%3, %1, %flash_state_0_3, %flash_index_0_3, %8, %c64_i32, %c64_i32_6, %c1024_i32, %c1024_i32_7, %c2_i32) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<256xbf16>, memref<2xi32>, bf16, i32, i32, i32, i32, i32) -> ()
          %9 = aie.objectfifo.acquire @flash_scale_0_3(Produce, 1) : !aie.objectfifosubview<memref<256xbf16>>
          %10 = aie.objectfifo.subview.access %9[0] : !aie.objectfifosubview<memref<256xbf16>> -> memref<256xbf16>
          %c256_i32 = arith.constant 256 : i32
          func.call @op0_passThroughLine(%flash_state_0_3, %10, %c256_i32) : (memref<256xbf16>, memref<256xbf16>, i32) -> ()
          aie.objectfifo.release @flash_scale_0_3(Produce, 1)
          aie.objectfifo.release @of_7_distribute_0_0(Consume, 1)
          aie.objectfifo.release @of_8_switch_join_0_0(Produce, 1)
        }
      }
      aie.end
    } {link_with = "op0_mha.o"}
    %flash_state_1_3 = aie.buffer(%tile_1_3) {sym_name = "flash_state_1_3"} : memref<256xbf16> 
    %flash_index_1_3 = aie.buffer(%tile_1_3) {sym_name = "flash_index_1_3"} : memref<2xi32> 
    aie.objectfifo @flash_scale_1_3(%tile_1_3, {%tile_1_4}, 2 : i32) : !aie.objectfifo<memref<256xbf16>>  
    %core_1_3 = aie.core(%tile_1_3) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c16 = arith.constant 16 : index
        scf.for %arg1 = %c0_0 to %c16 step %c1_1 {
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
          %c1024_i32 = arith.constant 1024 : i32
          %c1024_i32_7 = arith.constant 1024 : i32
          %c2_i32 = arith.constant 2 : i32
          func.call @op0_partial_softmax_mode(%3, %1, %flash_state_1_3, %flash_index_1_3, %8, %c64_i32, %c64_i32_6, %c1024_i32, %c1024_i32_7, %c2_i32) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<256xbf16>, memref<2xi32>, bf16, i32, i32, i32, i32, i32) -> ()
          %9 = aie.objectfifo.acquire @flash_scale_1_3(Produce, 1) : !aie.objectfifosubview<memref<256xbf16>>
          %10 = aie.objectfifo.subview.access %9[0] : !aie.objectfifosubview<memref<256xbf16>> -> memref<256xbf16>
          %c256_i32 = arith.constant 256 : i32
          func.call @op0_passThroughLine(%flash_state_1_3, %10, %c256_i32) : (memref<256xbf16>, memref<256xbf16>, i32) -> ()
          aie.objectfifo.release @flash_scale_1_3(Produce, 1)
          aie.objectfifo.release @of_7_distribute_1_0(Consume, 1)
          aie.objectfifo.release @of_8_switch_join_1_0(Produce, 1)
        }
      }
      aie.end
    } {link_with = "op0_mha.o"}
    %flash_state_2_3 = aie.buffer(%tile_2_3) {sym_name = "flash_state_2_3"} : memref<256xbf16> 
    %flash_index_2_3 = aie.buffer(%tile_2_3) {sym_name = "flash_index_2_3"} : memref<2xi32> 
    aie.objectfifo @flash_scale_2_3(%tile_2_3, {%tile_2_4}, 2 : i32) : !aie.objectfifo<memref<256xbf16>>  
    %core_2_3 = aie.core(%tile_2_3) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c16 = arith.constant 16 : index
        scf.for %arg1 = %c0_0 to %c16 step %c1_1 {
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
          %c1024_i32 = arith.constant 1024 : i32
          %c1024_i32_6 = arith.constant 1024 : i32
          %c2_i32_7 = arith.constant 2 : i32
          func.call @op0_partial_softmax_mode(%3, %1, %flash_state_2_3, %flash_index_2_3, %8, %c64_i32, %c64_i32_5, %c1024_i32, %c1024_i32_6, %c2_i32_7) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<256xbf16>, memref<2xi32>, bf16, i32, i32, i32, i32, i32) -> ()
          %9 = aie.objectfifo.acquire @flash_scale_2_3(Produce, 1) : !aie.objectfifosubview<memref<256xbf16>>
          %10 = aie.objectfifo.subview.access %9[0] : !aie.objectfifosubview<memref<256xbf16>> -> memref<256xbf16>
          %c256_i32 = arith.constant 256 : i32
          func.call @op0_passThroughLine(%flash_state_2_3, %10, %c256_i32) : (memref<256xbf16>, memref<256xbf16>, i32) -> ()
          aie.objectfifo.release @flash_scale_2_3(Produce, 1)
          aie.objectfifo.release @of_7_distribute_2_0(Consume, 1)
          aie.objectfifo.release @of_8_switch_join_2_0(Produce, 1)
        }
      }
      aie.end
    } {link_with = "op0_mha.o"}
    %flash_state_3_3 = aie.buffer(%tile_3_3) {sym_name = "flash_state_3_3"} : memref<256xbf16> 
    %flash_index_3_3 = aie.buffer(%tile_3_3) {sym_name = "flash_index_3_3"} : memref<2xi32> 
    aie.objectfifo @flash_scale_3_3(%tile_3_3, {%tile_3_4}, 2 : i32) : !aie.objectfifo<memref<256xbf16>>  
    %core_3_3 = aie.core(%tile_3_3) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c16 = arith.constant 16 : index
        scf.for %arg1 = %c0_0 to %c16 step %c1_1 {
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
          %c1024_i32 = arith.constant 1024 : i32
          %c1024_i32_6 = arith.constant 1024 : i32
          %c2_i32 = arith.constant 2 : i32
          func.call @op0_partial_softmax_mode(%3, %1, %flash_state_3_3, %flash_index_3_3, %8, %c64_i32, %c64_i32_5, %c1024_i32, %c1024_i32_6, %c2_i32) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<256xbf16>, memref<2xi32>, bf16, i32, i32, i32, i32, i32) -> ()
          %9 = aie.objectfifo.acquire @flash_scale_3_3(Produce, 1) : !aie.objectfifosubview<memref<256xbf16>>
          %10 = aie.objectfifo.subview.access %9[0] : !aie.objectfifosubview<memref<256xbf16>> -> memref<256xbf16>
          %c256_i32 = arith.constant 256 : i32
          func.call @op0_passThroughLine(%flash_state_3_3, %10, %c256_i32) : (memref<256xbf16>, memref<256xbf16>, i32) -> ()
          aie.objectfifo.release @flash_scale_3_3(Produce, 1)
          aie.objectfifo.release @of_7_distribute_3_0(Consume, 1)
          aie.objectfifo.release @of_8_switch_join_3_0(Produce, 1)
        }
      }
      aie.end
    } {link_with = "op0_mha.o"}
    %flash_state_4_3 = aie.buffer(%tile_4_3) {sym_name = "flash_state_4_3"} : memref<256xbf16> 
    %flash_index_4_3 = aie.buffer(%tile_4_3) {sym_name = "flash_index_4_3"} : memref<2xi32> 
    aie.objectfifo @flash_scale_4_3(%tile_4_3, {%tile_4_4}, 2 : i32) : !aie.objectfifo<memref<256xbf16>>  
    %core_4_3 = aie.core(%tile_4_3) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c16 = arith.constant 16 : index
        scf.for %arg1 = %c0_0 to %c16 step %c1_1 {
          %0 = aie.objectfifo.acquire @of_8_switch_join_4_0(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
          %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
          %2 = aie.objectfifo.acquire @of_7_distribute_4_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
          %3 = aie.objectfifo.subview.access %2[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
          %4 = arith.index_cast %arg1 : index to i32
          %c1_i32 = arith.constant 1 : i32
          %5 = arith.muli %4, %c1_i32 : i32
          %c0_i32 = arith.constant 0 : i32
          %6 = arith.addi %c0_i32, %5 : i32
          %c4_i32 = arith.constant 4 : i32
          %c0_2 = arith.constant 0 : index
          %c1_3 = arith.constant 1 : index
          memref.store %6, %flash_index_4_3[%c0_2] : memref<2xi32>
          memref.store %c4_i32, %flash_index_4_3[%c1_3] : memref<2xi32>
          %c64_i32 = arith.constant 64 : i32
          %c0_i32_4 = arith.constant 0 : i32
          %7 = arith.cmpi eq, %6, %c0_i32_4 : i32
          scf.if %7 {
            func.call @op0_init_scale_buffer(%flash_state_4_3, %c64_i32) : (memref<256xbf16>, i32) -> ()
          }
          %cst = arith.constant 1.4453125 : f32
          %8 = arith.truncf %cst : f32 to bf16
          %c64_i32_5 = arith.constant 64 : i32
          %c1024_i32 = arith.constant 1024 : i32
          %c1024_i32_6 = arith.constant 1024 : i32
          %c2_i32 = arith.constant 2 : i32
          func.call @op0_partial_softmax_mode(%3, %1, %flash_state_4_3, %flash_index_4_3, %8, %c64_i32, %c64_i32_5, %c1024_i32, %c1024_i32_6, %c2_i32) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<256xbf16>, memref<2xi32>, bf16, i32, i32, i32, i32, i32) -> ()
          %9 = aie.objectfifo.acquire @flash_scale_4_3(Produce, 1) : !aie.objectfifosubview<memref<256xbf16>>
          %10 = aie.objectfifo.subview.access %9[0] : !aie.objectfifosubview<memref<256xbf16>> -> memref<256xbf16>
          %c256_i32 = arith.constant 256 : i32
          func.call @op0_passThroughLine(%flash_state_4_3, %10, %c256_i32) : (memref<256xbf16>, memref<256xbf16>, i32) -> ()
          aie.objectfifo.release @flash_scale_4_3(Produce, 1)
          aie.objectfifo.release @of_7_distribute_4_0(Consume, 1)
          aie.objectfifo.release @of_8_switch_join_4_0(Produce, 1)
        }
      }
      aie.end
    } {link_with = "op0_mha.o"}
    %flash_state_5_3 = aie.buffer(%tile_5_3) {sym_name = "flash_state_5_3"} : memref<256xbf16> 
    %flash_index_5_3 = aie.buffer(%tile_5_3) {sym_name = "flash_index_5_3"} : memref<2xi32> 
    aie.objectfifo @flash_scale_5_3(%tile_5_3, {%tile_5_4}, 2 : i32) : !aie.objectfifo<memref<256xbf16>>  
    %core_5_3 = aie.core(%tile_5_3) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c16 = arith.constant 16 : index
        scf.for %arg1 = %c0_0 to %c16 step %c1_1 {
          %0 = aie.objectfifo.acquire @of_8_switch_join_5_0(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
          %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
          %2 = aie.objectfifo.acquire @of_7_distribute_5_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
          %3 = aie.objectfifo.subview.access %2[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
          %4 = arith.index_cast %arg1 : index to i32
          %c1_i32 = arith.constant 1 : i32
          %5 = arith.muli %4, %c1_i32 : i32
          %c0_i32 = arith.constant 0 : i32
          %6 = arith.addi %c0_i32, %5 : i32
          %c5_i32 = arith.constant 5 : i32
          %c0_2 = arith.constant 0 : index
          %c1_3 = arith.constant 1 : index
          memref.store %6, %flash_index_5_3[%c0_2] : memref<2xi32>
          memref.store %c5_i32, %flash_index_5_3[%c1_3] : memref<2xi32>
          %c64_i32 = arith.constant 64 : i32
          %c0_i32_4 = arith.constant 0 : i32
          %7 = arith.cmpi eq, %6, %c0_i32_4 : i32
          scf.if %7 {
            func.call @op0_init_scale_buffer(%flash_state_5_3, %c64_i32) : (memref<256xbf16>, i32) -> ()
          }
          %cst = arith.constant 1.4453125 : f32
          %8 = arith.truncf %cst : f32 to bf16
          %c64_i32_5 = arith.constant 64 : i32
          %c1024_i32 = arith.constant 1024 : i32
          %c1024_i32_6 = arith.constant 1024 : i32
          %c2_i32 = arith.constant 2 : i32
          func.call @op0_partial_softmax_mode(%3, %1, %flash_state_5_3, %flash_index_5_3, %8, %c64_i32, %c64_i32_5, %c1024_i32, %c1024_i32_6, %c2_i32) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<256xbf16>, memref<2xi32>, bf16, i32, i32, i32, i32, i32) -> ()
          %9 = aie.objectfifo.acquire @flash_scale_5_3(Produce, 1) : !aie.objectfifosubview<memref<256xbf16>>
          %10 = aie.objectfifo.subview.access %9[0] : !aie.objectfifosubview<memref<256xbf16>> -> memref<256xbf16>
          %c256_i32 = arith.constant 256 : i32
          func.call @op0_passThroughLine(%flash_state_5_3, %10, %c256_i32) : (memref<256xbf16>, memref<256xbf16>, i32) -> ()
          aie.objectfifo.release @flash_scale_5_3(Produce, 1)
          aie.objectfifo.release @of_7_distribute_5_0(Consume, 1)
          aie.objectfifo.release @of_8_switch_join_5_0(Produce, 1)
        }
      }
      aie.end
    } {link_with = "op0_mha.o"}
    %flash_state_6_3 = aie.buffer(%tile_6_3) {sym_name = "flash_state_6_3"} : memref<256xbf16> 
    %flash_index_6_3 = aie.buffer(%tile_6_3) {sym_name = "flash_index_6_3"} : memref<2xi32> 
    aie.objectfifo @flash_scale_6_3(%tile_6_3, {%tile_6_4}, 2 : i32) : !aie.objectfifo<memref<256xbf16>>  
    %core_6_3 = aie.core(%tile_6_3) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c16 = arith.constant 16 : index
        scf.for %arg1 = %c0_0 to %c16 step %c1_1 {
          %0 = aie.objectfifo.acquire @of_8_switch_join_6_0(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
          %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
          %2 = aie.objectfifo.acquire @of_7_distribute_6_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
          %3 = aie.objectfifo.subview.access %2[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
          %4 = arith.index_cast %arg1 : index to i32
          %c1_i32 = arith.constant 1 : i32
          %5 = arith.muli %4, %c1_i32 : i32
          %c0_i32 = arith.constant 0 : i32
          %6 = arith.addi %c0_i32, %5 : i32
          %c6_i32 = arith.constant 6 : i32
          %c0_2 = arith.constant 0 : index
          %c1_3 = arith.constant 1 : index
          memref.store %6, %flash_index_6_3[%c0_2] : memref<2xi32>
          memref.store %c6_i32, %flash_index_6_3[%c1_3] : memref<2xi32>
          %c64_i32 = arith.constant 64 : i32
          %c0_i32_4 = arith.constant 0 : i32
          %7 = arith.cmpi eq, %6, %c0_i32_4 : i32
          scf.if %7 {
            func.call @op0_init_scale_buffer(%flash_state_6_3, %c64_i32) : (memref<256xbf16>, i32) -> ()
          }
          %cst = arith.constant 1.4453125 : f32
          %8 = arith.truncf %cst : f32 to bf16
          %c64_i32_5 = arith.constant 64 : i32
          %c1024_i32 = arith.constant 1024 : i32
          %c1024_i32_6 = arith.constant 1024 : i32
          %c2_i32 = arith.constant 2 : i32
          func.call @op0_partial_softmax_mode(%3, %1, %flash_state_6_3, %flash_index_6_3, %8, %c64_i32, %c64_i32_5, %c1024_i32, %c1024_i32_6, %c2_i32) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<256xbf16>, memref<2xi32>, bf16, i32, i32, i32, i32, i32) -> ()
          %9 = aie.objectfifo.acquire @flash_scale_6_3(Produce, 1) : !aie.objectfifosubview<memref<256xbf16>>
          %10 = aie.objectfifo.subview.access %9[0] : !aie.objectfifosubview<memref<256xbf16>> -> memref<256xbf16>
          %c256_i32 = arith.constant 256 : i32
          func.call @op0_passThroughLine(%flash_state_6_3, %10, %c256_i32) : (memref<256xbf16>, memref<256xbf16>, i32) -> ()
          aie.objectfifo.release @flash_scale_6_3(Produce, 1)
          aie.objectfifo.release @of_7_distribute_6_0(Consume, 1)
          aie.objectfifo.release @of_8_switch_join_6_0(Produce, 1)
        }
      }
      aie.end
    } {link_with = "op0_mha.o"}
    %flash_state_7_3 = aie.buffer(%tile_7_3) {sym_name = "flash_state_7_3"} : memref<256xbf16> 
    %flash_index_7_3 = aie.buffer(%tile_7_3) {sym_name = "flash_index_7_3"} : memref<2xi32> 
    aie.objectfifo @flash_scale_7_3(%tile_7_3, {%tile_7_4}, 2 : i32) : !aie.objectfifo<memref<256xbf16>>  
    %core_7_3 = aie.core(%tile_7_3) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c16 = arith.constant 16 : index
        scf.for %arg1 = %c0_0 to %c16 step %c1_1 {
          %0 = aie.objectfifo.acquire @of_8_switch_join_7_0(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
          %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
          %2 = aie.objectfifo.acquire @of_7_distribute_7_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
          %3 = aie.objectfifo.subview.access %2[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
          %4 = arith.index_cast %arg1 : index to i32
          %c1_i32 = arith.constant 1 : i32
          %5 = arith.muli %4, %c1_i32 : i32
          %c0_i32 = arith.constant 0 : i32
          %6 = arith.addi %c0_i32, %5 : i32
          %c7_i32 = arith.constant 7 : i32
          %c0_2 = arith.constant 0 : index
          %c1_3 = arith.constant 1 : index
          memref.store %6, %flash_index_7_3[%c0_2] : memref<2xi32>
          memref.store %c7_i32, %flash_index_7_3[%c1_3] : memref<2xi32>
          %c64_i32 = arith.constant 64 : i32
          %c0_i32_4 = arith.constant 0 : i32
          %7 = arith.cmpi eq, %6, %c0_i32_4 : i32
          scf.if %7 {
            func.call @op0_init_scale_buffer(%flash_state_7_3, %c64_i32) : (memref<256xbf16>, i32) -> ()
          }
          %cst = arith.constant 1.4453125 : f32
          %8 = arith.truncf %cst : f32 to bf16
          %c64_i32_5 = arith.constant 64 : i32
          %c1024_i32 = arith.constant 1024 : i32
          %c1024_i32_6 = arith.constant 1024 : i32
          %c2_i32 = arith.constant 2 : i32
          func.call @op0_partial_softmax_mode(%3, %1, %flash_state_7_3, %flash_index_7_3, %8, %c64_i32, %c64_i32_5, %c1024_i32, %c1024_i32_6, %c2_i32) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<256xbf16>, memref<2xi32>, bf16, i32, i32, i32, i32, i32) -> ()
          %9 = aie.objectfifo.acquire @flash_scale_7_3(Produce, 1) : !aie.objectfifosubview<memref<256xbf16>>
          %10 = aie.objectfifo.subview.access %9[0] : !aie.objectfifosubview<memref<256xbf16>> -> memref<256xbf16>
          %c256_i32 = arith.constant 256 : i32
          func.call @op0_passThroughLine(%flash_state_7_3, %10, %c256_i32) : (memref<256xbf16>, memref<256xbf16>, i32) -> ()
          aie.objectfifo.release @flash_scale_7_3(Produce, 1)
          aie.objectfifo.release @of_7_distribute_7_0(Consume, 1)
          aie.objectfifo.release @of_8_switch_join_7_0(Produce, 1)
        }
      }
      aie.end
    } {link_with = "op0_mha.o"}
    %flash_state_0_5 = aie.buffer(%tile_0_5) {sym_name = "flash_state_0_5"} : memref<256xbf16> 
    %flash_index_0_5 = aie.buffer(%tile_0_5) {sym_name = "flash_index_0_5"} : memref<2xi32> 
    aie.objectfifo @flash_scale_0_5(%tile_0_5, {%tile_0_4}, 2 : i32) : !aie.objectfifo<memref<256xbf16>>  
    %core_0_5 = aie.core(%tile_0_5) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c16 = arith.constant 16 : index
        scf.for %arg1 = %c0_0 to %c16 step %c1_1 {
          %0 = aie.objectfifo.acquire @of_8_switch_join_0_1(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
          %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
          %2 = aie.objectfifo.acquire @of_7_distribute_0_1(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
          %3 = aie.objectfifo.subview.access %2[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
          %4 = arith.index_cast %arg1 : index to i32
          %c1_i32 = arith.constant 1 : i32
          %5 = arith.muli %4, %c1_i32 : i32
          %c0_i32 = arith.constant 0 : i32
          %6 = arith.addi %c0_i32, %5 : i32
          %c8_i32 = arith.constant 8 : i32
          %c0_2 = arith.constant 0 : index
          %c1_3 = arith.constant 1 : index
          memref.store %6, %flash_index_0_5[%c0_2] : memref<2xi32>
          memref.store %c8_i32, %flash_index_0_5[%c1_3] : memref<2xi32>
          %c64_i32 = arith.constant 64 : i32
          %c0_i32_4 = arith.constant 0 : i32
          %7 = arith.cmpi eq, %6, %c0_i32_4 : i32
          scf.if %7 {
            func.call @op0_init_scale_buffer(%flash_state_0_5, %c64_i32) : (memref<256xbf16>, i32) -> ()
          }
          %cst = arith.constant 1.4453125 : f32
          %8 = arith.truncf %cst : f32 to bf16
          %c64_i32_5 = arith.constant 64 : i32
          %c1024_i32 = arith.constant 1024 : i32
          %c1024_i32_6 = arith.constant 1024 : i32
          %c2_i32 = arith.constant 2 : i32
          func.call @op0_partial_softmax_mode(%3, %1, %flash_state_0_5, %flash_index_0_5, %8, %c64_i32, %c64_i32_5, %c1024_i32, %c1024_i32_6, %c2_i32) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<256xbf16>, memref<2xi32>, bf16, i32, i32, i32, i32, i32) -> ()
          %9 = aie.objectfifo.acquire @flash_scale_0_5(Produce, 1) : !aie.objectfifosubview<memref<256xbf16>>
          %10 = aie.objectfifo.subview.access %9[0] : !aie.objectfifosubview<memref<256xbf16>> -> memref<256xbf16>
          %c256_i32 = arith.constant 256 : i32
          func.call @op0_passThroughLine(%flash_state_0_5, %10, %c256_i32) : (memref<256xbf16>, memref<256xbf16>, i32) -> ()
          aie.objectfifo.release @flash_scale_0_5(Produce, 1)
          aie.objectfifo.release @of_7_distribute_0_1(Consume, 1)
          aie.objectfifo.release @of_8_switch_join_0_1(Produce, 1)
        }
      }
      aie.end
    } {link_with = "op0_mha.o"}
    %flash_state_1_5 = aie.buffer(%tile_1_5) {sym_name = "flash_state_1_5"} : memref<256xbf16> 
    %flash_index_1_5 = aie.buffer(%tile_1_5) {sym_name = "flash_index_1_5"} : memref<2xi32> 
    aie.objectfifo @flash_scale_1_5(%tile_1_5, {%tile_1_4}, 2 : i32) : !aie.objectfifo<memref<256xbf16>>  
    %core_1_5 = aie.core(%tile_1_5) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c16 = arith.constant 16 : index
        scf.for %arg1 = %c0_0 to %c16 step %c1_1 {
          %0 = aie.objectfifo.acquire @of_8_switch_join_1_1(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
          %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
          %2 = aie.objectfifo.acquire @of_7_distribute_1_1(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
          %3 = aie.objectfifo.subview.access %2[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
          %4 = arith.index_cast %arg1 : index to i32
          %c1_i32 = arith.constant 1 : i32
          %5 = arith.muli %4, %c1_i32 : i32
          %c0_i32 = arith.constant 0 : i32
          %6 = arith.addi %c0_i32, %5 : i32
          %c9_i32 = arith.constant 9 : i32
          %c0_2 = arith.constant 0 : index
          %c1_3 = arith.constant 1 : index
          memref.store %6, %flash_index_1_5[%c0_2] : memref<2xi32>
          memref.store %c9_i32, %flash_index_1_5[%c1_3] : memref<2xi32>
          %c64_i32 = arith.constant 64 : i32
          %c0_i32_4 = arith.constant 0 : i32
          %7 = arith.cmpi eq, %6, %c0_i32_4 : i32
          scf.if %7 {
            func.call @op0_init_scale_buffer(%flash_state_1_5, %c64_i32) : (memref<256xbf16>, i32) -> ()
          }
          %cst = arith.constant 1.4453125 : f32
          %8 = arith.truncf %cst : f32 to bf16
          %c64_i32_5 = arith.constant 64 : i32
          %c1024_i32 = arith.constant 1024 : i32
          %c1024_i32_6 = arith.constant 1024 : i32
          %c2_i32 = arith.constant 2 : i32
          func.call @op0_partial_softmax_mode(%3, %1, %flash_state_1_5, %flash_index_1_5, %8, %c64_i32, %c64_i32_5, %c1024_i32, %c1024_i32_6, %c2_i32) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<256xbf16>, memref<2xi32>, bf16, i32, i32, i32, i32, i32) -> ()
          %9 = aie.objectfifo.acquire @flash_scale_1_5(Produce, 1) : !aie.objectfifosubview<memref<256xbf16>>
          %10 = aie.objectfifo.subview.access %9[0] : !aie.objectfifosubview<memref<256xbf16>> -> memref<256xbf16>
          %c256_i32 = arith.constant 256 : i32
          func.call @op0_passThroughLine(%flash_state_1_5, %10, %c256_i32) : (memref<256xbf16>, memref<256xbf16>, i32) -> ()
          aie.objectfifo.release @flash_scale_1_5(Produce, 1)
          aie.objectfifo.release @of_7_distribute_1_1(Consume, 1)
          aie.objectfifo.release @of_8_switch_join_1_1(Produce, 1)
        }
      }
      aie.end
    } {link_with = "op0_mha.o"}
    %flash_state_2_5 = aie.buffer(%tile_2_5) {sym_name = "flash_state_2_5"} : memref<256xbf16> 
    %flash_index_2_5 = aie.buffer(%tile_2_5) {sym_name = "flash_index_2_5"} : memref<2xi32> 
    aie.objectfifo @flash_scale_2_5(%tile_2_5, {%tile_2_4}, 2 : i32) : !aie.objectfifo<memref<256xbf16>>  
    %core_2_5 = aie.core(%tile_2_5) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c16 = arith.constant 16 : index
        scf.for %arg1 = %c0_0 to %c16 step %c1_1 {
          %0 = aie.objectfifo.acquire @of_8_switch_join_2_1(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
          %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
          %2 = aie.objectfifo.acquire @of_7_distribute_2_1(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
          %3 = aie.objectfifo.subview.access %2[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
          %4 = arith.index_cast %arg1 : index to i32
          %c1_i32 = arith.constant 1 : i32
          %5 = arith.muli %4, %c1_i32 : i32
          %c0_i32 = arith.constant 0 : i32
          %6 = arith.addi %c0_i32, %5 : i32
          %c10_i32 = arith.constant 10 : i32
          %c0_2 = arith.constant 0 : index
          %c1_3 = arith.constant 1 : index
          memref.store %6, %flash_index_2_5[%c0_2] : memref<2xi32>
          memref.store %c10_i32, %flash_index_2_5[%c1_3] : memref<2xi32>
          %c64_i32 = arith.constant 64 : i32
          %c0_i32_4 = arith.constant 0 : i32
          %7 = arith.cmpi eq, %6, %c0_i32_4 : i32
          scf.if %7 {
            func.call @op0_init_scale_buffer(%flash_state_2_5, %c64_i32) : (memref<256xbf16>, i32) -> ()
          }
          %cst = arith.constant 1.4453125 : f32
          %8 = arith.truncf %cst : f32 to bf16
          %c64_i32_5 = arith.constant 64 : i32
          %c1024_i32 = arith.constant 1024 : i32
          %c1024_i32_6 = arith.constant 1024 : i32
          %c2_i32 = arith.constant 2 : i32
          func.call @op0_partial_softmax_mode(%3, %1, %flash_state_2_5, %flash_index_2_5, %8, %c64_i32, %c64_i32_5, %c1024_i32, %c1024_i32_6, %c2_i32) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<256xbf16>, memref<2xi32>, bf16, i32, i32, i32, i32, i32) -> ()
          %9 = aie.objectfifo.acquire @flash_scale_2_5(Produce, 1) : !aie.objectfifosubview<memref<256xbf16>>
          %10 = aie.objectfifo.subview.access %9[0] : !aie.objectfifosubview<memref<256xbf16>> -> memref<256xbf16>
          %c256_i32 = arith.constant 256 : i32
          func.call @op0_passThroughLine(%flash_state_2_5, %10, %c256_i32) : (memref<256xbf16>, memref<256xbf16>, i32) -> ()
          aie.objectfifo.release @flash_scale_2_5(Produce, 1)
          aie.objectfifo.release @of_7_distribute_2_1(Consume, 1)
          aie.objectfifo.release @of_8_switch_join_2_1(Produce, 1)
        }
      }
      aie.end
    } {link_with = "op0_mha.o"}
    %flash_state_3_5 = aie.buffer(%tile_3_5) {sym_name = "flash_state_3_5"} : memref<256xbf16> 
    %flash_index_3_5 = aie.buffer(%tile_3_5) {sym_name = "flash_index_3_5"} : memref<2xi32> 
    aie.objectfifo @flash_scale_3_5(%tile_3_5, {%tile_3_4}, 2 : i32) : !aie.objectfifo<memref<256xbf16>>  
    %core_3_5 = aie.core(%tile_3_5) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c16 = arith.constant 16 : index
        scf.for %arg1 = %c0_0 to %c16 step %c1_1 {
          %0 = aie.objectfifo.acquire @of_8_switch_join_3_1(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
          %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
          %2 = aie.objectfifo.acquire @of_7_distribute_3_1(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
          %3 = aie.objectfifo.subview.access %2[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
          %4 = arith.index_cast %arg1 : index to i32
          %c1_i32 = arith.constant 1 : i32
          %5 = arith.muli %4, %c1_i32 : i32
          %c0_i32 = arith.constant 0 : i32
          %6 = arith.addi %c0_i32, %5 : i32
          %c11_i32 = arith.constant 11 : i32
          %c0_2 = arith.constant 0 : index
          %c1_3 = arith.constant 1 : index
          memref.store %6, %flash_index_3_5[%c0_2] : memref<2xi32>
          memref.store %c11_i32, %flash_index_3_5[%c1_3] : memref<2xi32>
          %c64_i32 = arith.constant 64 : i32
          %c0_i32_4 = arith.constant 0 : i32
          %7 = arith.cmpi eq, %6, %c0_i32_4 : i32
          scf.if %7 {
            func.call @op0_init_scale_buffer(%flash_state_3_5, %c64_i32) : (memref<256xbf16>, i32) -> ()
          }
          %cst = arith.constant 1.4453125 : f32
          %8 = arith.truncf %cst : f32 to bf16
          %c64_i32_5 = arith.constant 64 : i32
          %c1024_i32 = arith.constant 1024 : i32
          %c1024_i32_6 = arith.constant 1024 : i32
          %c2_i32 = arith.constant 2 : i32
          func.call @op0_partial_softmax_mode(%3, %1, %flash_state_3_5, %flash_index_3_5, %8, %c64_i32, %c64_i32_5, %c1024_i32, %c1024_i32_6, %c2_i32) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<256xbf16>, memref<2xi32>, bf16, i32, i32, i32, i32, i32) -> ()
          %9 = aie.objectfifo.acquire @flash_scale_3_5(Produce, 1) : !aie.objectfifosubview<memref<256xbf16>>
          %10 = aie.objectfifo.subview.access %9[0] : !aie.objectfifosubview<memref<256xbf16>> -> memref<256xbf16>
          %c256_i32 = arith.constant 256 : i32
          func.call @op0_passThroughLine(%flash_state_3_5, %10, %c256_i32) : (memref<256xbf16>, memref<256xbf16>, i32) -> ()
          aie.objectfifo.release @flash_scale_3_5(Produce, 1)
          aie.objectfifo.release @of_7_distribute_3_1(Consume, 1)
          aie.objectfifo.release @of_8_switch_join_3_1(Produce, 1)
        }
      }
      aie.end
    } {link_with = "op0_mha.o"}
    %flash_state_4_5 = aie.buffer(%tile_4_5) {sym_name = "flash_state_4_5"} : memref<256xbf16> 
    %flash_index_4_5 = aie.buffer(%tile_4_5) {sym_name = "flash_index_4_5"} : memref<2xi32> 
    aie.objectfifo @flash_scale_4_5(%tile_4_5, {%tile_4_4}, 2 : i32) : !aie.objectfifo<memref<256xbf16>>  
    %core_4_5 = aie.core(%tile_4_5) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c16 = arith.constant 16 : index
        scf.for %arg1 = %c0_0 to %c16 step %c1_1 {
          %0 = aie.objectfifo.acquire @of_8_switch_join_4_1(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
          %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
          %2 = aie.objectfifo.acquire @of_7_distribute_4_1(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
          %3 = aie.objectfifo.subview.access %2[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
          %4 = arith.index_cast %arg1 : index to i32
          %c1_i32 = arith.constant 1 : i32
          %5 = arith.muli %4, %c1_i32 : i32
          %c0_i32 = arith.constant 0 : i32
          %6 = arith.addi %c0_i32, %5 : i32
          %c12_i32 = arith.constant 12 : i32
          %c0_2 = arith.constant 0 : index
          %c1_3 = arith.constant 1 : index
          memref.store %6, %flash_index_4_5[%c0_2] : memref<2xi32>
          memref.store %c12_i32, %flash_index_4_5[%c1_3] : memref<2xi32>
          %c64_i32 = arith.constant 64 : i32
          %c0_i32_4 = arith.constant 0 : i32
          %7 = arith.cmpi eq, %6, %c0_i32_4 : i32
          scf.if %7 {
            func.call @op0_init_scale_buffer(%flash_state_4_5, %c64_i32) : (memref<256xbf16>, i32) -> ()
          }
          %cst = arith.constant 1.4453125 : f32
          %8 = arith.truncf %cst : f32 to bf16
          %c64_i32_5 = arith.constant 64 : i32
          %c1024_i32 = arith.constant 1024 : i32
          %c1024_i32_6 = arith.constant 1024 : i32
          %c2_i32 = arith.constant 2 : i32
          func.call @op0_partial_softmax_mode(%3, %1, %flash_state_4_5, %flash_index_4_5, %8, %c64_i32, %c64_i32_5, %c1024_i32, %c1024_i32_6, %c2_i32) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<256xbf16>, memref<2xi32>, bf16, i32, i32, i32, i32, i32) -> ()
          %9 = aie.objectfifo.acquire @flash_scale_4_5(Produce, 1) : !aie.objectfifosubview<memref<256xbf16>>
          %10 = aie.objectfifo.subview.access %9[0] : !aie.objectfifosubview<memref<256xbf16>> -> memref<256xbf16>
          %c256_i32 = arith.constant 256 : i32
          func.call @op0_passThroughLine(%flash_state_4_5, %10, %c256_i32) : (memref<256xbf16>, memref<256xbf16>, i32) -> ()
          aie.objectfifo.release @flash_scale_4_5(Produce, 1)
          aie.objectfifo.release @of_7_distribute_4_1(Consume, 1)
          aie.objectfifo.release @of_8_switch_join_4_1(Produce, 1)
        }
      }
      aie.end
    } {link_with = "op0_mha.o"}
    %flash_state_5_5 = aie.buffer(%tile_5_5) {sym_name = "flash_state_5_5"} : memref<256xbf16> 
    %flash_index_5_5 = aie.buffer(%tile_5_5) {sym_name = "flash_index_5_5"} : memref<2xi32> 
    aie.objectfifo @flash_scale_5_5(%tile_5_5, {%tile_5_4}, 2 : i32) : !aie.objectfifo<memref<256xbf16>>  
    %core_5_5 = aie.core(%tile_5_5) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c16 = arith.constant 16 : index
        scf.for %arg1 = %c0_0 to %c16 step %c1_1 {
          %0 = aie.objectfifo.acquire @of_8_switch_join_5_1(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
          %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
          %2 = aie.objectfifo.acquire @of_7_distribute_5_1(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
          %3 = aie.objectfifo.subview.access %2[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
          %4 = arith.index_cast %arg1 : index to i32
          %c1_i32 = arith.constant 1 : i32
          %5 = arith.muli %4, %c1_i32 : i32
          %c0_i32 = arith.constant 0 : i32
          %6 = arith.addi %c0_i32, %5 : i32
          %c13_i32 = arith.constant 13 : i32
          %c0_2 = arith.constant 0 : index
          %c1_3 = arith.constant 1 : index
          memref.store %6, %flash_index_5_5[%c0_2] : memref<2xi32>
          memref.store %c13_i32, %flash_index_5_5[%c1_3] : memref<2xi32>
          %c64_i32 = arith.constant 64 : i32
          %c0_i32_4 = arith.constant 0 : i32
          %7 = arith.cmpi eq, %6, %c0_i32_4 : i32
          scf.if %7 {
            func.call @op0_init_scale_buffer(%flash_state_5_5, %c64_i32) : (memref<256xbf16>, i32) -> ()
          }
          %cst = arith.constant 1.4453125 : f32
          %8 = arith.truncf %cst : f32 to bf16
          %c64_i32_5 = arith.constant 64 : i32
          %c1024_i32 = arith.constant 1024 : i32
          %c1024_i32_6 = arith.constant 1024 : i32
          %c2_i32 = arith.constant 2 : i32
          func.call @op0_partial_softmax_mode(%3, %1, %flash_state_5_5, %flash_index_5_5, %8, %c64_i32, %c64_i32_5, %c1024_i32, %c1024_i32_6, %c2_i32) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<256xbf16>, memref<2xi32>, bf16, i32, i32, i32, i32, i32) -> ()
          %9 = aie.objectfifo.acquire @flash_scale_5_5(Produce, 1) : !aie.objectfifosubview<memref<256xbf16>>
          %10 = aie.objectfifo.subview.access %9[0] : !aie.objectfifosubview<memref<256xbf16>> -> memref<256xbf16>
          %c256_i32 = arith.constant 256 : i32
          func.call @op0_passThroughLine(%flash_state_5_5, %10, %c256_i32) : (memref<256xbf16>, memref<256xbf16>, i32) -> ()
          aie.objectfifo.release @flash_scale_5_5(Produce, 1)
          aie.objectfifo.release @of_7_distribute_5_1(Consume, 1)
          aie.objectfifo.release @of_8_switch_join_5_1(Produce, 1)
        }
      }
      aie.end
    } {link_with = "op0_mha.o"}
    %flash_state_6_5 = aie.buffer(%tile_6_5) {sym_name = "flash_state_6_5"} : memref<256xbf16> 
    %flash_index_6_5 = aie.buffer(%tile_6_5) {sym_name = "flash_index_6_5"} : memref<2xi32> 
    aie.objectfifo @flash_scale_6_5(%tile_6_5, {%tile_6_4}, 2 : i32) : !aie.objectfifo<memref<256xbf16>>  
    %core_6_5 = aie.core(%tile_6_5) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c16 = arith.constant 16 : index
        scf.for %arg1 = %c0_0 to %c16 step %c1_1 {
          %0 = aie.objectfifo.acquire @of_8_switch_join_6_1(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
          %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
          %2 = aie.objectfifo.acquire @of_7_distribute_6_1(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
          %3 = aie.objectfifo.subview.access %2[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
          %4 = arith.index_cast %arg1 : index to i32
          %c1_i32 = arith.constant 1 : i32
          %5 = arith.muli %4, %c1_i32 : i32
          %c0_i32 = arith.constant 0 : i32
          %6 = arith.addi %c0_i32, %5 : i32
          %c14_i32 = arith.constant 14 : i32
          %c0_2 = arith.constant 0 : index
          %c1_3 = arith.constant 1 : index
          memref.store %6, %flash_index_6_5[%c0_2] : memref<2xi32>
          memref.store %c14_i32, %flash_index_6_5[%c1_3] : memref<2xi32>
          %c64_i32 = arith.constant 64 : i32
          %c0_i32_4 = arith.constant 0 : i32
          %7 = arith.cmpi eq, %6, %c0_i32_4 : i32
          scf.if %7 {
            func.call @op0_init_scale_buffer(%flash_state_6_5, %c64_i32) : (memref<256xbf16>, i32) -> ()
          }
          %cst = arith.constant 1.4453125 : f32
          %8 = arith.truncf %cst : f32 to bf16
          %c64_i32_5 = arith.constant 64 : i32
          %c1024_i32 = arith.constant 1024 : i32
          %c1024_i32_6 = arith.constant 1024 : i32
          %c2_i32 = arith.constant 2 : i32
          func.call @op0_partial_softmax_mode(%3, %1, %flash_state_6_5, %flash_index_6_5, %8, %c64_i32, %c64_i32_5, %c1024_i32, %c1024_i32_6, %c2_i32) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<256xbf16>, memref<2xi32>, bf16, i32, i32, i32, i32, i32) -> ()
          %9 = aie.objectfifo.acquire @flash_scale_6_5(Produce, 1) : !aie.objectfifosubview<memref<256xbf16>>
          %10 = aie.objectfifo.subview.access %9[0] : !aie.objectfifosubview<memref<256xbf16>> -> memref<256xbf16>
          %c256_i32 = arith.constant 256 : i32
          func.call @op0_passThroughLine(%flash_state_6_5, %10, %c256_i32) : (memref<256xbf16>, memref<256xbf16>, i32) -> ()
          aie.objectfifo.release @flash_scale_6_5(Produce, 1)
          aie.objectfifo.release @of_7_distribute_6_1(Consume, 1)
          aie.objectfifo.release @of_8_switch_join_6_1(Produce, 1)
        }
      }
      aie.end
    } {link_with = "op0_mha.o"}
    %flash_state_7_5 = aie.buffer(%tile_7_5) {sym_name = "flash_state_7_5"} : memref<256xbf16> 
    %flash_index_7_5 = aie.buffer(%tile_7_5) {sym_name = "flash_index_7_5"} : memref<2xi32> 
    aie.objectfifo @flash_scale_7_5(%tile_7_5, {%tile_7_4}, 2 : i32) : !aie.objectfifo<memref<256xbf16>>  
    %core_7_5 = aie.core(%tile_7_5) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c16 = arith.constant 16 : index
        scf.for %arg1 = %c0_0 to %c16 step %c1_1 {
          %0 = aie.objectfifo.acquire @of_8_switch_join_7_1(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
          %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
          %2 = aie.objectfifo.acquire @of_7_distribute_7_1(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
          %3 = aie.objectfifo.subview.access %2[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
          %4 = arith.index_cast %arg1 : index to i32
          %c1_i32 = arith.constant 1 : i32
          %5 = arith.muli %4, %c1_i32 : i32
          %c0_i32 = arith.constant 0 : i32
          %6 = arith.addi %c0_i32, %5 : i32
          %c15_i32 = arith.constant 15 : i32
          %c0_2 = arith.constant 0 : index
          %c1_3 = arith.constant 1 : index
          memref.store %6, %flash_index_7_5[%c0_2] : memref<2xi32>
          memref.store %c15_i32, %flash_index_7_5[%c1_3] : memref<2xi32>
          %c64_i32 = arith.constant 64 : i32
          %c0_i32_4 = arith.constant 0 : i32
          %7 = arith.cmpi eq, %6, %c0_i32_4 : i32
          scf.if %7 {
            func.call @op0_init_scale_buffer(%flash_state_7_5, %c64_i32) : (memref<256xbf16>, i32) -> ()
          }
          %cst = arith.constant 1.4453125 : f32
          %8 = arith.truncf %cst : f32 to bf16
          %c64_i32_5 = arith.constant 64 : i32
          %c1024_i32 = arith.constant 1024 : i32
          %c1024_i32_6 = arith.constant 1024 : i32
          %c2_i32 = arith.constant 2 : i32
          func.call @op0_partial_softmax_mode(%3, %1, %flash_state_7_5, %flash_index_7_5, %8, %c64_i32, %c64_i32_5, %c1024_i32, %c1024_i32_6, %c2_i32) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<256xbf16>, memref<2xi32>, bf16, i32, i32, i32, i32, i32) -> ()
          %9 = aie.objectfifo.acquire @flash_scale_7_5(Produce, 1) : !aie.objectfifosubview<memref<256xbf16>>
          %10 = aie.objectfifo.subview.access %9[0] : !aie.objectfifosubview<memref<256xbf16>> -> memref<256xbf16>
          %c256_i32 = arith.constant 256 : i32
          func.call @op0_passThroughLine(%flash_state_7_5, %10, %c256_i32) : (memref<256xbf16>, memref<256xbf16>, i32) -> ()
          aie.objectfifo.release @flash_scale_7_5(Produce, 1)
          aie.objectfifo.release @of_7_distribute_7_1(Consume, 1)
          aie.objectfifo.release @of_8_switch_join_7_1(Produce, 1)
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
    aie.objectfifo @of_1_mem(%shim_noc_tile_1_0, {%mem_tile_1_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_2_mem(%shim_noc_tile_3_0, {%mem_tile_3_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_3_unicast_0_0(%mem_tile_0_1 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%tile_0_2}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo.link [@of_0_mem_0] -> [@of_3_unicast_0_0]([] [])
    aie.objectfifo @of_3_unicast_1_0(%mem_tile_1_1 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%tile_1_2}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo.link [@of_0_mem_1] -> [@of_3_unicast_1_0]([] [])
    aie.objectfifo @of_3_unicast_2_0(%mem_tile_2_1 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%tile_2_2}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo.link [@of_0_mem_2] -> [@of_3_unicast_2_0]([] [])
    aie.objectfifo @of_3_unicast_3_0(%mem_tile_3_1 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%tile_3_2}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo.link [@of_0_mem_3] -> [@of_3_unicast_3_0]([] [])
    aie.objectfifo @of_3_unicast_4_0(%mem_tile_4_1 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%tile_4_2}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo.link [@of_0_mem_4] -> [@of_3_unicast_4_0]([] [])
    aie.objectfifo @of_3_unicast_5_0(%mem_tile_5_1 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%tile_5_2}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo.link [@of_0_mem_5] -> [@of_3_unicast_5_0]([] [])
    aie.objectfifo @of_3_unicast_6_0(%mem_tile_6_1 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%tile_6_2}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo.link [@of_0_mem_6] -> [@of_3_unicast_6_0]([] [])
    aie.objectfifo @of_3_unicast_7_0(%mem_tile_7_1 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%tile_7_2}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo.link [@of_0_mem_7] -> [@of_3_unicast_7_0]([] [])
    aie.objectfifo @of_4_broadcast_0_0(%mem_tile_1_1 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%tile_0_2, %tile_1_2, %tile_2_2, %tile_3_2, %tile_4_2, %tile_5_2, %tile_6_2, %tile_7_2}, [2 : i32, 2 : i32, 2 : i32, 2 : i32, 2 : i32, 2 : i32, 2 : i32, 2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo.link [@of_1_mem] -> [@of_4_broadcast_0_0]([] [])
    aie.objectfifo @of_5_broadcast_0_0(%mem_tile_3_1 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%tile_0_4, %tile_1_4, %tile_2_4, %tile_3_4, %tile_4_4, %tile_5_4, %tile_6_4, %tile_7_4}, [2 : i32, 2 : i32, 2 : i32, 2 : i32, 2 : i32, 2 : i32, 2 : i32, 2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo.link [@of_2_mem] -> [@of_5_broadcast_0_0]([] [])
    aie.objectfifo @of_6_unicast_0(%tile_0_2, {%mem_tile_0_1}, [1 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_6_unicast_0_relay_1(%tile_0_2, {%mem_tile_0_1}, [1 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_6_unicast_1(%tile_1_2, {%mem_tile_1_1}, [1 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_6_unicast_1_relay_1(%tile_1_2, {%mem_tile_1_1}, [1 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_6_unicast_2(%tile_2_2, {%mem_tile_2_1}, [1 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_6_unicast_2_relay_1(%tile_2_2, {%mem_tile_2_1}, [1 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_6_unicast_3(%tile_3_2, {%mem_tile_3_1}, [1 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_6_unicast_3_relay_1(%tile_3_2, {%mem_tile_3_1}, [1 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_6_unicast_4(%tile_4_2, {%mem_tile_4_1}, [1 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_6_unicast_4_relay_1(%tile_4_2, {%mem_tile_4_1}, [1 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_6_unicast_5(%tile_5_2, {%mem_tile_5_1}, [1 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_6_unicast_5_relay_1(%tile_5_2, {%mem_tile_5_1}, [1 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_6_unicast_6(%tile_6_2, {%mem_tile_6_1}, [1 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_6_unicast_6_relay_1(%tile_6_2, {%mem_tile_6_1}, [1 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_6_unicast_7(%tile_7_2, {%mem_tile_7_1}, [1 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_6_unicast_7_relay_1(%tile_7_2, {%mem_tile_7_1}, [1 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_7_distribute_0_0(%mem_tile_0_1 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%tile_0_3}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_7_distribute_0_1(%mem_tile_0_1 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%tile_0_5}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo.link [@of_6_unicast_0] -> [@of_7_distribute_0_0]([] [])
    aie.objectfifo.link [@of_6_unicast_0_relay_1] -> [@of_7_distribute_0_1]([] [])
    aie.objectfifo @of_7_distribute_1_0(%mem_tile_1_1 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%tile_1_3}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_7_distribute_1_1(%mem_tile_1_1 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%tile_1_5}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo.link [@of_6_unicast_1] -> [@of_7_distribute_1_0]([] [])
    aie.objectfifo.link [@of_6_unicast_1_relay_1] -> [@of_7_distribute_1_1]([] [])
    aie.objectfifo @of_7_distribute_2_0(%mem_tile_2_1 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%tile_2_3}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_7_distribute_2_1(%mem_tile_2_1 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%tile_2_5}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo.link [@of_6_unicast_2] -> [@of_7_distribute_2_0]([] [])
    aie.objectfifo.link [@of_6_unicast_2_relay_1] -> [@of_7_distribute_2_1]([] [])
    aie.objectfifo @of_7_distribute_3_0(%mem_tile_3_1 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%tile_3_3}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_7_distribute_3_1(%mem_tile_3_1 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%tile_3_5}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo.link [@of_6_unicast_3] -> [@of_7_distribute_3_0]([] [])
    aie.objectfifo.link [@of_6_unicast_3_relay_1] -> [@of_7_distribute_3_1]([] [])
    aie.objectfifo @of_7_distribute_4_0(%mem_tile_4_1 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%tile_4_3}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_7_distribute_4_1(%mem_tile_4_1 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%tile_4_5}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo.link [@of_6_unicast_4] -> [@of_7_distribute_4_0]([] [])
    aie.objectfifo.link [@of_6_unicast_4_relay_1] -> [@of_7_distribute_4_1]([] [])
    aie.objectfifo @of_7_distribute_5_0(%mem_tile_5_1 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%tile_5_3}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_7_distribute_5_1(%mem_tile_5_1 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%tile_5_5}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo.link [@of_6_unicast_5] -> [@of_7_distribute_5_0]([] [])
    aie.objectfifo.link [@of_6_unicast_5_relay_1] -> [@of_7_distribute_5_1]([] [])
    aie.objectfifo @of_7_distribute_6_0(%mem_tile_6_1 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%tile_6_3}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_7_distribute_6_1(%mem_tile_6_1 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%tile_6_5}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo.link [@of_6_unicast_6] -> [@of_7_distribute_6_0]([] [])
    aie.objectfifo.link [@of_6_unicast_6_relay_1] -> [@of_7_distribute_6_1]([] [])
    aie.objectfifo @of_7_distribute_7_0(%mem_tile_7_1 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%tile_7_3}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_7_distribute_7_1(%mem_tile_7_1 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%tile_7_5}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo.link [@of_6_unicast_7] -> [@of_7_distribute_7_0]([] [])
    aie.objectfifo.link [@of_6_unicast_7_relay_1] -> [@of_7_distribute_7_1]([] [])
    aie.objectfifo @of_8_switch_join_0_0(%tile_0_3, {%tile_0_4}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_8_switch_join_0_1(%tile_0_5, {%tile_0_4}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_8_switch_join_1_0(%tile_1_3, {%tile_1_4}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_8_switch_join_1_1(%tile_1_5, {%tile_1_4}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_8_switch_join_2_0(%tile_2_3, {%tile_2_4}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_8_switch_join_2_1(%tile_2_5, {%tile_2_4}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_8_switch_join_3_0(%tile_3_3, {%tile_3_4}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_8_switch_join_3_1(%tile_3_5, {%tile_3_4}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_8_switch_join_4_0(%tile_4_3, {%tile_4_4}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_8_switch_join_4_1(%tile_4_5, {%tile_4_4}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_8_switch_join_5_0(%tile_5_3, {%tile_5_4}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_8_switch_join_5_1(%tile_5_5, {%tile_5_4}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_8_switch_join_6_0(%tile_6_3, {%tile_6_4}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_8_switch_join_6_1(%tile_6_5, {%tile_6_4}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_8_switch_join_7_0(%tile_7_3, {%tile_7_4}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_8_switch_join_7_1(%tile_7_5, {%tile_7_4}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_9_unicast_0(%tile_0_4, {%mem_tile_0_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_9_unicast_1(%tile_1_4, {%mem_tile_1_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_9_unicast_2(%tile_2_4, {%mem_tile_2_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_9_unicast_3(%tile_3_4, {%mem_tile_3_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_9_unicast_4(%tile_4_4, {%mem_tile_4_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_9_unicast_5(%tile_5_4, {%mem_tile_5_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_9_unicast_6(%tile_6_4, {%mem_tile_6_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_9_unicast_7(%tile_7_4, {%mem_tile_7_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_10_mem_0(%mem_tile_0_1 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%shim_noc_tile_0_0}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<2x64x64xbf16>>  
    aie.objectfifo.link [@of_9_unicast_0] -> [@of_10_mem_0]([] [])
    aie.objectfifo @of_10_mem_1(%mem_tile_1_1 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%shim_noc_tile_1_0}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<2x64x64xbf16>>  
    aie.objectfifo.link [@of_9_unicast_1] -> [@of_10_mem_1]([] [])
    aie.objectfifo @of_10_mem_2(%mem_tile_2_1 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%shim_noc_tile_2_0}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<2x64x64xbf16>>  
    aie.objectfifo.link [@of_9_unicast_2] -> [@of_10_mem_2]([] [])
    aie.objectfifo @of_10_mem_3(%mem_tile_3_1 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%shim_noc_tile_3_0}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<2x64x64xbf16>>  
    aie.objectfifo.link [@of_9_unicast_3] -> [@of_10_mem_3]([] [])
    aie.objectfifo @of_10_mem_4(%mem_tile_4_1 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%shim_noc_tile_4_0}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<2x64x64xbf16>>  
    aie.objectfifo.link [@of_9_unicast_4] -> [@of_10_mem_4]([] [])
    aie.objectfifo @of_10_mem_5(%mem_tile_5_1 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%shim_noc_tile_5_0}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<2x64x64xbf16>>  
    aie.objectfifo.link [@of_9_unicast_5] -> [@of_10_mem_5]([] [])
    aie.objectfifo @of_10_mem_6(%mem_tile_6_1 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%shim_noc_tile_6_0}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<2x64x64xbf16>>  
    aie.objectfifo.link [@of_9_unicast_6] -> [@of_10_mem_6]([] [])
    aie.objectfifo @of_10_mem_7(%mem_tile_7_1 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%shim_noc_tile_7_0}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<2x64x64xbf16>>  
    aie.objectfifo.link [@of_9_unicast_7] -> [@of_10_mem_7]([] [])
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
    aie.runtime_sequence(%arg0: memref<6291456xbf16>, %arg1: memref<2097152xbf16>, %arg2: memref<1xbf16>) {
      aiex.configure @op0__MHAStreamGroup {
        %subview = memref.subview %arg0[0] [65536] [1] : memref<6291456xbf16> to memref<65536xbf16>
        %reinterpret_cast = memref.reinterpret_cast %subview to offset: [0], sizes: [1024, 64], strides: [64, 1] : memref<65536xbf16> to memref<1024x64xbf16>
        %subview_0 = memref.subview %arg0[2097152] [65536] [1] : memref<6291456xbf16> to memref<65536xbf16, strided<[1], offset: 2097152>>
        %reinterpret_cast_1 = memref.reinterpret_cast %subview_0 to offset: [0], sizes: [64, 1024], strides: [1024, 1] : memref<65536xbf16, strided<[1], offset: 2097152>> to memref<64x1024xbf16>
        %subview_2 = memref.subview %arg0[4194304] [65536] [1] : memref<6291456xbf16> to memref<65536xbf16, strided<[1], offset: 4194304>>
        %reinterpret_cast_3 = memref.reinterpret_cast %subview_2 to offset: [0], sizes: [1024, 64], strides: [64, 1] : memref<65536xbf16, strided<[1], offset: 4194304>> to memref<1024x64xbf16>
        %subview_4 = memref.subview %arg1[0] [65536] [1] : memref<2097152xbf16> to memref<65536xbf16>
        %reinterpret_cast_5 = memref.reinterpret_cast %subview_4 to offset: [0], sizes: [1024, 64], strides: [64, 1] : memref<65536xbf16> to memref<1024x64xbf16>
        aiex.run @sequence(%reinterpret_cast, %reinterpret_cast_1, %reinterpret_cast_3, %reinterpret_cast_5) : (memref<1024x64xbf16>, memref<64x1024xbf16>, memref<1024x64xbf16>, memref<1024x64xbf16>)
        %subview_6 = memref.subview %arg0[65536] [65536] [1] : memref<6291456xbf16> to memref<65536xbf16, strided<[1], offset: 65536>>
        %reinterpret_cast_7 = memref.reinterpret_cast %subview_6 to offset: [0], sizes: [1024, 64], strides: [64, 1] : memref<65536xbf16, strided<[1], offset: 65536>> to memref<1024x64xbf16>
        %subview_8 = memref.subview %arg0[2162688] [65536] [1] : memref<6291456xbf16> to memref<65536xbf16, strided<[1], offset: 2162688>>
        %reinterpret_cast_9 = memref.reinterpret_cast %subview_8 to offset: [0], sizes: [64, 1024], strides: [1024, 1] : memref<65536xbf16, strided<[1], offset: 2162688>> to memref<64x1024xbf16>
        %subview_10 = memref.subview %arg0[4259840] [65536] [1] : memref<6291456xbf16> to memref<65536xbf16, strided<[1], offset: 4259840>>
        %reinterpret_cast_11 = memref.reinterpret_cast %subview_10 to offset: [0], sizes: [1024, 64], strides: [64, 1] : memref<65536xbf16, strided<[1], offset: 4259840>> to memref<1024x64xbf16>
        %subview_12 = memref.subview %arg1[65536] [65536] [1] : memref<2097152xbf16> to memref<65536xbf16, strided<[1], offset: 65536>>
        %reinterpret_cast_13 = memref.reinterpret_cast %subview_12 to offset: [0], sizes: [1024, 64], strides: [64, 1] : memref<65536xbf16, strided<[1], offset: 65536>> to memref<1024x64xbf16>
        aiex.run @sequence(%reinterpret_cast_7, %reinterpret_cast_9, %reinterpret_cast_11, %reinterpret_cast_13) : (memref<1024x64xbf16>, memref<64x1024xbf16>, memref<1024x64xbf16>, memref<1024x64xbf16>)
        %subview_14 = memref.subview %arg0[131072] [65536] [1] : memref<6291456xbf16> to memref<65536xbf16, strided<[1], offset: 131072>>
        %reinterpret_cast_15 = memref.reinterpret_cast %subview_14 to offset: [0], sizes: [1024, 64], strides: [64, 1] : memref<65536xbf16, strided<[1], offset: 131072>> to memref<1024x64xbf16>
        %subview_16 = memref.subview %arg0[2228224] [65536] [1] : memref<6291456xbf16> to memref<65536xbf16, strided<[1], offset: 2228224>>
        %reinterpret_cast_17 = memref.reinterpret_cast %subview_16 to offset: [0], sizes: [64, 1024], strides: [1024, 1] : memref<65536xbf16, strided<[1], offset: 2228224>> to memref<64x1024xbf16>
        %subview_18 = memref.subview %arg0[4325376] [65536] [1] : memref<6291456xbf16> to memref<65536xbf16, strided<[1], offset: 4325376>>
        %reinterpret_cast_19 = memref.reinterpret_cast %subview_18 to offset: [0], sizes: [1024, 64], strides: [64, 1] : memref<65536xbf16, strided<[1], offset: 4325376>> to memref<1024x64xbf16>
        %subview_20 = memref.subview %arg1[131072] [65536] [1] : memref<2097152xbf16> to memref<65536xbf16, strided<[1], offset: 131072>>
        %reinterpret_cast_21 = memref.reinterpret_cast %subview_20 to offset: [0], sizes: [1024, 64], strides: [64, 1] : memref<65536xbf16, strided<[1], offset: 131072>> to memref<1024x64xbf16>
        aiex.run @sequence(%reinterpret_cast_15, %reinterpret_cast_17, %reinterpret_cast_19, %reinterpret_cast_21) : (memref<1024x64xbf16>, memref<64x1024xbf16>, memref<1024x64xbf16>, memref<1024x64xbf16>)
        %subview_22 = memref.subview %arg0[196608] [65536] [1] : memref<6291456xbf16> to memref<65536xbf16, strided<[1], offset: 196608>>
        %reinterpret_cast_23 = memref.reinterpret_cast %subview_22 to offset: [0], sizes: [1024, 64], strides: [64, 1] : memref<65536xbf16, strided<[1], offset: 196608>> to memref<1024x64xbf16>
        %subview_24 = memref.subview %arg0[2293760] [65536] [1] : memref<6291456xbf16> to memref<65536xbf16, strided<[1], offset: 2293760>>
        %reinterpret_cast_25 = memref.reinterpret_cast %subview_24 to offset: [0], sizes: [64, 1024], strides: [1024, 1] : memref<65536xbf16, strided<[1], offset: 2293760>> to memref<64x1024xbf16>
        %subview_26 = memref.subview %arg0[4390912] [65536] [1] : memref<6291456xbf16> to memref<65536xbf16, strided<[1], offset: 4390912>>
        %reinterpret_cast_27 = memref.reinterpret_cast %subview_26 to offset: [0], sizes: [1024, 64], strides: [64, 1] : memref<65536xbf16, strided<[1], offset: 4390912>> to memref<1024x64xbf16>
        %subview_28 = memref.subview %arg1[196608] [65536] [1] : memref<2097152xbf16> to memref<65536xbf16, strided<[1], offset: 196608>>
        %reinterpret_cast_29 = memref.reinterpret_cast %subview_28 to offset: [0], sizes: [1024, 64], strides: [64, 1] : memref<65536xbf16, strided<[1], offset: 196608>> to memref<1024x64xbf16>
        aiex.run @sequence(%reinterpret_cast_23, %reinterpret_cast_25, %reinterpret_cast_27, %reinterpret_cast_29) : (memref<1024x64xbf16>, memref<64x1024xbf16>, memref<1024x64xbf16>, memref<1024x64xbf16>)
        %subview_30 = memref.subview %arg0[262144] [65536] [1] : memref<6291456xbf16> to memref<65536xbf16, strided<[1], offset: 262144>>
        %reinterpret_cast_31 = memref.reinterpret_cast %subview_30 to offset: [0], sizes: [1024, 64], strides: [64, 1] : memref<65536xbf16, strided<[1], offset: 262144>> to memref<1024x64xbf16>
        %subview_32 = memref.subview %arg0[2359296] [65536] [1] : memref<6291456xbf16> to memref<65536xbf16, strided<[1], offset: 2359296>>
        %reinterpret_cast_33 = memref.reinterpret_cast %subview_32 to offset: [0], sizes: [64, 1024], strides: [1024, 1] : memref<65536xbf16, strided<[1], offset: 2359296>> to memref<64x1024xbf16>
        %subview_34 = memref.subview %arg0[4456448] [65536] [1] : memref<6291456xbf16> to memref<65536xbf16, strided<[1], offset: 4456448>>
        %reinterpret_cast_35 = memref.reinterpret_cast %subview_34 to offset: [0], sizes: [1024, 64], strides: [64, 1] : memref<65536xbf16, strided<[1], offset: 4456448>> to memref<1024x64xbf16>
        %subview_36 = memref.subview %arg1[262144] [65536] [1] : memref<2097152xbf16> to memref<65536xbf16, strided<[1], offset: 262144>>
        %reinterpret_cast_37 = memref.reinterpret_cast %subview_36 to offset: [0], sizes: [1024, 64], strides: [64, 1] : memref<65536xbf16, strided<[1], offset: 262144>> to memref<1024x64xbf16>
        aiex.run @sequence(%reinterpret_cast_31, %reinterpret_cast_33, %reinterpret_cast_35, %reinterpret_cast_37) : (memref<1024x64xbf16>, memref<64x1024xbf16>, memref<1024x64xbf16>, memref<1024x64xbf16>)
        %subview_38 = memref.subview %arg0[327680] [65536] [1] : memref<6291456xbf16> to memref<65536xbf16, strided<[1], offset: 327680>>
        %reinterpret_cast_39 = memref.reinterpret_cast %subview_38 to offset: [0], sizes: [1024, 64], strides: [64, 1] : memref<65536xbf16, strided<[1], offset: 327680>> to memref<1024x64xbf16>
        %subview_40 = memref.subview %arg0[2424832] [65536] [1] : memref<6291456xbf16> to memref<65536xbf16, strided<[1], offset: 2424832>>
        %reinterpret_cast_41 = memref.reinterpret_cast %subview_40 to offset: [0], sizes: [64, 1024], strides: [1024, 1] : memref<65536xbf16, strided<[1], offset: 2424832>> to memref<64x1024xbf16>
        %subview_42 = memref.subview %arg0[4521984] [65536] [1] : memref<6291456xbf16> to memref<65536xbf16, strided<[1], offset: 4521984>>
        %reinterpret_cast_43 = memref.reinterpret_cast %subview_42 to offset: [0], sizes: [1024, 64], strides: [64, 1] : memref<65536xbf16, strided<[1], offset: 4521984>> to memref<1024x64xbf16>
        %subview_44 = memref.subview %arg1[327680] [65536] [1] : memref<2097152xbf16> to memref<65536xbf16, strided<[1], offset: 327680>>
        %reinterpret_cast_45 = memref.reinterpret_cast %subview_44 to offset: [0], sizes: [1024, 64], strides: [64, 1] : memref<65536xbf16, strided<[1], offset: 327680>> to memref<1024x64xbf16>
        aiex.run @sequence(%reinterpret_cast_39, %reinterpret_cast_41, %reinterpret_cast_43, %reinterpret_cast_45) : (memref<1024x64xbf16>, memref<64x1024xbf16>, memref<1024x64xbf16>, memref<1024x64xbf16>)
        %subview_46 = memref.subview %arg0[393216] [65536] [1] : memref<6291456xbf16> to memref<65536xbf16, strided<[1], offset: 393216>>
        %reinterpret_cast_47 = memref.reinterpret_cast %subview_46 to offset: [0], sizes: [1024, 64], strides: [64, 1] : memref<65536xbf16, strided<[1], offset: 393216>> to memref<1024x64xbf16>
        %subview_48 = memref.subview %arg0[2490368] [65536] [1] : memref<6291456xbf16> to memref<65536xbf16, strided<[1], offset: 2490368>>
        %reinterpret_cast_49 = memref.reinterpret_cast %subview_48 to offset: [0], sizes: [64, 1024], strides: [1024, 1] : memref<65536xbf16, strided<[1], offset: 2490368>> to memref<64x1024xbf16>
        %subview_50 = memref.subview %arg0[4587520] [65536] [1] : memref<6291456xbf16> to memref<65536xbf16, strided<[1], offset: 4587520>>
        %reinterpret_cast_51 = memref.reinterpret_cast %subview_50 to offset: [0], sizes: [1024, 64], strides: [64, 1] : memref<65536xbf16, strided<[1], offset: 4587520>> to memref<1024x64xbf16>
        %subview_52 = memref.subview %arg1[393216] [65536] [1] : memref<2097152xbf16> to memref<65536xbf16, strided<[1], offset: 393216>>
        %reinterpret_cast_53 = memref.reinterpret_cast %subview_52 to offset: [0], sizes: [1024, 64], strides: [64, 1] : memref<65536xbf16, strided<[1], offset: 393216>> to memref<1024x64xbf16>
        aiex.run @sequence(%reinterpret_cast_47, %reinterpret_cast_49, %reinterpret_cast_51, %reinterpret_cast_53) : (memref<1024x64xbf16>, memref<64x1024xbf16>, memref<1024x64xbf16>, memref<1024x64xbf16>)
        %subview_54 = memref.subview %arg0[458752] [65536] [1] : memref<6291456xbf16> to memref<65536xbf16, strided<[1], offset: 458752>>
        %reinterpret_cast_55 = memref.reinterpret_cast %subview_54 to offset: [0], sizes: [1024, 64], strides: [64, 1] : memref<65536xbf16, strided<[1], offset: 458752>> to memref<1024x64xbf16>
        %subview_56 = memref.subview %arg0[2555904] [65536] [1] : memref<6291456xbf16> to memref<65536xbf16, strided<[1], offset: 2555904>>
        %reinterpret_cast_57 = memref.reinterpret_cast %subview_56 to offset: [0], sizes: [64, 1024], strides: [1024, 1] : memref<65536xbf16, strided<[1], offset: 2555904>> to memref<64x1024xbf16>
        %subview_58 = memref.subview %arg0[4653056] [65536] [1] : memref<6291456xbf16> to memref<65536xbf16, strided<[1], offset: 4653056>>
        %reinterpret_cast_59 = memref.reinterpret_cast %subview_58 to offset: [0], sizes: [1024, 64], strides: [64, 1] : memref<65536xbf16, strided<[1], offset: 4653056>> to memref<1024x64xbf16>
        %subview_60 = memref.subview %arg1[458752] [65536] [1] : memref<2097152xbf16> to memref<65536xbf16, strided<[1], offset: 458752>>
        %reinterpret_cast_61 = memref.reinterpret_cast %subview_60 to offset: [0], sizes: [1024, 64], strides: [64, 1] : memref<65536xbf16, strided<[1], offset: 458752>> to memref<1024x64xbf16>
        aiex.run @sequence(%reinterpret_cast_55, %reinterpret_cast_57, %reinterpret_cast_59, %reinterpret_cast_61) : (memref<1024x64xbf16>, memref<64x1024xbf16>, memref<1024x64xbf16>, memref<1024x64xbf16>)
        %subview_62 = memref.subview %arg0[524288] [65536] [1] : memref<6291456xbf16> to memref<65536xbf16, strided<[1], offset: 524288>>
        %reinterpret_cast_63 = memref.reinterpret_cast %subview_62 to offset: [0], sizes: [1024, 64], strides: [64, 1] : memref<65536xbf16, strided<[1], offset: 524288>> to memref<1024x64xbf16>
        %subview_64 = memref.subview %arg0[2621440] [65536] [1] : memref<6291456xbf16> to memref<65536xbf16, strided<[1], offset: 2621440>>
        %reinterpret_cast_65 = memref.reinterpret_cast %subview_64 to offset: [0], sizes: [64, 1024], strides: [1024, 1] : memref<65536xbf16, strided<[1], offset: 2621440>> to memref<64x1024xbf16>
        %subview_66 = memref.subview %arg0[4718592] [65536] [1] : memref<6291456xbf16> to memref<65536xbf16, strided<[1], offset: 4718592>>
        %reinterpret_cast_67 = memref.reinterpret_cast %subview_66 to offset: [0], sizes: [1024, 64], strides: [64, 1] : memref<65536xbf16, strided<[1], offset: 4718592>> to memref<1024x64xbf16>
        %subview_68 = memref.subview %arg1[524288] [65536] [1] : memref<2097152xbf16> to memref<65536xbf16, strided<[1], offset: 524288>>
        %reinterpret_cast_69 = memref.reinterpret_cast %subview_68 to offset: [0], sizes: [1024, 64], strides: [64, 1] : memref<65536xbf16, strided<[1], offset: 524288>> to memref<1024x64xbf16>
        aiex.run @sequence(%reinterpret_cast_63, %reinterpret_cast_65, %reinterpret_cast_67, %reinterpret_cast_69) : (memref<1024x64xbf16>, memref<64x1024xbf16>, memref<1024x64xbf16>, memref<1024x64xbf16>)
        %subview_70 = memref.subview %arg0[589824] [65536] [1] : memref<6291456xbf16> to memref<65536xbf16, strided<[1], offset: 589824>>
        %reinterpret_cast_71 = memref.reinterpret_cast %subview_70 to offset: [0], sizes: [1024, 64], strides: [64, 1] : memref<65536xbf16, strided<[1], offset: 589824>> to memref<1024x64xbf16>
        %subview_72 = memref.subview %arg0[2686976] [65536] [1] : memref<6291456xbf16> to memref<65536xbf16, strided<[1], offset: 2686976>>
        %reinterpret_cast_73 = memref.reinterpret_cast %subview_72 to offset: [0], sizes: [64, 1024], strides: [1024, 1] : memref<65536xbf16, strided<[1], offset: 2686976>> to memref<64x1024xbf16>
        %subview_74 = memref.subview %arg0[4784128] [65536] [1] : memref<6291456xbf16> to memref<65536xbf16, strided<[1], offset: 4784128>>
        %reinterpret_cast_75 = memref.reinterpret_cast %subview_74 to offset: [0], sizes: [1024, 64], strides: [64, 1] : memref<65536xbf16, strided<[1], offset: 4784128>> to memref<1024x64xbf16>
        %subview_76 = memref.subview %arg1[589824] [65536] [1] : memref<2097152xbf16> to memref<65536xbf16, strided<[1], offset: 589824>>
        %reinterpret_cast_77 = memref.reinterpret_cast %subview_76 to offset: [0], sizes: [1024, 64], strides: [64, 1] : memref<65536xbf16, strided<[1], offset: 589824>> to memref<1024x64xbf16>
        aiex.run @sequence(%reinterpret_cast_71, %reinterpret_cast_73, %reinterpret_cast_75, %reinterpret_cast_77) : (memref<1024x64xbf16>, memref<64x1024xbf16>, memref<1024x64xbf16>, memref<1024x64xbf16>)
        %subview_78 = memref.subview %arg0[655360] [65536] [1] : memref<6291456xbf16> to memref<65536xbf16, strided<[1], offset: 655360>>
        %reinterpret_cast_79 = memref.reinterpret_cast %subview_78 to offset: [0], sizes: [1024, 64], strides: [64, 1] : memref<65536xbf16, strided<[1], offset: 655360>> to memref<1024x64xbf16>
        %subview_80 = memref.subview %arg0[2752512] [65536] [1] : memref<6291456xbf16> to memref<65536xbf16, strided<[1], offset: 2752512>>
        %reinterpret_cast_81 = memref.reinterpret_cast %subview_80 to offset: [0], sizes: [64, 1024], strides: [1024, 1] : memref<65536xbf16, strided<[1], offset: 2752512>> to memref<64x1024xbf16>
        %subview_82 = memref.subview %arg0[4849664] [65536] [1] : memref<6291456xbf16> to memref<65536xbf16, strided<[1], offset: 4849664>>
        %reinterpret_cast_83 = memref.reinterpret_cast %subview_82 to offset: [0], sizes: [1024, 64], strides: [64, 1] : memref<65536xbf16, strided<[1], offset: 4849664>> to memref<1024x64xbf16>
        %subview_84 = memref.subview %arg1[655360] [65536] [1] : memref<2097152xbf16> to memref<65536xbf16, strided<[1], offset: 655360>>
        %reinterpret_cast_85 = memref.reinterpret_cast %subview_84 to offset: [0], sizes: [1024, 64], strides: [64, 1] : memref<65536xbf16, strided<[1], offset: 655360>> to memref<1024x64xbf16>
        aiex.run @sequence(%reinterpret_cast_79, %reinterpret_cast_81, %reinterpret_cast_83, %reinterpret_cast_85) : (memref<1024x64xbf16>, memref<64x1024xbf16>, memref<1024x64xbf16>, memref<1024x64xbf16>)
        %subview_86 = memref.subview %arg0[720896] [65536] [1] : memref<6291456xbf16> to memref<65536xbf16, strided<[1], offset: 720896>>
        %reinterpret_cast_87 = memref.reinterpret_cast %subview_86 to offset: [0], sizes: [1024, 64], strides: [64, 1] : memref<65536xbf16, strided<[1], offset: 720896>> to memref<1024x64xbf16>
        %subview_88 = memref.subview %arg0[2818048] [65536] [1] : memref<6291456xbf16> to memref<65536xbf16, strided<[1], offset: 2818048>>
        %reinterpret_cast_89 = memref.reinterpret_cast %subview_88 to offset: [0], sizes: [64, 1024], strides: [1024, 1] : memref<65536xbf16, strided<[1], offset: 2818048>> to memref<64x1024xbf16>
        %subview_90 = memref.subview %arg0[4915200] [65536] [1] : memref<6291456xbf16> to memref<65536xbf16, strided<[1], offset: 4915200>>
        %reinterpret_cast_91 = memref.reinterpret_cast %subview_90 to offset: [0], sizes: [1024, 64], strides: [64, 1] : memref<65536xbf16, strided<[1], offset: 4915200>> to memref<1024x64xbf16>
        %subview_92 = memref.subview %arg1[720896] [65536] [1] : memref<2097152xbf16> to memref<65536xbf16, strided<[1], offset: 720896>>
        %reinterpret_cast_93 = memref.reinterpret_cast %subview_92 to offset: [0], sizes: [1024, 64], strides: [64, 1] : memref<65536xbf16, strided<[1], offset: 720896>> to memref<1024x64xbf16>
        aiex.run @sequence(%reinterpret_cast_87, %reinterpret_cast_89, %reinterpret_cast_91, %reinterpret_cast_93) : (memref<1024x64xbf16>, memref<64x1024xbf16>, memref<1024x64xbf16>, memref<1024x64xbf16>)
        %subview_94 = memref.subview %arg0[786432] [65536] [1] : memref<6291456xbf16> to memref<65536xbf16, strided<[1], offset: 786432>>
        %reinterpret_cast_95 = memref.reinterpret_cast %subview_94 to offset: [0], sizes: [1024, 64], strides: [64, 1] : memref<65536xbf16, strided<[1], offset: 786432>> to memref<1024x64xbf16>
        %subview_96 = memref.subview %arg0[2883584] [65536] [1] : memref<6291456xbf16> to memref<65536xbf16, strided<[1], offset: 2883584>>
        %reinterpret_cast_97 = memref.reinterpret_cast %subview_96 to offset: [0], sizes: [64, 1024], strides: [1024, 1] : memref<65536xbf16, strided<[1], offset: 2883584>> to memref<64x1024xbf16>
        %subview_98 = memref.subview %arg0[4980736] [65536] [1] : memref<6291456xbf16> to memref<65536xbf16, strided<[1], offset: 4980736>>
        %reinterpret_cast_99 = memref.reinterpret_cast %subview_98 to offset: [0], sizes: [1024, 64], strides: [64, 1] : memref<65536xbf16, strided<[1], offset: 4980736>> to memref<1024x64xbf16>
        %subview_100 = memref.subview %arg1[786432] [65536] [1] : memref<2097152xbf16> to memref<65536xbf16, strided<[1], offset: 786432>>
        %reinterpret_cast_101 = memref.reinterpret_cast %subview_100 to offset: [0], sizes: [1024, 64], strides: [64, 1] : memref<65536xbf16, strided<[1], offset: 786432>> to memref<1024x64xbf16>
        aiex.run @sequence(%reinterpret_cast_95, %reinterpret_cast_97, %reinterpret_cast_99, %reinterpret_cast_101) : (memref<1024x64xbf16>, memref<64x1024xbf16>, memref<1024x64xbf16>, memref<1024x64xbf16>)
        %subview_102 = memref.subview %arg0[851968] [65536] [1] : memref<6291456xbf16> to memref<65536xbf16, strided<[1], offset: 851968>>
        %reinterpret_cast_103 = memref.reinterpret_cast %subview_102 to offset: [0], sizes: [1024, 64], strides: [64, 1] : memref<65536xbf16, strided<[1], offset: 851968>> to memref<1024x64xbf16>
        %subview_104 = memref.subview %arg0[2949120] [65536] [1] : memref<6291456xbf16> to memref<65536xbf16, strided<[1], offset: 2949120>>
        %reinterpret_cast_105 = memref.reinterpret_cast %subview_104 to offset: [0], sizes: [64, 1024], strides: [1024, 1] : memref<65536xbf16, strided<[1], offset: 2949120>> to memref<64x1024xbf16>
        %subview_106 = memref.subview %arg0[5046272] [65536] [1] : memref<6291456xbf16> to memref<65536xbf16, strided<[1], offset: 5046272>>
        %reinterpret_cast_107 = memref.reinterpret_cast %subview_106 to offset: [0], sizes: [1024, 64], strides: [64, 1] : memref<65536xbf16, strided<[1], offset: 5046272>> to memref<1024x64xbf16>
        %subview_108 = memref.subview %arg1[851968] [65536] [1] : memref<2097152xbf16> to memref<65536xbf16, strided<[1], offset: 851968>>
        %reinterpret_cast_109 = memref.reinterpret_cast %subview_108 to offset: [0], sizes: [1024, 64], strides: [64, 1] : memref<65536xbf16, strided<[1], offset: 851968>> to memref<1024x64xbf16>
        aiex.run @sequence(%reinterpret_cast_103, %reinterpret_cast_105, %reinterpret_cast_107, %reinterpret_cast_109) : (memref<1024x64xbf16>, memref<64x1024xbf16>, memref<1024x64xbf16>, memref<1024x64xbf16>)
        %subview_110 = memref.subview %arg0[917504] [65536] [1] : memref<6291456xbf16> to memref<65536xbf16, strided<[1], offset: 917504>>
        %reinterpret_cast_111 = memref.reinterpret_cast %subview_110 to offset: [0], sizes: [1024, 64], strides: [64, 1] : memref<65536xbf16, strided<[1], offset: 917504>> to memref<1024x64xbf16>
        %subview_112 = memref.subview %arg0[3014656] [65536] [1] : memref<6291456xbf16> to memref<65536xbf16, strided<[1], offset: 3014656>>
        %reinterpret_cast_113 = memref.reinterpret_cast %subview_112 to offset: [0], sizes: [64, 1024], strides: [1024, 1] : memref<65536xbf16, strided<[1], offset: 3014656>> to memref<64x1024xbf16>
        %subview_114 = memref.subview %arg0[5111808] [65536] [1] : memref<6291456xbf16> to memref<65536xbf16, strided<[1], offset: 5111808>>
        %reinterpret_cast_115 = memref.reinterpret_cast %subview_114 to offset: [0], sizes: [1024, 64], strides: [64, 1] : memref<65536xbf16, strided<[1], offset: 5111808>> to memref<1024x64xbf16>
        %subview_116 = memref.subview %arg1[917504] [65536] [1] : memref<2097152xbf16> to memref<65536xbf16, strided<[1], offset: 917504>>
        %reinterpret_cast_117 = memref.reinterpret_cast %subview_116 to offset: [0], sizes: [1024, 64], strides: [64, 1] : memref<65536xbf16, strided<[1], offset: 917504>> to memref<1024x64xbf16>
        aiex.run @sequence(%reinterpret_cast_111, %reinterpret_cast_113, %reinterpret_cast_115, %reinterpret_cast_117) : (memref<1024x64xbf16>, memref<64x1024xbf16>, memref<1024x64xbf16>, memref<1024x64xbf16>)
        %subview_118 = memref.subview %arg0[983040] [65536] [1] : memref<6291456xbf16> to memref<65536xbf16, strided<[1], offset: 983040>>
        %reinterpret_cast_119 = memref.reinterpret_cast %subview_118 to offset: [0], sizes: [1024, 64], strides: [64, 1] : memref<65536xbf16, strided<[1], offset: 983040>> to memref<1024x64xbf16>
        %subview_120 = memref.subview %arg0[3080192] [65536] [1] : memref<6291456xbf16> to memref<65536xbf16, strided<[1], offset: 3080192>>
        %reinterpret_cast_121 = memref.reinterpret_cast %subview_120 to offset: [0], sizes: [64, 1024], strides: [1024, 1] : memref<65536xbf16, strided<[1], offset: 3080192>> to memref<64x1024xbf16>
        %subview_122 = memref.subview %arg0[5177344] [65536] [1] : memref<6291456xbf16> to memref<65536xbf16, strided<[1], offset: 5177344>>
        %reinterpret_cast_123 = memref.reinterpret_cast %subview_122 to offset: [0], sizes: [1024, 64], strides: [64, 1] : memref<65536xbf16, strided<[1], offset: 5177344>> to memref<1024x64xbf16>
        %subview_124 = memref.subview %arg1[983040] [65536] [1] : memref<2097152xbf16> to memref<65536xbf16, strided<[1], offset: 983040>>
        %reinterpret_cast_125 = memref.reinterpret_cast %subview_124 to offset: [0], sizes: [1024, 64], strides: [64, 1] : memref<65536xbf16, strided<[1], offset: 983040>> to memref<1024x64xbf16>
        aiex.run @sequence(%reinterpret_cast_119, %reinterpret_cast_121, %reinterpret_cast_123, %reinterpret_cast_125) : (memref<1024x64xbf16>, memref<64x1024xbf16>, memref<1024x64xbf16>, memref<1024x64xbf16>)
        %subview_126 = memref.subview %arg0[1048576] [65536] [1] : memref<6291456xbf16> to memref<65536xbf16, strided<[1], offset: 1048576>>
        %reinterpret_cast_127 = memref.reinterpret_cast %subview_126 to offset: [0], sizes: [1024, 64], strides: [64, 1] : memref<65536xbf16, strided<[1], offset: 1048576>> to memref<1024x64xbf16>
        %subview_128 = memref.subview %arg0[3145728] [65536] [1] : memref<6291456xbf16> to memref<65536xbf16, strided<[1], offset: 3145728>>
        %reinterpret_cast_129 = memref.reinterpret_cast %subview_128 to offset: [0], sizes: [64, 1024], strides: [1024, 1] : memref<65536xbf16, strided<[1], offset: 3145728>> to memref<64x1024xbf16>
        %subview_130 = memref.subview %arg0[5242880] [65536] [1] : memref<6291456xbf16> to memref<65536xbf16, strided<[1], offset: 5242880>>
        %reinterpret_cast_131 = memref.reinterpret_cast %subview_130 to offset: [0], sizes: [1024, 64], strides: [64, 1] : memref<65536xbf16, strided<[1], offset: 5242880>> to memref<1024x64xbf16>
        %subview_132 = memref.subview %arg1[1048576] [65536] [1] : memref<2097152xbf16> to memref<65536xbf16, strided<[1], offset: 1048576>>
        %reinterpret_cast_133 = memref.reinterpret_cast %subview_132 to offset: [0], sizes: [1024, 64], strides: [64, 1] : memref<65536xbf16, strided<[1], offset: 1048576>> to memref<1024x64xbf16>
        aiex.run @sequence(%reinterpret_cast_127, %reinterpret_cast_129, %reinterpret_cast_131, %reinterpret_cast_133) : (memref<1024x64xbf16>, memref<64x1024xbf16>, memref<1024x64xbf16>, memref<1024x64xbf16>)
        %subview_134 = memref.subview %arg0[1114112] [65536] [1] : memref<6291456xbf16> to memref<65536xbf16, strided<[1], offset: 1114112>>
        %reinterpret_cast_135 = memref.reinterpret_cast %subview_134 to offset: [0], sizes: [1024, 64], strides: [64, 1] : memref<65536xbf16, strided<[1], offset: 1114112>> to memref<1024x64xbf16>
        %subview_136 = memref.subview %arg0[3211264] [65536] [1] : memref<6291456xbf16> to memref<65536xbf16, strided<[1], offset: 3211264>>
        %reinterpret_cast_137 = memref.reinterpret_cast %subview_136 to offset: [0], sizes: [64, 1024], strides: [1024, 1] : memref<65536xbf16, strided<[1], offset: 3211264>> to memref<64x1024xbf16>
        %subview_138 = memref.subview %arg0[5308416] [65536] [1] : memref<6291456xbf16> to memref<65536xbf16, strided<[1], offset: 5308416>>
        %reinterpret_cast_139 = memref.reinterpret_cast %subview_138 to offset: [0], sizes: [1024, 64], strides: [64, 1] : memref<65536xbf16, strided<[1], offset: 5308416>> to memref<1024x64xbf16>
        %subview_140 = memref.subview %arg1[1114112] [65536] [1] : memref<2097152xbf16> to memref<65536xbf16, strided<[1], offset: 1114112>>
        %reinterpret_cast_141 = memref.reinterpret_cast %subview_140 to offset: [0], sizes: [1024, 64], strides: [64, 1] : memref<65536xbf16, strided<[1], offset: 1114112>> to memref<1024x64xbf16>
        aiex.run @sequence(%reinterpret_cast_135, %reinterpret_cast_137, %reinterpret_cast_139, %reinterpret_cast_141) : (memref<1024x64xbf16>, memref<64x1024xbf16>, memref<1024x64xbf16>, memref<1024x64xbf16>)
        %subview_142 = memref.subview %arg0[1179648] [65536] [1] : memref<6291456xbf16> to memref<65536xbf16, strided<[1], offset: 1179648>>
        %reinterpret_cast_143 = memref.reinterpret_cast %subview_142 to offset: [0], sizes: [1024, 64], strides: [64, 1] : memref<65536xbf16, strided<[1], offset: 1179648>> to memref<1024x64xbf16>
        %subview_144 = memref.subview %arg0[3276800] [65536] [1] : memref<6291456xbf16> to memref<65536xbf16, strided<[1], offset: 3276800>>
        %reinterpret_cast_145 = memref.reinterpret_cast %subview_144 to offset: [0], sizes: [64, 1024], strides: [1024, 1] : memref<65536xbf16, strided<[1], offset: 3276800>> to memref<64x1024xbf16>
        %subview_146 = memref.subview %arg0[5373952] [65536] [1] : memref<6291456xbf16> to memref<65536xbf16, strided<[1], offset: 5373952>>
        %reinterpret_cast_147 = memref.reinterpret_cast %subview_146 to offset: [0], sizes: [1024, 64], strides: [64, 1] : memref<65536xbf16, strided<[1], offset: 5373952>> to memref<1024x64xbf16>
        %subview_148 = memref.subview %arg1[1179648] [65536] [1] : memref<2097152xbf16> to memref<65536xbf16, strided<[1], offset: 1179648>>
        %reinterpret_cast_149 = memref.reinterpret_cast %subview_148 to offset: [0], sizes: [1024, 64], strides: [64, 1] : memref<65536xbf16, strided<[1], offset: 1179648>> to memref<1024x64xbf16>
        aiex.run @sequence(%reinterpret_cast_143, %reinterpret_cast_145, %reinterpret_cast_147, %reinterpret_cast_149) : (memref<1024x64xbf16>, memref<64x1024xbf16>, memref<1024x64xbf16>, memref<1024x64xbf16>)
        %subview_150 = memref.subview %arg0[1245184] [65536] [1] : memref<6291456xbf16> to memref<65536xbf16, strided<[1], offset: 1245184>>
        %reinterpret_cast_151 = memref.reinterpret_cast %subview_150 to offset: [0], sizes: [1024, 64], strides: [64, 1] : memref<65536xbf16, strided<[1], offset: 1245184>> to memref<1024x64xbf16>
        %subview_152 = memref.subview %arg0[3342336] [65536] [1] : memref<6291456xbf16> to memref<65536xbf16, strided<[1], offset: 3342336>>
        %reinterpret_cast_153 = memref.reinterpret_cast %subview_152 to offset: [0], sizes: [64, 1024], strides: [1024, 1] : memref<65536xbf16, strided<[1], offset: 3342336>> to memref<64x1024xbf16>
        %subview_154 = memref.subview %arg0[5439488] [65536] [1] : memref<6291456xbf16> to memref<65536xbf16, strided<[1], offset: 5439488>>
        %reinterpret_cast_155 = memref.reinterpret_cast %subview_154 to offset: [0], sizes: [1024, 64], strides: [64, 1] : memref<65536xbf16, strided<[1], offset: 5439488>> to memref<1024x64xbf16>
        %subview_156 = memref.subview %arg1[1245184] [65536] [1] : memref<2097152xbf16> to memref<65536xbf16, strided<[1], offset: 1245184>>
        %reinterpret_cast_157 = memref.reinterpret_cast %subview_156 to offset: [0], sizes: [1024, 64], strides: [64, 1] : memref<65536xbf16, strided<[1], offset: 1245184>> to memref<1024x64xbf16>
        aiex.run @sequence(%reinterpret_cast_151, %reinterpret_cast_153, %reinterpret_cast_155, %reinterpret_cast_157) : (memref<1024x64xbf16>, memref<64x1024xbf16>, memref<1024x64xbf16>, memref<1024x64xbf16>)
        %subview_158 = memref.subview %arg0[1310720] [65536] [1] : memref<6291456xbf16> to memref<65536xbf16, strided<[1], offset: 1310720>>
        %reinterpret_cast_159 = memref.reinterpret_cast %subview_158 to offset: [0], sizes: [1024, 64], strides: [64, 1] : memref<65536xbf16, strided<[1], offset: 1310720>> to memref<1024x64xbf16>
        %subview_160 = memref.subview %arg0[3407872] [65536] [1] : memref<6291456xbf16> to memref<65536xbf16, strided<[1], offset: 3407872>>
        %reinterpret_cast_161 = memref.reinterpret_cast %subview_160 to offset: [0], sizes: [64, 1024], strides: [1024, 1] : memref<65536xbf16, strided<[1], offset: 3407872>> to memref<64x1024xbf16>
        %subview_162 = memref.subview %arg0[5505024] [65536] [1] : memref<6291456xbf16> to memref<65536xbf16, strided<[1], offset: 5505024>>
        %reinterpret_cast_163 = memref.reinterpret_cast %subview_162 to offset: [0], sizes: [1024, 64], strides: [64, 1] : memref<65536xbf16, strided<[1], offset: 5505024>> to memref<1024x64xbf16>
        %subview_164 = memref.subview %arg1[1310720] [65536] [1] : memref<2097152xbf16> to memref<65536xbf16, strided<[1], offset: 1310720>>
        %reinterpret_cast_165 = memref.reinterpret_cast %subview_164 to offset: [0], sizes: [1024, 64], strides: [64, 1] : memref<65536xbf16, strided<[1], offset: 1310720>> to memref<1024x64xbf16>
        aiex.run @sequence(%reinterpret_cast_159, %reinterpret_cast_161, %reinterpret_cast_163, %reinterpret_cast_165) : (memref<1024x64xbf16>, memref<64x1024xbf16>, memref<1024x64xbf16>, memref<1024x64xbf16>)
        %subview_166 = memref.subview %arg0[1376256] [65536] [1] : memref<6291456xbf16> to memref<65536xbf16, strided<[1], offset: 1376256>>
        %reinterpret_cast_167 = memref.reinterpret_cast %subview_166 to offset: [0], sizes: [1024, 64], strides: [64, 1] : memref<65536xbf16, strided<[1], offset: 1376256>> to memref<1024x64xbf16>
        %subview_168 = memref.subview %arg0[3473408] [65536] [1] : memref<6291456xbf16> to memref<65536xbf16, strided<[1], offset: 3473408>>
        %reinterpret_cast_169 = memref.reinterpret_cast %subview_168 to offset: [0], sizes: [64, 1024], strides: [1024, 1] : memref<65536xbf16, strided<[1], offset: 3473408>> to memref<64x1024xbf16>
        %subview_170 = memref.subview %arg0[5570560] [65536] [1] : memref<6291456xbf16> to memref<65536xbf16, strided<[1], offset: 5570560>>
        %reinterpret_cast_171 = memref.reinterpret_cast %subview_170 to offset: [0], sizes: [1024, 64], strides: [64, 1] : memref<65536xbf16, strided<[1], offset: 5570560>> to memref<1024x64xbf16>
        %subview_172 = memref.subview %arg1[1376256] [65536] [1] : memref<2097152xbf16> to memref<65536xbf16, strided<[1], offset: 1376256>>
        %reinterpret_cast_173 = memref.reinterpret_cast %subview_172 to offset: [0], sizes: [1024, 64], strides: [64, 1] : memref<65536xbf16, strided<[1], offset: 1376256>> to memref<1024x64xbf16>
        aiex.run @sequence(%reinterpret_cast_167, %reinterpret_cast_169, %reinterpret_cast_171, %reinterpret_cast_173) : (memref<1024x64xbf16>, memref<64x1024xbf16>, memref<1024x64xbf16>, memref<1024x64xbf16>)
        %subview_174 = memref.subview %arg0[1441792] [65536] [1] : memref<6291456xbf16> to memref<65536xbf16, strided<[1], offset: 1441792>>
        %reinterpret_cast_175 = memref.reinterpret_cast %subview_174 to offset: [0], sizes: [1024, 64], strides: [64, 1] : memref<65536xbf16, strided<[1], offset: 1441792>> to memref<1024x64xbf16>
        %subview_176 = memref.subview %arg0[3538944] [65536] [1] : memref<6291456xbf16> to memref<65536xbf16, strided<[1], offset: 3538944>>
        %reinterpret_cast_177 = memref.reinterpret_cast %subview_176 to offset: [0], sizes: [64, 1024], strides: [1024, 1] : memref<65536xbf16, strided<[1], offset: 3538944>> to memref<64x1024xbf16>
        %subview_178 = memref.subview %arg0[5636096] [65536] [1] : memref<6291456xbf16> to memref<65536xbf16, strided<[1], offset: 5636096>>
        %reinterpret_cast_179 = memref.reinterpret_cast %subview_178 to offset: [0], sizes: [1024, 64], strides: [64, 1] : memref<65536xbf16, strided<[1], offset: 5636096>> to memref<1024x64xbf16>
        %subview_180 = memref.subview %arg1[1441792] [65536] [1] : memref<2097152xbf16> to memref<65536xbf16, strided<[1], offset: 1441792>>
        %reinterpret_cast_181 = memref.reinterpret_cast %subview_180 to offset: [0], sizes: [1024, 64], strides: [64, 1] : memref<65536xbf16, strided<[1], offset: 1441792>> to memref<1024x64xbf16>
        aiex.run @sequence(%reinterpret_cast_175, %reinterpret_cast_177, %reinterpret_cast_179, %reinterpret_cast_181) : (memref<1024x64xbf16>, memref<64x1024xbf16>, memref<1024x64xbf16>, memref<1024x64xbf16>)
        %subview_182 = memref.subview %arg0[1507328] [65536] [1] : memref<6291456xbf16> to memref<65536xbf16, strided<[1], offset: 1507328>>
        %reinterpret_cast_183 = memref.reinterpret_cast %subview_182 to offset: [0], sizes: [1024, 64], strides: [64, 1] : memref<65536xbf16, strided<[1], offset: 1507328>> to memref<1024x64xbf16>
        %subview_184 = memref.subview %arg0[3604480] [65536] [1] : memref<6291456xbf16> to memref<65536xbf16, strided<[1], offset: 3604480>>
        %reinterpret_cast_185 = memref.reinterpret_cast %subview_184 to offset: [0], sizes: [64, 1024], strides: [1024, 1] : memref<65536xbf16, strided<[1], offset: 3604480>> to memref<64x1024xbf16>
        %subview_186 = memref.subview %arg0[5701632] [65536] [1] : memref<6291456xbf16> to memref<65536xbf16, strided<[1], offset: 5701632>>
        %reinterpret_cast_187 = memref.reinterpret_cast %subview_186 to offset: [0], sizes: [1024, 64], strides: [64, 1] : memref<65536xbf16, strided<[1], offset: 5701632>> to memref<1024x64xbf16>
        %subview_188 = memref.subview %arg1[1507328] [65536] [1] : memref<2097152xbf16> to memref<65536xbf16, strided<[1], offset: 1507328>>
        %reinterpret_cast_189 = memref.reinterpret_cast %subview_188 to offset: [0], sizes: [1024, 64], strides: [64, 1] : memref<65536xbf16, strided<[1], offset: 1507328>> to memref<1024x64xbf16>
        aiex.run @sequence(%reinterpret_cast_183, %reinterpret_cast_185, %reinterpret_cast_187, %reinterpret_cast_189) : (memref<1024x64xbf16>, memref<64x1024xbf16>, memref<1024x64xbf16>, memref<1024x64xbf16>)
        %subview_190 = memref.subview %arg0[1572864] [65536] [1] : memref<6291456xbf16> to memref<65536xbf16, strided<[1], offset: 1572864>>
        %reinterpret_cast_191 = memref.reinterpret_cast %subview_190 to offset: [0], sizes: [1024, 64], strides: [64, 1] : memref<65536xbf16, strided<[1], offset: 1572864>> to memref<1024x64xbf16>
        %subview_192 = memref.subview %arg0[3670016] [65536] [1] : memref<6291456xbf16> to memref<65536xbf16, strided<[1], offset: 3670016>>
        %reinterpret_cast_193 = memref.reinterpret_cast %subview_192 to offset: [0], sizes: [64, 1024], strides: [1024, 1] : memref<65536xbf16, strided<[1], offset: 3670016>> to memref<64x1024xbf16>
        %subview_194 = memref.subview %arg0[5767168] [65536] [1] : memref<6291456xbf16> to memref<65536xbf16, strided<[1], offset: 5767168>>
        %reinterpret_cast_195 = memref.reinterpret_cast %subview_194 to offset: [0], sizes: [1024, 64], strides: [64, 1] : memref<65536xbf16, strided<[1], offset: 5767168>> to memref<1024x64xbf16>
        %subview_196 = memref.subview %arg1[1572864] [65536] [1] : memref<2097152xbf16> to memref<65536xbf16, strided<[1], offset: 1572864>>
        %reinterpret_cast_197 = memref.reinterpret_cast %subview_196 to offset: [0], sizes: [1024, 64], strides: [64, 1] : memref<65536xbf16, strided<[1], offset: 1572864>> to memref<1024x64xbf16>
        aiex.run @sequence(%reinterpret_cast_191, %reinterpret_cast_193, %reinterpret_cast_195, %reinterpret_cast_197) : (memref<1024x64xbf16>, memref<64x1024xbf16>, memref<1024x64xbf16>, memref<1024x64xbf16>)
        %subview_198 = memref.subview %arg0[1638400] [65536] [1] : memref<6291456xbf16> to memref<65536xbf16, strided<[1], offset: 1638400>>
        %reinterpret_cast_199 = memref.reinterpret_cast %subview_198 to offset: [0], sizes: [1024, 64], strides: [64, 1] : memref<65536xbf16, strided<[1], offset: 1638400>> to memref<1024x64xbf16>
        %subview_200 = memref.subview %arg0[3735552] [65536] [1] : memref<6291456xbf16> to memref<65536xbf16, strided<[1], offset: 3735552>>
        %reinterpret_cast_201 = memref.reinterpret_cast %subview_200 to offset: [0], sizes: [64, 1024], strides: [1024, 1] : memref<65536xbf16, strided<[1], offset: 3735552>> to memref<64x1024xbf16>
        %subview_202 = memref.subview %arg0[5832704] [65536] [1] : memref<6291456xbf16> to memref<65536xbf16, strided<[1], offset: 5832704>>
        %reinterpret_cast_203 = memref.reinterpret_cast %subview_202 to offset: [0], sizes: [1024, 64], strides: [64, 1] : memref<65536xbf16, strided<[1], offset: 5832704>> to memref<1024x64xbf16>
        %subview_204 = memref.subview %arg1[1638400] [65536] [1] : memref<2097152xbf16> to memref<65536xbf16, strided<[1], offset: 1638400>>
        %reinterpret_cast_205 = memref.reinterpret_cast %subview_204 to offset: [0], sizes: [1024, 64], strides: [64, 1] : memref<65536xbf16, strided<[1], offset: 1638400>> to memref<1024x64xbf16>
        aiex.run @sequence(%reinterpret_cast_199, %reinterpret_cast_201, %reinterpret_cast_203, %reinterpret_cast_205) : (memref<1024x64xbf16>, memref<64x1024xbf16>, memref<1024x64xbf16>, memref<1024x64xbf16>)
        %subview_206 = memref.subview %arg0[1703936] [65536] [1] : memref<6291456xbf16> to memref<65536xbf16, strided<[1], offset: 1703936>>
        %reinterpret_cast_207 = memref.reinterpret_cast %subview_206 to offset: [0], sizes: [1024, 64], strides: [64, 1] : memref<65536xbf16, strided<[1], offset: 1703936>> to memref<1024x64xbf16>
        %subview_208 = memref.subview %arg0[3801088] [65536] [1] : memref<6291456xbf16> to memref<65536xbf16, strided<[1], offset: 3801088>>
        %reinterpret_cast_209 = memref.reinterpret_cast %subview_208 to offset: [0], sizes: [64, 1024], strides: [1024, 1] : memref<65536xbf16, strided<[1], offset: 3801088>> to memref<64x1024xbf16>
        %subview_210 = memref.subview %arg0[5898240] [65536] [1] : memref<6291456xbf16> to memref<65536xbf16, strided<[1], offset: 5898240>>
        %reinterpret_cast_211 = memref.reinterpret_cast %subview_210 to offset: [0], sizes: [1024, 64], strides: [64, 1] : memref<65536xbf16, strided<[1], offset: 5898240>> to memref<1024x64xbf16>
        %subview_212 = memref.subview %arg1[1703936] [65536] [1] : memref<2097152xbf16> to memref<65536xbf16, strided<[1], offset: 1703936>>
        %reinterpret_cast_213 = memref.reinterpret_cast %subview_212 to offset: [0], sizes: [1024, 64], strides: [64, 1] : memref<65536xbf16, strided<[1], offset: 1703936>> to memref<1024x64xbf16>
        aiex.run @sequence(%reinterpret_cast_207, %reinterpret_cast_209, %reinterpret_cast_211, %reinterpret_cast_213) : (memref<1024x64xbf16>, memref<64x1024xbf16>, memref<1024x64xbf16>, memref<1024x64xbf16>)
        %subview_214 = memref.subview %arg0[1769472] [65536] [1] : memref<6291456xbf16> to memref<65536xbf16, strided<[1], offset: 1769472>>
        %reinterpret_cast_215 = memref.reinterpret_cast %subview_214 to offset: [0], sizes: [1024, 64], strides: [64, 1] : memref<65536xbf16, strided<[1], offset: 1769472>> to memref<1024x64xbf16>
        %subview_216 = memref.subview %arg0[3866624] [65536] [1] : memref<6291456xbf16> to memref<65536xbf16, strided<[1], offset: 3866624>>
        %reinterpret_cast_217 = memref.reinterpret_cast %subview_216 to offset: [0], sizes: [64, 1024], strides: [1024, 1] : memref<65536xbf16, strided<[1], offset: 3866624>> to memref<64x1024xbf16>
        %subview_218 = memref.subview %arg0[5963776] [65536] [1] : memref<6291456xbf16> to memref<65536xbf16, strided<[1], offset: 5963776>>
        %reinterpret_cast_219 = memref.reinterpret_cast %subview_218 to offset: [0], sizes: [1024, 64], strides: [64, 1] : memref<65536xbf16, strided<[1], offset: 5963776>> to memref<1024x64xbf16>
        %subview_220 = memref.subview %arg1[1769472] [65536] [1] : memref<2097152xbf16> to memref<65536xbf16, strided<[1], offset: 1769472>>
        %reinterpret_cast_221 = memref.reinterpret_cast %subview_220 to offset: [0], sizes: [1024, 64], strides: [64, 1] : memref<65536xbf16, strided<[1], offset: 1769472>> to memref<1024x64xbf16>
        aiex.run @sequence(%reinterpret_cast_215, %reinterpret_cast_217, %reinterpret_cast_219, %reinterpret_cast_221) : (memref<1024x64xbf16>, memref<64x1024xbf16>, memref<1024x64xbf16>, memref<1024x64xbf16>)
        %subview_222 = memref.subview %arg0[1835008] [65536] [1] : memref<6291456xbf16> to memref<65536xbf16, strided<[1], offset: 1835008>>
        %reinterpret_cast_223 = memref.reinterpret_cast %subview_222 to offset: [0], sizes: [1024, 64], strides: [64, 1] : memref<65536xbf16, strided<[1], offset: 1835008>> to memref<1024x64xbf16>
        %subview_224 = memref.subview %arg0[3932160] [65536] [1] : memref<6291456xbf16> to memref<65536xbf16, strided<[1], offset: 3932160>>
        %reinterpret_cast_225 = memref.reinterpret_cast %subview_224 to offset: [0], sizes: [64, 1024], strides: [1024, 1] : memref<65536xbf16, strided<[1], offset: 3932160>> to memref<64x1024xbf16>
        %subview_226 = memref.subview %arg0[6029312] [65536] [1] : memref<6291456xbf16> to memref<65536xbf16, strided<[1], offset: 6029312>>
        %reinterpret_cast_227 = memref.reinterpret_cast %subview_226 to offset: [0], sizes: [1024, 64], strides: [64, 1] : memref<65536xbf16, strided<[1], offset: 6029312>> to memref<1024x64xbf16>
        %subview_228 = memref.subview %arg1[1835008] [65536] [1] : memref<2097152xbf16> to memref<65536xbf16, strided<[1], offset: 1835008>>
        %reinterpret_cast_229 = memref.reinterpret_cast %subview_228 to offset: [0], sizes: [1024, 64], strides: [64, 1] : memref<65536xbf16, strided<[1], offset: 1835008>> to memref<1024x64xbf16>
        aiex.run @sequence(%reinterpret_cast_223, %reinterpret_cast_225, %reinterpret_cast_227, %reinterpret_cast_229) : (memref<1024x64xbf16>, memref<64x1024xbf16>, memref<1024x64xbf16>, memref<1024x64xbf16>)
        %subview_230 = memref.subview %arg0[1900544] [65536] [1] : memref<6291456xbf16> to memref<65536xbf16, strided<[1], offset: 1900544>>
        %reinterpret_cast_231 = memref.reinterpret_cast %subview_230 to offset: [0], sizes: [1024, 64], strides: [64, 1] : memref<65536xbf16, strided<[1], offset: 1900544>> to memref<1024x64xbf16>
        %subview_232 = memref.subview %arg0[3997696] [65536] [1] : memref<6291456xbf16> to memref<65536xbf16, strided<[1], offset: 3997696>>
        %reinterpret_cast_233 = memref.reinterpret_cast %subview_232 to offset: [0], sizes: [64, 1024], strides: [1024, 1] : memref<65536xbf16, strided<[1], offset: 3997696>> to memref<64x1024xbf16>
        %subview_234 = memref.subview %arg0[6094848] [65536] [1] : memref<6291456xbf16> to memref<65536xbf16, strided<[1], offset: 6094848>>
        %reinterpret_cast_235 = memref.reinterpret_cast %subview_234 to offset: [0], sizes: [1024, 64], strides: [64, 1] : memref<65536xbf16, strided<[1], offset: 6094848>> to memref<1024x64xbf16>
        %subview_236 = memref.subview %arg1[1900544] [65536] [1] : memref<2097152xbf16> to memref<65536xbf16, strided<[1], offset: 1900544>>
        %reinterpret_cast_237 = memref.reinterpret_cast %subview_236 to offset: [0], sizes: [1024, 64], strides: [64, 1] : memref<65536xbf16, strided<[1], offset: 1900544>> to memref<1024x64xbf16>
        aiex.run @sequence(%reinterpret_cast_231, %reinterpret_cast_233, %reinterpret_cast_235, %reinterpret_cast_237) : (memref<1024x64xbf16>, memref<64x1024xbf16>, memref<1024x64xbf16>, memref<1024x64xbf16>)
        %subview_238 = memref.subview %arg0[1966080] [65536] [1] : memref<6291456xbf16> to memref<65536xbf16, strided<[1], offset: 1966080>>
        %reinterpret_cast_239 = memref.reinterpret_cast %subview_238 to offset: [0], sizes: [1024, 64], strides: [64, 1] : memref<65536xbf16, strided<[1], offset: 1966080>> to memref<1024x64xbf16>
        %subview_240 = memref.subview %arg0[4063232] [65536] [1] : memref<6291456xbf16> to memref<65536xbf16, strided<[1], offset: 4063232>>
        %reinterpret_cast_241 = memref.reinterpret_cast %subview_240 to offset: [0], sizes: [64, 1024], strides: [1024, 1] : memref<65536xbf16, strided<[1], offset: 4063232>> to memref<64x1024xbf16>
        %subview_242 = memref.subview %arg0[6160384] [65536] [1] : memref<6291456xbf16> to memref<65536xbf16, strided<[1], offset: 6160384>>
        %reinterpret_cast_243 = memref.reinterpret_cast %subview_242 to offset: [0], sizes: [1024, 64], strides: [64, 1] : memref<65536xbf16, strided<[1], offset: 6160384>> to memref<1024x64xbf16>
        %subview_244 = memref.subview %arg1[1966080] [65536] [1] : memref<2097152xbf16> to memref<65536xbf16, strided<[1], offset: 1966080>>
        %reinterpret_cast_245 = memref.reinterpret_cast %subview_244 to offset: [0], sizes: [1024, 64], strides: [64, 1] : memref<65536xbf16, strided<[1], offset: 1966080>> to memref<1024x64xbf16>
        aiex.run @sequence(%reinterpret_cast_239, %reinterpret_cast_241, %reinterpret_cast_243, %reinterpret_cast_245) : (memref<1024x64xbf16>, memref<64x1024xbf16>, memref<1024x64xbf16>, memref<1024x64xbf16>)
        %subview_246 = memref.subview %arg0[2031616] [65536] [1] : memref<6291456xbf16> to memref<65536xbf16, strided<[1], offset: 2031616>>
        %reinterpret_cast_247 = memref.reinterpret_cast %subview_246 to offset: [0], sizes: [1024, 64], strides: [64, 1] : memref<65536xbf16, strided<[1], offset: 2031616>> to memref<1024x64xbf16>
        %subview_248 = memref.subview %arg0[4128768] [65536] [1] : memref<6291456xbf16> to memref<65536xbf16, strided<[1], offset: 4128768>>
        %reinterpret_cast_249 = memref.reinterpret_cast %subview_248 to offset: [0], sizes: [64, 1024], strides: [1024, 1] : memref<65536xbf16, strided<[1], offset: 4128768>> to memref<64x1024xbf16>
        %subview_250 = memref.subview %arg0[6225920] [65536] [1] : memref<6291456xbf16> to memref<65536xbf16, strided<[1], offset: 6225920>>
        %reinterpret_cast_251 = memref.reinterpret_cast %subview_250 to offset: [0], sizes: [1024, 64], strides: [64, 1] : memref<65536xbf16, strided<[1], offset: 6225920>> to memref<1024x64xbf16>
        %subview_252 = memref.subview %arg1[2031616] [65536] [1] : memref<2097152xbf16> to memref<65536xbf16, strided<[1], offset: 2031616>>
        %reinterpret_cast_253 = memref.reinterpret_cast %subview_252 to offset: [0], sizes: [1024, 64], strides: [64, 1] : memref<65536xbf16, strided<[1], offset: 2031616>> to memref<1024x64xbf16>
        aiex.run @sequence(%reinterpret_cast_247, %reinterpret_cast_249, %reinterpret_cast_251, %reinterpret_cast_253) : (memref<1024x64xbf16>, memref<64x1024xbf16>, memref<1024x64xbf16>, memref<1024x64xbf16>)
      }
      aiex.configure @reset_device {
      }
    }
  }
}
