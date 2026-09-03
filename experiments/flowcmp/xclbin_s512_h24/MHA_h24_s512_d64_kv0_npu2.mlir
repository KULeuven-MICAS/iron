module {
  aie.device(npu2) {
    %logical_core = aie.logical_tile<CoreTile>(0, 2)
    %logical_core_0 = aie.logical_tile<CoreTile>(1, 2)
    %logical_core_1 = aie.logical_tile<CoreTile>(2, 2)
    %logical_core_2 = aie.logical_tile<CoreTile>(3, 2)
    %logical_core_3 = aie.logical_tile<CoreTile>(4, 2)
    %logical_core_4 = aie.logical_tile<CoreTile>(5, 2)
    %logical_core_5 = aie.logical_tile<CoreTile>(6, 2)
    %logical_core_6 = aie.logical_tile<CoreTile>(7, 2)
    %logical_core_7 = aie.logical_tile<CoreTile>(0, 3)
    %logical_core_8 = aie.logical_tile<CoreTile>(1, 3)
    %logical_core_9 = aie.logical_tile<CoreTile>(2, 3)
    %logical_core_10 = aie.logical_tile<CoreTile>(3, 3)
    %logical_core_11 = aie.logical_tile<CoreTile>(4, 3)
    %logical_core_12 = aie.logical_tile<CoreTile>(5, 3)
    %logical_core_13 = aie.logical_tile<CoreTile>(6, 3)
    %logical_core_14 = aie.logical_tile<CoreTile>(7, 3)
    %logical_core_15 = aie.logical_tile<CoreTile>(0, 4)
    %logical_core_16 = aie.logical_tile<CoreTile>(1, 4)
    %logical_core_17 = aie.logical_tile<CoreTile>(2, 4)
    %logical_core_18 = aie.logical_tile<CoreTile>(3, 4)
    %logical_core_19 = aie.logical_tile<CoreTile>(4, 4)
    %logical_core_20 = aie.logical_tile<CoreTile>(5, 4)
    %logical_core_21 = aie.logical_tile<CoreTile>(6, 4)
    %logical_core_22 = aie.logical_tile<CoreTile>(7, 4)
    %logical_shim_noc = aie.logical_tile<ShimNOCTile>(5, 0)
    %logical_mem = aie.logical_tile<MemTile>(3, 1)
    %logical_shim_noc_23 = aie.logical_tile<ShimNOCTile>(4, 0)
    %logical_mem_24 = aie.logical_tile<MemTile>(6, 1)
    %logical_shim_noc_25 = aie.logical_tile<ShimNOCTile>(4, 0)
    %logical_mem_26 = aie.logical_tile<MemTile>(7, 1)
    %logical_shim_noc_27 = aie.logical_tile<ShimNOCTile>(6, 0)
    %logical_mem_28 = aie.logical_tile<MemTile>(4, 1)
    %logical_mem_29 = aie.logical_tile<MemTile>(?, ?)
    %logical_mem_30 = aie.logical_tile<MemTile>(?, ?)
    %logical_mem_31 = aie.logical_tile<MemTile>(?, ?)
    %logical_mem_32 = aie.logical_tile<MemTile>(?, ?)
    %logical_mem_33 = aie.logical_tile<MemTile>(?, ?)
    %logical_mem_34 = aie.logical_tile<MemTile>(?, ?)
    %logical_mem_35 = aie.logical_tile<MemTile>(?, ?)
    %logical_mem_36 = aie.logical_tile<MemTile>(?, ?)
    %logical_mem_37 = aie.logical_tile<MemTile>(6, 1)
    %logical_shim_noc_38 = aie.logical_tile<ShimNOCTile>(7, 0)
    %logical_mem_39 = aie.logical_tile<MemTile>(7, 1)
    %logical_shim_noc_40 = aie.logical_tile<ShimNOCTile>(7, 0)
    %logical_mem_41 = aie.logical_tile<MemTile>(?, ?)
    %logical_mem_42 = aie.logical_tile<MemTile>(?, ?)
    %logical_mem_43 = aie.logical_tile<MemTile>(?, ?)
    %logical_mem_44 = aie.logical_tile<MemTile>(?, ?)
    %logical_mem_45 = aie.logical_tile<MemTile>(?, ?)
    %logical_mem_46 = aie.logical_tile<MemTile>(?, ?)
    %logical_mem_47 = aie.logical_tile<MemTile>(?, ?)
    %logical_mem_48 = aie.logical_tile<MemTile>(?, ?)
    aie.objectfifo @inK(%logical_shim_noc, {%logical_mem}, 2 : i32) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @memK(%logical_mem dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%logical_core, %logical_core_0, %logical_core_1, %logical_core_2, %logical_core_3, %logical_core_4, %logical_core_5, %logical_core_6}, 2 : i32) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo.link [@inK] -> [@memK]([] [0])
    aie.objectfifo @inQ(%logical_shim_noc_23, {%logical_mem_24}, 2 : i32) : !aie.objectfifo<memref<256x64xbf16>>  
    aie.objectfifo @memQ0(%logical_mem_24 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%logical_core}, 2 : i32) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @memQ1(%logical_mem_24 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%logical_core_0}, 2 : i32) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @memQ2(%logical_mem_24 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%logical_core_1}, 2 : i32) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @memQ3(%logical_mem_24 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%logical_core_2}, 2 : i32) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo.link [@inQ] -> [@memQ0, @memQ1, @memQ2, @memQ3]([] [0, 4096, 8192, 12288])
    aie.objectfifo @inQ2(%logical_shim_noc_25, {%logical_mem_26}, 2 : i32) : !aie.objectfifo<memref<256x64xbf16>>  
    aie.objectfifo @memQ20(%logical_mem_26 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%logical_core_3}, 2 : i32) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @memQ21(%logical_mem_26 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%logical_core_4}, 2 : i32) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @memQ22(%logical_mem_26 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%logical_core_5}, 2 : i32) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @memQ23(%logical_mem_26 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%logical_core_6}, 2 : i32) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo.link [@inQ2] -> [@memQ20, @memQ21, @memQ22, @memQ23]([] [0, 4096, 8192, 12288])
    aie.objectfifo @inV(%logical_shim_noc_27, {%logical_mem_28}, 2 : i32) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @memV(%logical_mem_28 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%logical_core_15, %logical_core_16, %logical_core_17, %logical_core_18, %logical_core_19, %logical_core_20, %logical_core_21, %logical_core_22}, 2 : i32) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo.link [@inV] -> [@memV]([] [0])
    aie.objectfifo @memA0(%logical_core, {%logical_mem_29}, 2 : i32) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @outA0(%logical_mem_29 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%logical_core_7}, 2 : i32) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo.link [@memA0] -> [@outA0]([] [0])
    aie.objectfifo @memA1(%logical_core_0, {%logical_mem_30}, 2 : i32) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @outA1(%logical_mem_30 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%logical_core_8}, 2 : i32) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo.link [@memA1] -> [@outA1]([] [0])
    aie.objectfifo @memA2(%logical_core_1, {%logical_mem_31}, 2 : i32) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @outA2(%logical_mem_31 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%logical_core_9}, 2 : i32) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo.link [@memA2] -> [@outA2]([] [0])
    aie.objectfifo @memA3(%logical_core_2, {%logical_mem_32}, 2 : i32) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @outA3(%logical_mem_32 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%logical_core_10}, 2 : i32) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo.link [@memA3] -> [@outA3]([] [0])
    aie.objectfifo @memA4(%logical_core_3, {%logical_mem_33}, 2 : i32) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @outA4(%logical_mem_33 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%logical_core_11}, 2 : i32) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo.link [@memA4] -> [@outA4]([] [0])
    aie.objectfifo @memA5(%logical_core_4, {%logical_mem_34}, 2 : i32) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @outA5(%logical_mem_34 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%logical_core_12}, 2 : i32) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo.link [@memA5] -> [@outA5]([] [0])
    aie.objectfifo @memA6(%logical_core_5, {%logical_mem_35}, 2 : i32) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @outA6(%logical_mem_35 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%logical_core_13}, 2 : i32) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo.link [@memA6] -> [@outA6]([] [0])
    aie.objectfifo @memA7(%logical_core_6, {%logical_mem_36}, 2 : i32) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @outA7(%logical_mem_36 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%logical_core_14}, 2 : i32) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo.link [@memA7] -> [@outA7]([] [0])
    aie.objectfifo @memO(%logical_mem_37 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%logical_shim_noc_38}, 2 : i32) : !aie.objectfifo<memref<256x64xbf16>>  
    aie.objectfifo @outO0(%logical_core_15, {%logical_mem_37}, 2 : i32) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @outO1(%logical_core_16, {%logical_mem_37}, 2 : i32) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @outO2(%logical_core_17, {%logical_mem_37}, 2 : i32) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @outO3(%logical_core_18, {%logical_mem_37}, 2 : i32) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo.link [@outO0, @outO1, @outO2, @outO3] -> [@memO]([0, 4096, 8192, 12288] [])
    aie.objectfifo @memO2(%logical_mem_39 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%logical_shim_noc_40}, 2 : i32) : !aie.objectfifo<memref<256x64xbf16>>  
    aie.objectfifo @outO20(%logical_core_19, {%logical_mem_39}, 2 : i32) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @outO21(%logical_core_20, {%logical_mem_39}, 2 : i32) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @outO22(%logical_core_21, {%logical_mem_39}, 2 : i32) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @outO23(%logical_core_22, {%logical_mem_39}, 2 : i32) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo.link [@outO20, @outO21, @outO22, @outO23] -> [@memO2]([0, 4096, 8192, 12288] [])
    aie.objectfifo @memP0(%logical_core_7, {%logical_mem_41}, 2 : i32) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @outP0(%logical_mem_41 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%logical_core_15}, 2 : i32) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo.link [@memP0] -> [@outP0]([] [0])
    aie.objectfifo @memP1(%logical_core_8, {%logical_mem_42}, 2 : i32) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @outP1(%logical_mem_42 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%logical_core_16}, 2 : i32) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo.link [@memP1] -> [@outP1]([] [0])
    aie.objectfifo @memP2(%logical_core_9, {%logical_mem_43}, 2 : i32) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @outP2(%logical_mem_43 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%logical_core_17}, 2 : i32) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo.link [@memP2] -> [@outP2]([] [0])
    aie.objectfifo @memP3(%logical_core_10, {%logical_mem_44}, 2 : i32) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @outP3(%logical_mem_44 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%logical_core_18}, 2 : i32) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo.link [@memP3] -> [@outP3]([] [0])
    aie.objectfifo @memP4(%logical_core_11, {%logical_mem_45}, 2 : i32) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @outP4(%logical_mem_45 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%logical_core_19}, 2 : i32) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo.link [@memP4] -> [@outP4]([] [0])
    aie.objectfifo @memP5(%logical_core_12, {%logical_mem_46}, 2 : i32) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @outP5(%logical_mem_46 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%logical_core_20}, 2 : i32) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo.link [@memP5] -> [@outP5]([] [0])
    aie.objectfifo @memP6(%logical_core_13, {%logical_mem_47}, 2 : i32) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @outP6(%logical_mem_47 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%logical_core_21}, 2 : i32) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo.link [@memP6] -> [@outP6]([] [0])
    aie.objectfifo @memP7(%logical_core_14, {%logical_mem_48}, 2 : i32) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @outP7(%logical_mem_48 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%logical_core_22}, 2 : i32) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo.link [@memP7] -> [@outP7]([] [0])
    aie.objectfifo @scaleOF0(%logical_core_7, {%logical_core_15}, 2 : i32) : !aie.objectfifo<memref<256xbf16>>  
    aie.objectfifo @scaleOF1(%logical_core_8, {%logical_core_16}, 2 : i32) : !aie.objectfifo<memref<256xbf16>>  
    aie.objectfifo @scaleOF2(%logical_core_9, {%logical_core_17}, 2 : i32) : !aie.objectfifo<memref<256xbf16>>  
    aie.objectfifo @scaleOF3(%logical_core_10, {%logical_core_18}, 2 : i32) : !aie.objectfifo<memref<256xbf16>>  
    aie.objectfifo @scaleOF4(%logical_core_11, {%logical_core_19}, 2 : i32) : !aie.objectfifo<memref<256xbf16>>  
    aie.objectfifo @scaleOF5(%logical_core_12, {%logical_core_20}, 2 : i32) : !aie.objectfifo<memref<256xbf16>>  
    aie.objectfifo @scaleOF6(%logical_core_13, {%logical_core_21}, 2 : i32) : !aie.objectfifo<memref<256xbf16>>  
    aie.objectfifo @scaleOF7(%logical_core_14, {%logical_core_22}, 2 : i32) : !aie.objectfifo<memref<256xbf16>>  
    func.func private @zero_bf16(memref<64x64xbf16>) attributes {link_with = "mha.o"}
    func.func private @matmul_bf16_bf16_wrapper(memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>, memref<2xi32>) attributes {link_with = "mha.o"}
    %mha_rtpss_0_stage0 = aie.buffer(%logical_core) {sym_name = "mha_rtpss_0_stage0"} : memref<4xi32> 
    %idx_buffer_qk_0 = aie.buffer(%logical_core) {sym_name = "idx_buffer_qk_0"} : memref<2xi32> = dense<0>
    %mha_rtpss_1_stage0 = aie.buffer(%logical_core_0) {sym_name = "mha_rtpss_1_stage0"} : memref<4xi32> 
    %idx_buffer_qk_1 = aie.buffer(%logical_core_0) {sym_name = "idx_buffer_qk_1"} : memref<2xi32> = dense<0>
    %mha_rtpss_2_stage0 = aie.buffer(%logical_core_1) {sym_name = "mha_rtpss_2_stage0"} : memref<4xi32> 
    %idx_buffer_qk_2 = aie.buffer(%logical_core_1) {sym_name = "idx_buffer_qk_2"} : memref<2xi32> = dense<0>
    %mha_rtpss_3_stage0 = aie.buffer(%logical_core_2) {sym_name = "mha_rtpss_3_stage0"} : memref<4xi32> 
    %idx_buffer_qk_3 = aie.buffer(%logical_core_2) {sym_name = "idx_buffer_qk_3"} : memref<2xi32> = dense<0>
    %mha_rtpss_4_stage0 = aie.buffer(%logical_core_3) {sym_name = "mha_rtpss_4_stage0"} : memref<4xi32> 
    %idx_buffer_qk_4 = aie.buffer(%logical_core_3) {sym_name = "idx_buffer_qk_4"} : memref<2xi32> = dense<0>
    %mha_rtpss_5_stage0 = aie.buffer(%logical_core_4) {sym_name = "mha_rtpss_5_stage0"} : memref<4xi32> 
    %idx_buffer_qk_5 = aie.buffer(%logical_core_4) {sym_name = "idx_buffer_qk_5"} : memref<2xi32> = dense<0>
    %mha_rtpss_6_stage0 = aie.buffer(%logical_core_5) {sym_name = "mha_rtpss_6_stage0"} : memref<4xi32> 
    %idx_buffer_qk_6 = aie.buffer(%logical_core_5) {sym_name = "idx_buffer_qk_6"} : memref<2xi32> = dense<0>
    %mha_rtpss_7_stage0 = aie.buffer(%logical_core_6) {sym_name = "mha_rtpss_7_stage0"} : memref<4xi32> 
    %idx_buffer_qk_7 = aie.buffer(%logical_core_6) {sym_name = "idx_buffer_qk_7"} : memref<2xi32> = dense<0>
    func.func private @partial_softmax(memref<64x64xbf16>, memref<64x64xbf16>, memref<256xbf16>, memref<2xi32>, bf16, i32, i32, i32, i32) attributes {link_with = "mha.o"}
    func.func private @init_scale_buffer(memref<256xbf16>, i32) attributes {link_with = "mha.o"}
    func.func private @passThroughLine(memref<256xbf16>, memref<256xbf16>, i32) attributes {link_with = "mha_passThrough.o"}
    %mha_rtpss_0_stage1 = aie.buffer(%logical_core_7) {sym_name = "mha_rtpss_0_stage1"} : memref<4xi32> 
    %idx_buffer_softmax_0 = aie.buffer(%logical_core_7) {sym_name = "idx_buffer_softmax_0"} : memref<2xi32> = dense<0>
    %scale_buffer_softmax_0 = aie.buffer(%logical_core_7) {sym_name = "scale_buffer_softmax_0"} : memref<256xbf16> = dense<0.000000e+00>
    %mha_rtpss_1_stage1 = aie.buffer(%logical_core_8) {sym_name = "mha_rtpss_1_stage1"} : memref<4xi32> 
    %idx_buffer_softmax_1 = aie.buffer(%logical_core_8) {sym_name = "idx_buffer_softmax_1"} : memref<2xi32> = dense<0>
    %scale_buffer_softmax_1 = aie.buffer(%logical_core_8) {sym_name = "scale_buffer_softmax_1"} : memref<256xbf16> = dense<0.000000e+00>
    %mha_rtpss_2_stage1 = aie.buffer(%logical_core_9) {sym_name = "mha_rtpss_2_stage1"} : memref<4xi32> 
    %idx_buffer_softmax_2 = aie.buffer(%logical_core_9) {sym_name = "idx_buffer_softmax_2"} : memref<2xi32> = dense<0>
    %scale_buffer_softmax_2 = aie.buffer(%logical_core_9) {sym_name = "scale_buffer_softmax_2"} : memref<256xbf16> = dense<0.000000e+00>
    %mha_rtpss_3_stage1 = aie.buffer(%logical_core_10) {sym_name = "mha_rtpss_3_stage1"} : memref<4xi32> 
    %idx_buffer_softmax_3 = aie.buffer(%logical_core_10) {sym_name = "idx_buffer_softmax_3"} : memref<2xi32> = dense<0>
    %scale_buffer_softmax_3 = aie.buffer(%logical_core_10) {sym_name = "scale_buffer_softmax_3"} : memref<256xbf16> = dense<0.000000e+00>
    %mha_rtpss_4_stage1 = aie.buffer(%logical_core_11) {sym_name = "mha_rtpss_4_stage1"} : memref<4xi32> 
    %idx_buffer_softmax_4 = aie.buffer(%logical_core_11) {sym_name = "idx_buffer_softmax_4"} : memref<2xi32> = dense<0>
    %scale_buffer_softmax_4 = aie.buffer(%logical_core_11) {sym_name = "scale_buffer_softmax_4"} : memref<256xbf16> = dense<0.000000e+00>
    %mha_rtpss_5_stage1 = aie.buffer(%logical_core_12) {sym_name = "mha_rtpss_5_stage1"} : memref<4xi32> 
    %idx_buffer_softmax_5 = aie.buffer(%logical_core_12) {sym_name = "idx_buffer_softmax_5"} : memref<2xi32> = dense<0>
    %scale_buffer_softmax_5 = aie.buffer(%logical_core_12) {sym_name = "scale_buffer_softmax_5"} : memref<256xbf16> = dense<0.000000e+00>
    %mha_rtpss_6_stage1 = aie.buffer(%logical_core_13) {sym_name = "mha_rtpss_6_stage1"} : memref<4xi32> 
    %idx_buffer_softmax_6 = aie.buffer(%logical_core_13) {sym_name = "idx_buffer_softmax_6"} : memref<2xi32> = dense<0>
    %scale_buffer_softmax_6 = aie.buffer(%logical_core_13) {sym_name = "scale_buffer_softmax_6"} : memref<256xbf16> = dense<0.000000e+00>
    %mha_rtpss_7_stage1 = aie.buffer(%logical_core_14) {sym_name = "mha_rtpss_7_stage1"} : memref<4xi32> 
    %idx_buffer_softmax_7 = aie.buffer(%logical_core_14) {sym_name = "idx_buffer_softmax_7"} : memref<2xi32> = dense<0>
    %scale_buffer_softmax_7 = aie.buffer(%logical_core_14) {sym_name = "scale_buffer_softmax_7"} : memref<256xbf16> = dense<0.000000e+00>
    func.func private @matmul_PV(memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>, memref<256xbf16>, i32, i32, memref<2xi32>) attributes {link_with = "mha.o"}
    func.func private @rescale_O(memref<64x64xbf16>, memref<256xbf16>, i32, memref<2xi32>) attributes {link_with = "mha.o"}
    %mha_rtpss_0_stage2 = aie.buffer(%logical_core_15) {sym_name = "mha_rtpss_0_stage2"} : memref<4xi32> 
    %idx_buffer_pv_0 = aie.buffer(%logical_core_15) {sym_name = "idx_buffer_pv_0"} : memref<2xi32> = dense<0>
    %mha_rtpss_1_stage2 = aie.buffer(%logical_core_16) {sym_name = "mha_rtpss_1_stage2"} : memref<4xi32> 
    %idx_buffer_pv_1 = aie.buffer(%logical_core_16) {sym_name = "idx_buffer_pv_1"} : memref<2xi32> = dense<0>
    %mha_rtpss_2_stage2 = aie.buffer(%logical_core_17) {sym_name = "mha_rtpss_2_stage2"} : memref<4xi32> 
    %idx_buffer_pv_2 = aie.buffer(%logical_core_17) {sym_name = "idx_buffer_pv_2"} : memref<2xi32> = dense<0>
    %mha_rtpss_3_stage2 = aie.buffer(%logical_core_18) {sym_name = "mha_rtpss_3_stage2"} : memref<4xi32> 
    %idx_buffer_pv_3 = aie.buffer(%logical_core_18) {sym_name = "idx_buffer_pv_3"} : memref<2xi32> = dense<0>
    %mha_rtpss_4_stage2 = aie.buffer(%logical_core_19) {sym_name = "mha_rtpss_4_stage2"} : memref<4xi32> 
    %idx_buffer_pv_4 = aie.buffer(%logical_core_19) {sym_name = "idx_buffer_pv_4"} : memref<2xi32> = dense<0>
    %mha_rtpss_5_stage2 = aie.buffer(%logical_core_20) {sym_name = "mha_rtpss_5_stage2"} : memref<4xi32> 
    %idx_buffer_pv_5 = aie.buffer(%logical_core_20) {sym_name = "idx_buffer_pv_5"} : memref<2xi32> = dense<0>
    %mha_rtpss_6_stage2 = aie.buffer(%logical_core_21) {sym_name = "mha_rtpss_6_stage2"} : memref<4xi32> 
    %idx_buffer_pv_6 = aie.buffer(%logical_core_21) {sym_name = "idx_buffer_pv_6"} : memref<2xi32> = dense<0>
    %mha_rtpss_7_stage2 = aie.buffer(%logical_core_22) {sym_name = "mha_rtpss_7_stage2"} : memref<4xi32> 
    %idx_buffer_pv_7 = aie.buffer(%logical_core_22) {sym_name = "idx_buffer_pv_7"} : memref<2xi32> = dense<0>
    %lock_0_2 = aie.lock(%logical_core)
    %core_0_2 = aie.core(%logical_core) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c1_49 = arith.constant 1 : index
      scf.for %arg0 = %c0 to %c1 step %c1_49 {
        %c1_i32 = arith.constant 1 : i32
        aie.use_lock(%lock_0_2, Acquire, %c1_i32)
        %c0_50 = arith.constant 0 : index
        %0 = memref.load %mha_rtpss_0_stage0[%c0_50] : memref<4xi32>
        %c1_51 = arith.constant 1 : index
        %1 = memref.load %mha_rtpss_0_stage0[%c1_51] : memref<4xi32>
        %c0_52 = arith.constant 0 : index
        %c9223372036854775807 = arith.constant 9223372036854775807 : index
        %c1_53 = arith.constant 1 : index
        scf.for %arg1 = %c0_52 to %c9223372036854775807 step %c1_53 {
          %c0_54 = arith.constant 0 : index
          %c0_i32 = arith.constant 0 : i32
          memref.store %c0_i32, %idx_buffer_qk_0[%c0_54] : memref<2xi32>
          %c1_55 = arith.constant 1 : index
          %c0_i32_56 = arith.constant 0 : i32
          memref.store %c0_i32_56, %idx_buffer_qk_0[%c1_55] : memref<2xi32>
          %c0_57 = arith.constant 0 : index
          %2 = arith.index_cast %0 : i32 to index
          %c1_58 = arith.constant 1 : index
          scf.for %arg2 = %c0_57 to %2 step %c1_58 {
            %3 = aie.objectfifo.acquire @memQ0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %4 = aie.objectfifo.subview.access %3[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            %c0_59 = arith.constant 0 : index
            %5 = arith.index_cast %1 : i32 to index
            %c1_60 = arith.constant 1 : index
            scf.for %arg3 = %c0_59 to %5 step %c1_60 {
              %8 = aie.objectfifo.acquire @memK(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
              %9 = aie.objectfifo.subview.access %8[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
              %10 = aie.objectfifo.acquire @memA0(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
              %11 = aie.objectfifo.subview.access %10[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
              func.call @zero_bf16(%11) : (memref<64x64xbf16>) -> ()
              func.call @matmul_bf16_bf16_wrapper(%4, %9, %11, %idx_buffer_qk_0) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>, memref<2xi32>) -> ()
              aie.objectfifo.release @memK(Consume, 1)
              aie.objectfifo.release @memA0(Produce, 1)
              %c0_65 = arith.constant 0 : index
              %12 = memref.load %idx_buffer_qk_0[%c0_65] : memref<2xi32>
              %c1_i32_66 = arith.constant 1 : i32
              %13 = arith.addi %12, %c1_i32_66 : i32
              %c0_67 = arith.constant 0 : index
              memref.store %13, %idx_buffer_qk_0[%c0_67] : memref<2xi32>
            }
            %c0_61 = arith.constant 0 : index
            %c0_i32_62 = arith.constant 0 : i32
            memref.store %c0_i32_62, %idx_buffer_qk_0[%c0_61] : memref<2xi32>
            %c1_63 = arith.constant 1 : index
            %6 = memref.load %idx_buffer_qk_0[%c1_63] : memref<2xi32>
            %c8_i32 = arith.constant 8 : i32
            %7 = arith.addi %6, %c8_i32 : i32
            %c1_64 = arith.constant 1 : index
            memref.store %7, %idx_buffer_qk_0[%c1_64] : memref<2xi32>
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
      %c1_49 = arith.constant 1 : index
      scf.for %arg0 = %c0 to %c1 step %c1_49 {
        %c1_i32 = arith.constant 1 : i32
        aie.use_lock(%lock_1_2, Acquire, %c1_i32)
        %c0_50 = arith.constant 0 : index
        %0 = memref.load %mha_rtpss_1_stage0[%c0_50] : memref<4xi32>
        %c1_51 = arith.constant 1 : index
        %1 = memref.load %mha_rtpss_1_stage0[%c1_51] : memref<4xi32>
        %c0_52 = arith.constant 0 : index
        %c9223372036854775807 = arith.constant 9223372036854775807 : index
        %c1_53 = arith.constant 1 : index
        scf.for %arg1 = %c0_52 to %c9223372036854775807 step %c1_53 {
          %c0_54 = arith.constant 0 : index
          %c0_i32 = arith.constant 0 : i32
          memref.store %c0_i32, %idx_buffer_qk_1[%c0_54] : memref<2xi32>
          %c1_55 = arith.constant 1 : index
          %c1_i32_56 = arith.constant 1 : i32
          memref.store %c1_i32_56, %idx_buffer_qk_1[%c1_55] : memref<2xi32>
          %c0_57 = arith.constant 0 : index
          %2 = arith.index_cast %0 : i32 to index
          %c1_58 = arith.constant 1 : index
          scf.for %arg2 = %c0_57 to %2 step %c1_58 {
            %3 = aie.objectfifo.acquire @memQ1(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %4 = aie.objectfifo.subview.access %3[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            %c0_59 = arith.constant 0 : index
            %5 = arith.index_cast %1 : i32 to index
            %c1_60 = arith.constant 1 : index
            scf.for %arg3 = %c0_59 to %5 step %c1_60 {
              %8 = aie.objectfifo.acquire @memK(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
              %9 = aie.objectfifo.subview.access %8[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
              %10 = aie.objectfifo.acquire @memA1(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
              %11 = aie.objectfifo.subview.access %10[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
              func.call @zero_bf16(%11) : (memref<64x64xbf16>) -> ()
              func.call @matmul_bf16_bf16_wrapper(%4, %9, %11, %idx_buffer_qk_1) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>, memref<2xi32>) -> ()
              aie.objectfifo.release @memK(Consume, 1)
              aie.objectfifo.release @memA1(Produce, 1)
              %c0_65 = arith.constant 0 : index
              %12 = memref.load %idx_buffer_qk_1[%c0_65] : memref<2xi32>
              %c1_i32_66 = arith.constant 1 : i32
              %13 = arith.addi %12, %c1_i32_66 : i32
              %c0_67 = arith.constant 0 : index
              memref.store %13, %idx_buffer_qk_1[%c0_67] : memref<2xi32>
            }
            %c0_61 = arith.constant 0 : index
            %c0_i32_62 = arith.constant 0 : i32
            memref.store %c0_i32_62, %idx_buffer_qk_1[%c0_61] : memref<2xi32>
            %c1_63 = arith.constant 1 : index
            %6 = memref.load %idx_buffer_qk_1[%c1_63] : memref<2xi32>
            %c8_i32 = arith.constant 8 : i32
            %7 = arith.addi %6, %c8_i32 : i32
            %c1_64 = arith.constant 1 : index
            memref.store %7, %idx_buffer_qk_1[%c1_64] : memref<2xi32>
            aie.objectfifo.release @memQ1(Consume, 1)
          }
        }
      }
      aie.end
    } {stack_size = 3328 : i32}
    %lock_2_2 = aie.lock(%logical_core_1)
    %core_2_2 = aie.core(%logical_core_1) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c1_49 = arith.constant 1 : index
      scf.for %arg0 = %c0 to %c1 step %c1_49 {
        %c1_i32 = arith.constant 1 : i32
        aie.use_lock(%lock_2_2, Acquire, %c1_i32)
        %c0_50 = arith.constant 0 : index
        %0 = memref.load %mha_rtpss_2_stage0[%c0_50] : memref<4xi32>
        %c1_51 = arith.constant 1 : index
        %1 = memref.load %mha_rtpss_2_stage0[%c1_51] : memref<4xi32>
        %c0_52 = arith.constant 0 : index
        %c9223372036854775807 = arith.constant 9223372036854775807 : index
        %c1_53 = arith.constant 1 : index
        scf.for %arg1 = %c0_52 to %c9223372036854775807 step %c1_53 {
          %c0_54 = arith.constant 0 : index
          %c0_i32 = arith.constant 0 : i32
          memref.store %c0_i32, %idx_buffer_qk_2[%c0_54] : memref<2xi32>
          %c1_55 = arith.constant 1 : index
          %c2_i32 = arith.constant 2 : i32
          memref.store %c2_i32, %idx_buffer_qk_2[%c1_55] : memref<2xi32>
          %c0_56 = arith.constant 0 : index
          %2 = arith.index_cast %0 : i32 to index
          %c1_57 = arith.constant 1 : index
          scf.for %arg2 = %c0_56 to %2 step %c1_57 {
            %3 = aie.objectfifo.acquire @memQ2(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %4 = aie.objectfifo.subview.access %3[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            %c0_58 = arith.constant 0 : index
            %5 = arith.index_cast %1 : i32 to index
            %c1_59 = arith.constant 1 : index
            scf.for %arg3 = %c0_58 to %5 step %c1_59 {
              %8 = aie.objectfifo.acquire @memK(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
              %9 = aie.objectfifo.subview.access %8[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
              %10 = aie.objectfifo.acquire @memA2(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
              %11 = aie.objectfifo.subview.access %10[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
              func.call @zero_bf16(%11) : (memref<64x64xbf16>) -> ()
              func.call @matmul_bf16_bf16_wrapper(%4, %9, %11, %idx_buffer_qk_2) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>, memref<2xi32>) -> ()
              aie.objectfifo.release @memK(Consume, 1)
              aie.objectfifo.release @memA2(Produce, 1)
              %c0_64 = arith.constant 0 : index
              %12 = memref.load %idx_buffer_qk_2[%c0_64] : memref<2xi32>
              %c1_i32_65 = arith.constant 1 : i32
              %13 = arith.addi %12, %c1_i32_65 : i32
              %c0_66 = arith.constant 0 : index
              memref.store %13, %idx_buffer_qk_2[%c0_66] : memref<2xi32>
            }
            %c0_60 = arith.constant 0 : index
            %c0_i32_61 = arith.constant 0 : i32
            memref.store %c0_i32_61, %idx_buffer_qk_2[%c0_60] : memref<2xi32>
            %c1_62 = arith.constant 1 : index
            %6 = memref.load %idx_buffer_qk_2[%c1_62] : memref<2xi32>
            %c8_i32 = arith.constant 8 : i32
            %7 = arith.addi %6, %c8_i32 : i32
            %c1_63 = arith.constant 1 : index
            memref.store %7, %idx_buffer_qk_2[%c1_63] : memref<2xi32>
            aie.objectfifo.release @memQ2(Consume, 1)
          }
        }
      }
      aie.end
    } {stack_size = 3328 : i32}
    %lock_3_2 = aie.lock(%logical_core_2)
    %core_3_2 = aie.core(%logical_core_2) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c1_49 = arith.constant 1 : index
      scf.for %arg0 = %c0 to %c1 step %c1_49 {
        %c1_i32 = arith.constant 1 : i32
        aie.use_lock(%lock_3_2, Acquire, %c1_i32)
        %c0_50 = arith.constant 0 : index
        %0 = memref.load %mha_rtpss_3_stage0[%c0_50] : memref<4xi32>
        %c1_51 = arith.constant 1 : index
        %1 = memref.load %mha_rtpss_3_stage0[%c1_51] : memref<4xi32>
        %c0_52 = arith.constant 0 : index
        %c9223372036854775807 = arith.constant 9223372036854775807 : index
        %c1_53 = arith.constant 1 : index
        scf.for %arg1 = %c0_52 to %c9223372036854775807 step %c1_53 {
          %c0_54 = arith.constant 0 : index
          %c0_i32 = arith.constant 0 : i32
          memref.store %c0_i32, %idx_buffer_qk_3[%c0_54] : memref<2xi32>
          %c1_55 = arith.constant 1 : index
          %c3_i32 = arith.constant 3 : i32
          memref.store %c3_i32, %idx_buffer_qk_3[%c1_55] : memref<2xi32>
          %c0_56 = arith.constant 0 : index
          %2 = arith.index_cast %0 : i32 to index
          %c1_57 = arith.constant 1 : index
          scf.for %arg2 = %c0_56 to %2 step %c1_57 {
            %3 = aie.objectfifo.acquire @memQ3(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %4 = aie.objectfifo.subview.access %3[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            %c0_58 = arith.constant 0 : index
            %5 = arith.index_cast %1 : i32 to index
            %c1_59 = arith.constant 1 : index
            scf.for %arg3 = %c0_58 to %5 step %c1_59 {
              %8 = aie.objectfifo.acquire @memK(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
              %9 = aie.objectfifo.subview.access %8[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
              %10 = aie.objectfifo.acquire @memA3(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
              %11 = aie.objectfifo.subview.access %10[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
              func.call @zero_bf16(%11) : (memref<64x64xbf16>) -> ()
              func.call @matmul_bf16_bf16_wrapper(%4, %9, %11, %idx_buffer_qk_3) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>, memref<2xi32>) -> ()
              aie.objectfifo.release @memK(Consume, 1)
              aie.objectfifo.release @memA3(Produce, 1)
              %c0_64 = arith.constant 0 : index
              %12 = memref.load %idx_buffer_qk_3[%c0_64] : memref<2xi32>
              %c1_i32_65 = arith.constant 1 : i32
              %13 = arith.addi %12, %c1_i32_65 : i32
              %c0_66 = arith.constant 0 : index
              memref.store %13, %idx_buffer_qk_3[%c0_66] : memref<2xi32>
            }
            %c0_60 = arith.constant 0 : index
            %c0_i32_61 = arith.constant 0 : i32
            memref.store %c0_i32_61, %idx_buffer_qk_3[%c0_60] : memref<2xi32>
            %c1_62 = arith.constant 1 : index
            %6 = memref.load %idx_buffer_qk_3[%c1_62] : memref<2xi32>
            %c8_i32 = arith.constant 8 : i32
            %7 = arith.addi %6, %c8_i32 : i32
            %c1_63 = arith.constant 1 : index
            memref.store %7, %idx_buffer_qk_3[%c1_63] : memref<2xi32>
            aie.objectfifo.release @memQ3(Consume, 1)
          }
        }
      }
      aie.end
    } {stack_size = 3328 : i32}
    %lock_4_2 = aie.lock(%logical_core_3)
    %core_4_2 = aie.core(%logical_core_3) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c1_49 = arith.constant 1 : index
      scf.for %arg0 = %c0 to %c1 step %c1_49 {
        %c1_i32 = arith.constant 1 : i32
        aie.use_lock(%lock_4_2, Acquire, %c1_i32)
        %c0_50 = arith.constant 0 : index
        %0 = memref.load %mha_rtpss_4_stage0[%c0_50] : memref<4xi32>
        %c1_51 = arith.constant 1 : index
        %1 = memref.load %mha_rtpss_4_stage0[%c1_51] : memref<4xi32>
        %c0_52 = arith.constant 0 : index
        %c9223372036854775807 = arith.constant 9223372036854775807 : index
        %c1_53 = arith.constant 1 : index
        scf.for %arg1 = %c0_52 to %c9223372036854775807 step %c1_53 {
          %c0_54 = arith.constant 0 : index
          %c0_i32 = arith.constant 0 : i32
          memref.store %c0_i32, %idx_buffer_qk_4[%c0_54] : memref<2xi32>
          %c1_55 = arith.constant 1 : index
          %c4_i32 = arith.constant 4 : i32
          memref.store %c4_i32, %idx_buffer_qk_4[%c1_55] : memref<2xi32>
          %c0_56 = arith.constant 0 : index
          %2 = arith.index_cast %0 : i32 to index
          %c1_57 = arith.constant 1 : index
          scf.for %arg2 = %c0_56 to %2 step %c1_57 {
            %3 = aie.objectfifo.acquire @memQ20(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %4 = aie.objectfifo.subview.access %3[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            %c0_58 = arith.constant 0 : index
            %5 = arith.index_cast %1 : i32 to index
            %c1_59 = arith.constant 1 : index
            scf.for %arg3 = %c0_58 to %5 step %c1_59 {
              %8 = aie.objectfifo.acquire @memK(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
              %9 = aie.objectfifo.subview.access %8[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
              %10 = aie.objectfifo.acquire @memA4(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
              %11 = aie.objectfifo.subview.access %10[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
              func.call @zero_bf16(%11) : (memref<64x64xbf16>) -> ()
              func.call @matmul_bf16_bf16_wrapper(%4, %9, %11, %idx_buffer_qk_4) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>, memref<2xi32>) -> ()
              aie.objectfifo.release @memK(Consume, 1)
              aie.objectfifo.release @memA4(Produce, 1)
              %c0_64 = arith.constant 0 : index
              %12 = memref.load %idx_buffer_qk_4[%c0_64] : memref<2xi32>
              %c1_i32_65 = arith.constant 1 : i32
              %13 = arith.addi %12, %c1_i32_65 : i32
              %c0_66 = arith.constant 0 : index
              memref.store %13, %idx_buffer_qk_4[%c0_66] : memref<2xi32>
            }
            %c0_60 = arith.constant 0 : index
            %c0_i32_61 = arith.constant 0 : i32
            memref.store %c0_i32_61, %idx_buffer_qk_4[%c0_60] : memref<2xi32>
            %c1_62 = arith.constant 1 : index
            %6 = memref.load %idx_buffer_qk_4[%c1_62] : memref<2xi32>
            %c8_i32 = arith.constant 8 : i32
            %7 = arith.addi %6, %c8_i32 : i32
            %c1_63 = arith.constant 1 : index
            memref.store %7, %idx_buffer_qk_4[%c1_63] : memref<2xi32>
            aie.objectfifo.release @memQ20(Consume, 1)
          }
        }
      }
      aie.end
    } {stack_size = 3328 : i32}
    %lock_5_2 = aie.lock(%logical_core_4)
    %core_5_2 = aie.core(%logical_core_4) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c1_49 = arith.constant 1 : index
      scf.for %arg0 = %c0 to %c1 step %c1_49 {
        %c1_i32 = arith.constant 1 : i32
        aie.use_lock(%lock_5_2, Acquire, %c1_i32)
        %c0_50 = arith.constant 0 : index
        %0 = memref.load %mha_rtpss_5_stage0[%c0_50] : memref<4xi32>
        %c1_51 = arith.constant 1 : index
        %1 = memref.load %mha_rtpss_5_stage0[%c1_51] : memref<4xi32>
        %c0_52 = arith.constant 0 : index
        %c9223372036854775807 = arith.constant 9223372036854775807 : index
        %c1_53 = arith.constant 1 : index
        scf.for %arg1 = %c0_52 to %c9223372036854775807 step %c1_53 {
          %c0_54 = arith.constant 0 : index
          %c0_i32 = arith.constant 0 : i32
          memref.store %c0_i32, %idx_buffer_qk_5[%c0_54] : memref<2xi32>
          %c1_55 = arith.constant 1 : index
          %c5_i32 = arith.constant 5 : i32
          memref.store %c5_i32, %idx_buffer_qk_5[%c1_55] : memref<2xi32>
          %c0_56 = arith.constant 0 : index
          %2 = arith.index_cast %0 : i32 to index
          %c1_57 = arith.constant 1 : index
          scf.for %arg2 = %c0_56 to %2 step %c1_57 {
            %3 = aie.objectfifo.acquire @memQ21(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %4 = aie.objectfifo.subview.access %3[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            %c0_58 = arith.constant 0 : index
            %5 = arith.index_cast %1 : i32 to index
            %c1_59 = arith.constant 1 : index
            scf.for %arg3 = %c0_58 to %5 step %c1_59 {
              %8 = aie.objectfifo.acquire @memK(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
              %9 = aie.objectfifo.subview.access %8[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
              %10 = aie.objectfifo.acquire @memA5(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
              %11 = aie.objectfifo.subview.access %10[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
              func.call @zero_bf16(%11) : (memref<64x64xbf16>) -> ()
              func.call @matmul_bf16_bf16_wrapper(%4, %9, %11, %idx_buffer_qk_5) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>, memref<2xi32>) -> ()
              aie.objectfifo.release @memK(Consume, 1)
              aie.objectfifo.release @memA5(Produce, 1)
              %c0_64 = arith.constant 0 : index
              %12 = memref.load %idx_buffer_qk_5[%c0_64] : memref<2xi32>
              %c1_i32_65 = arith.constant 1 : i32
              %13 = arith.addi %12, %c1_i32_65 : i32
              %c0_66 = arith.constant 0 : index
              memref.store %13, %idx_buffer_qk_5[%c0_66] : memref<2xi32>
            }
            %c0_60 = arith.constant 0 : index
            %c0_i32_61 = arith.constant 0 : i32
            memref.store %c0_i32_61, %idx_buffer_qk_5[%c0_60] : memref<2xi32>
            %c1_62 = arith.constant 1 : index
            %6 = memref.load %idx_buffer_qk_5[%c1_62] : memref<2xi32>
            %c8_i32 = arith.constant 8 : i32
            %7 = arith.addi %6, %c8_i32 : i32
            %c1_63 = arith.constant 1 : index
            memref.store %7, %idx_buffer_qk_5[%c1_63] : memref<2xi32>
            aie.objectfifo.release @memQ21(Consume, 1)
          }
        }
      }
      aie.end
    } {stack_size = 3328 : i32}
    %lock_6_2 = aie.lock(%logical_core_5)
    %core_6_2 = aie.core(%logical_core_5) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c1_49 = arith.constant 1 : index
      scf.for %arg0 = %c0 to %c1 step %c1_49 {
        %c1_i32 = arith.constant 1 : i32
        aie.use_lock(%lock_6_2, Acquire, %c1_i32)
        %c0_50 = arith.constant 0 : index
        %0 = memref.load %mha_rtpss_6_stage0[%c0_50] : memref<4xi32>
        %c1_51 = arith.constant 1 : index
        %1 = memref.load %mha_rtpss_6_stage0[%c1_51] : memref<4xi32>
        %c0_52 = arith.constant 0 : index
        %c9223372036854775807 = arith.constant 9223372036854775807 : index
        %c1_53 = arith.constant 1 : index
        scf.for %arg1 = %c0_52 to %c9223372036854775807 step %c1_53 {
          %c0_54 = arith.constant 0 : index
          %c0_i32 = arith.constant 0 : i32
          memref.store %c0_i32, %idx_buffer_qk_6[%c0_54] : memref<2xi32>
          %c1_55 = arith.constant 1 : index
          %c6_i32 = arith.constant 6 : i32
          memref.store %c6_i32, %idx_buffer_qk_6[%c1_55] : memref<2xi32>
          %c0_56 = arith.constant 0 : index
          %2 = arith.index_cast %0 : i32 to index
          %c1_57 = arith.constant 1 : index
          scf.for %arg2 = %c0_56 to %2 step %c1_57 {
            %3 = aie.objectfifo.acquire @memQ22(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %4 = aie.objectfifo.subview.access %3[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            %c0_58 = arith.constant 0 : index
            %5 = arith.index_cast %1 : i32 to index
            %c1_59 = arith.constant 1 : index
            scf.for %arg3 = %c0_58 to %5 step %c1_59 {
              %8 = aie.objectfifo.acquire @memK(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
              %9 = aie.objectfifo.subview.access %8[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
              %10 = aie.objectfifo.acquire @memA6(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
              %11 = aie.objectfifo.subview.access %10[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
              func.call @zero_bf16(%11) : (memref<64x64xbf16>) -> ()
              func.call @matmul_bf16_bf16_wrapper(%4, %9, %11, %idx_buffer_qk_6) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>, memref<2xi32>) -> ()
              aie.objectfifo.release @memK(Consume, 1)
              aie.objectfifo.release @memA6(Produce, 1)
              %c0_64 = arith.constant 0 : index
              %12 = memref.load %idx_buffer_qk_6[%c0_64] : memref<2xi32>
              %c1_i32_65 = arith.constant 1 : i32
              %13 = arith.addi %12, %c1_i32_65 : i32
              %c0_66 = arith.constant 0 : index
              memref.store %13, %idx_buffer_qk_6[%c0_66] : memref<2xi32>
            }
            %c0_60 = arith.constant 0 : index
            %c0_i32_61 = arith.constant 0 : i32
            memref.store %c0_i32_61, %idx_buffer_qk_6[%c0_60] : memref<2xi32>
            %c1_62 = arith.constant 1 : index
            %6 = memref.load %idx_buffer_qk_6[%c1_62] : memref<2xi32>
            %c8_i32 = arith.constant 8 : i32
            %7 = arith.addi %6, %c8_i32 : i32
            %c1_63 = arith.constant 1 : index
            memref.store %7, %idx_buffer_qk_6[%c1_63] : memref<2xi32>
            aie.objectfifo.release @memQ22(Consume, 1)
          }
        }
      }
      aie.end
    } {stack_size = 3328 : i32}
    %lock_7_2 = aie.lock(%logical_core_6)
    %core_7_2 = aie.core(%logical_core_6) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c1_49 = arith.constant 1 : index
      scf.for %arg0 = %c0 to %c1 step %c1_49 {
        %c1_i32 = arith.constant 1 : i32
        aie.use_lock(%lock_7_2, Acquire, %c1_i32)
        %c0_50 = arith.constant 0 : index
        %0 = memref.load %mha_rtpss_7_stage0[%c0_50] : memref<4xi32>
        %c1_51 = arith.constant 1 : index
        %1 = memref.load %mha_rtpss_7_stage0[%c1_51] : memref<4xi32>
        %c0_52 = arith.constant 0 : index
        %c9223372036854775807 = arith.constant 9223372036854775807 : index
        %c1_53 = arith.constant 1 : index
        scf.for %arg1 = %c0_52 to %c9223372036854775807 step %c1_53 {
          %c0_54 = arith.constant 0 : index
          %c0_i32 = arith.constant 0 : i32
          memref.store %c0_i32, %idx_buffer_qk_7[%c0_54] : memref<2xi32>
          %c1_55 = arith.constant 1 : index
          %c7_i32 = arith.constant 7 : i32
          memref.store %c7_i32, %idx_buffer_qk_7[%c1_55] : memref<2xi32>
          %c0_56 = arith.constant 0 : index
          %2 = arith.index_cast %0 : i32 to index
          %c1_57 = arith.constant 1 : index
          scf.for %arg2 = %c0_56 to %2 step %c1_57 {
            %3 = aie.objectfifo.acquire @memQ23(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %4 = aie.objectfifo.subview.access %3[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            %c0_58 = arith.constant 0 : index
            %5 = arith.index_cast %1 : i32 to index
            %c1_59 = arith.constant 1 : index
            scf.for %arg3 = %c0_58 to %5 step %c1_59 {
              %8 = aie.objectfifo.acquire @memK(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
              %9 = aie.objectfifo.subview.access %8[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
              %10 = aie.objectfifo.acquire @memA7(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
              %11 = aie.objectfifo.subview.access %10[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
              func.call @zero_bf16(%11) : (memref<64x64xbf16>) -> ()
              func.call @matmul_bf16_bf16_wrapper(%4, %9, %11, %idx_buffer_qk_7) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>, memref<2xi32>) -> ()
              aie.objectfifo.release @memK(Consume, 1)
              aie.objectfifo.release @memA7(Produce, 1)
              %c0_64 = arith.constant 0 : index
              %12 = memref.load %idx_buffer_qk_7[%c0_64] : memref<2xi32>
              %c1_i32_65 = arith.constant 1 : i32
              %13 = arith.addi %12, %c1_i32_65 : i32
              %c0_66 = arith.constant 0 : index
              memref.store %13, %idx_buffer_qk_7[%c0_66] : memref<2xi32>
            }
            %c0_60 = arith.constant 0 : index
            %c0_i32_61 = arith.constant 0 : i32
            memref.store %c0_i32_61, %idx_buffer_qk_7[%c0_60] : memref<2xi32>
            %c1_62 = arith.constant 1 : index
            %6 = memref.load %idx_buffer_qk_7[%c1_62] : memref<2xi32>
            %c8_i32 = arith.constant 8 : i32
            %7 = arith.addi %6, %c8_i32 : i32
            %c1_63 = arith.constant 1 : index
            memref.store %7, %idx_buffer_qk_7[%c1_63] : memref<2xi32>
            aie.objectfifo.release @memQ23(Consume, 1)
          }
        }
      }
      aie.end
    } {stack_size = 3328 : i32}
    %lock_0_3 = aie.lock(%logical_core_7)
    %core_0_3 = aie.core(%logical_core_7) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c1_49 = arith.constant 1 : index
      scf.for %arg0 = %c0 to %c1 step %c1_49 {
        %c1_i32 = arith.constant 1 : i32
        aie.use_lock(%lock_0_3, Acquire, %c1_i32)
        %c0_50 = arith.constant 0 : index
        %0 = memref.load %mha_rtpss_0_stage1[%c0_50] : memref<4xi32>
        %c1_51 = arith.constant 1 : index
        %1 = memref.load %mha_rtpss_0_stage1[%c1_51] : memref<4xi32>
        %c2 = arith.constant 2 : index
        %2 = memref.load %mha_rtpss_0_stage1[%c2] : memref<4xi32>
        %c3 = arith.constant 3 : index
        %3 = memref.load %mha_rtpss_0_stage1[%c3] : memref<4xi32>
        %c0_52 = arith.constant 0 : index
        %c9223372036854775807 = arith.constant 9223372036854775807 : index
        %c1_53 = arith.constant 1 : index
        scf.for %arg1 = %c0_52 to %c9223372036854775807 step %c1_53 {
          %c0_54 = arith.constant 0 : index
          %c0_i32 = arith.constant 0 : i32
          memref.store %c0_i32, %idx_buffer_softmax_0[%c0_54] : memref<2xi32>
          %c1_55 = arith.constant 1 : index
          %c0_i32_56 = arith.constant 0 : i32
          memref.store %c0_i32_56, %idx_buffer_softmax_0[%c1_55] : memref<2xi32>
          %c0_57 = arith.constant 0 : index
          %4 = arith.index_cast %0 : i32 to index
          %c1_58 = arith.constant 1 : index
          scf.for %arg2 = %c0_57 to %4 step %c1_58 {
            %c64_i32 = arith.constant 64 : i32
            func.call @init_scale_buffer(%scale_buffer_softmax_0, %c64_i32) : (memref<256xbf16>, i32) -> ()
            %c0_59 = arith.constant 0 : index
            %5 = arith.index_cast %1 : i32 to index
            %c1_60 = arith.constant 1 : index
            scf.for %arg3 = %c0_59 to %5 step %c1_60 {
              %8 = aie.objectfifo.acquire @memP0(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
              %9 = aie.objectfifo.subview.access %8[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
              %10 = aie.objectfifo.acquire @outA0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
              %11 = aie.objectfifo.subview.access %10[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
              %12 = aie.objectfifo.acquire @scaleOF0(Produce, 1) : !aie.objectfifosubview<memref<256xbf16>>
              %13 = aie.objectfifo.subview.access %12[0] : !aie.objectfifosubview<memref<256xbf16>> -> memref<256xbf16>
              %cst = arith.constant 1.806640e-01 : bf16
              %c64_i32_65 = arith.constant 64 : i32
              %c64_i32_66 = arith.constant 64 : i32
              func.call @partial_softmax(%11, %9, %scale_buffer_softmax_0, %idx_buffer_softmax_0, %cst, %c64_i32_65, %c64_i32_66, %2, %3) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<256xbf16>, memref<2xi32>, bf16, i32, i32, i32, i32) -> ()
              %c256_i32 = arith.constant 256 : i32
              func.call @passThroughLine(%scale_buffer_softmax_0, %13, %c256_i32) : (memref<256xbf16>, memref<256xbf16>, i32) -> ()
              aie.objectfifo.release @outA0(Consume, 1)
              aie.objectfifo.release @memP0(Produce, 1)
              aie.objectfifo.release @scaleOF0(Produce, 1)
              %c0_67 = arith.constant 0 : index
              %14 = memref.load %idx_buffer_softmax_0[%c0_67] : memref<2xi32>
              %c1_i32_68 = arith.constant 1 : i32
              %15 = arith.addi %14, %c1_i32_68 : i32
              %c0_69 = arith.constant 0 : index
              memref.store %15, %idx_buffer_softmax_0[%c0_69] : memref<2xi32>
            }
            %c0_61 = arith.constant 0 : index
            %c0_i32_62 = arith.constant 0 : i32
            memref.store %c0_i32_62, %idx_buffer_softmax_0[%c0_61] : memref<2xi32>
            %c1_63 = arith.constant 1 : index
            %6 = memref.load %idx_buffer_softmax_0[%c1_63] : memref<2xi32>
            %c8_i32 = arith.constant 8 : i32
            %7 = arith.addi %6, %c8_i32 : i32
            %c1_64 = arith.constant 1 : index
            memref.store %7, %idx_buffer_softmax_0[%c1_64] : memref<2xi32>
          }
        }
      }
      aie.end
    } {stack_size = 3328 : i32}
    %lock_1_3 = aie.lock(%logical_core_8)
    %core_1_3 = aie.core(%logical_core_8) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c1_49 = arith.constant 1 : index
      scf.for %arg0 = %c0 to %c1 step %c1_49 {
        %c1_i32 = arith.constant 1 : i32
        aie.use_lock(%lock_1_3, Acquire, %c1_i32)
        %c0_50 = arith.constant 0 : index
        %0 = memref.load %mha_rtpss_1_stage1[%c0_50] : memref<4xi32>
        %c1_51 = arith.constant 1 : index
        %1 = memref.load %mha_rtpss_1_stage1[%c1_51] : memref<4xi32>
        %c2 = arith.constant 2 : index
        %2 = memref.load %mha_rtpss_1_stage1[%c2] : memref<4xi32>
        %c3 = arith.constant 3 : index
        %3 = memref.load %mha_rtpss_1_stage1[%c3] : memref<4xi32>
        %c0_52 = arith.constant 0 : index
        %c9223372036854775807 = arith.constant 9223372036854775807 : index
        %c1_53 = arith.constant 1 : index
        scf.for %arg1 = %c0_52 to %c9223372036854775807 step %c1_53 {
          %c0_54 = arith.constant 0 : index
          %c0_i32 = arith.constant 0 : i32
          memref.store %c0_i32, %idx_buffer_softmax_1[%c0_54] : memref<2xi32>
          %c1_55 = arith.constant 1 : index
          %c1_i32_56 = arith.constant 1 : i32
          memref.store %c1_i32_56, %idx_buffer_softmax_1[%c1_55] : memref<2xi32>
          %c0_57 = arith.constant 0 : index
          %4 = arith.index_cast %0 : i32 to index
          %c1_58 = arith.constant 1 : index
          scf.for %arg2 = %c0_57 to %4 step %c1_58 {
            %c64_i32 = arith.constant 64 : i32
            func.call @init_scale_buffer(%scale_buffer_softmax_1, %c64_i32) : (memref<256xbf16>, i32) -> ()
            %c0_59 = arith.constant 0 : index
            %5 = arith.index_cast %1 : i32 to index
            %c1_60 = arith.constant 1 : index
            scf.for %arg3 = %c0_59 to %5 step %c1_60 {
              %8 = aie.objectfifo.acquire @memP1(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
              %9 = aie.objectfifo.subview.access %8[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
              %10 = aie.objectfifo.acquire @outA1(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
              %11 = aie.objectfifo.subview.access %10[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
              %12 = aie.objectfifo.acquire @scaleOF1(Produce, 1) : !aie.objectfifosubview<memref<256xbf16>>
              %13 = aie.objectfifo.subview.access %12[0] : !aie.objectfifosubview<memref<256xbf16>> -> memref<256xbf16>
              %cst = arith.constant 1.806640e-01 : bf16
              %c64_i32_65 = arith.constant 64 : i32
              %c64_i32_66 = arith.constant 64 : i32
              func.call @partial_softmax(%11, %9, %scale_buffer_softmax_1, %idx_buffer_softmax_1, %cst, %c64_i32_65, %c64_i32_66, %2, %3) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<256xbf16>, memref<2xi32>, bf16, i32, i32, i32, i32) -> ()
              %c256_i32 = arith.constant 256 : i32
              func.call @passThroughLine(%scale_buffer_softmax_1, %13, %c256_i32) : (memref<256xbf16>, memref<256xbf16>, i32) -> ()
              aie.objectfifo.release @outA1(Consume, 1)
              aie.objectfifo.release @memP1(Produce, 1)
              aie.objectfifo.release @scaleOF1(Produce, 1)
              %c0_67 = arith.constant 0 : index
              %14 = memref.load %idx_buffer_softmax_1[%c0_67] : memref<2xi32>
              %c1_i32_68 = arith.constant 1 : i32
              %15 = arith.addi %14, %c1_i32_68 : i32
              %c0_69 = arith.constant 0 : index
              memref.store %15, %idx_buffer_softmax_1[%c0_69] : memref<2xi32>
            }
            %c0_61 = arith.constant 0 : index
            %c0_i32_62 = arith.constant 0 : i32
            memref.store %c0_i32_62, %idx_buffer_softmax_1[%c0_61] : memref<2xi32>
            %c1_63 = arith.constant 1 : index
            %6 = memref.load %idx_buffer_softmax_1[%c1_63] : memref<2xi32>
            %c8_i32 = arith.constant 8 : i32
            %7 = arith.addi %6, %c8_i32 : i32
            %c1_64 = arith.constant 1 : index
            memref.store %7, %idx_buffer_softmax_1[%c1_64] : memref<2xi32>
          }
        }
      }
      aie.end
    } {stack_size = 3328 : i32}
    %lock_2_3 = aie.lock(%logical_core_9)
    %core_2_3 = aie.core(%logical_core_9) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c1_49 = arith.constant 1 : index
      scf.for %arg0 = %c0 to %c1 step %c1_49 {
        %c1_i32 = arith.constant 1 : i32
        aie.use_lock(%lock_2_3, Acquire, %c1_i32)
        %c0_50 = arith.constant 0 : index
        %0 = memref.load %mha_rtpss_2_stage1[%c0_50] : memref<4xi32>
        %c1_51 = arith.constant 1 : index
        %1 = memref.load %mha_rtpss_2_stage1[%c1_51] : memref<4xi32>
        %c2 = arith.constant 2 : index
        %2 = memref.load %mha_rtpss_2_stage1[%c2] : memref<4xi32>
        %c3 = arith.constant 3 : index
        %3 = memref.load %mha_rtpss_2_stage1[%c3] : memref<4xi32>
        %c0_52 = arith.constant 0 : index
        %c9223372036854775807 = arith.constant 9223372036854775807 : index
        %c1_53 = arith.constant 1 : index
        scf.for %arg1 = %c0_52 to %c9223372036854775807 step %c1_53 {
          %c0_54 = arith.constant 0 : index
          %c0_i32 = arith.constant 0 : i32
          memref.store %c0_i32, %idx_buffer_softmax_2[%c0_54] : memref<2xi32>
          %c1_55 = arith.constant 1 : index
          %c2_i32 = arith.constant 2 : i32
          memref.store %c2_i32, %idx_buffer_softmax_2[%c1_55] : memref<2xi32>
          %c0_56 = arith.constant 0 : index
          %4 = arith.index_cast %0 : i32 to index
          %c1_57 = arith.constant 1 : index
          scf.for %arg2 = %c0_56 to %4 step %c1_57 {
            %c64_i32 = arith.constant 64 : i32
            func.call @init_scale_buffer(%scale_buffer_softmax_2, %c64_i32) : (memref<256xbf16>, i32) -> ()
            %c0_58 = arith.constant 0 : index
            %5 = arith.index_cast %1 : i32 to index
            %c1_59 = arith.constant 1 : index
            scf.for %arg3 = %c0_58 to %5 step %c1_59 {
              %8 = aie.objectfifo.acquire @memP2(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
              %9 = aie.objectfifo.subview.access %8[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
              %10 = aie.objectfifo.acquire @outA2(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
              %11 = aie.objectfifo.subview.access %10[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
              %12 = aie.objectfifo.acquire @scaleOF2(Produce, 1) : !aie.objectfifosubview<memref<256xbf16>>
              %13 = aie.objectfifo.subview.access %12[0] : !aie.objectfifosubview<memref<256xbf16>> -> memref<256xbf16>
              %cst = arith.constant 1.806640e-01 : bf16
              %c64_i32_64 = arith.constant 64 : i32
              %c64_i32_65 = arith.constant 64 : i32
              func.call @partial_softmax(%11, %9, %scale_buffer_softmax_2, %idx_buffer_softmax_2, %cst, %c64_i32_64, %c64_i32_65, %2, %3) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<256xbf16>, memref<2xi32>, bf16, i32, i32, i32, i32) -> ()
              %c256_i32 = arith.constant 256 : i32
              func.call @passThroughLine(%scale_buffer_softmax_2, %13, %c256_i32) : (memref<256xbf16>, memref<256xbf16>, i32) -> ()
              aie.objectfifo.release @outA2(Consume, 1)
              aie.objectfifo.release @memP2(Produce, 1)
              aie.objectfifo.release @scaleOF2(Produce, 1)
              %c0_66 = arith.constant 0 : index
              %14 = memref.load %idx_buffer_softmax_2[%c0_66] : memref<2xi32>
              %c1_i32_67 = arith.constant 1 : i32
              %15 = arith.addi %14, %c1_i32_67 : i32
              %c0_68 = arith.constant 0 : index
              memref.store %15, %idx_buffer_softmax_2[%c0_68] : memref<2xi32>
            }
            %c0_60 = arith.constant 0 : index
            %c0_i32_61 = arith.constant 0 : i32
            memref.store %c0_i32_61, %idx_buffer_softmax_2[%c0_60] : memref<2xi32>
            %c1_62 = arith.constant 1 : index
            %6 = memref.load %idx_buffer_softmax_2[%c1_62] : memref<2xi32>
            %c8_i32 = arith.constant 8 : i32
            %7 = arith.addi %6, %c8_i32 : i32
            %c1_63 = arith.constant 1 : index
            memref.store %7, %idx_buffer_softmax_2[%c1_63] : memref<2xi32>
          }
        }
      }
      aie.end
    } {stack_size = 3328 : i32}
    %lock_3_3 = aie.lock(%logical_core_10)
    %core_3_3 = aie.core(%logical_core_10) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c1_49 = arith.constant 1 : index
      scf.for %arg0 = %c0 to %c1 step %c1_49 {
        %c1_i32 = arith.constant 1 : i32
        aie.use_lock(%lock_3_3, Acquire, %c1_i32)
        %c0_50 = arith.constant 0 : index
        %0 = memref.load %mha_rtpss_3_stage1[%c0_50] : memref<4xi32>
        %c1_51 = arith.constant 1 : index
        %1 = memref.load %mha_rtpss_3_stage1[%c1_51] : memref<4xi32>
        %c2 = arith.constant 2 : index
        %2 = memref.load %mha_rtpss_3_stage1[%c2] : memref<4xi32>
        %c3 = arith.constant 3 : index
        %3 = memref.load %mha_rtpss_3_stage1[%c3] : memref<4xi32>
        %c0_52 = arith.constant 0 : index
        %c9223372036854775807 = arith.constant 9223372036854775807 : index
        %c1_53 = arith.constant 1 : index
        scf.for %arg1 = %c0_52 to %c9223372036854775807 step %c1_53 {
          %c0_54 = arith.constant 0 : index
          %c0_i32 = arith.constant 0 : i32
          memref.store %c0_i32, %idx_buffer_softmax_3[%c0_54] : memref<2xi32>
          %c1_55 = arith.constant 1 : index
          %c3_i32 = arith.constant 3 : i32
          memref.store %c3_i32, %idx_buffer_softmax_3[%c1_55] : memref<2xi32>
          %c0_56 = arith.constant 0 : index
          %4 = arith.index_cast %0 : i32 to index
          %c1_57 = arith.constant 1 : index
          scf.for %arg2 = %c0_56 to %4 step %c1_57 {
            %c64_i32 = arith.constant 64 : i32
            func.call @init_scale_buffer(%scale_buffer_softmax_3, %c64_i32) : (memref<256xbf16>, i32) -> ()
            %c0_58 = arith.constant 0 : index
            %5 = arith.index_cast %1 : i32 to index
            %c1_59 = arith.constant 1 : index
            scf.for %arg3 = %c0_58 to %5 step %c1_59 {
              %8 = aie.objectfifo.acquire @memP3(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
              %9 = aie.objectfifo.subview.access %8[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
              %10 = aie.objectfifo.acquire @outA3(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
              %11 = aie.objectfifo.subview.access %10[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
              %12 = aie.objectfifo.acquire @scaleOF3(Produce, 1) : !aie.objectfifosubview<memref<256xbf16>>
              %13 = aie.objectfifo.subview.access %12[0] : !aie.objectfifosubview<memref<256xbf16>> -> memref<256xbf16>
              %cst = arith.constant 1.806640e-01 : bf16
              %c64_i32_64 = arith.constant 64 : i32
              %c64_i32_65 = arith.constant 64 : i32
              func.call @partial_softmax(%11, %9, %scale_buffer_softmax_3, %idx_buffer_softmax_3, %cst, %c64_i32_64, %c64_i32_65, %2, %3) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<256xbf16>, memref<2xi32>, bf16, i32, i32, i32, i32) -> ()
              %c256_i32 = arith.constant 256 : i32
              func.call @passThroughLine(%scale_buffer_softmax_3, %13, %c256_i32) : (memref<256xbf16>, memref<256xbf16>, i32) -> ()
              aie.objectfifo.release @outA3(Consume, 1)
              aie.objectfifo.release @memP3(Produce, 1)
              aie.objectfifo.release @scaleOF3(Produce, 1)
              %c0_66 = arith.constant 0 : index
              %14 = memref.load %idx_buffer_softmax_3[%c0_66] : memref<2xi32>
              %c1_i32_67 = arith.constant 1 : i32
              %15 = arith.addi %14, %c1_i32_67 : i32
              %c0_68 = arith.constant 0 : index
              memref.store %15, %idx_buffer_softmax_3[%c0_68] : memref<2xi32>
            }
            %c0_60 = arith.constant 0 : index
            %c0_i32_61 = arith.constant 0 : i32
            memref.store %c0_i32_61, %idx_buffer_softmax_3[%c0_60] : memref<2xi32>
            %c1_62 = arith.constant 1 : index
            %6 = memref.load %idx_buffer_softmax_3[%c1_62] : memref<2xi32>
            %c8_i32 = arith.constant 8 : i32
            %7 = arith.addi %6, %c8_i32 : i32
            %c1_63 = arith.constant 1 : index
            memref.store %7, %idx_buffer_softmax_3[%c1_63] : memref<2xi32>
          }
        }
      }
      aie.end
    } {stack_size = 3328 : i32}
    %lock_4_3 = aie.lock(%logical_core_11)
    %core_4_3 = aie.core(%logical_core_11) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c1_49 = arith.constant 1 : index
      scf.for %arg0 = %c0 to %c1 step %c1_49 {
        %c1_i32 = arith.constant 1 : i32
        aie.use_lock(%lock_4_3, Acquire, %c1_i32)
        %c0_50 = arith.constant 0 : index
        %0 = memref.load %mha_rtpss_4_stage1[%c0_50] : memref<4xi32>
        %c1_51 = arith.constant 1 : index
        %1 = memref.load %mha_rtpss_4_stage1[%c1_51] : memref<4xi32>
        %c2 = arith.constant 2 : index
        %2 = memref.load %mha_rtpss_4_stage1[%c2] : memref<4xi32>
        %c3 = arith.constant 3 : index
        %3 = memref.load %mha_rtpss_4_stage1[%c3] : memref<4xi32>
        %c0_52 = arith.constant 0 : index
        %c9223372036854775807 = arith.constant 9223372036854775807 : index
        %c1_53 = arith.constant 1 : index
        scf.for %arg1 = %c0_52 to %c9223372036854775807 step %c1_53 {
          %c0_54 = arith.constant 0 : index
          %c0_i32 = arith.constant 0 : i32
          memref.store %c0_i32, %idx_buffer_softmax_4[%c0_54] : memref<2xi32>
          %c1_55 = arith.constant 1 : index
          %c4_i32 = arith.constant 4 : i32
          memref.store %c4_i32, %idx_buffer_softmax_4[%c1_55] : memref<2xi32>
          %c0_56 = arith.constant 0 : index
          %4 = arith.index_cast %0 : i32 to index
          %c1_57 = arith.constant 1 : index
          scf.for %arg2 = %c0_56 to %4 step %c1_57 {
            %c64_i32 = arith.constant 64 : i32
            func.call @init_scale_buffer(%scale_buffer_softmax_4, %c64_i32) : (memref<256xbf16>, i32) -> ()
            %c0_58 = arith.constant 0 : index
            %5 = arith.index_cast %1 : i32 to index
            %c1_59 = arith.constant 1 : index
            scf.for %arg3 = %c0_58 to %5 step %c1_59 {
              %8 = aie.objectfifo.acquire @memP4(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
              %9 = aie.objectfifo.subview.access %8[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
              %10 = aie.objectfifo.acquire @outA4(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
              %11 = aie.objectfifo.subview.access %10[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
              %12 = aie.objectfifo.acquire @scaleOF4(Produce, 1) : !aie.objectfifosubview<memref<256xbf16>>
              %13 = aie.objectfifo.subview.access %12[0] : !aie.objectfifosubview<memref<256xbf16>> -> memref<256xbf16>
              %cst = arith.constant 1.806640e-01 : bf16
              %c64_i32_64 = arith.constant 64 : i32
              %c64_i32_65 = arith.constant 64 : i32
              func.call @partial_softmax(%11, %9, %scale_buffer_softmax_4, %idx_buffer_softmax_4, %cst, %c64_i32_64, %c64_i32_65, %2, %3) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<256xbf16>, memref<2xi32>, bf16, i32, i32, i32, i32) -> ()
              %c256_i32 = arith.constant 256 : i32
              func.call @passThroughLine(%scale_buffer_softmax_4, %13, %c256_i32) : (memref<256xbf16>, memref<256xbf16>, i32) -> ()
              aie.objectfifo.release @outA4(Consume, 1)
              aie.objectfifo.release @memP4(Produce, 1)
              aie.objectfifo.release @scaleOF4(Produce, 1)
              %c0_66 = arith.constant 0 : index
              %14 = memref.load %idx_buffer_softmax_4[%c0_66] : memref<2xi32>
              %c1_i32_67 = arith.constant 1 : i32
              %15 = arith.addi %14, %c1_i32_67 : i32
              %c0_68 = arith.constant 0 : index
              memref.store %15, %idx_buffer_softmax_4[%c0_68] : memref<2xi32>
            }
            %c0_60 = arith.constant 0 : index
            %c0_i32_61 = arith.constant 0 : i32
            memref.store %c0_i32_61, %idx_buffer_softmax_4[%c0_60] : memref<2xi32>
            %c1_62 = arith.constant 1 : index
            %6 = memref.load %idx_buffer_softmax_4[%c1_62] : memref<2xi32>
            %c8_i32 = arith.constant 8 : i32
            %7 = arith.addi %6, %c8_i32 : i32
            %c1_63 = arith.constant 1 : index
            memref.store %7, %idx_buffer_softmax_4[%c1_63] : memref<2xi32>
          }
        }
      }
      aie.end
    } {stack_size = 3328 : i32}
    %lock_5_3 = aie.lock(%logical_core_12)
    %core_5_3 = aie.core(%logical_core_12) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c1_49 = arith.constant 1 : index
      scf.for %arg0 = %c0 to %c1 step %c1_49 {
        %c1_i32 = arith.constant 1 : i32
        aie.use_lock(%lock_5_3, Acquire, %c1_i32)
        %c0_50 = arith.constant 0 : index
        %0 = memref.load %mha_rtpss_5_stage1[%c0_50] : memref<4xi32>
        %c1_51 = arith.constant 1 : index
        %1 = memref.load %mha_rtpss_5_stage1[%c1_51] : memref<4xi32>
        %c2 = arith.constant 2 : index
        %2 = memref.load %mha_rtpss_5_stage1[%c2] : memref<4xi32>
        %c3 = arith.constant 3 : index
        %3 = memref.load %mha_rtpss_5_stage1[%c3] : memref<4xi32>
        %c0_52 = arith.constant 0 : index
        %c9223372036854775807 = arith.constant 9223372036854775807 : index
        %c1_53 = arith.constant 1 : index
        scf.for %arg1 = %c0_52 to %c9223372036854775807 step %c1_53 {
          %c0_54 = arith.constant 0 : index
          %c0_i32 = arith.constant 0 : i32
          memref.store %c0_i32, %idx_buffer_softmax_5[%c0_54] : memref<2xi32>
          %c1_55 = arith.constant 1 : index
          %c5_i32 = arith.constant 5 : i32
          memref.store %c5_i32, %idx_buffer_softmax_5[%c1_55] : memref<2xi32>
          %c0_56 = arith.constant 0 : index
          %4 = arith.index_cast %0 : i32 to index
          %c1_57 = arith.constant 1 : index
          scf.for %arg2 = %c0_56 to %4 step %c1_57 {
            %c64_i32 = arith.constant 64 : i32
            func.call @init_scale_buffer(%scale_buffer_softmax_5, %c64_i32) : (memref<256xbf16>, i32) -> ()
            %c0_58 = arith.constant 0 : index
            %5 = arith.index_cast %1 : i32 to index
            %c1_59 = arith.constant 1 : index
            scf.for %arg3 = %c0_58 to %5 step %c1_59 {
              %8 = aie.objectfifo.acquire @memP5(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
              %9 = aie.objectfifo.subview.access %8[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
              %10 = aie.objectfifo.acquire @outA5(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
              %11 = aie.objectfifo.subview.access %10[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
              %12 = aie.objectfifo.acquire @scaleOF5(Produce, 1) : !aie.objectfifosubview<memref<256xbf16>>
              %13 = aie.objectfifo.subview.access %12[0] : !aie.objectfifosubview<memref<256xbf16>> -> memref<256xbf16>
              %cst = arith.constant 1.806640e-01 : bf16
              %c64_i32_64 = arith.constant 64 : i32
              %c64_i32_65 = arith.constant 64 : i32
              func.call @partial_softmax(%11, %9, %scale_buffer_softmax_5, %idx_buffer_softmax_5, %cst, %c64_i32_64, %c64_i32_65, %2, %3) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<256xbf16>, memref<2xi32>, bf16, i32, i32, i32, i32) -> ()
              %c256_i32 = arith.constant 256 : i32
              func.call @passThroughLine(%scale_buffer_softmax_5, %13, %c256_i32) : (memref<256xbf16>, memref<256xbf16>, i32) -> ()
              aie.objectfifo.release @outA5(Consume, 1)
              aie.objectfifo.release @memP5(Produce, 1)
              aie.objectfifo.release @scaleOF5(Produce, 1)
              %c0_66 = arith.constant 0 : index
              %14 = memref.load %idx_buffer_softmax_5[%c0_66] : memref<2xi32>
              %c1_i32_67 = arith.constant 1 : i32
              %15 = arith.addi %14, %c1_i32_67 : i32
              %c0_68 = arith.constant 0 : index
              memref.store %15, %idx_buffer_softmax_5[%c0_68] : memref<2xi32>
            }
            %c0_60 = arith.constant 0 : index
            %c0_i32_61 = arith.constant 0 : i32
            memref.store %c0_i32_61, %idx_buffer_softmax_5[%c0_60] : memref<2xi32>
            %c1_62 = arith.constant 1 : index
            %6 = memref.load %idx_buffer_softmax_5[%c1_62] : memref<2xi32>
            %c8_i32 = arith.constant 8 : i32
            %7 = arith.addi %6, %c8_i32 : i32
            %c1_63 = arith.constant 1 : index
            memref.store %7, %idx_buffer_softmax_5[%c1_63] : memref<2xi32>
          }
        }
      }
      aie.end
    } {stack_size = 3328 : i32}
    %lock_6_3 = aie.lock(%logical_core_13)
    %core_6_3 = aie.core(%logical_core_13) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c1_49 = arith.constant 1 : index
      scf.for %arg0 = %c0 to %c1 step %c1_49 {
        %c1_i32 = arith.constant 1 : i32
        aie.use_lock(%lock_6_3, Acquire, %c1_i32)
        %c0_50 = arith.constant 0 : index
        %0 = memref.load %mha_rtpss_6_stage1[%c0_50] : memref<4xi32>
        %c1_51 = arith.constant 1 : index
        %1 = memref.load %mha_rtpss_6_stage1[%c1_51] : memref<4xi32>
        %c2 = arith.constant 2 : index
        %2 = memref.load %mha_rtpss_6_stage1[%c2] : memref<4xi32>
        %c3 = arith.constant 3 : index
        %3 = memref.load %mha_rtpss_6_stage1[%c3] : memref<4xi32>
        %c0_52 = arith.constant 0 : index
        %c9223372036854775807 = arith.constant 9223372036854775807 : index
        %c1_53 = arith.constant 1 : index
        scf.for %arg1 = %c0_52 to %c9223372036854775807 step %c1_53 {
          %c0_54 = arith.constant 0 : index
          %c0_i32 = arith.constant 0 : i32
          memref.store %c0_i32, %idx_buffer_softmax_6[%c0_54] : memref<2xi32>
          %c1_55 = arith.constant 1 : index
          %c6_i32 = arith.constant 6 : i32
          memref.store %c6_i32, %idx_buffer_softmax_6[%c1_55] : memref<2xi32>
          %c0_56 = arith.constant 0 : index
          %4 = arith.index_cast %0 : i32 to index
          %c1_57 = arith.constant 1 : index
          scf.for %arg2 = %c0_56 to %4 step %c1_57 {
            %c64_i32 = arith.constant 64 : i32
            func.call @init_scale_buffer(%scale_buffer_softmax_6, %c64_i32) : (memref<256xbf16>, i32) -> ()
            %c0_58 = arith.constant 0 : index
            %5 = arith.index_cast %1 : i32 to index
            %c1_59 = arith.constant 1 : index
            scf.for %arg3 = %c0_58 to %5 step %c1_59 {
              %8 = aie.objectfifo.acquire @memP6(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
              %9 = aie.objectfifo.subview.access %8[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
              %10 = aie.objectfifo.acquire @outA6(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
              %11 = aie.objectfifo.subview.access %10[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
              %12 = aie.objectfifo.acquire @scaleOF6(Produce, 1) : !aie.objectfifosubview<memref<256xbf16>>
              %13 = aie.objectfifo.subview.access %12[0] : !aie.objectfifosubview<memref<256xbf16>> -> memref<256xbf16>
              %cst = arith.constant 1.806640e-01 : bf16
              %c64_i32_64 = arith.constant 64 : i32
              %c64_i32_65 = arith.constant 64 : i32
              func.call @partial_softmax(%11, %9, %scale_buffer_softmax_6, %idx_buffer_softmax_6, %cst, %c64_i32_64, %c64_i32_65, %2, %3) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<256xbf16>, memref<2xi32>, bf16, i32, i32, i32, i32) -> ()
              %c256_i32 = arith.constant 256 : i32
              func.call @passThroughLine(%scale_buffer_softmax_6, %13, %c256_i32) : (memref<256xbf16>, memref<256xbf16>, i32) -> ()
              aie.objectfifo.release @outA6(Consume, 1)
              aie.objectfifo.release @memP6(Produce, 1)
              aie.objectfifo.release @scaleOF6(Produce, 1)
              %c0_66 = arith.constant 0 : index
              %14 = memref.load %idx_buffer_softmax_6[%c0_66] : memref<2xi32>
              %c1_i32_67 = arith.constant 1 : i32
              %15 = arith.addi %14, %c1_i32_67 : i32
              %c0_68 = arith.constant 0 : index
              memref.store %15, %idx_buffer_softmax_6[%c0_68] : memref<2xi32>
            }
            %c0_60 = arith.constant 0 : index
            %c0_i32_61 = arith.constant 0 : i32
            memref.store %c0_i32_61, %idx_buffer_softmax_6[%c0_60] : memref<2xi32>
            %c1_62 = arith.constant 1 : index
            %6 = memref.load %idx_buffer_softmax_6[%c1_62] : memref<2xi32>
            %c8_i32 = arith.constant 8 : i32
            %7 = arith.addi %6, %c8_i32 : i32
            %c1_63 = arith.constant 1 : index
            memref.store %7, %idx_buffer_softmax_6[%c1_63] : memref<2xi32>
          }
        }
      }
      aie.end
    } {stack_size = 3328 : i32}
    %lock_7_3 = aie.lock(%logical_core_14)
    %core_7_3 = aie.core(%logical_core_14) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c1_49 = arith.constant 1 : index
      scf.for %arg0 = %c0 to %c1 step %c1_49 {
        %c1_i32 = arith.constant 1 : i32
        aie.use_lock(%lock_7_3, Acquire, %c1_i32)
        %c0_50 = arith.constant 0 : index
        %0 = memref.load %mha_rtpss_7_stage1[%c0_50] : memref<4xi32>
        %c1_51 = arith.constant 1 : index
        %1 = memref.load %mha_rtpss_7_stage1[%c1_51] : memref<4xi32>
        %c2 = arith.constant 2 : index
        %2 = memref.load %mha_rtpss_7_stage1[%c2] : memref<4xi32>
        %c3 = arith.constant 3 : index
        %3 = memref.load %mha_rtpss_7_stage1[%c3] : memref<4xi32>
        %c0_52 = arith.constant 0 : index
        %c9223372036854775807 = arith.constant 9223372036854775807 : index
        %c1_53 = arith.constant 1 : index
        scf.for %arg1 = %c0_52 to %c9223372036854775807 step %c1_53 {
          %c0_54 = arith.constant 0 : index
          %c0_i32 = arith.constant 0 : i32
          memref.store %c0_i32, %idx_buffer_softmax_7[%c0_54] : memref<2xi32>
          %c1_55 = arith.constant 1 : index
          %c7_i32 = arith.constant 7 : i32
          memref.store %c7_i32, %idx_buffer_softmax_7[%c1_55] : memref<2xi32>
          %c0_56 = arith.constant 0 : index
          %4 = arith.index_cast %0 : i32 to index
          %c1_57 = arith.constant 1 : index
          scf.for %arg2 = %c0_56 to %4 step %c1_57 {
            %c64_i32 = arith.constant 64 : i32
            func.call @init_scale_buffer(%scale_buffer_softmax_7, %c64_i32) : (memref<256xbf16>, i32) -> ()
            %c0_58 = arith.constant 0 : index
            %5 = arith.index_cast %1 : i32 to index
            %c1_59 = arith.constant 1 : index
            scf.for %arg3 = %c0_58 to %5 step %c1_59 {
              %8 = aie.objectfifo.acquire @memP7(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
              %9 = aie.objectfifo.subview.access %8[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
              %10 = aie.objectfifo.acquire @outA7(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
              %11 = aie.objectfifo.subview.access %10[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
              %12 = aie.objectfifo.acquire @scaleOF7(Produce, 1) : !aie.objectfifosubview<memref<256xbf16>>
              %13 = aie.objectfifo.subview.access %12[0] : !aie.objectfifosubview<memref<256xbf16>> -> memref<256xbf16>
              %cst = arith.constant 1.806640e-01 : bf16
              %c64_i32_64 = arith.constant 64 : i32
              %c64_i32_65 = arith.constant 64 : i32
              func.call @partial_softmax(%11, %9, %scale_buffer_softmax_7, %idx_buffer_softmax_7, %cst, %c64_i32_64, %c64_i32_65, %2, %3) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<256xbf16>, memref<2xi32>, bf16, i32, i32, i32, i32) -> ()
              %c256_i32 = arith.constant 256 : i32
              func.call @passThroughLine(%scale_buffer_softmax_7, %13, %c256_i32) : (memref<256xbf16>, memref<256xbf16>, i32) -> ()
              aie.objectfifo.release @outA7(Consume, 1)
              aie.objectfifo.release @memP7(Produce, 1)
              aie.objectfifo.release @scaleOF7(Produce, 1)
              %c0_66 = arith.constant 0 : index
              %14 = memref.load %idx_buffer_softmax_7[%c0_66] : memref<2xi32>
              %c1_i32_67 = arith.constant 1 : i32
              %15 = arith.addi %14, %c1_i32_67 : i32
              %c0_68 = arith.constant 0 : index
              memref.store %15, %idx_buffer_softmax_7[%c0_68] : memref<2xi32>
            }
            %c0_60 = arith.constant 0 : index
            %c0_i32_61 = arith.constant 0 : i32
            memref.store %c0_i32_61, %idx_buffer_softmax_7[%c0_60] : memref<2xi32>
            %c1_62 = arith.constant 1 : index
            %6 = memref.load %idx_buffer_softmax_7[%c1_62] : memref<2xi32>
            %c8_i32 = arith.constant 8 : i32
            %7 = arith.addi %6, %c8_i32 : i32
            %c1_63 = arith.constant 1 : index
            memref.store %7, %idx_buffer_softmax_7[%c1_63] : memref<2xi32>
          }
        }
      }
      aie.end
    } {stack_size = 3328 : i32}
    %lock_0_4 = aie.lock(%logical_core_15)
    %core_0_4 = aie.core(%logical_core_15) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c1_49 = arith.constant 1 : index
      scf.for %arg0 = %c0 to %c1 step %c1_49 {
        %c1_i32 = arith.constant 1 : i32
        aie.use_lock(%lock_0_4, Acquire, %c1_i32)
        %c0_50 = arith.constant 0 : index
        %0 = memref.load %mha_rtpss_0_stage2[%c0_50] : memref<4xi32>
        %c1_51 = arith.constant 1 : index
        %1 = memref.load %mha_rtpss_0_stage2[%c1_51] : memref<4xi32>
        %c0_52 = arith.constant 0 : index
        %c9223372036854775807 = arith.constant 9223372036854775807 : index
        %c1_53 = arith.constant 1 : index
        scf.for %arg1 = %c0_52 to %c9223372036854775807 step %c1_53 {
          %c0_54 = arith.constant 0 : index
          %c0_i32 = arith.constant 0 : i32
          memref.store %c0_i32, %idx_buffer_pv_0[%c0_54] : memref<2xi32>
          %c1_55 = arith.constant 1 : index
          %c0_i32_56 = arith.constant 0 : i32
          memref.store %c0_i32_56, %idx_buffer_pv_0[%c1_55] : memref<2xi32>
          %c0_57 = arith.constant 0 : index
          %2 = arith.index_cast %0 : i32 to index
          %c1_58 = arith.constant 1 : index
          scf.for %arg2 = %c0_57 to %2 step %c1_58 {
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
            %c0_i32_59 = arith.constant 0 : i32
            func.call @matmul_PV(%6, %8, %4, %10, %c64_i32, %c0_i32_59, %idx_buffer_pv_0) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>, memref<256xbf16>, i32, i32, memref<2xi32>) -> ()
            aie.objectfifo.release @outP0(Consume, 1)
            aie.objectfifo.release @memV(Consume, 1)
            aie.objectfifo.release @scaleOF0(Consume, 1)
            %c0_60 = arith.constant 0 : index
            %11 = memref.load %idx_buffer_pv_0[%c0_60] : memref<2xi32>
            %c1_i32_61 = arith.constant 1 : i32
            %12 = arith.addi %11, %c1_i32_61 : i32
            %c0_62 = arith.constant 0 : index
            memref.store %12, %idx_buffer_pv_0[%c0_62] : memref<2xi32>
            %c2_i32 = arith.constant 2 : i32
            %13 = arith.cmpi sgt, %1, %c2_i32 : i32
            scf.if %13 {
              %c2_i32_68 = arith.constant 2 : i32
              %17 = arith.subi %1, %c2_i32_68 : i32
              %c0_69 = arith.constant 0 : index
              %18 = arith.index_cast %17 : i32 to index
              %c1_70 = arith.constant 1 : index
              scf.for %arg3 = %c0_69 to %18 step %c1_70 {
                %19 = aie.objectfifo.acquire @outP0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
                %20 = aie.objectfifo.subview.access %19[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
                %21 = aie.objectfifo.acquire @memV(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
                %22 = aie.objectfifo.subview.access %21[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
                %23 = aie.objectfifo.acquire @scaleOF0(Consume, 1) : !aie.objectfifosubview<memref<256xbf16>>
                %24 = aie.objectfifo.subview.access %23[0] : !aie.objectfifosubview<memref<256xbf16>> -> memref<256xbf16>
                %c64_i32_71 = arith.constant 64 : i32
                %c1_i32_72 = arith.constant 1 : i32
                func.call @matmul_PV(%20, %22, %4, %24, %c64_i32_71, %c1_i32_72, %idx_buffer_pv_0) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>, memref<256xbf16>, i32, i32, memref<2xi32>) -> ()
                aie.objectfifo.release @outP0(Consume, 1)
                aie.objectfifo.release @memV(Consume, 1)
                aie.objectfifo.release @scaleOF0(Consume, 1)
                %c0_73 = arith.constant 0 : index
                %25 = memref.load %idx_buffer_pv_0[%c0_73] : memref<2xi32>
                %c1_i32_74 = arith.constant 1 : i32
                %26 = arith.addi %25, %c1_i32_74 : i32
                %c0_75 = arith.constant 0 : index
                memref.store %26, %idx_buffer_pv_0[%c0_75] : memref<2xi32>
              }
            } else {
            }
            %c1_i32_63 = arith.constant 1 : i32
            %14 = arith.cmpi sgt, %1, %c1_i32_63 : i32
            scf.if %14 {
              %17 = aie.objectfifo.acquire @outP0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
              %18 = aie.objectfifo.subview.access %17[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
              %19 = aie.objectfifo.acquire @memV(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
              %20 = aie.objectfifo.subview.access %19[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
              %21 = aie.objectfifo.acquire @scaleOF0(Consume, 1) : !aie.objectfifosubview<memref<256xbf16>>
              %22 = aie.objectfifo.subview.access %21[0] : !aie.objectfifosubview<memref<256xbf16>> -> memref<256xbf16>
              %c64_i32_68 = arith.constant 64 : i32
              %c1_i32_69 = arith.constant 1 : i32
              func.call @matmul_PV(%18, %20, %4, %22, %c64_i32_68, %c1_i32_69, %idx_buffer_pv_0) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>, memref<256xbf16>, i32, i32, memref<2xi32>) -> ()
              %c64_i32_70 = arith.constant 64 : i32
              func.call @rescale_O(%4, %22, %c64_i32_70, %idx_buffer_pv_0) : (memref<64x64xbf16>, memref<256xbf16>, i32, memref<2xi32>) -> ()
              aie.objectfifo.release @outP0(Consume, 1)
              aie.objectfifo.release @memV(Consume, 1)
              aie.objectfifo.release @scaleOF0(Consume, 1)
              %c0_71 = arith.constant 0 : index
              %23 = memref.load %idx_buffer_pv_0[%c0_71] : memref<2xi32>
              %c1_i32_72 = arith.constant 1 : i32
              %24 = arith.addi %23, %c1_i32_72 : i32
              %c0_73 = arith.constant 0 : index
              memref.store %24, %idx_buffer_pv_0[%c0_73] : memref<2xi32>
            } else {
              %c64_i32_68 = arith.constant 64 : i32
              func.call @rescale_O(%4, %10, %c64_i32_68, %idx_buffer_pv_0) : (memref<64x64xbf16>, memref<256xbf16>, i32, memref<2xi32>) -> ()
              %c0_69 = arith.constant 0 : index
              %17 = memref.load %idx_buffer_pv_0[%c0_69] : memref<2xi32>
              %c1_i32_70 = arith.constant 1 : i32
              %18 = arith.addi %17, %c1_i32_70 : i32
              %c0_71 = arith.constant 0 : index
              memref.store %18, %idx_buffer_pv_0[%c0_71] : memref<2xi32>
            }
            %c0_64 = arith.constant 0 : index
            %c0_i32_65 = arith.constant 0 : i32
            memref.store %c0_i32_65, %idx_buffer_pv_0[%c0_64] : memref<2xi32>
            %c1_66 = arith.constant 1 : index
            %15 = memref.load %idx_buffer_pv_0[%c1_66] : memref<2xi32>
            %c8_i32 = arith.constant 8 : i32
            %16 = arith.addi %15, %c8_i32 : i32
            %c1_67 = arith.constant 1 : index
            memref.store %16, %idx_buffer_pv_0[%c1_67] : memref<2xi32>
            aie.objectfifo.release @outO0(Produce, 1)
          }
        }
      }
      aie.end
    } {stack_size = 3328 : i32}
    %lock_1_4 = aie.lock(%logical_core_16)
    %core_1_4 = aie.core(%logical_core_16) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c1_49 = arith.constant 1 : index
      scf.for %arg0 = %c0 to %c1 step %c1_49 {
        %c1_i32 = arith.constant 1 : i32
        aie.use_lock(%lock_1_4, Acquire, %c1_i32)
        %c0_50 = arith.constant 0 : index
        %0 = memref.load %mha_rtpss_1_stage2[%c0_50] : memref<4xi32>
        %c1_51 = arith.constant 1 : index
        %1 = memref.load %mha_rtpss_1_stage2[%c1_51] : memref<4xi32>
        %c0_52 = arith.constant 0 : index
        %c9223372036854775807 = arith.constant 9223372036854775807 : index
        %c1_53 = arith.constant 1 : index
        scf.for %arg1 = %c0_52 to %c9223372036854775807 step %c1_53 {
          %c0_54 = arith.constant 0 : index
          %c0_i32 = arith.constant 0 : i32
          memref.store %c0_i32, %idx_buffer_pv_1[%c0_54] : memref<2xi32>
          %c1_55 = arith.constant 1 : index
          %c1_i32_56 = arith.constant 1 : i32
          memref.store %c1_i32_56, %idx_buffer_pv_1[%c1_55] : memref<2xi32>
          %c0_57 = arith.constant 0 : index
          %2 = arith.index_cast %0 : i32 to index
          %c1_58 = arith.constant 1 : index
          scf.for %arg2 = %c0_57 to %2 step %c1_58 {
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
            %c0_i32_59 = arith.constant 0 : i32
            func.call @matmul_PV(%6, %8, %4, %10, %c64_i32, %c0_i32_59, %idx_buffer_pv_1) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>, memref<256xbf16>, i32, i32, memref<2xi32>) -> ()
            aie.objectfifo.release @outP1(Consume, 1)
            aie.objectfifo.release @memV(Consume, 1)
            aie.objectfifo.release @scaleOF1(Consume, 1)
            %c0_60 = arith.constant 0 : index
            %11 = memref.load %idx_buffer_pv_1[%c0_60] : memref<2xi32>
            %c1_i32_61 = arith.constant 1 : i32
            %12 = arith.addi %11, %c1_i32_61 : i32
            %c0_62 = arith.constant 0 : index
            memref.store %12, %idx_buffer_pv_1[%c0_62] : memref<2xi32>
            %c2_i32 = arith.constant 2 : i32
            %13 = arith.cmpi sgt, %1, %c2_i32 : i32
            scf.if %13 {
              %c2_i32_68 = arith.constant 2 : i32
              %17 = arith.subi %1, %c2_i32_68 : i32
              %c0_69 = arith.constant 0 : index
              %18 = arith.index_cast %17 : i32 to index
              %c1_70 = arith.constant 1 : index
              scf.for %arg3 = %c0_69 to %18 step %c1_70 {
                %19 = aie.objectfifo.acquire @outP1(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
                %20 = aie.objectfifo.subview.access %19[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
                %21 = aie.objectfifo.acquire @memV(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
                %22 = aie.objectfifo.subview.access %21[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
                %23 = aie.objectfifo.acquire @scaleOF1(Consume, 1) : !aie.objectfifosubview<memref<256xbf16>>
                %24 = aie.objectfifo.subview.access %23[0] : !aie.objectfifosubview<memref<256xbf16>> -> memref<256xbf16>
                %c64_i32_71 = arith.constant 64 : i32
                %c1_i32_72 = arith.constant 1 : i32
                func.call @matmul_PV(%20, %22, %4, %24, %c64_i32_71, %c1_i32_72, %idx_buffer_pv_1) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>, memref<256xbf16>, i32, i32, memref<2xi32>) -> ()
                aie.objectfifo.release @outP1(Consume, 1)
                aie.objectfifo.release @memV(Consume, 1)
                aie.objectfifo.release @scaleOF1(Consume, 1)
                %c0_73 = arith.constant 0 : index
                %25 = memref.load %idx_buffer_pv_1[%c0_73] : memref<2xi32>
                %c1_i32_74 = arith.constant 1 : i32
                %26 = arith.addi %25, %c1_i32_74 : i32
                %c0_75 = arith.constant 0 : index
                memref.store %26, %idx_buffer_pv_1[%c0_75] : memref<2xi32>
              }
            } else {
            }
            %c1_i32_63 = arith.constant 1 : i32
            %14 = arith.cmpi sgt, %1, %c1_i32_63 : i32
            scf.if %14 {
              %17 = aie.objectfifo.acquire @outP1(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
              %18 = aie.objectfifo.subview.access %17[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
              %19 = aie.objectfifo.acquire @memV(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
              %20 = aie.objectfifo.subview.access %19[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
              %21 = aie.objectfifo.acquire @scaleOF1(Consume, 1) : !aie.objectfifosubview<memref<256xbf16>>
              %22 = aie.objectfifo.subview.access %21[0] : !aie.objectfifosubview<memref<256xbf16>> -> memref<256xbf16>
              %c64_i32_68 = arith.constant 64 : i32
              %c1_i32_69 = arith.constant 1 : i32
              func.call @matmul_PV(%18, %20, %4, %22, %c64_i32_68, %c1_i32_69, %idx_buffer_pv_1) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>, memref<256xbf16>, i32, i32, memref<2xi32>) -> ()
              %c64_i32_70 = arith.constant 64 : i32
              func.call @rescale_O(%4, %22, %c64_i32_70, %idx_buffer_pv_1) : (memref<64x64xbf16>, memref<256xbf16>, i32, memref<2xi32>) -> ()
              aie.objectfifo.release @outP1(Consume, 1)
              aie.objectfifo.release @memV(Consume, 1)
              aie.objectfifo.release @scaleOF1(Consume, 1)
              %c0_71 = arith.constant 0 : index
              %23 = memref.load %idx_buffer_pv_1[%c0_71] : memref<2xi32>
              %c1_i32_72 = arith.constant 1 : i32
              %24 = arith.addi %23, %c1_i32_72 : i32
              %c0_73 = arith.constant 0 : index
              memref.store %24, %idx_buffer_pv_1[%c0_73] : memref<2xi32>
            } else {
              %c64_i32_68 = arith.constant 64 : i32
              func.call @rescale_O(%4, %10, %c64_i32_68, %idx_buffer_pv_1) : (memref<64x64xbf16>, memref<256xbf16>, i32, memref<2xi32>) -> ()
              %c0_69 = arith.constant 0 : index
              %17 = memref.load %idx_buffer_pv_1[%c0_69] : memref<2xi32>
              %c1_i32_70 = arith.constant 1 : i32
              %18 = arith.addi %17, %c1_i32_70 : i32
              %c0_71 = arith.constant 0 : index
              memref.store %18, %idx_buffer_pv_1[%c0_71] : memref<2xi32>
            }
            %c0_64 = arith.constant 0 : index
            %c0_i32_65 = arith.constant 0 : i32
            memref.store %c0_i32_65, %idx_buffer_pv_1[%c0_64] : memref<2xi32>
            %c1_66 = arith.constant 1 : index
            %15 = memref.load %idx_buffer_pv_1[%c1_66] : memref<2xi32>
            %c8_i32 = arith.constant 8 : i32
            %16 = arith.addi %15, %c8_i32 : i32
            %c1_67 = arith.constant 1 : index
            memref.store %16, %idx_buffer_pv_1[%c1_67] : memref<2xi32>
            aie.objectfifo.release @outO1(Produce, 1)
          }
        }
      }
      aie.end
    } {stack_size = 3328 : i32}
    %lock_2_4 = aie.lock(%logical_core_17)
    %core_2_4 = aie.core(%logical_core_17) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c1_49 = arith.constant 1 : index
      scf.for %arg0 = %c0 to %c1 step %c1_49 {
        %c1_i32 = arith.constant 1 : i32
        aie.use_lock(%lock_2_4, Acquire, %c1_i32)
        %c0_50 = arith.constant 0 : index
        %0 = memref.load %mha_rtpss_2_stage2[%c0_50] : memref<4xi32>
        %c1_51 = arith.constant 1 : index
        %1 = memref.load %mha_rtpss_2_stage2[%c1_51] : memref<4xi32>
        %c0_52 = arith.constant 0 : index
        %c9223372036854775807 = arith.constant 9223372036854775807 : index
        %c1_53 = arith.constant 1 : index
        scf.for %arg1 = %c0_52 to %c9223372036854775807 step %c1_53 {
          %c0_54 = arith.constant 0 : index
          %c0_i32 = arith.constant 0 : i32
          memref.store %c0_i32, %idx_buffer_pv_2[%c0_54] : memref<2xi32>
          %c1_55 = arith.constant 1 : index
          %c2_i32 = arith.constant 2 : i32
          memref.store %c2_i32, %idx_buffer_pv_2[%c1_55] : memref<2xi32>
          %c0_56 = arith.constant 0 : index
          %2 = arith.index_cast %0 : i32 to index
          %c1_57 = arith.constant 1 : index
          scf.for %arg2 = %c0_56 to %2 step %c1_57 {
            %3 = aie.objectfifo.acquire @outO2(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %4 = aie.objectfifo.subview.access %3[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            func.call @zero_bf16(%4) : (memref<64x64xbf16>) -> ()
            %5 = aie.objectfifo.acquire @outP2(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %6 = aie.objectfifo.subview.access %5[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            %7 = aie.objectfifo.acquire @memV(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %8 = aie.objectfifo.subview.access %7[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            %9 = aie.objectfifo.acquire @scaleOF2(Consume, 1) : !aie.objectfifosubview<memref<256xbf16>>
            %10 = aie.objectfifo.subview.access %9[0] : !aie.objectfifosubview<memref<256xbf16>> -> memref<256xbf16>
            %c64_i32 = arith.constant 64 : i32
            %c0_i32_58 = arith.constant 0 : i32
            func.call @matmul_PV(%6, %8, %4, %10, %c64_i32, %c0_i32_58, %idx_buffer_pv_2) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>, memref<256xbf16>, i32, i32, memref<2xi32>) -> ()
            aie.objectfifo.release @outP2(Consume, 1)
            aie.objectfifo.release @memV(Consume, 1)
            aie.objectfifo.release @scaleOF2(Consume, 1)
            %c0_59 = arith.constant 0 : index
            %11 = memref.load %idx_buffer_pv_2[%c0_59] : memref<2xi32>
            %c1_i32_60 = arith.constant 1 : i32
            %12 = arith.addi %11, %c1_i32_60 : i32
            %c0_61 = arith.constant 0 : index
            memref.store %12, %idx_buffer_pv_2[%c0_61] : memref<2xi32>
            %c2_i32_62 = arith.constant 2 : i32
            %13 = arith.cmpi sgt, %1, %c2_i32_62 : i32
            scf.if %13 {
              %c2_i32_68 = arith.constant 2 : i32
              %17 = arith.subi %1, %c2_i32_68 : i32
              %c0_69 = arith.constant 0 : index
              %18 = arith.index_cast %17 : i32 to index
              %c1_70 = arith.constant 1 : index
              scf.for %arg3 = %c0_69 to %18 step %c1_70 {
                %19 = aie.objectfifo.acquire @outP2(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
                %20 = aie.objectfifo.subview.access %19[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
                %21 = aie.objectfifo.acquire @memV(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
                %22 = aie.objectfifo.subview.access %21[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
                %23 = aie.objectfifo.acquire @scaleOF2(Consume, 1) : !aie.objectfifosubview<memref<256xbf16>>
                %24 = aie.objectfifo.subview.access %23[0] : !aie.objectfifosubview<memref<256xbf16>> -> memref<256xbf16>
                %c64_i32_71 = arith.constant 64 : i32
                %c1_i32_72 = arith.constant 1 : i32
                func.call @matmul_PV(%20, %22, %4, %24, %c64_i32_71, %c1_i32_72, %idx_buffer_pv_2) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>, memref<256xbf16>, i32, i32, memref<2xi32>) -> ()
                aie.objectfifo.release @outP2(Consume, 1)
                aie.objectfifo.release @memV(Consume, 1)
                aie.objectfifo.release @scaleOF2(Consume, 1)
                %c0_73 = arith.constant 0 : index
                %25 = memref.load %idx_buffer_pv_2[%c0_73] : memref<2xi32>
                %c1_i32_74 = arith.constant 1 : i32
                %26 = arith.addi %25, %c1_i32_74 : i32
                %c0_75 = arith.constant 0 : index
                memref.store %26, %idx_buffer_pv_2[%c0_75] : memref<2xi32>
              }
            } else {
            }
            %c1_i32_63 = arith.constant 1 : i32
            %14 = arith.cmpi sgt, %1, %c1_i32_63 : i32
            scf.if %14 {
              %17 = aie.objectfifo.acquire @outP2(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
              %18 = aie.objectfifo.subview.access %17[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
              %19 = aie.objectfifo.acquire @memV(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
              %20 = aie.objectfifo.subview.access %19[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
              %21 = aie.objectfifo.acquire @scaleOF2(Consume, 1) : !aie.objectfifosubview<memref<256xbf16>>
              %22 = aie.objectfifo.subview.access %21[0] : !aie.objectfifosubview<memref<256xbf16>> -> memref<256xbf16>
              %c64_i32_68 = arith.constant 64 : i32
              %c1_i32_69 = arith.constant 1 : i32
              func.call @matmul_PV(%18, %20, %4, %22, %c64_i32_68, %c1_i32_69, %idx_buffer_pv_2) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>, memref<256xbf16>, i32, i32, memref<2xi32>) -> ()
              %c64_i32_70 = arith.constant 64 : i32
              func.call @rescale_O(%4, %22, %c64_i32_70, %idx_buffer_pv_2) : (memref<64x64xbf16>, memref<256xbf16>, i32, memref<2xi32>) -> ()
              aie.objectfifo.release @outP2(Consume, 1)
              aie.objectfifo.release @memV(Consume, 1)
              aie.objectfifo.release @scaleOF2(Consume, 1)
              %c0_71 = arith.constant 0 : index
              %23 = memref.load %idx_buffer_pv_2[%c0_71] : memref<2xi32>
              %c1_i32_72 = arith.constant 1 : i32
              %24 = arith.addi %23, %c1_i32_72 : i32
              %c0_73 = arith.constant 0 : index
              memref.store %24, %idx_buffer_pv_2[%c0_73] : memref<2xi32>
            } else {
              %c64_i32_68 = arith.constant 64 : i32
              func.call @rescale_O(%4, %10, %c64_i32_68, %idx_buffer_pv_2) : (memref<64x64xbf16>, memref<256xbf16>, i32, memref<2xi32>) -> ()
              %c0_69 = arith.constant 0 : index
              %17 = memref.load %idx_buffer_pv_2[%c0_69] : memref<2xi32>
              %c1_i32_70 = arith.constant 1 : i32
              %18 = arith.addi %17, %c1_i32_70 : i32
              %c0_71 = arith.constant 0 : index
              memref.store %18, %idx_buffer_pv_2[%c0_71] : memref<2xi32>
            }
            %c0_64 = arith.constant 0 : index
            %c0_i32_65 = arith.constant 0 : i32
            memref.store %c0_i32_65, %idx_buffer_pv_2[%c0_64] : memref<2xi32>
            %c1_66 = arith.constant 1 : index
            %15 = memref.load %idx_buffer_pv_2[%c1_66] : memref<2xi32>
            %c8_i32 = arith.constant 8 : i32
            %16 = arith.addi %15, %c8_i32 : i32
            %c1_67 = arith.constant 1 : index
            memref.store %16, %idx_buffer_pv_2[%c1_67] : memref<2xi32>
            aie.objectfifo.release @outO2(Produce, 1)
          }
        }
      }
      aie.end
    } {stack_size = 3328 : i32}
    %lock_3_4 = aie.lock(%logical_core_18)
    %core_3_4 = aie.core(%logical_core_18) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c1_49 = arith.constant 1 : index
      scf.for %arg0 = %c0 to %c1 step %c1_49 {
        %c1_i32 = arith.constant 1 : i32
        aie.use_lock(%lock_3_4, Acquire, %c1_i32)
        %c0_50 = arith.constant 0 : index
        %0 = memref.load %mha_rtpss_3_stage2[%c0_50] : memref<4xi32>
        %c1_51 = arith.constant 1 : index
        %1 = memref.load %mha_rtpss_3_stage2[%c1_51] : memref<4xi32>
        %c0_52 = arith.constant 0 : index
        %c9223372036854775807 = arith.constant 9223372036854775807 : index
        %c1_53 = arith.constant 1 : index
        scf.for %arg1 = %c0_52 to %c9223372036854775807 step %c1_53 {
          %c0_54 = arith.constant 0 : index
          %c0_i32 = arith.constant 0 : i32
          memref.store %c0_i32, %idx_buffer_pv_3[%c0_54] : memref<2xi32>
          %c1_55 = arith.constant 1 : index
          %c3_i32 = arith.constant 3 : i32
          memref.store %c3_i32, %idx_buffer_pv_3[%c1_55] : memref<2xi32>
          %c0_56 = arith.constant 0 : index
          %2 = arith.index_cast %0 : i32 to index
          %c1_57 = arith.constant 1 : index
          scf.for %arg2 = %c0_56 to %2 step %c1_57 {
            %3 = aie.objectfifo.acquire @outO3(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %4 = aie.objectfifo.subview.access %3[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            func.call @zero_bf16(%4) : (memref<64x64xbf16>) -> ()
            %5 = aie.objectfifo.acquire @outP3(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %6 = aie.objectfifo.subview.access %5[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            %7 = aie.objectfifo.acquire @memV(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %8 = aie.objectfifo.subview.access %7[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            %9 = aie.objectfifo.acquire @scaleOF3(Consume, 1) : !aie.objectfifosubview<memref<256xbf16>>
            %10 = aie.objectfifo.subview.access %9[0] : !aie.objectfifosubview<memref<256xbf16>> -> memref<256xbf16>
            %c64_i32 = arith.constant 64 : i32
            %c0_i32_58 = arith.constant 0 : i32
            func.call @matmul_PV(%6, %8, %4, %10, %c64_i32, %c0_i32_58, %idx_buffer_pv_3) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>, memref<256xbf16>, i32, i32, memref<2xi32>) -> ()
            aie.objectfifo.release @outP3(Consume, 1)
            aie.objectfifo.release @memV(Consume, 1)
            aie.objectfifo.release @scaleOF3(Consume, 1)
            %c0_59 = arith.constant 0 : index
            %11 = memref.load %idx_buffer_pv_3[%c0_59] : memref<2xi32>
            %c1_i32_60 = arith.constant 1 : i32
            %12 = arith.addi %11, %c1_i32_60 : i32
            %c0_61 = arith.constant 0 : index
            memref.store %12, %idx_buffer_pv_3[%c0_61] : memref<2xi32>
            %c2_i32 = arith.constant 2 : i32
            %13 = arith.cmpi sgt, %1, %c2_i32 : i32
            scf.if %13 {
              %c2_i32_67 = arith.constant 2 : i32
              %17 = arith.subi %1, %c2_i32_67 : i32
              %c0_68 = arith.constant 0 : index
              %18 = arith.index_cast %17 : i32 to index
              %c1_69 = arith.constant 1 : index
              scf.for %arg3 = %c0_68 to %18 step %c1_69 {
                %19 = aie.objectfifo.acquire @outP3(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
                %20 = aie.objectfifo.subview.access %19[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
                %21 = aie.objectfifo.acquire @memV(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
                %22 = aie.objectfifo.subview.access %21[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
                %23 = aie.objectfifo.acquire @scaleOF3(Consume, 1) : !aie.objectfifosubview<memref<256xbf16>>
                %24 = aie.objectfifo.subview.access %23[0] : !aie.objectfifosubview<memref<256xbf16>> -> memref<256xbf16>
                %c64_i32_70 = arith.constant 64 : i32
                %c1_i32_71 = arith.constant 1 : i32
                func.call @matmul_PV(%20, %22, %4, %24, %c64_i32_70, %c1_i32_71, %idx_buffer_pv_3) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>, memref<256xbf16>, i32, i32, memref<2xi32>) -> ()
                aie.objectfifo.release @outP3(Consume, 1)
                aie.objectfifo.release @memV(Consume, 1)
                aie.objectfifo.release @scaleOF3(Consume, 1)
                %c0_72 = arith.constant 0 : index
                %25 = memref.load %idx_buffer_pv_3[%c0_72] : memref<2xi32>
                %c1_i32_73 = arith.constant 1 : i32
                %26 = arith.addi %25, %c1_i32_73 : i32
                %c0_74 = arith.constant 0 : index
                memref.store %26, %idx_buffer_pv_3[%c0_74] : memref<2xi32>
              }
            } else {
            }
            %c1_i32_62 = arith.constant 1 : i32
            %14 = arith.cmpi sgt, %1, %c1_i32_62 : i32
            scf.if %14 {
              %17 = aie.objectfifo.acquire @outP3(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
              %18 = aie.objectfifo.subview.access %17[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
              %19 = aie.objectfifo.acquire @memV(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
              %20 = aie.objectfifo.subview.access %19[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
              %21 = aie.objectfifo.acquire @scaleOF3(Consume, 1) : !aie.objectfifosubview<memref<256xbf16>>
              %22 = aie.objectfifo.subview.access %21[0] : !aie.objectfifosubview<memref<256xbf16>> -> memref<256xbf16>
              %c64_i32_67 = arith.constant 64 : i32
              %c1_i32_68 = arith.constant 1 : i32
              func.call @matmul_PV(%18, %20, %4, %22, %c64_i32_67, %c1_i32_68, %idx_buffer_pv_3) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>, memref<256xbf16>, i32, i32, memref<2xi32>) -> ()
              %c64_i32_69 = arith.constant 64 : i32
              func.call @rescale_O(%4, %22, %c64_i32_69, %idx_buffer_pv_3) : (memref<64x64xbf16>, memref<256xbf16>, i32, memref<2xi32>) -> ()
              aie.objectfifo.release @outP3(Consume, 1)
              aie.objectfifo.release @memV(Consume, 1)
              aie.objectfifo.release @scaleOF3(Consume, 1)
              %c0_70 = arith.constant 0 : index
              %23 = memref.load %idx_buffer_pv_3[%c0_70] : memref<2xi32>
              %c1_i32_71 = arith.constant 1 : i32
              %24 = arith.addi %23, %c1_i32_71 : i32
              %c0_72 = arith.constant 0 : index
              memref.store %24, %idx_buffer_pv_3[%c0_72] : memref<2xi32>
            } else {
              %c64_i32_67 = arith.constant 64 : i32
              func.call @rescale_O(%4, %10, %c64_i32_67, %idx_buffer_pv_3) : (memref<64x64xbf16>, memref<256xbf16>, i32, memref<2xi32>) -> ()
              %c0_68 = arith.constant 0 : index
              %17 = memref.load %idx_buffer_pv_3[%c0_68] : memref<2xi32>
              %c1_i32_69 = arith.constant 1 : i32
              %18 = arith.addi %17, %c1_i32_69 : i32
              %c0_70 = arith.constant 0 : index
              memref.store %18, %idx_buffer_pv_3[%c0_70] : memref<2xi32>
            }
            %c0_63 = arith.constant 0 : index
            %c0_i32_64 = arith.constant 0 : i32
            memref.store %c0_i32_64, %idx_buffer_pv_3[%c0_63] : memref<2xi32>
            %c1_65 = arith.constant 1 : index
            %15 = memref.load %idx_buffer_pv_3[%c1_65] : memref<2xi32>
            %c8_i32 = arith.constant 8 : i32
            %16 = arith.addi %15, %c8_i32 : i32
            %c1_66 = arith.constant 1 : index
            memref.store %16, %idx_buffer_pv_3[%c1_66] : memref<2xi32>
            aie.objectfifo.release @outO3(Produce, 1)
          }
        }
      }
      aie.end
    } {stack_size = 3328 : i32}
    %lock_4_4 = aie.lock(%logical_core_19)
    %core_4_4 = aie.core(%logical_core_19) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c1_49 = arith.constant 1 : index
      scf.for %arg0 = %c0 to %c1 step %c1_49 {
        %c1_i32 = arith.constant 1 : i32
        aie.use_lock(%lock_4_4, Acquire, %c1_i32)
        %c0_50 = arith.constant 0 : index
        %0 = memref.load %mha_rtpss_4_stage2[%c0_50] : memref<4xi32>
        %c1_51 = arith.constant 1 : index
        %1 = memref.load %mha_rtpss_4_stage2[%c1_51] : memref<4xi32>
        %c0_52 = arith.constant 0 : index
        %c9223372036854775807 = arith.constant 9223372036854775807 : index
        %c1_53 = arith.constant 1 : index
        scf.for %arg1 = %c0_52 to %c9223372036854775807 step %c1_53 {
          %c0_54 = arith.constant 0 : index
          %c0_i32 = arith.constant 0 : i32
          memref.store %c0_i32, %idx_buffer_pv_4[%c0_54] : memref<2xi32>
          %c1_55 = arith.constant 1 : index
          %c4_i32 = arith.constant 4 : i32
          memref.store %c4_i32, %idx_buffer_pv_4[%c1_55] : memref<2xi32>
          %c0_56 = arith.constant 0 : index
          %2 = arith.index_cast %0 : i32 to index
          %c1_57 = arith.constant 1 : index
          scf.for %arg2 = %c0_56 to %2 step %c1_57 {
            %3 = aie.objectfifo.acquire @outO20(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %4 = aie.objectfifo.subview.access %3[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            func.call @zero_bf16(%4) : (memref<64x64xbf16>) -> ()
            %5 = aie.objectfifo.acquire @outP4(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %6 = aie.objectfifo.subview.access %5[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            %7 = aie.objectfifo.acquire @memV(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %8 = aie.objectfifo.subview.access %7[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            %9 = aie.objectfifo.acquire @scaleOF4(Consume, 1) : !aie.objectfifosubview<memref<256xbf16>>
            %10 = aie.objectfifo.subview.access %9[0] : !aie.objectfifosubview<memref<256xbf16>> -> memref<256xbf16>
            %c64_i32 = arith.constant 64 : i32
            %c0_i32_58 = arith.constant 0 : i32
            func.call @matmul_PV(%6, %8, %4, %10, %c64_i32, %c0_i32_58, %idx_buffer_pv_4) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>, memref<256xbf16>, i32, i32, memref<2xi32>) -> ()
            aie.objectfifo.release @outP4(Consume, 1)
            aie.objectfifo.release @memV(Consume, 1)
            aie.objectfifo.release @scaleOF4(Consume, 1)
            %c0_59 = arith.constant 0 : index
            %11 = memref.load %idx_buffer_pv_4[%c0_59] : memref<2xi32>
            %c1_i32_60 = arith.constant 1 : i32
            %12 = arith.addi %11, %c1_i32_60 : i32
            %c0_61 = arith.constant 0 : index
            memref.store %12, %idx_buffer_pv_4[%c0_61] : memref<2xi32>
            %c2_i32 = arith.constant 2 : i32
            %13 = arith.cmpi sgt, %1, %c2_i32 : i32
            scf.if %13 {
              %c2_i32_67 = arith.constant 2 : i32
              %17 = arith.subi %1, %c2_i32_67 : i32
              %c0_68 = arith.constant 0 : index
              %18 = arith.index_cast %17 : i32 to index
              %c1_69 = arith.constant 1 : index
              scf.for %arg3 = %c0_68 to %18 step %c1_69 {
                %19 = aie.objectfifo.acquire @outP4(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
                %20 = aie.objectfifo.subview.access %19[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
                %21 = aie.objectfifo.acquire @memV(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
                %22 = aie.objectfifo.subview.access %21[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
                %23 = aie.objectfifo.acquire @scaleOF4(Consume, 1) : !aie.objectfifosubview<memref<256xbf16>>
                %24 = aie.objectfifo.subview.access %23[0] : !aie.objectfifosubview<memref<256xbf16>> -> memref<256xbf16>
                %c64_i32_70 = arith.constant 64 : i32
                %c1_i32_71 = arith.constant 1 : i32
                func.call @matmul_PV(%20, %22, %4, %24, %c64_i32_70, %c1_i32_71, %idx_buffer_pv_4) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>, memref<256xbf16>, i32, i32, memref<2xi32>) -> ()
                aie.objectfifo.release @outP4(Consume, 1)
                aie.objectfifo.release @memV(Consume, 1)
                aie.objectfifo.release @scaleOF4(Consume, 1)
                %c0_72 = arith.constant 0 : index
                %25 = memref.load %idx_buffer_pv_4[%c0_72] : memref<2xi32>
                %c1_i32_73 = arith.constant 1 : i32
                %26 = arith.addi %25, %c1_i32_73 : i32
                %c0_74 = arith.constant 0 : index
                memref.store %26, %idx_buffer_pv_4[%c0_74] : memref<2xi32>
              }
            } else {
            }
            %c1_i32_62 = arith.constant 1 : i32
            %14 = arith.cmpi sgt, %1, %c1_i32_62 : i32
            scf.if %14 {
              %17 = aie.objectfifo.acquire @outP4(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
              %18 = aie.objectfifo.subview.access %17[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
              %19 = aie.objectfifo.acquire @memV(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
              %20 = aie.objectfifo.subview.access %19[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
              %21 = aie.objectfifo.acquire @scaleOF4(Consume, 1) : !aie.objectfifosubview<memref<256xbf16>>
              %22 = aie.objectfifo.subview.access %21[0] : !aie.objectfifosubview<memref<256xbf16>> -> memref<256xbf16>
              %c64_i32_67 = arith.constant 64 : i32
              %c1_i32_68 = arith.constant 1 : i32
              func.call @matmul_PV(%18, %20, %4, %22, %c64_i32_67, %c1_i32_68, %idx_buffer_pv_4) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>, memref<256xbf16>, i32, i32, memref<2xi32>) -> ()
              %c64_i32_69 = arith.constant 64 : i32
              func.call @rescale_O(%4, %22, %c64_i32_69, %idx_buffer_pv_4) : (memref<64x64xbf16>, memref<256xbf16>, i32, memref<2xi32>) -> ()
              aie.objectfifo.release @outP4(Consume, 1)
              aie.objectfifo.release @memV(Consume, 1)
              aie.objectfifo.release @scaleOF4(Consume, 1)
              %c0_70 = arith.constant 0 : index
              %23 = memref.load %idx_buffer_pv_4[%c0_70] : memref<2xi32>
              %c1_i32_71 = arith.constant 1 : i32
              %24 = arith.addi %23, %c1_i32_71 : i32
              %c0_72 = arith.constant 0 : index
              memref.store %24, %idx_buffer_pv_4[%c0_72] : memref<2xi32>
            } else {
              %c64_i32_67 = arith.constant 64 : i32
              func.call @rescale_O(%4, %10, %c64_i32_67, %idx_buffer_pv_4) : (memref<64x64xbf16>, memref<256xbf16>, i32, memref<2xi32>) -> ()
              %c0_68 = arith.constant 0 : index
              %17 = memref.load %idx_buffer_pv_4[%c0_68] : memref<2xi32>
              %c1_i32_69 = arith.constant 1 : i32
              %18 = arith.addi %17, %c1_i32_69 : i32
              %c0_70 = arith.constant 0 : index
              memref.store %18, %idx_buffer_pv_4[%c0_70] : memref<2xi32>
            }
            %c0_63 = arith.constant 0 : index
            %c0_i32_64 = arith.constant 0 : i32
            memref.store %c0_i32_64, %idx_buffer_pv_4[%c0_63] : memref<2xi32>
            %c1_65 = arith.constant 1 : index
            %15 = memref.load %idx_buffer_pv_4[%c1_65] : memref<2xi32>
            %c8_i32 = arith.constant 8 : i32
            %16 = arith.addi %15, %c8_i32 : i32
            %c1_66 = arith.constant 1 : index
            memref.store %16, %idx_buffer_pv_4[%c1_66] : memref<2xi32>
            aie.objectfifo.release @outO20(Produce, 1)
          }
        }
      }
      aie.end
    } {stack_size = 3328 : i32}
    %lock_5_4 = aie.lock(%logical_core_20)
    %core_5_4 = aie.core(%logical_core_20) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c1_49 = arith.constant 1 : index
      scf.for %arg0 = %c0 to %c1 step %c1_49 {
        %c1_i32 = arith.constant 1 : i32
        aie.use_lock(%lock_5_4, Acquire, %c1_i32)
        %c0_50 = arith.constant 0 : index
        %0 = memref.load %mha_rtpss_5_stage2[%c0_50] : memref<4xi32>
        %c1_51 = arith.constant 1 : index
        %1 = memref.load %mha_rtpss_5_stage2[%c1_51] : memref<4xi32>
        %c0_52 = arith.constant 0 : index
        %c9223372036854775807 = arith.constant 9223372036854775807 : index
        %c1_53 = arith.constant 1 : index
        scf.for %arg1 = %c0_52 to %c9223372036854775807 step %c1_53 {
          %c0_54 = arith.constant 0 : index
          %c0_i32 = arith.constant 0 : i32
          memref.store %c0_i32, %idx_buffer_pv_5[%c0_54] : memref<2xi32>
          %c1_55 = arith.constant 1 : index
          %c5_i32 = arith.constant 5 : i32
          memref.store %c5_i32, %idx_buffer_pv_5[%c1_55] : memref<2xi32>
          %c0_56 = arith.constant 0 : index
          %2 = arith.index_cast %0 : i32 to index
          %c1_57 = arith.constant 1 : index
          scf.for %arg2 = %c0_56 to %2 step %c1_57 {
            %3 = aie.objectfifo.acquire @outO21(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %4 = aie.objectfifo.subview.access %3[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            func.call @zero_bf16(%4) : (memref<64x64xbf16>) -> ()
            %5 = aie.objectfifo.acquire @outP5(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %6 = aie.objectfifo.subview.access %5[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            %7 = aie.objectfifo.acquire @memV(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %8 = aie.objectfifo.subview.access %7[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            %9 = aie.objectfifo.acquire @scaleOF5(Consume, 1) : !aie.objectfifosubview<memref<256xbf16>>
            %10 = aie.objectfifo.subview.access %9[0] : !aie.objectfifosubview<memref<256xbf16>> -> memref<256xbf16>
            %c64_i32 = arith.constant 64 : i32
            %c0_i32_58 = arith.constant 0 : i32
            func.call @matmul_PV(%6, %8, %4, %10, %c64_i32, %c0_i32_58, %idx_buffer_pv_5) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>, memref<256xbf16>, i32, i32, memref<2xi32>) -> ()
            aie.objectfifo.release @outP5(Consume, 1)
            aie.objectfifo.release @memV(Consume, 1)
            aie.objectfifo.release @scaleOF5(Consume, 1)
            %c0_59 = arith.constant 0 : index
            %11 = memref.load %idx_buffer_pv_5[%c0_59] : memref<2xi32>
            %c1_i32_60 = arith.constant 1 : i32
            %12 = arith.addi %11, %c1_i32_60 : i32
            %c0_61 = arith.constant 0 : index
            memref.store %12, %idx_buffer_pv_5[%c0_61] : memref<2xi32>
            %c2_i32 = arith.constant 2 : i32
            %13 = arith.cmpi sgt, %1, %c2_i32 : i32
            scf.if %13 {
              %c2_i32_67 = arith.constant 2 : i32
              %17 = arith.subi %1, %c2_i32_67 : i32
              %c0_68 = arith.constant 0 : index
              %18 = arith.index_cast %17 : i32 to index
              %c1_69 = arith.constant 1 : index
              scf.for %arg3 = %c0_68 to %18 step %c1_69 {
                %19 = aie.objectfifo.acquire @outP5(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
                %20 = aie.objectfifo.subview.access %19[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
                %21 = aie.objectfifo.acquire @memV(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
                %22 = aie.objectfifo.subview.access %21[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
                %23 = aie.objectfifo.acquire @scaleOF5(Consume, 1) : !aie.objectfifosubview<memref<256xbf16>>
                %24 = aie.objectfifo.subview.access %23[0] : !aie.objectfifosubview<memref<256xbf16>> -> memref<256xbf16>
                %c64_i32_70 = arith.constant 64 : i32
                %c1_i32_71 = arith.constant 1 : i32
                func.call @matmul_PV(%20, %22, %4, %24, %c64_i32_70, %c1_i32_71, %idx_buffer_pv_5) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>, memref<256xbf16>, i32, i32, memref<2xi32>) -> ()
                aie.objectfifo.release @outP5(Consume, 1)
                aie.objectfifo.release @memV(Consume, 1)
                aie.objectfifo.release @scaleOF5(Consume, 1)
                %c0_72 = arith.constant 0 : index
                %25 = memref.load %idx_buffer_pv_5[%c0_72] : memref<2xi32>
                %c1_i32_73 = arith.constant 1 : i32
                %26 = arith.addi %25, %c1_i32_73 : i32
                %c0_74 = arith.constant 0 : index
                memref.store %26, %idx_buffer_pv_5[%c0_74] : memref<2xi32>
              }
            } else {
            }
            %c1_i32_62 = arith.constant 1 : i32
            %14 = arith.cmpi sgt, %1, %c1_i32_62 : i32
            scf.if %14 {
              %17 = aie.objectfifo.acquire @outP5(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
              %18 = aie.objectfifo.subview.access %17[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
              %19 = aie.objectfifo.acquire @memV(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
              %20 = aie.objectfifo.subview.access %19[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
              %21 = aie.objectfifo.acquire @scaleOF5(Consume, 1) : !aie.objectfifosubview<memref<256xbf16>>
              %22 = aie.objectfifo.subview.access %21[0] : !aie.objectfifosubview<memref<256xbf16>> -> memref<256xbf16>
              %c64_i32_67 = arith.constant 64 : i32
              %c1_i32_68 = arith.constant 1 : i32
              func.call @matmul_PV(%18, %20, %4, %22, %c64_i32_67, %c1_i32_68, %idx_buffer_pv_5) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>, memref<256xbf16>, i32, i32, memref<2xi32>) -> ()
              %c64_i32_69 = arith.constant 64 : i32
              func.call @rescale_O(%4, %22, %c64_i32_69, %idx_buffer_pv_5) : (memref<64x64xbf16>, memref<256xbf16>, i32, memref<2xi32>) -> ()
              aie.objectfifo.release @outP5(Consume, 1)
              aie.objectfifo.release @memV(Consume, 1)
              aie.objectfifo.release @scaleOF5(Consume, 1)
              %c0_70 = arith.constant 0 : index
              %23 = memref.load %idx_buffer_pv_5[%c0_70] : memref<2xi32>
              %c1_i32_71 = arith.constant 1 : i32
              %24 = arith.addi %23, %c1_i32_71 : i32
              %c0_72 = arith.constant 0 : index
              memref.store %24, %idx_buffer_pv_5[%c0_72] : memref<2xi32>
            } else {
              %c64_i32_67 = arith.constant 64 : i32
              func.call @rescale_O(%4, %10, %c64_i32_67, %idx_buffer_pv_5) : (memref<64x64xbf16>, memref<256xbf16>, i32, memref<2xi32>) -> ()
              %c0_68 = arith.constant 0 : index
              %17 = memref.load %idx_buffer_pv_5[%c0_68] : memref<2xi32>
              %c1_i32_69 = arith.constant 1 : i32
              %18 = arith.addi %17, %c1_i32_69 : i32
              %c0_70 = arith.constant 0 : index
              memref.store %18, %idx_buffer_pv_5[%c0_70] : memref<2xi32>
            }
            %c0_63 = arith.constant 0 : index
            %c0_i32_64 = arith.constant 0 : i32
            memref.store %c0_i32_64, %idx_buffer_pv_5[%c0_63] : memref<2xi32>
            %c1_65 = arith.constant 1 : index
            %15 = memref.load %idx_buffer_pv_5[%c1_65] : memref<2xi32>
            %c8_i32 = arith.constant 8 : i32
            %16 = arith.addi %15, %c8_i32 : i32
            %c1_66 = arith.constant 1 : index
            memref.store %16, %idx_buffer_pv_5[%c1_66] : memref<2xi32>
            aie.objectfifo.release @outO21(Produce, 1)
          }
        }
      }
      aie.end
    } {stack_size = 3328 : i32}
    %lock_6_4 = aie.lock(%logical_core_21)
    %core_6_4 = aie.core(%logical_core_21) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c1_49 = arith.constant 1 : index
      scf.for %arg0 = %c0 to %c1 step %c1_49 {
        %c1_i32 = arith.constant 1 : i32
        aie.use_lock(%lock_6_4, Acquire, %c1_i32)
        %c0_50 = arith.constant 0 : index
        %0 = memref.load %mha_rtpss_6_stage2[%c0_50] : memref<4xi32>
        %c1_51 = arith.constant 1 : index
        %1 = memref.load %mha_rtpss_6_stage2[%c1_51] : memref<4xi32>
        %c0_52 = arith.constant 0 : index
        %c9223372036854775807 = arith.constant 9223372036854775807 : index
        %c1_53 = arith.constant 1 : index
        scf.for %arg1 = %c0_52 to %c9223372036854775807 step %c1_53 {
          %c0_54 = arith.constant 0 : index
          %c0_i32 = arith.constant 0 : i32
          memref.store %c0_i32, %idx_buffer_pv_6[%c0_54] : memref<2xi32>
          %c1_55 = arith.constant 1 : index
          %c6_i32 = arith.constant 6 : i32
          memref.store %c6_i32, %idx_buffer_pv_6[%c1_55] : memref<2xi32>
          %c0_56 = arith.constant 0 : index
          %2 = arith.index_cast %0 : i32 to index
          %c1_57 = arith.constant 1 : index
          scf.for %arg2 = %c0_56 to %2 step %c1_57 {
            %3 = aie.objectfifo.acquire @outO22(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %4 = aie.objectfifo.subview.access %3[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            func.call @zero_bf16(%4) : (memref<64x64xbf16>) -> ()
            %5 = aie.objectfifo.acquire @outP6(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %6 = aie.objectfifo.subview.access %5[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            %7 = aie.objectfifo.acquire @memV(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %8 = aie.objectfifo.subview.access %7[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            %9 = aie.objectfifo.acquire @scaleOF6(Consume, 1) : !aie.objectfifosubview<memref<256xbf16>>
            %10 = aie.objectfifo.subview.access %9[0] : !aie.objectfifosubview<memref<256xbf16>> -> memref<256xbf16>
            %c64_i32 = arith.constant 64 : i32
            %c0_i32_58 = arith.constant 0 : i32
            func.call @matmul_PV(%6, %8, %4, %10, %c64_i32, %c0_i32_58, %idx_buffer_pv_6) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>, memref<256xbf16>, i32, i32, memref<2xi32>) -> ()
            aie.objectfifo.release @outP6(Consume, 1)
            aie.objectfifo.release @memV(Consume, 1)
            aie.objectfifo.release @scaleOF6(Consume, 1)
            %c0_59 = arith.constant 0 : index
            %11 = memref.load %idx_buffer_pv_6[%c0_59] : memref<2xi32>
            %c1_i32_60 = arith.constant 1 : i32
            %12 = arith.addi %11, %c1_i32_60 : i32
            %c0_61 = arith.constant 0 : index
            memref.store %12, %idx_buffer_pv_6[%c0_61] : memref<2xi32>
            %c2_i32 = arith.constant 2 : i32
            %13 = arith.cmpi sgt, %1, %c2_i32 : i32
            scf.if %13 {
              %c2_i32_67 = arith.constant 2 : i32
              %17 = arith.subi %1, %c2_i32_67 : i32
              %c0_68 = arith.constant 0 : index
              %18 = arith.index_cast %17 : i32 to index
              %c1_69 = arith.constant 1 : index
              scf.for %arg3 = %c0_68 to %18 step %c1_69 {
                %19 = aie.objectfifo.acquire @outP6(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
                %20 = aie.objectfifo.subview.access %19[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
                %21 = aie.objectfifo.acquire @memV(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
                %22 = aie.objectfifo.subview.access %21[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
                %23 = aie.objectfifo.acquire @scaleOF6(Consume, 1) : !aie.objectfifosubview<memref<256xbf16>>
                %24 = aie.objectfifo.subview.access %23[0] : !aie.objectfifosubview<memref<256xbf16>> -> memref<256xbf16>
                %c64_i32_70 = arith.constant 64 : i32
                %c1_i32_71 = arith.constant 1 : i32
                func.call @matmul_PV(%20, %22, %4, %24, %c64_i32_70, %c1_i32_71, %idx_buffer_pv_6) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>, memref<256xbf16>, i32, i32, memref<2xi32>) -> ()
                aie.objectfifo.release @outP6(Consume, 1)
                aie.objectfifo.release @memV(Consume, 1)
                aie.objectfifo.release @scaleOF6(Consume, 1)
                %c0_72 = arith.constant 0 : index
                %25 = memref.load %idx_buffer_pv_6[%c0_72] : memref<2xi32>
                %c1_i32_73 = arith.constant 1 : i32
                %26 = arith.addi %25, %c1_i32_73 : i32
                %c0_74 = arith.constant 0 : index
                memref.store %26, %idx_buffer_pv_6[%c0_74] : memref<2xi32>
              }
            } else {
            }
            %c1_i32_62 = arith.constant 1 : i32
            %14 = arith.cmpi sgt, %1, %c1_i32_62 : i32
            scf.if %14 {
              %17 = aie.objectfifo.acquire @outP6(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
              %18 = aie.objectfifo.subview.access %17[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
              %19 = aie.objectfifo.acquire @memV(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
              %20 = aie.objectfifo.subview.access %19[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
              %21 = aie.objectfifo.acquire @scaleOF6(Consume, 1) : !aie.objectfifosubview<memref<256xbf16>>
              %22 = aie.objectfifo.subview.access %21[0] : !aie.objectfifosubview<memref<256xbf16>> -> memref<256xbf16>
              %c64_i32_67 = arith.constant 64 : i32
              %c1_i32_68 = arith.constant 1 : i32
              func.call @matmul_PV(%18, %20, %4, %22, %c64_i32_67, %c1_i32_68, %idx_buffer_pv_6) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>, memref<256xbf16>, i32, i32, memref<2xi32>) -> ()
              %c64_i32_69 = arith.constant 64 : i32
              func.call @rescale_O(%4, %22, %c64_i32_69, %idx_buffer_pv_6) : (memref<64x64xbf16>, memref<256xbf16>, i32, memref<2xi32>) -> ()
              aie.objectfifo.release @outP6(Consume, 1)
              aie.objectfifo.release @memV(Consume, 1)
              aie.objectfifo.release @scaleOF6(Consume, 1)
              %c0_70 = arith.constant 0 : index
              %23 = memref.load %idx_buffer_pv_6[%c0_70] : memref<2xi32>
              %c1_i32_71 = arith.constant 1 : i32
              %24 = arith.addi %23, %c1_i32_71 : i32
              %c0_72 = arith.constant 0 : index
              memref.store %24, %idx_buffer_pv_6[%c0_72] : memref<2xi32>
            } else {
              %c64_i32_67 = arith.constant 64 : i32
              func.call @rescale_O(%4, %10, %c64_i32_67, %idx_buffer_pv_6) : (memref<64x64xbf16>, memref<256xbf16>, i32, memref<2xi32>) -> ()
              %c0_68 = arith.constant 0 : index
              %17 = memref.load %idx_buffer_pv_6[%c0_68] : memref<2xi32>
              %c1_i32_69 = arith.constant 1 : i32
              %18 = arith.addi %17, %c1_i32_69 : i32
              %c0_70 = arith.constant 0 : index
              memref.store %18, %idx_buffer_pv_6[%c0_70] : memref<2xi32>
            }
            %c0_63 = arith.constant 0 : index
            %c0_i32_64 = arith.constant 0 : i32
            memref.store %c0_i32_64, %idx_buffer_pv_6[%c0_63] : memref<2xi32>
            %c1_65 = arith.constant 1 : index
            %15 = memref.load %idx_buffer_pv_6[%c1_65] : memref<2xi32>
            %c8_i32 = arith.constant 8 : i32
            %16 = arith.addi %15, %c8_i32 : i32
            %c1_66 = arith.constant 1 : index
            memref.store %16, %idx_buffer_pv_6[%c1_66] : memref<2xi32>
            aie.objectfifo.release @outO22(Produce, 1)
          }
        }
      }
      aie.end
    } {stack_size = 3328 : i32}
    %lock_7_4 = aie.lock(%logical_core_22)
    %core_7_4 = aie.core(%logical_core_22) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c1_49 = arith.constant 1 : index
      scf.for %arg0 = %c0 to %c1 step %c1_49 {
        %c1_i32 = arith.constant 1 : i32
        aie.use_lock(%lock_7_4, Acquire, %c1_i32)
        %c0_50 = arith.constant 0 : index
        %0 = memref.load %mha_rtpss_7_stage2[%c0_50] : memref<4xi32>
        %c1_51 = arith.constant 1 : index
        %1 = memref.load %mha_rtpss_7_stage2[%c1_51] : memref<4xi32>
        %c0_52 = arith.constant 0 : index
        %c9223372036854775807 = arith.constant 9223372036854775807 : index
        %c1_53 = arith.constant 1 : index
        scf.for %arg1 = %c0_52 to %c9223372036854775807 step %c1_53 {
          %c0_54 = arith.constant 0 : index
          %c0_i32 = arith.constant 0 : i32
          memref.store %c0_i32, %idx_buffer_pv_7[%c0_54] : memref<2xi32>
          %c1_55 = arith.constant 1 : index
          %c7_i32 = arith.constant 7 : i32
          memref.store %c7_i32, %idx_buffer_pv_7[%c1_55] : memref<2xi32>
          %c0_56 = arith.constant 0 : index
          %2 = arith.index_cast %0 : i32 to index
          %c1_57 = arith.constant 1 : index
          scf.for %arg2 = %c0_56 to %2 step %c1_57 {
            %3 = aie.objectfifo.acquire @outO23(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %4 = aie.objectfifo.subview.access %3[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            func.call @zero_bf16(%4) : (memref<64x64xbf16>) -> ()
            %5 = aie.objectfifo.acquire @outP7(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %6 = aie.objectfifo.subview.access %5[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            %7 = aie.objectfifo.acquire @memV(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %8 = aie.objectfifo.subview.access %7[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            %9 = aie.objectfifo.acquire @scaleOF7(Consume, 1) : !aie.objectfifosubview<memref<256xbf16>>
            %10 = aie.objectfifo.subview.access %9[0] : !aie.objectfifosubview<memref<256xbf16>> -> memref<256xbf16>
            %c64_i32 = arith.constant 64 : i32
            %c0_i32_58 = arith.constant 0 : i32
            func.call @matmul_PV(%6, %8, %4, %10, %c64_i32, %c0_i32_58, %idx_buffer_pv_7) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>, memref<256xbf16>, i32, i32, memref<2xi32>) -> ()
            aie.objectfifo.release @outP7(Consume, 1)
            aie.objectfifo.release @memV(Consume, 1)
            aie.objectfifo.release @scaleOF7(Consume, 1)
            %c0_59 = arith.constant 0 : index
            %11 = memref.load %idx_buffer_pv_7[%c0_59] : memref<2xi32>
            %c1_i32_60 = arith.constant 1 : i32
            %12 = arith.addi %11, %c1_i32_60 : i32
            %c0_61 = arith.constant 0 : index
            memref.store %12, %idx_buffer_pv_7[%c0_61] : memref<2xi32>
            %c2_i32 = arith.constant 2 : i32
            %13 = arith.cmpi sgt, %1, %c2_i32 : i32
            scf.if %13 {
              %c2_i32_67 = arith.constant 2 : i32
              %17 = arith.subi %1, %c2_i32_67 : i32
              %c0_68 = arith.constant 0 : index
              %18 = arith.index_cast %17 : i32 to index
              %c1_69 = arith.constant 1 : index
              scf.for %arg3 = %c0_68 to %18 step %c1_69 {
                %19 = aie.objectfifo.acquire @outP7(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
                %20 = aie.objectfifo.subview.access %19[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
                %21 = aie.objectfifo.acquire @memV(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
                %22 = aie.objectfifo.subview.access %21[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
                %23 = aie.objectfifo.acquire @scaleOF7(Consume, 1) : !aie.objectfifosubview<memref<256xbf16>>
                %24 = aie.objectfifo.subview.access %23[0] : !aie.objectfifosubview<memref<256xbf16>> -> memref<256xbf16>
                %c64_i32_70 = arith.constant 64 : i32
                %c1_i32_71 = arith.constant 1 : i32
                func.call @matmul_PV(%20, %22, %4, %24, %c64_i32_70, %c1_i32_71, %idx_buffer_pv_7) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>, memref<256xbf16>, i32, i32, memref<2xi32>) -> ()
                aie.objectfifo.release @outP7(Consume, 1)
                aie.objectfifo.release @memV(Consume, 1)
                aie.objectfifo.release @scaleOF7(Consume, 1)
                %c0_72 = arith.constant 0 : index
                %25 = memref.load %idx_buffer_pv_7[%c0_72] : memref<2xi32>
                %c1_i32_73 = arith.constant 1 : i32
                %26 = arith.addi %25, %c1_i32_73 : i32
                %c0_74 = arith.constant 0 : index
                memref.store %26, %idx_buffer_pv_7[%c0_74] : memref<2xi32>
              }
            } else {
            }
            %c1_i32_62 = arith.constant 1 : i32
            %14 = arith.cmpi sgt, %1, %c1_i32_62 : i32
            scf.if %14 {
              %17 = aie.objectfifo.acquire @outP7(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
              %18 = aie.objectfifo.subview.access %17[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
              %19 = aie.objectfifo.acquire @memV(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
              %20 = aie.objectfifo.subview.access %19[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
              %21 = aie.objectfifo.acquire @scaleOF7(Consume, 1) : !aie.objectfifosubview<memref<256xbf16>>
              %22 = aie.objectfifo.subview.access %21[0] : !aie.objectfifosubview<memref<256xbf16>> -> memref<256xbf16>
              %c64_i32_67 = arith.constant 64 : i32
              %c1_i32_68 = arith.constant 1 : i32
              func.call @matmul_PV(%18, %20, %4, %22, %c64_i32_67, %c1_i32_68, %idx_buffer_pv_7) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>, memref<256xbf16>, i32, i32, memref<2xi32>) -> ()
              %c64_i32_69 = arith.constant 64 : i32
              func.call @rescale_O(%4, %22, %c64_i32_69, %idx_buffer_pv_7) : (memref<64x64xbf16>, memref<256xbf16>, i32, memref<2xi32>) -> ()
              aie.objectfifo.release @outP7(Consume, 1)
              aie.objectfifo.release @memV(Consume, 1)
              aie.objectfifo.release @scaleOF7(Consume, 1)
              %c0_70 = arith.constant 0 : index
              %23 = memref.load %idx_buffer_pv_7[%c0_70] : memref<2xi32>
              %c1_i32_71 = arith.constant 1 : i32
              %24 = arith.addi %23, %c1_i32_71 : i32
              %c0_72 = arith.constant 0 : index
              memref.store %24, %idx_buffer_pv_7[%c0_72] : memref<2xi32>
            } else {
              %c64_i32_67 = arith.constant 64 : i32
              func.call @rescale_O(%4, %10, %c64_i32_67, %idx_buffer_pv_7) : (memref<64x64xbf16>, memref<256xbf16>, i32, memref<2xi32>) -> ()
              %c0_68 = arith.constant 0 : index
              %17 = memref.load %idx_buffer_pv_7[%c0_68] : memref<2xi32>
              %c1_i32_69 = arith.constant 1 : i32
              %18 = arith.addi %17, %c1_i32_69 : i32
              %c0_70 = arith.constant 0 : index
              memref.store %18, %idx_buffer_pv_7[%c0_70] : memref<2xi32>
            }
            %c0_63 = arith.constant 0 : index
            %c0_i32_64 = arith.constant 0 : i32
            memref.store %c0_i32_64, %idx_buffer_pv_7[%c0_63] : memref<2xi32>
            %c1_65 = arith.constant 1 : index
            %15 = memref.load %idx_buffer_pv_7[%c1_65] : memref<2xi32>
            %c8_i32 = arith.constant 8 : i32
            %16 = arith.addi %15, %c8_i32 : i32
            %c1_66 = arith.constant 1 : index
            memref.store %16, %idx_buffer_pv_7[%c1_66] : memref<2xi32>
            aie.objectfifo.release @outO23(Produce, 1)
          }
        }
      }
      aie.end
    } {stack_size = 3328 : i32}
    aie.runtime_sequence(%arg0: memref<24x512x64xbf16>, %arg1: memref<24x32768xbf16>, %arg2: memref<24x32768xbf16>, %arg3: memref<24x512x64xbf16>) {
      %c1_i32 = arith.constant 1 : i32
      aiex.npu.rtp_write(@mha_rtpss_0_stage0, 0, %c1_i32) : i32
      %c8_i32 = arith.constant 8 : i32
      aiex.npu.rtp_write(@mha_rtpss_0_stage0, 1, %c8_i32) : i32
      %c512_i32 = arith.constant 512 : i32
      aiex.npu.rtp_write(@mha_rtpss_0_stage0, 2, %c512_i32) : i32
      %c512_i32_49 = arith.constant 512 : i32
      aiex.npu.rtp_write(@mha_rtpss_0_stage0, 3, %c512_i32_49) : i32
      %c1_i32_50 = arith.constant 1 : i32
      aiex.npu.rtp_write(@mha_rtpss_1_stage0, 0, %c1_i32_50) : i32
      %c8_i32_51 = arith.constant 8 : i32
      aiex.npu.rtp_write(@mha_rtpss_1_stage0, 1, %c8_i32_51) : i32
      %c512_i32_52 = arith.constant 512 : i32
      aiex.npu.rtp_write(@mha_rtpss_1_stage0, 2, %c512_i32_52) : i32
      %c512_i32_53 = arith.constant 512 : i32
      aiex.npu.rtp_write(@mha_rtpss_1_stage0, 3, %c512_i32_53) : i32
      %c1_i32_54 = arith.constant 1 : i32
      aiex.npu.rtp_write(@mha_rtpss_2_stage0, 0, %c1_i32_54) : i32
      %c8_i32_55 = arith.constant 8 : i32
      aiex.npu.rtp_write(@mha_rtpss_2_stage0, 1, %c8_i32_55) : i32
      %c512_i32_56 = arith.constant 512 : i32
      aiex.npu.rtp_write(@mha_rtpss_2_stage0, 2, %c512_i32_56) : i32
      %c512_i32_57 = arith.constant 512 : i32
      aiex.npu.rtp_write(@mha_rtpss_2_stage0, 3, %c512_i32_57) : i32
      %c1_i32_58 = arith.constant 1 : i32
      aiex.npu.rtp_write(@mha_rtpss_3_stage0, 0, %c1_i32_58) : i32
      %c8_i32_59 = arith.constant 8 : i32
      aiex.npu.rtp_write(@mha_rtpss_3_stage0, 1, %c8_i32_59) : i32
      %c512_i32_60 = arith.constant 512 : i32
      aiex.npu.rtp_write(@mha_rtpss_3_stage0, 2, %c512_i32_60) : i32
      %c512_i32_61 = arith.constant 512 : i32
      aiex.npu.rtp_write(@mha_rtpss_3_stage0, 3, %c512_i32_61) : i32
      %c1_i32_62 = arith.constant 1 : i32
      aiex.npu.rtp_write(@mha_rtpss_4_stage0, 0, %c1_i32_62) : i32
      %c8_i32_63 = arith.constant 8 : i32
      aiex.npu.rtp_write(@mha_rtpss_4_stage0, 1, %c8_i32_63) : i32
      %c512_i32_64 = arith.constant 512 : i32
      aiex.npu.rtp_write(@mha_rtpss_4_stage0, 2, %c512_i32_64) : i32
      %c512_i32_65 = arith.constant 512 : i32
      aiex.npu.rtp_write(@mha_rtpss_4_stage0, 3, %c512_i32_65) : i32
      %c1_i32_66 = arith.constant 1 : i32
      aiex.npu.rtp_write(@mha_rtpss_5_stage0, 0, %c1_i32_66) : i32
      %c8_i32_67 = arith.constant 8 : i32
      aiex.npu.rtp_write(@mha_rtpss_5_stage0, 1, %c8_i32_67) : i32
      %c512_i32_68 = arith.constant 512 : i32
      aiex.npu.rtp_write(@mha_rtpss_5_stage0, 2, %c512_i32_68) : i32
      %c512_i32_69 = arith.constant 512 : i32
      aiex.npu.rtp_write(@mha_rtpss_5_stage0, 3, %c512_i32_69) : i32
      %c1_i32_70 = arith.constant 1 : i32
      aiex.npu.rtp_write(@mha_rtpss_6_stage0, 0, %c1_i32_70) : i32
      %c8_i32_71 = arith.constant 8 : i32
      aiex.npu.rtp_write(@mha_rtpss_6_stage0, 1, %c8_i32_71) : i32
      %c512_i32_72 = arith.constant 512 : i32
      aiex.npu.rtp_write(@mha_rtpss_6_stage0, 2, %c512_i32_72) : i32
      %c512_i32_73 = arith.constant 512 : i32
      aiex.npu.rtp_write(@mha_rtpss_6_stage0, 3, %c512_i32_73) : i32
      %c1_i32_74 = arith.constant 1 : i32
      aiex.npu.rtp_write(@mha_rtpss_7_stage0, 0, %c1_i32_74) : i32
      %c8_i32_75 = arith.constant 8 : i32
      aiex.npu.rtp_write(@mha_rtpss_7_stage0, 1, %c8_i32_75) : i32
      %c512_i32_76 = arith.constant 512 : i32
      aiex.npu.rtp_write(@mha_rtpss_7_stage0, 2, %c512_i32_76) : i32
      %c512_i32_77 = arith.constant 512 : i32
      aiex.npu.rtp_write(@mha_rtpss_7_stage0, 3, %c512_i32_77) : i32
      %c1_i32_78 = arith.constant 1 : i32
      aiex.npu.rtp_write(@mha_rtpss_0_stage1, 0, %c1_i32_78) : i32
      %c8_i32_79 = arith.constant 8 : i32
      aiex.npu.rtp_write(@mha_rtpss_0_stage1, 1, %c8_i32_79) : i32
      %c512_i32_80 = arith.constant 512 : i32
      aiex.npu.rtp_write(@mha_rtpss_0_stage1, 2, %c512_i32_80) : i32
      %c512_i32_81 = arith.constant 512 : i32
      aiex.npu.rtp_write(@mha_rtpss_0_stage1, 3, %c512_i32_81) : i32
      %c1_i32_82 = arith.constant 1 : i32
      aiex.npu.rtp_write(@mha_rtpss_1_stage1, 0, %c1_i32_82) : i32
      %c8_i32_83 = arith.constant 8 : i32
      aiex.npu.rtp_write(@mha_rtpss_1_stage1, 1, %c8_i32_83) : i32
      %c512_i32_84 = arith.constant 512 : i32
      aiex.npu.rtp_write(@mha_rtpss_1_stage1, 2, %c512_i32_84) : i32
      %c512_i32_85 = arith.constant 512 : i32
      aiex.npu.rtp_write(@mha_rtpss_1_stage1, 3, %c512_i32_85) : i32
      %c1_i32_86 = arith.constant 1 : i32
      aiex.npu.rtp_write(@mha_rtpss_2_stage1, 0, %c1_i32_86) : i32
      %c8_i32_87 = arith.constant 8 : i32
      aiex.npu.rtp_write(@mha_rtpss_2_stage1, 1, %c8_i32_87) : i32
      %c512_i32_88 = arith.constant 512 : i32
      aiex.npu.rtp_write(@mha_rtpss_2_stage1, 2, %c512_i32_88) : i32
      %c512_i32_89 = arith.constant 512 : i32
      aiex.npu.rtp_write(@mha_rtpss_2_stage1, 3, %c512_i32_89) : i32
      %c1_i32_90 = arith.constant 1 : i32
      aiex.npu.rtp_write(@mha_rtpss_3_stage1, 0, %c1_i32_90) : i32
      %c8_i32_91 = arith.constant 8 : i32
      aiex.npu.rtp_write(@mha_rtpss_3_stage1, 1, %c8_i32_91) : i32
      %c512_i32_92 = arith.constant 512 : i32
      aiex.npu.rtp_write(@mha_rtpss_3_stage1, 2, %c512_i32_92) : i32
      %c512_i32_93 = arith.constant 512 : i32
      aiex.npu.rtp_write(@mha_rtpss_3_stage1, 3, %c512_i32_93) : i32
      %c1_i32_94 = arith.constant 1 : i32
      aiex.npu.rtp_write(@mha_rtpss_4_stage1, 0, %c1_i32_94) : i32
      %c8_i32_95 = arith.constant 8 : i32
      aiex.npu.rtp_write(@mha_rtpss_4_stage1, 1, %c8_i32_95) : i32
      %c512_i32_96 = arith.constant 512 : i32
      aiex.npu.rtp_write(@mha_rtpss_4_stage1, 2, %c512_i32_96) : i32
      %c512_i32_97 = arith.constant 512 : i32
      aiex.npu.rtp_write(@mha_rtpss_4_stage1, 3, %c512_i32_97) : i32
      %c1_i32_98 = arith.constant 1 : i32
      aiex.npu.rtp_write(@mha_rtpss_5_stage1, 0, %c1_i32_98) : i32
      %c8_i32_99 = arith.constant 8 : i32
      aiex.npu.rtp_write(@mha_rtpss_5_stage1, 1, %c8_i32_99) : i32
      %c512_i32_100 = arith.constant 512 : i32
      aiex.npu.rtp_write(@mha_rtpss_5_stage1, 2, %c512_i32_100) : i32
      %c512_i32_101 = arith.constant 512 : i32
      aiex.npu.rtp_write(@mha_rtpss_5_stage1, 3, %c512_i32_101) : i32
      %c1_i32_102 = arith.constant 1 : i32
      aiex.npu.rtp_write(@mha_rtpss_6_stage1, 0, %c1_i32_102) : i32
      %c8_i32_103 = arith.constant 8 : i32
      aiex.npu.rtp_write(@mha_rtpss_6_stage1, 1, %c8_i32_103) : i32
      %c512_i32_104 = arith.constant 512 : i32
      aiex.npu.rtp_write(@mha_rtpss_6_stage1, 2, %c512_i32_104) : i32
      %c512_i32_105 = arith.constant 512 : i32
      aiex.npu.rtp_write(@mha_rtpss_6_stage1, 3, %c512_i32_105) : i32
      %c1_i32_106 = arith.constant 1 : i32
      aiex.npu.rtp_write(@mha_rtpss_7_stage1, 0, %c1_i32_106) : i32
      %c8_i32_107 = arith.constant 8 : i32
      aiex.npu.rtp_write(@mha_rtpss_7_stage1, 1, %c8_i32_107) : i32
      %c512_i32_108 = arith.constant 512 : i32
      aiex.npu.rtp_write(@mha_rtpss_7_stage1, 2, %c512_i32_108) : i32
      %c512_i32_109 = arith.constant 512 : i32
      aiex.npu.rtp_write(@mha_rtpss_7_stage1, 3, %c512_i32_109) : i32
      %c1_i32_110 = arith.constant 1 : i32
      aiex.npu.rtp_write(@mha_rtpss_0_stage2, 0, %c1_i32_110) : i32
      %c8_i32_111 = arith.constant 8 : i32
      aiex.npu.rtp_write(@mha_rtpss_0_stage2, 1, %c8_i32_111) : i32
      %c512_i32_112 = arith.constant 512 : i32
      aiex.npu.rtp_write(@mha_rtpss_0_stage2, 2, %c512_i32_112) : i32
      %c512_i32_113 = arith.constant 512 : i32
      aiex.npu.rtp_write(@mha_rtpss_0_stage2, 3, %c512_i32_113) : i32
      %c1_i32_114 = arith.constant 1 : i32
      aiex.npu.rtp_write(@mha_rtpss_1_stage2, 0, %c1_i32_114) : i32
      %c8_i32_115 = arith.constant 8 : i32
      aiex.npu.rtp_write(@mha_rtpss_1_stage2, 1, %c8_i32_115) : i32
      %c512_i32_116 = arith.constant 512 : i32
      aiex.npu.rtp_write(@mha_rtpss_1_stage2, 2, %c512_i32_116) : i32
      %c512_i32_117 = arith.constant 512 : i32
      aiex.npu.rtp_write(@mha_rtpss_1_stage2, 3, %c512_i32_117) : i32
      %c1_i32_118 = arith.constant 1 : i32
      aiex.npu.rtp_write(@mha_rtpss_2_stage2, 0, %c1_i32_118) : i32
      %c8_i32_119 = arith.constant 8 : i32
      aiex.npu.rtp_write(@mha_rtpss_2_stage2, 1, %c8_i32_119) : i32
      %c512_i32_120 = arith.constant 512 : i32
      aiex.npu.rtp_write(@mha_rtpss_2_stage2, 2, %c512_i32_120) : i32
      %c512_i32_121 = arith.constant 512 : i32
      aiex.npu.rtp_write(@mha_rtpss_2_stage2, 3, %c512_i32_121) : i32
      %c1_i32_122 = arith.constant 1 : i32
      aiex.npu.rtp_write(@mha_rtpss_3_stage2, 0, %c1_i32_122) : i32
      %c8_i32_123 = arith.constant 8 : i32
      aiex.npu.rtp_write(@mha_rtpss_3_stage2, 1, %c8_i32_123) : i32
      %c512_i32_124 = arith.constant 512 : i32
      aiex.npu.rtp_write(@mha_rtpss_3_stage2, 2, %c512_i32_124) : i32
      %c512_i32_125 = arith.constant 512 : i32
      aiex.npu.rtp_write(@mha_rtpss_3_stage2, 3, %c512_i32_125) : i32
      %c1_i32_126 = arith.constant 1 : i32
      aiex.npu.rtp_write(@mha_rtpss_4_stage2, 0, %c1_i32_126) : i32
      %c8_i32_127 = arith.constant 8 : i32
      aiex.npu.rtp_write(@mha_rtpss_4_stage2, 1, %c8_i32_127) : i32
      %c512_i32_128 = arith.constant 512 : i32
      aiex.npu.rtp_write(@mha_rtpss_4_stage2, 2, %c512_i32_128) : i32
      %c512_i32_129 = arith.constant 512 : i32
      aiex.npu.rtp_write(@mha_rtpss_4_stage2, 3, %c512_i32_129) : i32
      %c1_i32_130 = arith.constant 1 : i32
      aiex.npu.rtp_write(@mha_rtpss_5_stage2, 0, %c1_i32_130) : i32
      %c8_i32_131 = arith.constant 8 : i32
      aiex.npu.rtp_write(@mha_rtpss_5_stage2, 1, %c8_i32_131) : i32
      %c512_i32_132 = arith.constant 512 : i32
      aiex.npu.rtp_write(@mha_rtpss_5_stage2, 2, %c512_i32_132) : i32
      %c512_i32_133 = arith.constant 512 : i32
      aiex.npu.rtp_write(@mha_rtpss_5_stage2, 3, %c512_i32_133) : i32
      %c1_i32_134 = arith.constant 1 : i32
      aiex.npu.rtp_write(@mha_rtpss_6_stage2, 0, %c1_i32_134) : i32
      %c8_i32_135 = arith.constant 8 : i32
      aiex.npu.rtp_write(@mha_rtpss_6_stage2, 1, %c8_i32_135) : i32
      %c512_i32_136 = arith.constant 512 : i32
      aiex.npu.rtp_write(@mha_rtpss_6_stage2, 2, %c512_i32_136) : i32
      %c512_i32_137 = arith.constant 512 : i32
      aiex.npu.rtp_write(@mha_rtpss_6_stage2, 3, %c512_i32_137) : i32
      %c1_i32_138 = arith.constant 1 : i32
      aiex.npu.rtp_write(@mha_rtpss_7_stage2, 0, %c1_i32_138) : i32
      %c8_i32_139 = arith.constant 8 : i32
      aiex.npu.rtp_write(@mha_rtpss_7_stage2, 1, %c8_i32_139) : i32
      %c512_i32_140 = arith.constant 512 : i32
      aiex.npu.rtp_write(@mha_rtpss_7_stage2, 2, %c512_i32_140) : i32
      %c512_i32_141 = arith.constant 512 : i32
      aiex.npu.rtp_write(@mha_rtpss_7_stage2, 3, %c512_i32_141) : i32
      aiex.set_lock(%lock_0_2, 1)
      aiex.set_lock(%lock_1_2, 1)
      aiex.set_lock(%lock_2_2, 1)
      aiex.set_lock(%lock_3_2, 1)
      aiex.set_lock(%lock_4_2, 1)
      aiex.set_lock(%lock_5_2, 1)
      aiex.set_lock(%lock_6_2, 1)
      aiex.set_lock(%lock_7_2, 1)
      aiex.set_lock(%lock_0_3, 1)
      aiex.set_lock(%lock_1_3, 1)
      aiex.set_lock(%lock_2_3, 1)
      aiex.set_lock(%lock_3_3, 1)
      aiex.set_lock(%lock_4_3, 1)
      aiex.set_lock(%lock_5_3, 1)
      aiex.set_lock(%lock_6_3, 1)
      aiex.set_lock(%lock_7_3, 1)
      aiex.set_lock(%lock_0_4, 1)
      aiex.set_lock(%lock_1_4, 1)
      aiex.set_lock(%lock_2_4, 1)
      aiex.set_lock(%lock_3_4, 1)
      aiex.set_lock(%lock_4_4, 1)
      aiex.set_lock(%lock_5_4, 1)
      aiex.set_lock(%lock_6_4, 1)
      aiex.set_lock(%lock_7_4, 1)
      %0 = aiex.dma_configure_task_for @inQ {
        aie.dma_bd(%arg0 : memref<24x512x64xbf16> offset = 0 len = 16384 sizes = [1, 1, 256, 64] strides = [0, 0, 64, 1])
        aie.end
      }
      aiex.dma_start_task(%0)
      %1 = aiex.dma_configure_task_for @inQ2 {
        aie.dma_bd(%arg0 : memref<24x512x64xbf16> offset = 16384 len = 16384 sizes = [1, 1, 256, 64] strides = [0, 0, 64, 1])
        aie.end
      }
      aiex.dma_start_task(%1)
      %2 = aiex.dma_configure_task_for @inK {
        aie.dma_bd(%arg1 : memref<24x32768xbf16> offset = 0 len = 32768 sizes = [1, 1, 512, 64] strides = [0, 0, 64, 1])
        aie.end
      }
      aiex.dma_start_task(%2)
      %3 = aiex.dma_configure_task_for @inV {
        aie.dma_bd(%arg2 : memref<24x32768xbf16> offset = 0 len = 32768 sizes = [1, 1, 512, 64] strides = [0, 0, 64, 1])
        aie.end
      }
      aiex.dma_start_task(%3)
      %4 = aiex.dma_configure_task_for @memO {
        aie.dma_bd(%arg3 : memref<24x512x64xbf16> offset = 0 len = 16384 sizes = [1, 1, 256, 64] strides = [0, 0, 64, 1])
        aie.end
      } {issue_token = true}
      aiex.dma_start_task(%4)
      %5 = aiex.dma_configure_task_for @memO2 {
        aie.dma_bd(%arg3 : memref<24x512x64xbf16> offset = 16384 len = 16384 sizes = [1, 1, 256, 64] strides = [0, 0, 64, 1])
        aie.end
      } {issue_token = true}
      aiex.dma_start_task(%5)
      aiex.dma_await_task(%4)
      aiex.dma_await_task(%5)
      aiex.dma_free_task(%0)
      aiex.dma_free_task(%1)
      aiex.dma_free_task(%2)
      aiex.dma_free_task(%3)
      aiex.dma_free_task(%4)
      aiex.dma_free_task(%5)
      %6 = aiex.dma_configure_task_for @inQ {
        aie.dma_bd(%arg0 : memref<24x512x64xbf16> offset = 32768 len = 16384 sizes = [1, 1, 256, 64] strides = [0, 0, 64, 1])
        aie.end
      }
      aiex.dma_start_task(%6)
      %7 = aiex.dma_configure_task_for @inQ2 {
        aie.dma_bd(%arg0 : memref<24x512x64xbf16> offset = 49152 len = 16384 sizes = [1, 1, 256, 64] strides = [0, 0, 64, 1])
        aie.end
      }
      aiex.dma_start_task(%7)
      %8 = aiex.dma_configure_task_for @inK {
        aie.dma_bd(%arg1 : memref<24x32768xbf16> offset = 32768 len = 32768 sizes = [1, 1, 512, 64] strides = [0, 0, 64, 1])
        aie.end
      }
      aiex.dma_start_task(%8)
      %9 = aiex.dma_configure_task_for @inV {
        aie.dma_bd(%arg2 : memref<24x32768xbf16> offset = 32768 len = 32768 sizes = [1, 1, 512, 64] strides = [0, 0, 64, 1])
        aie.end
      }
      aiex.dma_start_task(%9)
      %10 = aiex.dma_configure_task_for @memO {
        aie.dma_bd(%arg3 : memref<24x512x64xbf16> offset = 32768 len = 16384 sizes = [1, 1, 256, 64] strides = [0, 0, 64, 1])
        aie.end
      } {issue_token = true}
      aiex.dma_start_task(%10)
      %11 = aiex.dma_configure_task_for @memO2 {
        aie.dma_bd(%arg3 : memref<24x512x64xbf16> offset = 49152 len = 16384 sizes = [1, 1, 256, 64] strides = [0, 0, 64, 1])
        aie.end
      } {issue_token = true}
      aiex.dma_start_task(%11)
      aiex.dma_await_task(%10)
      aiex.dma_await_task(%11)
      aiex.dma_free_task(%6)
      aiex.dma_free_task(%7)
      aiex.dma_free_task(%8)
      aiex.dma_free_task(%9)
      aiex.dma_free_task(%10)
      aiex.dma_free_task(%11)
      %12 = aiex.dma_configure_task_for @inQ {
        aie.dma_bd(%arg0 : memref<24x512x64xbf16> offset = 65536 len = 16384 sizes = [1, 1, 256, 64] strides = [0, 0, 64, 1])
        aie.end
      }
      aiex.dma_start_task(%12)
      %13 = aiex.dma_configure_task_for @inQ2 {
        aie.dma_bd(%arg0 : memref<24x512x64xbf16> offset = 81920 len = 16384 sizes = [1, 1, 256, 64] strides = [0, 0, 64, 1])
        aie.end
      }
      aiex.dma_start_task(%13)
      %14 = aiex.dma_configure_task_for @inK {
        aie.dma_bd(%arg1 : memref<24x32768xbf16> offset = 65536 len = 32768 sizes = [1, 1, 512, 64] strides = [0, 0, 64, 1])
        aie.end
      }
      aiex.dma_start_task(%14)
      %15 = aiex.dma_configure_task_for @inV {
        aie.dma_bd(%arg2 : memref<24x32768xbf16> offset = 65536 len = 32768 sizes = [1, 1, 512, 64] strides = [0, 0, 64, 1])
        aie.end
      }
      aiex.dma_start_task(%15)
      %16 = aiex.dma_configure_task_for @memO {
        aie.dma_bd(%arg3 : memref<24x512x64xbf16> offset = 65536 len = 16384 sizes = [1, 1, 256, 64] strides = [0, 0, 64, 1])
        aie.end
      } {issue_token = true}
      aiex.dma_start_task(%16)
      %17 = aiex.dma_configure_task_for @memO2 {
        aie.dma_bd(%arg3 : memref<24x512x64xbf16> offset = 81920 len = 16384 sizes = [1, 1, 256, 64] strides = [0, 0, 64, 1])
        aie.end
      } {issue_token = true}
      aiex.dma_start_task(%17)
      aiex.dma_await_task(%16)
      aiex.dma_await_task(%17)
      aiex.dma_free_task(%12)
      aiex.dma_free_task(%13)
      aiex.dma_free_task(%14)
      aiex.dma_free_task(%15)
      aiex.dma_free_task(%16)
      aiex.dma_free_task(%17)
      %18 = aiex.dma_configure_task_for @inQ {
        aie.dma_bd(%arg0 : memref<24x512x64xbf16> offset = 98304 len = 16384 sizes = [1, 1, 256, 64] strides = [0, 0, 64, 1])
        aie.end
      }
      aiex.dma_start_task(%18)
      %19 = aiex.dma_configure_task_for @inQ2 {
        aie.dma_bd(%arg0 : memref<24x512x64xbf16> offset = 114688 len = 16384 sizes = [1, 1, 256, 64] strides = [0, 0, 64, 1])
        aie.end
      }
      aiex.dma_start_task(%19)
      %20 = aiex.dma_configure_task_for @inK {
        aie.dma_bd(%arg1 : memref<24x32768xbf16> offset = 98304 len = 32768 sizes = [1, 1, 512, 64] strides = [0, 0, 64, 1])
        aie.end
      }
      aiex.dma_start_task(%20)
      %21 = aiex.dma_configure_task_for @inV {
        aie.dma_bd(%arg2 : memref<24x32768xbf16> offset = 98304 len = 32768 sizes = [1, 1, 512, 64] strides = [0, 0, 64, 1])
        aie.end
      }
      aiex.dma_start_task(%21)
      %22 = aiex.dma_configure_task_for @memO {
        aie.dma_bd(%arg3 : memref<24x512x64xbf16> offset = 98304 len = 16384 sizes = [1, 1, 256, 64] strides = [0, 0, 64, 1])
        aie.end
      } {issue_token = true}
      aiex.dma_start_task(%22)
      %23 = aiex.dma_configure_task_for @memO2 {
        aie.dma_bd(%arg3 : memref<24x512x64xbf16> offset = 114688 len = 16384 sizes = [1, 1, 256, 64] strides = [0, 0, 64, 1])
        aie.end
      } {issue_token = true}
      aiex.dma_start_task(%23)
      aiex.dma_await_task(%22)
      aiex.dma_await_task(%23)
      aiex.dma_free_task(%18)
      aiex.dma_free_task(%19)
      aiex.dma_free_task(%20)
      aiex.dma_free_task(%21)
      aiex.dma_free_task(%22)
      aiex.dma_free_task(%23)
      %24 = aiex.dma_configure_task_for @inQ {
        aie.dma_bd(%arg0 : memref<24x512x64xbf16> offset = 131072 len = 16384 sizes = [1, 1, 256, 64] strides = [0, 0, 64, 1])
        aie.end
      }
      aiex.dma_start_task(%24)
      %25 = aiex.dma_configure_task_for @inQ2 {
        aie.dma_bd(%arg0 : memref<24x512x64xbf16> offset = 147456 len = 16384 sizes = [1, 1, 256, 64] strides = [0, 0, 64, 1])
        aie.end
      }
      aiex.dma_start_task(%25)
      %26 = aiex.dma_configure_task_for @inK {
        aie.dma_bd(%arg1 : memref<24x32768xbf16> offset = 131072 len = 32768 sizes = [1, 1, 512, 64] strides = [0, 0, 64, 1])
        aie.end
      }
      aiex.dma_start_task(%26)
      %27 = aiex.dma_configure_task_for @inV {
        aie.dma_bd(%arg2 : memref<24x32768xbf16> offset = 131072 len = 32768 sizes = [1, 1, 512, 64] strides = [0, 0, 64, 1])
        aie.end
      }
      aiex.dma_start_task(%27)
      %28 = aiex.dma_configure_task_for @memO {
        aie.dma_bd(%arg3 : memref<24x512x64xbf16> offset = 131072 len = 16384 sizes = [1, 1, 256, 64] strides = [0, 0, 64, 1])
        aie.end
      } {issue_token = true}
      aiex.dma_start_task(%28)
      %29 = aiex.dma_configure_task_for @memO2 {
        aie.dma_bd(%arg3 : memref<24x512x64xbf16> offset = 147456 len = 16384 sizes = [1, 1, 256, 64] strides = [0, 0, 64, 1])
        aie.end
      } {issue_token = true}
      aiex.dma_start_task(%29)
      aiex.dma_await_task(%28)
      aiex.dma_await_task(%29)
      aiex.dma_free_task(%24)
      aiex.dma_free_task(%25)
      aiex.dma_free_task(%26)
      aiex.dma_free_task(%27)
      aiex.dma_free_task(%28)
      aiex.dma_free_task(%29)
      %30 = aiex.dma_configure_task_for @inQ {
        aie.dma_bd(%arg0 : memref<24x512x64xbf16> offset = 163840 len = 16384 sizes = [1, 1, 256, 64] strides = [0, 0, 64, 1])
        aie.end
      }
      aiex.dma_start_task(%30)
      %31 = aiex.dma_configure_task_for @inQ2 {
        aie.dma_bd(%arg0 : memref<24x512x64xbf16> offset = 180224 len = 16384 sizes = [1, 1, 256, 64] strides = [0, 0, 64, 1])
        aie.end
      }
      aiex.dma_start_task(%31)
      %32 = aiex.dma_configure_task_for @inK {
        aie.dma_bd(%arg1 : memref<24x32768xbf16> offset = 163840 len = 32768 sizes = [1, 1, 512, 64] strides = [0, 0, 64, 1])
        aie.end
      }
      aiex.dma_start_task(%32)
      %33 = aiex.dma_configure_task_for @inV {
        aie.dma_bd(%arg2 : memref<24x32768xbf16> offset = 163840 len = 32768 sizes = [1, 1, 512, 64] strides = [0, 0, 64, 1])
        aie.end
      }
      aiex.dma_start_task(%33)
      %34 = aiex.dma_configure_task_for @memO {
        aie.dma_bd(%arg3 : memref<24x512x64xbf16> offset = 163840 len = 16384 sizes = [1, 1, 256, 64] strides = [0, 0, 64, 1])
        aie.end
      } {issue_token = true}
      aiex.dma_start_task(%34)
      %35 = aiex.dma_configure_task_for @memO2 {
        aie.dma_bd(%arg3 : memref<24x512x64xbf16> offset = 180224 len = 16384 sizes = [1, 1, 256, 64] strides = [0, 0, 64, 1])
        aie.end
      } {issue_token = true}
      aiex.dma_start_task(%35)
      aiex.dma_await_task(%34)
      aiex.dma_await_task(%35)
      aiex.dma_free_task(%30)
      aiex.dma_free_task(%31)
      aiex.dma_free_task(%32)
      aiex.dma_free_task(%33)
      aiex.dma_free_task(%34)
      aiex.dma_free_task(%35)
      %36 = aiex.dma_configure_task_for @inQ {
        aie.dma_bd(%arg0 : memref<24x512x64xbf16> offset = 196608 len = 16384 sizes = [1, 1, 256, 64] strides = [0, 0, 64, 1])
        aie.end
      }
      aiex.dma_start_task(%36)
      %37 = aiex.dma_configure_task_for @inQ2 {
        aie.dma_bd(%arg0 : memref<24x512x64xbf16> offset = 212992 len = 16384 sizes = [1, 1, 256, 64] strides = [0, 0, 64, 1])
        aie.end
      }
      aiex.dma_start_task(%37)
      %38 = aiex.dma_configure_task_for @inK {
        aie.dma_bd(%arg1 : memref<24x32768xbf16> offset = 196608 len = 32768 sizes = [1, 1, 512, 64] strides = [0, 0, 64, 1])
        aie.end
      }
      aiex.dma_start_task(%38)
      %39 = aiex.dma_configure_task_for @inV {
        aie.dma_bd(%arg2 : memref<24x32768xbf16> offset = 196608 len = 32768 sizes = [1, 1, 512, 64] strides = [0, 0, 64, 1])
        aie.end
      }
      aiex.dma_start_task(%39)
      %40 = aiex.dma_configure_task_for @memO {
        aie.dma_bd(%arg3 : memref<24x512x64xbf16> offset = 196608 len = 16384 sizes = [1, 1, 256, 64] strides = [0, 0, 64, 1])
        aie.end
      } {issue_token = true}
      aiex.dma_start_task(%40)
      %41 = aiex.dma_configure_task_for @memO2 {
        aie.dma_bd(%arg3 : memref<24x512x64xbf16> offset = 212992 len = 16384 sizes = [1, 1, 256, 64] strides = [0, 0, 64, 1])
        aie.end
      } {issue_token = true}
      aiex.dma_start_task(%41)
      aiex.dma_await_task(%40)
      aiex.dma_await_task(%41)
      aiex.dma_free_task(%36)
      aiex.dma_free_task(%37)
      aiex.dma_free_task(%38)
      aiex.dma_free_task(%39)
      aiex.dma_free_task(%40)
      aiex.dma_free_task(%41)
      %42 = aiex.dma_configure_task_for @inQ {
        aie.dma_bd(%arg0 : memref<24x512x64xbf16> offset = 229376 len = 16384 sizes = [1, 1, 256, 64] strides = [0, 0, 64, 1])
        aie.end
      }
      aiex.dma_start_task(%42)
      %43 = aiex.dma_configure_task_for @inQ2 {
        aie.dma_bd(%arg0 : memref<24x512x64xbf16> offset = 245760 len = 16384 sizes = [1, 1, 256, 64] strides = [0, 0, 64, 1])
        aie.end
      }
      aiex.dma_start_task(%43)
      %44 = aiex.dma_configure_task_for @inK {
        aie.dma_bd(%arg1 : memref<24x32768xbf16> offset = 229376 len = 32768 sizes = [1, 1, 512, 64] strides = [0, 0, 64, 1])
        aie.end
      }
      aiex.dma_start_task(%44)
      %45 = aiex.dma_configure_task_for @inV {
        aie.dma_bd(%arg2 : memref<24x32768xbf16> offset = 229376 len = 32768 sizes = [1, 1, 512, 64] strides = [0, 0, 64, 1])
        aie.end
      }
      aiex.dma_start_task(%45)
      %46 = aiex.dma_configure_task_for @memO {
        aie.dma_bd(%arg3 : memref<24x512x64xbf16> offset = 229376 len = 16384 sizes = [1, 1, 256, 64] strides = [0, 0, 64, 1])
        aie.end
      } {issue_token = true}
      aiex.dma_start_task(%46)
      %47 = aiex.dma_configure_task_for @memO2 {
        aie.dma_bd(%arg3 : memref<24x512x64xbf16> offset = 245760 len = 16384 sizes = [1, 1, 256, 64] strides = [0, 0, 64, 1])
        aie.end
      } {issue_token = true}
      aiex.dma_start_task(%47)
      aiex.dma_await_task(%46)
      aiex.dma_await_task(%47)
      aiex.dma_free_task(%42)
      aiex.dma_free_task(%43)
      aiex.dma_free_task(%44)
      aiex.dma_free_task(%45)
      aiex.dma_free_task(%46)
      aiex.dma_free_task(%47)
      %48 = aiex.dma_configure_task_for @inQ {
        aie.dma_bd(%arg0 : memref<24x512x64xbf16> offset = 262144 len = 16384 sizes = [1, 1, 256, 64] strides = [0, 0, 64, 1])
        aie.end
      }
      aiex.dma_start_task(%48)
      %49 = aiex.dma_configure_task_for @inQ2 {
        aie.dma_bd(%arg0 : memref<24x512x64xbf16> offset = 278528 len = 16384 sizes = [1, 1, 256, 64] strides = [0, 0, 64, 1])
        aie.end
      }
      aiex.dma_start_task(%49)
      %50 = aiex.dma_configure_task_for @inK {
        aie.dma_bd(%arg1 : memref<24x32768xbf16> offset = 262144 len = 32768 sizes = [1, 1, 512, 64] strides = [0, 0, 64, 1])
        aie.end
      }
      aiex.dma_start_task(%50)
      %51 = aiex.dma_configure_task_for @inV {
        aie.dma_bd(%arg2 : memref<24x32768xbf16> offset = 262144 len = 32768 sizes = [1, 1, 512, 64] strides = [0, 0, 64, 1])
        aie.end
      }
      aiex.dma_start_task(%51)
      %52 = aiex.dma_configure_task_for @memO {
        aie.dma_bd(%arg3 : memref<24x512x64xbf16> offset = 262144 len = 16384 sizes = [1, 1, 256, 64] strides = [0, 0, 64, 1])
        aie.end
      } {issue_token = true}
      aiex.dma_start_task(%52)
      %53 = aiex.dma_configure_task_for @memO2 {
        aie.dma_bd(%arg3 : memref<24x512x64xbf16> offset = 278528 len = 16384 sizes = [1, 1, 256, 64] strides = [0, 0, 64, 1])
        aie.end
      } {issue_token = true}
      aiex.dma_start_task(%53)
      aiex.dma_await_task(%52)
      aiex.dma_await_task(%53)
      aiex.dma_free_task(%48)
      aiex.dma_free_task(%49)
      aiex.dma_free_task(%50)
      aiex.dma_free_task(%51)
      aiex.dma_free_task(%52)
      aiex.dma_free_task(%53)
      %54 = aiex.dma_configure_task_for @inQ {
        aie.dma_bd(%arg0 : memref<24x512x64xbf16> offset = 294912 len = 16384 sizes = [1, 1, 256, 64] strides = [0, 0, 64, 1])
        aie.end
      }
      aiex.dma_start_task(%54)
      %55 = aiex.dma_configure_task_for @inQ2 {
        aie.dma_bd(%arg0 : memref<24x512x64xbf16> offset = 311296 len = 16384 sizes = [1, 1, 256, 64] strides = [0, 0, 64, 1])
        aie.end
      }
      aiex.dma_start_task(%55)
      %56 = aiex.dma_configure_task_for @inK {
        aie.dma_bd(%arg1 : memref<24x32768xbf16> offset = 294912 len = 32768 sizes = [1, 1, 512, 64] strides = [0, 0, 64, 1])
        aie.end
      }
      aiex.dma_start_task(%56)
      %57 = aiex.dma_configure_task_for @inV {
        aie.dma_bd(%arg2 : memref<24x32768xbf16> offset = 294912 len = 32768 sizes = [1, 1, 512, 64] strides = [0, 0, 64, 1])
        aie.end
      }
      aiex.dma_start_task(%57)
      %58 = aiex.dma_configure_task_for @memO {
        aie.dma_bd(%arg3 : memref<24x512x64xbf16> offset = 294912 len = 16384 sizes = [1, 1, 256, 64] strides = [0, 0, 64, 1])
        aie.end
      } {issue_token = true}
      aiex.dma_start_task(%58)
      %59 = aiex.dma_configure_task_for @memO2 {
        aie.dma_bd(%arg3 : memref<24x512x64xbf16> offset = 311296 len = 16384 sizes = [1, 1, 256, 64] strides = [0, 0, 64, 1])
        aie.end
      } {issue_token = true}
      aiex.dma_start_task(%59)
      aiex.dma_await_task(%58)
      aiex.dma_await_task(%59)
      aiex.dma_free_task(%54)
      aiex.dma_free_task(%55)
      aiex.dma_free_task(%56)
      aiex.dma_free_task(%57)
      aiex.dma_free_task(%58)
      aiex.dma_free_task(%59)
      %60 = aiex.dma_configure_task_for @inQ {
        aie.dma_bd(%arg0 : memref<24x512x64xbf16> offset = 327680 len = 16384 sizes = [1, 1, 256, 64] strides = [0, 0, 64, 1])
        aie.end
      }
      aiex.dma_start_task(%60)
      %61 = aiex.dma_configure_task_for @inQ2 {
        aie.dma_bd(%arg0 : memref<24x512x64xbf16> offset = 344064 len = 16384 sizes = [1, 1, 256, 64] strides = [0, 0, 64, 1])
        aie.end
      }
      aiex.dma_start_task(%61)
      %62 = aiex.dma_configure_task_for @inK {
        aie.dma_bd(%arg1 : memref<24x32768xbf16> offset = 327680 len = 32768 sizes = [1, 1, 512, 64] strides = [0, 0, 64, 1])
        aie.end
      }
      aiex.dma_start_task(%62)
      %63 = aiex.dma_configure_task_for @inV {
        aie.dma_bd(%arg2 : memref<24x32768xbf16> offset = 327680 len = 32768 sizes = [1, 1, 512, 64] strides = [0, 0, 64, 1])
        aie.end
      }
      aiex.dma_start_task(%63)
      %64 = aiex.dma_configure_task_for @memO {
        aie.dma_bd(%arg3 : memref<24x512x64xbf16> offset = 327680 len = 16384 sizes = [1, 1, 256, 64] strides = [0, 0, 64, 1])
        aie.end
      } {issue_token = true}
      aiex.dma_start_task(%64)
      %65 = aiex.dma_configure_task_for @memO2 {
        aie.dma_bd(%arg3 : memref<24x512x64xbf16> offset = 344064 len = 16384 sizes = [1, 1, 256, 64] strides = [0, 0, 64, 1])
        aie.end
      } {issue_token = true}
      aiex.dma_start_task(%65)
      aiex.dma_await_task(%64)
      aiex.dma_await_task(%65)
      aiex.dma_free_task(%60)
      aiex.dma_free_task(%61)
      aiex.dma_free_task(%62)
      aiex.dma_free_task(%63)
      aiex.dma_free_task(%64)
      aiex.dma_free_task(%65)
      %66 = aiex.dma_configure_task_for @inQ {
        aie.dma_bd(%arg0 : memref<24x512x64xbf16> offset = 360448 len = 16384 sizes = [1, 1, 256, 64] strides = [0, 0, 64, 1])
        aie.end
      }
      aiex.dma_start_task(%66)
      %67 = aiex.dma_configure_task_for @inQ2 {
        aie.dma_bd(%arg0 : memref<24x512x64xbf16> offset = 376832 len = 16384 sizes = [1, 1, 256, 64] strides = [0, 0, 64, 1])
        aie.end
      }
      aiex.dma_start_task(%67)
      %68 = aiex.dma_configure_task_for @inK {
        aie.dma_bd(%arg1 : memref<24x32768xbf16> offset = 360448 len = 32768 sizes = [1, 1, 512, 64] strides = [0, 0, 64, 1])
        aie.end
      }
      aiex.dma_start_task(%68)
      %69 = aiex.dma_configure_task_for @inV {
        aie.dma_bd(%arg2 : memref<24x32768xbf16> offset = 360448 len = 32768 sizes = [1, 1, 512, 64] strides = [0, 0, 64, 1])
        aie.end
      }
      aiex.dma_start_task(%69)
      %70 = aiex.dma_configure_task_for @memO {
        aie.dma_bd(%arg3 : memref<24x512x64xbf16> offset = 360448 len = 16384 sizes = [1, 1, 256, 64] strides = [0, 0, 64, 1])
        aie.end
      } {issue_token = true}
      aiex.dma_start_task(%70)
      %71 = aiex.dma_configure_task_for @memO2 {
        aie.dma_bd(%arg3 : memref<24x512x64xbf16> offset = 376832 len = 16384 sizes = [1, 1, 256, 64] strides = [0, 0, 64, 1])
        aie.end
      } {issue_token = true}
      aiex.dma_start_task(%71)
      aiex.dma_await_task(%70)
      aiex.dma_await_task(%71)
      aiex.dma_free_task(%66)
      aiex.dma_free_task(%67)
      aiex.dma_free_task(%68)
      aiex.dma_free_task(%69)
      aiex.dma_free_task(%70)
      aiex.dma_free_task(%71)
      %72 = aiex.dma_configure_task_for @inQ {
        aie.dma_bd(%arg0 : memref<24x512x64xbf16> offset = 393216 len = 16384 sizes = [1, 1, 256, 64] strides = [0, 0, 64, 1])
        aie.end
      }
      aiex.dma_start_task(%72)
      %73 = aiex.dma_configure_task_for @inQ2 {
        aie.dma_bd(%arg0 : memref<24x512x64xbf16> offset = 409600 len = 16384 sizes = [1, 1, 256, 64] strides = [0, 0, 64, 1])
        aie.end
      }
      aiex.dma_start_task(%73)
      %74 = aiex.dma_configure_task_for @inK {
        aie.dma_bd(%arg1 : memref<24x32768xbf16> offset = 393216 len = 32768 sizes = [1, 1, 512, 64] strides = [0, 0, 64, 1])
        aie.end
      }
      aiex.dma_start_task(%74)
      %75 = aiex.dma_configure_task_for @inV {
        aie.dma_bd(%arg2 : memref<24x32768xbf16> offset = 393216 len = 32768 sizes = [1, 1, 512, 64] strides = [0, 0, 64, 1])
        aie.end
      }
      aiex.dma_start_task(%75)
      %76 = aiex.dma_configure_task_for @memO {
        aie.dma_bd(%arg3 : memref<24x512x64xbf16> offset = 393216 len = 16384 sizes = [1, 1, 256, 64] strides = [0, 0, 64, 1])
        aie.end
      } {issue_token = true}
      aiex.dma_start_task(%76)
      %77 = aiex.dma_configure_task_for @memO2 {
        aie.dma_bd(%arg3 : memref<24x512x64xbf16> offset = 409600 len = 16384 sizes = [1, 1, 256, 64] strides = [0, 0, 64, 1])
        aie.end
      } {issue_token = true}
      aiex.dma_start_task(%77)
      aiex.dma_await_task(%76)
      aiex.dma_await_task(%77)
      aiex.dma_free_task(%72)
      aiex.dma_free_task(%73)
      aiex.dma_free_task(%74)
      aiex.dma_free_task(%75)
      aiex.dma_free_task(%76)
      aiex.dma_free_task(%77)
      %78 = aiex.dma_configure_task_for @inQ {
        aie.dma_bd(%arg0 : memref<24x512x64xbf16> offset = 425984 len = 16384 sizes = [1, 1, 256, 64] strides = [0, 0, 64, 1])
        aie.end
      }
      aiex.dma_start_task(%78)
      %79 = aiex.dma_configure_task_for @inQ2 {
        aie.dma_bd(%arg0 : memref<24x512x64xbf16> offset = 442368 len = 16384 sizes = [1, 1, 256, 64] strides = [0, 0, 64, 1])
        aie.end
      }
      aiex.dma_start_task(%79)
      %80 = aiex.dma_configure_task_for @inK {
        aie.dma_bd(%arg1 : memref<24x32768xbf16> offset = 425984 len = 32768 sizes = [1, 1, 512, 64] strides = [0, 0, 64, 1])
        aie.end
      }
      aiex.dma_start_task(%80)
      %81 = aiex.dma_configure_task_for @inV {
        aie.dma_bd(%arg2 : memref<24x32768xbf16> offset = 425984 len = 32768 sizes = [1, 1, 512, 64] strides = [0, 0, 64, 1])
        aie.end
      }
      aiex.dma_start_task(%81)
      %82 = aiex.dma_configure_task_for @memO {
        aie.dma_bd(%arg3 : memref<24x512x64xbf16> offset = 425984 len = 16384 sizes = [1, 1, 256, 64] strides = [0, 0, 64, 1])
        aie.end
      } {issue_token = true}
      aiex.dma_start_task(%82)
      %83 = aiex.dma_configure_task_for @memO2 {
        aie.dma_bd(%arg3 : memref<24x512x64xbf16> offset = 442368 len = 16384 sizes = [1, 1, 256, 64] strides = [0, 0, 64, 1])
        aie.end
      } {issue_token = true}
      aiex.dma_start_task(%83)
      aiex.dma_await_task(%82)
      aiex.dma_await_task(%83)
      aiex.dma_free_task(%78)
      aiex.dma_free_task(%79)
      aiex.dma_free_task(%80)
      aiex.dma_free_task(%81)
      aiex.dma_free_task(%82)
      aiex.dma_free_task(%83)
      %84 = aiex.dma_configure_task_for @inQ {
        aie.dma_bd(%arg0 : memref<24x512x64xbf16> offset = 458752 len = 16384 sizes = [1, 1, 256, 64] strides = [0, 0, 64, 1])
        aie.end
      }
      aiex.dma_start_task(%84)
      %85 = aiex.dma_configure_task_for @inQ2 {
        aie.dma_bd(%arg0 : memref<24x512x64xbf16> offset = 475136 len = 16384 sizes = [1, 1, 256, 64] strides = [0, 0, 64, 1])
        aie.end
      }
      aiex.dma_start_task(%85)
      %86 = aiex.dma_configure_task_for @inK {
        aie.dma_bd(%arg1 : memref<24x32768xbf16> offset = 458752 len = 32768 sizes = [1, 1, 512, 64] strides = [0, 0, 64, 1])
        aie.end
      }
      aiex.dma_start_task(%86)
      %87 = aiex.dma_configure_task_for @inV {
        aie.dma_bd(%arg2 : memref<24x32768xbf16> offset = 458752 len = 32768 sizes = [1, 1, 512, 64] strides = [0, 0, 64, 1])
        aie.end
      }
      aiex.dma_start_task(%87)
      %88 = aiex.dma_configure_task_for @memO {
        aie.dma_bd(%arg3 : memref<24x512x64xbf16> offset = 458752 len = 16384 sizes = [1, 1, 256, 64] strides = [0, 0, 64, 1])
        aie.end
      } {issue_token = true}
      aiex.dma_start_task(%88)
      %89 = aiex.dma_configure_task_for @memO2 {
        aie.dma_bd(%arg3 : memref<24x512x64xbf16> offset = 475136 len = 16384 sizes = [1, 1, 256, 64] strides = [0, 0, 64, 1])
        aie.end
      } {issue_token = true}
      aiex.dma_start_task(%89)
      aiex.dma_await_task(%88)
      aiex.dma_await_task(%89)
      aiex.dma_free_task(%84)
      aiex.dma_free_task(%85)
      aiex.dma_free_task(%86)
      aiex.dma_free_task(%87)
      aiex.dma_free_task(%88)
      aiex.dma_free_task(%89)
      %90 = aiex.dma_configure_task_for @inQ {
        aie.dma_bd(%arg0 : memref<24x512x64xbf16> offset = 491520 len = 16384 sizes = [1, 1, 256, 64] strides = [0, 0, 64, 1])
        aie.end
      }
      aiex.dma_start_task(%90)
      %91 = aiex.dma_configure_task_for @inQ2 {
        aie.dma_bd(%arg0 : memref<24x512x64xbf16> offset = 507904 len = 16384 sizes = [1, 1, 256, 64] strides = [0, 0, 64, 1])
        aie.end
      }
      aiex.dma_start_task(%91)
      %92 = aiex.dma_configure_task_for @inK {
        aie.dma_bd(%arg1 : memref<24x32768xbf16> offset = 491520 len = 32768 sizes = [1, 1, 512, 64] strides = [0, 0, 64, 1])
        aie.end
      }
      aiex.dma_start_task(%92)
      %93 = aiex.dma_configure_task_for @inV {
        aie.dma_bd(%arg2 : memref<24x32768xbf16> offset = 491520 len = 32768 sizes = [1, 1, 512, 64] strides = [0, 0, 64, 1])
        aie.end
      }
      aiex.dma_start_task(%93)
      %94 = aiex.dma_configure_task_for @memO {
        aie.dma_bd(%arg3 : memref<24x512x64xbf16> offset = 491520 len = 16384 sizes = [1, 1, 256, 64] strides = [0, 0, 64, 1])
        aie.end
      } {issue_token = true}
      aiex.dma_start_task(%94)
      %95 = aiex.dma_configure_task_for @memO2 {
        aie.dma_bd(%arg3 : memref<24x512x64xbf16> offset = 507904 len = 16384 sizes = [1, 1, 256, 64] strides = [0, 0, 64, 1])
        aie.end
      } {issue_token = true}
      aiex.dma_start_task(%95)
      aiex.dma_await_task(%94)
      aiex.dma_await_task(%95)
      aiex.dma_free_task(%90)
      aiex.dma_free_task(%91)
      aiex.dma_free_task(%92)
      aiex.dma_free_task(%93)
      aiex.dma_free_task(%94)
      aiex.dma_free_task(%95)
      %96 = aiex.dma_configure_task_for @inQ {
        aie.dma_bd(%arg0 : memref<24x512x64xbf16> offset = 524288 len = 16384 sizes = [1, 1, 256, 64] strides = [0, 0, 64, 1])
        aie.end
      }
      aiex.dma_start_task(%96)
      %97 = aiex.dma_configure_task_for @inQ2 {
        aie.dma_bd(%arg0 : memref<24x512x64xbf16> offset = 540672 len = 16384 sizes = [1, 1, 256, 64] strides = [0, 0, 64, 1])
        aie.end
      }
      aiex.dma_start_task(%97)
      %98 = aiex.dma_configure_task_for @inK {
        aie.dma_bd(%arg1 : memref<24x32768xbf16> offset = 524288 len = 32768 sizes = [1, 1, 512, 64] strides = [0, 0, 64, 1])
        aie.end
      }
      aiex.dma_start_task(%98)
      %99 = aiex.dma_configure_task_for @inV {
        aie.dma_bd(%arg2 : memref<24x32768xbf16> offset = 524288 len = 32768 sizes = [1, 1, 512, 64] strides = [0, 0, 64, 1])
        aie.end
      }
      aiex.dma_start_task(%99)
      %100 = aiex.dma_configure_task_for @memO {
        aie.dma_bd(%arg3 : memref<24x512x64xbf16> offset = 524288 len = 16384 sizes = [1, 1, 256, 64] strides = [0, 0, 64, 1])
        aie.end
      } {issue_token = true}
      aiex.dma_start_task(%100)
      %101 = aiex.dma_configure_task_for @memO2 {
        aie.dma_bd(%arg3 : memref<24x512x64xbf16> offset = 540672 len = 16384 sizes = [1, 1, 256, 64] strides = [0, 0, 64, 1])
        aie.end
      } {issue_token = true}
      aiex.dma_start_task(%101)
      aiex.dma_await_task(%100)
      aiex.dma_await_task(%101)
      aiex.dma_free_task(%96)
      aiex.dma_free_task(%97)
      aiex.dma_free_task(%98)
      aiex.dma_free_task(%99)
      aiex.dma_free_task(%100)
      aiex.dma_free_task(%101)
      %102 = aiex.dma_configure_task_for @inQ {
        aie.dma_bd(%arg0 : memref<24x512x64xbf16> offset = 557056 len = 16384 sizes = [1, 1, 256, 64] strides = [0, 0, 64, 1])
        aie.end
      }
      aiex.dma_start_task(%102)
      %103 = aiex.dma_configure_task_for @inQ2 {
        aie.dma_bd(%arg0 : memref<24x512x64xbf16> offset = 573440 len = 16384 sizes = [1, 1, 256, 64] strides = [0, 0, 64, 1])
        aie.end
      }
      aiex.dma_start_task(%103)
      %104 = aiex.dma_configure_task_for @inK {
        aie.dma_bd(%arg1 : memref<24x32768xbf16> offset = 557056 len = 32768 sizes = [1, 1, 512, 64] strides = [0, 0, 64, 1])
        aie.end
      }
      aiex.dma_start_task(%104)
      %105 = aiex.dma_configure_task_for @inV {
        aie.dma_bd(%arg2 : memref<24x32768xbf16> offset = 557056 len = 32768 sizes = [1, 1, 512, 64] strides = [0, 0, 64, 1])
        aie.end
      }
      aiex.dma_start_task(%105)
      %106 = aiex.dma_configure_task_for @memO {
        aie.dma_bd(%arg3 : memref<24x512x64xbf16> offset = 557056 len = 16384 sizes = [1, 1, 256, 64] strides = [0, 0, 64, 1])
        aie.end
      } {issue_token = true}
      aiex.dma_start_task(%106)
      %107 = aiex.dma_configure_task_for @memO2 {
        aie.dma_bd(%arg3 : memref<24x512x64xbf16> offset = 573440 len = 16384 sizes = [1, 1, 256, 64] strides = [0, 0, 64, 1])
        aie.end
      } {issue_token = true}
      aiex.dma_start_task(%107)
      aiex.dma_await_task(%106)
      aiex.dma_await_task(%107)
      aiex.dma_free_task(%102)
      aiex.dma_free_task(%103)
      aiex.dma_free_task(%104)
      aiex.dma_free_task(%105)
      aiex.dma_free_task(%106)
      aiex.dma_free_task(%107)
      %108 = aiex.dma_configure_task_for @inQ {
        aie.dma_bd(%arg0 : memref<24x512x64xbf16> offset = 589824 len = 16384 sizes = [1, 1, 256, 64] strides = [0, 0, 64, 1])
        aie.end
      }
      aiex.dma_start_task(%108)
      %109 = aiex.dma_configure_task_for @inQ2 {
        aie.dma_bd(%arg0 : memref<24x512x64xbf16> offset = 606208 len = 16384 sizes = [1, 1, 256, 64] strides = [0, 0, 64, 1])
        aie.end
      }
      aiex.dma_start_task(%109)
      %110 = aiex.dma_configure_task_for @inK {
        aie.dma_bd(%arg1 : memref<24x32768xbf16> offset = 589824 len = 32768 sizes = [1, 1, 512, 64] strides = [0, 0, 64, 1])
        aie.end
      }
      aiex.dma_start_task(%110)
      %111 = aiex.dma_configure_task_for @inV {
        aie.dma_bd(%arg2 : memref<24x32768xbf16> offset = 589824 len = 32768 sizes = [1, 1, 512, 64] strides = [0, 0, 64, 1])
        aie.end
      }
      aiex.dma_start_task(%111)
      %112 = aiex.dma_configure_task_for @memO {
        aie.dma_bd(%arg3 : memref<24x512x64xbf16> offset = 589824 len = 16384 sizes = [1, 1, 256, 64] strides = [0, 0, 64, 1])
        aie.end
      } {issue_token = true}
      aiex.dma_start_task(%112)
      %113 = aiex.dma_configure_task_for @memO2 {
        aie.dma_bd(%arg3 : memref<24x512x64xbf16> offset = 606208 len = 16384 sizes = [1, 1, 256, 64] strides = [0, 0, 64, 1])
        aie.end
      } {issue_token = true}
      aiex.dma_start_task(%113)
      aiex.dma_await_task(%112)
      aiex.dma_await_task(%113)
      aiex.dma_free_task(%108)
      aiex.dma_free_task(%109)
      aiex.dma_free_task(%110)
      aiex.dma_free_task(%111)
      aiex.dma_free_task(%112)
      aiex.dma_free_task(%113)
      %114 = aiex.dma_configure_task_for @inQ {
        aie.dma_bd(%arg0 : memref<24x512x64xbf16> offset = 622592 len = 16384 sizes = [1, 1, 256, 64] strides = [0, 0, 64, 1])
        aie.end
      }
      aiex.dma_start_task(%114)
      %115 = aiex.dma_configure_task_for @inQ2 {
        aie.dma_bd(%arg0 : memref<24x512x64xbf16> offset = 638976 len = 16384 sizes = [1, 1, 256, 64] strides = [0, 0, 64, 1])
        aie.end
      }
      aiex.dma_start_task(%115)
      %116 = aiex.dma_configure_task_for @inK {
        aie.dma_bd(%arg1 : memref<24x32768xbf16> offset = 622592 len = 32768 sizes = [1, 1, 512, 64] strides = [0, 0, 64, 1])
        aie.end
      }
      aiex.dma_start_task(%116)
      %117 = aiex.dma_configure_task_for @inV {
        aie.dma_bd(%arg2 : memref<24x32768xbf16> offset = 622592 len = 32768 sizes = [1, 1, 512, 64] strides = [0, 0, 64, 1])
        aie.end
      }
      aiex.dma_start_task(%117)
      %118 = aiex.dma_configure_task_for @memO {
        aie.dma_bd(%arg3 : memref<24x512x64xbf16> offset = 622592 len = 16384 sizes = [1, 1, 256, 64] strides = [0, 0, 64, 1])
        aie.end
      } {issue_token = true}
      aiex.dma_start_task(%118)
      %119 = aiex.dma_configure_task_for @memO2 {
        aie.dma_bd(%arg3 : memref<24x512x64xbf16> offset = 638976 len = 16384 sizes = [1, 1, 256, 64] strides = [0, 0, 64, 1])
        aie.end
      } {issue_token = true}
      aiex.dma_start_task(%119)
      aiex.dma_await_task(%118)
      aiex.dma_await_task(%119)
      aiex.dma_free_task(%114)
      aiex.dma_free_task(%115)
      aiex.dma_free_task(%116)
      aiex.dma_free_task(%117)
      aiex.dma_free_task(%118)
      aiex.dma_free_task(%119)
      %120 = aiex.dma_configure_task_for @inQ {
        aie.dma_bd(%arg0 : memref<24x512x64xbf16> offset = 655360 len = 16384 sizes = [1, 1, 256, 64] strides = [0, 0, 64, 1])
        aie.end
      }
      aiex.dma_start_task(%120)
      %121 = aiex.dma_configure_task_for @inQ2 {
        aie.dma_bd(%arg0 : memref<24x512x64xbf16> offset = 671744 len = 16384 sizes = [1, 1, 256, 64] strides = [0, 0, 64, 1])
        aie.end
      }
      aiex.dma_start_task(%121)
      %122 = aiex.dma_configure_task_for @inK {
        aie.dma_bd(%arg1 : memref<24x32768xbf16> offset = 655360 len = 32768 sizes = [1, 1, 512, 64] strides = [0, 0, 64, 1])
        aie.end
      }
      aiex.dma_start_task(%122)
      %123 = aiex.dma_configure_task_for @inV {
        aie.dma_bd(%arg2 : memref<24x32768xbf16> offset = 655360 len = 32768 sizes = [1, 1, 512, 64] strides = [0, 0, 64, 1])
        aie.end
      }
      aiex.dma_start_task(%123)
      %124 = aiex.dma_configure_task_for @memO {
        aie.dma_bd(%arg3 : memref<24x512x64xbf16> offset = 655360 len = 16384 sizes = [1, 1, 256, 64] strides = [0, 0, 64, 1])
        aie.end
      } {issue_token = true}
      aiex.dma_start_task(%124)
      %125 = aiex.dma_configure_task_for @memO2 {
        aie.dma_bd(%arg3 : memref<24x512x64xbf16> offset = 671744 len = 16384 sizes = [1, 1, 256, 64] strides = [0, 0, 64, 1])
        aie.end
      } {issue_token = true}
      aiex.dma_start_task(%125)
      aiex.dma_await_task(%124)
      aiex.dma_await_task(%125)
      aiex.dma_free_task(%120)
      aiex.dma_free_task(%121)
      aiex.dma_free_task(%122)
      aiex.dma_free_task(%123)
      aiex.dma_free_task(%124)
      aiex.dma_free_task(%125)
      %126 = aiex.dma_configure_task_for @inQ {
        aie.dma_bd(%arg0 : memref<24x512x64xbf16> offset = 688128 len = 16384 sizes = [1, 1, 256, 64] strides = [0, 0, 64, 1])
        aie.end
      }
      aiex.dma_start_task(%126)
      %127 = aiex.dma_configure_task_for @inQ2 {
        aie.dma_bd(%arg0 : memref<24x512x64xbf16> offset = 704512 len = 16384 sizes = [1, 1, 256, 64] strides = [0, 0, 64, 1])
        aie.end
      }
      aiex.dma_start_task(%127)
      %128 = aiex.dma_configure_task_for @inK {
        aie.dma_bd(%arg1 : memref<24x32768xbf16> offset = 688128 len = 32768 sizes = [1, 1, 512, 64] strides = [0, 0, 64, 1])
        aie.end
      }
      aiex.dma_start_task(%128)
      %129 = aiex.dma_configure_task_for @inV {
        aie.dma_bd(%arg2 : memref<24x32768xbf16> offset = 688128 len = 32768 sizes = [1, 1, 512, 64] strides = [0, 0, 64, 1])
        aie.end
      }
      aiex.dma_start_task(%129)
      %130 = aiex.dma_configure_task_for @memO {
        aie.dma_bd(%arg3 : memref<24x512x64xbf16> offset = 688128 len = 16384 sizes = [1, 1, 256, 64] strides = [0, 0, 64, 1])
        aie.end
      } {issue_token = true}
      aiex.dma_start_task(%130)
      %131 = aiex.dma_configure_task_for @memO2 {
        aie.dma_bd(%arg3 : memref<24x512x64xbf16> offset = 704512 len = 16384 sizes = [1, 1, 256, 64] strides = [0, 0, 64, 1])
        aie.end
      } {issue_token = true}
      aiex.dma_start_task(%131)
      aiex.dma_await_task(%130)
      aiex.dma_await_task(%131)
      aiex.dma_free_task(%126)
      aiex.dma_free_task(%127)
      aiex.dma_free_task(%128)
      aiex.dma_free_task(%129)
      aiex.dma_free_task(%130)
      aiex.dma_free_task(%131)
      %132 = aiex.dma_configure_task_for @inQ {
        aie.dma_bd(%arg0 : memref<24x512x64xbf16> offset = 720896 len = 16384 sizes = [1, 1, 256, 64] strides = [0, 0, 64, 1])
        aie.end
      }
      aiex.dma_start_task(%132)
      %133 = aiex.dma_configure_task_for @inQ2 {
        aie.dma_bd(%arg0 : memref<24x512x64xbf16> offset = 737280 len = 16384 sizes = [1, 1, 256, 64] strides = [0, 0, 64, 1])
        aie.end
      }
      aiex.dma_start_task(%133)
      %134 = aiex.dma_configure_task_for @inK {
        aie.dma_bd(%arg1 : memref<24x32768xbf16> offset = 720896 len = 32768 sizes = [1, 1, 512, 64] strides = [0, 0, 64, 1])
        aie.end
      }
      aiex.dma_start_task(%134)
      %135 = aiex.dma_configure_task_for @inV {
        aie.dma_bd(%arg2 : memref<24x32768xbf16> offset = 720896 len = 32768 sizes = [1, 1, 512, 64] strides = [0, 0, 64, 1])
        aie.end
      }
      aiex.dma_start_task(%135)
      %136 = aiex.dma_configure_task_for @memO {
        aie.dma_bd(%arg3 : memref<24x512x64xbf16> offset = 720896 len = 16384 sizes = [1, 1, 256, 64] strides = [0, 0, 64, 1])
        aie.end
      } {issue_token = true}
      aiex.dma_start_task(%136)
      %137 = aiex.dma_configure_task_for @memO2 {
        aie.dma_bd(%arg3 : memref<24x512x64xbf16> offset = 737280 len = 16384 sizes = [1, 1, 256, 64] strides = [0, 0, 64, 1])
        aie.end
      } {issue_token = true}
      aiex.dma_start_task(%137)
      aiex.dma_await_task(%136)
      aiex.dma_await_task(%137)
      aiex.dma_free_task(%132)
      aiex.dma_free_task(%133)
      aiex.dma_free_task(%134)
      aiex.dma_free_task(%135)
      aiex.dma_free_task(%136)
      aiex.dma_free_task(%137)
      %138 = aiex.dma_configure_task_for @inQ {
        aie.dma_bd(%arg0 : memref<24x512x64xbf16> offset = 753664 len = 16384 sizes = [1, 1, 256, 64] strides = [0, 0, 64, 1])
        aie.end
      }
      aiex.dma_start_task(%138)
      %139 = aiex.dma_configure_task_for @inQ2 {
        aie.dma_bd(%arg0 : memref<24x512x64xbf16> offset = 770048 len = 16384 sizes = [1, 1, 256, 64] strides = [0, 0, 64, 1])
        aie.end
      }
      aiex.dma_start_task(%139)
      %140 = aiex.dma_configure_task_for @inK {
        aie.dma_bd(%arg1 : memref<24x32768xbf16> offset = 753664 len = 32768 sizes = [1, 1, 512, 64] strides = [0, 0, 64, 1])
        aie.end
      }
      aiex.dma_start_task(%140)
      %141 = aiex.dma_configure_task_for @inV {
        aie.dma_bd(%arg2 : memref<24x32768xbf16> offset = 753664 len = 32768 sizes = [1, 1, 512, 64] strides = [0, 0, 64, 1])
        aie.end
      }
      aiex.dma_start_task(%141)
      %142 = aiex.dma_configure_task_for @memO {
        aie.dma_bd(%arg3 : memref<24x512x64xbf16> offset = 753664 len = 16384 sizes = [1, 1, 256, 64] strides = [0, 0, 64, 1])
        aie.end
      } {issue_token = true}
      aiex.dma_start_task(%142)
      %143 = aiex.dma_configure_task_for @memO2 {
        aie.dma_bd(%arg3 : memref<24x512x64xbf16> offset = 770048 len = 16384 sizes = [1, 1, 256, 64] strides = [0, 0, 64, 1])
        aie.end
      } {issue_token = true}
      aiex.dma_start_task(%143)
      aiex.dma_await_task(%142)
      aiex.dma_await_task(%143)
      aiex.dma_free_task(%138)
      aiex.dma_free_task(%139)
      aiex.dma_free_task(%140)
      aiex.dma_free_task(%141)
      aiex.dma_free_task(%142)
      aiex.dma_free_task(%143)
    }
  }
}
