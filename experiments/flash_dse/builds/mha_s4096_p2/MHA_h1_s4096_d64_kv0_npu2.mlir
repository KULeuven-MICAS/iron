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
    aie.runtime_sequence(%arg0: memref<1x4096x64xbf16>, %arg1: memref<1x262144xbf16>, %arg2: memref<1x262144xbf16>, %arg3: memref<1x4096x64xbf16>) {
      %c32_i32 = arith.constant 32 : i32
      aiex.npu.rtp_write(@mha_rtpss_0_stage0, 0, %c32_i32) : i32
      %c64_i32 = arith.constant 64 : i32
      aiex.npu.rtp_write(@mha_rtpss_0_stage0, 1, %c64_i32) : i32
      %c4096_i32 = arith.constant 4096 : i32
      aiex.npu.rtp_write(@mha_rtpss_0_stage0, 2, %c4096_i32) : i32
      %c4096_i32_15 = arith.constant 4096 : i32
      aiex.npu.rtp_write(@mha_rtpss_0_stage0, 3, %c4096_i32_15) : i32
      %c32_i32_16 = arith.constant 32 : i32
      aiex.npu.rtp_write(@mha_rtpss_1_stage0, 0, %c32_i32_16) : i32
      %c64_i32_17 = arith.constant 64 : i32
      aiex.npu.rtp_write(@mha_rtpss_1_stage0, 1, %c64_i32_17) : i32
      %c4096_i32_18 = arith.constant 4096 : i32
      aiex.npu.rtp_write(@mha_rtpss_1_stage0, 2, %c4096_i32_18) : i32
      %c4096_i32_19 = arith.constant 4096 : i32
      aiex.npu.rtp_write(@mha_rtpss_1_stage0, 3, %c4096_i32_19) : i32
      %c32_i32_20 = arith.constant 32 : i32
      aiex.npu.rtp_write(@mha_rtpss_0_stage1, 0, %c32_i32_20) : i32
      %c64_i32_21 = arith.constant 64 : i32
      aiex.npu.rtp_write(@mha_rtpss_0_stage1, 1, %c64_i32_21) : i32
      %c4096_i32_22 = arith.constant 4096 : i32
      aiex.npu.rtp_write(@mha_rtpss_0_stage1, 2, %c4096_i32_22) : i32
      %c4096_i32_23 = arith.constant 4096 : i32
      aiex.npu.rtp_write(@mha_rtpss_0_stage1, 3, %c4096_i32_23) : i32
      %c32_i32_24 = arith.constant 32 : i32
      aiex.npu.rtp_write(@mha_rtpss_1_stage1, 0, %c32_i32_24) : i32
      %c64_i32_25 = arith.constant 64 : i32
      aiex.npu.rtp_write(@mha_rtpss_1_stage1, 1, %c64_i32_25) : i32
      %c4096_i32_26 = arith.constant 4096 : i32
      aiex.npu.rtp_write(@mha_rtpss_1_stage1, 2, %c4096_i32_26) : i32
      %c4096_i32_27 = arith.constant 4096 : i32
      aiex.npu.rtp_write(@mha_rtpss_1_stage1, 3, %c4096_i32_27) : i32
      %c32_i32_28 = arith.constant 32 : i32
      aiex.npu.rtp_write(@mha_rtpss_0_stage2, 0, %c32_i32_28) : i32
      %c64_i32_29 = arith.constant 64 : i32
      aiex.npu.rtp_write(@mha_rtpss_0_stage2, 1, %c64_i32_29) : i32
      %c4096_i32_30 = arith.constant 4096 : i32
      aiex.npu.rtp_write(@mha_rtpss_0_stage2, 2, %c4096_i32_30) : i32
      %c4096_i32_31 = arith.constant 4096 : i32
      aiex.npu.rtp_write(@mha_rtpss_0_stage2, 3, %c4096_i32_31) : i32
      %c32_i32_32 = arith.constant 32 : i32
      aiex.npu.rtp_write(@mha_rtpss_1_stage2, 0, %c32_i32_32) : i32
      %c64_i32_33 = arith.constant 64 : i32
      aiex.npu.rtp_write(@mha_rtpss_1_stage2, 1, %c64_i32_33) : i32
      %c4096_i32_34 = arith.constant 4096 : i32
      aiex.npu.rtp_write(@mha_rtpss_1_stage2, 2, %c4096_i32_34) : i32
      %c4096_i32_35 = arith.constant 4096 : i32
      aiex.npu.rtp_write(@mha_rtpss_1_stage2, 3, %c4096_i32_35) : i32
      aiex.set_lock(%lock_0_2, 1)
      aiex.set_lock(%lock_1_2, 1)
      aiex.set_lock(%lock_0_3, 1)
      aiex.set_lock(%lock_1_3, 1)
      aiex.set_lock(%lock_0_4, 1)
      aiex.set_lock(%lock_1_4, 1)
      %0 = aiex.dma_configure_task_for @inQ {
        aie.dma_bd(%arg0 : memref<1x4096x64xbf16> offset = 0 len = 8192 sizes = [1, 1, 128, 64] strides = [0, 0, 64, 1])
        aie.end
      }
      aiex.dma_start_task(%0)
      %1 = aiex.dma_configure_task_for @inK {
        aie.dma_bd(%arg1 : memref<1x262144xbf16> offset = 0 len = 262144 sizes = [1, 1, 1, 262144] strides = [0, 0, 0, 1])
        aie.end
      }
      aiex.dma_start_task(%1)
      %2 = aiex.dma_configure_task_for @inV {
        aie.dma_bd(%arg2 : memref<1x262144xbf16> offset = 0 len = 262144 sizes = [1, 1, 1, 262144] strides = [0, 0, 0, 1])
        aie.end
      }
      aiex.dma_start_task(%2)
      %3 = aiex.dma_configure_task_for @memO {
        aie.dma_bd(%arg3 : memref<1x4096x64xbf16> offset = 0 len = 8192 sizes = [1, 1, 128, 64] strides = [0, 0, 64, 1])
        aie.end
      } {issue_token = true}
      aiex.dma_start_task(%3)
      aiex.dma_await_task(%3)
      aiex.dma_free_task(%0)
      aiex.dma_free_task(%1)
      aiex.dma_free_task(%2)
      aiex.dma_free_task(%3)
      %4 = aiex.dma_configure_task_for @inQ {
        aie.dma_bd(%arg0 : memref<1x4096x64xbf16> offset = 8192 len = 8192 sizes = [1, 1, 128, 64] strides = [0, 0, 64, 1])
        aie.end
      }
      aiex.dma_start_task(%4)
      %5 = aiex.dma_configure_task_for @inK {
        aie.dma_bd(%arg1 : memref<1x262144xbf16> offset = 0 len = 262144 sizes = [1, 1, 1, 262144] strides = [0, 0, 0, 1])
        aie.end
      }
      aiex.dma_start_task(%5)
      %6 = aiex.dma_configure_task_for @inV {
        aie.dma_bd(%arg2 : memref<1x262144xbf16> offset = 0 len = 262144 sizes = [1, 1, 1, 262144] strides = [0, 0, 0, 1])
        aie.end
      }
      aiex.dma_start_task(%6)
      %7 = aiex.dma_configure_task_for @memO {
        aie.dma_bd(%arg3 : memref<1x4096x64xbf16> offset = 8192 len = 8192 sizes = [1, 1, 128, 64] strides = [0, 0, 64, 1])
        aie.end
      } {issue_token = true}
      aiex.dma_start_task(%7)
      aiex.dma_await_task(%7)
      aiex.dma_free_task(%4)
      aiex.dma_free_task(%5)
      aiex.dma_free_task(%6)
      aiex.dma_free_task(%7)
      %8 = aiex.dma_configure_task_for @inQ {
        aie.dma_bd(%arg0 : memref<1x4096x64xbf16> offset = 16384 len = 8192 sizes = [1, 1, 128, 64] strides = [0, 0, 64, 1])
        aie.end
      }
      aiex.dma_start_task(%8)
      %9 = aiex.dma_configure_task_for @inK {
        aie.dma_bd(%arg1 : memref<1x262144xbf16> offset = 0 len = 262144 sizes = [1, 1, 1, 262144] strides = [0, 0, 0, 1])
        aie.end
      }
      aiex.dma_start_task(%9)
      %10 = aiex.dma_configure_task_for @inV {
        aie.dma_bd(%arg2 : memref<1x262144xbf16> offset = 0 len = 262144 sizes = [1, 1, 1, 262144] strides = [0, 0, 0, 1])
        aie.end
      }
      aiex.dma_start_task(%10)
      %11 = aiex.dma_configure_task_for @memO {
        aie.dma_bd(%arg3 : memref<1x4096x64xbf16> offset = 16384 len = 8192 sizes = [1, 1, 128, 64] strides = [0, 0, 64, 1])
        aie.end
      } {issue_token = true}
      aiex.dma_start_task(%11)
      aiex.dma_await_task(%11)
      aiex.dma_free_task(%8)
      aiex.dma_free_task(%9)
      aiex.dma_free_task(%10)
      aiex.dma_free_task(%11)
      %12 = aiex.dma_configure_task_for @inQ {
        aie.dma_bd(%arg0 : memref<1x4096x64xbf16> offset = 24576 len = 8192 sizes = [1, 1, 128, 64] strides = [0, 0, 64, 1])
        aie.end
      }
      aiex.dma_start_task(%12)
      %13 = aiex.dma_configure_task_for @inK {
        aie.dma_bd(%arg1 : memref<1x262144xbf16> offset = 0 len = 262144 sizes = [1, 1, 1, 262144] strides = [0, 0, 0, 1])
        aie.end
      }
      aiex.dma_start_task(%13)
      %14 = aiex.dma_configure_task_for @inV {
        aie.dma_bd(%arg2 : memref<1x262144xbf16> offset = 0 len = 262144 sizes = [1, 1, 1, 262144] strides = [0, 0, 0, 1])
        aie.end
      }
      aiex.dma_start_task(%14)
      %15 = aiex.dma_configure_task_for @memO {
        aie.dma_bd(%arg3 : memref<1x4096x64xbf16> offset = 24576 len = 8192 sizes = [1, 1, 128, 64] strides = [0, 0, 64, 1])
        aie.end
      } {issue_token = true}
      aiex.dma_start_task(%15)
      aiex.dma_await_task(%15)
      aiex.dma_free_task(%12)
      aiex.dma_free_task(%13)
      aiex.dma_free_task(%14)
      aiex.dma_free_task(%15)
      %16 = aiex.dma_configure_task_for @inQ {
        aie.dma_bd(%arg0 : memref<1x4096x64xbf16> offset = 32768 len = 8192 sizes = [1, 1, 128, 64] strides = [0, 0, 64, 1])
        aie.end
      }
      aiex.dma_start_task(%16)
      %17 = aiex.dma_configure_task_for @inK {
        aie.dma_bd(%arg1 : memref<1x262144xbf16> offset = 0 len = 262144 sizes = [1, 1, 1, 262144] strides = [0, 0, 0, 1])
        aie.end
      }
      aiex.dma_start_task(%17)
      %18 = aiex.dma_configure_task_for @inV {
        aie.dma_bd(%arg2 : memref<1x262144xbf16> offset = 0 len = 262144 sizes = [1, 1, 1, 262144] strides = [0, 0, 0, 1])
        aie.end
      }
      aiex.dma_start_task(%18)
      %19 = aiex.dma_configure_task_for @memO {
        aie.dma_bd(%arg3 : memref<1x4096x64xbf16> offset = 32768 len = 8192 sizes = [1, 1, 128, 64] strides = [0, 0, 64, 1])
        aie.end
      } {issue_token = true}
      aiex.dma_start_task(%19)
      aiex.dma_await_task(%19)
      aiex.dma_free_task(%16)
      aiex.dma_free_task(%17)
      aiex.dma_free_task(%18)
      aiex.dma_free_task(%19)
      %20 = aiex.dma_configure_task_for @inQ {
        aie.dma_bd(%arg0 : memref<1x4096x64xbf16> offset = 40960 len = 8192 sizes = [1, 1, 128, 64] strides = [0, 0, 64, 1])
        aie.end
      }
      aiex.dma_start_task(%20)
      %21 = aiex.dma_configure_task_for @inK {
        aie.dma_bd(%arg1 : memref<1x262144xbf16> offset = 0 len = 262144 sizes = [1, 1, 1, 262144] strides = [0, 0, 0, 1])
        aie.end
      }
      aiex.dma_start_task(%21)
      %22 = aiex.dma_configure_task_for @inV {
        aie.dma_bd(%arg2 : memref<1x262144xbf16> offset = 0 len = 262144 sizes = [1, 1, 1, 262144] strides = [0, 0, 0, 1])
        aie.end
      }
      aiex.dma_start_task(%22)
      %23 = aiex.dma_configure_task_for @memO {
        aie.dma_bd(%arg3 : memref<1x4096x64xbf16> offset = 40960 len = 8192 sizes = [1, 1, 128, 64] strides = [0, 0, 64, 1])
        aie.end
      } {issue_token = true}
      aiex.dma_start_task(%23)
      aiex.dma_await_task(%23)
      aiex.dma_free_task(%20)
      aiex.dma_free_task(%21)
      aiex.dma_free_task(%22)
      aiex.dma_free_task(%23)
      %24 = aiex.dma_configure_task_for @inQ {
        aie.dma_bd(%arg0 : memref<1x4096x64xbf16> offset = 49152 len = 8192 sizes = [1, 1, 128, 64] strides = [0, 0, 64, 1])
        aie.end
      }
      aiex.dma_start_task(%24)
      %25 = aiex.dma_configure_task_for @inK {
        aie.dma_bd(%arg1 : memref<1x262144xbf16> offset = 0 len = 262144 sizes = [1, 1, 1, 262144] strides = [0, 0, 0, 1])
        aie.end
      }
      aiex.dma_start_task(%25)
      %26 = aiex.dma_configure_task_for @inV {
        aie.dma_bd(%arg2 : memref<1x262144xbf16> offset = 0 len = 262144 sizes = [1, 1, 1, 262144] strides = [0, 0, 0, 1])
        aie.end
      }
      aiex.dma_start_task(%26)
      %27 = aiex.dma_configure_task_for @memO {
        aie.dma_bd(%arg3 : memref<1x4096x64xbf16> offset = 49152 len = 8192 sizes = [1, 1, 128, 64] strides = [0, 0, 64, 1])
        aie.end
      } {issue_token = true}
      aiex.dma_start_task(%27)
      aiex.dma_await_task(%27)
      aiex.dma_free_task(%24)
      aiex.dma_free_task(%25)
      aiex.dma_free_task(%26)
      aiex.dma_free_task(%27)
      %28 = aiex.dma_configure_task_for @inQ {
        aie.dma_bd(%arg0 : memref<1x4096x64xbf16> offset = 57344 len = 8192 sizes = [1, 1, 128, 64] strides = [0, 0, 64, 1])
        aie.end
      }
      aiex.dma_start_task(%28)
      %29 = aiex.dma_configure_task_for @inK {
        aie.dma_bd(%arg1 : memref<1x262144xbf16> offset = 0 len = 262144 sizes = [1, 1, 1, 262144] strides = [0, 0, 0, 1])
        aie.end
      }
      aiex.dma_start_task(%29)
      %30 = aiex.dma_configure_task_for @inV {
        aie.dma_bd(%arg2 : memref<1x262144xbf16> offset = 0 len = 262144 sizes = [1, 1, 1, 262144] strides = [0, 0, 0, 1])
        aie.end
      }
      aiex.dma_start_task(%30)
      %31 = aiex.dma_configure_task_for @memO {
        aie.dma_bd(%arg3 : memref<1x4096x64xbf16> offset = 57344 len = 8192 sizes = [1, 1, 128, 64] strides = [0, 0, 64, 1])
        aie.end
      } {issue_token = true}
      aiex.dma_start_task(%31)
      aiex.dma_await_task(%31)
      aiex.dma_free_task(%28)
      aiex.dma_free_task(%29)
      aiex.dma_free_task(%30)
      aiex.dma_free_task(%31)
      %32 = aiex.dma_configure_task_for @inQ {
        aie.dma_bd(%arg0 : memref<1x4096x64xbf16> offset = 65536 len = 8192 sizes = [1, 1, 128, 64] strides = [0, 0, 64, 1])
        aie.end
      }
      aiex.dma_start_task(%32)
      %33 = aiex.dma_configure_task_for @inK {
        aie.dma_bd(%arg1 : memref<1x262144xbf16> offset = 0 len = 262144 sizes = [1, 1, 1, 262144] strides = [0, 0, 0, 1])
        aie.end
      }
      aiex.dma_start_task(%33)
      %34 = aiex.dma_configure_task_for @inV {
        aie.dma_bd(%arg2 : memref<1x262144xbf16> offset = 0 len = 262144 sizes = [1, 1, 1, 262144] strides = [0, 0, 0, 1])
        aie.end
      }
      aiex.dma_start_task(%34)
      %35 = aiex.dma_configure_task_for @memO {
        aie.dma_bd(%arg3 : memref<1x4096x64xbf16> offset = 65536 len = 8192 sizes = [1, 1, 128, 64] strides = [0, 0, 64, 1])
        aie.end
      } {issue_token = true}
      aiex.dma_start_task(%35)
      aiex.dma_await_task(%35)
      aiex.dma_free_task(%32)
      aiex.dma_free_task(%33)
      aiex.dma_free_task(%34)
      aiex.dma_free_task(%35)
      %36 = aiex.dma_configure_task_for @inQ {
        aie.dma_bd(%arg0 : memref<1x4096x64xbf16> offset = 73728 len = 8192 sizes = [1, 1, 128, 64] strides = [0, 0, 64, 1])
        aie.end
      }
      aiex.dma_start_task(%36)
      %37 = aiex.dma_configure_task_for @inK {
        aie.dma_bd(%arg1 : memref<1x262144xbf16> offset = 0 len = 262144 sizes = [1, 1, 1, 262144] strides = [0, 0, 0, 1])
        aie.end
      }
      aiex.dma_start_task(%37)
      %38 = aiex.dma_configure_task_for @inV {
        aie.dma_bd(%arg2 : memref<1x262144xbf16> offset = 0 len = 262144 sizes = [1, 1, 1, 262144] strides = [0, 0, 0, 1])
        aie.end
      }
      aiex.dma_start_task(%38)
      %39 = aiex.dma_configure_task_for @memO {
        aie.dma_bd(%arg3 : memref<1x4096x64xbf16> offset = 73728 len = 8192 sizes = [1, 1, 128, 64] strides = [0, 0, 64, 1])
        aie.end
      } {issue_token = true}
      aiex.dma_start_task(%39)
      aiex.dma_await_task(%39)
      aiex.dma_free_task(%36)
      aiex.dma_free_task(%37)
      aiex.dma_free_task(%38)
      aiex.dma_free_task(%39)
      %40 = aiex.dma_configure_task_for @inQ {
        aie.dma_bd(%arg0 : memref<1x4096x64xbf16> offset = 81920 len = 8192 sizes = [1, 1, 128, 64] strides = [0, 0, 64, 1])
        aie.end
      }
      aiex.dma_start_task(%40)
      %41 = aiex.dma_configure_task_for @inK {
        aie.dma_bd(%arg1 : memref<1x262144xbf16> offset = 0 len = 262144 sizes = [1, 1, 1, 262144] strides = [0, 0, 0, 1])
        aie.end
      }
      aiex.dma_start_task(%41)
      %42 = aiex.dma_configure_task_for @inV {
        aie.dma_bd(%arg2 : memref<1x262144xbf16> offset = 0 len = 262144 sizes = [1, 1, 1, 262144] strides = [0, 0, 0, 1])
        aie.end
      }
      aiex.dma_start_task(%42)
      %43 = aiex.dma_configure_task_for @memO {
        aie.dma_bd(%arg3 : memref<1x4096x64xbf16> offset = 81920 len = 8192 sizes = [1, 1, 128, 64] strides = [0, 0, 64, 1])
        aie.end
      } {issue_token = true}
      aiex.dma_start_task(%43)
      aiex.dma_await_task(%43)
      aiex.dma_free_task(%40)
      aiex.dma_free_task(%41)
      aiex.dma_free_task(%42)
      aiex.dma_free_task(%43)
      %44 = aiex.dma_configure_task_for @inQ {
        aie.dma_bd(%arg0 : memref<1x4096x64xbf16> offset = 90112 len = 8192 sizes = [1, 1, 128, 64] strides = [0, 0, 64, 1])
        aie.end
      }
      aiex.dma_start_task(%44)
      %45 = aiex.dma_configure_task_for @inK {
        aie.dma_bd(%arg1 : memref<1x262144xbf16> offset = 0 len = 262144 sizes = [1, 1, 1, 262144] strides = [0, 0, 0, 1])
        aie.end
      }
      aiex.dma_start_task(%45)
      %46 = aiex.dma_configure_task_for @inV {
        aie.dma_bd(%arg2 : memref<1x262144xbf16> offset = 0 len = 262144 sizes = [1, 1, 1, 262144] strides = [0, 0, 0, 1])
        aie.end
      }
      aiex.dma_start_task(%46)
      %47 = aiex.dma_configure_task_for @memO {
        aie.dma_bd(%arg3 : memref<1x4096x64xbf16> offset = 90112 len = 8192 sizes = [1, 1, 128, 64] strides = [0, 0, 64, 1])
        aie.end
      } {issue_token = true}
      aiex.dma_start_task(%47)
      aiex.dma_await_task(%47)
      aiex.dma_free_task(%44)
      aiex.dma_free_task(%45)
      aiex.dma_free_task(%46)
      aiex.dma_free_task(%47)
      %48 = aiex.dma_configure_task_for @inQ {
        aie.dma_bd(%arg0 : memref<1x4096x64xbf16> offset = 98304 len = 8192 sizes = [1, 1, 128, 64] strides = [0, 0, 64, 1])
        aie.end
      }
      aiex.dma_start_task(%48)
      %49 = aiex.dma_configure_task_for @inK {
        aie.dma_bd(%arg1 : memref<1x262144xbf16> offset = 0 len = 262144 sizes = [1, 1, 1, 262144] strides = [0, 0, 0, 1])
        aie.end
      }
      aiex.dma_start_task(%49)
      %50 = aiex.dma_configure_task_for @inV {
        aie.dma_bd(%arg2 : memref<1x262144xbf16> offset = 0 len = 262144 sizes = [1, 1, 1, 262144] strides = [0, 0, 0, 1])
        aie.end
      }
      aiex.dma_start_task(%50)
      %51 = aiex.dma_configure_task_for @memO {
        aie.dma_bd(%arg3 : memref<1x4096x64xbf16> offset = 98304 len = 8192 sizes = [1, 1, 128, 64] strides = [0, 0, 64, 1])
        aie.end
      } {issue_token = true}
      aiex.dma_start_task(%51)
      aiex.dma_await_task(%51)
      aiex.dma_free_task(%48)
      aiex.dma_free_task(%49)
      aiex.dma_free_task(%50)
      aiex.dma_free_task(%51)
      %52 = aiex.dma_configure_task_for @inQ {
        aie.dma_bd(%arg0 : memref<1x4096x64xbf16> offset = 106496 len = 8192 sizes = [1, 1, 128, 64] strides = [0, 0, 64, 1])
        aie.end
      }
      aiex.dma_start_task(%52)
      %53 = aiex.dma_configure_task_for @inK {
        aie.dma_bd(%arg1 : memref<1x262144xbf16> offset = 0 len = 262144 sizes = [1, 1, 1, 262144] strides = [0, 0, 0, 1])
        aie.end
      }
      aiex.dma_start_task(%53)
      %54 = aiex.dma_configure_task_for @inV {
        aie.dma_bd(%arg2 : memref<1x262144xbf16> offset = 0 len = 262144 sizes = [1, 1, 1, 262144] strides = [0, 0, 0, 1])
        aie.end
      }
      aiex.dma_start_task(%54)
      %55 = aiex.dma_configure_task_for @memO {
        aie.dma_bd(%arg3 : memref<1x4096x64xbf16> offset = 106496 len = 8192 sizes = [1, 1, 128, 64] strides = [0, 0, 64, 1])
        aie.end
      } {issue_token = true}
      aiex.dma_start_task(%55)
      aiex.dma_await_task(%55)
      aiex.dma_free_task(%52)
      aiex.dma_free_task(%53)
      aiex.dma_free_task(%54)
      aiex.dma_free_task(%55)
      %56 = aiex.dma_configure_task_for @inQ {
        aie.dma_bd(%arg0 : memref<1x4096x64xbf16> offset = 114688 len = 8192 sizes = [1, 1, 128, 64] strides = [0, 0, 64, 1])
        aie.end
      }
      aiex.dma_start_task(%56)
      %57 = aiex.dma_configure_task_for @inK {
        aie.dma_bd(%arg1 : memref<1x262144xbf16> offset = 0 len = 262144 sizes = [1, 1, 1, 262144] strides = [0, 0, 0, 1])
        aie.end
      }
      aiex.dma_start_task(%57)
      %58 = aiex.dma_configure_task_for @inV {
        aie.dma_bd(%arg2 : memref<1x262144xbf16> offset = 0 len = 262144 sizes = [1, 1, 1, 262144] strides = [0, 0, 0, 1])
        aie.end
      }
      aiex.dma_start_task(%58)
      %59 = aiex.dma_configure_task_for @memO {
        aie.dma_bd(%arg3 : memref<1x4096x64xbf16> offset = 114688 len = 8192 sizes = [1, 1, 128, 64] strides = [0, 0, 64, 1])
        aie.end
      } {issue_token = true}
      aiex.dma_start_task(%59)
      aiex.dma_await_task(%59)
      aiex.dma_free_task(%56)
      aiex.dma_free_task(%57)
      aiex.dma_free_task(%58)
      aiex.dma_free_task(%59)
      %60 = aiex.dma_configure_task_for @inQ {
        aie.dma_bd(%arg0 : memref<1x4096x64xbf16> offset = 122880 len = 8192 sizes = [1, 1, 128, 64] strides = [0, 0, 64, 1])
        aie.end
      }
      aiex.dma_start_task(%60)
      %61 = aiex.dma_configure_task_for @inK {
        aie.dma_bd(%arg1 : memref<1x262144xbf16> offset = 0 len = 262144 sizes = [1, 1, 1, 262144] strides = [0, 0, 0, 1])
        aie.end
      }
      aiex.dma_start_task(%61)
      %62 = aiex.dma_configure_task_for @inV {
        aie.dma_bd(%arg2 : memref<1x262144xbf16> offset = 0 len = 262144 sizes = [1, 1, 1, 262144] strides = [0, 0, 0, 1])
        aie.end
      }
      aiex.dma_start_task(%62)
      %63 = aiex.dma_configure_task_for @memO {
        aie.dma_bd(%arg3 : memref<1x4096x64xbf16> offset = 122880 len = 8192 sizes = [1, 1, 128, 64] strides = [0, 0, 64, 1])
        aie.end
      } {issue_token = true}
      aiex.dma_start_task(%63)
      aiex.dma_await_task(%63)
      aiex.dma_free_task(%60)
      aiex.dma_free_task(%61)
      aiex.dma_free_task(%62)
      aiex.dma_free_task(%63)
      %64 = aiex.dma_configure_task_for @inQ {
        aie.dma_bd(%arg0 : memref<1x4096x64xbf16> offset = 131072 len = 8192 sizes = [1, 1, 128, 64] strides = [0, 0, 64, 1])
        aie.end
      }
      aiex.dma_start_task(%64)
      %65 = aiex.dma_configure_task_for @inK {
        aie.dma_bd(%arg1 : memref<1x262144xbf16> offset = 0 len = 262144 sizes = [1, 1, 1, 262144] strides = [0, 0, 0, 1])
        aie.end
      }
      aiex.dma_start_task(%65)
      %66 = aiex.dma_configure_task_for @inV {
        aie.dma_bd(%arg2 : memref<1x262144xbf16> offset = 0 len = 262144 sizes = [1, 1, 1, 262144] strides = [0, 0, 0, 1])
        aie.end
      }
      aiex.dma_start_task(%66)
      %67 = aiex.dma_configure_task_for @memO {
        aie.dma_bd(%arg3 : memref<1x4096x64xbf16> offset = 131072 len = 8192 sizes = [1, 1, 128, 64] strides = [0, 0, 64, 1])
        aie.end
      } {issue_token = true}
      aiex.dma_start_task(%67)
      aiex.dma_await_task(%67)
      aiex.dma_free_task(%64)
      aiex.dma_free_task(%65)
      aiex.dma_free_task(%66)
      aiex.dma_free_task(%67)
      %68 = aiex.dma_configure_task_for @inQ {
        aie.dma_bd(%arg0 : memref<1x4096x64xbf16> offset = 139264 len = 8192 sizes = [1, 1, 128, 64] strides = [0, 0, 64, 1])
        aie.end
      }
      aiex.dma_start_task(%68)
      %69 = aiex.dma_configure_task_for @inK {
        aie.dma_bd(%arg1 : memref<1x262144xbf16> offset = 0 len = 262144 sizes = [1, 1, 1, 262144] strides = [0, 0, 0, 1])
        aie.end
      }
      aiex.dma_start_task(%69)
      %70 = aiex.dma_configure_task_for @inV {
        aie.dma_bd(%arg2 : memref<1x262144xbf16> offset = 0 len = 262144 sizes = [1, 1, 1, 262144] strides = [0, 0, 0, 1])
        aie.end
      }
      aiex.dma_start_task(%70)
      %71 = aiex.dma_configure_task_for @memO {
        aie.dma_bd(%arg3 : memref<1x4096x64xbf16> offset = 139264 len = 8192 sizes = [1, 1, 128, 64] strides = [0, 0, 64, 1])
        aie.end
      } {issue_token = true}
      aiex.dma_start_task(%71)
      aiex.dma_await_task(%71)
      aiex.dma_free_task(%68)
      aiex.dma_free_task(%69)
      aiex.dma_free_task(%70)
      aiex.dma_free_task(%71)
      %72 = aiex.dma_configure_task_for @inQ {
        aie.dma_bd(%arg0 : memref<1x4096x64xbf16> offset = 147456 len = 8192 sizes = [1, 1, 128, 64] strides = [0, 0, 64, 1])
        aie.end
      }
      aiex.dma_start_task(%72)
      %73 = aiex.dma_configure_task_for @inK {
        aie.dma_bd(%arg1 : memref<1x262144xbf16> offset = 0 len = 262144 sizes = [1, 1, 1, 262144] strides = [0, 0, 0, 1])
        aie.end
      }
      aiex.dma_start_task(%73)
      %74 = aiex.dma_configure_task_for @inV {
        aie.dma_bd(%arg2 : memref<1x262144xbf16> offset = 0 len = 262144 sizes = [1, 1, 1, 262144] strides = [0, 0, 0, 1])
        aie.end
      }
      aiex.dma_start_task(%74)
      %75 = aiex.dma_configure_task_for @memO {
        aie.dma_bd(%arg3 : memref<1x4096x64xbf16> offset = 147456 len = 8192 sizes = [1, 1, 128, 64] strides = [0, 0, 64, 1])
        aie.end
      } {issue_token = true}
      aiex.dma_start_task(%75)
      aiex.dma_await_task(%75)
      aiex.dma_free_task(%72)
      aiex.dma_free_task(%73)
      aiex.dma_free_task(%74)
      aiex.dma_free_task(%75)
      %76 = aiex.dma_configure_task_for @inQ {
        aie.dma_bd(%arg0 : memref<1x4096x64xbf16> offset = 155648 len = 8192 sizes = [1, 1, 128, 64] strides = [0, 0, 64, 1])
        aie.end
      }
      aiex.dma_start_task(%76)
      %77 = aiex.dma_configure_task_for @inK {
        aie.dma_bd(%arg1 : memref<1x262144xbf16> offset = 0 len = 262144 sizes = [1, 1, 1, 262144] strides = [0, 0, 0, 1])
        aie.end
      }
      aiex.dma_start_task(%77)
      %78 = aiex.dma_configure_task_for @inV {
        aie.dma_bd(%arg2 : memref<1x262144xbf16> offset = 0 len = 262144 sizes = [1, 1, 1, 262144] strides = [0, 0, 0, 1])
        aie.end
      }
      aiex.dma_start_task(%78)
      %79 = aiex.dma_configure_task_for @memO {
        aie.dma_bd(%arg3 : memref<1x4096x64xbf16> offset = 155648 len = 8192 sizes = [1, 1, 128, 64] strides = [0, 0, 64, 1])
        aie.end
      } {issue_token = true}
      aiex.dma_start_task(%79)
      aiex.dma_await_task(%79)
      aiex.dma_free_task(%76)
      aiex.dma_free_task(%77)
      aiex.dma_free_task(%78)
      aiex.dma_free_task(%79)
      %80 = aiex.dma_configure_task_for @inQ {
        aie.dma_bd(%arg0 : memref<1x4096x64xbf16> offset = 163840 len = 8192 sizes = [1, 1, 128, 64] strides = [0, 0, 64, 1])
        aie.end
      }
      aiex.dma_start_task(%80)
      %81 = aiex.dma_configure_task_for @inK {
        aie.dma_bd(%arg1 : memref<1x262144xbf16> offset = 0 len = 262144 sizes = [1, 1, 1, 262144] strides = [0, 0, 0, 1])
        aie.end
      }
      aiex.dma_start_task(%81)
      %82 = aiex.dma_configure_task_for @inV {
        aie.dma_bd(%arg2 : memref<1x262144xbf16> offset = 0 len = 262144 sizes = [1, 1, 1, 262144] strides = [0, 0, 0, 1])
        aie.end
      }
      aiex.dma_start_task(%82)
      %83 = aiex.dma_configure_task_for @memO {
        aie.dma_bd(%arg3 : memref<1x4096x64xbf16> offset = 163840 len = 8192 sizes = [1, 1, 128, 64] strides = [0, 0, 64, 1])
        aie.end
      } {issue_token = true}
      aiex.dma_start_task(%83)
      aiex.dma_await_task(%83)
      aiex.dma_free_task(%80)
      aiex.dma_free_task(%81)
      aiex.dma_free_task(%82)
      aiex.dma_free_task(%83)
      %84 = aiex.dma_configure_task_for @inQ {
        aie.dma_bd(%arg0 : memref<1x4096x64xbf16> offset = 172032 len = 8192 sizes = [1, 1, 128, 64] strides = [0, 0, 64, 1])
        aie.end
      }
      aiex.dma_start_task(%84)
      %85 = aiex.dma_configure_task_for @inK {
        aie.dma_bd(%arg1 : memref<1x262144xbf16> offset = 0 len = 262144 sizes = [1, 1, 1, 262144] strides = [0, 0, 0, 1])
        aie.end
      }
      aiex.dma_start_task(%85)
      %86 = aiex.dma_configure_task_for @inV {
        aie.dma_bd(%arg2 : memref<1x262144xbf16> offset = 0 len = 262144 sizes = [1, 1, 1, 262144] strides = [0, 0, 0, 1])
        aie.end
      }
      aiex.dma_start_task(%86)
      %87 = aiex.dma_configure_task_for @memO {
        aie.dma_bd(%arg3 : memref<1x4096x64xbf16> offset = 172032 len = 8192 sizes = [1, 1, 128, 64] strides = [0, 0, 64, 1])
        aie.end
      } {issue_token = true}
      aiex.dma_start_task(%87)
      aiex.dma_await_task(%87)
      aiex.dma_free_task(%84)
      aiex.dma_free_task(%85)
      aiex.dma_free_task(%86)
      aiex.dma_free_task(%87)
      %88 = aiex.dma_configure_task_for @inQ {
        aie.dma_bd(%arg0 : memref<1x4096x64xbf16> offset = 180224 len = 8192 sizes = [1, 1, 128, 64] strides = [0, 0, 64, 1])
        aie.end
      }
      aiex.dma_start_task(%88)
      %89 = aiex.dma_configure_task_for @inK {
        aie.dma_bd(%arg1 : memref<1x262144xbf16> offset = 0 len = 262144 sizes = [1, 1, 1, 262144] strides = [0, 0, 0, 1])
        aie.end
      }
      aiex.dma_start_task(%89)
      %90 = aiex.dma_configure_task_for @inV {
        aie.dma_bd(%arg2 : memref<1x262144xbf16> offset = 0 len = 262144 sizes = [1, 1, 1, 262144] strides = [0, 0, 0, 1])
        aie.end
      }
      aiex.dma_start_task(%90)
      %91 = aiex.dma_configure_task_for @memO {
        aie.dma_bd(%arg3 : memref<1x4096x64xbf16> offset = 180224 len = 8192 sizes = [1, 1, 128, 64] strides = [0, 0, 64, 1])
        aie.end
      } {issue_token = true}
      aiex.dma_start_task(%91)
      aiex.dma_await_task(%91)
      aiex.dma_free_task(%88)
      aiex.dma_free_task(%89)
      aiex.dma_free_task(%90)
      aiex.dma_free_task(%91)
      %92 = aiex.dma_configure_task_for @inQ {
        aie.dma_bd(%arg0 : memref<1x4096x64xbf16> offset = 188416 len = 8192 sizes = [1, 1, 128, 64] strides = [0, 0, 64, 1])
        aie.end
      }
      aiex.dma_start_task(%92)
      %93 = aiex.dma_configure_task_for @inK {
        aie.dma_bd(%arg1 : memref<1x262144xbf16> offset = 0 len = 262144 sizes = [1, 1, 1, 262144] strides = [0, 0, 0, 1])
        aie.end
      }
      aiex.dma_start_task(%93)
      %94 = aiex.dma_configure_task_for @inV {
        aie.dma_bd(%arg2 : memref<1x262144xbf16> offset = 0 len = 262144 sizes = [1, 1, 1, 262144] strides = [0, 0, 0, 1])
        aie.end
      }
      aiex.dma_start_task(%94)
      %95 = aiex.dma_configure_task_for @memO {
        aie.dma_bd(%arg3 : memref<1x4096x64xbf16> offset = 188416 len = 8192 sizes = [1, 1, 128, 64] strides = [0, 0, 64, 1])
        aie.end
      } {issue_token = true}
      aiex.dma_start_task(%95)
      aiex.dma_await_task(%95)
      aiex.dma_free_task(%92)
      aiex.dma_free_task(%93)
      aiex.dma_free_task(%94)
      aiex.dma_free_task(%95)
      %96 = aiex.dma_configure_task_for @inQ {
        aie.dma_bd(%arg0 : memref<1x4096x64xbf16> offset = 196608 len = 8192 sizes = [1, 1, 128, 64] strides = [0, 0, 64, 1])
        aie.end
      }
      aiex.dma_start_task(%96)
      %97 = aiex.dma_configure_task_for @inK {
        aie.dma_bd(%arg1 : memref<1x262144xbf16> offset = 0 len = 262144 sizes = [1, 1, 1, 262144] strides = [0, 0, 0, 1])
        aie.end
      }
      aiex.dma_start_task(%97)
      %98 = aiex.dma_configure_task_for @inV {
        aie.dma_bd(%arg2 : memref<1x262144xbf16> offset = 0 len = 262144 sizes = [1, 1, 1, 262144] strides = [0, 0, 0, 1])
        aie.end
      }
      aiex.dma_start_task(%98)
      %99 = aiex.dma_configure_task_for @memO {
        aie.dma_bd(%arg3 : memref<1x4096x64xbf16> offset = 196608 len = 8192 sizes = [1, 1, 128, 64] strides = [0, 0, 64, 1])
        aie.end
      } {issue_token = true}
      aiex.dma_start_task(%99)
      aiex.dma_await_task(%99)
      aiex.dma_free_task(%96)
      aiex.dma_free_task(%97)
      aiex.dma_free_task(%98)
      aiex.dma_free_task(%99)
      %100 = aiex.dma_configure_task_for @inQ {
        aie.dma_bd(%arg0 : memref<1x4096x64xbf16> offset = 204800 len = 8192 sizes = [1, 1, 128, 64] strides = [0, 0, 64, 1])
        aie.end
      }
      aiex.dma_start_task(%100)
      %101 = aiex.dma_configure_task_for @inK {
        aie.dma_bd(%arg1 : memref<1x262144xbf16> offset = 0 len = 262144 sizes = [1, 1, 1, 262144] strides = [0, 0, 0, 1])
        aie.end
      }
      aiex.dma_start_task(%101)
      %102 = aiex.dma_configure_task_for @inV {
        aie.dma_bd(%arg2 : memref<1x262144xbf16> offset = 0 len = 262144 sizes = [1, 1, 1, 262144] strides = [0, 0, 0, 1])
        aie.end
      }
      aiex.dma_start_task(%102)
      %103 = aiex.dma_configure_task_for @memO {
        aie.dma_bd(%arg3 : memref<1x4096x64xbf16> offset = 204800 len = 8192 sizes = [1, 1, 128, 64] strides = [0, 0, 64, 1])
        aie.end
      } {issue_token = true}
      aiex.dma_start_task(%103)
      aiex.dma_await_task(%103)
      aiex.dma_free_task(%100)
      aiex.dma_free_task(%101)
      aiex.dma_free_task(%102)
      aiex.dma_free_task(%103)
      %104 = aiex.dma_configure_task_for @inQ {
        aie.dma_bd(%arg0 : memref<1x4096x64xbf16> offset = 212992 len = 8192 sizes = [1, 1, 128, 64] strides = [0, 0, 64, 1])
        aie.end
      }
      aiex.dma_start_task(%104)
      %105 = aiex.dma_configure_task_for @inK {
        aie.dma_bd(%arg1 : memref<1x262144xbf16> offset = 0 len = 262144 sizes = [1, 1, 1, 262144] strides = [0, 0, 0, 1])
        aie.end
      }
      aiex.dma_start_task(%105)
      %106 = aiex.dma_configure_task_for @inV {
        aie.dma_bd(%arg2 : memref<1x262144xbf16> offset = 0 len = 262144 sizes = [1, 1, 1, 262144] strides = [0, 0, 0, 1])
        aie.end
      }
      aiex.dma_start_task(%106)
      %107 = aiex.dma_configure_task_for @memO {
        aie.dma_bd(%arg3 : memref<1x4096x64xbf16> offset = 212992 len = 8192 sizes = [1, 1, 128, 64] strides = [0, 0, 64, 1])
        aie.end
      } {issue_token = true}
      aiex.dma_start_task(%107)
      aiex.dma_await_task(%107)
      aiex.dma_free_task(%104)
      aiex.dma_free_task(%105)
      aiex.dma_free_task(%106)
      aiex.dma_free_task(%107)
      %108 = aiex.dma_configure_task_for @inQ {
        aie.dma_bd(%arg0 : memref<1x4096x64xbf16> offset = 221184 len = 8192 sizes = [1, 1, 128, 64] strides = [0, 0, 64, 1])
        aie.end
      }
      aiex.dma_start_task(%108)
      %109 = aiex.dma_configure_task_for @inK {
        aie.dma_bd(%arg1 : memref<1x262144xbf16> offset = 0 len = 262144 sizes = [1, 1, 1, 262144] strides = [0, 0, 0, 1])
        aie.end
      }
      aiex.dma_start_task(%109)
      %110 = aiex.dma_configure_task_for @inV {
        aie.dma_bd(%arg2 : memref<1x262144xbf16> offset = 0 len = 262144 sizes = [1, 1, 1, 262144] strides = [0, 0, 0, 1])
        aie.end
      }
      aiex.dma_start_task(%110)
      %111 = aiex.dma_configure_task_for @memO {
        aie.dma_bd(%arg3 : memref<1x4096x64xbf16> offset = 221184 len = 8192 sizes = [1, 1, 128, 64] strides = [0, 0, 64, 1])
        aie.end
      } {issue_token = true}
      aiex.dma_start_task(%111)
      aiex.dma_await_task(%111)
      aiex.dma_free_task(%108)
      aiex.dma_free_task(%109)
      aiex.dma_free_task(%110)
      aiex.dma_free_task(%111)
      %112 = aiex.dma_configure_task_for @inQ {
        aie.dma_bd(%arg0 : memref<1x4096x64xbf16> offset = 229376 len = 8192 sizes = [1, 1, 128, 64] strides = [0, 0, 64, 1])
        aie.end
      }
      aiex.dma_start_task(%112)
      %113 = aiex.dma_configure_task_for @inK {
        aie.dma_bd(%arg1 : memref<1x262144xbf16> offset = 0 len = 262144 sizes = [1, 1, 1, 262144] strides = [0, 0, 0, 1])
        aie.end
      }
      aiex.dma_start_task(%113)
      %114 = aiex.dma_configure_task_for @inV {
        aie.dma_bd(%arg2 : memref<1x262144xbf16> offset = 0 len = 262144 sizes = [1, 1, 1, 262144] strides = [0, 0, 0, 1])
        aie.end
      }
      aiex.dma_start_task(%114)
      %115 = aiex.dma_configure_task_for @memO {
        aie.dma_bd(%arg3 : memref<1x4096x64xbf16> offset = 229376 len = 8192 sizes = [1, 1, 128, 64] strides = [0, 0, 64, 1])
        aie.end
      } {issue_token = true}
      aiex.dma_start_task(%115)
      aiex.dma_await_task(%115)
      aiex.dma_free_task(%112)
      aiex.dma_free_task(%113)
      aiex.dma_free_task(%114)
      aiex.dma_free_task(%115)
      %116 = aiex.dma_configure_task_for @inQ {
        aie.dma_bd(%arg0 : memref<1x4096x64xbf16> offset = 237568 len = 8192 sizes = [1, 1, 128, 64] strides = [0, 0, 64, 1])
        aie.end
      }
      aiex.dma_start_task(%116)
      %117 = aiex.dma_configure_task_for @inK {
        aie.dma_bd(%arg1 : memref<1x262144xbf16> offset = 0 len = 262144 sizes = [1, 1, 1, 262144] strides = [0, 0, 0, 1])
        aie.end
      }
      aiex.dma_start_task(%117)
      %118 = aiex.dma_configure_task_for @inV {
        aie.dma_bd(%arg2 : memref<1x262144xbf16> offset = 0 len = 262144 sizes = [1, 1, 1, 262144] strides = [0, 0, 0, 1])
        aie.end
      }
      aiex.dma_start_task(%118)
      %119 = aiex.dma_configure_task_for @memO {
        aie.dma_bd(%arg3 : memref<1x4096x64xbf16> offset = 237568 len = 8192 sizes = [1, 1, 128, 64] strides = [0, 0, 64, 1])
        aie.end
      } {issue_token = true}
      aiex.dma_start_task(%119)
      aiex.dma_await_task(%119)
      aiex.dma_free_task(%116)
      aiex.dma_free_task(%117)
      aiex.dma_free_task(%118)
      aiex.dma_free_task(%119)
      %120 = aiex.dma_configure_task_for @inQ {
        aie.dma_bd(%arg0 : memref<1x4096x64xbf16> offset = 245760 len = 8192 sizes = [1, 1, 128, 64] strides = [0, 0, 64, 1])
        aie.end
      }
      aiex.dma_start_task(%120)
      %121 = aiex.dma_configure_task_for @inK {
        aie.dma_bd(%arg1 : memref<1x262144xbf16> offset = 0 len = 262144 sizes = [1, 1, 1, 262144] strides = [0, 0, 0, 1])
        aie.end
      }
      aiex.dma_start_task(%121)
      %122 = aiex.dma_configure_task_for @inV {
        aie.dma_bd(%arg2 : memref<1x262144xbf16> offset = 0 len = 262144 sizes = [1, 1, 1, 262144] strides = [0, 0, 0, 1])
        aie.end
      }
      aiex.dma_start_task(%122)
      %123 = aiex.dma_configure_task_for @memO {
        aie.dma_bd(%arg3 : memref<1x4096x64xbf16> offset = 245760 len = 8192 sizes = [1, 1, 128, 64] strides = [0, 0, 64, 1])
        aie.end
      } {issue_token = true}
      aiex.dma_start_task(%123)
      aiex.dma_await_task(%123)
      aiex.dma_free_task(%120)
      aiex.dma_free_task(%121)
      aiex.dma_free_task(%122)
      aiex.dma_free_task(%123)
      %124 = aiex.dma_configure_task_for @inQ {
        aie.dma_bd(%arg0 : memref<1x4096x64xbf16> offset = 253952 len = 8192 sizes = [1, 1, 128, 64] strides = [0, 0, 64, 1])
        aie.end
      }
      aiex.dma_start_task(%124)
      %125 = aiex.dma_configure_task_for @inK {
        aie.dma_bd(%arg1 : memref<1x262144xbf16> offset = 0 len = 262144 sizes = [1, 1, 1, 262144] strides = [0, 0, 0, 1])
        aie.end
      }
      aiex.dma_start_task(%125)
      %126 = aiex.dma_configure_task_for @inV {
        aie.dma_bd(%arg2 : memref<1x262144xbf16> offset = 0 len = 262144 sizes = [1, 1, 1, 262144] strides = [0, 0, 0, 1])
        aie.end
      }
      aiex.dma_start_task(%126)
      %127 = aiex.dma_configure_task_for @memO {
        aie.dma_bd(%arg3 : memref<1x4096x64xbf16> offset = 253952 len = 8192 sizes = [1, 1, 128, 64] strides = [0, 0, 64, 1])
        aie.end
      } {issue_token = true}
      aiex.dma_start_task(%127)
      aiex.dma_await_task(%127)
      aiex.dma_free_task(%124)
      aiex.dma_free_task(%125)
      aiex.dma_free_task(%126)
      aiex.dma_free_task(%127)
    }
  }
}
