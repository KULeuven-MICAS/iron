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
    aie.runtime_sequence(%arg0: memref<256x8192xbf16>, %arg1: memref<256x8192xbf16>) {
      %0 = aiex.dma_configure_task_for @of_0_mem_0 {
        aie.dma_bd(%arg0 : memref<256x8192xbf16> offset = 0 len = 262144 sizes = [1, 32, 64, 128] strides = [0, 65536, 128, 1])
        aie.end
      } {issue_token = true, iteration_t = 0 : index}
      aiex.dma_start_task(%0)
      %1 = aiex.dma_configure_task_for @of_0_mem_1 {
        aie.dma_bd(%arg0 : memref<256x8192xbf16> offset = 8192 len = 262144 sizes = [1, 32, 64, 128] strides = [0, 65536, 128, 1])
        aie.end
      } {issue_token = true, iteration_t = 0 : index}
      aiex.dma_start_task(%1)
      %2 = aiex.dma_configure_task_for @of_0_mem_2 {
        aie.dma_bd(%arg0 : memref<256x8192xbf16> offset = 16384 len = 262144 sizes = [1, 32, 64, 128] strides = [0, 65536, 128, 1])
        aie.end
      } {issue_token = true, iteration_t = 0 : index}
      aiex.dma_start_task(%2)
      %3 = aiex.dma_configure_task_for @of_0_mem_3 {
        aie.dma_bd(%arg0 : memref<256x8192xbf16> offset = 24576 len = 262144 sizes = [1, 32, 64, 128] strides = [0, 65536, 128, 1])
        aie.end
      } {issue_token = true, iteration_t = 0 : index}
      aiex.dma_start_task(%3)
      %4 = aiex.dma_configure_task_for @of_0_mem_4 {
        aie.dma_bd(%arg0 : memref<256x8192xbf16> offset = 32768 len = 262144 sizes = [1, 32, 64, 128] strides = [0, 65536, 128, 1])
        aie.end
      } {issue_token = true, iteration_t = 0 : index}
      aiex.dma_start_task(%4)
      %5 = aiex.dma_configure_task_for @of_0_mem_5 {
        aie.dma_bd(%arg0 : memref<256x8192xbf16> offset = 40960 len = 262144 sizes = [1, 32, 64, 128] strides = [0, 65536, 128, 1])
        aie.end
      } {issue_token = true, iteration_t = 0 : index}
      aiex.dma_start_task(%5)
      %6 = aiex.dma_configure_task_for @of_0_mem_6 {
        aie.dma_bd(%arg0 : memref<256x8192xbf16> offset = 49152 len = 262144 sizes = [1, 32, 64, 128] strides = [0, 65536, 128, 1])
        aie.end
      } {issue_token = true, iteration_t = 0 : index}
      aiex.dma_start_task(%6)
      %7 = aiex.dma_configure_task_for @of_0_mem_7 {
        aie.dma_bd(%arg0 : memref<256x8192xbf16> offset = 57344 len = 262144 sizes = [1, 32, 64, 128] strides = [0, 65536, 128, 1])
        aie.end
      } {issue_token = true, iteration_t = 0 : index}
      aiex.dma_start_task(%7)
      %8 = aiex.dma_configure_task_for @of_3_mem_0 {
        aie.dma_bd(%arg1 : memref<256x8192xbf16> offset = 0 len = 262144 sizes = [1, 32, 64, 128] strides = [0, 65536, 128, 1])
        aie.end
      } {issue_token = true, iteration_t = 0 : index}
      aiex.dma_start_task(%8)
      %9 = aiex.dma_configure_task_for @of_3_mem_1 {
        aie.dma_bd(%arg1 : memref<256x8192xbf16> offset = 8192 len = 262144 sizes = [1, 32, 64, 128] strides = [0, 65536, 128, 1])
        aie.end
      } {issue_token = true, iteration_t = 0 : index}
      aiex.dma_start_task(%9)
      %10 = aiex.dma_configure_task_for @of_3_mem_2 {
        aie.dma_bd(%arg1 : memref<256x8192xbf16> offset = 16384 len = 262144 sizes = [1, 32, 64, 128] strides = [0, 65536, 128, 1])
        aie.end
      } {issue_token = true, iteration_t = 0 : index}
      aiex.dma_start_task(%10)
      %11 = aiex.dma_configure_task_for @of_3_mem_3 {
        aie.dma_bd(%arg1 : memref<256x8192xbf16> offset = 24576 len = 262144 sizes = [1, 32, 64, 128] strides = [0, 65536, 128, 1])
        aie.end
      } {issue_token = true, iteration_t = 0 : index}
      aiex.dma_start_task(%11)
      %12 = aiex.dma_configure_task_for @of_3_mem_4 {
        aie.dma_bd(%arg1 : memref<256x8192xbf16> offset = 32768 len = 262144 sizes = [1, 32, 64, 128] strides = [0, 65536, 128, 1])
        aie.end
      } {issue_token = true, iteration_t = 0 : index}
      aiex.dma_start_task(%12)
      %13 = aiex.dma_configure_task_for @of_3_mem_5 {
        aie.dma_bd(%arg1 : memref<256x8192xbf16> offset = 40960 len = 262144 sizes = [1, 32, 64, 128] strides = [0, 65536, 128, 1])
        aie.end
      } {issue_token = true, iteration_t = 0 : index}
      aiex.dma_start_task(%13)
      %14 = aiex.dma_configure_task_for @of_3_mem_6 {
        aie.dma_bd(%arg1 : memref<256x8192xbf16> offset = 49152 len = 262144 sizes = [1, 32, 64, 128] strides = [0, 65536, 128, 1])
        aie.end
      } {issue_token = true, iteration_t = 0 : index}
      aiex.dma_start_task(%14)
      %15 = aiex.dma_configure_task_for @of_3_mem_7 {
        aie.dma_bd(%arg1 : memref<256x8192xbf16> offset = 57344 len = 262144 sizes = [1, 32, 64, 128] strides = [0, 65536, 128, 1])
        aie.end
      } {issue_token = true, iteration_t = 0 : index}
      aiex.dma_start_task(%15)
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
    }
    %core_0_2 = aie.core(%tile_0_2) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c32 = arith.constant 32 : index
        scf.for %arg1 = %c0_0 to %c32 step %c1_1 {
          %c4 = arith.constant 4 : index
          scf.for %arg2 = %c0_0 to %c4 step %c1_1 {
            %0 = aie.objectfifo.acquire @of_2_unicast_0(Produce, 1) : !aie.objectfifosubview<memref<1x2048xbf16>>
            %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<1x2048xbf16>> -> memref<1x2048xbf16>
            %2 = aie.objectfifo.acquire @of_1_unicast_0_0(Consume, 1) : !aie.objectfifosubview<memref<1x2048xbf16>>
            %3 = aie.objectfifo.subview.access %2[0] : !aie.objectfifosubview<memref<1x2048xbf16>> -> memref<1x2048xbf16>
            %c2048_i32 = arith.constant 2048 : i32
            func.call @op1_silu_bf16(%3, %1, %c2048_i32) : (memref<1x2048xbf16>, memref<1x2048xbf16>, i32) -> ()
            aie.objectfifo.release @of_1_unicast_0_0(Consume, 1)
            aie.objectfifo.release @of_2_unicast_0(Produce, 1)
          }
        }
      }
      aie.end
    } {link_with = "op1_silu.o"}
    %core_1_2 = aie.core(%tile_1_2) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c32 = arith.constant 32 : index
        scf.for %arg1 = %c0_0 to %c32 step %c1_1 {
          %c4 = arith.constant 4 : index
          scf.for %arg2 = %c0_0 to %c4 step %c1_1 {
            %0 = aie.objectfifo.acquire @of_2_unicast_1(Produce, 1) : !aie.objectfifosubview<memref<1x2048xbf16>>
            %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<1x2048xbf16>> -> memref<1x2048xbf16>
            %2 = aie.objectfifo.acquire @of_1_unicast_1_0(Consume, 1) : !aie.objectfifosubview<memref<1x2048xbf16>>
            %3 = aie.objectfifo.subview.access %2[0] : !aie.objectfifosubview<memref<1x2048xbf16>> -> memref<1x2048xbf16>
            %c2048_i32 = arith.constant 2048 : i32
            func.call @op1_silu_bf16(%3, %1, %c2048_i32) : (memref<1x2048xbf16>, memref<1x2048xbf16>, i32) -> ()
            aie.objectfifo.release @of_1_unicast_1_0(Consume, 1)
            aie.objectfifo.release @of_2_unicast_1(Produce, 1)
          }
        }
      }
      aie.end
    } {link_with = "op1_silu.o"}
    %core_2_2 = aie.core(%tile_2_2) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c32 = arith.constant 32 : index
        scf.for %arg1 = %c0_0 to %c32 step %c1_1 {
          %c4 = arith.constant 4 : index
          scf.for %arg2 = %c0_0 to %c4 step %c1_1 {
            %0 = aie.objectfifo.acquire @of_2_unicast_2(Produce, 1) : !aie.objectfifosubview<memref<1x2048xbf16>>
            %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<1x2048xbf16>> -> memref<1x2048xbf16>
            %2 = aie.objectfifo.acquire @of_1_unicast_2_0(Consume, 1) : !aie.objectfifosubview<memref<1x2048xbf16>>
            %3 = aie.objectfifo.subview.access %2[0] : !aie.objectfifosubview<memref<1x2048xbf16>> -> memref<1x2048xbf16>
            %c2048_i32 = arith.constant 2048 : i32
            func.call @op1_silu_bf16(%3, %1, %c2048_i32) : (memref<1x2048xbf16>, memref<1x2048xbf16>, i32) -> ()
            aie.objectfifo.release @of_1_unicast_2_0(Consume, 1)
            aie.objectfifo.release @of_2_unicast_2(Produce, 1)
          }
        }
      }
      aie.end
    } {link_with = "op1_silu.o"}
    %core_3_2 = aie.core(%tile_3_2) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c32 = arith.constant 32 : index
        scf.for %arg1 = %c0_0 to %c32 step %c1_1 {
          %c4 = arith.constant 4 : index
          scf.for %arg2 = %c0_0 to %c4 step %c1_1 {
            %0 = aie.objectfifo.acquire @of_2_unicast_3(Produce, 1) : !aie.objectfifosubview<memref<1x2048xbf16>>
            %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<1x2048xbf16>> -> memref<1x2048xbf16>
            %2 = aie.objectfifo.acquire @of_1_unicast_3_0(Consume, 1) : !aie.objectfifosubview<memref<1x2048xbf16>>
            %3 = aie.objectfifo.subview.access %2[0] : !aie.objectfifosubview<memref<1x2048xbf16>> -> memref<1x2048xbf16>
            %c2048_i32 = arith.constant 2048 : i32
            func.call @op1_silu_bf16(%3, %1, %c2048_i32) : (memref<1x2048xbf16>, memref<1x2048xbf16>, i32) -> ()
            aie.objectfifo.release @of_1_unicast_3_0(Consume, 1)
            aie.objectfifo.release @of_2_unicast_3(Produce, 1)
          }
        }
      }
      aie.end
    } {link_with = "op1_silu.o"}
    %core_4_2 = aie.core(%tile_4_2) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c32 = arith.constant 32 : index
        scf.for %arg1 = %c0_0 to %c32 step %c1_1 {
          %c4 = arith.constant 4 : index
          scf.for %arg2 = %c0_0 to %c4 step %c1_1 {
            %0 = aie.objectfifo.acquire @of_2_unicast_4(Produce, 1) : !aie.objectfifosubview<memref<1x2048xbf16>>
            %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<1x2048xbf16>> -> memref<1x2048xbf16>
            %2 = aie.objectfifo.acquire @of_1_unicast_4_0(Consume, 1) : !aie.objectfifosubview<memref<1x2048xbf16>>
            %3 = aie.objectfifo.subview.access %2[0] : !aie.objectfifosubview<memref<1x2048xbf16>> -> memref<1x2048xbf16>
            %c2048_i32 = arith.constant 2048 : i32
            func.call @op1_silu_bf16(%3, %1, %c2048_i32) : (memref<1x2048xbf16>, memref<1x2048xbf16>, i32) -> ()
            aie.objectfifo.release @of_1_unicast_4_0(Consume, 1)
            aie.objectfifo.release @of_2_unicast_4(Produce, 1)
          }
        }
      }
      aie.end
    } {link_with = "op1_silu.o"}
    %core_5_2 = aie.core(%tile_5_2) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c32 = arith.constant 32 : index
        scf.for %arg1 = %c0_0 to %c32 step %c1_1 {
          %c4 = arith.constant 4 : index
          scf.for %arg2 = %c0_0 to %c4 step %c1_1 {
            %0 = aie.objectfifo.acquire @of_2_unicast_5(Produce, 1) : !aie.objectfifosubview<memref<1x2048xbf16>>
            %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<1x2048xbf16>> -> memref<1x2048xbf16>
            %2 = aie.objectfifo.acquire @of_1_unicast_5_0(Consume, 1) : !aie.objectfifosubview<memref<1x2048xbf16>>
            %3 = aie.objectfifo.subview.access %2[0] : !aie.objectfifosubview<memref<1x2048xbf16>> -> memref<1x2048xbf16>
            %c2048_i32 = arith.constant 2048 : i32
            func.call @op1_silu_bf16(%3, %1, %c2048_i32) : (memref<1x2048xbf16>, memref<1x2048xbf16>, i32) -> ()
            aie.objectfifo.release @of_1_unicast_5_0(Consume, 1)
            aie.objectfifo.release @of_2_unicast_5(Produce, 1)
          }
        }
      }
      aie.end
    } {link_with = "op1_silu.o"}
    %core_6_2 = aie.core(%tile_6_2) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c32 = arith.constant 32 : index
        scf.for %arg1 = %c0_0 to %c32 step %c1_1 {
          %c4 = arith.constant 4 : index
          scf.for %arg2 = %c0_0 to %c4 step %c1_1 {
            %0 = aie.objectfifo.acquire @of_2_unicast_6(Produce, 1) : !aie.objectfifosubview<memref<1x2048xbf16>>
            %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<1x2048xbf16>> -> memref<1x2048xbf16>
            %2 = aie.objectfifo.acquire @of_1_unicast_6_0(Consume, 1) : !aie.objectfifosubview<memref<1x2048xbf16>>
            %3 = aie.objectfifo.subview.access %2[0] : !aie.objectfifosubview<memref<1x2048xbf16>> -> memref<1x2048xbf16>
            %c2048_i32 = arith.constant 2048 : i32
            func.call @op1_silu_bf16(%3, %1, %c2048_i32) : (memref<1x2048xbf16>, memref<1x2048xbf16>, i32) -> ()
            aie.objectfifo.release @of_1_unicast_6_0(Consume, 1)
            aie.objectfifo.release @of_2_unicast_6(Produce, 1)
          }
        }
      }
      aie.end
    } {link_with = "op1_silu.o"}
    %core_7_2 = aie.core(%tile_7_2) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4294967295 = arith.constant 4294967295 : index
      scf.for %arg0 = %c0 to %c4294967295 step %c1 {
        %c0_0 = arith.constant 0 : index
        %c1_1 = arith.constant 1 : index
        %c32 = arith.constant 32 : index
        scf.for %arg1 = %c0_0 to %c32 step %c1_1 {
          %c4 = arith.constant 4 : index
          scf.for %arg2 = %c0_0 to %c4 step %c1_1 {
            %0 = aie.objectfifo.acquire @of_2_unicast_7(Produce, 1) : !aie.objectfifosubview<memref<1x2048xbf16>>
            %1 = aie.objectfifo.subview.access %0[0] : !aie.objectfifosubview<memref<1x2048xbf16>> -> memref<1x2048xbf16>
            %2 = aie.objectfifo.acquire @of_1_unicast_7_0(Consume, 1) : !aie.objectfifosubview<memref<1x2048xbf16>>
            %3 = aie.objectfifo.subview.access %2[0] : !aie.objectfifosubview<memref<1x2048xbf16>> -> memref<1x2048xbf16>
            %c2048_i32 = arith.constant 2048 : i32
            func.call @op1_silu_bf16(%3, %1, %c2048_i32) : (memref<1x2048xbf16>, memref<1x2048xbf16>, i32) -> ()
            aie.objectfifo.release @of_1_unicast_7_0(Consume, 1)
            aie.objectfifo.release @of_2_unicast_7(Produce, 1)
          }
        }
      }
      aie.end
    } {link_with = "op1_silu.o"}
    aie.objectfifo @of_0_mem_0(%shim_noc_tile_0_0, {%mem_tile_0_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<1x2048xbf16>>  
    aie.objectfifo @of_0_mem_1(%shim_noc_tile_1_0, {%mem_tile_1_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<1x2048xbf16>>  
    aie.objectfifo @of_0_mem_2(%shim_noc_tile_2_0, {%mem_tile_2_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<1x2048xbf16>>  
    aie.objectfifo @of_0_mem_3(%shim_noc_tile_3_0, {%mem_tile_3_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<1x2048xbf16>>  
    aie.objectfifo @of_0_mem_4(%shim_noc_tile_4_0, {%mem_tile_4_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<1x2048xbf16>>  
    aie.objectfifo @of_0_mem_5(%shim_noc_tile_5_0, {%mem_tile_5_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<1x2048xbf16>>  
    aie.objectfifo @of_0_mem_6(%shim_noc_tile_6_0, {%mem_tile_6_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<1x2048xbf16>>  
    aie.objectfifo @of_0_mem_7(%shim_noc_tile_7_0, {%mem_tile_7_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<1x2048xbf16>>  
    aie.objectfifo @of_1_unicast_0_0(%mem_tile_0_1, {%tile_0_2}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<1x2048xbf16>>  
    aie.objectfifo.link [@of_0_mem_0] -> [@of_1_unicast_0_0]([] [])
    aie.objectfifo @of_1_unicast_1_0(%mem_tile_1_1, {%tile_1_2}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<1x2048xbf16>>  
    aie.objectfifo.link [@of_0_mem_1] -> [@of_1_unicast_1_0]([] [])
    aie.objectfifo @of_1_unicast_2_0(%mem_tile_2_1, {%tile_2_2}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<1x2048xbf16>>  
    aie.objectfifo.link [@of_0_mem_2] -> [@of_1_unicast_2_0]([] [])
    aie.objectfifo @of_1_unicast_3_0(%mem_tile_3_1, {%tile_3_2}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<1x2048xbf16>>  
    aie.objectfifo.link [@of_0_mem_3] -> [@of_1_unicast_3_0]([] [])
    aie.objectfifo @of_1_unicast_4_0(%mem_tile_4_1, {%tile_4_2}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<1x2048xbf16>>  
    aie.objectfifo.link [@of_0_mem_4] -> [@of_1_unicast_4_0]([] [])
    aie.objectfifo @of_1_unicast_5_0(%mem_tile_5_1, {%tile_5_2}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<1x2048xbf16>>  
    aie.objectfifo.link [@of_0_mem_5] -> [@of_1_unicast_5_0]([] [])
    aie.objectfifo @of_1_unicast_6_0(%mem_tile_6_1, {%tile_6_2}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<1x2048xbf16>>  
    aie.objectfifo.link [@of_0_mem_6] -> [@of_1_unicast_6_0]([] [])
    aie.objectfifo @of_1_unicast_7_0(%mem_tile_7_1, {%tile_7_2}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<1x2048xbf16>>  
    aie.objectfifo.link [@of_0_mem_7] -> [@of_1_unicast_7_0]([] [])
    aie.objectfifo @of_2_unicast_0(%tile_0_2, {%mem_tile_0_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<1x2048xbf16>>  
    aie.objectfifo @of_2_unicast_1(%tile_1_2, {%mem_tile_1_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<1x2048xbf16>>  
    aie.objectfifo @of_2_unicast_2(%tile_2_2, {%mem_tile_2_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<1x2048xbf16>>  
    aie.objectfifo @of_2_unicast_3(%tile_3_2, {%mem_tile_3_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<1x2048xbf16>>  
    aie.objectfifo @of_2_unicast_4(%tile_4_2, {%mem_tile_4_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<1x2048xbf16>>  
    aie.objectfifo @of_2_unicast_5(%tile_5_2, {%mem_tile_5_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<1x2048xbf16>>  
    aie.objectfifo @of_2_unicast_6(%tile_6_2, {%mem_tile_6_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<1x2048xbf16>>  
    aie.objectfifo @of_2_unicast_7(%tile_7_2, {%mem_tile_7_1}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<1x2048xbf16>>  
    aie.objectfifo @of_3_mem_0(%mem_tile_0_1, {%shim_noc_tile_0_0}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<1x2048xbf16>>  
    aie.objectfifo.link [@of_2_unicast_0] -> [@of_3_mem_0]([] [])
    aie.objectfifo @of_3_mem_1(%mem_tile_1_1, {%shim_noc_tile_1_0}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<1x2048xbf16>>  
    aie.objectfifo.link [@of_2_unicast_1] -> [@of_3_mem_1]([] [])
    aie.objectfifo @of_3_mem_2(%mem_tile_2_1, {%shim_noc_tile_2_0}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<1x2048xbf16>>  
    aie.objectfifo.link [@of_2_unicast_2] -> [@of_3_mem_2]([] [])
    aie.objectfifo @of_3_mem_3(%mem_tile_3_1, {%shim_noc_tile_3_0}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<1x2048xbf16>>  
    aie.objectfifo.link [@of_2_unicast_3] -> [@of_3_mem_3]([] [])
    aie.objectfifo @of_3_mem_4(%mem_tile_4_1, {%shim_noc_tile_4_0}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<1x2048xbf16>>  
    aie.objectfifo.link [@of_2_unicast_4] -> [@of_3_mem_4]([] [])
    aie.objectfifo @of_3_mem_5(%mem_tile_5_1, {%shim_noc_tile_5_0}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<1x2048xbf16>>  
    aie.objectfifo.link [@of_2_unicast_5] -> [@of_3_mem_5]([] [])
    aie.objectfifo @of_3_mem_6(%mem_tile_6_1, {%shim_noc_tile_6_0}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<1x2048xbf16>>  
    aie.objectfifo.link [@of_2_unicast_6] -> [@of_3_mem_6]([] [])
    aie.objectfifo @of_3_mem_7(%mem_tile_7_1, {%shim_noc_tile_7_0}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<1x2048xbf16>>  
    aie.objectfifo.link [@of_2_unicast_7] -> [@of_3_mem_7]([] [])
    func.func private @op1_silu_bf16(memref<1x2048xbf16>, memref<1x2048xbf16>, i32)
  }
}
