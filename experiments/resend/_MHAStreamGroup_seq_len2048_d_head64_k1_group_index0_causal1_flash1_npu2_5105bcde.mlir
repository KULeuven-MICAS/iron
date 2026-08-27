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
    %tile_0_5 = aie.tile(0, 5)
    %tile_1_5 = aie.tile(1, 5)
    %tile_2_5 = aie.tile(2, 5)
    %tile_3_5 = aie.tile(3, 5)
    %tile_4_5 = aie.tile(4, 5)
    %tile_5_5 = aie.tile(5, 5)
    %tile_6_5 = aie.tile(6, 5)
    %tile_7_5 = aie.tile(7, 5)
    aie.runtime_sequence(%arg0: memref<2048x64xbf16>, %arg1: memref<64x2048xbf16>, %arg2: memref<2048x64xbf16>, %arg3: memref<2048x64xbf16>) {
      %0 = aiex.dma_configure_task_for @of_0_mem_0 {
        aie.dma_bd(%arg0 : memref<2048x64xbf16> offset = 0 len = 16384 sizes = [1, 4, 64, 64] strides = [0, 32768, 64, 1])
        aie.end
      } {issue_token = true, iteration_t = 0 : index}
      aiex.dma_start_task(%0)
      %1 = aiex.dma_configure_task_for @of_0_mem_1 {
        aie.dma_bd(%arg0 : memref<2048x64xbf16> offset = 4096 len = 16384 sizes = [1, 4, 64, 64] strides = [0, 32768, 64, 1])
        aie.end
      } {issue_token = true, iteration_t = 0 : index}
      aiex.dma_start_task(%1)
      %2 = aiex.dma_configure_task_for @of_0_mem_2 {
        aie.dma_bd(%arg0 : memref<2048x64xbf16> offset = 8192 len = 16384 sizes = [1, 4, 64, 64] strides = [0, 32768, 64, 1])
        aie.end
      } {issue_token = true, iteration_t = 0 : index}
      aiex.dma_start_task(%2)
      %3 = aiex.dma_configure_task_for @of_0_mem_3 {
        aie.dma_bd(%arg0 : memref<2048x64xbf16> offset = 12288 len = 16384 sizes = [1, 4, 64, 64] strides = [0, 32768, 64, 1])
        aie.end
      } {issue_token = true, iteration_t = 0 : index}
      aiex.dma_start_task(%3)
      %4 = aiex.dma_configure_task_for @of_0_mem_4 {
        aie.dma_bd(%arg0 : memref<2048x64xbf16> offset = 16384 len = 16384 sizes = [1, 4, 64, 64] strides = [0, 32768, 64, 1])
        aie.end
      } {issue_token = true, iteration_t = 0 : index}
      aiex.dma_start_task(%4)
      %5 = aiex.dma_configure_task_for @of_0_mem_5 {
        aie.dma_bd(%arg0 : memref<2048x64xbf16> offset = 20480 len = 16384 sizes = [1, 4, 64, 64] strides = [0, 32768, 64, 1])
        aie.end
      } {issue_token = true, iteration_t = 0 : index}
      aiex.dma_start_task(%5)
      %6 = aiex.dma_configure_task_for @of_0_mem_6 {
        aie.dma_bd(%arg0 : memref<2048x64xbf16> offset = 24576 len = 16384 sizes = [1, 4, 64, 64] strides = [0, 32768, 64, 1])
        aie.end
      } {issue_token = true, iteration_t = 0 : index}
      aiex.dma_start_task(%6)
      %7 = aiex.dma_configure_task_for @of_0_mem_7 {
        aie.dma_bd(%arg0 : memref<2048x64xbf16> offset = 28672 len = 16384 sizes = [1, 4, 64, 64] strides = [0, 32768, 64, 1])
        aie.end
      } {issue_token = true, iteration_t = 0 : index}
      aiex.dma_start_task(%7)
      %8 = aiex.dma_configure_task_for @of_1_mem {
        aie.dma_bd(%arg1 : memref<64x2048xbf16> offset = 0 len = 131072 sizes = [2, 32, 64, 64] strides = [0, 64, 2048, 1])
        aie.end
      } {issue_token = true, iteration_t = 0 : index, repeat_count = 1 : i32}
      aiex.dma_start_task(%8)
      %9 = aiex.dma_configure_task_for @of_2_mem {
        aie.dma_bd(%arg2 : memref<2048x64xbf16> offset = 0 len = 131072 sizes = [2, 1, 256, 512] strides = [0, 0, 512, 1])
        aie.end
      } {issue_token = true, iteration_t = 0 : index, repeat_count = 1 : i32}
      aiex.dma_start_task(%9)
      %10 = aiex.dma_configure_task_for @of_10_mem_0 {
        aie.dma_bd(%arg3 : memref<2048x64xbf16> offset = 0 len = 16384 sizes = [1, 4, 64, 64] strides = [0, 32768, 64, 1])
        aie.end
      } {issue_token = true, iteration_t = 0 : index}
      aiex.dma_start_task(%10)
      %11 = aiex.dma_configure_task_for @of_10_mem_1 {
        aie.dma_bd(%arg3 : memref<2048x64xbf16> offset = 4096 len = 16384 sizes = [1, 4, 64, 64] strides = [0, 32768, 64, 1])
        aie.end
      } {issue_token = true, iteration_t = 0 : index}
      aiex.dma_start_task(%11)
      %12 = aiex.dma_configure_task_for @of_10_mem_2 {
        aie.dma_bd(%arg3 : memref<2048x64xbf16> offset = 8192 len = 16384 sizes = [1, 4, 64, 64] strides = [0, 32768, 64, 1])
        aie.end
      } {issue_token = true, iteration_t = 0 : index}
      aiex.dma_start_task(%12)
      %13 = aiex.dma_configure_task_for @of_10_mem_3 {
        aie.dma_bd(%arg3 : memref<2048x64xbf16> offset = 12288 len = 16384 sizes = [1, 4, 64, 64] strides = [0, 32768, 64, 1])
        aie.end
      } {issue_token = true, iteration_t = 0 : index}
      aiex.dma_start_task(%13)
      %14 = aiex.dma_configure_task_for @of_10_mem_4 {
        aie.dma_bd(%arg3 : memref<2048x64xbf16> offset = 16384 len = 16384 sizes = [1, 4, 64, 64] strides = [0, 32768, 64, 1])
        aie.end
      } {issue_token = true, iteration_t = 0 : index}
      aiex.dma_start_task(%14)
      %15 = aiex.dma_configure_task_for @of_10_mem_5 {
        aie.dma_bd(%arg3 : memref<2048x64xbf16> offset = 20480 len = 16384 sizes = [1, 4, 64, 64] strides = [0, 32768, 64, 1])
        aie.end
      } {issue_token = true, iteration_t = 0 : index}
      aiex.dma_start_task(%15)
      %16 = aiex.dma_configure_task_for @of_10_mem_6 {
        aie.dma_bd(%arg3 : memref<2048x64xbf16> offset = 24576 len = 16384 sizes = [1, 4, 64, 64] strides = [0, 32768, 64, 1])
        aie.end
      } {issue_token = true, iteration_t = 0 : index}
      aiex.dma_start_task(%16)
      %17 = aiex.dma_configure_task_for @of_10_mem_7 {
        aie.dma_bd(%arg3 : memref<2048x64xbf16> offset = 28672 len = 16384 sizes = [1, 4, 64, 64] strides = [0, 32768, 64, 1])
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
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c2 = arith.constant 2 : index
        scf.for %arg1 = %c0_0 to %c2 step %c1_1 {
          %0 = aie.objectfifo.acquire @of_3_unicast_0_0(Consume, 2) : !aie.objectfifosubview<memref<64x64xbf16>>
          %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
          %2 = aie.objectfifo.subview.access %0[1] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
          %c32 = arith.constant 32 : index
          scf.for %arg2 = %c0_0 to %c32 step %c1_1 {
            %3 = aie.objectfifo.acquire @of_4_broadcast_0_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %4 = aie.objectfifo.subview.access %3[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            %c2_2 = arith.constant 2 : index
            %5 = aie.objectfifo.acquire @of_6_unicast_0(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %6 = aie.objectfifo.acquire @of_6_unicast_0_relay_1(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %7 = aie.objectfifo.subview.access %5[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            func.call @op0_zero_bf16_64_64_64(%7) : (memref<64x64xbf16>) -> ()
            %8 = aie.objectfifo.subview.access %6[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            func.call @op0_zero_bf16_64_64_64(%8) : (memref<64x64xbf16>) -> ()
            scf.for %arg3 = %c0_0 to %c2_2 step %c1_1 {
              %9 = scf.index_switch %arg3 -> memref<64x64xbf16> 
              case 0 {
                scf.yield %7 : memref<64x64xbf16>
              }
              case 1 {
                scf.yield %8 : memref<64x64xbf16>
              }
              default {
                scf.yield %7 : memref<64x64xbf16>
              }
              %c1_3 = arith.constant 1 : index
              %c0_4 = arith.constant 0 : index
              %10 = arith.muli %c1_3, %arg3 : index
              %11 = arith.addi %c0_4, %10 : index
              %12 = arith.muli %c1_3, %c2_2 : index
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
              %c0_i32_5 = arith.constant 0 : i32
              %21 = arith.addi %c0_i32_5, %18 : i32
              %22 = arith.addi %21, %20 : i32
              %23 = arith.cmpi sle, %16, %22 : i32
              scf.if %23 {
                func.call @op0_matmul_bf16_bf16_64_64_64(%13, %4, %9) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>) -> ()
              }
            }
            aie.objectfifo.release @of_6_unicast_0(Produce, 1)
            aie.objectfifo.release @of_6_unicast_0_relay_1(Produce, 1)
            aie.objectfifo.release @of_4_broadcast_0_0(Consume, 1)
          }
          aie.objectfifo.release @of_3_unicast_0_0(Consume, 2)
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
        %c2 = arith.constant 2 : index
        scf.for %arg1 = %c0_0 to %c2 step %c1_1 {
          %0 = aie.objectfifo.acquire @of_3_unicast_1_0(Consume, 2) : !aie.objectfifosubview<memref<64x64xbf16>>
          %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
          %2 = aie.objectfifo.subview.access %0[1] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
          %c32 = arith.constant 32 : index
          scf.for %arg2 = %c0_0 to %c32 step %c1_1 {
            %3 = aie.objectfifo.acquire @of_4_broadcast_0_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %4 = aie.objectfifo.subview.access %3[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            %c2_2 = arith.constant 2 : index
            %5 = aie.objectfifo.acquire @of_6_unicast_1(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %6 = aie.objectfifo.acquire @of_6_unicast_1_relay_1(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %7 = aie.objectfifo.subview.access %5[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            func.call @op0_zero_bf16_64_64_64(%7) : (memref<64x64xbf16>) -> ()
            %8 = aie.objectfifo.subview.access %6[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            func.call @op0_zero_bf16_64_64_64(%8) : (memref<64x64xbf16>) -> ()
            scf.for %arg3 = %c0_0 to %c2_2 step %c1_1 {
              %9 = scf.index_switch %arg3 -> memref<64x64xbf16> 
              case 0 {
                scf.yield %7 : memref<64x64xbf16>
              }
              case 1 {
                scf.yield %8 : memref<64x64xbf16>
              }
              default {
                scf.yield %7 : memref<64x64xbf16>
              }
              %c1_3 = arith.constant 1 : index
              %c0_4 = arith.constant 0 : index
              %10 = arith.muli %c1_3, %arg3 : index
              %11 = arith.addi %c0_4, %10 : index
              %12 = arith.muli %c1_3, %c2_2 : index
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
              %c1_i32_5 = arith.constant 1 : i32
              %21 = arith.addi %c1_i32_5, %18 : i32
              %22 = arith.addi %21, %20 : i32
              %23 = arith.cmpi sle, %16, %22 : i32
              scf.if %23 {
                func.call @op0_matmul_bf16_bf16_64_64_64(%13, %4, %9) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>) -> ()
              }
            }
            aie.objectfifo.release @of_6_unicast_1(Produce, 1)
            aie.objectfifo.release @of_6_unicast_1_relay_1(Produce, 1)
            aie.objectfifo.release @of_4_broadcast_0_0(Consume, 1)
          }
          aie.objectfifo.release @of_3_unicast_1_0(Consume, 2)
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
        %c2 = arith.constant 2 : index
        scf.for %arg1 = %c0_0 to %c2 step %c1_1 {
          %0 = aie.objectfifo.acquire @of_3_unicast_2_0(Consume, 2) : !aie.objectfifosubview<memref<64x64xbf16>>
          %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
          %2 = aie.objectfifo.subview.access %0[1] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
          %c32 = arith.constant 32 : index
          scf.for %arg2 = %c0_0 to %c32 step %c1_1 {
            %3 = aie.objectfifo.acquire @of_4_broadcast_0_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %4 = aie.objectfifo.subview.access %3[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            %c2_2 = arith.constant 2 : index
            %5 = aie.objectfifo.acquire @of_6_unicast_2(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %6 = aie.objectfifo.acquire @of_6_unicast_2_relay_1(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %7 = aie.objectfifo.subview.access %5[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            func.call @op0_zero_bf16_64_64_64(%7) : (memref<64x64xbf16>) -> ()
            %8 = aie.objectfifo.subview.access %6[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            func.call @op0_zero_bf16_64_64_64(%8) : (memref<64x64xbf16>) -> ()
            scf.for %arg3 = %c0_0 to %c2_2 step %c1_1 {
              %9 = scf.index_switch %arg3 -> memref<64x64xbf16> 
              case 0 {
                scf.yield %7 : memref<64x64xbf16>
              }
              case 1 {
                scf.yield %8 : memref<64x64xbf16>
              }
              default {
                scf.yield %7 : memref<64x64xbf16>
              }
              %c1_3 = arith.constant 1 : index
              %c0_4 = arith.constant 0 : index
              %10 = arith.muli %c1_3, %arg3 : index
              %11 = arith.addi %c0_4, %10 : index
              %12 = arith.muli %c1_3, %c2_2 : index
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
              %23 = arith.cmpi sle, %16, %22 : i32
              scf.if %23 {
                func.call @op0_matmul_bf16_bf16_64_64_64(%13, %4, %9) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>) -> ()
              }
            }
            aie.objectfifo.release @of_6_unicast_2(Produce, 1)
            aie.objectfifo.release @of_6_unicast_2_relay_1(Produce, 1)
            aie.objectfifo.release @of_4_broadcast_0_0(Consume, 1)
          }
          aie.objectfifo.release @of_3_unicast_2_0(Consume, 2)
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
        %c2 = arith.constant 2 : index
        scf.for %arg1 = %c0_0 to %c2 step %c1_1 {
          %0 = aie.objectfifo.acquire @of_3_unicast_3_0(Consume, 2) : !aie.objectfifosubview<memref<64x64xbf16>>
          %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
          %2 = aie.objectfifo.subview.access %0[1] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
          %c32 = arith.constant 32 : index
          scf.for %arg2 = %c0_0 to %c32 step %c1_1 {
            %3 = aie.objectfifo.acquire @of_4_broadcast_0_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %4 = aie.objectfifo.subview.access %3[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            %c2_2 = arith.constant 2 : index
            %5 = aie.objectfifo.acquire @of_6_unicast_3(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %6 = aie.objectfifo.acquire @of_6_unicast_3_relay_1(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %7 = aie.objectfifo.subview.access %5[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            func.call @op0_zero_bf16_64_64_64(%7) : (memref<64x64xbf16>) -> ()
            %8 = aie.objectfifo.subview.access %6[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            func.call @op0_zero_bf16_64_64_64(%8) : (memref<64x64xbf16>) -> ()
            scf.for %arg3 = %c0_0 to %c2_2 step %c1_1 {
              %9 = scf.index_switch %arg3 -> memref<64x64xbf16> 
              case 0 {
                scf.yield %7 : memref<64x64xbf16>
              }
              case 1 {
                scf.yield %8 : memref<64x64xbf16>
              }
              default {
                scf.yield %7 : memref<64x64xbf16>
              }
              %c1_3 = arith.constant 1 : index
              %c0_4 = arith.constant 0 : index
              %10 = arith.muli %c1_3, %arg3 : index
              %11 = arith.addi %c0_4, %10 : index
              %12 = arith.muli %c1_3, %c2_2 : index
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
              %23 = arith.cmpi sle, %16, %22 : i32
              scf.if %23 {
                func.call @op0_matmul_bf16_bf16_64_64_64(%13, %4, %9) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>) -> ()
              }
            }
            aie.objectfifo.release @of_6_unicast_3(Produce, 1)
            aie.objectfifo.release @of_6_unicast_3_relay_1(Produce, 1)
            aie.objectfifo.release @of_4_broadcast_0_0(Consume, 1)
          }
          aie.objectfifo.release @of_3_unicast_3_0(Consume, 2)
        }
      }
      aie.end
    } {link_with = "op0_mm_64_64_64.o"}
    %core_4_2 = aie.core(%tile_4_2) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c2 = arith.constant 2 : index
        scf.for %arg1 = %c0_0 to %c2 step %c1_1 {
          %0 = aie.objectfifo.acquire @of_3_unicast_4_0(Consume, 2) : !aie.objectfifosubview<memref<64x64xbf16>>
          %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
          %2 = aie.objectfifo.subview.access %0[1] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
          %c32 = arith.constant 32 : index
          scf.for %arg2 = %c0_0 to %c32 step %c1_1 {
            %3 = aie.objectfifo.acquire @of_4_broadcast_0_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %4 = aie.objectfifo.subview.access %3[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            %c2_2 = arith.constant 2 : index
            %5 = aie.objectfifo.acquire @of_6_unicast_4(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %6 = aie.objectfifo.acquire @of_6_unicast_4_relay_1(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %7 = aie.objectfifo.subview.access %5[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            func.call @op0_zero_bf16_64_64_64(%7) : (memref<64x64xbf16>) -> ()
            %8 = aie.objectfifo.subview.access %6[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            func.call @op0_zero_bf16_64_64_64(%8) : (memref<64x64xbf16>) -> ()
            scf.for %arg3 = %c0_0 to %c2_2 step %c1_1 {
              %9 = scf.index_switch %arg3 -> memref<64x64xbf16> 
              case 0 {
                scf.yield %7 : memref<64x64xbf16>
              }
              case 1 {
                scf.yield %8 : memref<64x64xbf16>
              }
              default {
                scf.yield %7 : memref<64x64xbf16>
              }
              %c1_3 = arith.constant 1 : index
              %c0_4 = arith.constant 0 : index
              %10 = arith.muli %c1_3, %arg3 : index
              %11 = arith.addi %c0_4, %10 : index
              %12 = arith.muli %c1_3, %c2_2 : index
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
              %23 = arith.cmpi sle, %16, %22 : i32
              scf.if %23 {
                func.call @op0_matmul_bf16_bf16_64_64_64(%13, %4, %9) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>) -> ()
              }
            }
            aie.objectfifo.release @of_6_unicast_4(Produce, 1)
            aie.objectfifo.release @of_6_unicast_4_relay_1(Produce, 1)
            aie.objectfifo.release @of_4_broadcast_0_0(Consume, 1)
          }
          aie.objectfifo.release @of_3_unicast_4_0(Consume, 2)
        }
      }
      aie.end
    } {link_with = "op0_mm_64_64_64.o"}
    %core_5_2 = aie.core(%tile_5_2) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c2 = arith.constant 2 : index
        scf.for %arg1 = %c0_0 to %c2 step %c1_1 {
          %0 = aie.objectfifo.acquire @of_3_unicast_5_0(Consume, 2) : !aie.objectfifosubview<memref<64x64xbf16>>
          %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
          %2 = aie.objectfifo.subview.access %0[1] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
          %c32 = arith.constant 32 : index
          scf.for %arg2 = %c0_0 to %c32 step %c1_1 {
            %3 = aie.objectfifo.acquire @of_4_broadcast_0_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %4 = aie.objectfifo.subview.access %3[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            %c2_2 = arith.constant 2 : index
            %5 = aie.objectfifo.acquire @of_6_unicast_5(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %6 = aie.objectfifo.acquire @of_6_unicast_5_relay_1(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %7 = aie.objectfifo.subview.access %5[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            func.call @op0_zero_bf16_64_64_64(%7) : (memref<64x64xbf16>) -> ()
            %8 = aie.objectfifo.subview.access %6[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            func.call @op0_zero_bf16_64_64_64(%8) : (memref<64x64xbf16>) -> ()
            scf.for %arg3 = %c0_0 to %c2_2 step %c1_1 {
              %9 = scf.index_switch %arg3 -> memref<64x64xbf16> 
              case 0 {
                scf.yield %7 : memref<64x64xbf16>
              }
              case 1 {
                scf.yield %8 : memref<64x64xbf16>
              }
              default {
                scf.yield %7 : memref<64x64xbf16>
              }
              %c1_3 = arith.constant 1 : index
              %c0_4 = arith.constant 0 : index
              %10 = arith.muli %c1_3, %arg3 : index
              %11 = arith.addi %c0_4, %10 : index
              %12 = arith.muli %c1_3, %c2_2 : index
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
              %23 = arith.cmpi sle, %16, %22 : i32
              scf.if %23 {
                func.call @op0_matmul_bf16_bf16_64_64_64(%13, %4, %9) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>) -> ()
              }
            }
            aie.objectfifo.release @of_6_unicast_5(Produce, 1)
            aie.objectfifo.release @of_6_unicast_5_relay_1(Produce, 1)
            aie.objectfifo.release @of_4_broadcast_0_0(Consume, 1)
          }
          aie.objectfifo.release @of_3_unicast_5_0(Consume, 2)
        }
      }
      aie.end
    } {link_with = "op0_mm_64_64_64.o"}
    %core_6_2 = aie.core(%tile_6_2) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c2 = arith.constant 2 : index
        scf.for %arg1 = %c0_0 to %c2 step %c1_1 {
          %0 = aie.objectfifo.acquire @of_3_unicast_6_0(Consume, 2) : !aie.objectfifosubview<memref<64x64xbf16>>
          %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
          %2 = aie.objectfifo.subview.access %0[1] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
          %c32 = arith.constant 32 : index
          scf.for %arg2 = %c0_0 to %c32 step %c1_1 {
            %3 = aie.objectfifo.acquire @of_4_broadcast_0_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %4 = aie.objectfifo.subview.access %3[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            %c2_2 = arith.constant 2 : index
            %5 = aie.objectfifo.acquire @of_6_unicast_6(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %6 = aie.objectfifo.acquire @of_6_unicast_6_relay_1(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %7 = aie.objectfifo.subview.access %5[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            func.call @op0_zero_bf16_64_64_64(%7) : (memref<64x64xbf16>) -> ()
            %8 = aie.objectfifo.subview.access %6[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            func.call @op0_zero_bf16_64_64_64(%8) : (memref<64x64xbf16>) -> ()
            scf.for %arg3 = %c0_0 to %c2_2 step %c1_1 {
              %9 = scf.index_switch %arg3 -> memref<64x64xbf16> 
              case 0 {
                scf.yield %7 : memref<64x64xbf16>
              }
              case 1 {
                scf.yield %8 : memref<64x64xbf16>
              }
              default {
                scf.yield %7 : memref<64x64xbf16>
              }
              %c1_3 = arith.constant 1 : index
              %c0_4 = arith.constant 0 : index
              %10 = arith.muli %c1_3, %arg3 : index
              %11 = arith.addi %c0_4, %10 : index
              %12 = arith.muli %c1_3, %c2_2 : index
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
              %23 = arith.cmpi sle, %16, %22 : i32
              scf.if %23 {
                func.call @op0_matmul_bf16_bf16_64_64_64(%13, %4, %9) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>) -> ()
              }
            }
            aie.objectfifo.release @of_6_unicast_6(Produce, 1)
            aie.objectfifo.release @of_6_unicast_6_relay_1(Produce, 1)
            aie.objectfifo.release @of_4_broadcast_0_0(Consume, 1)
          }
          aie.objectfifo.release @of_3_unicast_6_0(Consume, 2)
        }
      }
      aie.end
    } {link_with = "op0_mm_64_64_64.o"}
    %core_7_2 = aie.core(%tile_7_2) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c2 = arith.constant 2 : index
        scf.for %arg1 = %c0_0 to %c2 step %c1_1 {
          %0 = aie.objectfifo.acquire @of_3_unicast_7_0(Consume, 2) : !aie.objectfifosubview<memref<64x64xbf16>>
          %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
          %2 = aie.objectfifo.subview.access %0[1] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
          %c32 = arith.constant 32 : index
          scf.for %arg2 = %c0_0 to %c32 step %c1_1 {
            %3 = aie.objectfifo.acquire @of_4_broadcast_0_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %4 = aie.objectfifo.subview.access %3[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            %c2_2 = arith.constant 2 : index
            %5 = aie.objectfifo.acquire @of_6_unicast_7(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %6 = aie.objectfifo.acquire @of_6_unicast_7_relay_1(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %7 = aie.objectfifo.subview.access %5[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            func.call @op0_zero_bf16_64_64_64(%7) : (memref<64x64xbf16>) -> ()
            %8 = aie.objectfifo.subview.access %6[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            func.call @op0_zero_bf16_64_64_64(%8) : (memref<64x64xbf16>) -> ()
            scf.for %arg3 = %c0_0 to %c2_2 step %c1_1 {
              %9 = scf.index_switch %arg3 -> memref<64x64xbf16> 
              case 0 {
                scf.yield %7 : memref<64x64xbf16>
              }
              case 1 {
                scf.yield %8 : memref<64x64xbf16>
              }
              default {
                scf.yield %7 : memref<64x64xbf16>
              }
              %c1_3 = arith.constant 1 : index
              %c0_4 = arith.constant 0 : index
              %10 = arith.muli %c1_3, %arg3 : index
              %11 = arith.addi %c0_4, %10 : index
              %12 = arith.muli %c1_3, %c2_2 : index
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
              %23 = arith.cmpi sle, %16, %22 : i32
              scf.if %23 {
                func.call @op0_matmul_bf16_bf16_64_64_64(%13, %4, %9) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>) -> ()
              }
            }
            aie.objectfifo.release @of_6_unicast_7(Produce, 1)
            aie.objectfifo.release @of_6_unicast_7_relay_1(Produce, 1)
            aie.objectfifo.release @of_4_broadcast_0_0(Consume, 1)
          }
          aie.objectfifo.release @of_3_unicast_7_0(Consume, 2)
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
        %c2 = arith.constant 2 : index
        scf.for %arg1 = %c0_0 to %c2 step %c1_1 {
          %0 = aie.objectfifo.acquire @of_9_unicast_0(Produce, 2) : !aie.objectfifosubview<memref<64x64xbf16>>
          %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
          func.call @op0_zero_bf16(%1) : (memref<64x64xbf16>) -> ()
          %2 = aie.objectfifo.subview.access %0[1] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
          func.call @op0_zero_bf16(%2) : (memref<64x64xbf16>) -> ()
          %c32 = arith.constant 32 : index
          scf.for %arg2 = %c0_0 to %c32 step %c1_1 {
            %3 = aie.objectfifo.acquire @of_5_broadcast_0_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %4 = aie.objectfifo.subview.access %3[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            %c2_2 = arith.constant 2 : index
            %5 = aie.objectfifo.acquire @of_8_switch_join_0_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %6 = aie.objectfifo.acquire @of_8_switch_join_0_1(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %7 = aie.objectfifo.subview.access %5[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            %8 = aie.objectfifo.subview.access %6[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            scf.for %arg3 = %c0_0 to %c2_2 step %c1_1 {
              %c1_3 = arith.constant 1 : index
              %c0_4 = arith.constant 0 : index
              %9 = arith.muli %c1_3, %arg3 : index
              %10 = arith.addi %c0_4, %9 : index
              %11 = arith.muli %c1_3, %c2_2 : index
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
              %c0_i32_5 = arith.constant 0 : i32
              %21 = arith.addi %c0_i32_5, %18 : i32
              %22 = arith.addi %21, %20 : i32
              %c0_6 = arith.constant 0 : index
              %c1_7 = arith.constant 1 : index
              memref.store %16, %flash_index_0_4[%c0_6] : memref<2xi32>
              memref.store %22, %flash_index_0_4[%c1_7] : memref<2xi32>
              scf.index_switch %arg3 
              case 0 {
                %23 = aie.objectfifo.acquire @flash_scale_0_3(Consume, 1) : !aie.objectfifosubview<memref<256xbf16>>
                %24 = aie.objectfifo.subview.access %23[0] : !aie.objectfifosubview<memref<256xbf16>> -> memref<256xbf16>
                %c64_i32 = arith.constant 64 : i32
                %c0_i32_8 = arith.constant 0 : i32
                %25 = arith.cmpi ne, %16, %c0_i32_8 : i32
                %26 = arith.extui %25 : i1 to i32
                func.call @op0_matmul_PV(%13, %4, %12, %24, %c64_i32, %26, %flash_index_0_4) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>, memref<256xbf16>, i32, i32, memref<2xi32>) -> ()
                %c31_i32 = arith.constant 31 : i32
                %27 = arith.cmpi eq, %16, %c31_i32 : i32
                scf.if %27 {
                  func.call @op0_rescale_O(%12, %24, %c64_i32, %flash_index_0_4) : (memref<64x64xbf16>, memref<256xbf16>, i32, memref<2xi32>) -> ()
                }
                aie.objectfifo.release @flash_scale_0_3(Consume, 1)
                scf.yield
              }
              case 1 {
                %23 = aie.objectfifo.acquire @flash_scale_0_5(Consume, 1) : !aie.objectfifosubview<memref<256xbf16>>
                %24 = aie.objectfifo.subview.access %23[0] : !aie.objectfifosubview<memref<256xbf16>> -> memref<256xbf16>
                %c64_i32 = arith.constant 64 : i32
                %c0_i32_8 = arith.constant 0 : i32
                %25 = arith.cmpi ne, %16, %c0_i32_8 : i32
                %26 = arith.extui %25 : i1 to i32
                func.call @op0_matmul_PV(%13, %4, %12, %24, %c64_i32, %26, %flash_index_0_4) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>, memref<256xbf16>, i32, i32, memref<2xi32>) -> ()
                %c31_i32 = arith.constant 31 : i32
                %27 = arith.cmpi eq, %16, %c31_i32 : i32
                scf.if %27 {
                  func.call @op0_rescale_O(%12, %24, %c64_i32, %flash_index_0_4) : (memref<64x64xbf16>, memref<256xbf16>, i32, memref<2xi32>) -> ()
                }
                aie.objectfifo.release @flash_scale_0_5(Consume, 1)
                scf.yield
              }
              default {
                %23 = aie.objectfifo.acquire @flash_scale_0_3(Consume, 1) : !aie.objectfifosubview<memref<256xbf16>>
                %24 = aie.objectfifo.subview.access %23[0] : !aie.objectfifosubview<memref<256xbf16>> -> memref<256xbf16>
                %c64_i32 = arith.constant 64 : i32
                %c0_i32_8 = arith.constant 0 : i32
                %25 = arith.cmpi ne, %16, %c0_i32_8 : i32
                %26 = arith.extui %25 : i1 to i32
                func.call @op0_matmul_PV(%13, %4, %12, %24, %c64_i32, %26, %flash_index_0_4) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>, memref<256xbf16>, i32, i32, memref<2xi32>) -> ()
                %c31_i32 = arith.constant 31 : i32
                %27 = arith.cmpi eq, %16, %c31_i32 : i32
                scf.if %27 {
                  func.call @op0_rescale_O(%12, %24, %c64_i32, %flash_index_0_4) : (memref<64x64xbf16>, memref<256xbf16>, i32, memref<2xi32>) -> ()
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
        %c2 = arith.constant 2 : index
        scf.for %arg1 = %c0_0 to %c2 step %c1_1 {
          %0 = aie.objectfifo.acquire @of_9_unicast_1(Produce, 2) : !aie.objectfifosubview<memref<64x64xbf16>>
          %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
          func.call @op0_zero_bf16(%1) : (memref<64x64xbf16>) -> ()
          %2 = aie.objectfifo.subview.access %0[1] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
          func.call @op0_zero_bf16(%2) : (memref<64x64xbf16>) -> ()
          %c32 = arith.constant 32 : index
          scf.for %arg2 = %c0_0 to %c32 step %c1_1 {
            %3 = aie.objectfifo.acquire @of_5_broadcast_0_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %4 = aie.objectfifo.subview.access %3[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            %c2_2 = arith.constant 2 : index
            %5 = aie.objectfifo.acquire @of_8_switch_join_1_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %6 = aie.objectfifo.acquire @of_8_switch_join_1_1(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %7 = aie.objectfifo.subview.access %5[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            %8 = aie.objectfifo.subview.access %6[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            scf.for %arg3 = %c0_0 to %c2_2 step %c1_1 {
              %c1_3 = arith.constant 1 : index
              %c0_4 = arith.constant 0 : index
              %9 = arith.muli %c1_3, %arg3 : index
              %10 = arith.addi %c0_4, %9 : index
              %11 = arith.muli %c1_3, %c2_2 : index
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
              %c1_i32_5 = arith.constant 1 : i32
              %21 = arith.addi %c1_i32_5, %18 : i32
              %22 = arith.addi %21, %20 : i32
              %c0_6 = arith.constant 0 : index
              %c1_7 = arith.constant 1 : index
              memref.store %16, %flash_index_1_4[%c0_6] : memref<2xi32>
              memref.store %22, %flash_index_1_4[%c1_7] : memref<2xi32>
              scf.index_switch %arg3 
              case 0 {
                %23 = aie.objectfifo.acquire @flash_scale_1_3(Consume, 1) : !aie.objectfifosubview<memref<256xbf16>>
                %24 = aie.objectfifo.subview.access %23[0] : !aie.objectfifosubview<memref<256xbf16>> -> memref<256xbf16>
                %c64_i32 = arith.constant 64 : i32
                %c0_i32_8 = arith.constant 0 : i32
                %25 = arith.cmpi ne, %16, %c0_i32_8 : i32
                %26 = arith.extui %25 : i1 to i32
                func.call @op0_matmul_PV(%13, %4, %12, %24, %c64_i32, %26, %flash_index_1_4) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>, memref<256xbf16>, i32, i32, memref<2xi32>) -> ()
                %c31_i32 = arith.constant 31 : i32
                %27 = arith.cmpi eq, %16, %c31_i32 : i32
                scf.if %27 {
                  func.call @op0_rescale_O(%12, %24, %c64_i32, %flash_index_1_4) : (memref<64x64xbf16>, memref<256xbf16>, i32, memref<2xi32>) -> ()
                }
                aie.objectfifo.release @flash_scale_1_3(Consume, 1)
                scf.yield
              }
              case 1 {
                %23 = aie.objectfifo.acquire @flash_scale_1_5(Consume, 1) : !aie.objectfifosubview<memref<256xbf16>>
                %24 = aie.objectfifo.subview.access %23[0] : !aie.objectfifosubview<memref<256xbf16>> -> memref<256xbf16>
                %c64_i32 = arith.constant 64 : i32
                %c0_i32_8 = arith.constant 0 : i32
                %25 = arith.cmpi ne, %16, %c0_i32_8 : i32
                %26 = arith.extui %25 : i1 to i32
                func.call @op0_matmul_PV(%13, %4, %12, %24, %c64_i32, %26, %flash_index_1_4) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>, memref<256xbf16>, i32, i32, memref<2xi32>) -> ()
                %c31_i32 = arith.constant 31 : i32
                %27 = arith.cmpi eq, %16, %c31_i32 : i32
                scf.if %27 {
                  func.call @op0_rescale_O(%12, %24, %c64_i32, %flash_index_1_4) : (memref<64x64xbf16>, memref<256xbf16>, i32, memref<2xi32>) -> ()
                }
                aie.objectfifo.release @flash_scale_1_5(Consume, 1)
                scf.yield
              }
              default {
                %23 = aie.objectfifo.acquire @flash_scale_1_3(Consume, 1) : !aie.objectfifosubview<memref<256xbf16>>
                %24 = aie.objectfifo.subview.access %23[0] : !aie.objectfifosubview<memref<256xbf16>> -> memref<256xbf16>
                %c64_i32 = arith.constant 64 : i32
                %c0_i32_8 = arith.constant 0 : i32
                %25 = arith.cmpi ne, %16, %c0_i32_8 : i32
                %26 = arith.extui %25 : i1 to i32
                func.call @op0_matmul_PV(%13, %4, %12, %24, %c64_i32, %26, %flash_index_1_4) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>, memref<256xbf16>, i32, i32, memref<2xi32>) -> ()
                %c31_i32 = arith.constant 31 : i32
                %27 = arith.cmpi eq, %16, %c31_i32 : i32
                scf.if %27 {
                  func.call @op0_rescale_O(%12, %24, %c64_i32, %flash_index_1_4) : (memref<64x64xbf16>, memref<256xbf16>, i32, memref<2xi32>) -> ()
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
        %c2 = arith.constant 2 : index
        scf.for %arg1 = %c0_0 to %c2 step %c1_1 {
          %0 = aie.objectfifo.acquire @of_9_unicast_2(Produce, 2) : !aie.objectfifosubview<memref<64x64xbf16>>
          %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
          func.call @op0_zero_bf16(%1) : (memref<64x64xbf16>) -> ()
          %2 = aie.objectfifo.subview.access %0[1] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
          func.call @op0_zero_bf16(%2) : (memref<64x64xbf16>) -> ()
          %c32 = arith.constant 32 : index
          scf.for %arg2 = %c0_0 to %c32 step %c1_1 {
            %3 = aie.objectfifo.acquire @of_5_broadcast_0_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %4 = aie.objectfifo.subview.access %3[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            %c2_2 = arith.constant 2 : index
            %5 = aie.objectfifo.acquire @of_8_switch_join_2_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %6 = aie.objectfifo.acquire @of_8_switch_join_2_1(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %7 = aie.objectfifo.subview.access %5[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            %8 = aie.objectfifo.subview.access %6[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            scf.for %arg3 = %c0_0 to %c2_2 step %c1_1 {
              %c1_3 = arith.constant 1 : index
              %c0_4 = arith.constant 0 : index
              %9 = arith.muli %c1_3, %arg3 : index
              %10 = arith.addi %c0_4, %9 : index
              %11 = arith.muli %c1_3, %c2_2 : index
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
              %c0_5 = arith.constant 0 : index
              %c1_6 = arith.constant 1 : index
              memref.store %16, %flash_index_2_4[%c0_5] : memref<2xi32>
              memref.store %22, %flash_index_2_4[%c1_6] : memref<2xi32>
              scf.index_switch %arg3 
              case 0 {
                %23 = aie.objectfifo.acquire @flash_scale_2_3(Consume, 1) : !aie.objectfifosubview<memref<256xbf16>>
                %24 = aie.objectfifo.subview.access %23[0] : !aie.objectfifosubview<memref<256xbf16>> -> memref<256xbf16>
                %c64_i32 = arith.constant 64 : i32
                %c0_i32_7 = arith.constant 0 : i32
                %25 = arith.cmpi ne, %16, %c0_i32_7 : i32
                %26 = arith.extui %25 : i1 to i32
                func.call @op0_matmul_PV(%13, %4, %12, %24, %c64_i32, %26, %flash_index_2_4) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>, memref<256xbf16>, i32, i32, memref<2xi32>) -> ()
                %c31_i32 = arith.constant 31 : i32
                %27 = arith.cmpi eq, %16, %c31_i32 : i32
                scf.if %27 {
                  func.call @op0_rescale_O(%12, %24, %c64_i32, %flash_index_2_4) : (memref<64x64xbf16>, memref<256xbf16>, i32, memref<2xi32>) -> ()
                }
                aie.objectfifo.release @flash_scale_2_3(Consume, 1)
                scf.yield
              }
              case 1 {
                %23 = aie.objectfifo.acquire @flash_scale_2_5(Consume, 1) : !aie.objectfifosubview<memref<256xbf16>>
                %24 = aie.objectfifo.subview.access %23[0] : !aie.objectfifosubview<memref<256xbf16>> -> memref<256xbf16>
                %c64_i32 = arith.constant 64 : i32
                %c0_i32_7 = arith.constant 0 : i32
                %25 = arith.cmpi ne, %16, %c0_i32_7 : i32
                %26 = arith.extui %25 : i1 to i32
                func.call @op0_matmul_PV(%13, %4, %12, %24, %c64_i32, %26, %flash_index_2_4) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>, memref<256xbf16>, i32, i32, memref<2xi32>) -> ()
                %c31_i32 = arith.constant 31 : i32
                %27 = arith.cmpi eq, %16, %c31_i32 : i32
                scf.if %27 {
                  func.call @op0_rescale_O(%12, %24, %c64_i32, %flash_index_2_4) : (memref<64x64xbf16>, memref<256xbf16>, i32, memref<2xi32>) -> ()
                }
                aie.objectfifo.release @flash_scale_2_5(Consume, 1)
                scf.yield
              }
              default {
                %23 = aie.objectfifo.acquire @flash_scale_2_3(Consume, 1) : !aie.objectfifosubview<memref<256xbf16>>
                %24 = aie.objectfifo.subview.access %23[0] : !aie.objectfifosubview<memref<256xbf16>> -> memref<256xbf16>
                %c64_i32 = arith.constant 64 : i32
                %c0_i32_7 = arith.constant 0 : i32
                %25 = arith.cmpi ne, %16, %c0_i32_7 : i32
                %26 = arith.extui %25 : i1 to i32
                func.call @op0_matmul_PV(%13, %4, %12, %24, %c64_i32, %26, %flash_index_2_4) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>, memref<256xbf16>, i32, i32, memref<2xi32>) -> ()
                %c31_i32 = arith.constant 31 : i32
                %27 = arith.cmpi eq, %16, %c31_i32 : i32
                scf.if %27 {
                  func.call @op0_rescale_O(%12, %24, %c64_i32, %flash_index_2_4) : (memref<64x64xbf16>, memref<256xbf16>, i32, memref<2xi32>) -> ()
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
        %c2 = arith.constant 2 : index
        scf.for %arg1 = %c0_0 to %c2 step %c1_1 {
          %0 = aie.objectfifo.acquire @of_9_unicast_3(Produce, 2) : !aie.objectfifosubview<memref<64x64xbf16>>
          %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
          func.call @op0_zero_bf16(%1) : (memref<64x64xbf16>) -> ()
          %2 = aie.objectfifo.subview.access %0[1] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
          func.call @op0_zero_bf16(%2) : (memref<64x64xbf16>) -> ()
          %c32 = arith.constant 32 : index
          scf.for %arg2 = %c0_0 to %c32 step %c1_1 {
            %3 = aie.objectfifo.acquire @of_5_broadcast_0_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %4 = aie.objectfifo.subview.access %3[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            %c2_2 = arith.constant 2 : index
            %5 = aie.objectfifo.acquire @of_8_switch_join_3_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %6 = aie.objectfifo.acquire @of_8_switch_join_3_1(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %7 = aie.objectfifo.subview.access %5[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            %8 = aie.objectfifo.subview.access %6[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            scf.for %arg3 = %c0_0 to %c2_2 step %c1_1 {
              %c1_3 = arith.constant 1 : index
              %c0_4 = arith.constant 0 : index
              %9 = arith.muli %c1_3, %arg3 : index
              %10 = arith.addi %c0_4, %9 : index
              %11 = arith.muli %c1_3, %c2_2 : index
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
              %c0_5 = arith.constant 0 : index
              %c1_6 = arith.constant 1 : index
              memref.store %16, %flash_index_3_4[%c0_5] : memref<2xi32>
              memref.store %22, %flash_index_3_4[%c1_6] : memref<2xi32>
              scf.index_switch %arg3 
              case 0 {
                %23 = aie.objectfifo.acquire @flash_scale_3_3(Consume, 1) : !aie.objectfifosubview<memref<256xbf16>>
                %24 = aie.objectfifo.subview.access %23[0] : !aie.objectfifosubview<memref<256xbf16>> -> memref<256xbf16>
                %c64_i32 = arith.constant 64 : i32
                %c0_i32_7 = arith.constant 0 : i32
                %25 = arith.cmpi ne, %16, %c0_i32_7 : i32
                %26 = arith.extui %25 : i1 to i32
                func.call @op0_matmul_PV(%13, %4, %12, %24, %c64_i32, %26, %flash_index_3_4) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>, memref<256xbf16>, i32, i32, memref<2xi32>) -> ()
                %c31_i32 = arith.constant 31 : i32
                %27 = arith.cmpi eq, %16, %c31_i32 : i32
                scf.if %27 {
                  func.call @op0_rescale_O(%12, %24, %c64_i32, %flash_index_3_4) : (memref<64x64xbf16>, memref<256xbf16>, i32, memref<2xi32>) -> ()
                }
                aie.objectfifo.release @flash_scale_3_3(Consume, 1)
                scf.yield
              }
              case 1 {
                %23 = aie.objectfifo.acquire @flash_scale_3_5(Consume, 1) : !aie.objectfifosubview<memref<256xbf16>>
                %24 = aie.objectfifo.subview.access %23[0] : !aie.objectfifosubview<memref<256xbf16>> -> memref<256xbf16>
                %c64_i32 = arith.constant 64 : i32
                %c0_i32_7 = arith.constant 0 : i32
                %25 = arith.cmpi ne, %16, %c0_i32_7 : i32
                %26 = arith.extui %25 : i1 to i32
                func.call @op0_matmul_PV(%13, %4, %12, %24, %c64_i32, %26, %flash_index_3_4) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>, memref<256xbf16>, i32, i32, memref<2xi32>) -> ()
                %c31_i32 = arith.constant 31 : i32
                %27 = arith.cmpi eq, %16, %c31_i32 : i32
                scf.if %27 {
                  func.call @op0_rescale_O(%12, %24, %c64_i32, %flash_index_3_4) : (memref<64x64xbf16>, memref<256xbf16>, i32, memref<2xi32>) -> ()
                }
                aie.objectfifo.release @flash_scale_3_5(Consume, 1)
                scf.yield
              }
              default {
                %23 = aie.objectfifo.acquire @flash_scale_3_3(Consume, 1) : !aie.objectfifosubview<memref<256xbf16>>
                %24 = aie.objectfifo.subview.access %23[0] : !aie.objectfifosubview<memref<256xbf16>> -> memref<256xbf16>
                %c64_i32 = arith.constant 64 : i32
                %c0_i32_7 = arith.constant 0 : i32
                %25 = arith.cmpi ne, %16, %c0_i32_7 : i32
                %26 = arith.extui %25 : i1 to i32
                func.call @op0_matmul_PV(%13, %4, %12, %24, %c64_i32, %26, %flash_index_3_4) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>, memref<256xbf16>, i32, i32, memref<2xi32>) -> ()
                %c31_i32 = arith.constant 31 : i32
                %27 = arith.cmpi eq, %16, %c31_i32 : i32
                scf.if %27 {
                  func.call @op0_rescale_O(%12, %24, %c64_i32, %flash_index_3_4) : (memref<64x64xbf16>, memref<256xbf16>, i32, memref<2xi32>) -> ()
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
      }
      aie.end
    } {link_with = "op0_mha.o"}
    %flash_index_4_4 = aie.buffer(%tile_4_4) {sym_name = "flash_index_4_4"} : memref<2xi32> 
    %core_4_4 = aie.core(%tile_4_4) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c2 = arith.constant 2 : index
        scf.for %arg1 = %c0_0 to %c2 step %c1_1 {
          %0 = aie.objectfifo.acquire @of_9_unicast_4(Produce, 2) : !aie.objectfifosubview<memref<64x64xbf16>>
          %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
          func.call @op0_zero_bf16(%1) : (memref<64x64xbf16>) -> ()
          %2 = aie.objectfifo.subview.access %0[1] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
          func.call @op0_zero_bf16(%2) : (memref<64x64xbf16>) -> ()
          %c32 = arith.constant 32 : index
          scf.for %arg2 = %c0_0 to %c32 step %c1_1 {
            %3 = aie.objectfifo.acquire @of_5_broadcast_0_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %4 = aie.objectfifo.subview.access %3[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            %c2_2 = arith.constant 2 : index
            %5 = aie.objectfifo.acquire @of_8_switch_join_4_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %6 = aie.objectfifo.acquire @of_8_switch_join_4_1(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %7 = aie.objectfifo.subview.access %5[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            %8 = aie.objectfifo.subview.access %6[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            scf.for %arg3 = %c0_0 to %c2_2 step %c1_1 {
              %c1_3 = arith.constant 1 : index
              %c0_4 = arith.constant 0 : index
              %9 = arith.muli %c1_3, %arg3 : index
              %10 = arith.addi %c0_4, %9 : index
              %11 = arith.muli %c1_3, %c2_2 : index
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
              %c0_5 = arith.constant 0 : index
              %c1_6 = arith.constant 1 : index
              memref.store %16, %flash_index_4_4[%c0_5] : memref<2xi32>
              memref.store %22, %flash_index_4_4[%c1_6] : memref<2xi32>
              scf.index_switch %arg3 
              case 0 {
                %23 = aie.objectfifo.acquire @flash_scale_4_3(Consume, 1) : !aie.objectfifosubview<memref<256xbf16>>
                %24 = aie.objectfifo.subview.access %23[0] : !aie.objectfifosubview<memref<256xbf16>> -> memref<256xbf16>
                %c64_i32 = arith.constant 64 : i32
                %c0_i32_7 = arith.constant 0 : i32
                %25 = arith.cmpi ne, %16, %c0_i32_7 : i32
                %26 = arith.extui %25 : i1 to i32
                func.call @op0_matmul_PV(%13, %4, %12, %24, %c64_i32, %26, %flash_index_4_4) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>, memref<256xbf16>, i32, i32, memref<2xi32>) -> ()
                %c31_i32 = arith.constant 31 : i32
                %27 = arith.cmpi eq, %16, %c31_i32 : i32
                scf.if %27 {
                  func.call @op0_rescale_O(%12, %24, %c64_i32, %flash_index_4_4) : (memref<64x64xbf16>, memref<256xbf16>, i32, memref<2xi32>) -> ()
                }
                aie.objectfifo.release @flash_scale_4_3(Consume, 1)
                scf.yield
              }
              case 1 {
                %23 = aie.objectfifo.acquire @flash_scale_4_5(Consume, 1) : !aie.objectfifosubview<memref<256xbf16>>
                %24 = aie.objectfifo.subview.access %23[0] : !aie.objectfifosubview<memref<256xbf16>> -> memref<256xbf16>
                %c64_i32 = arith.constant 64 : i32
                %c0_i32_7 = arith.constant 0 : i32
                %25 = arith.cmpi ne, %16, %c0_i32_7 : i32
                %26 = arith.extui %25 : i1 to i32
                func.call @op0_matmul_PV(%13, %4, %12, %24, %c64_i32, %26, %flash_index_4_4) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>, memref<256xbf16>, i32, i32, memref<2xi32>) -> ()
                %c31_i32 = arith.constant 31 : i32
                %27 = arith.cmpi eq, %16, %c31_i32 : i32
                scf.if %27 {
                  func.call @op0_rescale_O(%12, %24, %c64_i32, %flash_index_4_4) : (memref<64x64xbf16>, memref<256xbf16>, i32, memref<2xi32>) -> ()
                }
                aie.objectfifo.release @flash_scale_4_5(Consume, 1)
                scf.yield
              }
              default {
                %23 = aie.objectfifo.acquire @flash_scale_4_3(Consume, 1) : !aie.objectfifosubview<memref<256xbf16>>
                %24 = aie.objectfifo.subview.access %23[0] : !aie.objectfifosubview<memref<256xbf16>> -> memref<256xbf16>
                %c64_i32 = arith.constant 64 : i32
                %c0_i32_7 = arith.constant 0 : i32
                %25 = arith.cmpi ne, %16, %c0_i32_7 : i32
                %26 = arith.extui %25 : i1 to i32
                func.call @op0_matmul_PV(%13, %4, %12, %24, %c64_i32, %26, %flash_index_4_4) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>, memref<256xbf16>, i32, i32, memref<2xi32>) -> ()
                %c31_i32 = arith.constant 31 : i32
                %27 = arith.cmpi eq, %16, %c31_i32 : i32
                scf.if %27 {
                  func.call @op0_rescale_O(%12, %24, %c64_i32, %flash_index_4_4) : (memref<64x64xbf16>, memref<256xbf16>, i32, memref<2xi32>) -> ()
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
      }
      aie.end
    } {link_with = "op0_mha.o"}
    %flash_index_5_4 = aie.buffer(%tile_5_4) {sym_name = "flash_index_5_4"} : memref<2xi32> 
    %core_5_4 = aie.core(%tile_5_4) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c2 = arith.constant 2 : index
        scf.for %arg1 = %c0_0 to %c2 step %c1_1 {
          %0 = aie.objectfifo.acquire @of_9_unicast_5(Produce, 2) : !aie.objectfifosubview<memref<64x64xbf16>>
          %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
          func.call @op0_zero_bf16(%1) : (memref<64x64xbf16>) -> ()
          %2 = aie.objectfifo.subview.access %0[1] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
          func.call @op0_zero_bf16(%2) : (memref<64x64xbf16>) -> ()
          %c32 = arith.constant 32 : index
          scf.for %arg2 = %c0_0 to %c32 step %c1_1 {
            %3 = aie.objectfifo.acquire @of_5_broadcast_0_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %4 = aie.objectfifo.subview.access %3[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            %c2_2 = arith.constant 2 : index
            %5 = aie.objectfifo.acquire @of_8_switch_join_5_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %6 = aie.objectfifo.acquire @of_8_switch_join_5_1(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %7 = aie.objectfifo.subview.access %5[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            %8 = aie.objectfifo.subview.access %6[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            scf.for %arg3 = %c0_0 to %c2_2 step %c1_1 {
              %c1_3 = arith.constant 1 : index
              %c0_4 = arith.constant 0 : index
              %9 = arith.muli %c1_3, %arg3 : index
              %10 = arith.addi %c0_4, %9 : index
              %11 = arith.muli %c1_3, %c2_2 : index
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
              %c0_5 = arith.constant 0 : index
              %c1_6 = arith.constant 1 : index
              memref.store %16, %flash_index_5_4[%c0_5] : memref<2xi32>
              memref.store %22, %flash_index_5_4[%c1_6] : memref<2xi32>
              scf.index_switch %arg3 
              case 0 {
                %23 = aie.objectfifo.acquire @flash_scale_5_3(Consume, 1) : !aie.objectfifosubview<memref<256xbf16>>
                %24 = aie.objectfifo.subview.access %23[0] : !aie.objectfifosubview<memref<256xbf16>> -> memref<256xbf16>
                %c64_i32 = arith.constant 64 : i32
                %c0_i32_7 = arith.constant 0 : i32
                %25 = arith.cmpi ne, %16, %c0_i32_7 : i32
                %26 = arith.extui %25 : i1 to i32
                func.call @op0_matmul_PV(%13, %4, %12, %24, %c64_i32, %26, %flash_index_5_4) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>, memref<256xbf16>, i32, i32, memref<2xi32>) -> ()
                %c31_i32 = arith.constant 31 : i32
                %27 = arith.cmpi eq, %16, %c31_i32 : i32
                scf.if %27 {
                  func.call @op0_rescale_O(%12, %24, %c64_i32, %flash_index_5_4) : (memref<64x64xbf16>, memref<256xbf16>, i32, memref<2xi32>) -> ()
                }
                aie.objectfifo.release @flash_scale_5_3(Consume, 1)
                scf.yield
              }
              case 1 {
                %23 = aie.objectfifo.acquire @flash_scale_5_5(Consume, 1) : !aie.objectfifosubview<memref<256xbf16>>
                %24 = aie.objectfifo.subview.access %23[0] : !aie.objectfifosubview<memref<256xbf16>> -> memref<256xbf16>
                %c64_i32 = arith.constant 64 : i32
                %c0_i32_7 = arith.constant 0 : i32
                %25 = arith.cmpi ne, %16, %c0_i32_7 : i32
                %26 = arith.extui %25 : i1 to i32
                func.call @op0_matmul_PV(%13, %4, %12, %24, %c64_i32, %26, %flash_index_5_4) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>, memref<256xbf16>, i32, i32, memref<2xi32>) -> ()
                %c31_i32 = arith.constant 31 : i32
                %27 = arith.cmpi eq, %16, %c31_i32 : i32
                scf.if %27 {
                  func.call @op0_rescale_O(%12, %24, %c64_i32, %flash_index_5_4) : (memref<64x64xbf16>, memref<256xbf16>, i32, memref<2xi32>) -> ()
                }
                aie.objectfifo.release @flash_scale_5_5(Consume, 1)
                scf.yield
              }
              default {
                %23 = aie.objectfifo.acquire @flash_scale_5_3(Consume, 1) : !aie.objectfifosubview<memref<256xbf16>>
                %24 = aie.objectfifo.subview.access %23[0] : !aie.objectfifosubview<memref<256xbf16>> -> memref<256xbf16>
                %c64_i32 = arith.constant 64 : i32
                %c0_i32_7 = arith.constant 0 : i32
                %25 = arith.cmpi ne, %16, %c0_i32_7 : i32
                %26 = arith.extui %25 : i1 to i32
                func.call @op0_matmul_PV(%13, %4, %12, %24, %c64_i32, %26, %flash_index_5_4) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>, memref<256xbf16>, i32, i32, memref<2xi32>) -> ()
                %c31_i32 = arith.constant 31 : i32
                %27 = arith.cmpi eq, %16, %c31_i32 : i32
                scf.if %27 {
                  func.call @op0_rescale_O(%12, %24, %c64_i32, %flash_index_5_4) : (memref<64x64xbf16>, memref<256xbf16>, i32, memref<2xi32>) -> ()
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
      }
      aie.end
    } {link_with = "op0_mha.o"}
    %flash_index_6_4 = aie.buffer(%tile_6_4) {sym_name = "flash_index_6_4"} : memref<2xi32> 
    %core_6_4 = aie.core(%tile_6_4) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c2 = arith.constant 2 : index
        scf.for %arg1 = %c0_0 to %c2 step %c1_1 {
          %0 = aie.objectfifo.acquire @of_9_unicast_6(Produce, 2) : !aie.objectfifosubview<memref<64x64xbf16>>
          %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
          func.call @op0_zero_bf16(%1) : (memref<64x64xbf16>) -> ()
          %2 = aie.objectfifo.subview.access %0[1] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
          func.call @op0_zero_bf16(%2) : (memref<64x64xbf16>) -> ()
          %c32 = arith.constant 32 : index
          scf.for %arg2 = %c0_0 to %c32 step %c1_1 {
            %3 = aie.objectfifo.acquire @of_5_broadcast_0_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %4 = aie.objectfifo.subview.access %3[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            %c2_2 = arith.constant 2 : index
            %5 = aie.objectfifo.acquire @of_8_switch_join_6_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %6 = aie.objectfifo.acquire @of_8_switch_join_6_1(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %7 = aie.objectfifo.subview.access %5[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            %8 = aie.objectfifo.subview.access %6[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            scf.for %arg3 = %c0_0 to %c2_2 step %c1_1 {
              %c1_3 = arith.constant 1 : index
              %c0_4 = arith.constant 0 : index
              %9 = arith.muli %c1_3, %arg3 : index
              %10 = arith.addi %c0_4, %9 : index
              %11 = arith.muli %c1_3, %c2_2 : index
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
              %c0_5 = arith.constant 0 : index
              %c1_6 = arith.constant 1 : index
              memref.store %16, %flash_index_6_4[%c0_5] : memref<2xi32>
              memref.store %22, %flash_index_6_4[%c1_6] : memref<2xi32>
              scf.index_switch %arg3 
              case 0 {
                %23 = aie.objectfifo.acquire @flash_scale_6_3(Consume, 1) : !aie.objectfifosubview<memref<256xbf16>>
                %24 = aie.objectfifo.subview.access %23[0] : !aie.objectfifosubview<memref<256xbf16>> -> memref<256xbf16>
                %c64_i32 = arith.constant 64 : i32
                %c0_i32_7 = arith.constant 0 : i32
                %25 = arith.cmpi ne, %16, %c0_i32_7 : i32
                %26 = arith.extui %25 : i1 to i32
                func.call @op0_matmul_PV(%13, %4, %12, %24, %c64_i32, %26, %flash_index_6_4) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>, memref<256xbf16>, i32, i32, memref<2xi32>) -> ()
                %c31_i32 = arith.constant 31 : i32
                %27 = arith.cmpi eq, %16, %c31_i32 : i32
                scf.if %27 {
                  func.call @op0_rescale_O(%12, %24, %c64_i32, %flash_index_6_4) : (memref<64x64xbf16>, memref<256xbf16>, i32, memref<2xi32>) -> ()
                }
                aie.objectfifo.release @flash_scale_6_3(Consume, 1)
                scf.yield
              }
              case 1 {
                %23 = aie.objectfifo.acquire @flash_scale_6_5(Consume, 1) : !aie.objectfifosubview<memref<256xbf16>>
                %24 = aie.objectfifo.subview.access %23[0] : !aie.objectfifosubview<memref<256xbf16>> -> memref<256xbf16>
                %c64_i32 = arith.constant 64 : i32
                %c0_i32_7 = arith.constant 0 : i32
                %25 = arith.cmpi ne, %16, %c0_i32_7 : i32
                %26 = arith.extui %25 : i1 to i32
                func.call @op0_matmul_PV(%13, %4, %12, %24, %c64_i32, %26, %flash_index_6_4) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>, memref<256xbf16>, i32, i32, memref<2xi32>) -> ()
                %c31_i32 = arith.constant 31 : i32
                %27 = arith.cmpi eq, %16, %c31_i32 : i32
                scf.if %27 {
                  func.call @op0_rescale_O(%12, %24, %c64_i32, %flash_index_6_4) : (memref<64x64xbf16>, memref<256xbf16>, i32, memref<2xi32>) -> ()
                }
                aie.objectfifo.release @flash_scale_6_5(Consume, 1)
                scf.yield
              }
              default {
                %23 = aie.objectfifo.acquire @flash_scale_6_3(Consume, 1) : !aie.objectfifosubview<memref<256xbf16>>
                %24 = aie.objectfifo.subview.access %23[0] : !aie.objectfifosubview<memref<256xbf16>> -> memref<256xbf16>
                %c64_i32 = arith.constant 64 : i32
                %c0_i32_7 = arith.constant 0 : i32
                %25 = arith.cmpi ne, %16, %c0_i32_7 : i32
                %26 = arith.extui %25 : i1 to i32
                func.call @op0_matmul_PV(%13, %4, %12, %24, %c64_i32, %26, %flash_index_6_4) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>, memref<256xbf16>, i32, i32, memref<2xi32>) -> ()
                %c31_i32 = arith.constant 31 : i32
                %27 = arith.cmpi eq, %16, %c31_i32 : i32
                scf.if %27 {
                  func.call @op0_rescale_O(%12, %24, %c64_i32, %flash_index_6_4) : (memref<64x64xbf16>, memref<256xbf16>, i32, memref<2xi32>) -> ()
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
      }
      aie.end
    } {link_with = "op0_mha.o"}
    %flash_index_7_4 = aie.buffer(%tile_7_4) {sym_name = "flash_index_7_4"} : memref<2xi32> 
    %core_7_4 = aie.core(%tile_7_4) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c2 = arith.constant 2 : index
        scf.for %arg1 = %c0_0 to %c2 step %c1_1 {
          %0 = aie.objectfifo.acquire @of_9_unicast_7(Produce, 2) : !aie.objectfifosubview<memref<64x64xbf16>>
          %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
          func.call @op0_zero_bf16(%1) : (memref<64x64xbf16>) -> ()
          %2 = aie.objectfifo.subview.access %0[1] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
          func.call @op0_zero_bf16(%2) : (memref<64x64xbf16>) -> ()
          %c32 = arith.constant 32 : index
          scf.for %arg2 = %c0_0 to %c32 step %c1_1 {
            %3 = aie.objectfifo.acquire @of_5_broadcast_0_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %4 = aie.objectfifo.subview.access %3[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            %c2_2 = arith.constant 2 : index
            %5 = aie.objectfifo.acquire @of_8_switch_join_7_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %6 = aie.objectfifo.acquire @of_8_switch_join_7_1(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %7 = aie.objectfifo.subview.access %5[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            %8 = aie.objectfifo.subview.access %6[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            scf.for %arg3 = %c0_0 to %c2_2 step %c1_1 {
              %c1_3 = arith.constant 1 : index
              %c0_4 = arith.constant 0 : index
              %9 = arith.muli %c1_3, %arg3 : index
              %10 = arith.addi %c0_4, %9 : index
              %11 = arith.muli %c1_3, %c2_2 : index
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
              %c0_5 = arith.constant 0 : index
              %c1_6 = arith.constant 1 : index
              memref.store %16, %flash_index_7_4[%c0_5] : memref<2xi32>
              memref.store %22, %flash_index_7_4[%c1_6] : memref<2xi32>
              scf.index_switch %arg3 
              case 0 {
                %23 = aie.objectfifo.acquire @flash_scale_7_3(Consume, 1) : !aie.objectfifosubview<memref<256xbf16>>
                %24 = aie.objectfifo.subview.access %23[0] : !aie.objectfifosubview<memref<256xbf16>> -> memref<256xbf16>
                %c64_i32 = arith.constant 64 : i32
                %c0_i32_7 = arith.constant 0 : i32
                %25 = arith.cmpi ne, %16, %c0_i32_7 : i32
                %26 = arith.extui %25 : i1 to i32
                func.call @op0_matmul_PV(%13, %4, %12, %24, %c64_i32, %26, %flash_index_7_4) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>, memref<256xbf16>, i32, i32, memref<2xi32>) -> ()
                %c31_i32 = arith.constant 31 : i32
                %27 = arith.cmpi eq, %16, %c31_i32 : i32
                scf.if %27 {
                  func.call @op0_rescale_O(%12, %24, %c64_i32, %flash_index_7_4) : (memref<64x64xbf16>, memref<256xbf16>, i32, memref<2xi32>) -> ()
                }
                aie.objectfifo.release @flash_scale_7_3(Consume, 1)
                scf.yield
              }
              case 1 {
                %23 = aie.objectfifo.acquire @flash_scale_7_5(Consume, 1) : !aie.objectfifosubview<memref<256xbf16>>
                %24 = aie.objectfifo.subview.access %23[0] : !aie.objectfifosubview<memref<256xbf16>> -> memref<256xbf16>
                %c64_i32 = arith.constant 64 : i32
                %c0_i32_7 = arith.constant 0 : i32
                %25 = arith.cmpi ne, %16, %c0_i32_7 : i32
                %26 = arith.extui %25 : i1 to i32
                func.call @op0_matmul_PV(%13, %4, %12, %24, %c64_i32, %26, %flash_index_7_4) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>, memref<256xbf16>, i32, i32, memref<2xi32>) -> ()
                %c31_i32 = arith.constant 31 : i32
                %27 = arith.cmpi eq, %16, %c31_i32 : i32
                scf.if %27 {
                  func.call @op0_rescale_O(%12, %24, %c64_i32, %flash_index_7_4) : (memref<64x64xbf16>, memref<256xbf16>, i32, memref<2xi32>) -> ()
                }
                aie.objectfifo.release @flash_scale_7_5(Consume, 1)
                scf.yield
              }
              default {
                %23 = aie.objectfifo.acquire @flash_scale_7_3(Consume, 1) : !aie.objectfifosubview<memref<256xbf16>>
                %24 = aie.objectfifo.subview.access %23[0] : !aie.objectfifosubview<memref<256xbf16>> -> memref<256xbf16>
                %c64_i32 = arith.constant 64 : i32
                %c0_i32_7 = arith.constant 0 : i32
                %25 = arith.cmpi ne, %16, %c0_i32_7 : i32
                %26 = arith.extui %25 : i1 to i32
                func.call @op0_matmul_PV(%13, %4, %12, %24, %c64_i32, %26, %flash_index_7_4) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>, memref<256xbf16>, i32, i32, memref<2xi32>) -> ()
                %c31_i32 = arith.constant 31 : i32
                %27 = arith.cmpi eq, %16, %c31_i32 : i32
                scf.if %27 {
                  func.call @op0_rescale_O(%12, %24, %c64_i32, %flash_index_7_4) : (memref<64x64xbf16>, memref<256xbf16>, i32, memref<2xi32>) -> ()
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
        %c2 = arith.constant 2 : index
        scf.for %arg1 = %c0_0 to %c2 step %c1_1 {
          %c32 = arith.constant 32 : index
          scf.for %arg2 = %c0_0 to %c32 step %c1_1 {
            %0 = aie.objectfifo.acquire @of_8_switch_join_0_0(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            %2 = aie.objectfifo.acquire @of_7_distribute_0_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %3 = aie.objectfifo.subview.access %2[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            %4 = arith.index_cast %arg2 : index to i32
            %c1_i32 = arith.constant 1 : i32
            %5 = arith.muli %4, %c1_i32 : i32
            %c0_i32 = arith.constant 0 : i32
            %6 = arith.addi %c0_i32, %5 : i32
            %7 = arith.index_cast %arg1 : index to i32
            %c16_i32 = arith.constant 16 : i32
            %8 = arith.muli %7, %c16_i32 : i32
            %c0_i32_2 = arith.constant 0 : i32
            %9 = arith.addi %c0_i32_2, %8 : i32
            %c0_3 = arith.constant 0 : index
            %c1_4 = arith.constant 1 : index
            memref.store %6, %flash_index_0_3[%c0_3] : memref<2xi32>
            memref.store %9, %flash_index_0_3[%c1_4] : memref<2xi32>
            %c64_i32 = arith.constant 64 : i32
            %c0_i32_5 = arith.constant 0 : i32
            %10 = arith.cmpi eq, %6, %c0_i32_5 : i32
            scf.if %10 {
              func.call @op0_init_scale_buffer(%flash_state_0_3, %c64_i32) : (memref<256xbf16>, i32) -> ()
            }
            %cst = arith.constant 1.4453125 : f32
            %11 = arith.truncf %cst : f32 to bf16
            %c64_i32_6 = arith.constant 64 : i32
            %c2048_i32 = arith.constant 2048 : i32
            %c2048_i32_7 = arith.constant 2048 : i32
            %c2_i32 = arith.constant 2 : i32
            func.call @op0_partial_softmax_mode(%3, %1, %flash_state_0_3, %flash_index_0_3, %11, %c64_i32, %c64_i32_6, %c2048_i32, %c2048_i32_7, %c2_i32) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<256xbf16>, memref<2xi32>, bf16, i32, i32, i32, i32, i32) -> ()
            %12 = aie.objectfifo.acquire @flash_scale_0_3(Produce, 1) : !aie.objectfifosubview<memref<256xbf16>>
            %13 = aie.objectfifo.subview.access %12[0] : !aie.objectfifosubview<memref<256xbf16>> -> memref<256xbf16>
            %c256_i32 = arith.constant 256 : i32
            func.call @op0_passThroughLine(%flash_state_0_3, %13, %c256_i32) : (memref<256xbf16>, memref<256xbf16>, i32) -> ()
            aie.objectfifo.release @flash_scale_0_3(Produce, 1)
            aie.objectfifo.release @of_7_distribute_0_0(Consume, 1)
            aie.objectfifo.release @of_8_switch_join_0_0(Produce, 1)
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
        %c2 = arith.constant 2 : index
        scf.for %arg1 = %c0_0 to %c2 step %c1_1 {
          %c32 = arith.constant 32 : index
          scf.for %arg2 = %c0_0 to %c32 step %c1_1 {
            %0 = aie.objectfifo.acquire @of_8_switch_join_1_0(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            %2 = aie.objectfifo.acquire @of_7_distribute_1_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %3 = aie.objectfifo.subview.access %2[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            %4 = arith.index_cast %arg2 : index to i32
            %c1_i32 = arith.constant 1 : i32
            %5 = arith.muli %4, %c1_i32 : i32
            %c0_i32 = arith.constant 0 : i32
            %6 = arith.addi %c0_i32, %5 : i32
            %7 = arith.index_cast %arg1 : index to i32
            %c16_i32 = arith.constant 16 : i32
            %8 = arith.muli %7, %c16_i32 : i32
            %c1_i32_2 = arith.constant 1 : i32
            %9 = arith.addi %c1_i32_2, %8 : i32
            %c0_3 = arith.constant 0 : index
            %c1_4 = arith.constant 1 : index
            memref.store %6, %flash_index_1_3[%c0_3] : memref<2xi32>
            memref.store %9, %flash_index_1_3[%c1_4] : memref<2xi32>
            %c64_i32 = arith.constant 64 : i32
            %c0_i32_5 = arith.constant 0 : i32
            %10 = arith.cmpi eq, %6, %c0_i32_5 : i32
            scf.if %10 {
              func.call @op0_init_scale_buffer(%flash_state_1_3, %c64_i32) : (memref<256xbf16>, i32) -> ()
            }
            %cst = arith.constant 1.4453125 : f32
            %11 = arith.truncf %cst : f32 to bf16
            %c64_i32_6 = arith.constant 64 : i32
            %c2048_i32 = arith.constant 2048 : i32
            %c2048_i32_7 = arith.constant 2048 : i32
            %c2_i32 = arith.constant 2 : i32
            func.call @op0_partial_softmax_mode(%3, %1, %flash_state_1_3, %flash_index_1_3, %11, %c64_i32, %c64_i32_6, %c2048_i32, %c2048_i32_7, %c2_i32) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<256xbf16>, memref<2xi32>, bf16, i32, i32, i32, i32, i32) -> ()
            %12 = aie.objectfifo.acquire @flash_scale_1_3(Produce, 1) : !aie.objectfifosubview<memref<256xbf16>>
            %13 = aie.objectfifo.subview.access %12[0] : !aie.objectfifosubview<memref<256xbf16>> -> memref<256xbf16>
            %c256_i32 = arith.constant 256 : i32
            func.call @op0_passThroughLine(%flash_state_1_3, %13, %c256_i32) : (memref<256xbf16>, memref<256xbf16>, i32) -> ()
            aie.objectfifo.release @flash_scale_1_3(Produce, 1)
            aie.objectfifo.release @of_7_distribute_1_0(Consume, 1)
            aie.objectfifo.release @of_8_switch_join_1_0(Produce, 1)
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
        %c2 = arith.constant 2 : index
        scf.for %arg1 = %c0_0 to %c2 step %c1_1 {
          %c32 = arith.constant 32 : index
          scf.for %arg2 = %c0_0 to %c32 step %c1_1 {
            %0 = aie.objectfifo.acquire @of_8_switch_join_2_0(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            %2 = aie.objectfifo.acquire @of_7_distribute_2_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %3 = aie.objectfifo.subview.access %2[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            %4 = arith.index_cast %arg2 : index to i32
            %c1_i32 = arith.constant 1 : i32
            %5 = arith.muli %4, %c1_i32 : i32
            %c0_i32 = arith.constant 0 : i32
            %6 = arith.addi %c0_i32, %5 : i32
            %7 = arith.index_cast %arg1 : index to i32
            %c16_i32 = arith.constant 16 : i32
            %8 = arith.muli %7, %c16_i32 : i32
            %c2_i32 = arith.constant 2 : i32
            %9 = arith.addi %c2_i32, %8 : i32
            %c0_2 = arith.constant 0 : index
            %c1_3 = arith.constant 1 : index
            memref.store %6, %flash_index_2_3[%c0_2] : memref<2xi32>
            memref.store %9, %flash_index_2_3[%c1_3] : memref<2xi32>
            %c64_i32 = arith.constant 64 : i32
            %c0_i32_4 = arith.constant 0 : i32
            %10 = arith.cmpi eq, %6, %c0_i32_4 : i32
            scf.if %10 {
              func.call @op0_init_scale_buffer(%flash_state_2_3, %c64_i32) : (memref<256xbf16>, i32) -> ()
            }
            %cst = arith.constant 1.4453125 : f32
            %11 = arith.truncf %cst : f32 to bf16
            %c64_i32_5 = arith.constant 64 : i32
            %c2048_i32 = arith.constant 2048 : i32
            %c2048_i32_6 = arith.constant 2048 : i32
            %c2_i32_7 = arith.constant 2 : i32
            func.call @op0_partial_softmax_mode(%3, %1, %flash_state_2_3, %flash_index_2_3, %11, %c64_i32, %c64_i32_5, %c2048_i32, %c2048_i32_6, %c2_i32_7) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<256xbf16>, memref<2xi32>, bf16, i32, i32, i32, i32, i32) -> ()
            %12 = aie.objectfifo.acquire @flash_scale_2_3(Produce, 1) : !aie.objectfifosubview<memref<256xbf16>>
            %13 = aie.objectfifo.subview.access %12[0] : !aie.objectfifosubview<memref<256xbf16>> -> memref<256xbf16>
            %c256_i32 = arith.constant 256 : i32
            func.call @op0_passThroughLine(%flash_state_2_3, %13, %c256_i32) : (memref<256xbf16>, memref<256xbf16>, i32) -> ()
            aie.objectfifo.release @flash_scale_2_3(Produce, 1)
            aie.objectfifo.release @of_7_distribute_2_0(Consume, 1)
            aie.objectfifo.release @of_8_switch_join_2_0(Produce, 1)
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
        %c2 = arith.constant 2 : index
        scf.for %arg1 = %c0_0 to %c2 step %c1_1 {
          %c32 = arith.constant 32 : index
          scf.for %arg2 = %c0_0 to %c32 step %c1_1 {
            %0 = aie.objectfifo.acquire @of_8_switch_join_3_0(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            %2 = aie.objectfifo.acquire @of_7_distribute_3_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %3 = aie.objectfifo.subview.access %2[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            %4 = arith.index_cast %arg2 : index to i32
            %c1_i32 = arith.constant 1 : i32
            %5 = arith.muli %4, %c1_i32 : i32
            %c0_i32 = arith.constant 0 : i32
            %6 = arith.addi %c0_i32, %5 : i32
            %7 = arith.index_cast %arg1 : index to i32
            %c16_i32 = arith.constant 16 : i32
            %8 = arith.muli %7, %c16_i32 : i32
            %c3_i32 = arith.constant 3 : i32
            %9 = arith.addi %c3_i32, %8 : i32
            %c0_2 = arith.constant 0 : index
            %c1_3 = arith.constant 1 : index
            memref.store %6, %flash_index_3_3[%c0_2] : memref<2xi32>
            memref.store %9, %flash_index_3_3[%c1_3] : memref<2xi32>
            %c64_i32 = arith.constant 64 : i32
            %c0_i32_4 = arith.constant 0 : i32
            %10 = arith.cmpi eq, %6, %c0_i32_4 : i32
            scf.if %10 {
              func.call @op0_init_scale_buffer(%flash_state_3_3, %c64_i32) : (memref<256xbf16>, i32) -> ()
            }
            %cst = arith.constant 1.4453125 : f32
            %11 = arith.truncf %cst : f32 to bf16
            %c64_i32_5 = arith.constant 64 : i32
            %c2048_i32 = arith.constant 2048 : i32
            %c2048_i32_6 = arith.constant 2048 : i32
            %c2_i32 = arith.constant 2 : i32
            func.call @op0_partial_softmax_mode(%3, %1, %flash_state_3_3, %flash_index_3_3, %11, %c64_i32, %c64_i32_5, %c2048_i32, %c2048_i32_6, %c2_i32) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<256xbf16>, memref<2xi32>, bf16, i32, i32, i32, i32, i32) -> ()
            %12 = aie.objectfifo.acquire @flash_scale_3_3(Produce, 1) : !aie.objectfifosubview<memref<256xbf16>>
            %13 = aie.objectfifo.subview.access %12[0] : !aie.objectfifosubview<memref<256xbf16>> -> memref<256xbf16>
            %c256_i32 = arith.constant 256 : i32
            func.call @op0_passThroughLine(%flash_state_3_3, %13, %c256_i32) : (memref<256xbf16>, memref<256xbf16>, i32) -> ()
            aie.objectfifo.release @flash_scale_3_3(Produce, 1)
            aie.objectfifo.release @of_7_distribute_3_0(Consume, 1)
            aie.objectfifo.release @of_8_switch_join_3_0(Produce, 1)
          }
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
        %c2 = arith.constant 2 : index
        scf.for %arg1 = %c0_0 to %c2 step %c1_1 {
          %c32 = arith.constant 32 : index
          scf.for %arg2 = %c0_0 to %c32 step %c1_1 {
            %0 = aie.objectfifo.acquire @of_8_switch_join_4_0(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            %2 = aie.objectfifo.acquire @of_7_distribute_4_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %3 = aie.objectfifo.subview.access %2[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            %4 = arith.index_cast %arg2 : index to i32
            %c1_i32 = arith.constant 1 : i32
            %5 = arith.muli %4, %c1_i32 : i32
            %c0_i32 = arith.constant 0 : i32
            %6 = arith.addi %c0_i32, %5 : i32
            %7 = arith.index_cast %arg1 : index to i32
            %c16_i32 = arith.constant 16 : i32
            %8 = arith.muli %7, %c16_i32 : i32
            %c4_i32 = arith.constant 4 : i32
            %9 = arith.addi %c4_i32, %8 : i32
            %c0_2 = arith.constant 0 : index
            %c1_3 = arith.constant 1 : index
            memref.store %6, %flash_index_4_3[%c0_2] : memref<2xi32>
            memref.store %9, %flash_index_4_3[%c1_3] : memref<2xi32>
            %c64_i32 = arith.constant 64 : i32
            %c0_i32_4 = arith.constant 0 : i32
            %10 = arith.cmpi eq, %6, %c0_i32_4 : i32
            scf.if %10 {
              func.call @op0_init_scale_buffer(%flash_state_4_3, %c64_i32) : (memref<256xbf16>, i32) -> ()
            }
            %cst = arith.constant 1.4453125 : f32
            %11 = arith.truncf %cst : f32 to bf16
            %c64_i32_5 = arith.constant 64 : i32
            %c2048_i32 = arith.constant 2048 : i32
            %c2048_i32_6 = arith.constant 2048 : i32
            %c2_i32 = arith.constant 2 : i32
            func.call @op0_partial_softmax_mode(%3, %1, %flash_state_4_3, %flash_index_4_3, %11, %c64_i32, %c64_i32_5, %c2048_i32, %c2048_i32_6, %c2_i32) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<256xbf16>, memref<2xi32>, bf16, i32, i32, i32, i32, i32) -> ()
            %12 = aie.objectfifo.acquire @flash_scale_4_3(Produce, 1) : !aie.objectfifosubview<memref<256xbf16>>
            %13 = aie.objectfifo.subview.access %12[0] : !aie.objectfifosubview<memref<256xbf16>> -> memref<256xbf16>
            %c256_i32 = arith.constant 256 : i32
            func.call @op0_passThroughLine(%flash_state_4_3, %13, %c256_i32) : (memref<256xbf16>, memref<256xbf16>, i32) -> ()
            aie.objectfifo.release @flash_scale_4_3(Produce, 1)
            aie.objectfifo.release @of_7_distribute_4_0(Consume, 1)
            aie.objectfifo.release @of_8_switch_join_4_0(Produce, 1)
          }
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
        %c2 = arith.constant 2 : index
        scf.for %arg1 = %c0_0 to %c2 step %c1_1 {
          %c32 = arith.constant 32 : index
          scf.for %arg2 = %c0_0 to %c32 step %c1_1 {
            %0 = aie.objectfifo.acquire @of_8_switch_join_5_0(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            %2 = aie.objectfifo.acquire @of_7_distribute_5_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %3 = aie.objectfifo.subview.access %2[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            %4 = arith.index_cast %arg2 : index to i32
            %c1_i32 = arith.constant 1 : i32
            %5 = arith.muli %4, %c1_i32 : i32
            %c0_i32 = arith.constant 0 : i32
            %6 = arith.addi %c0_i32, %5 : i32
            %7 = arith.index_cast %arg1 : index to i32
            %c16_i32 = arith.constant 16 : i32
            %8 = arith.muli %7, %c16_i32 : i32
            %c5_i32 = arith.constant 5 : i32
            %9 = arith.addi %c5_i32, %8 : i32
            %c0_2 = arith.constant 0 : index
            %c1_3 = arith.constant 1 : index
            memref.store %6, %flash_index_5_3[%c0_2] : memref<2xi32>
            memref.store %9, %flash_index_5_3[%c1_3] : memref<2xi32>
            %c64_i32 = arith.constant 64 : i32
            %c0_i32_4 = arith.constant 0 : i32
            %10 = arith.cmpi eq, %6, %c0_i32_4 : i32
            scf.if %10 {
              func.call @op0_init_scale_buffer(%flash_state_5_3, %c64_i32) : (memref<256xbf16>, i32) -> ()
            }
            %cst = arith.constant 1.4453125 : f32
            %11 = arith.truncf %cst : f32 to bf16
            %c64_i32_5 = arith.constant 64 : i32
            %c2048_i32 = arith.constant 2048 : i32
            %c2048_i32_6 = arith.constant 2048 : i32
            %c2_i32 = arith.constant 2 : i32
            func.call @op0_partial_softmax_mode(%3, %1, %flash_state_5_3, %flash_index_5_3, %11, %c64_i32, %c64_i32_5, %c2048_i32, %c2048_i32_6, %c2_i32) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<256xbf16>, memref<2xi32>, bf16, i32, i32, i32, i32, i32) -> ()
            %12 = aie.objectfifo.acquire @flash_scale_5_3(Produce, 1) : !aie.objectfifosubview<memref<256xbf16>>
            %13 = aie.objectfifo.subview.access %12[0] : !aie.objectfifosubview<memref<256xbf16>> -> memref<256xbf16>
            %c256_i32 = arith.constant 256 : i32
            func.call @op0_passThroughLine(%flash_state_5_3, %13, %c256_i32) : (memref<256xbf16>, memref<256xbf16>, i32) -> ()
            aie.objectfifo.release @flash_scale_5_3(Produce, 1)
            aie.objectfifo.release @of_7_distribute_5_0(Consume, 1)
            aie.objectfifo.release @of_8_switch_join_5_0(Produce, 1)
          }
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
        %c2 = arith.constant 2 : index
        scf.for %arg1 = %c0_0 to %c2 step %c1_1 {
          %c32 = arith.constant 32 : index
          scf.for %arg2 = %c0_0 to %c32 step %c1_1 {
            %0 = aie.objectfifo.acquire @of_8_switch_join_6_0(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            %2 = aie.objectfifo.acquire @of_7_distribute_6_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %3 = aie.objectfifo.subview.access %2[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            %4 = arith.index_cast %arg2 : index to i32
            %c1_i32 = arith.constant 1 : i32
            %5 = arith.muli %4, %c1_i32 : i32
            %c0_i32 = arith.constant 0 : i32
            %6 = arith.addi %c0_i32, %5 : i32
            %7 = arith.index_cast %arg1 : index to i32
            %c16_i32 = arith.constant 16 : i32
            %8 = arith.muli %7, %c16_i32 : i32
            %c6_i32 = arith.constant 6 : i32
            %9 = arith.addi %c6_i32, %8 : i32
            %c0_2 = arith.constant 0 : index
            %c1_3 = arith.constant 1 : index
            memref.store %6, %flash_index_6_3[%c0_2] : memref<2xi32>
            memref.store %9, %flash_index_6_3[%c1_3] : memref<2xi32>
            %c64_i32 = arith.constant 64 : i32
            %c0_i32_4 = arith.constant 0 : i32
            %10 = arith.cmpi eq, %6, %c0_i32_4 : i32
            scf.if %10 {
              func.call @op0_init_scale_buffer(%flash_state_6_3, %c64_i32) : (memref<256xbf16>, i32) -> ()
            }
            %cst = arith.constant 1.4453125 : f32
            %11 = arith.truncf %cst : f32 to bf16
            %c64_i32_5 = arith.constant 64 : i32
            %c2048_i32 = arith.constant 2048 : i32
            %c2048_i32_6 = arith.constant 2048 : i32
            %c2_i32 = arith.constant 2 : i32
            func.call @op0_partial_softmax_mode(%3, %1, %flash_state_6_3, %flash_index_6_3, %11, %c64_i32, %c64_i32_5, %c2048_i32, %c2048_i32_6, %c2_i32) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<256xbf16>, memref<2xi32>, bf16, i32, i32, i32, i32, i32) -> ()
            %12 = aie.objectfifo.acquire @flash_scale_6_3(Produce, 1) : !aie.objectfifosubview<memref<256xbf16>>
            %13 = aie.objectfifo.subview.access %12[0] : !aie.objectfifosubview<memref<256xbf16>> -> memref<256xbf16>
            %c256_i32 = arith.constant 256 : i32
            func.call @op0_passThroughLine(%flash_state_6_3, %13, %c256_i32) : (memref<256xbf16>, memref<256xbf16>, i32) -> ()
            aie.objectfifo.release @flash_scale_6_3(Produce, 1)
            aie.objectfifo.release @of_7_distribute_6_0(Consume, 1)
            aie.objectfifo.release @of_8_switch_join_6_0(Produce, 1)
          }
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
        %c2 = arith.constant 2 : index
        scf.for %arg1 = %c0_0 to %c2 step %c1_1 {
          %c32 = arith.constant 32 : index
          scf.for %arg2 = %c0_0 to %c32 step %c1_1 {
            %0 = aie.objectfifo.acquire @of_8_switch_join_7_0(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            %2 = aie.objectfifo.acquire @of_7_distribute_7_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %3 = aie.objectfifo.subview.access %2[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            %4 = arith.index_cast %arg2 : index to i32
            %c1_i32 = arith.constant 1 : i32
            %5 = arith.muli %4, %c1_i32 : i32
            %c0_i32 = arith.constant 0 : i32
            %6 = arith.addi %c0_i32, %5 : i32
            %7 = arith.index_cast %arg1 : index to i32
            %c16_i32 = arith.constant 16 : i32
            %8 = arith.muli %7, %c16_i32 : i32
            %c7_i32 = arith.constant 7 : i32
            %9 = arith.addi %c7_i32, %8 : i32
            %c0_2 = arith.constant 0 : index
            %c1_3 = arith.constant 1 : index
            memref.store %6, %flash_index_7_3[%c0_2] : memref<2xi32>
            memref.store %9, %flash_index_7_3[%c1_3] : memref<2xi32>
            %c64_i32 = arith.constant 64 : i32
            %c0_i32_4 = arith.constant 0 : i32
            %10 = arith.cmpi eq, %6, %c0_i32_4 : i32
            scf.if %10 {
              func.call @op0_init_scale_buffer(%flash_state_7_3, %c64_i32) : (memref<256xbf16>, i32) -> ()
            }
            %cst = arith.constant 1.4453125 : f32
            %11 = arith.truncf %cst : f32 to bf16
            %c64_i32_5 = arith.constant 64 : i32
            %c2048_i32 = arith.constant 2048 : i32
            %c2048_i32_6 = arith.constant 2048 : i32
            %c2_i32 = arith.constant 2 : i32
            func.call @op0_partial_softmax_mode(%3, %1, %flash_state_7_3, %flash_index_7_3, %11, %c64_i32, %c64_i32_5, %c2048_i32, %c2048_i32_6, %c2_i32) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<256xbf16>, memref<2xi32>, bf16, i32, i32, i32, i32, i32) -> ()
            %12 = aie.objectfifo.acquire @flash_scale_7_3(Produce, 1) : !aie.objectfifosubview<memref<256xbf16>>
            %13 = aie.objectfifo.subview.access %12[0] : !aie.objectfifosubview<memref<256xbf16>> -> memref<256xbf16>
            %c256_i32 = arith.constant 256 : i32
            func.call @op0_passThroughLine(%flash_state_7_3, %13, %c256_i32) : (memref<256xbf16>, memref<256xbf16>, i32) -> ()
            aie.objectfifo.release @flash_scale_7_3(Produce, 1)
            aie.objectfifo.release @of_7_distribute_7_0(Consume, 1)
            aie.objectfifo.release @of_8_switch_join_7_0(Produce, 1)
          }
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
        %c2 = arith.constant 2 : index
        scf.for %arg1 = %c0_0 to %c2 step %c1_1 {
          %c32 = arith.constant 32 : index
          scf.for %arg2 = %c0_0 to %c32 step %c1_1 {
            %0 = aie.objectfifo.acquire @of_8_switch_join_0_1(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            %2 = aie.objectfifo.acquire @of_7_distribute_0_1(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %3 = aie.objectfifo.subview.access %2[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            %4 = arith.index_cast %arg2 : index to i32
            %c1_i32 = arith.constant 1 : i32
            %5 = arith.muli %4, %c1_i32 : i32
            %c0_i32 = arith.constant 0 : i32
            %6 = arith.addi %c0_i32, %5 : i32
            %7 = arith.index_cast %arg1 : index to i32
            %c16_i32 = arith.constant 16 : i32
            %8 = arith.muli %7, %c16_i32 : i32
            %c8_i32 = arith.constant 8 : i32
            %9 = arith.addi %c8_i32, %8 : i32
            %c0_2 = arith.constant 0 : index
            %c1_3 = arith.constant 1 : index
            memref.store %6, %flash_index_0_5[%c0_2] : memref<2xi32>
            memref.store %9, %flash_index_0_5[%c1_3] : memref<2xi32>
            %c64_i32 = arith.constant 64 : i32
            %c0_i32_4 = arith.constant 0 : i32
            %10 = arith.cmpi eq, %6, %c0_i32_4 : i32
            scf.if %10 {
              func.call @op0_init_scale_buffer(%flash_state_0_5, %c64_i32) : (memref<256xbf16>, i32) -> ()
            }
            %cst = arith.constant 1.4453125 : f32
            %11 = arith.truncf %cst : f32 to bf16
            %c64_i32_5 = arith.constant 64 : i32
            %c2048_i32 = arith.constant 2048 : i32
            %c2048_i32_6 = arith.constant 2048 : i32
            %c2_i32 = arith.constant 2 : i32
            func.call @op0_partial_softmax_mode(%3, %1, %flash_state_0_5, %flash_index_0_5, %11, %c64_i32, %c64_i32_5, %c2048_i32, %c2048_i32_6, %c2_i32) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<256xbf16>, memref<2xi32>, bf16, i32, i32, i32, i32, i32) -> ()
            %12 = aie.objectfifo.acquire @flash_scale_0_5(Produce, 1) : !aie.objectfifosubview<memref<256xbf16>>
            %13 = aie.objectfifo.subview.access %12[0] : !aie.objectfifosubview<memref<256xbf16>> -> memref<256xbf16>
            %c256_i32 = arith.constant 256 : i32
            func.call @op0_passThroughLine(%flash_state_0_5, %13, %c256_i32) : (memref<256xbf16>, memref<256xbf16>, i32) -> ()
            aie.objectfifo.release @flash_scale_0_5(Produce, 1)
            aie.objectfifo.release @of_7_distribute_0_1(Consume, 1)
            aie.objectfifo.release @of_8_switch_join_0_1(Produce, 1)
          }
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
        %c2 = arith.constant 2 : index
        scf.for %arg1 = %c0_0 to %c2 step %c1_1 {
          %c32 = arith.constant 32 : index
          scf.for %arg2 = %c0_0 to %c32 step %c1_1 {
            %0 = aie.objectfifo.acquire @of_8_switch_join_1_1(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            %2 = aie.objectfifo.acquire @of_7_distribute_1_1(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %3 = aie.objectfifo.subview.access %2[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            %4 = arith.index_cast %arg2 : index to i32
            %c1_i32 = arith.constant 1 : i32
            %5 = arith.muli %4, %c1_i32 : i32
            %c0_i32 = arith.constant 0 : i32
            %6 = arith.addi %c0_i32, %5 : i32
            %7 = arith.index_cast %arg1 : index to i32
            %c16_i32 = arith.constant 16 : i32
            %8 = arith.muli %7, %c16_i32 : i32
            %c9_i32 = arith.constant 9 : i32
            %9 = arith.addi %c9_i32, %8 : i32
            %c0_2 = arith.constant 0 : index
            %c1_3 = arith.constant 1 : index
            memref.store %6, %flash_index_1_5[%c0_2] : memref<2xi32>
            memref.store %9, %flash_index_1_5[%c1_3] : memref<2xi32>
            %c64_i32 = arith.constant 64 : i32
            %c0_i32_4 = arith.constant 0 : i32
            %10 = arith.cmpi eq, %6, %c0_i32_4 : i32
            scf.if %10 {
              func.call @op0_init_scale_buffer(%flash_state_1_5, %c64_i32) : (memref<256xbf16>, i32) -> ()
            }
            %cst = arith.constant 1.4453125 : f32
            %11 = arith.truncf %cst : f32 to bf16
            %c64_i32_5 = arith.constant 64 : i32
            %c2048_i32 = arith.constant 2048 : i32
            %c2048_i32_6 = arith.constant 2048 : i32
            %c2_i32 = arith.constant 2 : i32
            func.call @op0_partial_softmax_mode(%3, %1, %flash_state_1_5, %flash_index_1_5, %11, %c64_i32, %c64_i32_5, %c2048_i32, %c2048_i32_6, %c2_i32) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<256xbf16>, memref<2xi32>, bf16, i32, i32, i32, i32, i32) -> ()
            %12 = aie.objectfifo.acquire @flash_scale_1_5(Produce, 1) : !aie.objectfifosubview<memref<256xbf16>>
            %13 = aie.objectfifo.subview.access %12[0] : !aie.objectfifosubview<memref<256xbf16>> -> memref<256xbf16>
            %c256_i32 = arith.constant 256 : i32
            func.call @op0_passThroughLine(%flash_state_1_5, %13, %c256_i32) : (memref<256xbf16>, memref<256xbf16>, i32) -> ()
            aie.objectfifo.release @flash_scale_1_5(Produce, 1)
            aie.objectfifo.release @of_7_distribute_1_1(Consume, 1)
            aie.objectfifo.release @of_8_switch_join_1_1(Produce, 1)
          }
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
        %c2 = arith.constant 2 : index
        scf.for %arg1 = %c0_0 to %c2 step %c1_1 {
          %c32 = arith.constant 32 : index
          scf.for %arg2 = %c0_0 to %c32 step %c1_1 {
            %0 = aie.objectfifo.acquire @of_8_switch_join_2_1(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            %2 = aie.objectfifo.acquire @of_7_distribute_2_1(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %3 = aie.objectfifo.subview.access %2[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            %4 = arith.index_cast %arg2 : index to i32
            %c1_i32 = arith.constant 1 : i32
            %5 = arith.muli %4, %c1_i32 : i32
            %c0_i32 = arith.constant 0 : i32
            %6 = arith.addi %c0_i32, %5 : i32
            %7 = arith.index_cast %arg1 : index to i32
            %c16_i32 = arith.constant 16 : i32
            %8 = arith.muli %7, %c16_i32 : i32
            %c10_i32 = arith.constant 10 : i32
            %9 = arith.addi %c10_i32, %8 : i32
            %c0_2 = arith.constant 0 : index
            %c1_3 = arith.constant 1 : index
            memref.store %6, %flash_index_2_5[%c0_2] : memref<2xi32>
            memref.store %9, %flash_index_2_5[%c1_3] : memref<2xi32>
            %c64_i32 = arith.constant 64 : i32
            %c0_i32_4 = arith.constant 0 : i32
            %10 = arith.cmpi eq, %6, %c0_i32_4 : i32
            scf.if %10 {
              func.call @op0_init_scale_buffer(%flash_state_2_5, %c64_i32) : (memref<256xbf16>, i32) -> ()
            }
            %cst = arith.constant 1.4453125 : f32
            %11 = arith.truncf %cst : f32 to bf16
            %c64_i32_5 = arith.constant 64 : i32
            %c2048_i32 = arith.constant 2048 : i32
            %c2048_i32_6 = arith.constant 2048 : i32
            %c2_i32 = arith.constant 2 : i32
            func.call @op0_partial_softmax_mode(%3, %1, %flash_state_2_5, %flash_index_2_5, %11, %c64_i32, %c64_i32_5, %c2048_i32, %c2048_i32_6, %c2_i32) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<256xbf16>, memref<2xi32>, bf16, i32, i32, i32, i32, i32) -> ()
            %12 = aie.objectfifo.acquire @flash_scale_2_5(Produce, 1) : !aie.objectfifosubview<memref<256xbf16>>
            %13 = aie.objectfifo.subview.access %12[0] : !aie.objectfifosubview<memref<256xbf16>> -> memref<256xbf16>
            %c256_i32 = arith.constant 256 : i32
            func.call @op0_passThroughLine(%flash_state_2_5, %13, %c256_i32) : (memref<256xbf16>, memref<256xbf16>, i32) -> ()
            aie.objectfifo.release @flash_scale_2_5(Produce, 1)
            aie.objectfifo.release @of_7_distribute_2_1(Consume, 1)
            aie.objectfifo.release @of_8_switch_join_2_1(Produce, 1)
          }
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
        %c2 = arith.constant 2 : index
        scf.for %arg1 = %c0_0 to %c2 step %c1_1 {
          %c32 = arith.constant 32 : index
          scf.for %arg2 = %c0_0 to %c32 step %c1_1 {
            %0 = aie.objectfifo.acquire @of_8_switch_join_3_1(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            %2 = aie.objectfifo.acquire @of_7_distribute_3_1(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %3 = aie.objectfifo.subview.access %2[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            %4 = arith.index_cast %arg2 : index to i32
            %c1_i32 = arith.constant 1 : i32
            %5 = arith.muli %4, %c1_i32 : i32
            %c0_i32 = arith.constant 0 : i32
            %6 = arith.addi %c0_i32, %5 : i32
            %7 = arith.index_cast %arg1 : index to i32
            %c16_i32 = arith.constant 16 : i32
            %8 = arith.muli %7, %c16_i32 : i32
            %c11_i32 = arith.constant 11 : i32
            %9 = arith.addi %c11_i32, %8 : i32
            %c0_2 = arith.constant 0 : index
            %c1_3 = arith.constant 1 : index
            memref.store %6, %flash_index_3_5[%c0_2] : memref<2xi32>
            memref.store %9, %flash_index_3_5[%c1_3] : memref<2xi32>
            %c64_i32 = arith.constant 64 : i32
            %c0_i32_4 = arith.constant 0 : i32
            %10 = arith.cmpi eq, %6, %c0_i32_4 : i32
            scf.if %10 {
              func.call @op0_init_scale_buffer(%flash_state_3_5, %c64_i32) : (memref<256xbf16>, i32) -> ()
            }
            %cst = arith.constant 1.4453125 : f32
            %11 = arith.truncf %cst : f32 to bf16
            %c64_i32_5 = arith.constant 64 : i32
            %c2048_i32 = arith.constant 2048 : i32
            %c2048_i32_6 = arith.constant 2048 : i32
            %c2_i32 = arith.constant 2 : i32
            func.call @op0_partial_softmax_mode(%3, %1, %flash_state_3_5, %flash_index_3_5, %11, %c64_i32, %c64_i32_5, %c2048_i32, %c2048_i32_6, %c2_i32) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<256xbf16>, memref<2xi32>, bf16, i32, i32, i32, i32, i32) -> ()
            %12 = aie.objectfifo.acquire @flash_scale_3_5(Produce, 1) : !aie.objectfifosubview<memref<256xbf16>>
            %13 = aie.objectfifo.subview.access %12[0] : !aie.objectfifosubview<memref<256xbf16>> -> memref<256xbf16>
            %c256_i32 = arith.constant 256 : i32
            func.call @op0_passThroughLine(%flash_state_3_5, %13, %c256_i32) : (memref<256xbf16>, memref<256xbf16>, i32) -> ()
            aie.objectfifo.release @flash_scale_3_5(Produce, 1)
            aie.objectfifo.release @of_7_distribute_3_1(Consume, 1)
            aie.objectfifo.release @of_8_switch_join_3_1(Produce, 1)
          }
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
        %c2 = arith.constant 2 : index
        scf.for %arg1 = %c0_0 to %c2 step %c1_1 {
          %c32 = arith.constant 32 : index
          scf.for %arg2 = %c0_0 to %c32 step %c1_1 {
            %0 = aie.objectfifo.acquire @of_8_switch_join_4_1(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            %2 = aie.objectfifo.acquire @of_7_distribute_4_1(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %3 = aie.objectfifo.subview.access %2[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            %4 = arith.index_cast %arg2 : index to i32
            %c1_i32 = arith.constant 1 : i32
            %5 = arith.muli %4, %c1_i32 : i32
            %c0_i32 = arith.constant 0 : i32
            %6 = arith.addi %c0_i32, %5 : i32
            %7 = arith.index_cast %arg1 : index to i32
            %c16_i32 = arith.constant 16 : i32
            %8 = arith.muli %7, %c16_i32 : i32
            %c12_i32 = arith.constant 12 : i32
            %9 = arith.addi %c12_i32, %8 : i32
            %c0_2 = arith.constant 0 : index
            %c1_3 = arith.constant 1 : index
            memref.store %6, %flash_index_4_5[%c0_2] : memref<2xi32>
            memref.store %9, %flash_index_4_5[%c1_3] : memref<2xi32>
            %c64_i32 = arith.constant 64 : i32
            %c0_i32_4 = arith.constant 0 : i32
            %10 = arith.cmpi eq, %6, %c0_i32_4 : i32
            scf.if %10 {
              func.call @op0_init_scale_buffer(%flash_state_4_5, %c64_i32) : (memref<256xbf16>, i32) -> ()
            }
            %cst = arith.constant 1.4453125 : f32
            %11 = arith.truncf %cst : f32 to bf16
            %c64_i32_5 = arith.constant 64 : i32
            %c2048_i32 = arith.constant 2048 : i32
            %c2048_i32_6 = arith.constant 2048 : i32
            %c2_i32 = arith.constant 2 : i32
            func.call @op0_partial_softmax_mode(%3, %1, %flash_state_4_5, %flash_index_4_5, %11, %c64_i32, %c64_i32_5, %c2048_i32, %c2048_i32_6, %c2_i32) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<256xbf16>, memref<2xi32>, bf16, i32, i32, i32, i32, i32) -> ()
            %12 = aie.objectfifo.acquire @flash_scale_4_5(Produce, 1) : !aie.objectfifosubview<memref<256xbf16>>
            %13 = aie.objectfifo.subview.access %12[0] : !aie.objectfifosubview<memref<256xbf16>> -> memref<256xbf16>
            %c256_i32 = arith.constant 256 : i32
            func.call @op0_passThroughLine(%flash_state_4_5, %13, %c256_i32) : (memref<256xbf16>, memref<256xbf16>, i32) -> ()
            aie.objectfifo.release @flash_scale_4_5(Produce, 1)
            aie.objectfifo.release @of_7_distribute_4_1(Consume, 1)
            aie.objectfifo.release @of_8_switch_join_4_1(Produce, 1)
          }
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
        %c2 = arith.constant 2 : index
        scf.for %arg1 = %c0_0 to %c2 step %c1_1 {
          %c32 = arith.constant 32 : index
          scf.for %arg2 = %c0_0 to %c32 step %c1_1 {
            %0 = aie.objectfifo.acquire @of_8_switch_join_5_1(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            %2 = aie.objectfifo.acquire @of_7_distribute_5_1(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %3 = aie.objectfifo.subview.access %2[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            %4 = arith.index_cast %arg2 : index to i32
            %c1_i32 = arith.constant 1 : i32
            %5 = arith.muli %4, %c1_i32 : i32
            %c0_i32 = arith.constant 0 : i32
            %6 = arith.addi %c0_i32, %5 : i32
            %7 = arith.index_cast %arg1 : index to i32
            %c16_i32 = arith.constant 16 : i32
            %8 = arith.muli %7, %c16_i32 : i32
            %c13_i32 = arith.constant 13 : i32
            %9 = arith.addi %c13_i32, %8 : i32
            %c0_2 = arith.constant 0 : index
            %c1_3 = arith.constant 1 : index
            memref.store %6, %flash_index_5_5[%c0_2] : memref<2xi32>
            memref.store %9, %flash_index_5_5[%c1_3] : memref<2xi32>
            %c64_i32 = arith.constant 64 : i32
            %c0_i32_4 = arith.constant 0 : i32
            %10 = arith.cmpi eq, %6, %c0_i32_4 : i32
            scf.if %10 {
              func.call @op0_init_scale_buffer(%flash_state_5_5, %c64_i32) : (memref<256xbf16>, i32) -> ()
            }
            %cst = arith.constant 1.4453125 : f32
            %11 = arith.truncf %cst : f32 to bf16
            %c64_i32_5 = arith.constant 64 : i32
            %c2048_i32 = arith.constant 2048 : i32
            %c2048_i32_6 = arith.constant 2048 : i32
            %c2_i32 = arith.constant 2 : i32
            func.call @op0_partial_softmax_mode(%3, %1, %flash_state_5_5, %flash_index_5_5, %11, %c64_i32, %c64_i32_5, %c2048_i32, %c2048_i32_6, %c2_i32) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<256xbf16>, memref<2xi32>, bf16, i32, i32, i32, i32, i32) -> ()
            %12 = aie.objectfifo.acquire @flash_scale_5_5(Produce, 1) : !aie.objectfifosubview<memref<256xbf16>>
            %13 = aie.objectfifo.subview.access %12[0] : !aie.objectfifosubview<memref<256xbf16>> -> memref<256xbf16>
            %c256_i32 = arith.constant 256 : i32
            func.call @op0_passThroughLine(%flash_state_5_5, %13, %c256_i32) : (memref<256xbf16>, memref<256xbf16>, i32) -> ()
            aie.objectfifo.release @flash_scale_5_5(Produce, 1)
            aie.objectfifo.release @of_7_distribute_5_1(Consume, 1)
            aie.objectfifo.release @of_8_switch_join_5_1(Produce, 1)
          }
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
        %c2 = arith.constant 2 : index
        scf.for %arg1 = %c0_0 to %c2 step %c1_1 {
          %c32 = arith.constant 32 : index
          scf.for %arg2 = %c0_0 to %c32 step %c1_1 {
            %0 = aie.objectfifo.acquire @of_8_switch_join_6_1(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            %2 = aie.objectfifo.acquire @of_7_distribute_6_1(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %3 = aie.objectfifo.subview.access %2[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            %4 = arith.index_cast %arg2 : index to i32
            %c1_i32 = arith.constant 1 : i32
            %5 = arith.muli %4, %c1_i32 : i32
            %c0_i32 = arith.constant 0 : i32
            %6 = arith.addi %c0_i32, %5 : i32
            %7 = arith.index_cast %arg1 : index to i32
            %c16_i32 = arith.constant 16 : i32
            %8 = arith.muli %7, %c16_i32 : i32
            %c14_i32 = arith.constant 14 : i32
            %9 = arith.addi %c14_i32, %8 : i32
            %c0_2 = arith.constant 0 : index
            %c1_3 = arith.constant 1 : index
            memref.store %6, %flash_index_6_5[%c0_2] : memref<2xi32>
            memref.store %9, %flash_index_6_5[%c1_3] : memref<2xi32>
            %c64_i32 = arith.constant 64 : i32
            %c0_i32_4 = arith.constant 0 : i32
            %10 = arith.cmpi eq, %6, %c0_i32_4 : i32
            scf.if %10 {
              func.call @op0_init_scale_buffer(%flash_state_6_5, %c64_i32) : (memref<256xbf16>, i32) -> ()
            }
            %cst = arith.constant 1.4453125 : f32
            %11 = arith.truncf %cst : f32 to bf16
            %c64_i32_5 = arith.constant 64 : i32
            %c2048_i32 = arith.constant 2048 : i32
            %c2048_i32_6 = arith.constant 2048 : i32
            %c2_i32 = arith.constant 2 : i32
            func.call @op0_partial_softmax_mode(%3, %1, %flash_state_6_5, %flash_index_6_5, %11, %c64_i32, %c64_i32_5, %c2048_i32, %c2048_i32_6, %c2_i32) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<256xbf16>, memref<2xi32>, bf16, i32, i32, i32, i32, i32) -> ()
            %12 = aie.objectfifo.acquire @flash_scale_6_5(Produce, 1) : !aie.objectfifosubview<memref<256xbf16>>
            %13 = aie.objectfifo.subview.access %12[0] : !aie.objectfifosubview<memref<256xbf16>> -> memref<256xbf16>
            %c256_i32 = arith.constant 256 : i32
            func.call @op0_passThroughLine(%flash_state_6_5, %13, %c256_i32) : (memref<256xbf16>, memref<256xbf16>, i32) -> ()
            aie.objectfifo.release @flash_scale_6_5(Produce, 1)
            aie.objectfifo.release @of_7_distribute_6_1(Consume, 1)
            aie.objectfifo.release @of_8_switch_join_6_1(Produce, 1)
          }
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
        %c2 = arith.constant 2 : index
        scf.for %arg1 = %c0_0 to %c2 step %c1_1 {
          %c32 = arith.constant 32 : index
          scf.for %arg2 = %c0_0 to %c32 step %c1_1 {
            %0 = aie.objectfifo.acquire @of_8_switch_join_7_1(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            %2 = aie.objectfifo.acquire @of_7_distribute_7_1(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %3 = aie.objectfifo.subview.access %2[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            %4 = arith.index_cast %arg2 : index to i32
            %c1_i32 = arith.constant 1 : i32
            %5 = arith.muli %4, %c1_i32 : i32
            %c0_i32 = arith.constant 0 : i32
            %6 = arith.addi %c0_i32, %5 : i32
            %7 = arith.index_cast %arg1 : index to i32
            %c16_i32 = arith.constant 16 : i32
            %8 = arith.muli %7, %c16_i32 : i32
            %c15_i32 = arith.constant 15 : i32
            %9 = arith.addi %c15_i32, %8 : i32
            %c0_2 = arith.constant 0 : index
            %c1_3 = arith.constant 1 : index
            memref.store %6, %flash_index_7_5[%c0_2] : memref<2xi32>
            memref.store %9, %flash_index_7_5[%c1_3] : memref<2xi32>
            %c64_i32 = arith.constant 64 : i32
            %c0_i32_4 = arith.constant 0 : i32
            %10 = arith.cmpi eq, %6, %c0_i32_4 : i32
            scf.if %10 {
              func.call @op0_init_scale_buffer(%flash_state_7_5, %c64_i32) : (memref<256xbf16>, i32) -> ()
            }
            %cst = arith.constant 1.4453125 : f32
            %11 = arith.truncf %cst : f32 to bf16
            %c64_i32_5 = arith.constant 64 : i32
            %c2048_i32 = arith.constant 2048 : i32
            %c2048_i32_6 = arith.constant 2048 : i32
            %c2_i32 = arith.constant 2 : i32
            func.call @op0_partial_softmax_mode(%3, %1, %flash_state_7_5, %flash_index_7_5, %11, %c64_i32, %c64_i32_5, %c2048_i32, %c2048_i32_6, %c2_i32) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<256xbf16>, memref<2xi32>, bf16, i32, i32, i32, i32, i32) -> ()
            %12 = aie.objectfifo.acquire @flash_scale_7_5(Produce, 1) : !aie.objectfifosubview<memref<256xbf16>>
            %13 = aie.objectfifo.subview.access %12[0] : !aie.objectfifosubview<memref<256xbf16>> -> memref<256xbf16>
            %c256_i32 = arith.constant 256 : i32
            func.call @op0_passThroughLine(%flash_state_7_5, %13, %c256_i32) : (memref<256xbf16>, memref<256xbf16>, i32) -> ()
            aie.objectfifo.release @flash_scale_7_5(Produce, 1)
            aie.objectfifo.release @of_7_distribute_7_1(Consume, 1)
            aie.objectfifo.release @of_8_switch_join_7_1(Produce, 1)
          }
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
    aie.objectfifo @of_1_mem(%shim_noc_tile_3_0, {%mem_tile_3_1}, [1 : i32, 1 : i32]) : !aie.objectfifo<memref<32x64x64xbf16>>  
    aie.objectfifo @of_2_mem(%shim_noc_tile_1_0, {%mem_tile_1_1}, [1 : i32, 1 : i32]) : !aie.objectfifo<memref<32x64x64xbf16>>  
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
    aie.objectfifo @of_4_broadcast_0_0(%mem_tile_3_1 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%tile_0_2, %tile_1_2, %tile_2_2, %tile_3_2, %tile_4_2, %tile_5_2, %tile_6_2, %tile_7_2}, [2 : i32, 2 : i32, 2 : i32, 2 : i32, 2 : i32, 2 : i32, 2 : i32, 2 : i32, 2 : i32]) {repeat_count = 2 : i32} : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo.link [@of_1_mem] -> [@of_4_broadcast_0_0]([] [])
    aie.objectfifo @of_5_broadcast_0_0(%mem_tile_1_1 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%tile_0_4, %tile_1_4, %tile_2_4, %tile_3_4, %tile_4_4, %tile_5_4, %tile_6_4, %tile_7_4}, [2 : i32, 2 : i32, 2 : i32, 2 : i32, 2 : i32, 2 : i32, 2 : i32, 2 : i32, 2 : i32]) {repeat_count = 2 : i32} : !aie.objectfifo<memref<64x64xbf16>>  
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
}
