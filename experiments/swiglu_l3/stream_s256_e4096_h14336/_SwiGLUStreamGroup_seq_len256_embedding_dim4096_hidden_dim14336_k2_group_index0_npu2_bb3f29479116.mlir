module {
  aie.device(npu2) {
    %shim_noc_tile_0_0 = aie.tile(0, 0)
    %shim_noc_tile_1_0 = aie.tile(1, 0)
    %shim_noc_tile_2_0 = aie.tile(2, 0)
    %shim_noc_tile_3_0 = aie.tile(3, 0)
    %shim_noc_tile_5_0 = aie.tile(5, 0)
    %shim_noc_tile_6_0 = aie.tile(6, 0)
    %mem_tile_0_1 = aie.tile(0, 1)
    %mem_tile_1_1 = aie.tile(1, 1)
    %mem_tile_2_1 = aie.tile(2, 1)
    %mem_tile_3_1 = aie.tile(3, 1)
    %mem_tile_5_1 = aie.tile(5, 1)
    %mem_tile_6_1 = aie.tile(6, 1)
    %tile_0_2 = aie.tile(0, 2)
    %tile_0_3 = aie.tile(0, 3)
    %tile_0_4 = aie.tile(0, 4)
    %tile_0_5 = aie.tile(0, 5)
    %tile_1_2 = aie.tile(1, 2)
    %tile_1_3 = aie.tile(1, 3)
    %tile_1_4 = aie.tile(1, 4)
    %tile_1_5 = aie.tile(1, 5)
    %tile_2_2 = aie.tile(2, 2)
    %tile_2_3 = aie.tile(2, 3)
    %tile_2_4 = aie.tile(2, 4)
    %tile_2_5 = aie.tile(2, 5)
    %tile_3_2 = aie.tile(3, 2)
    %tile_3_3 = aie.tile(3, 3)
    %tile_3_4 = aie.tile(3, 4)
    %tile_3_5 = aie.tile(3, 5)
    %tile_4_2 = aie.tile(4, 2)
    %tile_4_3 = aie.tile(4, 3)
    %tile_4_4 = aie.tile(4, 4)
    %tile_4_5 = aie.tile(4, 5)
    %tile_5_2 = aie.tile(5, 2)
    %tile_5_3 = aie.tile(5, 3)
    %tile_5_4 = aie.tile(5, 4)
    %tile_5_5 = aie.tile(5, 5)
    aie.runtime_sequence(%arg0: memref<256x4096xbf16>, %arg1: memref<4096x14336xbf16>, %arg2: memref<4096x14336xbf16>, %arg3: memref<256x14336xbf16>) {
      %0 = aiex.dma_configure_task_for @of_0_mem_0 {
        aie.dma_bd(%arg0 : memref<256x4096xbf16> offset = 0 len = 524288 sizes = [56, 128, 128, 32] strides = [0, 32, 4096, 1])
        aie.end
      } {issue_token = true, iteration_t = 0 : index, repeat_count = 55 : i32}
      aiex.dma_start_task(%0)
      %1 = aiex.dma_configure_task_for @of_0_mem_1 {
        aie.dma_bd(%arg0 : memref<256x4096xbf16> offset = 0 len = 524288 sizes = [56, 128, 128, 32] strides = [0, 32, 4096, 1])
        aie.end
      } {issue_token = true, iteration_t = 0 : index, repeat_count = 55 : i32}
      aiex.dma_start_task(%1)
      %2 = aiex.dma_configure_task_for @of_1_mem_0 {
        aie.dma_bd(%arg1 : memref<4096x14336xbf16> offset = 0 len = 262144 sizes = [56, 64, 64, 64] strides = [128, 917504, 14336, 1])
        aie.end
      } {issue_token = true, iteration_t = 0 : index, repeat_count = 55 : i32}
      aiex.dma_start_task(%2)
      %3 = aiex.dma_configure_task_for @of_1_mem_1 {
        aie.dma_bd(%arg1 : memref<4096x14336xbf16> offset = 64 len = 262144 sizes = [56, 64, 64, 64] strides = [128, 917504, 14336, 1])
        aie.end
      } {issue_token = true, iteration_t = 0 : index, repeat_count = 55 : i32}
      aiex.dma_start_task(%3)
      %4 = aiex.dma_configure_task_for @of_2_mem_0 {
        aie.dma_bd(%arg2 : memref<4096x14336xbf16> offset = 0 len = 262144 sizes = [56, 64, 64, 64] strides = [128, 917504, 14336, 1])
        aie.end
      } {issue_token = true, iteration_t = 0 : index, repeat_count = 55 : i32}
      aiex.dma_start_task(%4)
      %5 = aiex.dma_configure_task_for @of_2_mem_1 {
        aie.dma_bd(%arg2 : memref<4096x14336xbf16> offset = 64 len = 262144 sizes = [56, 64, 64, 64] strides = [128, 917504, 14336, 1])
        aie.end
      } {issue_token = true, iteration_t = 0 : index, repeat_count = 55 : i32}
      aiex.dma_start_task(%5)
      %6 = aiex.dma_configure_task_for @of_10_mem {
        aie.dma_bd(%arg3 : memref<256x14336xbf16> offset = 0 len = 1835008 sizes = [2, 224, 128, 64] strides = [1835008, 64, 14336, 1])
        aie.end
      } {issue_token = true, iteration_t = 0 : index, repeat_count = 1 : i32}
      aiex.dma_start_task(%6)
      %7 = aiex.dma_configure_task_for @of_0_mem_0 {
        aie.dma_bd(%arg0 : memref<256x4096xbf16> offset = 0 len = 524288 sizes = [56, 128, 128, 32] strides = [0, 32, 4096, 1])
        aie.end
      } {issue_token = true, iteration_t = 57344 : index, repeat_count = 55 : i32}
      aiex.dma_start_task(%7)
      %8 = aiex.dma_configure_task_for @of_0_mem_1 {
        aie.dma_bd(%arg0 : memref<256x4096xbf16> offset = 0 len = 524288 sizes = [56, 128, 128, 32] strides = [0, 32, 4096, 1])
        aie.end
      } {issue_token = true, iteration_t = 57344 : index, repeat_count = 55 : i32}
      aiex.dma_start_task(%8)
      %9 = aiex.dma_configure_task_for @of_1_mem_0 {
        aie.dma_bd(%arg1 : memref<4096x14336xbf16> offset = 7168 len = 262144 sizes = [56, 64, 64, 64] strides = [128, 917504, 14336, 1])
        aie.end
      } {issue_token = true, iteration_t = 57344 : index, repeat_count = 55 : i32}
      aiex.dma_start_task(%9)
      %10 = aiex.dma_configure_task_for @of_1_mem_1 {
        aie.dma_bd(%arg1 : memref<4096x14336xbf16> offset = 7232 len = 262144 sizes = [56, 64, 64, 64] strides = [128, 917504, 14336, 1])
        aie.end
      } {issue_token = true, iteration_t = 57344 : index, repeat_count = 55 : i32}
      aiex.dma_start_task(%10)
      %11 = aiex.dma_configure_task_for @of_2_mem_0 {
        aie.dma_bd(%arg2 : memref<4096x14336xbf16> offset = 7168 len = 262144 sizes = [56, 64, 64, 64] strides = [128, 917504, 14336, 1])
        aie.end
      } {issue_token = true, iteration_t = 57344 : index, repeat_count = 55 : i32}
      aiex.dma_start_task(%11)
      %12 = aiex.dma_configure_task_for @of_2_mem_1 {
        aie.dma_bd(%arg2 : memref<4096x14336xbf16> offset = 7232 len = 262144 sizes = [56, 64, 64, 64] strides = [128, 917504, 14336, 1])
        aie.end
      } {issue_token = true, iteration_t = 57344 : index, repeat_count = 55 : i32}
      aiex.dma_start_task(%12)
      aiex.dma_await_task(%0)
      %13 = aiex.dma_configure_task_for @of_0_mem_0 {
        aie.dma_bd(%arg0 : memref<256x4096xbf16> offset = 524288 len = 524288 sizes = [56, 128, 128, 32] strides = [0, 32, 4096, 1])
        aie.end
      } {issue_token = true, iteration_t = 114688 : index, repeat_count = 55 : i32}
      aiex.dma_start_task(%13)
      aiex.dma_await_task(%1)
      %14 = aiex.dma_configure_task_for @of_0_mem_1 {
        aie.dma_bd(%arg0 : memref<256x4096xbf16> offset = 524288 len = 524288 sizes = [56, 128, 128, 32] strides = [0, 32, 4096, 1])
        aie.end
      } {issue_token = true, iteration_t = 114688 : index, repeat_count = 55 : i32}
      aiex.dma_start_task(%14)
      aiex.dma_await_task(%2)
      %15 = aiex.dma_configure_task_for @of_1_mem_0 {
        aie.dma_bd(%arg1 : memref<4096x14336xbf16> offset = 0 len = 262144 sizes = [56, 64, 64, 64] strides = [128, 917504, 14336, 1])
        aie.end
      } {issue_token = true, iteration_t = 114688 : index, repeat_count = 55 : i32}
      aiex.dma_start_task(%15)
      aiex.dma_await_task(%3)
      %16 = aiex.dma_configure_task_for @of_1_mem_1 {
        aie.dma_bd(%arg1 : memref<4096x14336xbf16> offset = 64 len = 262144 sizes = [56, 64, 64, 64] strides = [128, 917504, 14336, 1])
        aie.end
      } {issue_token = true, iteration_t = 114688 : index, repeat_count = 55 : i32}
      aiex.dma_start_task(%16)
      aiex.dma_await_task(%4)
      %17 = aiex.dma_configure_task_for @of_2_mem_0 {
        aie.dma_bd(%arg2 : memref<4096x14336xbf16> offset = 0 len = 262144 sizes = [56, 64, 64, 64] strides = [128, 917504, 14336, 1])
        aie.end
      } {issue_token = true, iteration_t = 114688 : index, repeat_count = 55 : i32}
      aiex.dma_start_task(%17)
      aiex.dma_await_task(%5)
      %18 = aiex.dma_configure_task_for @of_2_mem_1 {
        aie.dma_bd(%arg2 : memref<4096x14336xbf16> offset = 64 len = 262144 sizes = [56, 64, 64, 64] strides = [128, 917504, 14336, 1])
        aie.end
      } {issue_token = true, iteration_t = 114688 : index, repeat_count = 55 : i32}
      aiex.dma_start_task(%18)
      aiex.dma_await_task(%7)
      %19 = aiex.dma_configure_task_for @of_0_mem_0 {
        aie.dma_bd(%arg0 : memref<256x4096xbf16> offset = 524288 len = 524288 sizes = [56, 128, 128, 32] strides = [0, 32, 4096, 1])
        aie.end
      } {issue_token = true, iteration_t = 172032 : index, repeat_count = 55 : i32}
      aiex.dma_start_task(%19)
      aiex.dma_await_task(%8)
      %20 = aiex.dma_configure_task_for @of_0_mem_1 {
        aie.dma_bd(%arg0 : memref<256x4096xbf16> offset = 524288 len = 524288 sizes = [56, 128, 128, 32] strides = [0, 32, 4096, 1])
        aie.end
      } {issue_token = true, iteration_t = 172032 : index, repeat_count = 55 : i32}
      aiex.dma_start_task(%20)
      aiex.dma_await_task(%9)
      %21 = aiex.dma_configure_task_for @of_1_mem_0 {
        aie.dma_bd(%arg1 : memref<4096x14336xbf16> offset = 7168 len = 262144 sizes = [56, 64, 64, 64] strides = [128, 917504, 14336, 1])
        aie.end
      } {issue_token = true, iteration_t = 172032 : index, repeat_count = 55 : i32}
      aiex.dma_start_task(%21)
      aiex.dma_await_task(%10)
      %22 = aiex.dma_configure_task_for @of_1_mem_1 {
        aie.dma_bd(%arg1 : memref<4096x14336xbf16> offset = 7232 len = 262144 sizes = [56, 64, 64, 64] strides = [128, 917504, 14336, 1])
        aie.end
      } {issue_token = true, iteration_t = 172032 : index, repeat_count = 55 : i32}
      aiex.dma_start_task(%22)
      aiex.dma_await_task(%11)
      %23 = aiex.dma_configure_task_for @of_2_mem_0 {
        aie.dma_bd(%arg2 : memref<4096x14336xbf16> offset = 7168 len = 262144 sizes = [56, 64, 64, 64] strides = [128, 917504, 14336, 1])
        aie.end
      } {issue_token = true, iteration_t = 172032 : index, repeat_count = 55 : i32}
      aiex.dma_start_task(%23)
      aiex.dma_await_task(%12)
      %24 = aiex.dma_configure_task_for @of_2_mem_1 {
        aie.dma_bd(%arg2 : memref<4096x14336xbf16> offset = 7232 len = 262144 sizes = [56, 64, 64, 64] strides = [128, 917504, 14336, 1])
        aie.end
      } {issue_token = true, iteration_t = 172032 : index, repeat_count = 55 : i32}
      aiex.dma_start_task(%24)
      aiex.dma_await_task(%13)
      aiex.dma_await_task(%19)
      aiex.dma_await_task(%14)
      aiex.dma_await_task(%20)
      aiex.dma_await_task(%15)
      aiex.dma_await_task(%21)
      aiex.dma_await_task(%16)
      aiex.dma_await_task(%22)
      aiex.dma_await_task(%17)
      aiex.dma_await_task(%23)
      aiex.dma_await_task(%18)
      aiex.dma_await_task(%24)
      aiex.dma_await_task(%6)
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
          %c112 = arith.constant 112 : index
          scf.for %arg2 = %c0_0 to %c112 step %c1_1 {
            %0 = aie.objectfifo.acquire @of_6_switch_join_0_0(Produce, 1) : !aie.objectfifosubview<memref<32x64xbf16>>
            %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<32x64xbf16>> -> memref<32x64xbf16>
            func.call @op0_zero_bf16_32_32_64(%1) : (memref<32x64xbf16>) -> ()
            %c128 = arith.constant 128 : index
            scf.for %arg3 = %c0_0 to %c128 step %c1_1 {
              %2 = aie.objectfifo.acquire @of_4_broadcast_0_0(Consume, 1) : !aie.objectfifosubview<memref<32x64xbf16>>
              %3 = aie.objectfifo.subview.access %2[0] : !aie.objectfifosubview<memref<32x64xbf16>> -> memref<32x64xbf16>
              %4 = aie.objectfifo.acquire @of_3_distribute_0_0(Consume, 1) : !aie.objectfifosubview<memref<32x32xbf16>>
              %5 = aie.objectfifo.subview.access %4[0] : !aie.objectfifosubview<memref<32x32xbf16>> -> memref<32x32xbf16>
              func.call @op0_matmul_bf16_bf16_32_32_64(%5, %3, %1) : (memref<32x32xbf16>, memref<32x64xbf16>, memref<32x64xbf16>) -> ()
              aie.objectfifo.release @of_3_distribute_0_0(Consume, 1)
              aie.objectfifo.release @of_4_broadcast_0_0(Consume, 1)
            }
            aie.objectfifo.release @of_6_switch_join_0_0(Produce, 1)
          }
        }
      }
      aie.end
    } {link_with = "op0_mm_32_32_64.o"}
    %core_0_3 = aie.core(%tile_0_3) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c2 = arith.constant 2 : index
        scf.for %arg1 = %c0_0 to %c2 step %c1_1 {
          %c112 = arith.constant 112 : index
          scf.for %arg2 = %c0_0 to %c112 step %c1_1 {
            %0 = aie.objectfifo.acquire @of_6_switch_join_1_0(Produce, 1) : !aie.objectfifosubview<memref<32x64xbf16>>
            %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<32x64xbf16>> -> memref<32x64xbf16>
            func.call @op0_zero_bf16_32_32_64(%1) : (memref<32x64xbf16>) -> ()
            %c128 = arith.constant 128 : index
            scf.for %arg3 = %c0_0 to %c128 step %c1_1 {
              %2 = aie.objectfifo.acquire @of_4_broadcast_0_0(Consume, 1) : !aie.objectfifosubview<memref<32x64xbf16>>
              %3 = aie.objectfifo.subview.access %2[0] : !aie.objectfifosubview<memref<32x64xbf16>> -> memref<32x64xbf16>
              %4 = aie.objectfifo.acquire @of_3_distribute_0_1(Consume, 1) : !aie.objectfifosubview<memref<32x32xbf16>>
              %5 = aie.objectfifo.subview.access %4[0] : !aie.objectfifosubview<memref<32x32xbf16>> -> memref<32x32xbf16>
              func.call @op0_matmul_bf16_bf16_32_32_64(%5, %3, %1) : (memref<32x32xbf16>, memref<32x64xbf16>, memref<32x64xbf16>) -> ()
              aie.objectfifo.release @of_3_distribute_0_1(Consume, 1)
              aie.objectfifo.release @of_4_broadcast_0_0(Consume, 1)
            }
            aie.objectfifo.release @of_6_switch_join_1_0(Produce, 1)
          }
        }
      }
      aie.end
    } {link_with = "op0_mm_32_32_64.o"}
    %core_0_4 = aie.core(%tile_0_4) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c2 = arith.constant 2 : index
        scf.for %arg1 = %c0_0 to %c2 step %c1_1 {
          %c112 = arith.constant 112 : index
          scf.for %arg2 = %c0_0 to %c112 step %c1_1 {
            %0 = aie.objectfifo.acquire @of_6_switch_join_2_0(Produce, 1) : !aie.objectfifosubview<memref<32x64xbf16>>
            %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<32x64xbf16>> -> memref<32x64xbf16>
            func.call @op0_zero_bf16_32_32_64(%1) : (memref<32x64xbf16>) -> ()
            %c128 = arith.constant 128 : index
            scf.for %arg3 = %c0_0 to %c128 step %c1_1 {
              %2 = aie.objectfifo.acquire @of_4_broadcast_0_0(Consume, 1) : !aie.objectfifosubview<memref<32x64xbf16>>
              %3 = aie.objectfifo.subview.access %2[0] : !aie.objectfifosubview<memref<32x64xbf16>> -> memref<32x64xbf16>
              %4 = aie.objectfifo.acquire @of_3_distribute_0_2(Consume, 1) : !aie.objectfifosubview<memref<32x32xbf16>>
              %5 = aie.objectfifo.subview.access %4[0] : !aie.objectfifosubview<memref<32x32xbf16>> -> memref<32x32xbf16>
              func.call @op0_matmul_bf16_bf16_32_32_64(%5, %3, %1) : (memref<32x32xbf16>, memref<32x64xbf16>, memref<32x64xbf16>) -> ()
              aie.objectfifo.release @of_3_distribute_0_2(Consume, 1)
              aie.objectfifo.release @of_4_broadcast_0_0(Consume, 1)
            }
            aie.objectfifo.release @of_6_switch_join_2_0(Produce, 1)
          }
        }
      }
      aie.end
    } {link_with = "op0_mm_32_32_64.o"}
    %core_0_5 = aie.core(%tile_0_5) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c2 = arith.constant 2 : index
        scf.for %arg1 = %c0_0 to %c2 step %c1_1 {
          %c112 = arith.constant 112 : index
          scf.for %arg2 = %c0_0 to %c112 step %c1_1 {
            %0 = aie.objectfifo.acquire @of_6_switch_join_3_0(Produce, 1) : !aie.objectfifosubview<memref<32x64xbf16>>
            %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<32x64xbf16>> -> memref<32x64xbf16>
            func.call @op0_zero_bf16_32_32_64(%1) : (memref<32x64xbf16>) -> ()
            %c128 = arith.constant 128 : index
            scf.for %arg3 = %c0_0 to %c128 step %c1_1 {
              %2 = aie.objectfifo.acquire @of_4_broadcast_0_0(Consume, 1) : !aie.objectfifosubview<memref<32x64xbf16>>
              %3 = aie.objectfifo.subview.access %2[0] : !aie.objectfifosubview<memref<32x64xbf16>> -> memref<32x64xbf16>
              %4 = aie.objectfifo.acquire @of_3_distribute_0_3(Consume, 1) : !aie.objectfifosubview<memref<32x32xbf16>>
              %5 = aie.objectfifo.subview.access %4[0] : !aie.objectfifosubview<memref<32x32xbf16>> -> memref<32x32xbf16>
              func.call @op0_matmul_bf16_bf16_32_32_64(%5, %3, %1) : (memref<32x32xbf16>, memref<32x64xbf16>, memref<32x64xbf16>) -> ()
              aie.objectfifo.release @of_3_distribute_0_3(Consume, 1)
              aie.objectfifo.release @of_4_broadcast_0_0(Consume, 1)
            }
            aie.objectfifo.release @of_6_switch_join_3_0(Produce, 1)
          }
        }
      }
      aie.end
    } {link_with = "op0_mm_32_32_64.o"}
    %core_1_2 = aie.core(%tile_1_2) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c2 = arith.constant 2 : index
        scf.for %arg1 = %c0_0 to %c2 step %c1_1 {
          %c112 = arith.constant 112 : index
          scf.for %arg2 = %c0_0 to %c112 step %c1_1 {
            %0 = aie.objectfifo.acquire @of_6_switch_join_0_1(Produce, 1) : !aie.objectfifosubview<memref<32x64xbf16>>
            %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<32x64xbf16>> -> memref<32x64xbf16>
            func.call @op0_zero_bf16_32_32_64(%1) : (memref<32x64xbf16>) -> ()
            %c128 = arith.constant 128 : index
            scf.for %arg3 = %c0_0 to %c128 step %c1_1 {
              %2 = aie.objectfifo.acquire @of_4_broadcast_1_0(Consume, 1) : !aie.objectfifosubview<memref<32x64xbf16>>
              %3 = aie.objectfifo.subview.access %2[0] : !aie.objectfifosubview<memref<32x64xbf16>> -> memref<32x64xbf16>
              %4 = aie.objectfifo.acquire @of_3_distribute_1_0(Consume, 1) : !aie.objectfifosubview<memref<32x32xbf16>>
              %5 = aie.objectfifo.subview.access %4[0] : !aie.objectfifosubview<memref<32x32xbf16>> -> memref<32x32xbf16>
              func.call @op0_matmul_bf16_bf16_32_32_64(%5, %3, %1) : (memref<32x32xbf16>, memref<32x64xbf16>, memref<32x64xbf16>) -> ()
              aie.objectfifo.release @of_3_distribute_1_0(Consume, 1)
              aie.objectfifo.release @of_4_broadcast_1_0(Consume, 1)
            }
            aie.objectfifo.release @of_6_switch_join_0_1(Produce, 1)
          }
        }
      }
      aie.end
    } {link_with = "op0_mm_32_32_64.o"}
    %core_1_3 = aie.core(%tile_1_3) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c2 = arith.constant 2 : index
        scf.for %arg1 = %c0_0 to %c2 step %c1_1 {
          %c112 = arith.constant 112 : index
          scf.for %arg2 = %c0_0 to %c112 step %c1_1 {
            %0 = aie.objectfifo.acquire @of_6_switch_join_1_1(Produce, 1) : !aie.objectfifosubview<memref<32x64xbf16>>
            %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<32x64xbf16>> -> memref<32x64xbf16>
            func.call @op0_zero_bf16_32_32_64(%1) : (memref<32x64xbf16>) -> ()
            %c128 = arith.constant 128 : index
            scf.for %arg3 = %c0_0 to %c128 step %c1_1 {
              %2 = aie.objectfifo.acquire @of_4_broadcast_1_0(Consume, 1) : !aie.objectfifosubview<memref<32x64xbf16>>
              %3 = aie.objectfifo.subview.access %2[0] : !aie.objectfifosubview<memref<32x64xbf16>> -> memref<32x64xbf16>
              %4 = aie.objectfifo.acquire @of_3_distribute_1_1(Consume, 1) : !aie.objectfifosubview<memref<32x32xbf16>>
              %5 = aie.objectfifo.subview.access %4[0] : !aie.objectfifosubview<memref<32x32xbf16>> -> memref<32x32xbf16>
              func.call @op0_matmul_bf16_bf16_32_32_64(%5, %3, %1) : (memref<32x32xbf16>, memref<32x64xbf16>, memref<32x64xbf16>) -> ()
              aie.objectfifo.release @of_3_distribute_1_1(Consume, 1)
              aie.objectfifo.release @of_4_broadcast_1_0(Consume, 1)
            }
            aie.objectfifo.release @of_6_switch_join_1_1(Produce, 1)
          }
        }
      }
      aie.end
    } {link_with = "op0_mm_32_32_64.o"}
    %core_1_4 = aie.core(%tile_1_4) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c2 = arith.constant 2 : index
        scf.for %arg1 = %c0_0 to %c2 step %c1_1 {
          %c112 = arith.constant 112 : index
          scf.for %arg2 = %c0_0 to %c112 step %c1_1 {
            %0 = aie.objectfifo.acquire @of_6_switch_join_2_1(Produce, 1) : !aie.objectfifosubview<memref<32x64xbf16>>
            %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<32x64xbf16>> -> memref<32x64xbf16>
            func.call @op0_zero_bf16_32_32_64(%1) : (memref<32x64xbf16>) -> ()
            %c128 = arith.constant 128 : index
            scf.for %arg3 = %c0_0 to %c128 step %c1_1 {
              %2 = aie.objectfifo.acquire @of_4_broadcast_1_0(Consume, 1) : !aie.objectfifosubview<memref<32x64xbf16>>
              %3 = aie.objectfifo.subview.access %2[0] : !aie.objectfifosubview<memref<32x64xbf16>> -> memref<32x64xbf16>
              %4 = aie.objectfifo.acquire @of_3_distribute_1_2(Consume, 1) : !aie.objectfifosubview<memref<32x32xbf16>>
              %5 = aie.objectfifo.subview.access %4[0] : !aie.objectfifosubview<memref<32x32xbf16>> -> memref<32x32xbf16>
              func.call @op0_matmul_bf16_bf16_32_32_64(%5, %3, %1) : (memref<32x32xbf16>, memref<32x64xbf16>, memref<32x64xbf16>) -> ()
              aie.objectfifo.release @of_3_distribute_1_2(Consume, 1)
              aie.objectfifo.release @of_4_broadcast_1_0(Consume, 1)
            }
            aie.objectfifo.release @of_6_switch_join_2_1(Produce, 1)
          }
        }
      }
      aie.end
    } {link_with = "op0_mm_32_32_64.o"}
    %core_1_5 = aie.core(%tile_1_5) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c2 = arith.constant 2 : index
        scf.for %arg1 = %c0_0 to %c2 step %c1_1 {
          %c112 = arith.constant 112 : index
          scf.for %arg2 = %c0_0 to %c112 step %c1_1 {
            %0 = aie.objectfifo.acquire @of_6_switch_join_3_1(Produce, 1) : !aie.objectfifosubview<memref<32x64xbf16>>
            %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<32x64xbf16>> -> memref<32x64xbf16>
            func.call @op0_zero_bf16_32_32_64(%1) : (memref<32x64xbf16>) -> ()
            %c128 = arith.constant 128 : index
            scf.for %arg3 = %c0_0 to %c128 step %c1_1 {
              %2 = aie.objectfifo.acquire @of_4_broadcast_1_0(Consume, 1) : !aie.objectfifosubview<memref<32x64xbf16>>
              %3 = aie.objectfifo.subview.access %2[0] : !aie.objectfifosubview<memref<32x64xbf16>> -> memref<32x64xbf16>
              %4 = aie.objectfifo.acquire @of_3_distribute_1_3(Consume, 1) : !aie.objectfifosubview<memref<32x32xbf16>>
              %5 = aie.objectfifo.subview.access %4[0] : !aie.objectfifosubview<memref<32x32xbf16>> -> memref<32x32xbf16>
              func.call @op0_matmul_bf16_bf16_32_32_64(%5, %3, %1) : (memref<32x32xbf16>, memref<32x64xbf16>, memref<32x64xbf16>) -> ()
              aie.objectfifo.release @of_3_distribute_1_3(Consume, 1)
              aie.objectfifo.release @of_4_broadcast_1_0(Consume, 1)
            }
            aie.objectfifo.release @of_6_switch_join_3_1(Produce, 1)
          }
        }
      }
      aie.end
    } {link_with = "op0_mm_32_32_64.o"}
    %core_2_2 = aie.core(%tile_2_2) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c2 = arith.constant 2 : index
        scf.for %arg1 = %c0_0 to %c2 step %c1_1 {
          %c112 = arith.constant 112 : index
          scf.for %arg2 = %c0_0 to %c112 step %c1_1 {
            %0 = aie.objectfifo.acquire @of_7_switch_join_0_0(Produce, 1) : !aie.objectfifosubview<memref<32x64xbf16>>
            %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<32x64xbf16>> -> memref<32x64xbf16>
            func.call @op0_zero_bf16_32_32_64(%1) : (memref<32x64xbf16>) -> ()
            %c128 = arith.constant 128 : index
            scf.for %arg3 = %c0_0 to %c128 step %c1_1 {
              %2 = aie.objectfifo.acquire @of_5_broadcast_0_0(Consume, 1) : !aie.objectfifosubview<memref<32x64xbf16>>
              %3 = aie.objectfifo.subview.access %2[0] : !aie.objectfifosubview<memref<32x64xbf16>> -> memref<32x64xbf16>
              %4 = aie.objectfifo.acquire @of_3_distribute_0_0(Consume, 1) : !aie.objectfifosubview<memref<32x32xbf16>>
              %5 = aie.objectfifo.subview.access %4[0] : !aie.objectfifosubview<memref<32x32xbf16>> -> memref<32x32xbf16>
              func.call @op0_matmul_bf16_bf16_32_32_64(%5, %3, %1) : (memref<32x32xbf16>, memref<32x64xbf16>, memref<32x64xbf16>) -> ()
              aie.objectfifo.release @of_3_distribute_0_0(Consume, 1)
              aie.objectfifo.release @of_5_broadcast_0_0(Consume, 1)
            }
            aie.objectfifo.release @of_7_switch_join_0_0(Produce, 1)
          }
        }
      }
      aie.end
    } {link_with = "op0_mm_32_32_64.o"}
    %core_2_3 = aie.core(%tile_2_3) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c2 = arith.constant 2 : index
        scf.for %arg1 = %c0_0 to %c2 step %c1_1 {
          %c112 = arith.constant 112 : index
          scf.for %arg2 = %c0_0 to %c112 step %c1_1 {
            %0 = aie.objectfifo.acquire @of_7_switch_join_1_0(Produce, 1) : !aie.objectfifosubview<memref<32x64xbf16>>
            %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<32x64xbf16>> -> memref<32x64xbf16>
            func.call @op0_zero_bf16_32_32_64(%1) : (memref<32x64xbf16>) -> ()
            %c128 = arith.constant 128 : index
            scf.for %arg3 = %c0_0 to %c128 step %c1_1 {
              %2 = aie.objectfifo.acquire @of_5_broadcast_0_0(Consume, 1) : !aie.objectfifosubview<memref<32x64xbf16>>
              %3 = aie.objectfifo.subview.access %2[0] : !aie.objectfifosubview<memref<32x64xbf16>> -> memref<32x64xbf16>
              %4 = aie.objectfifo.acquire @of_3_distribute_0_1(Consume, 1) : !aie.objectfifosubview<memref<32x32xbf16>>
              %5 = aie.objectfifo.subview.access %4[0] : !aie.objectfifosubview<memref<32x32xbf16>> -> memref<32x32xbf16>
              func.call @op0_matmul_bf16_bf16_32_32_64(%5, %3, %1) : (memref<32x32xbf16>, memref<32x64xbf16>, memref<32x64xbf16>) -> ()
              aie.objectfifo.release @of_3_distribute_0_1(Consume, 1)
              aie.objectfifo.release @of_5_broadcast_0_0(Consume, 1)
            }
            aie.objectfifo.release @of_7_switch_join_1_0(Produce, 1)
          }
        }
      }
      aie.end
    } {link_with = "op0_mm_32_32_64.o"}
    %core_2_4 = aie.core(%tile_2_4) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c2 = arith.constant 2 : index
        scf.for %arg1 = %c0_0 to %c2 step %c1_1 {
          %c112 = arith.constant 112 : index
          scf.for %arg2 = %c0_0 to %c112 step %c1_1 {
            %0 = aie.objectfifo.acquire @of_7_switch_join_2_0(Produce, 1) : !aie.objectfifosubview<memref<32x64xbf16>>
            %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<32x64xbf16>> -> memref<32x64xbf16>
            func.call @op0_zero_bf16_32_32_64(%1) : (memref<32x64xbf16>) -> ()
            %c128 = arith.constant 128 : index
            scf.for %arg3 = %c0_0 to %c128 step %c1_1 {
              %2 = aie.objectfifo.acquire @of_5_broadcast_0_0(Consume, 1) : !aie.objectfifosubview<memref<32x64xbf16>>
              %3 = aie.objectfifo.subview.access %2[0] : !aie.objectfifosubview<memref<32x64xbf16>> -> memref<32x64xbf16>
              %4 = aie.objectfifo.acquire @of_3_distribute_0_2(Consume, 1) : !aie.objectfifosubview<memref<32x32xbf16>>
              %5 = aie.objectfifo.subview.access %4[0] : !aie.objectfifosubview<memref<32x32xbf16>> -> memref<32x32xbf16>
              func.call @op0_matmul_bf16_bf16_32_32_64(%5, %3, %1) : (memref<32x32xbf16>, memref<32x64xbf16>, memref<32x64xbf16>) -> ()
              aie.objectfifo.release @of_3_distribute_0_2(Consume, 1)
              aie.objectfifo.release @of_5_broadcast_0_0(Consume, 1)
            }
            aie.objectfifo.release @of_7_switch_join_2_0(Produce, 1)
          }
        }
      }
      aie.end
    } {link_with = "op0_mm_32_32_64.o"}
    %core_2_5 = aie.core(%tile_2_5) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c2 = arith.constant 2 : index
        scf.for %arg1 = %c0_0 to %c2 step %c1_1 {
          %c112 = arith.constant 112 : index
          scf.for %arg2 = %c0_0 to %c112 step %c1_1 {
            %0 = aie.objectfifo.acquire @of_7_switch_join_3_0(Produce, 1) : !aie.objectfifosubview<memref<32x64xbf16>>
            %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<32x64xbf16>> -> memref<32x64xbf16>
            func.call @op0_zero_bf16_32_32_64(%1) : (memref<32x64xbf16>) -> ()
            %c128 = arith.constant 128 : index
            scf.for %arg3 = %c0_0 to %c128 step %c1_1 {
              %2 = aie.objectfifo.acquire @of_5_broadcast_0_0(Consume, 1) : !aie.objectfifosubview<memref<32x64xbf16>>
              %3 = aie.objectfifo.subview.access %2[0] : !aie.objectfifosubview<memref<32x64xbf16>> -> memref<32x64xbf16>
              %4 = aie.objectfifo.acquire @of_3_distribute_0_3(Consume, 1) : !aie.objectfifosubview<memref<32x32xbf16>>
              %5 = aie.objectfifo.subview.access %4[0] : !aie.objectfifosubview<memref<32x32xbf16>> -> memref<32x32xbf16>
              func.call @op0_matmul_bf16_bf16_32_32_64(%5, %3, %1) : (memref<32x32xbf16>, memref<32x64xbf16>, memref<32x64xbf16>) -> ()
              aie.objectfifo.release @of_3_distribute_0_3(Consume, 1)
              aie.objectfifo.release @of_5_broadcast_0_0(Consume, 1)
            }
            aie.objectfifo.release @of_7_switch_join_3_0(Produce, 1)
          }
        }
      }
      aie.end
    } {link_with = "op0_mm_32_32_64.o"}
    %core_3_2 = aie.core(%tile_3_2) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c2 = arith.constant 2 : index
        scf.for %arg1 = %c0_0 to %c2 step %c1_1 {
          %c112 = arith.constant 112 : index
          scf.for %arg2 = %c0_0 to %c112 step %c1_1 {
            %0 = aie.objectfifo.acquire @of_7_switch_join_0_1(Produce, 1) : !aie.objectfifosubview<memref<32x64xbf16>>
            %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<32x64xbf16>> -> memref<32x64xbf16>
            func.call @op0_zero_bf16_32_32_64(%1) : (memref<32x64xbf16>) -> ()
            %c128 = arith.constant 128 : index
            scf.for %arg3 = %c0_0 to %c128 step %c1_1 {
              %2 = aie.objectfifo.acquire @of_5_broadcast_1_0(Consume, 1) : !aie.objectfifosubview<memref<32x64xbf16>>
              %3 = aie.objectfifo.subview.access %2[0] : !aie.objectfifosubview<memref<32x64xbf16>> -> memref<32x64xbf16>
              %4 = aie.objectfifo.acquire @of_3_distribute_1_0(Consume, 1) : !aie.objectfifosubview<memref<32x32xbf16>>
              %5 = aie.objectfifo.subview.access %4[0] : !aie.objectfifosubview<memref<32x32xbf16>> -> memref<32x32xbf16>
              func.call @op0_matmul_bf16_bf16_32_32_64(%5, %3, %1) : (memref<32x32xbf16>, memref<32x64xbf16>, memref<32x64xbf16>) -> ()
              aie.objectfifo.release @of_3_distribute_1_0(Consume, 1)
              aie.objectfifo.release @of_5_broadcast_1_0(Consume, 1)
            }
            aie.objectfifo.release @of_7_switch_join_0_1(Produce, 1)
          }
        }
      }
      aie.end
    } {link_with = "op0_mm_32_32_64.o"}
    %core_3_3 = aie.core(%tile_3_3) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c2 = arith.constant 2 : index
        scf.for %arg1 = %c0_0 to %c2 step %c1_1 {
          %c112 = arith.constant 112 : index
          scf.for %arg2 = %c0_0 to %c112 step %c1_1 {
            %0 = aie.objectfifo.acquire @of_7_switch_join_1_1(Produce, 1) : !aie.objectfifosubview<memref<32x64xbf16>>
            %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<32x64xbf16>> -> memref<32x64xbf16>
            func.call @op0_zero_bf16_32_32_64(%1) : (memref<32x64xbf16>) -> ()
            %c128 = arith.constant 128 : index
            scf.for %arg3 = %c0_0 to %c128 step %c1_1 {
              %2 = aie.objectfifo.acquire @of_5_broadcast_1_0(Consume, 1) : !aie.objectfifosubview<memref<32x64xbf16>>
              %3 = aie.objectfifo.subview.access %2[0] : !aie.objectfifosubview<memref<32x64xbf16>> -> memref<32x64xbf16>
              %4 = aie.objectfifo.acquire @of_3_distribute_1_1(Consume, 1) : !aie.objectfifosubview<memref<32x32xbf16>>
              %5 = aie.objectfifo.subview.access %4[0] : !aie.objectfifosubview<memref<32x32xbf16>> -> memref<32x32xbf16>
              func.call @op0_matmul_bf16_bf16_32_32_64(%5, %3, %1) : (memref<32x32xbf16>, memref<32x64xbf16>, memref<32x64xbf16>) -> ()
              aie.objectfifo.release @of_3_distribute_1_1(Consume, 1)
              aie.objectfifo.release @of_5_broadcast_1_0(Consume, 1)
            }
            aie.objectfifo.release @of_7_switch_join_1_1(Produce, 1)
          }
        }
      }
      aie.end
    } {link_with = "op0_mm_32_32_64.o"}
    %core_3_4 = aie.core(%tile_3_4) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c2 = arith.constant 2 : index
        scf.for %arg1 = %c0_0 to %c2 step %c1_1 {
          %c112 = arith.constant 112 : index
          scf.for %arg2 = %c0_0 to %c112 step %c1_1 {
            %0 = aie.objectfifo.acquire @of_7_switch_join_2_1(Produce, 1) : !aie.objectfifosubview<memref<32x64xbf16>>
            %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<32x64xbf16>> -> memref<32x64xbf16>
            func.call @op0_zero_bf16_32_32_64(%1) : (memref<32x64xbf16>) -> ()
            %c128 = arith.constant 128 : index
            scf.for %arg3 = %c0_0 to %c128 step %c1_1 {
              %2 = aie.objectfifo.acquire @of_5_broadcast_1_0(Consume, 1) : !aie.objectfifosubview<memref<32x64xbf16>>
              %3 = aie.objectfifo.subview.access %2[0] : !aie.objectfifosubview<memref<32x64xbf16>> -> memref<32x64xbf16>
              %4 = aie.objectfifo.acquire @of_3_distribute_1_2(Consume, 1) : !aie.objectfifosubview<memref<32x32xbf16>>
              %5 = aie.objectfifo.subview.access %4[0] : !aie.objectfifosubview<memref<32x32xbf16>> -> memref<32x32xbf16>
              func.call @op0_matmul_bf16_bf16_32_32_64(%5, %3, %1) : (memref<32x32xbf16>, memref<32x64xbf16>, memref<32x64xbf16>) -> ()
              aie.objectfifo.release @of_3_distribute_1_2(Consume, 1)
              aie.objectfifo.release @of_5_broadcast_1_0(Consume, 1)
            }
            aie.objectfifo.release @of_7_switch_join_2_1(Produce, 1)
          }
        }
      }
      aie.end
    } {link_with = "op0_mm_32_32_64.o"}
    %core_3_5 = aie.core(%tile_3_5) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c2 = arith.constant 2 : index
        scf.for %arg1 = %c0_0 to %c2 step %c1_1 {
          %c112 = arith.constant 112 : index
          scf.for %arg2 = %c0_0 to %c112 step %c1_1 {
            %0 = aie.objectfifo.acquire @of_7_switch_join_3_1(Produce, 1) : !aie.objectfifosubview<memref<32x64xbf16>>
            %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<32x64xbf16>> -> memref<32x64xbf16>
            func.call @op0_zero_bf16_32_32_64(%1) : (memref<32x64xbf16>) -> ()
            %c128 = arith.constant 128 : index
            scf.for %arg3 = %c0_0 to %c128 step %c1_1 {
              %2 = aie.objectfifo.acquire @of_5_broadcast_1_0(Consume, 1) : !aie.objectfifosubview<memref<32x64xbf16>>
              %3 = aie.objectfifo.subview.access %2[0] : !aie.objectfifosubview<memref<32x64xbf16>> -> memref<32x64xbf16>
              %4 = aie.objectfifo.acquire @of_3_distribute_1_3(Consume, 1) : !aie.objectfifosubview<memref<32x32xbf16>>
              %5 = aie.objectfifo.subview.access %4[0] : !aie.objectfifosubview<memref<32x32xbf16>> -> memref<32x32xbf16>
              func.call @op0_matmul_bf16_bf16_32_32_64(%5, %3, %1) : (memref<32x32xbf16>, memref<32x64xbf16>, memref<32x64xbf16>) -> ()
              aie.objectfifo.release @of_3_distribute_1_3(Consume, 1)
              aie.objectfifo.release @of_5_broadcast_1_0(Consume, 1)
            }
            aie.objectfifo.release @of_7_switch_join_3_1(Produce, 1)
          }
        }
      }
      aie.end
    } {link_with = "op0_mm_32_32_64.o"}
    %core_4_2 = aie.core(%tile_4_2) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c2 = arith.constant 2 : index
        scf.for %arg1 = %c0_0 to %c2 step %c1_1 {
          %c112 = arith.constant 112 : index
          scf.for %arg2 = %c0_0 to %c112 step %c1_1 {
            %c2_2 = arith.constant 2 : index
            %0 = aie.objectfifo.acquire @of_6_switch_join_0_0(Consume, 1) : !aie.objectfifosubview<memref<32x64xbf16>>
            %1 = aie.objectfifo.acquire @of_6_switch_join_0_1(Consume, 1) : !aie.objectfifosubview<memref<32x64xbf16>>
            %2 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<32x64xbf16>> -> memref<32x64xbf16>
            %3 = aie.objectfifo.subview.access %1[0] : !aie.objectfifosubview<memref<32x64xbf16>> -> memref<32x64xbf16>
            scf.for %arg3 = %c0_0 to %c2_2 step %c1_1 {
              %4 = aie.objectfifo.acquire @of_8_unicast_0(Produce, 1) : !aie.objectfifosubview<memref<32x64xbf16>>
              %5 = aie.objectfifo.subview.access %4[0] : !aie.objectfifosubview<memref<32x64xbf16>> -> memref<32x64xbf16>
              %6 = scf.index_switch %arg3 -> memref<32x64xbf16> 
              case 0 {
                scf.yield %2 : memref<32x64xbf16>
              }
              case 1 {
                scf.yield %3 : memref<32x64xbf16>
              }
              default {
                scf.yield %2 : memref<32x64xbf16>
              }
              %c2048_i32 = arith.constant 2048 : i32
              func.call @op0_silu_bf16(%6, %5, %c2048_i32) : (memref<32x64xbf16>, memref<32x64xbf16>, i32) -> ()
              aie.objectfifo.release @of_8_unicast_0(Produce, 1)
            }
            aie.objectfifo.release @of_6_switch_join_0_0(Consume, 1)
            aie.objectfifo.release @of_6_switch_join_0_1(Consume, 1)
          }
        }
      }
      aie.end
    } {link_with = "op0_silu.o"}
    %core_4_3 = aie.core(%tile_4_3) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c2 = arith.constant 2 : index
        scf.for %arg1 = %c0_0 to %c2 step %c1_1 {
          %c112 = arith.constant 112 : index
          scf.for %arg2 = %c0_0 to %c112 step %c1_1 {
            %c2_2 = arith.constant 2 : index
            %0 = aie.objectfifo.acquire @of_6_switch_join_1_0(Consume, 1) : !aie.objectfifosubview<memref<32x64xbf16>>
            %1 = aie.objectfifo.acquire @of_6_switch_join_1_1(Consume, 1) : !aie.objectfifosubview<memref<32x64xbf16>>
            %2 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<32x64xbf16>> -> memref<32x64xbf16>
            %3 = aie.objectfifo.subview.access %1[0] : !aie.objectfifosubview<memref<32x64xbf16>> -> memref<32x64xbf16>
            scf.for %arg3 = %c0_0 to %c2_2 step %c1_1 {
              %4 = aie.objectfifo.acquire @of_8_unicast_1(Produce, 1) : !aie.objectfifosubview<memref<32x64xbf16>>
              %5 = aie.objectfifo.subview.access %4[0] : !aie.objectfifosubview<memref<32x64xbf16>> -> memref<32x64xbf16>
              %6 = scf.index_switch %arg3 -> memref<32x64xbf16> 
              case 0 {
                scf.yield %2 : memref<32x64xbf16>
              }
              case 1 {
                scf.yield %3 : memref<32x64xbf16>
              }
              default {
                scf.yield %2 : memref<32x64xbf16>
              }
              %c2048_i32 = arith.constant 2048 : i32
              func.call @op0_silu_bf16(%6, %5, %c2048_i32) : (memref<32x64xbf16>, memref<32x64xbf16>, i32) -> ()
              aie.objectfifo.release @of_8_unicast_1(Produce, 1)
            }
            aie.objectfifo.release @of_6_switch_join_1_0(Consume, 1)
            aie.objectfifo.release @of_6_switch_join_1_1(Consume, 1)
          }
        }
      }
      aie.end
    } {link_with = "op0_silu.o"}
    %core_4_4 = aie.core(%tile_4_4) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c2 = arith.constant 2 : index
        scf.for %arg1 = %c0_0 to %c2 step %c1_1 {
          %c112 = arith.constant 112 : index
          scf.for %arg2 = %c0_0 to %c112 step %c1_1 {
            %c2_2 = arith.constant 2 : index
            %0 = aie.objectfifo.acquire @of_6_switch_join_2_0(Consume, 1) : !aie.objectfifosubview<memref<32x64xbf16>>
            %1 = aie.objectfifo.acquire @of_6_switch_join_2_1(Consume, 1) : !aie.objectfifosubview<memref<32x64xbf16>>
            %2 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<32x64xbf16>> -> memref<32x64xbf16>
            %3 = aie.objectfifo.subview.access %1[0] : !aie.objectfifosubview<memref<32x64xbf16>> -> memref<32x64xbf16>
            scf.for %arg3 = %c0_0 to %c2_2 step %c1_1 {
              %4 = aie.objectfifo.acquire @of_8_unicast_2(Produce, 1) : !aie.objectfifosubview<memref<32x64xbf16>>
              %5 = aie.objectfifo.subview.access %4[0] : !aie.objectfifosubview<memref<32x64xbf16>> -> memref<32x64xbf16>
              %6 = scf.index_switch %arg3 -> memref<32x64xbf16> 
              case 0 {
                scf.yield %2 : memref<32x64xbf16>
              }
              case 1 {
                scf.yield %3 : memref<32x64xbf16>
              }
              default {
                scf.yield %2 : memref<32x64xbf16>
              }
              %c2048_i32 = arith.constant 2048 : i32
              func.call @op0_silu_bf16(%6, %5, %c2048_i32) : (memref<32x64xbf16>, memref<32x64xbf16>, i32) -> ()
              aie.objectfifo.release @of_8_unicast_2(Produce, 1)
            }
            aie.objectfifo.release @of_6_switch_join_2_0(Consume, 1)
            aie.objectfifo.release @of_6_switch_join_2_1(Consume, 1)
          }
        }
      }
      aie.end
    } {link_with = "op0_silu.o"}
    %core_4_5 = aie.core(%tile_4_5) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c2 = arith.constant 2 : index
        scf.for %arg1 = %c0_0 to %c2 step %c1_1 {
          %c112 = arith.constant 112 : index
          scf.for %arg2 = %c0_0 to %c112 step %c1_1 {
            %c2_2 = arith.constant 2 : index
            %0 = aie.objectfifo.acquire @of_6_switch_join_3_0(Consume, 1) : !aie.objectfifosubview<memref<32x64xbf16>>
            %1 = aie.objectfifo.acquire @of_6_switch_join_3_1(Consume, 1) : !aie.objectfifosubview<memref<32x64xbf16>>
            %2 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<32x64xbf16>> -> memref<32x64xbf16>
            %3 = aie.objectfifo.subview.access %1[0] : !aie.objectfifosubview<memref<32x64xbf16>> -> memref<32x64xbf16>
            scf.for %arg3 = %c0_0 to %c2_2 step %c1_1 {
              %4 = aie.objectfifo.acquire @of_8_unicast_3(Produce, 1) : !aie.objectfifosubview<memref<32x64xbf16>>
              %5 = aie.objectfifo.subview.access %4[0] : !aie.objectfifosubview<memref<32x64xbf16>> -> memref<32x64xbf16>
              %6 = scf.index_switch %arg3 -> memref<32x64xbf16> 
              case 0 {
                scf.yield %2 : memref<32x64xbf16>
              }
              case 1 {
                scf.yield %3 : memref<32x64xbf16>
              }
              default {
                scf.yield %2 : memref<32x64xbf16>
              }
              %c2048_i32 = arith.constant 2048 : i32
              func.call @op0_silu_bf16(%6, %5, %c2048_i32) : (memref<32x64xbf16>, memref<32x64xbf16>, i32) -> ()
              aie.objectfifo.release @of_8_unicast_3(Produce, 1)
            }
            aie.objectfifo.release @of_6_switch_join_3_0(Consume, 1)
            aie.objectfifo.release @of_6_switch_join_3_1(Consume, 1)
          }
        }
      }
      aie.end
    } {link_with = "op0_silu.o"}
    %core_5_2 = aie.core(%tile_5_2) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c2 = arith.constant 2 : index
        scf.for %arg1 = %c0_0 to %c2 step %c1_1 {
          %c112 = arith.constant 112 : index
          scf.for %arg2 = %c0_0 to %c112 step %c1_1 {
            %c2_2 = arith.constant 2 : index
            %0 = aie.objectfifo.acquire @of_7_switch_join_0_0(Consume, 1) : !aie.objectfifosubview<memref<32x64xbf16>>
            %1 = aie.objectfifo.acquire @of_7_switch_join_0_1(Consume, 1) : !aie.objectfifosubview<memref<32x64xbf16>>
            %2 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<32x64xbf16>> -> memref<32x64xbf16>
            %3 = aie.objectfifo.subview.access %1[0] : !aie.objectfifosubview<memref<32x64xbf16>> -> memref<32x64xbf16>
            scf.for %arg3 = %c0_0 to %c2_2 step %c1_1 {
              %4 = aie.objectfifo.acquire @of_9_join_0_0(Produce, 1) : !aie.objectfifosubview<memref<32x64xbf16>>
              %5 = aie.objectfifo.subview.access %4[0] : !aie.objectfifosubview<memref<32x64xbf16>> -> memref<32x64xbf16>
              %6 = aie.objectfifo.acquire @of_8_unicast_0(Consume, 1) : !aie.objectfifosubview<memref<32x64xbf16>>
              %7 = aie.objectfifo.subview.access %6[0] : !aie.objectfifosubview<memref<32x64xbf16>> -> memref<32x64xbf16>
              %8 = scf.index_switch %arg3 -> memref<32x64xbf16> 
              case 0 {
                scf.yield %2 : memref<32x64xbf16>
              }
              case 1 {
                scf.yield %3 : memref<32x64xbf16>
              }
              default {
                scf.yield %2 : memref<32x64xbf16>
              }
              %c2048_i32 = arith.constant 2048 : i32
              func.call @op0_eltwise_mul_bf16_vector(%7, %8, %5, %c2048_i32) : (memref<32x64xbf16>, memref<32x64xbf16>, memref<32x64xbf16>, i32) -> ()
              aie.objectfifo.release @of_8_unicast_0(Consume, 1)
              aie.objectfifo.release @of_9_join_0_0(Produce, 1)
            }
            aie.objectfifo.release @of_7_switch_join_0_0(Consume, 1)
            aie.objectfifo.release @of_7_switch_join_0_1(Consume, 1)
          }
        }
      }
      aie.end
    } {link_with = "op0_mul.o"}
    %core_5_3 = aie.core(%tile_5_3) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c2 = arith.constant 2 : index
        scf.for %arg1 = %c0_0 to %c2 step %c1_1 {
          %c112 = arith.constant 112 : index
          scf.for %arg2 = %c0_0 to %c112 step %c1_1 {
            %c2_2 = arith.constant 2 : index
            %0 = aie.objectfifo.acquire @of_7_switch_join_1_0(Consume, 1) : !aie.objectfifosubview<memref<32x64xbf16>>
            %1 = aie.objectfifo.acquire @of_7_switch_join_1_1(Consume, 1) : !aie.objectfifosubview<memref<32x64xbf16>>
            %2 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<32x64xbf16>> -> memref<32x64xbf16>
            %3 = aie.objectfifo.subview.access %1[0] : !aie.objectfifosubview<memref<32x64xbf16>> -> memref<32x64xbf16>
            scf.for %arg3 = %c0_0 to %c2_2 step %c1_1 {
              %4 = aie.objectfifo.acquire @of_9_join_0_1(Produce, 1) : !aie.objectfifosubview<memref<32x64xbf16>>
              %5 = aie.objectfifo.subview.access %4[0] : !aie.objectfifosubview<memref<32x64xbf16>> -> memref<32x64xbf16>
              %6 = aie.objectfifo.acquire @of_8_unicast_1(Consume, 1) : !aie.objectfifosubview<memref<32x64xbf16>>
              %7 = aie.objectfifo.subview.access %6[0] : !aie.objectfifosubview<memref<32x64xbf16>> -> memref<32x64xbf16>
              %8 = scf.index_switch %arg3 -> memref<32x64xbf16> 
              case 0 {
                scf.yield %2 : memref<32x64xbf16>
              }
              case 1 {
                scf.yield %3 : memref<32x64xbf16>
              }
              default {
                scf.yield %2 : memref<32x64xbf16>
              }
              %c2048_i32 = arith.constant 2048 : i32
              func.call @op0_eltwise_mul_bf16_vector(%7, %8, %5, %c2048_i32) : (memref<32x64xbf16>, memref<32x64xbf16>, memref<32x64xbf16>, i32) -> ()
              aie.objectfifo.release @of_8_unicast_1(Consume, 1)
              aie.objectfifo.release @of_9_join_0_1(Produce, 1)
            }
            aie.objectfifo.release @of_7_switch_join_1_0(Consume, 1)
            aie.objectfifo.release @of_7_switch_join_1_1(Consume, 1)
          }
        }
      }
      aie.end
    } {link_with = "op0_mul.o"}
    %core_5_4 = aie.core(%tile_5_4) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c2 = arith.constant 2 : index
        scf.for %arg1 = %c0_0 to %c2 step %c1_1 {
          %c112 = arith.constant 112 : index
          scf.for %arg2 = %c0_0 to %c112 step %c1_1 {
            %c2_2 = arith.constant 2 : index
            %0 = aie.objectfifo.acquire @of_7_switch_join_2_0(Consume, 1) : !aie.objectfifosubview<memref<32x64xbf16>>
            %1 = aie.objectfifo.acquire @of_7_switch_join_2_1(Consume, 1) : !aie.objectfifosubview<memref<32x64xbf16>>
            %2 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<32x64xbf16>> -> memref<32x64xbf16>
            %3 = aie.objectfifo.subview.access %1[0] : !aie.objectfifosubview<memref<32x64xbf16>> -> memref<32x64xbf16>
            scf.for %arg3 = %c0_0 to %c2_2 step %c1_1 {
              %4 = aie.objectfifo.acquire @of_9_join_0_2(Produce, 1) : !aie.objectfifosubview<memref<32x64xbf16>>
              %5 = aie.objectfifo.subview.access %4[0] : !aie.objectfifosubview<memref<32x64xbf16>> -> memref<32x64xbf16>
              %6 = aie.objectfifo.acquire @of_8_unicast_2(Consume, 1) : !aie.objectfifosubview<memref<32x64xbf16>>
              %7 = aie.objectfifo.subview.access %6[0] : !aie.objectfifosubview<memref<32x64xbf16>> -> memref<32x64xbf16>
              %8 = scf.index_switch %arg3 -> memref<32x64xbf16> 
              case 0 {
                scf.yield %2 : memref<32x64xbf16>
              }
              case 1 {
                scf.yield %3 : memref<32x64xbf16>
              }
              default {
                scf.yield %2 : memref<32x64xbf16>
              }
              %c2048_i32 = arith.constant 2048 : i32
              func.call @op0_eltwise_mul_bf16_vector(%7, %8, %5, %c2048_i32) : (memref<32x64xbf16>, memref<32x64xbf16>, memref<32x64xbf16>, i32) -> ()
              aie.objectfifo.release @of_8_unicast_2(Consume, 1)
              aie.objectfifo.release @of_9_join_0_2(Produce, 1)
            }
            aie.objectfifo.release @of_7_switch_join_2_0(Consume, 1)
            aie.objectfifo.release @of_7_switch_join_2_1(Consume, 1)
          }
        }
      }
      aie.end
    } {link_with = "op0_mul.o"}
    %core_5_5 = aie.core(%tile_5_5) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c2 = arith.constant 2 : index
        scf.for %arg1 = %c0_0 to %c2 step %c1_1 {
          %c112 = arith.constant 112 : index
          scf.for %arg2 = %c0_0 to %c112 step %c1_1 {
            %c2_2 = arith.constant 2 : index
            %0 = aie.objectfifo.acquire @of_7_switch_join_3_0(Consume, 1) : !aie.objectfifosubview<memref<32x64xbf16>>
            %1 = aie.objectfifo.acquire @of_7_switch_join_3_1(Consume, 1) : !aie.objectfifosubview<memref<32x64xbf16>>
            %2 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<32x64xbf16>> -> memref<32x64xbf16>
            %3 = aie.objectfifo.subview.access %1[0] : !aie.objectfifosubview<memref<32x64xbf16>> -> memref<32x64xbf16>
            scf.for %arg3 = %c0_0 to %c2_2 step %c1_1 {
              %4 = aie.objectfifo.acquire @of_9_join_0_3(Produce, 1) : !aie.objectfifosubview<memref<32x64xbf16>>
              %5 = aie.objectfifo.subview.access %4[0] : !aie.objectfifosubview<memref<32x64xbf16>> -> memref<32x64xbf16>
              %6 = aie.objectfifo.acquire @of_8_unicast_3(Consume, 1) : !aie.objectfifosubview<memref<32x64xbf16>>
              %7 = aie.objectfifo.subview.access %6[0] : !aie.objectfifosubview<memref<32x64xbf16>> -> memref<32x64xbf16>
              %8 = scf.index_switch %arg3 -> memref<32x64xbf16> 
              case 0 {
                scf.yield %2 : memref<32x64xbf16>
              }
              case 1 {
                scf.yield %3 : memref<32x64xbf16>
              }
              default {
                scf.yield %2 : memref<32x64xbf16>
              }
              %c2048_i32 = arith.constant 2048 : i32
              func.call @op0_eltwise_mul_bf16_vector(%7, %8, %5, %c2048_i32) : (memref<32x64xbf16>, memref<32x64xbf16>, memref<32x64xbf16>, i32) -> ()
              aie.objectfifo.release @of_8_unicast_3(Consume, 1)
              aie.objectfifo.release @of_9_join_0_3(Produce, 1)
            }
            aie.objectfifo.release @of_7_switch_join_3_0(Consume, 1)
            aie.objectfifo.release @of_7_switch_join_3_1(Consume, 1)
          }
        }
      }
      aie.end
    } {link_with = "op0_mul.o"}
    aie.objectfifo @of_0_mem_0(%shim_noc_tile_0_0, {%mem_tile_0_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<4x32x32xbf16>>  
    aie.objectfifo @of_0_mem_1(%shim_noc_tile_1_0, {%mem_tile_1_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<4x32x32xbf16>>  
    aie.objectfifo @of_1_mem_0(%shim_noc_tile_2_0, {%mem_tile_2_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<32x64xbf16>>  
    aie.objectfifo @of_1_mem_1(%shim_noc_tile_3_0, {%mem_tile_3_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<32x64xbf16>>  
    aie.objectfifo @of_2_mem_0(%shim_noc_tile_5_0, {%mem_tile_5_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<32x64xbf16>>  
    aie.objectfifo @of_2_mem_1(%shim_noc_tile_6_0, {%mem_tile_6_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<32x64xbf16>>  
    aie.objectfifo @of_3_distribute_0_0(%mem_tile_0_1 dimensionsToStream [<size = 4, stride = 256>, <size = 4, stride = 8>, <size = 8, stride = 32>, <size = 8, stride = 1>], {%tile_2_2, %tile_0_2}, [2 : i32, 2 : i32, 2 : i32]) : !aie.objectfifo<memref<32x32xbf16>>  
    aie.objectfifo @of_3_distribute_0_1(%mem_tile_0_1 dimensionsToStream [<size = 4, stride = 256>, <size = 4, stride = 8>, <size = 8, stride = 32>, <size = 8, stride = 1>], {%tile_0_3, %tile_2_3}, [2 : i32, 2 : i32, 2 : i32]) : !aie.objectfifo<memref<32x32xbf16>>  
    aie.objectfifo @of_3_distribute_0_2(%mem_tile_0_1 dimensionsToStream [<size = 4, stride = 256>, <size = 4, stride = 8>, <size = 8, stride = 32>, <size = 8, stride = 1>], {%tile_2_4, %tile_0_4}, [2 : i32, 2 : i32, 2 : i32]) : !aie.objectfifo<memref<32x32xbf16>>  
    aie.objectfifo @of_3_distribute_0_3(%mem_tile_0_1 dimensionsToStream [<size = 4, stride = 256>, <size = 4, stride = 8>, <size = 8, stride = 32>, <size = 8, stride = 1>], {%tile_0_5, %tile_2_5}, [2 : i32, 2 : i32, 2 : i32]) : !aie.objectfifo<memref<32x32xbf16>>  
    aie.objectfifo.link [@of_0_mem_0] -> [@of_3_distribute_0_0, @of_3_distribute_0_1, @of_3_distribute_0_2, @of_3_distribute_0_3]([] [0, 1024, 2048, 3072])
    aie.objectfifo @of_3_distribute_1_0(%mem_tile_1_1 dimensionsToStream [<size = 4, stride = 256>, <size = 4, stride = 8>, <size = 8, stride = 32>, <size = 8, stride = 1>], {%tile_3_2, %tile_1_2}, [2 : i32, 2 : i32, 2 : i32]) : !aie.objectfifo<memref<32x32xbf16>>  
    aie.objectfifo @of_3_distribute_1_1(%mem_tile_1_1 dimensionsToStream [<size = 4, stride = 256>, <size = 4, stride = 8>, <size = 8, stride = 32>, <size = 8, stride = 1>], {%tile_3_3, %tile_1_3}, [2 : i32, 2 : i32, 2 : i32]) : !aie.objectfifo<memref<32x32xbf16>>  
    aie.objectfifo @of_3_distribute_1_2(%mem_tile_1_1 dimensionsToStream [<size = 4, stride = 256>, <size = 4, stride = 8>, <size = 8, stride = 32>, <size = 8, stride = 1>], {%tile_3_4, %tile_1_4}, [2 : i32, 2 : i32, 2 : i32]) : !aie.objectfifo<memref<32x32xbf16>>  
    aie.objectfifo @of_3_distribute_1_3(%mem_tile_1_1 dimensionsToStream [<size = 4, stride = 256>, <size = 4, stride = 8>, <size = 8, stride = 32>, <size = 8, stride = 1>], {%tile_1_5, %tile_3_5}, [2 : i32, 2 : i32, 2 : i32]) : !aie.objectfifo<memref<32x32xbf16>>  
    aie.objectfifo.link [@of_0_mem_1] -> [@of_3_distribute_1_0, @of_3_distribute_1_1, @of_3_distribute_1_2, @of_3_distribute_1_3]([] [0, 1024, 2048, 3072])
    aie.objectfifo @of_4_broadcast_0_0(%mem_tile_2_1 dimensionsToStream [<size = 4, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%tile_0_2, %tile_0_3, %tile_0_4, %tile_0_5}, [2 : i32, 2 : i32, 2 : i32, 2 : i32, 2 : i32]) : !aie.objectfifo<memref<32x64xbf16>>  
    aie.objectfifo.link [@of_1_mem_0] -> [@of_4_broadcast_0_0]([] [])
    aie.objectfifo @of_4_broadcast_1_0(%mem_tile_3_1 dimensionsToStream [<size = 4, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%tile_1_2, %tile_1_3, %tile_1_4, %tile_1_5}, [2 : i32, 2 : i32, 2 : i32, 2 : i32, 2 : i32]) : !aie.objectfifo<memref<32x64xbf16>>  
    aie.objectfifo.link [@of_1_mem_1] -> [@of_4_broadcast_1_0]([] [])
    aie.objectfifo @of_5_broadcast_0_0(%mem_tile_5_1 dimensionsToStream [<size = 4, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%tile_2_2, %tile_2_3, %tile_2_4, %tile_2_5}, [2 : i32, 2 : i32, 2 : i32, 2 : i32, 2 : i32]) : !aie.objectfifo<memref<32x64xbf16>>  
    aie.objectfifo.link [@of_2_mem_0] -> [@of_5_broadcast_0_0]([] [])
    aie.objectfifo @of_5_broadcast_1_0(%mem_tile_6_1 dimensionsToStream [<size = 4, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%tile_3_2, %tile_3_3, %tile_3_4, %tile_3_5}, [2 : i32, 2 : i32, 2 : i32, 2 : i32, 2 : i32]) : !aie.objectfifo<memref<32x64xbf16>>  
    aie.objectfifo.link [@of_2_mem_1] -> [@of_5_broadcast_1_0]([] [])
    aie.objectfifo @of_6_switch_join_0_0(%tile_0_2, {%tile_4_2}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<32x64xbf16>>  
    aie.objectfifo @of_6_switch_join_0_1(%tile_1_2, {%tile_4_2}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<32x64xbf16>>  
    aie.objectfifo @of_6_switch_join_1_0(%tile_0_3, {%tile_4_3}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<32x64xbf16>>  
    aie.objectfifo @of_6_switch_join_1_1(%tile_1_3, {%tile_4_3}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<32x64xbf16>>  
    aie.objectfifo @of_6_switch_join_2_0(%tile_0_4, {%tile_4_4}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<32x64xbf16>>  
    aie.objectfifo @of_6_switch_join_2_1(%tile_1_4, {%tile_4_4}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<32x64xbf16>>  
    aie.objectfifo @of_6_switch_join_3_0(%tile_0_5, {%tile_4_5}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<32x64xbf16>>  
    aie.objectfifo @of_6_switch_join_3_1(%tile_1_5, {%tile_4_5}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<32x64xbf16>>  
    aie.objectfifo @of_7_switch_join_0_0(%tile_2_2, {%tile_5_2}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<32x64xbf16>>  
    aie.objectfifo @of_7_switch_join_0_1(%tile_3_2, {%tile_5_2}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<32x64xbf16>>  
    aie.objectfifo @of_7_switch_join_1_0(%tile_2_3, {%tile_5_3}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<32x64xbf16>>  
    aie.objectfifo @of_7_switch_join_1_1(%tile_3_3, {%tile_5_3}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<32x64xbf16>>  
    aie.objectfifo @of_7_switch_join_2_0(%tile_2_4, {%tile_5_4}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<32x64xbf16>>  
    aie.objectfifo @of_7_switch_join_2_1(%tile_3_4, {%tile_5_4}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<32x64xbf16>>  
    aie.objectfifo @of_7_switch_join_3_0(%tile_2_5, {%tile_5_5}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<32x64xbf16>>  
    aie.objectfifo @of_7_switch_join_3_1(%tile_3_5, {%tile_5_5}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<32x64xbf16>>  
    aie.objectfifo @of_8_unicast_0(%tile_4_2, {%tile_5_2}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<32x64xbf16>>  
    aie.objectfifo @of_8_unicast_1(%tile_4_3, {%tile_5_3}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<32x64xbf16>>  
    aie.objectfifo @of_8_unicast_2(%tile_4_4, {%tile_5_4}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<32x64xbf16>>  
    aie.objectfifo @of_8_unicast_3(%tile_4_5, {%tile_5_5}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<32x64xbf16>>  
    aie.objectfifo @of_9_join_0_0(%tile_5_2, {%mem_tile_3_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<32x64xbf16>>  
    aie.objectfifo @of_9_join_0_1(%tile_5_3, {%mem_tile_3_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<32x64xbf16>>  
    aie.objectfifo @of_9_join_0_2(%tile_5_4, {%mem_tile_3_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<32x64xbf16>>  
    aie.objectfifo @of_9_join_0_3(%tile_5_5, {%mem_tile_3_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<32x64xbf16>>  
    aie.objectfifo @of_10_mem(%mem_tile_3_1 dimensionsToStream [<size = 4, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%shim_noc_tile_3_0}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<4x32x64xbf16>>  
    aie.objectfifo.link [@of_9_join_0_0, @of_9_join_0_1, @of_9_join_0_2, @of_9_join_0_3] -> [@of_10_mem]([0, 2048, 4096, 6144] [])
    func.func private @op0_zero_bf16_32_32_64(memref<32x64xbf16>)
    func.func private @op0_matmul_bf16_bf16_32_32_64(memref<32x32xbf16>, memref<32x64xbf16>, memref<32x64xbf16>)
    func.func private @op0_silu_bf16(memref<32x64xbf16>, memref<32x64xbf16>, i32)
    func.func private @op0_eltwise_mul_bf16_vector(memref<32x64xbf16>, memref<32x64xbf16>, memref<32x64xbf16>, i32)
  }
}
