module {
  aie.device(npu2) {
    %shim_noc_tile_2_0 = aie.tile(2, 0)
    %shim_noc_tile_3_0 = aie.tile(3, 0)
    %shim_noc_tile_4_0 = aie.tile(4, 0)
    %shim_noc_tile_5_0 = aie.tile(5, 0)
    %shim_noc_tile_6_0 = aie.tile(6, 0)
    %shim_noc_tile_7_0 = aie.tile(7, 0)
    %mem_tile_5_1 = aie.tile(5, 1)
    %mem_tile_7_1 = aie.tile(7, 1)
    %mem_tile_3_1 = aie.tile(3, 1)
    %mem_tile_6_1 = aie.tile(6, 1)
    %tile_6_2 = aie.tile(6, 2)
    %tile_6_3 = aie.tile(6, 3)
    %tile_6_4 = aie.tile(6, 4)
    %tile_6_5 = aie.tile(6, 5)
    %tile_7_2 = aie.tile(7, 2)
    %tile_7_3 = aie.tile(7, 3)
    %tile_7_4 = aie.tile(7, 4)
    %tile_7_5 = aie.tile(7, 5)
    %mem_tile_2_1 = aie.tile(2, 1)
    %mem_tile_4_1 = aie.tile(4, 1)
    aie.runtime_sequence(%arg0: memref<256x14336xbf16>, %arg1: memref<14336x4096xbf16>, %arg2: memref<256x4096xbf16>) {
      %0 = aiex.dma_configure_task_for @of_0_mem_0 {
        aie.dma_bd(%arg0 : memref<256x14336xbf16> offset = 0 len = 1835008 sizes = [32, 224, 128, 64] strides = [0, 64, 14336, 1])
        aie.end
      } {issue_token = true, iteration_t = 0 : index, repeat_count = 31 : i32}
      aiex.dma_start_task(%0)
      %1 = aiex.dma_configure_task_for @of_0_mem_1 {
        aie.dma_bd(%arg0 : memref<256x14336xbf16> offset = 0 len = 1835008 sizes = [32, 224, 128, 64] strides = [0, 64, 14336, 1])
        aie.end
      } {issue_token = true, iteration_t = 0 : index, repeat_count = 31 : i32}
      aiex.dma_start_task(%1)
      %2 = aiex.dma_configure_task_for @of_1_mem_0 {
        aie.dma_bd(%arg1 : memref<14336x4096xbf16> offset = 0 len = 458752 sizes = [32, 112, 128, 32] strides = [64, 524288, 4096, 1])
        aie.end
      } {issue_token = true, iteration_t = 0 : index, repeat_count = 31 : i32}
      aiex.dma_start_task(%2)
      %3 = aiex.dma_configure_task_for @of_1_mem_1 {
        aie.dma_bd(%arg1 : memref<14336x4096xbf16> offset = 32 len = 458752 sizes = [32, 112, 128, 32] strides = [64, 524288, 4096, 1])
        aie.end
      } {issue_token = true, iteration_t = 0 : index, repeat_count = 31 : i32}
      aiex.dma_start_task(%3)
      %4 = aiex.dma_configure_task_for @of_5_mem_0 {
        aie.dma_bd(%arg2 : memref<256x4096xbf16> offset = 0 len = 262144 sizes = [2, 64, 128, 32] strides = [524288, 64, 4096, 1])
        aie.end
      } {issue_token = true, iteration_t = 0 : index, repeat_count = 1 : i32}
      aiex.dma_start_task(%4)
      %5 = aiex.dma_configure_task_for @of_5_mem_1 {
        aie.dma_bd(%arg2 : memref<256x4096xbf16> offset = 32 len = 262144 sizes = [2, 64, 128, 32] strides = [524288, 64, 4096, 1])
        aie.end
      } {issue_token = true, iteration_t = 0 : index, repeat_count = 1 : i32}
      aiex.dma_start_task(%5)
      %6 = aiex.dma_configure_task_for @of_0_mem_0 {
        aie.dma_bd(%arg0 : memref<256x14336xbf16> offset = 0 len = 1835008 sizes = [32, 224, 128, 64] strides = [0, 64, 14336, 1])
        aie.end
      } {issue_token = true, iteration_t = 57344 : index, repeat_count = 31 : i32}
      aiex.dma_start_task(%6)
      %7 = aiex.dma_configure_task_for @of_0_mem_1 {
        aie.dma_bd(%arg0 : memref<256x14336xbf16> offset = 0 len = 1835008 sizes = [32, 224, 128, 64] strides = [0, 64, 14336, 1])
        aie.end
      } {issue_token = true, iteration_t = 57344 : index, repeat_count = 31 : i32}
      aiex.dma_start_task(%7)
      %8 = aiex.dma_configure_task_for @of_1_mem_0 {
        aie.dma_bd(%arg1 : memref<14336x4096xbf16> offset = 2048 len = 458752 sizes = [32, 112, 128, 32] strides = [64, 524288, 4096, 1])
        aie.end
      } {issue_token = true, iteration_t = 57344 : index, repeat_count = 31 : i32}
      aiex.dma_start_task(%8)
      %9 = aiex.dma_configure_task_for @of_1_mem_1 {
        aie.dma_bd(%arg1 : memref<14336x4096xbf16> offset = 2080 len = 458752 sizes = [32, 112, 128, 32] strides = [64, 524288, 4096, 1])
        aie.end
      } {issue_token = true, iteration_t = 57344 : index, repeat_count = 31 : i32}
      aiex.dma_start_task(%9)
      aiex.dma_await_task(%0)
      %10 = aiex.dma_configure_task_for @of_0_mem_0 {
        aie.dma_bd(%arg0 : memref<256x14336xbf16> offset = 1835008 len = 1835008 sizes = [32, 224, 128, 64] strides = [0, 64, 14336, 1])
        aie.end
      } {issue_token = true, iteration_t = 114688 : index, repeat_count = 31 : i32}
      aiex.dma_start_task(%10)
      aiex.dma_await_task(%1)
      %11 = aiex.dma_configure_task_for @of_0_mem_1 {
        aie.dma_bd(%arg0 : memref<256x14336xbf16> offset = 1835008 len = 1835008 sizes = [32, 224, 128, 64] strides = [0, 64, 14336, 1])
        aie.end
      } {issue_token = true, iteration_t = 114688 : index, repeat_count = 31 : i32}
      aiex.dma_start_task(%11)
      aiex.dma_await_task(%2)
      %12 = aiex.dma_configure_task_for @of_1_mem_0 {
        aie.dma_bd(%arg1 : memref<14336x4096xbf16> offset = 0 len = 458752 sizes = [32, 112, 128, 32] strides = [64, 524288, 4096, 1])
        aie.end
      } {issue_token = true, iteration_t = 114688 : index, repeat_count = 31 : i32}
      aiex.dma_start_task(%12)
      aiex.dma_await_task(%3)
      %13 = aiex.dma_configure_task_for @of_1_mem_1 {
        aie.dma_bd(%arg1 : memref<14336x4096xbf16> offset = 32 len = 458752 sizes = [32, 112, 128, 32] strides = [64, 524288, 4096, 1])
        aie.end
      } {issue_token = true, iteration_t = 114688 : index, repeat_count = 31 : i32}
      aiex.dma_start_task(%13)
      aiex.dma_await_task(%6)
      %14 = aiex.dma_configure_task_for @of_0_mem_0 {
        aie.dma_bd(%arg0 : memref<256x14336xbf16> offset = 1835008 len = 1835008 sizes = [32, 224, 128, 64] strides = [0, 64, 14336, 1])
        aie.end
      } {issue_token = true, iteration_t = 172032 : index, repeat_count = 31 : i32}
      aiex.dma_start_task(%14)
      aiex.dma_await_task(%7)
      %15 = aiex.dma_configure_task_for @of_0_mem_1 {
        aie.dma_bd(%arg0 : memref<256x14336xbf16> offset = 1835008 len = 1835008 sizes = [32, 224, 128, 64] strides = [0, 64, 14336, 1])
        aie.end
      } {issue_token = true, iteration_t = 172032 : index, repeat_count = 31 : i32}
      aiex.dma_start_task(%15)
      aiex.dma_await_task(%8)
      %16 = aiex.dma_configure_task_for @of_1_mem_0 {
        aie.dma_bd(%arg1 : memref<14336x4096xbf16> offset = 2048 len = 458752 sizes = [32, 112, 128, 32] strides = [64, 524288, 4096, 1])
        aie.end
      } {issue_token = true, iteration_t = 172032 : index, repeat_count = 31 : i32}
      aiex.dma_start_task(%16)
      aiex.dma_await_task(%9)
      %17 = aiex.dma_configure_task_for @of_1_mem_1 {
        aie.dma_bd(%arg1 : memref<14336x4096xbf16> offset = 2080 len = 458752 sizes = [32, 112, 128, 32] strides = [64, 524288, 4096, 1])
        aie.end
      } {issue_token = true, iteration_t = 172032 : index, repeat_count = 31 : i32}
      aiex.dma_start_task(%17)
      aiex.dma_await_task(%10)
      aiex.dma_await_task(%14)
      aiex.dma_await_task(%11)
      aiex.dma_await_task(%15)
      aiex.dma_await_task(%12)
      aiex.dma_await_task(%16)
      aiex.dma_await_task(%13)
      aiex.dma_await_task(%17)
      aiex.dma_await_task(%4)
      aiex.dma_await_task(%5)
    }
    %core_6_2 = aie.core(%tile_6_2) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c2 = arith.constant 2 : index
        scf.for %arg1 = %c0_0 to %c2 step %c1_1 {
          %c64 = arith.constant 64 : index
          scf.for %arg2 = %c0_0 to %c64 step %c1_1 {
            %0 = aie.objectfifo.acquire @of_4_join_0_0(Produce, 1) : !aie.objectfifosubview<memref<32x32xbf16>>
            %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<32x32xbf16>> -> memref<32x32xbf16>
            func.call @op1_zero_bf16_32_64_32(%1) : (memref<32x32xbf16>) -> ()
            %c224 = arith.constant 224 : index
            scf.for %arg3 = %c0_0 to %c224 step %c1_1 {
              %2 = aie.objectfifo.acquire @of_3_broadcast_0_0(Consume, 1) : !aie.objectfifosubview<memref<64x32xbf16>>
              %3 = aie.objectfifo.subview.access %2[0] : !aie.objectfifosubview<memref<64x32xbf16>> -> memref<64x32xbf16>
              %4 = aie.objectfifo.acquire @of_2_distribute_0_0(Consume, 1) : !aie.objectfifosubview<memref<32x64xbf16>>
              %5 = aie.objectfifo.subview.access %4[0] : !aie.objectfifosubview<memref<32x64xbf16>> -> memref<32x64xbf16>
              func.call @op1_matmul_bf16_bf16_32_64_32(%5, %3, %1) : (memref<32x64xbf16>, memref<64x32xbf16>, memref<32x32xbf16>) -> ()
              aie.objectfifo.release @of_2_distribute_0_0(Consume, 1)
              aie.objectfifo.release @of_3_broadcast_0_0(Consume, 1)
            }
            aie.objectfifo.release @of_4_join_0_0(Produce, 1)
          }
        }
      }
      aie.end
    } {link_with = "op1_mm_32_64_32.o"}
    %core_6_3 = aie.core(%tile_6_3) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c2 = arith.constant 2 : index
        scf.for %arg1 = %c0_0 to %c2 step %c1_1 {
          %c64 = arith.constant 64 : index
          scf.for %arg2 = %c0_0 to %c64 step %c1_1 {
            %0 = aie.objectfifo.acquire @of_4_join_0_1(Produce, 1) : !aie.objectfifosubview<memref<32x32xbf16>>
            %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<32x32xbf16>> -> memref<32x32xbf16>
            func.call @op1_zero_bf16_32_64_32(%1) : (memref<32x32xbf16>) -> ()
            %c224 = arith.constant 224 : index
            scf.for %arg3 = %c0_0 to %c224 step %c1_1 {
              %2 = aie.objectfifo.acquire @of_3_broadcast_0_0(Consume, 1) : !aie.objectfifosubview<memref<64x32xbf16>>
              %3 = aie.objectfifo.subview.access %2[0] : !aie.objectfifosubview<memref<64x32xbf16>> -> memref<64x32xbf16>
              %4 = aie.objectfifo.acquire @of_2_distribute_0_1(Consume, 1) : !aie.objectfifosubview<memref<32x64xbf16>>
              %5 = aie.objectfifo.subview.access %4[0] : !aie.objectfifosubview<memref<32x64xbf16>> -> memref<32x64xbf16>
              func.call @op1_matmul_bf16_bf16_32_64_32(%5, %3, %1) : (memref<32x64xbf16>, memref<64x32xbf16>, memref<32x32xbf16>) -> ()
              aie.objectfifo.release @of_2_distribute_0_1(Consume, 1)
              aie.objectfifo.release @of_3_broadcast_0_0(Consume, 1)
            }
            aie.objectfifo.release @of_4_join_0_1(Produce, 1)
          }
        }
      }
      aie.end
    } {link_with = "op1_mm_32_64_32.o"}
    %core_6_4 = aie.core(%tile_6_4) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c2 = arith.constant 2 : index
        scf.for %arg1 = %c0_0 to %c2 step %c1_1 {
          %c64 = arith.constant 64 : index
          scf.for %arg2 = %c0_0 to %c64 step %c1_1 {
            %0 = aie.objectfifo.acquire @of_4_join_0_2(Produce, 1) : !aie.objectfifosubview<memref<32x32xbf16>>
            %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<32x32xbf16>> -> memref<32x32xbf16>
            func.call @op1_zero_bf16_32_64_32(%1) : (memref<32x32xbf16>) -> ()
            %c224 = arith.constant 224 : index
            scf.for %arg3 = %c0_0 to %c224 step %c1_1 {
              %2 = aie.objectfifo.acquire @of_3_broadcast_0_0(Consume, 1) : !aie.objectfifosubview<memref<64x32xbf16>>
              %3 = aie.objectfifo.subview.access %2[0] : !aie.objectfifosubview<memref<64x32xbf16>> -> memref<64x32xbf16>
              %4 = aie.objectfifo.acquire @of_2_distribute_0_2(Consume, 1) : !aie.objectfifosubview<memref<32x64xbf16>>
              %5 = aie.objectfifo.subview.access %4[0] : !aie.objectfifosubview<memref<32x64xbf16>> -> memref<32x64xbf16>
              func.call @op1_matmul_bf16_bf16_32_64_32(%5, %3, %1) : (memref<32x64xbf16>, memref<64x32xbf16>, memref<32x32xbf16>) -> ()
              aie.objectfifo.release @of_2_distribute_0_2(Consume, 1)
              aie.objectfifo.release @of_3_broadcast_0_0(Consume, 1)
            }
            aie.objectfifo.release @of_4_join_0_2(Produce, 1)
          }
        }
      }
      aie.end
    } {link_with = "op1_mm_32_64_32.o"}
    %core_6_5 = aie.core(%tile_6_5) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c2 = arith.constant 2 : index
        scf.for %arg1 = %c0_0 to %c2 step %c1_1 {
          %c64 = arith.constant 64 : index
          scf.for %arg2 = %c0_0 to %c64 step %c1_1 {
            %0 = aie.objectfifo.acquire @of_4_join_0_3(Produce, 1) : !aie.objectfifosubview<memref<32x32xbf16>>
            %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<32x32xbf16>> -> memref<32x32xbf16>
            func.call @op1_zero_bf16_32_64_32(%1) : (memref<32x32xbf16>) -> ()
            %c224 = arith.constant 224 : index
            scf.for %arg3 = %c0_0 to %c224 step %c1_1 {
              %2 = aie.objectfifo.acquire @of_3_broadcast_0_0(Consume, 1) : !aie.objectfifosubview<memref<64x32xbf16>>
              %3 = aie.objectfifo.subview.access %2[0] : !aie.objectfifosubview<memref<64x32xbf16>> -> memref<64x32xbf16>
              %4 = aie.objectfifo.acquire @of_2_distribute_0_3(Consume, 1) : !aie.objectfifosubview<memref<32x64xbf16>>
              %5 = aie.objectfifo.subview.access %4[0] : !aie.objectfifosubview<memref<32x64xbf16>> -> memref<32x64xbf16>
              func.call @op1_matmul_bf16_bf16_32_64_32(%5, %3, %1) : (memref<32x64xbf16>, memref<64x32xbf16>, memref<32x32xbf16>) -> ()
              aie.objectfifo.release @of_2_distribute_0_3(Consume, 1)
              aie.objectfifo.release @of_3_broadcast_0_0(Consume, 1)
            }
            aie.objectfifo.release @of_4_join_0_3(Produce, 1)
          }
        }
      }
      aie.end
    } {link_with = "op1_mm_32_64_32.o"}
    %core_7_2 = aie.core(%tile_7_2) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c2 = arith.constant 2 : index
        scf.for %arg1 = %c0_0 to %c2 step %c1_1 {
          %c64 = arith.constant 64 : index
          scf.for %arg2 = %c0_0 to %c64 step %c1_1 {
            %0 = aie.objectfifo.acquire @of_4_join_1_0(Produce, 1) : !aie.objectfifosubview<memref<32x32xbf16>>
            %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<32x32xbf16>> -> memref<32x32xbf16>
            func.call @op1_zero_bf16_32_64_32(%1) : (memref<32x32xbf16>) -> ()
            %c224 = arith.constant 224 : index
            scf.for %arg3 = %c0_0 to %c224 step %c1_1 {
              %2 = aie.objectfifo.acquire @of_3_broadcast_1_0(Consume, 1) : !aie.objectfifosubview<memref<64x32xbf16>>
              %3 = aie.objectfifo.subview.access %2[0] : !aie.objectfifosubview<memref<64x32xbf16>> -> memref<64x32xbf16>
              %4 = aie.objectfifo.acquire @of_2_distribute_1_0(Consume, 1) : !aie.objectfifosubview<memref<32x64xbf16>>
              %5 = aie.objectfifo.subview.access %4[0] : !aie.objectfifosubview<memref<32x64xbf16>> -> memref<32x64xbf16>
              func.call @op1_matmul_bf16_bf16_32_64_32(%5, %3, %1) : (memref<32x64xbf16>, memref<64x32xbf16>, memref<32x32xbf16>) -> ()
              aie.objectfifo.release @of_2_distribute_1_0(Consume, 1)
              aie.objectfifo.release @of_3_broadcast_1_0(Consume, 1)
            }
            aie.objectfifo.release @of_4_join_1_0(Produce, 1)
          }
        }
      }
      aie.end
    } {link_with = "op1_mm_32_64_32.o"}
    %core_7_3 = aie.core(%tile_7_3) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c2 = arith.constant 2 : index
        scf.for %arg1 = %c0_0 to %c2 step %c1_1 {
          %c64 = arith.constant 64 : index
          scf.for %arg2 = %c0_0 to %c64 step %c1_1 {
            %0 = aie.objectfifo.acquire @of_4_join_1_1(Produce, 1) : !aie.objectfifosubview<memref<32x32xbf16>>
            %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<32x32xbf16>> -> memref<32x32xbf16>
            func.call @op1_zero_bf16_32_64_32(%1) : (memref<32x32xbf16>) -> ()
            %c224 = arith.constant 224 : index
            scf.for %arg3 = %c0_0 to %c224 step %c1_1 {
              %2 = aie.objectfifo.acquire @of_3_broadcast_1_0(Consume, 1) : !aie.objectfifosubview<memref<64x32xbf16>>
              %3 = aie.objectfifo.subview.access %2[0] : !aie.objectfifosubview<memref<64x32xbf16>> -> memref<64x32xbf16>
              %4 = aie.objectfifo.acquire @of_2_distribute_1_1(Consume, 1) : !aie.objectfifosubview<memref<32x64xbf16>>
              %5 = aie.objectfifo.subview.access %4[0] : !aie.objectfifosubview<memref<32x64xbf16>> -> memref<32x64xbf16>
              func.call @op1_matmul_bf16_bf16_32_64_32(%5, %3, %1) : (memref<32x64xbf16>, memref<64x32xbf16>, memref<32x32xbf16>) -> ()
              aie.objectfifo.release @of_2_distribute_1_1(Consume, 1)
              aie.objectfifo.release @of_3_broadcast_1_0(Consume, 1)
            }
            aie.objectfifo.release @of_4_join_1_1(Produce, 1)
          }
        }
      }
      aie.end
    } {link_with = "op1_mm_32_64_32.o"}
    %core_7_4 = aie.core(%tile_7_4) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c2 = arith.constant 2 : index
        scf.for %arg1 = %c0_0 to %c2 step %c1_1 {
          %c64 = arith.constant 64 : index
          scf.for %arg2 = %c0_0 to %c64 step %c1_1 {
            %0 = aie.objectfifo.acquire @of_4_join_1_2(Produce, 1) : !aie.objectfifosubview<memref<32x32xbf16>>
            %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<32x32xbf16>> -> memref<32x32xbf16>
            func.call @op1_zero_bf16_32_64_32(%1) : (memref<32x32xbf16>) -> ()
            %c224 = arith.constant 224 : index
            scf.for %arg3 = %c0_0 to %c224 step %c1_1 {
              %2 = aie.objectfifo.acquire @of_3_broadcast_1_0(Consume, 1) : !aie.objectfifosubview<memref<64x32xbf16>>
              %3 = aie.objectfifo.subview.access %2[0] : !aie.objectfifosubview<memref<64x32xbf16>> -> memref<64x32xbf16>
              %4 = aie.objectfifo.acquire @of_2_distribute_1_2(Consume, 1) : !aie.objectfifosubview<memref<32x64xbf16>>
              %5 = aie.objectfifo.subview.access %4[0] : !aie.objectfifosubview<memref<32x64xbf16>> -> memref<32x64xbf16>
              func.call @op1_matmul_bf16_bf16_32_64_32(%5, %3, %1) : (memref<32x64xbf16>, memref<64x32xbf16>, memref<32x32xbf16>) -> ()
              aie.objectfifo.release @of_2_distribute_1_2(Consume, 1)
              aie.objectfifo.release @of_3_broadcast_1_0(Consume, 1)
            }
            aie.objectfifo.release @of_4_join_1_2(Produce, 1)
          }
        }
      }
      aie.end
    } {link_with = "op1_mm_32_64_32.o"}
    %core_7_5 = aie.core(%tile_7_5) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c2 = arith.constant 2 : index
        scf.for %arg1 = %c0_0 to %c2 step %c1_1 {
          %c64 = arith.constant 64 : index
          scf.for %arg2 = %c0_0 to %c64 step %c1_1 {
            %0 = aie.objectfifo.acquire @of_4_join_1_3(Produce, 1) : !aie.objectfifosubview<memref<32x32xbf16>>
            %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<32x32xbf16>> -> memref<32x32xbf16>
            func.call @op1_zero_bf16_32_64_32(%1) : (memref<32x32xbf16>) -> ()
            %c224 = arith.constant 224 : index
            scf.for %arg3 = %c0_0 to %c224 step %c1_1 {
              %2 = aie.objectfifo.acquire @of_3_broadcast_1_0(Consume, 1) : !aie.objectfifosubview<memref<64x32xbf16>>
              %3 = aie.objectfifo.subview.access %2[0] : !aie.objectfifosubview<memref<64x32xbf16>> -> memref<64x32xbf16>
              %4 = aie.objectfifo.acquire @of_2_distribute_1_3(Consume, 1) : !aie.objectfifosubview<memref<32x64xbf16>>
              %5 = aie.objectfifo.subview.access %4[0] : !aie.objectfifosubview<memref<32x64xbf16>> -> memref<32x64xbf16>
              func.call @op1_matmul_bf16_bf16_32_64_32(%5, %3, %1) : (memref<32x64xbf16>, memref<64x32xbf16>, memref<32x32xbf16>) -> ()
              aie.objectfifo.release @of_2_distribute_1_3(Consume, 1)
              aie.objectfifo.release @of_3_broadcast_1_0(Consume, 1)
            }
            aie.objectfifo.release @of_4_join_1_3(Produce, 1)
          }
        }
      }
      aie.end
    } {link_with = "op1_mm_32_64_32.o"}
    aie.objectfifo @of_0_mem_0(%shim_noc_tile_5_0, {%mem_tile_5_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<4x32x64xbf16>>  
    aie.objectfifo @of_0_mem_1(%shim_noc_tile_7_0, {%mem_tile_7_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<4x32x64xbf16>>  
    aie.objectfifo @of_1_mem_0(%shim_noc_tile_3_0, {%mem_tile_3_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x32xbf16>>  
    aie.objectfifo @of_1_mem_1(%shim_noc_tile_6_0, {%mem_tile_6_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x32xbf16>>  
    aie.objectfifo @of_2_distribute_0_0(%mem_tile_5_1 dimensionsToStream [<size = 4, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%tile_6_2}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<32x64xbf16>>  
    aie.objectfifo @of_2_distribute_0_1(%mem_tile_5_1 dimensionsToStream [<size = 4, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%tile_6_3}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<32x64xbf16>>  
    aie.objectfifo @of_2_distribute_0_2(%mem_tile_5_1 dimensionsToStream [<size = 4, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%tile_6_4}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<32x64xbf16>>  
    aie.objectfifo @of_2_distribute_0_3(%mem_tile_5_1 dimensionsToStream [<size = 4, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%tile_6_5}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<32x64xbf16>>  
    aie.objectfifo.link [@of_0_mem_0] -> [@of_2_distribute_0_0, @of_2_distribute_0_1, @of_2_distribute_0_2, @of_2_distribute_0_3]([] [0, 2048, 4096, 6144])
    aie.objectfifo @of_2_distribute_1_0(%mem_tile_7_1 dimensionsToStream [<size = 4, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%tile_7_2}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<32x64xbf16>>  
    aie.objectfifo @of_2_distribute_1_1(%mem_tile_7_1 dimensionsToStream [<size = 4, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%tile_7_3}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<32x64xbf16>>  
    aie.objectfifo @of_2_distribute_1_2(%mem_tile_7_1 dimensionsToStream [<size = 4, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%tile_7_4}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<32x64xbf16>>  
    aie.objectfifo @of_2_distribute_1_3(%mem_tile_7_1 dimensionsToStream [<size = 4, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%tile_7_5}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<32x64xbf16>>  
    aie.objectfifo.link [@of_0_mem_1] -> [@of_2_distribute_1_0, @of_2_distribute_1_1, @of_2_distribute_1_2, @of_2_distribute_1_3]([] [0, 2048, 4096, 6144])
    aie.objectfifo @of_3_broadcast_0_0(%mem_tile_3_1 dimensionsToStream [<size = 8, stride = 256>, <size = 4, stride = 8>, <size = 8, stride = 32>, <size = 8, stride = 1>], {%tile_6_2, %tile_6_3, %tile_6_4, %tile_6_5}, [2 : i32, 2 : i32, 2 : i32, 2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x32xbf16>>  
    aie.objectfifo.link [@of_1_mem_0] -> [@of_3_broadcast_0_0]([] [])
    aie.objectfifo @of_3_broadcast_1_0(%mem_tile_6_1 dimensionsToStream [<size = 8, stride = 256>, <size = 4, stride = 8>, <size = 8, stride = 32>, <size = 8, stride = 1>], {%tile_7_2, %tile_7_3, %tile_7_4, %tile_7_5}, [2 : i32, 2 : i32, 2 : i32, 2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x32xbf16>>  
    aie.objectfifo.link [@of_1_mem_1] -> [@of_3_broadcast_1_0]([] [])
    aie.objectfifo @of_4_join_0_0(%tile_6_2, {%mem_tile_2_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<32x32xbf16>>  
    aie.objectfifo @of_4_join_0_1(%tile_6_3, {%mem_tile_2_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<32x32xbf16>>  
    aie.objectfifo @of_4_join_0_2(%tile_6_4, {%mem_tile_2_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<32x32xbf16>>  
    aie.objectfifo @of_4_join_0_3(%tile_6_5, {%mem_tile_2_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<32x32xbf16>>  
    aie.objectfifo @of_4_join_1_0(%tile_7_2, {%mem_tile_4_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<32x32xbf16>>  
    aie.objectfifo @of_4_join_1_1(%tile_7_3, {%mem_tile_4_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<32x32xbf16>>  
    aie.objectfifo @of_4_join_1_2(%tile_7_4, {%mem_tile_4_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<32x32xbf16>>  
    aie.objectfifo @of_4_join_1_3(%tile_7_5, {%mem_tile_4_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<32x32xbf16>>  
    aie.objectfifo @of_5_mem_0(%mem_tile_2_1 dimensionsToStream [<size = 4, stride = 256>, <size = 8, stride = 8>, <size = 4, stride = 64>, <size = 8, stride = 1>], {%shim_noc_tile_2_0}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<4x32x32xbf16>>  
    aie.objectfifo.link [@of_4_join_0_0, @of_4_join_0_1, @of_4_join_0_2, @of_4_join_0_3] -> [@of_5_mem_0]([0, 1024, 2048, 3072] [])
    aie.objectfifo @of_5_mem_1(%mem_tile_4_1 dimensionsToStream [<size = 4, stride = 256>, <size = 8, stride = 8>, <size = 4, stride = 64>, <size = 8, stride = 1>], {%shim_noc_tile_4_0}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<4x32x32xbf16>>  
    aie.objectfifo.link [@of_4_join_1_0, @of_4_join_1_1, @of_4_join_1_2, @of_4_join_1_3] -> [@of_5_mem_1]([0, 1024, 2048, 3072] [])
    func.func private @op1_zero_bf16_32_64_32(memref<32x32xbf16>)
    func.func private @op1_matmul_bf16_bf16_32_64_32(memref<32x64xbf16>, memref<64x32xbf16>, memref<32x32xbf16>)
  }
}
