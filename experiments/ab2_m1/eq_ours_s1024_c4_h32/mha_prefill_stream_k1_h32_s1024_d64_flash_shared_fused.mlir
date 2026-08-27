module {
  aie.device(npu2) @op0__MHAStreamGroup {
    %shim_noc_tile_0_0 = aie.tile(0, 0)
    %shim_noc_tile_1_0 = aie.tile(1, 0)
    %shim_noc_tile_2_0 = aie.tile(2, 0)
    %shim_noc_tile_4_0 = aie.tile(4, 0)
    %shim_noc_tile_5_0 = aie.tile(5, 0)
    %shim_noc_tile_6_0 = aie.tile(6, 0)
    %shim_noc_tile_7_0 = aie.tile(7, 0)
    %mem_tile_1_1 = aie.tile(1, 1)
    %mem_tile_4_1 = aie.tile(4, 1)
    %mem_tile_5_1 = aie.tile(5, 1)
    %mem_tile_6_1 = aie.tile(6, 1)
    %mem_tile_7_1 = aie.tile(7, 1)
    %mem_tile_0_1 = aie.tile(0, 1)
    %tile_0_2 = aie.tile(0, 2)
    %tile_1_2 = aie.tile(1, 2)
    %tile_2_2 = aie.tile(2, 2)
    %tile_3_2 = aie.tile(3, 2)
    %tile_0_4 = aie.tile(0, 4)
    %tile_1_4 = aie.tile(1, 4)
    %tile_2_4 = aie.tile(2, 4)
    %tile_3_4 = aie.tile(3, 4)
    %mem_tile_2_1 = aie.tile(2, 1)
    %tile_0_3 = aie.tile(0, 3)
    %tile_1_3 = aie.tile(1, 3)
    %tile_2_3 = aie.tile(2, 3)
    %tile_3_3 = aie.tile(3, 3)
    aie.runtime_sequence(%arg0: memref<1024x64xbf16>, %arg1: memref<64x1024xbf16>, %arg2: memref<1024x64xbf16>, %arg3: memref<1024x64xbf16>) {
      %0 = aiex.dma_configure_task_for @of_0_mem_0 {
        aie.dma_bd(%arg0 : memref<1024x64xbf16> offset = 0 len = 16384 sizes = [1, 4, 64, 64] strides = [0, 16384, 64, 1])
        aie.end
      } {issue_token = true, iteration_t = 0 : index}
      aiex.dma_start_task(%0)
      %1 = aiex.dma_configure_task_for @of_0_mem_1 {
        aie.dma_bd(%arg0 : memref<1024x64xbf16> offset = 4096 len = 16384 sizes = [1, 4, 64, 64] strides = [0, 16384, 64, 1])
        aie.end
      } {issue_token = true, iteration_t = 0 : index}
      aiex.dma_start_task(%1)
      %2 = aiex.dma_configure_task_for @of_0_mem_2 {
        aie.dma_bd(%arg0 : memref<1024x64xbf16> offset = 8192 len = 16384 sizes = [1, 4, 64, 64] strides = [0, 16384, 64, 1])
        aie.end
      } {issue_token = true, iteration_t = 0 : index}
      aiex.dma_start_task(%2)
      %3 = aiex.dma_configure_task_for @of_0_mem_3 {
        aie.dma_bd(%arg0 : memref<1024x64xbf16> offset = 12288 len = 16384 sizes = [1, 4, 64, 64] strides = [0, 16384, 64, 1])
        aie.end
      } {issue_token = true, iteration_t = 0 : index}
      aiex.dma_start_task(%3)
      %4 = aiex.dma_configure_task_for @of_1_mem {
        aie.dma_bd(%arg1 : memref<64x1024xbf16> offset = 0 len = 65536 sizes = [1, 16, 64, 64] strides = [0, 64, 1024, 1])
        aie.end
      } {issue_token = true, iteration_t = 0 : index}
      aiex.dma_start_task(%4)
      %5 = aiex.dma_configure_task_for @of_2_mem {
        aie.dma_bd(%arg2 : memref<1024x64xbf16> offset = 0 len = 65536 sizes = [1, 1, 256, 256] strides = [0, 0, 256, 1])
        aie.end
      } {issue_token = true, iteration_t = 0 : index}
      aiex.dma_start_task(%5)
      %6 = aiex.dma_configure_task_for @of_11_mem_0 {
        aie.dma_bd(%arg3 : memref<1024x64xbf16> offset = 0 len = 16384 sizes = [1, 4, 64, 64] strides = [0, 16384, 64, 1])
        aie.end
      } {issue_token = true, iteration_t = 0 : index}
      aiex.dma_start_task(%6)
      %7 = aiex.dma_configure_task_for @of_11_mem_1 {
        aie.dma_bd(%arg3 : memref<1024x64xbf16> offset = 4096 len = 16384 sizes = [1, 4, 64, 64] strides = [0, 16384, 64, 1])
        aie.end
      } {issue_token = true, iteration_t = 0 : index}
      aiex.dma_start_task(%7)
      %8 = aiex.dma_configure_task_for @of_11_mem_2 {
        aie.dma_bd(%arg3 : memref<1024x64xbf16> offset = 8192 len = 16384 sizes = [1, 4, 64, 64] strides = [0, 16384, 64, 1])
        aie.end
      } {issue_token = true, iteration_t = 0 : index}
      aiex.dma_start_task(%8)
      %9 = aiex.dma_configure_task_for @of_11_mem_3 {
        aie.dma_bd(%arg3 : memref<1024x64xbf16> offset = 12288 len = 16384 sizes = [1, 4, 64, 64] strides = [0, 16384, 64, 1])
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
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c4 = arith.constant 4 : index
        scf.for %arg1 = %c0_0 to %c4 step %c1_1 {
          %0 = aie.objectfifo.acquire @of_3_unicast_0_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
          %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
          %c16 = arith.constant 16 : index
          scf.for %arg2 = %c0_0 to %c16 step %c1_1 {
            %2 = aie.objectfifo.acquire @of_6_unicast_0(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %3 = aie.objectfifo.subview.access %2[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            func.call @op0_zero_bf16_64_64_64(%3) : (memref<64x64xbf16>) -> ()
            %4 = aie.objectfifo.acquire @of_4_broadcast_0_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %5 = aie.objectfifo.subview.access %4[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            %c1_2 = arith.constant 1 : index
            %c0_3 = arith.constant 0 : index
            %6 = scf.index_switch %c0_3 -> memref<64x64xbf16> 
            case 0 {
              scf.yield %1 : memref<64x64xbf16>
            }
            default {
              scf.yield %1 : memref<64x64xbf16>
            }
            %c1_4 = arith.constant 1 : index
            %c0_5 = arith.constant 0 : index
            %7 = scf.index_switch %c0_5 -> memref<64x64xbf16> 
            case 0 {
              scf.yield %5 : memref<64x64xbf16>
            }
            default {
              scf.yield %5 : memref<64x64xbf16>
            }
            %c1_6 = arith.constant 1 : index
            %c0_7 = arith.constant 0 : index
            %8 = scf.index_switch %c0_7 -> memref<64x64xbf16> 
            case 0 {
              scf.yield %3 : memref<64x64xbf16>
            }
            default {
              scf.yield %3 : memref<64x64xbf16>
            }
            %9 = arith.index_cast %arg2 : index to i32
            %c1_i32 = arith.constant 1 : i32
            %10 = arith.muli %9, %c1_i32 : i32
            %c0_i32 = arith.constant 0 : i32
            %11 = arith.addi %c0_i32, %10 : i32
            %12 = arith.index_cast %arg1 : index to i32
            %c4_i32 = arith.constant 4 : i32
            %13 = arith.muli %12, %c4_i32 : i32
            %c0_i32_8 = arith.constant 0 : i32
            %14 = arith.addi %c0_i32_8, %13 : i32
            %15 = arith.cmpi sle, %11, %14 : i32
            scf.if %15 {
              func.call @op0_matmul_bf16_bf16_64_64_64(%6, %7, %8) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>) -> ()
            }
            aie.objectfifo.release @of_4_broadcast_0_0(Consume, 1)
            aie.objectfifo.release @of_6_unicast_0(Produce, 1)
          }
          aie.objectfifo.release @of_3_unicast_0_0(Consume, 1)
        }
      }
      aie.end
    } {link_with = "op0_mm_64_64_64.o"}
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
          %c16 = arith.constant 16 : index
          scf.for %arg2 = %c0_0 to %c16 step %c1_1 {
            %2 = aie.objectfifo.acquire @of_6_unicast_1(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %3 = aie.objectfifo.subview.access %2[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            func.call @op0_zero_bf16_64_64_64(%3) : (memref<64x64xbf16>) -> ()
            %4 = aie.objectfifo.acquire @of_4_broadcast_0_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %5 = aie.objectfifo.subview.access %4[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            %c1_2 = arith.constant 1 : index
            %c0_3 = arith.constant 0 : index
            %6 = scf.index_switch %c0_3 -> memref<64x64xbf16> 
            case 0 {
              scf.yield %1 : memref<64x64xbf16>
            }
            default {
              scf.yield %1 : memref<64x64xbf16>
            }
            %c1_4 = arith.constant 1 : index
            %c0_5 = arith.constant 0 : index
            %7 = scf.index_switch %c0_5 -> memref<64x64xbf16> 
            case 0 {
              scf.yield %5 : memref<64x64xbf16>
            }
            default {
              scf.yield %5 : memref<64x64xbf16>
            }
            %c1_6 = arith.constant 1 : index
            %c0_7 = arith.constant 0 : index
            %8 = scf.index_switch %c0_7 -> memref<64x64xbf16> 
            case 0 {
              scf.yield %3 : memref<64x64xbf16>
            }
            default {
              scf.yield %3 : memref<64x64xbf16>
            }
            %9 = arith.index_cast %arg2 : index to i32
            %c1_i32 = arith.constant 1 : i32
            %10 = arith.muli %9, %c1_i32 : i32
            %c0_i32 = arith.constant 0 : i32
            %11 = arith.addi %c0_i32, %10 : i32
            %12 = arith.index_cast %arg1 : index to i32
            %c4_i32 = arith.constant 4 : i32
            %13 = arith.muli %12, %c4_i32 : i32
            %c1_i32_8 = arith.constant 1 : i32
            %14 = arith.addi %c1_i32_8, %13 : i32
            %15 = arith.cmpi sle, %11, %14 : i32
            scf.if %15 {
              func.call @op0_matmul_bf16_bf16_64_64_64(%6, %7, %8) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>) -> ()
            }
            aie.objectfifo.release @of_4_broadcast_0_0(Consume, 1)
            aie.objectfifo.release @of_6_unicast_1(Produce, 1)
          }
          aie.objectfifo.release @of_3_unicast_1_0(Consume, 1)
        }
      }
      aie.end
    } {link_with = "op0_mm_64_64_64.o"}
    %core_2_2 = aie.core(%tile_2_2) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c4 = arith.constant 4 : index
        scf.for %arg1 = %c0_0 to %c4 step %c1_1 {
          %0 = aie.objectfifo.acquire @of_3_unicast_2_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
          %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
          %c16 = arith.constant 16 : index
          scf.for %arg2 = %c0_0 to %c16 step %c1_1 {
            %2 = aie.objectfifo.acquire @of_6_unicast_2(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %3 = aie.objectfifo.subview.access %2[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            func.call @op0_zero_bf16_64_64_64(%3) : (memref<64x64xbf16>) -> ()
            %4 = aie.objectfifo.acquire @of_4_broadcast_0_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %5 = aie.objectfifo.subview.access %4[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            %c1_2 = arith.constant 1 : index
            %c0_3 = arith.constant 0 : index
            %6 = scf.index_switch %c0_3 -> memref<64x64xbf16> 
            case 0 {
              scf.yield %1 : memref<64x64xbf16>
            }
            default {
              scf.yield %1 : memref<64x64xbf16>
            }
            %c1_4 = arith.constant 1 : index
            %c0_5 = arith.constant 0 : index
            %7 = scf.index_switch %c0_5 -> memref<64x64xbf16> 
            case 0 {
              scf.yield %5 : memref<64x64xbf16>
            }
            default {
              scf.yield %5 : memref<64x64xbf16>
            }
            %c1_6 = arith.constant 1 : index
            %c0_7 = arith.constant 0 : index
            %8 = scf.index_switch %c0_7 -> memref<64x64xbf16> 
            case 0 {
              scf.yield %3 : memref<64x64xbf16>
            }
            default {
              scf.yield %3 : memref<64x64xbf16>
            }
            %9 = arith.index_cast %arg2 : index to i32
            %c1_i32 = arith.constant 1 : i32
            %10 = arith.muli %9, %c1_i32 : i32
            %c0_i32 = arith.constant 0 : i32
            %11 = arith.addi %c0_i32, %10 : i32
            %12 = arith.index_cast %arg1 : index to i32
            %c4_i32 = arith.constant 4 : i32
            %13 = arith.muli %12, %c4_i32 : i32
            %c2_i32 = arith.constant 2 : i32
            %14 = arith.addi %c2_i32, %13 : i32
            %15 = arith.cmpi sle, %11, %14 : i32
            scf.if %15 {
              func.call @op0_matmul_bf16_bf16_64_64_64(%6, %7, %8) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>) -> ()
            }
            aie.objectfifo.release @of_4_broadcast_0_0(Consume, 1)
            aie.objectfifo.release @of_6_unicast_2(Produce, 1)
          }
          aie.objectfifo.release @of_3_unicast_2_0(Consume, 1)
        }
      }
      aie.end
    } {link_with = "op0_mm_64_64_64.o"}
    %core_3_2 = aie.core(%tile_3_2) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c4 = arith.constant 4 : index
        scf.for %arg1 = %c0_0 to %c4 step %c1_1 {
          %0 = aie.objectfifo.acquire @of_3_unicast_3_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
          %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
          %c16 = arith.constant 16 : index
          scf.for %arg2 = %c0_0 to %c16 step %c1_1 {
            %2 = aie.objectfifo.acquire @of_6_unicast_3(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %3 = aie.objectfifo.subview.access %2[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            func.call @op0_zero_bf16_64_64_64(%3) : (memref<64x64xbf16>) -> ()
            %4 = aie.objectfifo.acquire @of_4_broadcast_0_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %5 = aie.objectfifo.subview.access %4[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            %c1_2 = arith.constant 1 : index
            %c0_3 = arith.constant 0 : index
            %6 = scf.index_switch %c0_3 -> memref<64x64xbf16> 
            case 0 {
              scf.yield %1 : memref<64x64xbf16>
            }
            default {
              scf.yield %1 : memref<64x64xbf16>
            }
            %c1_4 = arith.constant 1 : index
            %c0_5 = arith.constant 0 : index
            %7 = scf.index_switch %c0_5 -> memref<64x64xbf16> 
            case 0 {
              scf.yield %5 : memref<64x64xbf16>
            }
            default {
              scf.yield %5 : memref<64x64xbf16>
            }
            %c1_6 = arith.constant 1 : index
            %c0_7 = arith.constant 0 : index
            %8 = scf.index_switch %c0_7 -> memref<64x64xbf16> 
            case 0 {
              scf.yield %3 : memref<64x64xbf16>
            }
            default {
              scf.yield %3 : memref<64x64xbf16>
            }
            %9 = arith.index_cast %arg2 : index to i32
            %c1_i32 = arith.constant 1 : i32
            %10 = arith.muli %9, %c1_i32 : i32
            %c0_i32 = arith.constant 0 : i32
            %11 = arith.addi %c0_i32, %10 : i32
            %12 = arith.index_cast %arg1 : index to i32
            %c4_i32 = arith.constant 4 : i32
            %13 = arith.muli %12, %c4_i32 : i32
            %c3_i32 = arith.constant 3 : i32
            %14 = arith.addi %c3_i32, %13 : i32
            %15 = arith.cmpi sle, %11, %14 : i32
            scf.if %15 {
              func.call @op0_matmul_bf16_bf16_64_64_64(%6, %7, %8) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>) -> ()
            }
            aie.objectfifo.release @of_4_broadcast_0_0(Consume, 1)
            aie.objectfifo.release @of_6_unicast_3(Produce, 1)
          }
          aie.objectfifo.release @of_3_unicast_3_0(Consume, 1)
        }
      }
      aie.end
    } {link_with = "op0_mm_64_64_64.o"}
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
          %0 = aie.objectfifo.acquire @of_10_unicast_0(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
          %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
          func.call @op0_zero_bf16(%1) : (memref<64x64xbf16>) -> ()
          %c16 = arith.constant 16 : index
          scf.for %arg2 = %c0_0 to %c16 step %c1_1 {
            %2 = aie.objectfifo.acquire @of_9_unicast_0_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %3 = aie.objectfifo.subview.access %2[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            %4 = aie.objectfifo.acquire @of_5_broadcast_0_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
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
            %9 = arith.index_cast %arg2 : index to i32
            %c1_i32 = arith.constant 1 : i32
            %10 = arith.muli %9, %c1_i32 : i32
            %c0_i32 = arith.constant 0 : i32
            %11 = arith.addi %c0_i32, %10 : i32
            %12 = arith.index_cast %arg1 : index to i32
            %c4_i32 = arith.constant 4 : i32
            %13 = arith.muli %12, %c4_i32 : i32
            %c0_i32_8 = arith.constant 0 : i32
            %14 = arith.addi %c0_i32_8, %13 : i32
            %c0_9 = arith.constant 0 : index
            %c1_10 = arith.constant 1 : index
            memref.store %11, %flash_index_0_4[%c0_9] : memref<2xi32>
            memref.store %14, %flash_index_0_4[%c1_10] : memref<2xi32>
            %15 = aie.objectfifo.acquire @flash_scale_0_3(Consume, 1) : !aie.objectfifosubview<memref<256xbf16>>
            %16 = aie.objectfifo.subview.access %15[0] : !aie.objectfifosubview<memref<256xbf16>> -> memref<256xbf16>
            %c64_i32 = arith.constant 64 : i32
            %c0_i32_11 = arith.constant 0 : i32
            %17 = arith.cmpi ne, %11, %c0_i32_11 : i32
            %18 = arith.extui %17 : i1 to i32
            func.call @op0_matmul_PV(%7, %6, %8, %16, %c64_i32, %18, %flash_index_0_4) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>, memref<256xbf16>, i32, i32, memref<2xi32>) -> ()
            %c15_i32 = arith.constant 15 : i32
            %19 = arith.cmpi eq, %11, %c15_i32 : i32
            scf.if %19 {
              func.call @op0_rescale_O(%8, %16, %c64_i32, %flash_index_0_4) : (memref<64x64xbf16>, memref<256xbf16>, i32, memref<2xi32>) -> ()
            }
            aie.objectfifo.release @flash_scale_0_3(Consume, 1)
            aie.objectfifo.release @of_5_broadcast_0_0(Consume, 1)
            aie.objectfifo.release @of_9_unicast_0_0(Consume, 1)
          }
          aie.objectfifo.release @of_10_unicast_0(Produce, 1)
        }
      }
      aie.end
    } {link_with = "op0_mha.o"}
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
          %0 = aie.objectfifo.acquire @of_10_unicast_1(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
          %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
          func.call @op0_zero_bf16(%1) : (memref<64x64xbf16>) -> ()
          %c16 = arith.constant 16 : index
          scf.for %arg2 = %c0_0 to %c16 step %c1_1 {
            %2 = aie.objectfifo.acquire @of_9_unicast_1_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %3 = aie.objectfifo.subview.access %2[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            %4 = aie.objectfifo.acquire @of_5_broadcast_0_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
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
            %9 = arith.index_cast %arg2 : index to i32
            %c1_i32 = arith.constant 1 : i32
            %10 = arith.muli %9, %c1_i32 : i32
            %c0_i32 = arith.constant 0 : i32
            %11 = arith.addi %c0_i32, %10 : i32
            %12 = arith.index_cast %arg1 : index to i32
            %c4_i32 = arith.constant 4 : i32
            %13 = arith.muli %12, %c4_i32 : i32
            %c1_i32_8 = arith.constant 1 : i32
            %14 = arith.addi %c1_i32_8, %13 : i32
            %c0_9 = arith.constant 0 : index
            %c1_10 = arith.constant 1 : index
            memref.store %11, %flash_index_1_4[%c0_9] : memref<2xi32>
            memref.store %14, %flash_index_1_4[%c1_10] : memref<2xi32>
            %15 = aie.objectfifo.acquire @flash_scale_1_3(Consume, 1) : !aie.objectfifosubview<memref<256xbf16>>
            %16 = aie.objectfifo.subview.access %15[0] : !aie.objectfifosubview<memref<256xbf16>> -> memref<256xbf16>
            %c64_i32 = arith.constant 64 : i32
            %c0_i32_11 = arith.constant 0 : i32
            %17 = arith.cmpi ne, %11, %c0_i32_11 : i32
            %18 = arith.extui %17 : i1 to i32
            func.call @op0_matmul_PV(%7, %6, %8, %16, %c64_i32, %18, %flash_index_1_4) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>, memref<256xbf16>, i32, i32, memref<2xi32>) -> ()
            %c15_i32 = arith.constant 15 : i32
            %19 = arith.cmpi eq, %11, %c15_i32 : i32
            scf.if %19 {
              func.call @op0_rescale_O(%8, %16, %c64_i32, %flash_index_1_4) : (memref<64x64xbf16>, memref<256xbf16>, i32, memref<2xi32>) -> ()
            }
            aie.objectfifo.release @flash_scale_1_3(Consume, 1)
            aie.objectfifo.release @of_5_broadcast_0_0(Consume, 1)
            aie.objectfifo.release @of_9_unicast_1_0(Consume, 1)
          }
          aie.objectfifo.release @of_10_unicast_1(Produce, 1)
        }
      }
      aie.end
    } {link_with = "op0_mha.o"}
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
          %0 = aie.objectfifo.acquire @of_10_unicast_2(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
          %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
          func.call @op0_zero_bf16(%1) : (memref<64x64xbf16>) -> ()
          %c16 = arith.constant 16 : index
          scf.for %arg2 = %c0_0 to %c16 step %c1_1 {
            %2 = aie.objectfifo.acquire @of_9_unicast_2_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %3 = aie.objectfifo.subview.access %2[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            %4 = aie.objectfifo.acquire @of_5_broadcast_0_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
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
            %9 = arith.index_cast %arg2 : index to i32
            %c1_i32 = arith.constant 1 : i32
            %10 = arith.muli %9, %c1_i32 : i32
            %c0_i32 = arith.constant 0 : i32
            %11 = arith.addi %c0_i32, %10 : i32
            %12 = arith.index_cast %arg1 : index to i32
            %c4_i32 = arith.constant 4 : i32
            %13 = arith.muli %12, %c4_i32 : i32
            %c2_i32 = arith.constant 2 : i32
            %14 = arith.addi %c2_i32, %13 : i32
            %c0_8 = arith.constant 0 : index
            %c1_9 = arith.constant 1 : index
            memref.store %11, %flash_index_2_4[%c0_8] : memref<2xi32>
            memref.store %14, %flash_index_2_4[%c1_9] : memref<2xi32>
            %15 = aie.objectfifo.acquire @flash_scale_2_3(Consume, 1) : !aie.objectfifosubview<memref<256xbf16>>
            %16 = aie.objectfifo.subview.access %15[0] : !aie.objectfifosubview<memref<256xbf16>> -> memref<256xbf16>
            %c64_i32 = arith.constant 64 : i32
            %c0_i32_10 = arith.constant 0 : i32
            %17 = arith.cmpi ne, %11, %c0_i32_10 : i32
            %18 = arith.extui %17 : i1 to i32
            func.call @op0_matmul_PV(%7, %6, %8, %16, %c64_i32, %18, %flash_index_2_4) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>, memref<256xbf16>, i32, i32, memref<2xi32>) -> ()
            %c15_i32 = arith.constant 15 : i32
            %19 = arith.cmpi eq, %11, %c15_i32 : i32
            scf.if %19 {
              func.call @op0_rescale_O(%8, %16, %c64_i32, %flash_index_2_4) : (memref<64x64xbf16>, memref<256xbf16>, i32, memref<2xi32>) -> ()
            }
            aie.objectfifo.release @flash_scale_2_3(Consume, 1)
            aie.objectfifo.release @of_5_broadcast_0_0(Consume, 1)
            aie.objectfifo.release @of_9_unicast_2_0(Consume, 1)
          }
          aie.objectfifo.release @of_10_unicast_2(Produce, 1)
        }
      }
      aie.end
    } {link_with = "op0_mha.o"}
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
          %0 = aie.objectfifo.acquire @of_10_unicast_3(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
          %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
          func.call @op0_zero_bf16(%1) : (memref<64x64xbf16>) -> ()
          %c16 = arith.constant 16 : index
          scf.for %arg2 = %c0_0 to %c16 step %c1_1 {
            %2 = aie.objectfifo.acquire @of_9_unicast_3_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %3 = aie.objectfifo.subview.access %2[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            %4 = aie.objectfifo.acquire @of_5_broadcast_0_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
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
            %9 = arith.index_cast %arg2 : index to i32
            %c1_i32 = arith.constant 1 : i32
            %10 = arith.muli %9, %c1_i32 : i32
            %c0_i32 = arith.constant 0 : i32
            %11 = arith.addi %c0_i32, %10 : i32
            %12 = arith.index_cast %arg1 : index to i32
            %c4_i32 = arith.constant 4 : i32
            %13 = arith.muli %12, %c4_i32 : i32
            %c3_i32 = arith.constant 3 : i32
            %14 = arith.addi %c3_i32, %13 : i32
            %c0_8 = arith.constant 0 : index
            %c1_9 = arith.constant 1 : index
            memref.store %11, %flash_index_3_4[%c0_8] : memref<2xi32>
            memref.store %14, %flash_index_3_4[%c1_9] : memref<2xi32>
            %15 = aie.objectfifo.acquire @flash_scale_3_3(Consume, 1) : !aie.objectfifosubview<memref<256xbf16>>
            %16 = aie.objectfifo.subview.access %15[0] : !aie.objectfifosubview<memref<256xbf16>> -> memref<256xbf16>
            %c64_i32 = arith.constant 64 : i32
            %c0_i32_10 = arith.constant 0 : i32
            %17 = arith.cmpi ne, %11, %c0_i32_10 : i32
            %18 = arith.extui %17 : i1 to i32
            func.call @op0_matmul_PV(%7, %6, %8, %16, %c64_i32, %18, %flash_index_3_4) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>, memref<256xbf16>, i32, i32, memref<2xi32>) -> ()
            %c15_i32 = arith.constant 15 : i32
            %19 = arith.cmpi eq, %11, %c15_i32 : i32
            scf.if %19 {
              func.call @op0_rescale_O(%8, %16, %c64_i32, %flash_index_3_4) : (memref<64x64xbf16>, memref<256xbf16>, i32, memref<2xi32>) -> ()
            }
            aie.objectfifo.release @flash_scale_3_3(Consume, 1)
            aie.objectfifo.release @of_5_broadcast_0_0(Consume, 1)
            aie.objectfifo.release @of_9_unicast_3_0(Consume, 1)
          }
          aie.objectfifo.release @of_10_unicast_3(Produce, 1)
        }
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
        %c4 = arith.constant 4 : index
        scf.for %arg1 = %c0_0 to %c4 step %c1_1 {
          %c16 = arith.constant 16 : index
          scf.for %arg2 = %c0_0 to %c16 step %c1_1 {
            %0 = aie.objectfifo.acquire @of_8_unicast_0(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            %2 = aie.objectfifo.acquire @of_7_unicast_0_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %3 = aie.objectfifo.subview.access %2[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            %c1_2 = arith.constant 1 : index
            %c0_3 = arith.constant 0 : index
            %4 = scf.index_switch %c0_3 -> memref<64x64xbf16> 
            case 0 {
              scf.yield %3 : memref<64x64xbf16>
            }
            default {
              scf.yield %3 : memref<64x64xbf16>
            }
            %c1_4 = arith.constant 1 : index
            %c0_5 = arith.constant 0 : index
            %5 = scf.index_switch %c0_5 -> memref<64x64xbf16> 
            case 0 {
              scf.yield %1 : memref<64x64xbf16>
            }
            default {
              scf.yield %1 : memref<64x64xbf16>
            }
            %6 = arith.index_cast %arg2 : index to i32
            %c1_i32 = arith.constant 1 : i32
            %7 = arith.muli %6, %c1_i32 : i32
            %c0_i32 = arith.constant 0 : i32
            %8 = arith.addi %c0_i32, %7 : i32
            %9 = arith.index_cast %arg1 : index to i32
            %c4_i32 = arith.constant 4 : i32
            %10 = arith.muli %9, %c4_i32 : i32
            %c0_i32_6 = arith.constant 0 : i32
            %11 = arith.addi %c0_i32_6, %10 : i32
            %c0_7 = arith.constant 0 : index
            %c1_8 = arith.constant 1 : index
            memref.store %8, %flash_index_0_3[%c0_7] : memref<2xi32>
            memref.store %11, %flash_index_0_3[%c1_8] : memref<2xi32>
            %c64_i32 = arith.constant 64 : i32
            %c0_i32_9 = arith.constant 0 : i32
            %12 = arith.cmpi eq, %8, %c0_i32_9 : i32
            scf.if %12 {
              func.call @op0_init_scale_buffer(%flash_state_0_3, %c64_i32) : (memref<256xbf16>, i32) -> ()
            }
            %cst = arith.constant 1.4453125 : f32
            %13 = arith.truncf %cst : f32 to bf16
            %c64_i32_10 = arith.constant 64 : i32
            %c1024_i32 = arith.constant 1024 : i32
            %c1024_i32_11 = arith.constant 1024 : i32
            func.call @op0_partial_softmax(%4, %5, %flash_state_0_3, %flash_index_0_3, %13, %c64_i32, %c64_i32_10, %c1024_i32, %c1024_i32_11) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<256xbf16>, memref<2xi32>, bf16, i32, i32, i32, i32) -> ()
            %14 = aie.objectfifo.acquire @flash_scale_0_3(Produce, 1) : !aie.objectfifosubview<memref<256xbf16>>
            %15 = aie.objectfifo.subview.access %14[0] : !aie.objectfifosubview<memref<256xbf16>> -> memref<256xbf16>
            %c256_i32 = arith.constant 256 : i32
            func.call @op0_passThroughLine(%flash_state_0_3, %15, %c256_i32) : (memref<256xbf16>, memref<256xbf16>, i32) -> ()
            aie.objectfifo.release @flash_scale_0_3(Produce, 1)
            aie.objectfifo.release @of_7_unicast_0_0(Consume, 1)
            aie.objectfifo.release @of_8_unicast_0(Produce, 1)
          }
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
        %c4 = arith.constant 4 : index
        scf.for %arg1 = %c0_0 to %c4 step %c1_1 {
          %c16 = arith.constant 16 : index
          scf.for %arg2 = %c0_0 to %c16 step %c1_1 {
            %0 = aie.objectfifo.acquire @of_8_unicast_1(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            %2 = aie.objectfifo.acquire @of_7_unicast_1_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %3 = aie.objectfifo.subview.access %2[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            %c1_2 = arith.constant 1 : index
            %c0_3 = arith.constant 0 : index
            %4 = scf.index_switch %c0_3 -> memref<64x64xbf16> 
            case 0 {
              scf.yield %3 : memref<64x64xbf16>
            }
            default {
              scf.yield %3 : memref<64x64xbf16>
            }
            %c1_4 = arith.constant 1 : index
            %c0_5 = arith.constant 0 : index
            %5 = scf.index_switch %c0_5 -> memref<64x64xbf16> 
            case 0 {
              scf.yield %1 : memref<64x64xbf16>
            }
            default {
              scf.yield %1 : memref<64x64xbf16>
            }
            %6 = arith.index_cast %arg2 : index to i32
            %c1_i32 = arith.constant 1 : i32
            %7 = arith.muli %6, %c1_i32 : i32
            %c0_i32 = arith.constant 0 : i32
            %8 = arith.addi %c0_i32, %7 : i32
            %9 = arith.index_cast %arg1 : index to i32
            %c4_i32 = arith.constant 4 : i32
            %10 = arith.muli %9, %c4_i32 : i32
            %c1_i32_6 = arith.constant 1 : i32
            %11 = arith.addi %c1_i32_6, %10 : i32
            %c0_7 = arith.constant 0 : index
            %c1_8 = arith.constant 1 : index
            memref.store %8, %flash_index_1_3[%c0_7] : memref<2xi32>
            memref.store %11, %flash_index_1_3[%c1_8] : memref<2xi32>
            %c64_i32 = arith.constant 64 : i32
            %c0_i32_9 = arith.constant 0 : i32
            %12 = arith.cmpi eq, %8, %c0_i32_9 : i32
            scf.if %12 {
              func.call @op0_init_scale_buffer(%flash_state_1_3, %c64_i32) : (memref<256xbf16>, i32) -> ()
            }
            %cst = arith.constant 1.4453125 : f32
            %13 = arith.truncf %cst : f32 to bf16
            %c64_i32_10 = arith.constant 64 : i32
            %c1024_i32 = arith.constant 1024 : i32
            %c1024_i32_11 = arith.constant 1024 : i32
            func.call @op0_partial_softmax(%4, %5, %flash_state_1_3, %flash_index_1_3, %13, %c64_i32, %c64_i32_10, %c1024_i32, %c1024_i32_11) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<256xbf16>, memref<2xi32>, bf16, i32, i32, i32, i32) -> ()
            %14 = aie.objectfifo.acquire @flash_scale_1_3(Produce, 1) : !aie.objectfifosubview<memref<256xbf16>>
            %15 = aie.objectfifo.subview.access %14[0] : !aie.objectfifosubview<memref<256xbf16>> -> memref<256xbf16>
            %c256_i32 = arith.constant 256 : i32
            func.call @op0_passThroughLine(%flash_state_1_3, %15, %c256_i32) : (memref<256xbf16>, memref<256xbf16>, i32) -> ()
            aie.objectfifo.release @flash_scale_1_3(Produce, 1)
            aie.objectfifo.release @of_7_unicast_1_0(Consume, 1)
            aie.objectfifo.release @of_8_unicast_1(Produce, 1)
          }
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
        %c4 = arith.constant 4 : index
        scf.for %arg1 = %c0_0 to %c4 step %c1_1 {
          %c16 = arith.constant 16 : index
          scf.for %arg2 = %c0_0 to %c16 step %c1_1 {
            %0 = aie.objectfifo.acquire @of_8_unicast_2(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            %2 = aie.objectfifo.acquire @of_7_unicast_2_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %3 = aie.objectfifo.subview.access %2[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            %c1_2 = arith.constant 1 : index
            %c0_3 = arith.constant 0 : index
            %4 = scf.index_switch %c0_3 -> memref<64x64xbf16> 
            case 0 {
              scf.yield %3 : memref<64x64xbf16>
            }
            default {
              scf.yield %3 : memref<64x64xbf16>
            }
            %c1_4 = arith.constant 1 : index
            %c0_5 = arith.constant 0 : index
            %5 = scf.index_switch %c0_5 -> memref<64x64xbf16> 
            case 0 {
              scf.yield %1 : memref<64x64xbf16>
            }
            default {
              scf.yield %1 : memref<64x64xbf16>
            }
            %6 = arith.index_cast %arg2 : index to i32
            %c1_i32 = arith.constant 1 : i32
            %7 = arith.muli %6, %c1_i32 : i32
            %c0_i32 = arith.constant 0 : i32
            %8 = arith.addi %c0_i32, %7 : i32
            %9 = arith.index_cast %arg1 : index to i32
            %c4_i32 = arith.constant 4 : i32
            %10 = arith.muli %9, %c4_i32 : i32
            %c2_i32 = arith.constant 2 : i32
            %11 = arith.addi %c2_i32, %10 : i32
            %c0_6 = arith.constant 0 : index
            %c1_7 = arith.constant 1 : index
            memref.store %8, %flash_index_2_3[%c0_6] : memref<2xi32>
            memref.store %11, %flash_index_2_3[%c1_7] : memref<2xi32>
            %c64_i32 = arith.constant 64 : i32
            %c0_i32_8 = arith.constant 0 : i32
            %12 = arith.cmpi eq, %8, %c0_i32_8 : i32
            scf.if %12 {
              func.call @op0_init_scale_buffer(%flash_state_2_3, %c64_i32) : (memref<256xbf16>, i32) -> ()
            }
            %cst = arith.constant 1.4453125 : f32
            %13 = arith.truncf %cst : f32 to bf16
            %c64_i32_9 = arith.constant 64 : i32
            %c1024_i32 = arith.constant 1024 : i32
            %c1024_i32_10 = arith.constant 1024 : i32
            func.call @op0_partial_softmax(%4, %5, %flash_state_2_3, %flash_index_2_3, %13, %c64_i32, %c64_i32_9, %c1024_i32, %c1024_i32_10) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<256xbf16>, memref<2xi32>, bf16, i32, i32, i32, i32) -> ()
            %14 = aie.objectfifo.acquire @flash_scale_2_3(Produce, 1) : !aie.objectfifosubview<memref<256xbf16>>
            %15 = aie.objectfifo.subview.access %14[0] : !aie.objectfifosubview<memref<256xbf16>> -> memref<256xbf16>
            %c256_i32 = arith.constant 256 : i32
            func.call @op0_passThroughLine(%flash_state_2_3, %15, %c256_i32) : (memref<256xbf16>, memref<256xbf16>, i32) -> ()
            aie.objectfifo.release @flash_scale_2_3(Produce, 1)
            aie.objectfifo.release @of_7_unicast_2_0(Consume, 1)
            aie.objectfifo.release @of_8_unicast_2(Produce, 1)
          }
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
        %c4 = arith.constant 4 : index
        scf.for %arg1 = %c0_0 to %c4 step %c1_1 {
          %c16 = arith.constant 16 : index
          scf.for %arg2 = %c0_0 to %c16 step %c1_1 {
            %0 = aie.objectfifo.acquire @of_8_unicast_3(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            %2 = aie.objectfifo.acquire @of_7_unicast_3_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %3 = aie.objectfifo.subview.access %2[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            %c1_2 = arith.constant 1 : index
            %c0_3 = arith.constant 0 : index
            %4 = scf.index_switch %c0_3 -> memref<64x64xbf16> 
            case 0 {
              scf.yield %3 : memref<64x64xbf16>
            }
            default {
              scf.yield %3 : memref<64x64xbf16>
            }
            %c1_4 = arith.constant 1 : index
            %c0_5 = arith.constant 0 : index
            %5 = scf.index_switch %c0_5 -> memref<64x64xbf16> 
            case 0 {
              scf.yield %1 : memref<64x64xbf16>
            }
            default {
              scf.yield %1 : memref<64x64xbf16>
            }
            %6 = arith.index_cast %arg2 : index to i32
            %c1_i32 = arith.constant 1 : i32
            %7 = arith.muli %6, %c1_i32 : i32
            %c0_i32 = arith.constant 0 : i32
            %8 = arith.addi %c0_i32, %7 : i32
            %9 = arith.index_cast %arg1 : index to i32
            %c4_i32 = arith.constant 4 : i32
            %10 = arith.muli %9, %c4_i32 : i32
            %c3_i32 = arith.constant 3 : i32
            %11 = arith.addi %c3_i32, %10 : i32
            %c0_6 = arith.constant 0 : index
            %c1_7 = arith.constant 1 : index
            memref.store %8, %flash_index_3_3[%c0_6] : memref<2xi32>
            memref.store %11, %flash_index_3_3[%c1_7] : memref<2xi32>
            %c64_i32 = arith.constant 64 : i32
            %c0_i32_8 = arith.constant 0 : i32
            %12 = arith.cmpi eq, %8, %c0_i32_8 : i32
            scf.if %12 {
              func.call @op0_init_scale_buffer(%flash_state_3_3, %c64_i32) : (memref<256xbf16>, i32) -> ()
            }
            %cst = arith.constant 1.4453125 : f32
            %13 = arith.truncf %cst : f32 to bf16
            %c64_i32_9 = arith.constant 64 : i32
            %c1024_i32 = arith.constant 1024 : i32
            %c1024_i32_10 = arith.constant 1024 : i32
            func.call @op0_partial_softmax(%4, %5, %flash_state_3_3, %flash_index_3_3, %13, %c64_i32, %c64_i32_9, %c1024_i32, %c1024_i32_10) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<256xbf16>, memref<2xi32>, bf16, i32, i32, i32, i32) -> ()
            %14 = aie.objectfifo.acquire @flash_scale_3_3(Produce, 1) : !aie.objectfifosubview<memref<256xbf16>>
            %15 = aie.objectfifo.subview.access %14[0] : !aie.objectfifosubview<memref<256xbf16>> -> memref<256xbf16>
            %c256_i32 = arith.constant 256 : i32
            func.call @op0_passThroughLine(%flash_state_3_3, %15, %c256_i32) : (memref<256xbf16>, memref<256xbf16>, i32) -> ()
            aie.objectfifo.release @flash_scale_3_3(Produce, 1)
            aie.objectfifo.release @of_7_unicast_3_0(Consume, 1)
            aie.objectfifo.release @of_8_unicast_3(Produce, 1)
          }
        }
      }
      aie.end
    } {link_with = "op0_mha.o"}
    aie.objectfifo @of_0_mem_0(%shim_noc_tile_1_0, {%mem_tile_1_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_0_mem_1(%shim_noc_tile_4_0, {%mem_tile_4_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_0_mem_2(%shim_noc_tile_5_0, {%mem_tile_5_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_0_mem_3(%shim_noc_tile_6_0, {%mem_tile_6_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_1_mem(%shim_noc_tile_7_0, {%mem_tile_7_1}, [1 : i32, 1 : i32]) : !aie.objectfifo<memref<16x64x64xbf16>>  
    aie.objectfifo @of_2_mem(%shim_noc_tile_0_0, {%mem_tile_0_1}, [1 : i32, 1 : i32]) : !aie.objectfifo<memref<16x64x64xbf16>>  
    aie.objectfifo @of_3_unicast_0_0(%mem_tile_1_1 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%tile_0_2}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo.link [@of_0_mem_0] -> [@of_3_unicast_0_0]([] [0])
    aie.objectfifo @of_3_unicast_1_0(%mem_tile_4_1 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%tile_1_2}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo.link [@of_0_mem_1] -> [@of_3_unicast_1_0]([] [0])
    aie.objectfifo @of_3_unicast_2_0(%mem_tile_5_1 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%tile_2_2}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo.link [@of_0_mem_2] -> [@of_3_unicast_2_0]([] [0])
    aie.objectfifo @of_3_unicast_3_0(%mem_tile_6_1 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%tile_3_2}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo.link [@of_0_mem_3] -> [@of_3_unicast_3_0]([] [0])
    aie.objectfifo @of_4_broadcast_0_0(%mem_tile_7_1 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%tile_0_2, %tile_1_2, %tile_2_2, %tile_3_2}, [2 : i32, 2 : i32, 2 : i32, 2 : i32, 2 : i32]) {repeat_count = 4 : i32} : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo.link [@of_1_mem] -> [@of_4_broadcast_0_0]([] [0])
    aie.objectfifo @of_5_broadcast_0_0(%mem_tile_0_1 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%tile_0_4, %tile_1_4, %tile_2_4, %tile_3_4}, [2 : i32, 2 : i32, 2 : i32, 2 : i32, 2 : i32]) {repeat_count = 4 : i32} : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo.link [@of_2_mem] -> [@of_5_broadcast_0_0]([] [0])
    aie.objectfifo @of_6_unicast_0(%tile_0_2, {%mem_tile_1_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_6_unicast_1(%tile_1_2, {%mem_tile_2_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_6_unicast_2(%tile_2_2, {%mem_tile_4_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_6_unicast_3(%tile_3_2, {%mem_tile_7_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_7_unicast_0_0(%mem_tile_1_1 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%tile_0_3}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo.link [@of_6_unicast_0] -> [@of_7_unicast_0_0]([] [0])
    aie.objectfifo @of_7_unicast_1_0(%mem_tile_2_1 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%tile_1_3}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo.link [@of_6_unicast_1] -> [@of_7_unicast_1_0]([] [0])
    aie.objectfifo @of_7_unicast_2_0(%mem_tile_4_1 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%tile_2_3}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo.link [@of_6_unicast_2] -> [@of_7_unicast_2_0]([] [0])
    aie.objectfifo @of_7_unicast_3_0(%mem_tile_7_1 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%tile_3_3}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo.link [@of_6_unicast_3] -> [@of_7_unicast_3_0]([] [0])
    aie.objectfifo @of_8_unicast_0(%tile_0_3, {%mem_tile_0_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_8_unicast_1(%tile_1_3, {%mem_tile_1_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_8_unicast_2(%tile_2_3, {%mem_tile_2_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_8_unicast_3(%tile_3_3, {%mem_tile_5_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_9_unicast_0_0(%mem_tile_0_1 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%tile_0_4}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo.link [@of_8_unicast_0] -> [@of_9_unicast_0_0]([] [0])
    aie.objectfifo @of_9_unicast_1_0(%mem_tile_1_1 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%tile_1_4}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo.link [@of_8_unicast_1] -> [@of_9_unicast_1_0]([] [0])
    aie.objectfifo @of_9_unicast_2_0(%mem_tile_2_1 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%tile_2_4}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo.link [@of_8_unicast_2] -> [@of_9_unicast_2_0]([] [0])
    aie.objectfifo @of_9_unicast_3_0(%mem_tile_5_1 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%tile_3_4}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo.link [@of_8_unicast_3] -> [@of_9_unicast_3_0]([] [0])
    aie.objectfifo @of_10_unicast_0(%tile_0_4, {%mem_tile_0_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_10_unicast_1(%tile_1_4, {%mem_tile_2_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_10_unicast_2(%tile_2_4, {%mem_tile_6_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_10_unicast_3(%tile_3_4, {%mem_tile_7_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_11_mem_0(%mem_tile_0_1 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%shim_noc_tile_0_0}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo.link [@of_10_unicast_0] -> [@of_11_mem_0]([] [])
    aie.objectfifo @of_11_mem_1(%mem_tile_2_1 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%shim_noc_tile_2_0}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo.link [@of_10_unicast_1] -> [@of_11_mem_1]([] [])
    aie.objectfifo @of_11_mem_2(%mem_tile_6_1 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%shim_noc_tile_6_0}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo.link [@of_10_unicast_2] -> [@of_11_mem_2]([] [])
    aie.objectfifo @of_11_mem_3(%mem_tile_7_1 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%shim_noc_tile_7_0}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo.link [@of_10_unicast_3] -> [@of_11_mem_3]([] [])
    func.func private @op0_zero_bf16_64_64_64(memref<64x64xbf16>)
    func.func private @op0_matmul_bf16_bf16_64_64_64(memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>)
    func.func private @op0_rescale_O(memref<64x64xbf16>, memref<256xbf16>, i32, memref<2xi32>)
    func.func private @op0_zero_bf16(memref<64x64xbf16>)
    func.func private @op0_matmul_PV(memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>, memref<256xbf16>, i32, i32, memref<2xi32>)
    func.func private @op0_init_scale_buffer(memref<256xbf16>, i32)
    func.func private @op0_passThroughLine(memref<256xbf16>, memref<256xbf16>, i32) attributes {link_with = "op0_mha_passThrough.o"}
    func.func private @op0_partial_softmax(memref<64x64xbf16>, memref<64x64xbf16>, memref<256xbf16>, memref<2xi32>, bf16, i32, i32, i32, i32)
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
