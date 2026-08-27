module {
  aie.device(npu2) {
    %logical_core = aie.logical_tile<CoreTile>(0, 2)
    %logical_core_0 = aie.logical_tile<CoreTile>(1, 2)
    %logical_core_1 = aie.logical_tile<CoreTile>(0, 3)
    %logical_core_2 = aie.logical_tile<CoreTile>(1, 3)
    %logical_core_3 = aie.logical_tile<CoreTile>(0, 4)
    %logical_core_4 = aie.logical_tile<CoreTile>(1, 4)
    %logical_shim_noc = aie.logical_tile<ShimNOCTile>(5, 0)
    %logical_mem = aie.logical_tile<MemTile>(3, 1)
    %logical_shim_noc_5 = aie.logical_tile<ShimNOCTile>(4, 0)
    %logical_mem_6 = aie.logical_tile<MemTile>(6, 1)
    %logical_shim_noc_7 = aie.logical_tile<ShimNOCTile>(6, 0)
    %logical_mem_8 = aie.logical_tile<MemTile>(4, 1)
    %logical_mem_9 = aie.logical_tile<MemTile>(?, ?)
    %logical_mem_10 = aie.logical_tile<MemTile>(?, ?)
    %logical_mem_11 = aie.logical_tile<MemTile>(6, 1)
    %logical_shim_noc_12 = aie.logical_tile<ShimNOCTile>(7, 0)
    %logical_mem_13 = aie.logical_tile<MemTile>(?, ?)
    %logical_mem_14 = aie.logical_tile<MemTile>(?, ?)
    aie.objectfifo @inK(%logical_shim_noc, {%logical_mem}, 2 : i32) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @memK(%logical_mem dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%logical_core, %logical_core_0}, 2 : i32) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo.link [@inK] -> [@memK]([] [0])
    aie.objectfifo @inQ(%logical_shim_noc_5, {%logical_mem_6}, 2 : i32) : !aie.objectfifo<memref<128x64xbf16>>  
    aie.objectfifo @memQ0(%logical_mem_6 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%logical_core}, 2 : i32) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @memQ1(%logical_mem_6 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%logical_core_0}, 2 : i32) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo.link [@inQ] -> [@memQ0, @memQ1]([] [0, 4096])
    aie.objectfifo @inV(%logical_shim_noc_7, {%logical_mem_8}, 2 : i32) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @memV(%logical_mem_8 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%logical_core_3, %logical_core_4}, 2 : i32) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo.link [@inV] -> [@memV]([] [0])
    aie.objectfifo @memA0(%logical_core, {%logical_mem_9}, 2 : i32) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @outA0(%logical_mem_9 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%logical_core_1}, 2 : i32) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo.link [@memA0] -> [@outA0]([] [0])
    aie.objectfifo @memA1(%logical_core_0, {%logical_mem_10}, 2 : i32) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @outA1(%logical_mem_10 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%logical_core_2}, 2 : i32) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo.link [@memA1] -> [@outA1]([] [0])
    aie.objectfifo @memO(%logical_mem_11 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%logical_shim_noc_12}, 2 : i32) : !aie.objectfifo<memref<128x64xbf16>>  
    aie.objectfifo @outO0(%logical_core_3, {%logical_mem_11}, 2 : i32) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @outO1(%logical_core_4, {%logical_mem_11}, 2 : i32) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo.link [@outO0, @outO1] -> [@memO]([0, 4096] [])
    aie.objectfifo @memP0(%logical_core_1, {%logical_mem_13}, 2 : i32) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @outP0(%logical_mem_13 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%logical_core_3}, 2 : i32) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo.link [@memP0] -> [@outP0]([] [0])
    aie.objectfifo @memP1(%logical_core_2, {%logical_mem_14}, 2 : i32) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @outP1(%logical_mem_14 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%logical_core_4}, 2 : i32) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo.link [@memP1] -> [@outP1]([] [0])
    aie.objectfifo @scaleOF0(%logical_core_1, {%logical_core_3}, 2 : i32) : !aie.objectfifo<memref<256xbf16>>  
    aie.objectfifo @scaleOF1(%logical_core_2, {%logical_core_4}, 2 : i32) : !aie.objectfifo<memref<256xbf16>>  
    func.func private @zero_bf16(memref<64x64xbf16>) attributes {link_with = "mha.o"}
    func.func private @matmul_bf16_bf16_wrapper(memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>, memref<2xi32>) attributes {link_with = "mha.o"}
    %mha_rtpss_0_stage0 = aie.buffer(%logical_core) {sym_name = "mha_rtpss_0_stage0"} : memref<4xi32> 
    %idx_buffer_qk_0 = aie.buffer(%logical_core) {sym_name = "idx_buffer_qk_0"} : memref<2xi32> = dense<0>
    %mha_rtpss_1_stage0 = aie.buffer(%logical_core_0) {sym_name = "mha_rtpss_1_stage0"} : memref<4xi32> 
    %idx_buffer_qk_1 = aie.buffer(%logical_core_0) {sym_name = "idx_buffer_qk_1"} : memref<2xi32> = dense<0>
    func.func private @partial_softmax(memref<64x64xbf16>, memref<64x64xbf16>, memref<256xbf16>, memref<2xi32>, bf16, i32, i32, i32, i32) attributes {link_with = "mha.o"}
    func.func private @init_scale_buffer(memref<256xbf16>, i32) attributes {link_with = "mha.o"}
    func.func private @passThroughLine(memref<256xbf16>, memref<256xbf16>, i32) attributes {link_with = "mha_passThrough.o"}
    %mha_rtpss_0_stage1 = aie.buffer(%logical_core_1) {sym_name = "mha_rtpss_0_stage1"} : memref<4xi32> 
    %idx_buffer_softmax_0 = aie.buffer(%logical_core_1) {sym_name = "idx_buffer_softmax_0"} : memref<2xi32> = dense<0>
    %scale_buffer_softmax_0 = aie.buffer(%logical_core_1) {sym_name = "scale_buffer_softmax_0"} : memref<256xbf16> = dense<0.000000e+00>
    %mha_rtpss_1_stage1 = aie.buffer(%logical_core_2) {sym_name = "mha_rtpss_1_stage1"} : memref<4xi32> 
    %idx_buffer_softmax_1 = aie.buffer(%logical_core_2) {sym_name = "idx_buffer_softmax_1"} : memref<2xi32> = dense<0>
    %scale_buffer_softmax_1 = aie.buffer(%logical_core_2) {sym_name = "scale_buffer_softmax_1"} : memref<256xbf16> = dense<0.000000e+00>
    func.func private @matmul_PV(memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>, memref<256xbf16>, i32, i32, memref<2xi32>) attributes {link_with = "mha.o"}
    func.func private @rescale_O(memref<64x64xbf16>, memref<256xbf16>, i32, memref<2xi32>) attributes {link_with = "mha.o"}
    %mha_rtpss_0_stage2 = aie.buffer(%logical_core_3) {sym_name = "mha_rtpss_0_stage2"} : memref<4xi32> 
    %idx_buffer_pv_0 = aie.buffer(%logical_core_3) {sym_name = "idx_buffer_pv_0"} : memref<2xi32> = dense<0>
    %mha_rtpss_1_stage2 = aie.buffer(%logical_core_4) {sym_name = "mha_rtpss_1_stage2"} : memref<4xi32> 
    %idx_buffer_pv_1 = aie.buffer(%logical_core_4) {sym_name = "idx_buffer_pv_1"} : memref<2xi32> = dense<0>
    %lock_0_2 = aie.lock(%logical_core)
    %core_0_2 = aie.core(%logical_core) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c1_15 = arith.constant 1 : index
      scf.for %arg0 = %c0 to %c1 step %c1_15 {
        %c1_i32 = arith.constant 1 : i32
        aie.use_lock(%lock_0_2, Acquire, %c1_i32)
        %c0_16 = arith.constant 0 : index
        %0 = memref.load %mha_rtpss_0_stage0[%c0_16] : memref<4xi32>
        %c1_17 = arith.constant 1 : index
        %1 = memref.load %mha_rtpss_0_stage0[%c1_17] : memref<4xi32>
        %c0_18 = arith.constant 0 : index
        %c9223372036854775807 = arith.constant 9223372036854775807 : index
        %c1_19 = arith.constant 1 : index
        scf.for %arg1 = %c0_18 to %c9223372036854775807 step %c1_19 {
          %c0_20 = arith.constant 0 : index
          %c0_i32 = arith.constant 0 : i32
          memref.store %c0_i32, %idx_buffer_qk_0[%c0_20] : memref<2xi32>
          %c1_21 = arith.constant 1 : index
          %c0_i32_22 = arith.constant 0 : i32
          memref.store %c0_i32_22, %idx_buffer_qk_0[%c1_21] : memref<2xi32>
          %c0_23 = arith.constant 0 : index
          %2 = arith.index_cast %0 : i32 to index
          %c1_24 = arith.constant 1 : index
          scf.for %arg2 = %c0_23 to %2 step %c1_24 {
            %3 = aie.objectfifo.acquire @memQ0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %4 = aie.objectfifo.subview.access %3[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            %c0_25 = arith.constant 0 : index
            %5 = arith.index_cast %1 : i32 to index
            %c1_26 = arith.constant 1 : index
            scf.for %arg3 = %c0_25 to %5 step %c1_26 {
              %8 = aie.objectfifo.acquire @memK(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
              %9 = aie.objectfifo.subview.access %8[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
              %10 = aie.objectfifo.acquire @memA0(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
              %11 = aie.objectfifo.subview.access %10[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
              func.call @zero_bf16(%11) : (memref<64x64xbf16>) -> ()
              func.call @matmul_bf16_bf16_wrapper(%4, %9, %11, %idx_buffer_qk_0) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>, memref<2xi32>) -> ()
              aie.objectfifo.release @memK(Consume, 1)
              aie.objectfifo.release @memA0(Produce, 1)
              %c0_31 = arith.constant 0 : index
              %12 = memref.load %idx_buffer_qk_0[%c0_31] : memref<2xi32>
              %c1_i32_32 = arith.constant 1 : i32
              %13 = arith.addi %12, %c1_i32_32 : i32
              %c0_33 = arith.constant 0 : index
              memref.store %13, %idx_buffer_qk_0[%c0_33] : memref<2xi32>
            }
            %c0_27 = arith.constant 0 : index
            %c0_i32_28 = arith.constant 0 : i32
            memref.store %c0_i32_28, %idx_buffer_qk_0[%c0_27] : memref<2xi32>
            %c1_29 = arith.constant 1 : index
            %6 = memref.load %idx_buffer_qk_0[%c1_29] : memref<2xi32>
            %c2_i32 = arith.constant 2 : i32
            %7 = arith.addi %6, %c2_i32 : i32
            %c1_30 = arith.constant 1 : index
            memref.store %7, %idx_buffer_qk_0[%c1_30] : memref<2xi32>
            aie.objectfifo.release @memQ0(Consume, 1)
          }
        }
      }
      aie.end
    } {stack_size = 3328 : i32}
    %lock_1_2 = aie.lock(%logical_core_0)
    %core_1_2 = aie.core(%logical_core_0) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c1_15 = arith.constant 1 : index
      scf.for %arg0 = %c0 to %c1 step %c1_15 {
        %c1_i32 = arith.constant 1 : i32
        aie.use_lock(%lock_1_2, Acquire, %c1_i32)
        %c0_16 = arith.constant 0 : index
        %0 = memref.load %mha_rtpss_1_stage0[%c0_16] : memref<4xi32>
        %c1_17 = arith.constant 1 : index
        %1 = memref.load %mha_rtpss_1_stage0[%c1_17] : memref<4xi32>
        %c0_18 = arith.constant 0 : index
        %c9223372036854775807 = arith.constant 9223372036854775807 : index
        %c1_19 = arith.constant 1 : index
        scf.for %arg1 = %c0_18 to %c9223372036854775807 step %c1_19 {
          %c0_20 = arith.constant 0 : index
          %c0_i32 = arith.constant 0 : i32
          memref.store %c0_i32, %idx_buffer_qk_1[%c0_20] : memref<2xi32>
          %c1_21 = arith.constant 1 : index
          %c1_i32_22 = arith.constant 1 : i32
          memref.store %c1_i32_22, %idx_buffer_qk_1[%c1_21] : memref<2xi32>
          %c0_23 = arith.constant 0 : index
          %2 = arith.index_cast %0 : i32 to index
          %c1_24 = arith.constant 1 : index
          scf.for %arg2 = %c0_23 to %2 step %c1_24 {
            %3 = aie.objectfifo.acquire @memQ1(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %4 = aie.objectfifo.subview.access %3[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            %c0_25 = arith.constant 0 : index
            %5 = arith.index_cast %1 : i32 to index
            %c1_26 = arith.constant 1 : index
            scf.for %arg3 = %c0_25 to %5 step %c1_26 {
              %8 = aie.objectfifo.acquire @memK(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
              %9 = aie.objectfifo.subview.access %8[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
              %10 = aie.objectfifo.acquire @memA1(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
              %11 = aie.objectfifo.subview.access %10[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
              func.call @zero_bf16(%11) : (memref<64x64xbf16>) -> ()
              func.call @matmul_bf16_bf16_wrapper(%4, %9, %11, %idx_buffer_qk_1) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>, memref<2xi32>) -> ()
              aie.objectfifo.release @memK(Consume, 1)
              aie.objectfifo.release @memA1(Produce, 1)
              %c0_31 = arith.constant 0 : index
              %12 = memref.load %idx_buffer_qk_1[%c0_31] : memref<2xi32>
              %c1_i32_32 = arith.constant 1 : i32
              %13 = arith.addi %12, %c1_i32_32 : i32
              %c0_33 = arith.constant 0 : index
              memref.store %13, %idx_buffer_qk_1[%c0_33] : memref<2xi32>
            }
            %c0_27 = arith.constant 0 : index
            %c0_i32_28 = arith.constant 0 : i32
            memref.store %c0_i32_28, %idx_buffer_qk_1[%c0_27] : memref<2xi32>
            %c1_29 = arith.constant 1 : index
            %6 = memref.load %idx_buffer_qk_1[%c1_29] : memref<2xi32>
            %c2_i32 = arith.constant 2 : i32
            %7 = arith.addi %6, %c2_i32 : i32
            %c1_30 = arith.constant 1 : index
            memref.store %7, %idx_buffer_qk_1[%c1_30] : memref<2xi32>
            aie.objectfifo.release @memQ1(Consume, 1)
          }
        }
      }
      aie.end
    } {stack_size = 3328 : i32}
    %lock_0_3 = aie.lock(%logical_core_1)
    %core_0_3 = aie.core(%logical_core_1) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c1_15 = arith.constant 1 : index
      scf.for %arg0 = %c0 to %c1 step %c1_15 {
        %c1_i32 = arith.constant 1 : i32
        aie.use_lock(%lock_0_3, Acquire, %c1_i32)
        %c0_16 = arith.constant 0 : index
        %0 = memref.load %mha_rtpss_0_stage1[%c0_16] : memref<4xi32>
        %c1_17 = arith.constant 1 : index
        %1 = memref.load %mha_rtpss_0_stage1[%c1_17] : memref<4xi32>
        %c2 = arith.constant 2 : index
        %2 = memref.load %mha_rtpss_0_stage1[%c2] : memref<4xi32>
        %c3 = arith.constant 3 : index
        %3 = memref.load %mha_rtpss_0_stage1[%c3] : memref<4xi32>
        %c0_18 = arith.constant 0 : index
        %c9223372036854775807 = arith.constant 9223372036854775807 : index
        %c1_19 = arith.constant 1 : index
        scf.for %arg1 = %c0_18 to %c9223372036854775807 step %c1_19 {
          %c0_20 = arith.constant 0 : index
          %c0_i32 = arith.constant 0 : i32
          memref.store %c0_i32, %idx_buffer_softmax_0[%c0_20] : memref<2xi32>
          %c1_21 = arith.constant 1 : index
          %c0_i32_22 = arith.constant 0 : i32
          memref.store %c0_i32_22, %idx_buffer_softmax_0[%c1_21] : memref<2xi32>
          %c0_23 = arith.constant 0 : index
          %4 = arith.index_cast %0 : i32 to index
          %c1_24 = arith.constant 1 : index
          scf.for %arg2 = %c0_23 to %4 step %c1_24 {
            %c64_i32 = arith.constant 64 : i32
            func.call @init_scale_buffer(%scale_buffer_softmax_0, %c64_i32) : (memref<256xbf16>, i32) -> ()
            %c0_25 = arith.constant 0 : index
            %5 = arith.index_cast %1 : i32 to index
            %c1_26 = arith.constant 1 : index
            scf.for %arg3 = %c0_25 to %5 step %c1_26 {
              %8 = aie.objectfifo.acquire @memP0(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
              %9 = aie.objectfifo.subview.access %8[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
              %10 = aie.objectfifo.acquire @outA0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
              %11 = aie.objectfifo.subview.access %10[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
              %12 = aie.objectfifo.acquire @scaleOF0(Produce, 1) : !aie.objectfifosubview<memref<256xbf16>>
              %13 = aie.objectfifo.subview.access %12[0] : !aie.objectfifosubview<memref<256xbf16>> -> memref<256xbf16>
              %cst = arith.constant 1.806640e-01 : bf16
              %c64_i32_31 = arith.constant 64 : i32
              %c64_i32_32 = arith.constant 64 : i32
              func.call @partial_softmax(%11, %9, %scale_buffer_softmax_0, %idx_buffer_softmax_0, %cst, %c64_i32_31, %c64_i32_32, %2, %3) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<256xbf16>, memref<2xi32>, bf16, i32, i32, i32, i32) -> ()
              %c256_i32 = arith.constant 256 : i32
              func.call @passThroughLine(%scale_buffer_softmax_0, %13, %c256_i32) : (memref<256xbf16>, memref<256xbf16>, i32) -> ()
              aie.objectfifo.release @outA0(Consume, 1)
              aie.objectfifo.release @memP0(Produce, 1)
              aie.objectfifo.release @scaleOF0(Produce, 1)
              %c0_33 = arith.constant 0 : index
              %14 = memref.load %idx_buffer_softmax_0[%c0_33] : memref<2xi32>
              %c1_i32_34 = arith.constant 1 : i32
              %15 = arith.addi %14, %c1_i32_34 : i32
              %c0_35 = arith.constant 0 : index
              memref.store %15, %idx_buffer_softmax_0[%c0_35] : memref<2xi32>
            }
            %c0_27 = arith.constant 0 : index
            %c0_i32_28 = arith.constant 0 : i32
            memref.store %c0_i32_28, %idx_buffer_softmax_0[%c0_27] : memref<2xi32>
            %c1_29 = arith.constant 1 : index
            %6 = memref.load %idx_buffer_softmax_0[%c1_29] : memref<2xi32>
            %c2_i32 = arith.constant 2 : i32
            %7 = arith.addi %6, %c2_i32 : i32
            %c1_30 = arith.constant 1 : index
            memref.store %7, %idx_buffer_softmax_0[%c1_30] : memref<2xi32>
          }
        }
      }
      aie.end
    } {stack_size = 3328 : i32}
    %lock_1_3 = aie.lock(%logical_core_2)
    %core_1_3 = aie.core(%logical_core_2) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c1_15 = arith.constant 1 : index
      scf.for %arg0 = %c0 to %c1 step %c1_15 {
        %c1_i32 = arith.constant 1 : i32
        aie.use_lock(%lock_1_3, Acquire, %c1_i32)
        %c0_16 = arith.constant 0 : index
        %0 = memref.load %mha_rtpss_1_stage1[%c0_16] : memref<4xi32>
        %c1_17 = arith.constant 1 : index
        %1 = memref.load %mha_rtpss_1_stage1[%c1_17] : memref<4xi32>
        %c2 = arith.constant 2 : index
        %2 = memref.load %mha_rtpss_1_stage1[%c2] : memref<4xi32>
        %c3 = arith.constant 3 : index
        %3 = memref.load %mha_rtpss_1_stage1[%c3] : memref<4xi32>
        %c0_18 = arith.constant 0 : index
        %c9223372036854775807 = arith.constant 9223372036854775807 : index
        %c1_19 = arith.constant 1 : index
        scf.for %arg1 = %c0_18 to %c9223372036854775807 step %c1_19 {
          %c0_20 = arith.constant 0 : index
          %c0_i32 = arith.constant 0 : i32
          memref.store %c0_i32, %idx_buffer_softmax_1[%c0_20] : memref<2xi32>
          %c1_21 = arith.constant 1 : index
          %c1_i32_22 = arith.constant 1 : i32
          memref.store %c1_i32_22, %idx_buffer_softmax_1[%c1_21] : memref<2xi32>
          %c0_23 = arith.constant 0 : index
          %4 = arith.index_cast %0 : i32 to index
          %c1_24 = arith.constant 1 : index
          scf.for %arg2 = %c0_23 to %4 step %c1_24 {
            %c64_i32 = arith.constant 64 : i32
            func.call @init_scale_buffer(%scale_buffer_softmax_1, %c64_i32) : (memref<256xbf16>, i32) -> ()
            %c0_25 = arith.constant 0 : index
            %5 = arith.index_cast %1 : i32 to index
            %c1_26 = arith.constant 1 : index
            scf.for %arg3 = %c0_25 to %5 step %c1_26 {
              %8 = aie.objectfifo.acquire @memP1(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
              %9 = aie.objectfifo.subview.access %8[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
              %10 = aie.objectfifo.acquire @outA1(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
              %11 = aie.objectfifo.subview.access %10[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
              %12 = aie.objectfifo.acquire @scaleOF1(Produce, 1) : !aie.objectfifosubview<memref<256xbf16>>
              %13 = aie.objectfifo.subview.access %12[0] : !aie.objectfifosubview<memref<256xbf16>> -> memref<256xbf16>
              %cst = arith.constant 1.806640e-01 : bf16
              %c64_i32_31 = arith.constant 64 : i32
              %c64_i32_32 = arith.constant 64 : i32
              func.call @partial_softmax(%11, %9, %scale_buffer_softmax_1, %idx_buffer_softmax_1, %cst, %c64_i32_31, %c64_i32_32, %2, %3) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<256xbf16>, memref<2xi32>, bf16, i32, i32, i32, i32) -> ()
              %c256_i32 = arith.constant 256 : i32
              func.call @passThroughLine(%scale_buffer_softmax_1, %13, %c256_i32) : (memref<256xbf16>, memref<256xbf16>, i32) -> ()
              aie.objectfifo.release @outA1(Consume, 1)
              aie.objectfifo.release @memP1(Produce, 1)
              aie.objectfifo.release @scaleOF1(Produce, 1)
              %c0_33 = arith.constant 0 : index
              %14 = memref.load %idx_buffer_softmax_1[%c0_33] : memref<2xi32>
              %c1_i32_34 = arith.constant 1 : i32
              %15 = arith.addi %14, %c1_i32_34 : i32
              %c0_35 = arith.constant 0 : index
              memref.store %15, %idx_buffer_softmax_1[%c0_35] : memref<2xi32>
            }
            %c0_27 = arith.constant 0 : index
            %c0_i32_28 = arith.constant 0 : i32
            memref.store %c0_i32_28, %idx_buffer_softmax_1[%c0_27] : memref<2xi32>
            %c1_29 = arith.constant 1 : index
            %6 = memref.load %idx_buffer_softmax_1[%c1_29] : memref<2xi32>
            %c2_i32 = arith.constant 2 : i32
            %7 = arith.addi %6, %c2_i32 : i32
            %c1_30 = arith.constant 1 : index
            memref.store %7, %idx_buffer_softmax_1[%c1_30] : memref<2xi32>
          }
        }
      }
      aie.end
    } {stack_size = 3328 : i32}
    %lock_0_4 = aie.lock(%logical_core_3)
    %core_0_4 = aie.core(%logical_core_3) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c1_15 = arith.constant 1 : index
      scf.for %arg0 = %c0 to %c1 step %c1_15 {
        %c1_i32 = arith.constant 1 : i32
        aie.use_lock(%lock_0_4, Acquire, %c1_i32)
        %c0_16 = arith.constant 0 : index
        %0 = memref.load %mha_rtpss_0_stage2[%c0_16] : memref<4xi32>
        %c1_17 = arith.constant 1 : index
        %1 = memref.load %mha_rtpss_0_stage2[%c1_17] : memref<4xi32>
        %c0_18 = arith.constant 0 : index
        %c9223372036854775807 = arith.constant 9223372036854775807 : index
        %c1_19 = arith.constant 1 : index
        scf.for %arg1 = %c0_18 to %c9223372036854775807 step %c1_19 {
          %c0_20 = arith.constant 0 : index
          %c0_i32 = arith.constant 0 : i32
          memref.store %c0_i32, %idx_buffer_pv_0[%c0_20] : memref<2xi32>
          %c1_21 = arith.constant 1 : index
          %c0_i32_22 = arith.constant 0 : i32
          memref.store %c0_i32_22, %idx_buffer_pv_0[%c1_21] : memref<2xi32>
          %c0_23 = arith.constant 0 : index
          %2 = arith.index_cast %0 : i32 to index
          %c1_24 = arith.constant 1 : index
          scf.for %arg2 = %c0_23 to %2 step %c1_24 {
            %3 = aie.objectfifo.acquire @outO0(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %4 = aie.objectfifo.subview.access %3[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            func.call @zero_bf16(%4) : (memref<64x64xbf16>) -> ()
            %5 = aie.objectfifo.acquire @outP0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %6 = aie.objectfifo.subview.access %5[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            %7 = aie.objectfifo.acquire @memV(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %8 = aie.objectfifo.subview.access %7[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            %9 = aie.objectfifo.acquire @scaleOF0(Consume, 1) : !aie.objectfifosubview<memref<256xbf16>>
            %10 = aie.objectfifo.subview.access %9[0] : !aie.objectfifosubview<memref<256xbf16>> -> memref<256xbf16>
            %c64_i32 = arith.constant 64 : i32
            %c0_i32_25 = arith.constant 0 : i32
            func.call @matmul_PV(%6, %8, %4, %10, %c64_i32, %c0_i32_25, %idx_buffer_pv_0) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>, memref<256xbf16>, i32, i32, memref<2xi32>) -> ()
            aie.objectfifo.release @outP0(Consume, 1)
            aie.objectfifo.release @memV(Consume, 1)
            aie.objectfifo.release @scaleOF0(Consume, 1)
            %c0_26 = arith.constant 0 : index
            %11 = memref.load %idx_buffer_pv_0[%c0_26] : memref<2xi32>
            %c1_i32_27 = arith.constant 1 : i32
            %12 = arith.addi %11, %c1_i32_27 : i32
            %c0_28 = arith.constant 0 : index
            memref.store %12, %idx_buffer_pv_0[%c0_28] : memref<2xi32>
            %c2_i32 = arith.constant 2 : i32
            %13 = arith.cmpi sgt, %1, %c2_i32 : i32
            scf.if %13 {
              %c2_i32_35 = arith.constant 2 : i32
              %17 = arith.subi %1, %c2_i32_35 : i32
              %c0_36 = arith.constant 0 : index
              %18 = arith.index_cast %17 : i32 to index
              %c1_37 = arith.constant 1 : index
              scf.for %arg3 = %c0_36 to %18 step %c1_37 {
                %19 = aie.objectfifo.acquire @outP0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
                %20 = aie.objectfifo.subview.access %19[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
                %21 = aie.objectfifo.acquire @memV(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
                %22 = aie.objectfifo.subview.access %21[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
                %23 = aie.objectfifo.acquire @scaleOF0(Consume, 1) : !aie.objectfifosubview<memref<256xbf16>>
                %24 = aie.objectfifo.subview.access %23[0] : !aie.objectfifosubview<memref<256xbf16>> -> memref<256xbf16>
                %c64_i32_38 = arith.constant 64 : i32
                %c1_i32_39 = arith.constant 1 : i32
                func.call @matmul_PV(%20, %22, %4, %24, %c64_i32_38, %c1_i32_39, %idx_buffer_pv_0) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>, memref<256xbf16>, i32, i32, memref<2xi32>) -> ()
                aie.objectfifo.release @outP0(Consume, 1)
                aie.objectfifo.release @memV(Consume, 1)
                aie.objectfifo.release @scaleOF0(Consume, 1)
                %c0_40 = arith.constant 0 : index
                %25 = memref.load %idx_buffer_pv_0[%c0_40] : memref<2xi32>
                %c1_i32_41 = arith.constant 1 : i32
                %26 = arith.addi %25, %c1_i32_41 : i32
                %c0_42 = arith.constant 0 : index
                memref.store %26, %idx_buffer_pv_0[%c0_42] : memref<2xi32>
              }
            } else {
            }
            %c1_i32_29 = arith.constant 1 : i32
            %14 = arith.cmpi sgt, %1, %c1_i32_29 : i32
            scf.if %14 {
              %17 = aie.objectfifo.acquire @outP0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
              %18 = aie.objectfifo.subview.access %17[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
              %19 = aie.objectfifo.acquire @memV(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
              %20 = aie.objectfifo.subview.access %19[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
              %21 = aie.objectfifo.acquire @scaleOF0(Consume, 1) : !aie.objectfifosubview<memref<256xbf16>>
              %22 = aie.objectfifo.subview.access %21[0] : !aie.objectfifosubview<memref<256xbf16>> -> memref<256xbf16>
              %c64_i32_35 = arith.constant 64 : i32
              %c1_i32_36 = arith.constant 1 : i32
              func.call @matmul_PV(%18, %20, %4, %22, %c64_i32_35, %c1_i32_36, %idx_buffer_pv_0) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>, memref<256xbf16>, i32, i32, memref<2xi32>) -> ()
              %c64_i32_37 = arith.constant 64 : i32
              func.call @rescale_O(%4, %22, %c64_i32_37, %idx_buffer_pv_0) : (memref<64x64xbf16>, memref<256xbf16>, i32, memref<2xi32>) -> ()
              aie.objectfifo.release @outP0(Consume, 1)
              aie.objectfifo.release @memV(Consume, 1)
              aie.objectfifo.release @scaleOF0(Consume, 1)
              %c0_38 = arith.constant 0 : index
              %23 = memref.load %idx_buffer_pv_0[%c0_38] : memref<2xi32>
              %c1_i32_39 = arith.constant 1 : i32
              %24 = arith.addi %23, %c1_i32_39 : i32
              %c0_40 = arith.constant 0 : index
              memref.store %24, %idx_buffer_pv_0[%c0_40] : memref<2xi32>
            } else {
              %c64_i32_35 = arith.constant 64 : i32
              func.call @rescale_O(%4, %10, %c64_i32_35, %idx_buffer_pv_0) : (memref<64x64xbf16>, memref<256xbf16>, i32, memref<2xi32>) -> ()
              %c0_36 = arith.constant 0 : index
              %17 = memref.load %idx_buffer_pv_0[%c0_36] : memref<2xi32>
              %c1_i32_37 = arith.constant 1 : i32
              %18 = arith.addi %17, %c1_i32_37 : i32
              %c0_38 = arith.constant 0 : index
              memref.store %18, %idx_buffer_pv_0[%c0_38] : memref<2xi32>
            }
            %c0_30 = arith.constant 0 : index
            %c0_i32_31 = arith.constant 0 : i32
            memref.store %c0_i32_31, %idx_buffer_pv_0[%c0_30] : memref<2xi32>
            %c1_32 = arith.constant 1 : index
            %15 = memref.load %idx_buffer_pv_0[%c1_32] : memref<2xi32>
            %c2_i32_33 = arith.constant 2 : i32
            %16 = arith.addi %15, %c2_i32_33 : i32
            %c1_34 = arith.constant 1 : index
            memref.store %16, %idx_buffer_pv_0[%c1_34] : memref<2xi32>
            aie.objectfifo.release @outO0(Produce, 1)
          }
        }
      }
      aie.end
    } {stack_size = 3328 : i32}
    %lock_1_4 = aie.lock(%logical_core_4)
    %core_1_4 = aie.core(%logical_core_4) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c1_15 = arith.constant 1 : index
      scf.for %arg0 = %c0 to %c1 step %c1_15 {
        %c1_i32 = arith.constant 1 : i32
        aie.use_lock(%lock_1_4, Acquire, %c1_i32)
        %c0_16 = arith.constant 0 : index
        %0 = memref.load %mha_rtpss_1_stage2[%c0_16] : memref<4xi32>
        %c1_17 = arith.constant 1 : index
        %1 = memref.load %mha_rtpss_1_stage2[%c1_17] : memref<4xi32>
        %c0_18 = arith.constant 0 : index
        %c9223372036854775807 = arith.constant 9223372036854775807 : index
        %c1_19 = arith.constant 1 : index
        scf.for %arg1 = %c0_18 to %c9223372036854775807 step %c1_19 {
          %c0_20 = arith.constant 0 : index
          %c0_i32 = arith.constant 0 : i32
          memref.store %c0_i32, %idx_buffer_pv_1[%c0_20] : memref<2xi32>
          %c1_21 = arith.constant 1 : index
          %c1_i32_22 = arith.constant 1 : i32
          memref.store %c1_i32_22, %idx_buffer_pv_1[%c1_21] : memref<2xi32>
          %c0_23 = arith.constant 0 : index
          %2 = arith.index_cast %0 : i32 to index
          %c1_24 = arith.constant 1 : index
          scf.for %arg2 = %c0_23 to %2 step %c1_24 {
            %3 = aie.objectfifo.acquire @outO1(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %4 = aie.objectfifo.subview.access %3[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            func.call @zero_bf16(%4) : (memref<64x64xbf16>) -> ()
            %5 = aie.objectfifo.acquire @outP1(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %6 = aie.objectfifo.subview.access %5[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            %7 = aie.objectfifo.acquire @memV(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %8 = aie.objectfifo.subview.access %7[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            %9 = aie.objectfifo.acquire @scaleOF1(Consume, 1) : !aie.objectfifosubview<memref<256xbf16>>
            %10 = aie.objectfifo.subview.access %9[0] : !aie.objectfifosubview<memref<256xbf16>> -> memref<256xbf16>
            %c64_i32 = arith.constant 64 : i32
            %c0_i32_25 = arith.constant 0 : i32
            func.call @matmul_PV(%6, %8, %4, %10, %c64_i32, %c0_i32_25, %idx_buffer_pv_1) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>, memref<256xbf16>, i32, i32, memref<2xi32>) -> ()
            aie.objectfifo.release @outP1(Consume, 1)
            aie.objectfifo.release @memV(Consume, 1)
            aie.objectfifo.release @scaleOF1(Consume, 1)
            %c0_26 = arith.constant 0 : index
            %11 = memref.load %idx_buffer_pv_1[%c0_26] : memref<2xi32>
            %c1_i32_27 = arith.constant 1 : i32
            %12 = arith.addi %11, %c1_i32_27 : i32
            %c0_28 = arith.constant 0 : index
            memref.store %12, %idx_buffer_pv_1[%c0_28] : memref<2xi32>
            %c2_i32 = arith.constant 2 : i32
            %13 = arith.cmpi sgt, %1, %c2_i32 : i32
            scf.if %13 {
              %c2_i32_35 = arith.constant 2 : i32
              %17 = arith.subi %1, %c2_i32_35 : i32
              %c0_36 = arith.constant 0 : index
              %18 = arith.index_cast %17 : i32 to index
              %c1_37 = arith.constant 1 : index
              scf.for %arg3 = %c0_36 to %18 step %c1_37 {
                %19 = aie.objectfifo.acquire @outP1(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
                %20 = aie.objectfifo.subview.access %19[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
                %21 = aie.objectfifo.acquire @memV(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
                %22 = aie.objectfifo.subview.access %21[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
                %23 = aie.objectfifo.acquire @scaleOF1(Consume, 1) : !aie.objectfifosubview<memref<256xbf16>>
                %24 = aie.objectfifo.subview.access %23[0] : !aie.objectfifosubview<memref<256xbf16>> -> memref<256xbf16>
                %c64_i32_38 = arith.constant 64 : i32
                %c1_i32_39 = arith.constant 1 : i32
                func.call @matmul_PV(%20, %22, %4, %24, %c64_i32_38, %c1_i32_39, %idx_buffer_pv_1) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>, memref<256xbf16>, i32, i32, memref<2xi32>) -> ()
                aie.objectfifo.release @outP1(Consume, 1)
                aie.objectfifo.release @memV(Consume, 1)
                aie.objectfifo.release @scaleOF1(Consume, 1)
                %c0_40 = arith.constant 0 : index
                %25 = memref.load %idx_buffer_pv_1[%c0_40] : memref<2xi32>
                %c1_i32_41 = arith.constant 1 : i32
                %26 = arith.addi %25, %c1_i32_41 : i32
                %c0_42 = arith.constant 0 : index
                memref.store %26, %idx_buffer_pv_1[%c0_42] : memref<2xi32>
              }
            } else {
            }
            %c1_i32_29 = arith.constant 1 : i32
            %14 = arith.cmpi sgt, %1, %c1_i32_29 : i32
            scf.if %14 {
              %17 = aie.objectfifo.acquire @outP1(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
              %18 = aie.objectfifo.subview.access %17[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
              %19 = aie.objectfifo.acquire @memV(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
              %20 = aie.objectfifo.subview.access %19[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
              %21 = aie.objectfifo.acquire @scaleOF1(Consume, 1) : !aie.objectfifosubview<memref<256xbf16>>
              %22 = aie.objectfifo.subview.access %21[0] : !aie.objectfifosubview<memref<256xbf16>> -> memref<256xbf16>
              %c64_i32_35 = arith.constant 64 : i32
              %c1_i32_36 = arith.constant 1 : i32
              func.call @matmul_PV(%18, %20, %4, %22, %c64_i32_35, %c1_i32_36, %idx_buffer_pv_1) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>, memref<256xbf16>, i32, i32, memref<2xi32>) -> ()
              %c64_i32_37 = arith.constant 64 : i32
              func.call @rescale_O(%4, %22, %c64_i32_37, %idx_buffer_pv_1) : (memref<64x64xbf16>, memref<256xbf16>, i32, memref<2xi32>) -> ()
              aie.objectfifo.release @outP1(Consume, 1)
              aie.objectfifo.release @memV(Consume, 1)
              aie.objectfifo.release @scaleOF1(Consume, 1)
              %c0_38 = arith.constant 0 : index
              %23 = memref.load %idx_buffer_pv_1[%c0_38] : memref<2xi32>
              %c1_i32_39 = arith.constant 1 : i32
              %24 = arith.addi %23, %c1_i32_39 : i32
              %c0_40 = arith.constant 0 : index
              memref.store %24, %idx_buffer_pv_1[%c0_40] : memref<2xi32>
            } else {
              %c64_i32_35 = arith.constant 64 : i32
              func.call @rescale_O(%4, %10, %c64_i32_35, %idx_buffer_pv_1) : (memref<64x64xbf16>, memref<256xbf16>, i32, memref<2xi32>) -> ()
              %c0_36 = arith.constant 0 : index
              %17 = memref.load %idx_buffer_pv_1[%c0_36] : memref<2xi32>
              %c1_i32_37 = arith.constant 1 : i32
              %18 = arith.addi %17, %c1_i32_37 : i32
              %c0_38 = arith.constant 0 : index
              memref.store %18, %idx_buffer_pv_1[%c0_38] : memref<2xi32>
            }
            %c0_30 = arith.constant 0 : index
            %c0_i32_31 = arith.constant 0 : i32
            memref.store %c0_i32_31, %idx_buffer_pv_1[%c0_30] : memref<2xi32>
            %c1_32 = arith.constant 1 : index
            %15 = memref.load %idx_buffer_pv_1[%c1_32] : memref<2xi32>
            %c2_i32_33 = arith.constant 2 : i32
            %16 = arith.addi %15, %c2_i32_33 : i32
            %c1_34 = arith.constant 1 : index
            memref.store %16, %idx_buffer_pv_1[%c1_34] : memref<2xi32>
            aie.objectfifo.release @outO1(Produce, 1)
          }
        }
      }
      aie.end
    } {stack_size = 3328 : i32}
    aie.runtime_sequence(%arg0: memref<1x1024x64xbf16>, %arg1: memref<1x65536xbf16>, %arg2: memref<1x65536xbf16>, %arg3: memref<1x1024x64xbf16>) {
      %c8_i32 = arith.constant 8 : i32
      aiex.npu.rtp_write(@mha_rtpss_0_stage0, 0, %c8_i32) : i32
      %c16_i32 = arith.constant 16 : i32
      aiex.npu.rtp_write(@mha_rtpss_0_stage0, 1, %c16_i32) : i32
      %c1024_i32 = arith.constant 1024 : i32
      aiex.npu.rtp_write(@mha_rtpss_0_stage0, 2, %c1024_i32) : i32
      %c1024_i32_15 = arith.constant 1024 : i32
      aiex.npu.rtp_write(@mha_rtpss_0_stage0, 3, %c1024_i32_15) : i32
      %c8_i32_16 = arith.constant 8 : i32
      aiex.npu.rtp_write(@mha_rtpss_1_stage0, 0, %c8_i32_16) : i32
      %c16_i32_17 = arith.constant 16 : i32
      aiex.npu.rtp_write(@mha_rtpss_1_stage0, 1, %c16_i32_17) : i32
      %c1024_i32_18 = arith.constant 1024 : i32
      aiex.npu.rtp_write(@mha_rtpss_1_stage0, 2, %c1024_i32_18) : i32
      %c1024_i32_19 = arith.constant 1024 : i32
      aiex.npu.rtp_write(@mha_rtpss_1_stage0, 3, %c1024_i32_19) : i32
      %c8_i32_20 = arith.constant 8 : i32
      aiex.npu.rtp_write(@mha_rtpss_0_stage1, 0, %c8_i32_20) : i32
      %c16_i32_21 = arith.constant 16 : i32
      aiex.npu.rtp_write(@mha_rtpss_0_stage1, 1, %c16_i32_21) : i32
      %c1024_i32_22 = arith.constant 1024 : i32
      aiex.npu.rtp_write(@mha_rtpss_0_stage1, 2, %c1024_i32_22) : i32
      %c1024_i32_23 = arith.constant 1024 : i32
      aiex.npu.rtp_write(@mha_rtpss_0_stage1, 3, %c1024_i32_23) : i32
      %c8_i32_24 = arith.constant 8 : i32
      aiex.npu.rtp_write(@mha_rtpss_1_stage1, 0, %c8_i32_24) : i32
      %c16_i32_25 = arith.constant 16 : i32
      aiex.npu.rtp_write(@mha_rtpss_1_stage1, 1, %c16_i32_25) : i32
      %c1024_i32_26 = arith.constant 1024 : i32
      aiex.npu.rtp_write(@mha_rtpss_1_stage1, 2, %c1024_i32_26) : i32
      %c1024_i32_27 = arith.constant 1024 : i32
      aiex.npu.rtp_write(@mha_rtpss_1_stage1, 3, %c1024_i32_27) : i32
      %c8_i32_28 = arith.constant 8 : i32
      aiex.npu.rtp_write(@mha_rtpss_0_stage2, 0, %c8_i32_28) : i32
      %c16_i32_29 = arith.constant 16 : i32
      aiex.npu.rtp_write(@mha_rtpss_0_stage2, 1, %c16_i32_29) : i32
      %c1024_i32_30 = arith.constant 1024 : i32
      aiex.npu.rtp_write(@mha_rtpss_0_stage2, 2, %c1024_i32_30) : i32
      %c1024_i32_31 = arith.constant 1024 : i32
      aiex.npu.rtp_write(@mha_rtpss_0_stage2, 3, %c1024_i32_31) : i32
      %c8_i32_32 = arith.constant 8 : i32
      aiex.npu.rtp_write(@mha_rtpss_1_stage2, 0, %c8_i32_32) : i32
      %c16_i32_33 = arith.constant 16 : i32
      aiex.npu.rtp_write(@mha_rtpss_1_stage2, 1, %c16_i32_33) : i32
      %c1024_i32_34 = arith.constant 1024 : i32
      aiex.npu.rtp_write(@mha_rtpss_1_stage2, 2, %c1024_i32_34) : i32
      %c1024_i32_35 = arith.constant 1024 : i32
      aiex.npu.rtp_write(@mha_rtpss_1_stage2, 3, %c1024_i32_35) : i32
      aiex.set_lock(%lock_0_2, 1)
      aiex.set_lock(%lock_1_2, 1)
      aiex.set_lock(%lock_0_3, 1)
      aiex.set_lock(%lock_1_3, 1)
      aiex.set_lock(%lock_0_4, 1)
      aiex.set_lock(%lock_1_4, 1)
      %0 = aiex.dma_configure_task_for @inQ {
        aie.dma_bd(%arg0 : memref<1x1024x64xbf16> offset = 0 len = 8192 sizes = [1, 1, 128, 64] strides = [0, 0, 64, 1])
        aie.end
      }
      aiex.dma_start_task(%0)
      %1 = aiex.dma_configure_task_for @inK {
        aie.dma_bd(%arg1 : memref<1x65536xbf16> offset = 0 len = 65536 sizes = [1, 1, 1, 65536] strides = [0, 0, 0, 1])
        aie.end
      }
      aiex.dma_start_task(%1)
      %2 = aiex.dma_configure_task_for @inV {
        aie.dma_bd(%arg2 : memref<1x65536xbf16> offset = 0 len = 65536 sizes = [1, 1, 1, 65536] strides = [0, 0, 0, 1])
        aie.end
      }
      aiex.dma_start_task(%2)
      %3 = aiex.dma_configure_task_for @memO {
        aie.dma_bd(%arg3 : memref<1x1024x64xbf16> offset = 0 len = 8192 sizes = [1, 1, 128, 64] strides = [0, 0, 64, 1])
        aie.end
      } {issue_token = true}
      aiex.dma_start_task(%3)
      aiex.dma_await_task(%3)
      aiex.dma_free_task(%0)
      aiex.dma_free_task(%1)
      aiex.dma_free_task(%2)
      aiex.dma_free_task(%3)
      %4 = aiex.dma_configure_task_for @inQ {
        aie.dma_bd(%arg0 : memref<1x1024x64xbf16> offset = 8192 len = 8192 sizes = [1, 1, 128, 64] strides = [0, 0, 64, 1])
        aie.end
      }
      aiex.dma_start_task(%4)
      %5 = aiex.dma_configure_task_for @inK {
        aie.dma_bd(%arg1 : memref<1x65536xbf16> offset = 0 len = 65536 sizes = [1, 1, 1, 65536] strides = [0, 0, 0, 1])
        aie.end
      }
      aiex.dma_start_task(%5)
      %6 = aiex.dma_configure_task_for @inV {
        aie.dma_bd(%arg2 : memref<1x65536xbf16> offset = 0 len = 65536 sizes = [1, 1, 1, 65536] strides = [0, 0, 0, 1])
        aie.end
      }
      aiex.dma_start_task(%6)
      %7 = aiex.dma_configure_task_for @memO {
        aie.dma_bd(%arg3 : memref<1x1024x64xbf16> offset = 8192 len = 8192 sizes = [1, 1, 128, 64] strides = [0, 0, 64, 1])
        aie.end
      } {issue_token = true}
      aiex.dma_start_task(%7)
      aiex.dma_await_task(%7)
      aiex.dma_free_task(%4)
      aiex.dma_free_task(%5)
      aiex.dma_free_task(%6)
      aiex.dma_free_task(%7)
      %8 = aiex.dma_configure_task_for @inQ {
        aie.dma_bd(%arg0 : memref<1x1024x64xbf16> offset = 16384 len = 8192 sizes = [1, 1, 128, 64] strides = [0, 0, 64, 1])
        aie.end
      }
      aiex.dma_start_task(%8)
      %9 = aiex.dma_configure_task_for @inK {
        aie.dma_bd(%arg1 : memref<1x65536xbf16> offset = 0 len = 65536 sizes = [1, 1, 1, 65536] strides = [0, 0, 0, 1])
        aie.end
      }
      aiex.dma_start_task(%9)
      %10 = aiex.dma_configure_task_for @inV {
        aie.dma_bd(%arg2 : memref<1x65536xbf16> offset = 0 len = 65536 sizes = [1, 1, 1, 65536] strides = [0, 0, 0, 1])
        aie.end
      }
      aiex.dma_start_task(%10)
      %11 = aiex.dma_configure_task_for @memO {
        aie.dma_bd(%arg3 : memref<1x1024x64xbf16> offset = 16384 len = 8192 sizes = [1, 1, 128, 64] strides = [0, 0, 64, 1])
        aie.end
      } {issue_token = true}
      aiex.dma_start_task(%11)
      aiex.dma_await_task(%11)
      aiex.dma_free_task(%8)
      aiex.dma_free_task(%9)
      aiex.dma_free_task(%10)
      aiex.dma_free_task(%11)
      %12 = aiex.dma_configure_task_for @inQ {
        aie.dma_bd(%arg0 : memref<1x1024x64xbf16> offset = 24576 len = 8192 sizes = [1, 1, 128, 64] strides = [0, 0, 64, 1])
        aie.end
      }
      aiex.dma_start_task(%12)
      %13 = aiex.dma_configure_task_for @inK {
        aie.dma_bd(%arg1 : memref<1x65536xbf16> offset = 0 len = 65536 sizes = [1, 1, 1, 65536] strides = [0, 0, 0, 1])
        aie.end
      }
      aiex.dma_start_task(%13)
      %14 = aiex.dma_configure_task_for @inV {
        aie.dma_bd(%arg2 : memref<1x65536xbf16> offset = 0 len = 65536 sizes = [1, 1, 1, 65536] strides = [0, 0, 0, 1])
        aie.end
      }
      aiex.dma_start_task(%14)
      %15 = aiex.dma_configure_task_for @memO {
        aie.dma_bd(%arg3 : memref<1x1024x64xbf16> offset = 24576 len = 8192 sizes = [1, 1, 128, 64] strides = [0, 0, 64, 1])
        aie.end
      } {issue_token = true}
      aiex.dma_start_task(%15)
      aiex.dma_await_task(%15)
      aiex.dma_free_task(%12)
      aiex.dma_free_task(%13)
      aiex.dma_free_task(%14)
      aiex.dma_free_task(%15)
      %16 = aiex.dma_configure_task_for @inQ {
        aie.dma_bd(%arg0 : memref<1x1024x64xbf16> offset = 32768 len = 8192 sizes = [1, 1, 128, 64] strides = [0, 0, 64, 1])
        aie.end
      }
      aiex.dma_start_task(%16)
      %17 = aiex.dma_configure_task_for @inK {
        aie.dma_bd(%arg1 : memref<1x65536xbf16> offset = 0 len = 65536 sizes = [1, 1, 1, 65536] strides = [0, 0, 0, 1])
        aie.end
      }
      aiex.dma_start_task(%17)
      %18 = aiex.dma_configure_task_for @inV {
        aie.dma_bd(%arg2 : memref<1x65536xbf16> offset = 0 len = 65536 sizes = [1, 1, 1, 65536] strides = [0, 0, 0, 1])
        aie.end
      }
      aiex.dma_start_task(%18)
      %19 = aiex.dma_configure_task_for @memO {
        aie.dma_bd(%arg3 : memref<1x1024x64xbf16> offset = 32768 len = 8192 sizes = [1, 1, 128, 64] strides = [0, 0, 64, 1])
        aie.end
      } {issue_token = true}
      aiex.dma_start_task(%19)
      aiex.dma_await_task(%19)
      aiex.dma_free_task(%16)
      aiex.dma_free_task(%17)
      aiex.dma_free_task(%18)
      aiex.dma_free_task(%19)
      %20 = aiex.dma_configure_task_for @inQ {
        aie.dma_bd(%arg0 : memref<1x1024x64xbf16> offset = 40960 len = 8192 sizes = [1, 1, 128, 64] strides = [0, 0, 64, 1])
        aie.end
      }
      aiex.dma_start_task(%20)
      %21 = aiex.dma_configure_task_for @inK {
        aie.dma_bd(%arg1 : memref<1x65536xbf16> offset = 0 len = 65536 sizes = [1, 1, 1, 65536] strides = [0, 0, 0, 1])
        aie.end
      }
      aiex.dma_start_task(%21)
      %22 = aiex.dma_configure_task_for @inV {
        aie.dma_bd(%arg2 : memref<1x65536xbf16> offset = 0 len = 65536 sizes = [1, 1, 1, 65536] strides = [0, 0, 0, 1])
        aie.end
      }
      aiex.dma_start_task(%22)
      %23 = aiex.dma_configure_task_for @memO {
        aie.dma_bd(%arg3 : memref<1x1024x64xbf16> offset = 40960 len = 8192 sizes = [1, 1, 128, 64] strides = [0, 0, 64, 1])
        aie.end
      } {issue_token = true}
      aiex.dma_start_task(%23)
      aiex.dma_await_task(%23)
      aiex.dma_free_task(%20)
      aiex.dma_free_task(%21)
      aiex.dma_free_task(%22)
      aiex.dma_free_task(%23)
      %24 = aiex.dma_configure_task_for @inQ {
        aie.dma_bd(%arg0 : memref<1x1024x64xbf16> offset = 49152 len = 8192 sizes = [1, 1, 128, 64] strides = [0, 0, 64, 1])
        aie.end
      }
      aiex.dma_start_task(%24)
      %25 = aiex.dma_configure_task_for @inK {
        aie.dma_bd(%arg1 : memref<1x65536xbf16> offset = 0 len = 65536 sizes = [1, 1, 1, 65536] strides = [0, 0, 0, 1])
        aie.end
      }
      aiex.dma_start_task(%25)
      %26 = aiex.dma_configure_task_for @inV {
        aie.dma_bd(%arg2 : memref<1x65536xbf16> offset = 0 len = 65536 sizes = [1, 1, 1, 65536] strides = [0, 0, 0, 1])
        aie.end
      }
      aiex.dma_start_task(%26)
      %27 = aiex.dma_configure_task_for @memO {
        aie.dma_bd(%arg3 : memref<1x1024x64xbf16> offset = 49152 len = 8192 sizes = [1, 1, 128, 64] strides = [0, 0, 64, 1])
        aie.end
      } {issue_token = true}
      aiex.dma_start_task(%27)
      aiex.dma_await_task(%27)
      aiex.dma_free_task(%24)
      aiex.dma_free_task(%25)
      aiex.dma_free_task(%26)
      aiex.dma_free_task(%27)
      %28 = aiex.dma_configure_task_for @inQ {
        aie.dma_bd(%arg0 : memref<1x1024x64xbf16> offset = 57344 len = 8192 sizes = [1, 1, 128, 64] strides = [0, 0, 64, 1])
        aie.end
      }
      aiex.dma_start_task(%28)
      %29 = aiex.dma_configure_task_for @inK {
        aie.dma_bd(%arg1 : memref<1x65536xbf16> offset = 0 len = 65536 sizes = [1, 1, 1, 65536] strides = [0, 0, 0, 1])
        aie.end
      }
      aiex.dma_start_task(%29)
      %30 = aiex.dma_configure_task_for @inV {
        aie.dma_bd(%arg2 : memref<1x65536xbf16> offset = 0 len = 65536 sizes = [1, 1, 1, 65536] strides = [0, 0, 0, 1])
        aie.end
      }
      aiex.dma_start_task(%30)
      %31 = aiex.dma_configure_task_for @memO {
        aie.dma_bd(%arg3 : memref<1x1024x64xbf16> offset = 57344 len = 8192 sizes = [1, 1, 128, 64] strides = [0, 0, 64, 1])
        aie.end
      } {issue_token = true}
      aiex.dma_start_task(%31)
      aiex.dma_await_task(%31)
      aiex.dma_free_task(%28)
      aiex.dma_free_task(%29)
      aiex.dma_free_task(%30)
      aiex.dma_free_task(%31)
    }
  }
}
