module {
  aie.device(npu2) @op0__MHAStreamGroup {
    %shim_noc_tile_1_0 = aie.tile(1, 0)
    %shim_noc_tile_2_0 = aie.tile(2, 0)
    %shim_noc_tile_3_0 = aie.tile(3, 0)
    %shim_noc_tile_4_0 = aie.tile(4, 0)
    %shim_noc_tile_5_0 = aie.tile(5, 0)
    %shim_noc_tile_6_0 = aie.tile(6, 0)
    %shim_noc_tile_7_0 = aie.tile(7, 0)
    %mem_tile_1_1 = aie.tile(1, 1)
    %mem_tile_2_1 = aie.tile(2, 1)
    %mem_tile_3_1 = aie.tile(3, 1)
    %mem_tile_4_1 = aie.tile(4, 1)
    %mem_tile_7_1 = aie.tile(7, 1)
    %mem_tile_5_1 = aie.tile(5, 1)
    %tile_0_2 = aie.tile(0, 2)
    %tile_1_2 = aie.tile(1, 2)
    %tile_2_2 = aie.tile(2, 2)
    %tile_3_2 = aie.tile(3, 2)
    %tile_0_4 = aie.tile(0, 4)
    %tile_1_4 = aie.tile(1, 4)
    %tile_2_4 = aie.tile(2, 4)
    %tile_3_4 = aie.tile(3, 4)
    %mem_tile_0_1 = aie.tile(0, 1)
    %mem_tile_6_1 = aie.tile(6, 1)
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
        aie.dma_bd(%arg1 : memref<64x1024xbf16> offset = 0 len = 65536 sizes = [4, 16, 64, 64] strides = [0, 64, 1024, 1])
        aie.end
      } {issue_token = true, iteration_t = 0 : index, repeat_count = 3 : i32}
      aiex.dma_start_task(%4)
      %5 = aiex.dma_configure_task_for @of_2_mem {
        aie.dma_bd(%arg2 : memref<1024x64xbf16> offset = 0 len = 65536 sizes = [4, 1, 256, 256] strides = [0, 0, 256, 1])
        aie.end
      } {issue_token = true, iteration_t = 0 : index, repeat_count = 3 : i32}
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
    aie.objectfifo @of_0_mem_1(%shim_noc_tile_2_0, {%mem_tile_2_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_0_mem_2(%shim_noc_tile_3_0, {%mem_tile_3_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_0_mem_3(%shim_noc_tile_4_0, {%mem_tile_4_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_1_mem(%shim_noc_tile_7_0, {%mem_tile_7_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_2_mem(%shim_noc_tile_5_0, {%mem_tile_5_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_3_unicast_0_0(%mem_tile_1_1 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%tile_0_2}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo.link [@of_0_mem_0] -> [@of_3_unicast_0_0]([] [0])
    aie.objectfifo @of_3_unicast_1_0(%mem_tile_2_1 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%tile_1_2}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo.link [@of_0_mem_1] -> [@of_3_unicast_1_0]([] [0])
    aie.objectfifo @of_3_unicast_2_0(%mem_tile_3_1 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%tile_2_2}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo.link [@of_0_mem_2] -> [@of_3_unicast_2_0]([] [0])
    aie.objectfifo @of_3_unicast_3_0(%mem_tile_4_1 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%tile_3_2}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo.link [@of_0_mem_3] -> [@of_3_unicast_3_0]([] [0])
    aie.objectfifo @of_4_broadcast_0_0(%mem_tile_7_1 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%tile_0_2, %tile_1_2, %tile_2_2, %tile_3_2}, [2 : i32, 2 : i32, 2 : i32, 2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo.link [@of_1_mem] -> [@of_4_broadcast_0_0]([] [0])
    aie.objectfifo @of_5_broadcast_0_0(%mem_tile_5_1 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%tile_0_4, %tile_1_4, %tile_2_4, %tile_3_4}, [2 : i32, 2 : i32, 2 : i32, 2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo.link [@of_2_mem] -> [@of_5_broadcast_0_0]([] [0])
    aie.objectfifo @of_6_unicast_0(%tile_0_2, {%mem_tile_0_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_6_unicast_1(%tile_1_2, {%mem_tile_1_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_6_unicast_2(%tile_2_2, {%mem_tile_2_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_6_unicast_3(%tile_3_2, {%mem_tile_6_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_7_unicast_0_0(%mem_tile_0_1 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%tile_0_3}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo.link [@of_6_unicast_0] -> [@of_7_unicast_0_0]([] [0])
    aie.objectfifo @of_7_unicast_1_0(%mem_tile_1_1 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%tile_1_3}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo.link [@of_6_unicast_1] -> [@of_7_unicast_1_0]([] [0])
    aie.objectfifo @of_7_unicast_2_0(%mem_tile_2_1 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%tile_2_3}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo.link [@of_6_unicast_2] -> [@of_7_unicast_2_0]([] [0])
    aie.objectfifo @of_7_unicast_3_0(%mem_tile_6_1 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%tile_3_3}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo.link [@of_6_unicast_3] -> [@of_7_unicast_3_0]([] [0])
    aie.objectfifo @of_8_unicast_0(%tile_0_3, {%mem_tile_0_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_8_unicast_1(%tile_1_3, {%mem_tile_3_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_8_unicast_2(%tile_2_3, {%mem_tile_6_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_8_unicast_3(%tile_3_3, {%mem_tile_7_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_9_unicast_0_0(%mem_tile_0_1 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%tile_0_4}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo.link [@of_8_unicast_0] -> [@of_9_unicast_0_0]([] [0])
    aie.objectfifo @of_9_unicast_1_0(%mem_tile_3_1 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%tile_1_4}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo.link [@of_8_unicast_1] -> [@of_9_unicast_1_0]([] [0])
    aie.objectfifo @of_9_unicast_2_0(%mem_tile_6_1 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%tile_2_4}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo.link [@of_8_unicast_2] -> [@of_9_unicast_2_0]([] [0])
    aie.objectfifo @of_9_unicast_3_0(%mem_tile_7_1 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%tile_3_4}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo.link [@of_8_unicast_3] -> [@of_9_unicast_3_0]([] [0])
    aie.objectfifo @of_10_unicast_0(%tile_0_4, {%mem_tile_2_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_10_unicast_1(%tile_1_4, {%mem_tile_4_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_10_unicast_2(%tile_2_4, {%mem_tile_6_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_10_unicast_3(%tile_3_4, {%mem_tile_7_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @of_11_mem_0(%mem_tile_2_1 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%shim_noc_tile_2_0}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo.link [@of_10_unicast_0] -> [@of_11_mem_0]([] [])
    aie.objectfifo @of_11_mem_1(%mem_tile_4_1 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%shim_noc_tile_4_0}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x64xbf16>>  
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
    aie.runtime_sequence(%arg0: memref<393216xbf16>, %arg1: memref<131072xbf16>, %arg2: memref<1xbf16>) {
      aiex.configure @op0__MHAStreamGroup {
        %subview = memref.subview %arg0[0] [65536] [1] : memref<393216xbf16> to memref<65536xbf16>
        %reinterpret_cast = memref.reinterpret_cast %subview to offset: [0], sizes: [1024, 64], strides: [64, 1] : memref<65536xbf16> to memref<1024x64xbf16>
        %subview_0 = memref.subview %arg0[131072] [65536] [1] : memref<393216xbf16> to memref<65536xbf16, strided<[1], offset: 131072>>
        %reinterpret_cast_1 = memref.reinterpret_cast %subview_0 to offset: [0], sizes: [64, 1024], strides: [1024, 1] : memref<65536xbf16, strided<[1], offset: 131072>> to memref<64x1024xbf16>
        %subview_2 = memref.subview %arg0[262144] [65536] [1] : memref<393216xbf16> to memref<65536xbf16, strided<[1], offset: 262144>>
        %reinterpret_cast_3 = memref.reinterpret_cast %subview_2 to offset: [0], sizes: [1024, 64], strides: [64, 1] : memref<65536xbf16, strided<[1], offset: 262144>> to memref<1024x64xbf16>
        %subview_4 = memref.subview %arg1[0] [65536] [1] : memref<131072xbf16> to memref<65536xbf16>
        %reinterpret_cast_5 = memref.reinterpret_cast %subview_4 to offset: [0], sizes: [1024, 64], strides: [64, 1] : memref<65536xbf16> to memref<1024x64xbf16>
        aiex.run @sequence(%reinterpret_cast, %reinterpret_cast_1, %reinterpret_cast_3, %reinterpret_cast_5) : (memref<1024x64xbf16>, memref<64x1024xbf16>, memref<1024x64xbf16>, memref<1024x64xbf16>)
        %subview_6 = memref.subview %arg0[65536] [65536] [1] : memref<393216xbf16> to memref<65536xbf16, strided<[1], offset: 65536>>
        %reinterpret_cast_7 = memref.reinterpret_cast %subview_6 to offset: [0], sizes: [1024, 64], strides: [64, 1] : memref<65536xbf16, strided<[1], offset: 65536>> to memref<1024x64xbf16>
        %subview_8 = memref.subview %arg0[196608] [65536] [1] : memref<393216xbf16> to memref<65536xbf16, strided<[1], offset: 196608>>
        %reinterpret_cast_9 = memref.reinterpret_cast %subview_8 to offset: [0], sizes: [64, 1024], strides: [1024, 1] : memref<65536xbf16, strided<[1], offset: 196608>> to memref<64x1024xbf16>
        %subview_10 = memref.subview %arg0[327680] [65536] [1] : memref<393216xbf16> to memref<65536xbf16, strided<[1], offset: 327680>>
        %reinterpret_cast_11 = memref.reinterpret_cast %subview_10 to offset: [0], sizes: [1024, 64], strides: [64, 1] : memref<65536xbf16, strided<[1], offset: 327680>> to memref<1024x64xbf16>
        %subview_12 = memref.subview %arg1[65536] [65536] [1] : memref<131072xbf16> to memref<65536xbf16, strided<[1], offset: 65536>>
        %reinterpret_cast_13 = memref.reinterpret_cast %subview_12 to offset: [0], sizes: [1024, 64], strides: [64, 1] : memref<65536xbf16, strided<[1], offset: 65536>> to memref<1024x64xbf16>
        aiex.run @sequence(%reinterpret_cast_7, %reinterpret_cast_9, %reinterpret_cast_11, %reinterpret_cast_13) : (memref<1024x64xbf16>, memref<64x1024xbf16>, memref<1024x64xbf16>, memref<1024x64xbf16>)
      }
      aiex.configure @reset_device {
      }
    }
  }
}
