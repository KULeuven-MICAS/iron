module {
  aie.device(npu2) {
    %logical_core = aie.logical_tile<CoreTile>(?, ?)
    %logical_core_0 = aie.logical_tile<CoreTile>(?, ?)
    %logical_core_1 = aie.logical_tile<CoreTile>(?, ?)
    %logical_core_2 = aie.logical_tile<CoreTile>(?, ?)
    %logical_core_3 = aie.logical_tile<CoreTile>(?, ?)
    %logical_core_4 = aie.logical_tile<CoreTile>(?, ?)
    %logical_core_5 = aie.logical_tile<CoreTile>(?, ?)
    %logical_core_6 = aie.logical_tile<CoreTile>(?, ?)
    %logical_shim_noc = aie.logical_tile<ShimNOCTile>(?, ?)
    %logical_shim_noc_7 = aie.logical_tile<ShimNOCTile>(?, ?)
    %logical_shim_noc_8 = aie.logical_tile<ShimNOCTile>(?, ?)
    %logical_shim_noc_9 = aie.logical_tile<ShimNOCTile>(?, ?)
    %logical_shim_noc_10 = aie.logical_tile<ShimNOCTile>(?, ?)
    %logical_shim_noc_11 = aie.logical_tile<ShimNOCTile>(?, ?)
    %logical_shim_noc_12 = aie.logical_tile<ShimNOCTile>(?, ?)
    %logical_shim_noc_13 = aie.logical_tile<ShimNOCTile>(?, ?)
    %logical_shim_noc_14 = aie.logical_tile<ShimNOCTile>(?, ?)
    %logical_shim_noc_15 = aie.logical_tile<ShimNOCTile>(?, ?)
    %logical_shim_noc_16 = aie.logical_tile<ShimNOCTile>(?, ?)
    %logical_shim_noc_17 = aie.logical_tile<ShimNOCTile>(?, ?)
    %logical_shim_noc_18 = aie.logical_tile<ShimNOCTile>(?, ?)
    %logical_shim_noc_19 = aie.logical_tile<ShimNOCTile>(?, ?)
    %logical_shim_noc_20 = aie.logical_tile<ShimNOCTile>(?, ?)
    %logical_shim_noc_21 = aie.logical_tile<ShimNOCTile>(?, ?)
    aie.objectfifo @in0_0(%logical_shim_noc, {%logical_core}, 2 : i32) : !aie.objectfifo<memref<256xbf16>>  
    aie.objectfifo @in1_0(%logical_shim_noc_7, {%logical_core_0}, 2 : i32) : !aie.objectfifo<memref<256xbf16>>  
    aie.objectfifo @in2_0(%logical_shim_noc_8, {%logical_core_1}, 2 : i32) : !aie.objectfifo<memref<256xbf16>>  
    aie.objectfifo @in3_0(%logical_shim_noc_9, {%logical_core_2}, 2 : i32) : !aie.objectfifo<memref<256xbf16>>  
    aie.objectfifo @in4_0(%logical_shim_noc_10, {%logical_core_3}, 2 : i32) : !aie.objectfifo<memref<256xbf16>>  
    aie.objectfifo @in5_0(%logical_shim_noc_11, {%logical_core_4}, 2 : i32) : !aie.objectfifo<memref<256xbf16>>  
    aie.objectfifo @in6_0(%logical_shim_noc_12, {%logical_core_5}, 2 : i32) : !aie.objectfifo<memref<256xbf16>>  
    aie.objectfifo @in7_0(%logical_shim_noc_13, {%logical_core_6}, 2 : i32) : !aie.objectfifo<memref<256xbf16>>  
    aie.objectfifo @out0_0(%logical_core, {%logical_shim_noc_14}, 2 : i32) : !aie.objectfifo<memref<256xbf16>>  
    aie.objectfifo @out1_0(%logical_core_0, {%logical_shim_noc_15}, 2 : i32) : !aie.objectfifo<memref<256xbf16>>  
    aie.objectfifo @out2_0(%logical_core_1, {%logical_shim_noc_16}, 2 : i32) : !aie.objectfifo<memref<256xbf16>>  
    aie.objectfifo @out3_0(%logical_core_2, {%logical_shim_noc_17}, 2 : i32) : !aie.objectfifo<memref<256xbf16>>  
    aie.objectfifo @out4_0(%logical_core_3, {%logical_shim_noc_18}, 2 : i32) : !aie.objectfifo<memref<256xbf16>>  
    aie.objectfifo @out5_0(%logical_core_4, {%logical_shim_noc_19}, 2 : i32) : !aie.objectfifo<memref<256xbf16>>  
    aie.objectfifo @out6_0(%logical_core_5, {%logical_shim_noc_20}, 2 : i32) : !aie.objectfifo<memref<256xbf16>>  
    aie.objectfifo @out7_0(%logical_core_6, {%logical_shim_noc_21}, 2 : i32) : !aie.objectfifo<memref<256xbf16>>  
    func.func private @op1_silu_bf16(memref<256xbf16>, memref<256xbf16>, i32) attributes {link_with = "op1_silu.o"}
    %0 = aie.core(%logical_core) {
      %c0 = arith.constant 0 : index
      %c9223372036854775807 = arith.constant 9223372036854775807 : index
      %c1 = arith.constant 1 : index
      scf.for %arg0 = %c0 to %c9223372036854775807 step %c1 {
        %c0_22 = arith.constant 0 : index
        %c256 = arith.constant 256 : index
        %c1_23 = arith.constant 1 : index
        scf.for %arg1 = %c0_22 to %c256 step %c1_23 {
          %8 = aie.objectfifo.acquire @in0_0(Consume, 1) : !aie.objectfifosubview<memref<256xbf16>>
          %9 = aie.objectfifo.subview.access %8[0] : !aie.objectfifosubview<memref<256xbf16>> -> memref<256xbf16>
          %10 = aie.objectfifo.acquire @out0_0(Produce, 1) : !aie.objectfifosubview<memref<256xbf16>>
          %11 = aie.objectfifo.subview.access %10[0] : !aie.objectfifosubview<memref<256xbf16>> -> memref<256xbf16>
          %c256_i32 = arith.constant 256 : i32
          func.call @op1_silu_bf16(%9, %11, %c256_i32) : (memref<256xbf16>, memref<256xbf16>, i32) -> ()
          aie.objectfifo.release @in0_0(Consume, 1)
          aie.objectfifo.release @out0_0(Produce, 1)
        }
      }
      aie.end
    }
    %1 = aie.core(%logical_core_0) {
      %c0 = arith.constant 0 : index
      %c9223372036854775807 = arith.constant 9223372036854775807 : index
      %c1 = arith.constant 1 : index
      scf.for %arg0 = %c0 to %c9223372036854775807 step %c1 {
        %c0_22 = arith.constant 0 : index
        %c256 = arith.constant 256 : index
        %c1_23 = arith.constant 1 : index
        scf.for %arg1 = %c0_22 to %c256 step %c1_23 {
          %8 = aie.objectfifo.acquire @in1_0(Consume, 1) : !aie.objectfifosubview<memref<256xbf16>>
          %9 = aie.objectfifo.subview.access %8[0] : !aie.objectfifosubview<memref<256xbf16>> -> memref<256xbf16>
          %10 = aie.objectfifo.acquire @out1_0(Produce, 1) : !aie.objectfifosubview<memref<256xbf16>>
          %11 = aie.objectfifo.subview.access %10[0] : !aie.objectfifosubview<memref<256xbf16>> -> memref<256xbf16>
          %c256_i32 = arith.constant 256 : i32
          func.call @op1_silu_bf16(%9, %11, %c256_i32) : (memref<256xbf16>, memref<256xbf16>, i32) -> ()
          aie.objectfifo.release @in1_0(Consume, 1)
          aie.objectfifo.release @out1_0(Produce, 1)
        }
      }
      aie.end
    }
    %2 = aie.core(%logical_core_1) {
      %c0 = arith.constant 0 : index
      %c9223372036854775807 = arith.constant 9223372036854775807 : index
      %c1 = arith.constant 1 : index
      scf.for %arg0 = %c0 to %c9223372036854775807 step %c1 {
        %c0_22 = arith.constant 0 : index
        %c256 = arith.constant 256 : index
        %c1_23 = arith.constant 1 : index
        scf.for %arg1 = %c0_22 to %c256 step %c1_23 {
          %8 = aie.objectfifo.acquire @in2_0(Consume, 1) : !aie.objectfifosubview<memref<256xbf16>>
          %9 = aie.objectfifo.subview.access %8[0] : !aie.objectfifosubview<memref<256xbf16>> -> memref<256xbf16>
          %10 = aie.objectfifo.acquire @out2_0(Produce, 1) : !aie.objectfifosubview<memref<256xbf16>>
          %11 = aie.objectfifo.subview.access %10[0] : !aie.objectfifosubview<memref<256xbf16>> -> memref<256xbf16>
          %c256_i32 = arith.constant 256 : i32
          func.call @op1_silu_bf16(%9, %11, %c256_i32) : (memref<256xbf16>, memref<256xbf16>, i32) -> ()
          aie.objectfifo.release @in2_0(Consume, 1)
          aie.objectfifo.release @out2_0(Produce, 1)
        }
      }
      aie.end
    }
    %3 = aie.core(%logical_core_2) {
      %c0 = arith.constant 0 : index
      %c9223372036854775807 = arith.constant 9223372036854775807 : index
      %c1 = arith.constant 1 : index
      scf.for %arg0 = %c0 to %c9223372036854775807 step %c1 {
        %c0_22 = arith.constant 0 : index
        %c256 = arith.constant 256 : index
        %c1_23 = arith.constant 1 : index
        scf.for %arg1 = %c0_22 to %c256 step %c1_23 {
          %8 = aie.objectfifo.acquire @in3_0(Consume, 1) : !aie.objectfifosubview<memref<256xbf16>>
          %9 = aie.objectfifo.subview.access %8[0] : !aie.objectfifosubview<memref<256xbf16>> -> memref<256xbf16>
          %10 = aie.objectfifo.acquire @out3_0(Produce, 1) : !aie.objectfifosubview<memref<256xbf16>>
          %11 = aie.objectfifo.subview.access %10[0] : !aie.objectfifosubview<memref<256xbf16>> -> memref<256xbf16>
          %c256_i32 = arith.constant 256 : i32
          func.call @op1_silu_bf16(%9, %11, %c256_i32) : (memref<256xbf16>, memref<256xbf16>, i32) -> ()
          aie.objectfifo.release @in3_0(Consume, 1)
          aie.objectfifo.release @out3_0(Produce, 1)
        }
      }
      aie.end
    }
    %4 = aie.core(%logical_core_3) {
      %c0 = arith.constant 0 : index
      %c9223372036854775807 = arith.constant 9223372036854775807 : index
      %c1 = arith.constant 1 : index
      scf.for %arg0 = %c0 to %c9223372036854775807 step %c1 {
        %c0_22 = arith.constant 0 : index
        %c256 = arith.constant 256 : index
        %c1_23 = arith.constant 1 : index
        scf.for %arg1 = %c0_22 to %c256 step %c1_23 {
          %8 = aie.objectfifo.acquire @in4_0(Consume, 1) : !aie.objectfifosubview<memref<256xbf16>>
          %9 = aie.objectfifo.subview.access %8[0] : !aie.objectfifosubview<memref<256xbf16>> -> memref<256xbf16>
          %10 = aie.objectfifo.acquire @out4_0(Produce, 1) : !aie.objectfifosubview<memref<256xbf16>>
          %11 = aie.objectfifo.subview.access %10[0] : !aie.objectfifosubview<memref<256xbf16>> -> memref<256xbf16>
          %c256_i32 = arith.constant 256 : i32
          func.call @op1_silu_bf16(%9, %11, %c256_i32) : (memref<256xbf16>, memref<256xbf16>, i32) -> ()
          aie.objectfifo.release @in4_0(Consume, 1)
          aie.objectfifo.release @out4_0(Produce, 1)
        }
      }
      aie.end
    }
    %5 = aie.core(%logical_core_4) {
      %c0 = arith.constant 0 : index
      %c9223372036854775807 = arith.constant 9223372036854775807 : index
      %c1 = arith.constant 1 : index
      scf.for %arg0 = %c0 to %c9223372036854775807 step %c1 {
        %c0_22 = arith.constant 0 : index
        %c256 = arith.constant 256 : index
        %c1_23 = arith.constant 1 : index
        scf.for %arg1 = %c0_22 to %c256 step %c1_23 {
          %8 = aie.objectfifo.acquire @in5_0(Consume, 1) : !aie.objectfifosubview<memref<256xbf16>>
          %9 = aie.objectfifo.subview.access %8[0] : !aie.objectfifosubview<memref<256xbf16>> -> memref<256xbf16>
          %10 = aie.objectfifo.acquire @out5_0(Produce, 1) : !aie.objectfifosubview<memref<256xbf16>>
          %11 = aie.objectfifo.subview.access %10[0] : !aie.objectfifosubview<memref<256xbf16>> -> memref<256xbf16>
          %c256_i32 = arith.constant 256 : i32
          func.call @op1_silu_bf16(%9, %11, %c256_i32) : (memref<256xbf16>, memref<256xbf16>, i32) -> ()
          aie.objectfifo.release @in5_0(Consume, 1)
          aie.objectfifo.release @out5_0(Produce, 1)
        }
      }
      aie.end
    }
    %6 = aie.core(%logical_core_5) {
      %c0 = arith.constant 0 : index
      %c9223372036854775807 = arith.constant 9223372036854775807 : index
      %c1 = arith.constant 1 : index
      scf.for %arg0 = %c0 to %c9223372036854775807 step %c1 {
        %c0_22 = arith.constant 0 : index
        %c256 = arith.constant 256 : index
        %c1_23 = arith.constant 1 : index
        scf.for %arg1 = %c0_22 to %c256 step %c1_23 {
          %8 = aie.objectfifo.acquire @in6_0(Consume, 1) : !aie.objectfifosubview<memref<256xbf16>>
          %9 = aie.objectfifo.subview.access %8[0] : !aie.objectfifosubview<memref<256xbf16>> -> memref<256xbf16>
          %10 = aie.objectfifo.acquire @out6_0(Produce, 1) : !aie.objectfifosubview<memref<256xbf16>>
          %11 = aie.objectfifo.subview.access %10[0] : !aie.objectfifosubview<memref<256xbf16>> -> memref<256xbf16>
          %c256_i32 = arith.constant 256 : i32
          func.call @op1_silu_bf16(%9, %11, %c256_i32) : (memref<256xbf16>, memref<256xbf16>, i32) -> ()
          aie.objectfifo.release @in6_0(Consume, 1)
          aie.objectfifo.release @out6_0(Produce, 1)
        }
      }
      aie.end
    }
    %7 = aie.core(%logical_core_6) {
      %c0 = arith.constant 0 : index
      %c9223372036854775807 = arith.constant 9223372036854775807 : index
      %c1 = arith.constant 1 : index
      scf.for %arg0 = %c0 to %c9223372036854775807 step %c1 {
        %c0_22 = arith.constant 0 : index
        %c256 = arith.constant 256 : index
        %c1_23 = arith.constant 1 : index
        scf.for %arg1 = %c0_22 to %c256 step %c1_23 {
          %8 = aie.objectfifo.acquire @in7_0(Consume, 1) : !aie.objectfifosubview<memref<256xbf16>>
          %9 = aie.objectfifo.subview.access %8[0] : !aie.objectfifosubview<memref<256xbf16>> -> memref<256xbf16>
          %10 = aie.objectfifo.acquire @out7_0(Produce, 1) : !aie.objectfifosubview<memref<256xbf16>>
          %11 = aie.objectfifo.subview.access %10[0] : !aie.objectfifosubview<memref<256xbf16>> -> memref<256xbf16>
          %c256_i32 = arith.constant 256 : i32
          func.call @op1_silu_bf16(%9, %11, %c256_i32) : (memref<256xbf16>, memref<256xbf16>, i32) -> ()
          aie.objectfifo.release @in7_0(Consume, 1)
          aie.objectfifo.release @out7_0(Produce, 1)
        }
      }
      aie.end
    }
    aie.runtime_sequence(%arg0: memref<524288xbf16>, %arg1: memref<524288xbf16>) {
      %8 = aiex.dma_configure_task_for @in0_0 {
        aie.dma_bd(%arg0 : memref<524288xbf16> offset = 0 len = 65536 sizes = [1, 1, 1, 65536] strides = [0, 0, 0, 1])
        aie.end
      }
      aiex.dma_start_task(%8)
      %9 = aiex.dma_configure_task_for @in1_0 {
        aie.dma_bd(%arg0 : memref<524288xbf16> offset = 65536 len = 65536 sizes = [1, 1, 1, 65536] strides = [0, 0, 0, 1])
        aie.end
      }
      aiex.dma_start_task(%9)
      %10 = aiex.dma_configure_task_for @in2_0 {
        aie.dma_bd(%arg0 : memref<524288xbf16> offset = 131072 len = 65536 sizes = [1, 1, 1, 65536] strides = [0, 0, 0, 1])
        aie.end
      }
      aiex.dma_start_task(%10)
      %11 = aiex.dma_configure_task_for @in3_0 {
        aie.dma_bd(%arg0 : memref<524288xbf16> offset = 196608 len = 65536 sizes = [1, 1, 1, 65536] strides = [0, 0, 0, 1])
        aie.end
      }
      aiex.dma_start_task(%11)
      %12 = aiex.dma_configure_task_for @in4_0 {
        aie.dma_bd(%arg0 : memref<524288xbf16> offset = 262144 len = 65536 sizes = [1, 1, 1, 65536] strides = [0, 0, 0, 1])
        aie.end
      }
      aiex.dma_start_task(%12)
      %13 = aiex.dma_configure_task_for @in5_0 {
        aie.dma_bd(%arg0 : memref<524288xbf16> offset = 327680 len = 65536 sizes = [1, 1, 1, 65536] strides = [0, 0, 0, 1])
        aie.end
      }
      aiex.dma_start_task(%13)
      %14 = aiex.dma_configure_task_for @in6_0 {
        aie.dma_bd(%arg0 : memref<524288xbf16> offset = 393216 len = 65536 sizes = [1, 1, 1, 65536] strides = [0, 0, 0, 1])
        aie.end
      }
      aiex.dma_start_task(%14)
      %15 = aiex.dma_configure_task_for @in7_0 {
        aie.dma_bd(%arg0 : memref<524288xbf16> offset = 458752 len = 65536 sizes = [1, 1, 1, 65536] strides = [0, 0, 0, 1])
        aie.end
      }
      aiex.dma_start_task(%15)
      %16 = aiex.dma_configure_task_for @out0_0 {
        aie.dma_bd(%arg1 : memref<524288xbf16> offset = 0 len = 65536 sizes = [1, 1, 1, 65536] strides = [0, 0, 0, 1])
        aie.end
      } {issue_token = true}
      aiex.dma_start_task(%16)
      %17 = aiex.dma_configure_task_for @out1_0 {
        aie.dma_bd(%arg1 : memref<524288xbf16> offset = 65536 len = 65536 sizes = [1, 1, 1, 65536] strides = [0, 0, 0, 1])
        aie.end
      } {issue_token = true}
      aiex.dma_start_task(%17)
      %18 = aiex.dma_configure_task_for @out2_0 {
        aie.dma_bd(%arg1 : memref<524288xbf16> offset = 131072 len = 65536 sizes = [1, 1, 1, 65536] strides = [0, 0, 0, 1])
        aie.end
      } {issue_token = true}
      aiex.dma_start_task(%18)
      %19 = aiex.dma_configure_task_for @out3_0 {
        aie.dma_bd(%arg1 : memref<524288xbf16> offset = 196608 len = 65536 sizes = [1, 1, 1, 65536] strides = [0, 0, 0, 1])
        aie.end
      } {issue_token = true}
      aiex.dma_start_task(%19)
      %20 = aiex.dma_configure_task_for @out4_0 {
        aie.dma_bd(%arg1 : memref<524288xbf16> offset = 262144 len = 65536 sizes = [1, 1, 1, 65536] strides = [0, 0, 0, 1])
        aie.end
      } {issue_token = true}
      aiex.dma_start_task(%20)
      %21 = aiex.dma_configure_task_for @out5_0 {
        aie.dma_bd(%arg1 : memref<524288xbf16> offset = 327680 len = 65536 sizes = [1, 1, 1, 65536] strides = [0, 0, 0, 1])
        aie.end
      } {issue_token = true}
      aiex.dma_start_task(%21)
      %22 = aiex.dma_configure_task_for @out6_0 {
        aie.dma_bd(%arg1 : memref<524288xbf16> offset = 393216 len = 65536 sizes = [1, 1, 1, 65536] strides = [0, 0, 0, 1])
        aie.end
      } {issue_token = true}
      aiex.dma_start_task(%22)
      %23 = aiex.dma_configure_task_for @out7_0 {
        aie.dma_bd(%arg1 : memref<524288xbf16> offset = 458752 len = 65536 sizes = [1, 1, 1, 65536] strides = [0, 0, 0, 1])
        aie.end
      } {issue_token = true}
      aiex.dma_start_task(%23)
      aiex.dma_await_task(%16)
      aiex.dma_await_task(%17)
      aiex.dma_await_task(%18)
      aiex.dma_await_task(%19)
      aiex.dma_await_task(%20)
      aiex.dma_await_task(%21)
      aiex.dma_await_task(%22)
      aiex.dma_await_task(%23)
      aiex.dma_free_task(%8)
      aiex.dma_free_task(%9)
      aiex.dma_free_task(%10)
      aiex.dma_free_task(%11)
      aiex.dma_free_task(%12)
      aiex.dma_free_task(%13)
      aiex.dma_free_task(%14)
      aiex.dma_free_task(%15)
      aiex.dma_free_task(%16)
      aiex.dma_free_task(%17)
      aiex.dma_free_task(%18)
      aiex.dma_free_task(%19)
      aiex.dma_free_task(%20)
      aiex.dma_free_task(%21)
      aiex.dma_free_task(%22)
      aiex.dma_free_task(%23)
    }
  }
}
