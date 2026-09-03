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
    %logical_core_23 = aie.logical_tile<CoreTile>(0, 5)
    %logical_core_24 = aie.logical_tile<CoreTile>(1, 5)
    %logical_core_25 = aie.logical_tile<CoreTile>(2, 5)
    %logical_core_26 = aie.logical_tile<CoreTile>(3, 5)
    %logical_core_27 = aie.logical_tile<CoreTile>(4, 5)
    %logical_core_28 = aie.logical_tile<CoreTile>(5, 5)
    %logical_core_29 = aie.logical_tile<CoreTile>(6, 5)
    %logical_core_30 = aie.logical_tile<CoreTile>(7, 5)
    %logical_mem = aie.logical_tile<MemTile>(0, 1)
    %logical_mem_31 = aie.logical_tile<MemTile>(2, 1)
    %logical_mem_32 = aie.logical_tile<MemTile>(4, 1)
    %logical_mem_33 = aie.logical_tile<MemTile>(6, 1)
    %logical_shim_noc = aie.logical_tile<ShimNOCTile>(0, 0)
    %logical_shim_noc_34 = aie.logical_tile<ShimNOCTile>(2, 0)
    %logical_shim_noc_35 = aie.logical_tile<ShimNOCTile>(4, 0)
    %logical_shim_noc_36 = aie.logical_tile<ShimNOCTile>(6, 0)
    %logical_mem_37 = aie.logical_tile<MemTile>(0, 1)
    %logical_mem_38 = aie.logical_tile<MemTile>(1, 1)
    %logical_mem_39 = aie.logical_tile<MemTile>(2, 1)
    %logical_mem_40 = aie.logical_tile<MemTile>(3, 1)
    %logical_mem_41 = aie.logical_tile<MemTile>(4, 1)
    %logical_mem_42 = aie.logical_tile<MemTile>(5, 1)
    %logical_mem_43 = aie.logical_tile<MemTile>(6, 1)
    %logical_mem_44 = aie.logical_tile<MemTile>(7, 1)
    %logical_shim_noc_45 = aie.logical_tile<ShimNOCTile>(0, 0)
    %logical_shim_noc_46 = aie.logical_tile<ShimNOCTile>(1, 0)
    %logical_shim_noc_47 = aie.logical_tile<ShimNOCTile>(2, 0)
    %logical_shim_noc_48 = aie.logical_tile<ShimNOCTile>(3, 0)
    %logical_shim_noc_49 = aie.logical_tile<ShimNOCTile>(4, 0)
    %logical_shim_noc_50 = aie.logical_tile<ShimNOCTile>(5, 0)
    %logical_shim_noc_51 = aie.logical_tile<ShimNOCTile>(6, 0)
    %logical_shim_noc_52 = aie.logical_tile<ShimNOCTile>(7, 0)
    %logical_mem_53 = aie.logical_tile<MemTile>(0, 1)
    %logical_mem_54 = aie.logical_tile<MemTile>(1, 1)
    %logical_mem_55 = aie.logical_tile<MemTile>(2, 1)
    %logical_mem_56 = aie.logical_tile<MemTile>(3, 1)
    %logical_mem_57 = aie.logical_tile<MemTile>(4, 1)
    %logical_mem_58 = aie.logical_tile<MemTile>(5, 1)
    %logical_mem_59 = aie.logical_tile<MemTile>(6, 1)
    %logical_mem_60 = aie.logical_tile<MemTile>(7, 1)
    %logical_shim_noc_61 = aie.logical_tile<ShimNOCTile>(0, 0)
    %logical_shim_noc_62 = aie.logical_tile<ShimNOCTile>(1, 0)
    %logical_shim_noc_63 = aie.logical_tile<ShimNOCTile>(2, 0)
    %logical_shim_noc_64 = aie.logical_tile<ShimNOCTile>(3, 0)
    %logical_shim_noc_65 = aie.logical_tile<ShimNOCTile>(4, 0)
    %logical_shim_noc_66 = aie.logical_tile<ShimNOCTile>(5, 0)
    %logical_shim_noc_67 = aie.logical_tile<ShimNOCTile>(6, 0)
    %logical_shim_noc_68 = aie.logical_tile<ShimNOCTile>(7, 0)
    aie.objectfifo @A_L2L1_0(%logical_mem dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%logical_core, %logical_core_0, %logical_core_1, %logical_core_2, %logical_core_3, %logical_core_4, %logical_core_5, %logical_core_6}, 2 : i32) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @A_L3L2_0(%logical_shim_noc, {%logical_mem}, 2 : i32) : !aie.objectfifo<memref<4096xbf16>>  
    aie.objectfifo.link [@A_L3L2_0] -> [@A_L2L1_0]([] [0])
    aie.objectfifo @A_L2L1_1(%logical_mem_31 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%logical_core_7, %logical_core_8, %logical_core_9, %logical_core_10, %logical_core_11, %logical_core_12, %logical_core_13, %logical_core_14}, 2 : i32) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @A_L3L2_1(%logical_shim_noc_34, {%logical_mem_31}, 2 : i32) : !aie.objectfifo<memref<4096xbf16>>  
    aie.objectfifo.link [@A_L3L2_1] -> [@A_L2L1_1]([] [0])
    aie.objectfifo @A_L2L1_2(%logical_mem_32 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%logical_core_15, %logical_core_16, %logical_core_17, %logical_core_18, %logical_core_19, %logical_core_20, %logical_core_21, %logical_core_22}, 2 : i32) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @A_L3L2_2(%logical_shim_noc_35, {%logical_mem_32}, 2 : i32) : !aie.objectfifo<memref<4096xbf16>>  
    aie.objectfifo.link [@A_L3L2_2] -> [@A_L2L1_2]([] [0])
    aie.objectfifo @A_L2L1_3(%logical_mem_33 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%logical_core_23, %logical_core_24, %logical_core_25, %logical_core_26, %logical_core_27, %logical_core_28, %logical_core_29, %logical_core_30}, 2 : i32) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @A_L3L2_3(%logical_shim_noc_36, {%logical_mem_33}, 2 : i32) : !aie.objectfifo<memref<4096xbf16>>  
    aie.objectfifo.link [@A_L3L2_3] -> [@A_L2L1_3]([] [0])
    aie.objectfifo @B_L2L1_0(%logical_mem_37 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%logical_core, %logical_core_7, %logical_core_15, %logical_core_23}, 2 : i32) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @B_L3L2_0(%logical_shim_noc_45, {%logical_mem_37}, 2 : i32) : !aie.objectfifo<memref<4096xbf16>>  
    aie.objectfifo.link [@B_L3L2_0] -> [@B_L2L1_0]([] [0])
    aie.objectfifo @B_L2L1_1(%logical_mem_38 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%logical_core_0, %logical_core_8, %logical_core_16, %logical_core_24}, 2 : i32) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @B_L3L2_1(%logical_shim_noc_46, {%logical_mem_38}, 2 : i32) : !aie.objectfifo<memref<4096xbf16>>  
    aie.objectfifo.link [@B_L3L2_1] -> [@B_L2L1_1]([] [0])
    aie.objectfifo @B_L2L1_2(%logical_mem_39 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%logical_core_1, %logical_core_9, %logical_core_17, %logical_core_25}, 2 : i32) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @B_L3L2_2(%logical_shim_noc_47, {%logical_mem_39}, 2 : i32) : !aie.objectfifo<memref<4096xbf16>>  
    aie.objectfifo.link [@B_L3L2_2] -> [@B_L2L1_2]([] [0])
    aie.objectfifo @B_L2L1_3(%logical_mem_40 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%logical_core_2, %logical_core_10, %logical_core_18, %logical_core_26}, 2 : i32) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @B_L3L2_3(%logical_shim_noc_48, {%logical_mem_40}, 2 : i32) : !aie.objectfifo<memref<4096xbf16>>  
    aie.objectfifo.link [@B_L3L2_3] -> [@B_L2L1_3]([] [0])
    aie.objectfifo @B_L2L1_4(%logical_mem_41 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%logical_core_3, %logical_core_11, %logical_core_19, %logical_core_27}, 2 : i32) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @B_L3L2_4(%logical_shim_noc_49, {%logical_mem_41}, 2 : i32) : !aie.objectfifo<memref<4096xbf16>>  
    aie.objectfifo.link [@B_L3L2_4] -> [@B_L2L1_4]([] [0])
    aie.objectfifo @B_L2L1_5(%logical_mem_42 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%logical_core_4, %logical_core_12, %logical_core_20, %logical_core_28}, 2 : i32) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @B_L3L2_5(%logical_shim_noc_50, {%logical_mem_42}, 2 : i32) : !aie.objectfifo<memref<4096xbf16>>  
    aie.objectfifo.link [@B_L3L2_5] -> [@B_L2L1_5]([] [0])
    aie.objectfifo @B_L2L1_6(%logical_mem_43 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%logical_core_5, %logical_core_13, %logical_core_21, %logical_core_29}, 2 : i32) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @B_L3L2_6(%logical_shim_noc_51, {%logical_mem_43}, 2 : i32) : !aie.objectfifo<memref<4096xbf16>>  
    aie.objectfifo.link [@B_L3L2_6] -> [@B_L2L1_6]([] [0])
    aie.objectfifo @B_L2L1_7(%logical_mem_44 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%logical_core_6, %logical_core_14, %logical_core_22, %logical_core_30}, 2 : i32) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @B_L3L2_7(%logical_shim_noc_52, {%logical_mem_44}, 2 : i32) : !aie.objectfifo<memref<4096xbf16>>  
    aie.objectfifo.link [@B_L3L2_7] -> [@B_L2L1_7]([] [0])
    aie.objectfifo @C_L1L2_0_0(%logical_core, {%logical_mem_53}, 2 : i32) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @C_L1L2_0_1(%logical_core_7, {%logical_mem_53}, 2 : i32) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @C_L1L2_0_2(%logical_core_15, {%logical_mem_53}, 2 : i32) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @C_L1L2_0_3(%logical_core_23, {%logical_mem_53}, 2 : i32) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @C_L2L3_0(%logical_mem_53 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%logical_shim_noc_61}, 2 : i32) : !aie.objectfifo<memref<16384xbf16>>  
    aie.objectfifo.link [@C_L1L2_0_0, @C_L1L2_0_1, @C_L1L2_0_2, @C_L1L2_0_3] -> [@C_L2L3_0]([0, 4096, 8192, 12288] [])
    aie.objectfifo @C_L1L2_1_0(%logical_core_0, {%logical_mem_54}, 2 : i32) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @C_L1L2_1_1(%logical_core_8, {%logical_mem_54}, 2 : i32) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @C_L1L2_1_2(%logical_core_16, {%logical_mem_54}, 2 : i32) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @C_L1L2_1_3(%logical_core_24, {%logical_mem_54}, 2 : i32) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @C_L2L3_1(%logical_mem_54 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%logical_shim_noc_62}, 2 : i32) : !aie.objectfifo<memref<16384xbf16>>  
    aie.objectfifo.link [@C_L1L2_1_0, @C_L1L2_1_1, @C_L1L2_1_2, @C_L1L2_1_3] -> [@C_L2L3_1]([0, 4096, 8192, 12288] [])
    aie.objectfifo @C_L1L2_2_0(%logical_core_1, {%logical_mem_55}, 2 : i32) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @C_L1L2_2_1(%logical_core_9, {%logical_mem_55}, 2 : i32) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @C_L1L2_2_2(%logical_core_17, {%logical_mem_55}, 2 : i32) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @C_L1L2_2_3(%logical_core_25, {%logical_mem_55}, 2 : i32) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @C_L2L3_2(%logical_mem_55 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%logical_shim_noc_63}, 2 : i32) : !aie.objectfifo<memref<16384xbf16>>  
    aie.objectfifo.link [@C_L1L2_2_0, @C_L1L2_2_1, @C_L1L2_2_2, @C_L1L2_2_3] -> [@C_L2L3_2]([0, 4096, 8192, 12288] [])
    aie.objectfifo @C_L1L2_3_0(%logical_core_2, {%logical_mem_56}, 2 : i32) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @C_L1L2_3_1(%logical_core_10, {%logical_mem_56}, 2 : i32) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @C_L1L2_3_2(%logical_core_18, {%logical_mem_56}, 2 : i32) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @C_L1L2_3_3(%logical_core_26, {%logical_mem_56}, 2 : i32) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @C_L2L3_3(%logical_mem_56 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%logical_shim_noc_64}, 2 : i32) : !aie.objectfifo<memref<16384xbf16>>  
    aie.objectfifo.link [@C_L1L2_3_0, @C_L1L2_3_1, @C_L1L2_3_2, @C_L1L2_3_3] -> [@C_L2L3_3]([0, 4096, 8192, 12288] [])
    aie.objectfifo @C_L1L2_4_0(%logical_core_3, {%logical_mem_57}, 2 : i32) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @C_L1L2_4_1(%logical_core_11, {%logical_mem_57}, 2 : i32) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @C_L1L2_4_2(%logical_core_19, {%logical_mem_57}, 2 : i32) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @C_L1L2_4_3(%logical_core_27, {%logical_mem_57}, 2 : i32) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @C_L2L3_4(%logical_mem_57 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%logical_shim_noc_65}, 2 : i32) : !aie.objectfifo<memref<16384xbf16>>  
    aie.objectfifo.link [@C_L1L2_4_0, @C_L1L2_4_1, @C_L1L2_4_2, @C_L1L2_4_3] -> [@C_L2L3_4]([0, 4096, 8192, 12288] [])
    aie.objectfifo @C_L1L2_5_0(%logical_core_4, {%logical_mem_58}, 2 : i32) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @C_L1L2_5_1(%logical_core_12, {%logical_mem_58}, 2 : i32) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @C_L1L2_5_2(%logical_core_20, {%logical_mem_58}, 2 : i32) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @C_L1L2_5_3(%logical_core_28, {%logical_mem_58}, 2 : i32) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @C_L2L3_5(%logical_mem_58 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%logical_shim_noc_66}, 2 : i32) : !aie.objectfifo<memref<16384xbf16>>  
    aie.objectfifo.link [@C_L1L2_5_0, @C_L1L2_5_1, @C_L1L2_5_2, @C_L1L2_5_3] -> [@C_L2L3_5]([0, 4096, 8192, 12288] [])
    aie.objectfifo @C_L1L2_6_0(%logical_core_5, {%logical_mem_59}, 2 : i32) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @C_L1L2_6_1(%logical_core_13, {%logical_mem_59}, 2 : i32) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @C_L1L2_6_2(%logical_core_21, {%logical_mem_59}, 2 : i32) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @C_L1L2_6_3(%logical_core_29, {%logical_mem_59}, 2 : i32) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @C_L2L3_6(%logical_mem_59 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%logical_shim_noc_67}, 2 : i32) : !aie.objectfifo<memref<16384xbf16>>  
    aie.objectfifo.link [@C_L1L2_6_0, @C_L1L2_6_1, @C_L1L2_6_2, @C_L1L2_6_3] -> [@C_L2L3_6]([0, 4096, 8192, 12288] [])
    aie.objectfifo @C_L1L2_7_0(%logical_core_6, {%logical_mem_60}, 2 : i32) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @C_L1L2_7_1(%logical_core_14, {%logical_mem_60}, 2 : i32) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @C_L1L2_7_2(%logical_core_22, {%logical_mem_60}, 2 : i32) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @C_L1L2_7_3(%logical_core_30, {%logical_mem_60}, 2 : i32) : !aie.objectfifo<memref<64x64xbf16>>  
    aie.objectfifo @C_L2L3_7(%logical_mem_60 dimensionsToStream [<size = 8, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%logical_shim_noc_68}, 2 : i32) : !aie.objectfifo<memref<16384xbf16>>  
    aie.objectfifo.link [@C_L1L2_7_0, @C_L1L2_7_1, @C_L1L2_7_2, @C_L1L2_7_3] -> [@C_L2L3_7]([0, 4096, 8192, 12288] [])
    func.func private @op0_zero_bf16(memref<64x64xbf16>) attributes {link_with = "op0_gemm_64x64x64_0_0_0_1_1.o"}
    func.func private @op0_matmul_bf16_bf16(memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>) attributes {link_with = "op0_gemm_64x64x64_0_0_0_1_1.o"}
    %rtp0_0 = aie.buffer(%logical_core) {sym_name = "rtp0_0"} : memref<2xi32> = dense<0>
    %rtp0_1 = aie.buffer(%logical_core_0) {sym_name = "rtp0_1"} : memref<2xi32> = dense<0>
    %rtp0_2 = aie.buffer(%logical_core_1) {sym_name = "rtp0_2"} : memref<2xi32> = dense<0>
    %rtp0_3 = aie.buffer(%logical_core_2) {sym_name = "rtp0_3"} : memref<2xi32> = dense<0>
    %rtp0_4 = aie.buffer(%logical_core_3) {sym_name = "rtp0_4"} : memref<2xi32> = dense<0>
    %rtp0_5 = aie.buffer(%logical_core_4) {sym_name = "rtp0_5"} : memref<2xi32> = dense<0>
    %rtp0_6 = aie.buffer(%logical_core_5) {sym_name = "rtp0_6"} : memref<2xi32> = dense<0>
    %rtp0_7 = aie.buffer(%logical_core_6) {sym_name = "rtp0_7"} : memref<2xi32> = dense<0>
    %rtp1_0 = aie.buffer(%logical_core_7) {sym_name = "rtp1_0"} : memref<2xi32> = dense<0>
    %rtp1_1 = aie.buffer(%logical_core_8) {sym_name = "rtp1_1"} : memref<2xi32> = dense<0>
    %rtp1_2 = aie.buffer(%logical_core_9) {sym_name = "rtp1_2"} : memref<2xi32> = dense<0>
    %rtp1_3 = aie.buffer(%logical_core_10) {sym_name = "rtp1_3"} : memref<2xi32> = dense<0>
    %rtp1_4 = aie.buffer(%logical_core_11) {sym_name = "rtp1_4"} : memref<2xi32> = dense<0>
    %rtp1_5 = aie.buffer(%logical_core_12) {sym_name = "rtp1_5"} : memref<2xi32> = dense<0>
    %rtp1_6 = aie.buffer(%logical_core_13) {sym_name = "rtp1_6"} : memref<2xi32> = dense<0>
    %rtp1_7 = aie.buffer(%logical_core_14) {sym_name = "rtp1_7"} : memref<2xi32> = dense<0>
    %rtp2_0 = aie.buffer(%logical_core_15) {sym_name = "rtp2_0"} : memref<2xi32> = dense<0>
    %rtp2_1 = aie.buffer(%logical_core_16) {sym_name = "rtp2_1"} : memref<2xi32> = dense<0>
    %rtp2_2 = aie.buffer(%logical_core_17) {sym_name = "rtp2_2"} : memref<2xi32> = dense<0>
    %rtp2_3 = aie.buffer(%logical_core_18) {sym_name = "rtp2_3"} : memref<2xi32> = dense<0>
    %rtp2_4 = aie.buffer(%logical_core_19) {sym_name = "rtp2_4"} : memref<2xi32> = dense<0>
    %rtp2_5 = aie.buffer(%logical_core_20) {sym_name = "rtp2_5"} : memref<2xi32> = dense<0>
    %rtp2_6 = aie.buffer(%logical_core_21) {sym_name = "rtp2_6"} : memref<2xi32> = dense<0>
    %rtp2_7 = aie.buffer(%logical_core_22) {sym_name = "rtp2_7"} : memref<2xi32> = dense<0>
    %rtp3_0 = aie.buffer(%logical_core_23) {sym_name = "rtp3_0"} : memref<2xi32> = dense<0>
    %rtp3_1 = aie.buffer(%logical_core_24) {sym_name = "rtp3_1"} : memref<2xi32> = dense<0>
    %rtp3_2 = aie.buffer(%logical_core_25) {sym_name = "rtp3_2"} : memref<2xi32> = dense<0>
    %rtp3_3 = aie.buffer(%logical_core_26) {sym_name = "rtp3_3"} : memref<2xi32> = dense<0>
    %rtp3_4 = aie.buffer(%logical_core_27) {sym_name = "rtp3_4"} : memref<2xi32> = dense<0>
    %rtp3_5 = aie.buffer(%logical_core_28) {sym_name = "rtp3_5"} : memref<2xi32> = dense<0>
    %rtp3_6 = aie.buffer(%logical_core_29) {sym_name = "rtp3_6"} : memref<2xi32> = dense<0>
    %rtp3_7 = aie.buffer(%logical_core_30) {sym_name = "rtp3_7"} : memref<2xi32> = dense<0>
    %lock_0_2 = aie.lock(%logical_core)
    %core_0_2 = aie.core(%logical_core) {
      %c0 = arith.constant 0 : index
      %c9223372036854775807 = arith.constant 9223372036854775807 : index
      %c1 = arith.constant 1 : index
      scf.for %arg0 = %c0 to %c9223372036854775807 step %c1 {
        %c1_i32 = arith.constant 1 : i32
        aie.use_lock(%lock_0_2, Acquire, %c1_i32)
        %c0_69 = arith.constant 0 : index
        %0 = memref.load %rtp0_0[%c0_69] : memref<2xi32>
        %c1_70 = arith.constant 1 : index
        %1 = memref.load %rtp0_0[%c1_70] : memref<2xi32>
        %c1_i32_71 = arith.constant 1 : i32
        %2 = arith.cmpi sgt, %1, %c1_i32_71 : i32
        %c0_72 = arith.constant 0 : index
        %3 = arith.index_cast %1 : i32 to index
        %c1_73 = arith.constant 1 : index
        scf.for %arg1 = %c0_72 to %3 step %c1_73 {
          %4 = aie.objectfifo.acquire @C_L1L2_0_0(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
          %5 = aie.objectfifo.subview.access %4[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
          func.call @op0_zero_bf16(%5) : (memref<64x64xbf16>) -> ()
          %c0_74 = arith.constant 0 : index
          %6 = arith.index_cast %0 : i32 to index
          %c1_75 = arith.constant 1 : index
          scf.for %arg2 = %c0_74 to %6 step %c1_75 {
            %7 = aie.objectfifo.acquire @A_L2L1_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %8 = aie.objectfifo.subview.access %7[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            %9 = aie.objectfifo.acquire @B_L2L1_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %10 = aie.objectfifo.subview.access %9[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            func.call @op0_matmul_bf16_bf16(%8, %10, %5) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>) -> ()
            aie.objectfifo.release @A_L2L1_0(Consume, 1)
            aie.objectfifo.release @B_L2L1_0(Consume, 1)
          }
          aie.objectfifo.release @C_L1L2_0_0(Produce, 1)
        }
      }
      aie.end
    } {stack_size = 3328 : i32}
    %lock_1_2 = aie.lock(%logical_core_0)
    %core_1_2 = aie.core(%logical_core_0) {
      %c0 = arith.constant 0 : index
      %c9223372036854775807 = arith.constant 9223372036854775807 : index
      %c1 = arith.constant 1 : index
      scf.for %arg0 = %c0 to %c9223372036854775807 step %c1 {
        %c1_i32 = arith.constant 1 : i32
        aie.use_lock(%lock_1_2, Acquire, %c1_i32)
        %c0_69 = arith.constant 0 : index
        %0 = memref.load %rtp0_1[%c0_69] : memref<2xi32>
        %c1_70 = arith.constant 1 : index
        %1 = memref.load %rtp0_1[%c1_70] : memref<2xi32>
        %c1_i32_71 = arith.constant 1 : i32
        %2 = arith.cmpi sgt, %1, %c1_i32_71 : i32
        %c0_72 = arith.constant 0 : index
        %3 = arith.index_cast %1 : i32 to index
        %c1_73 = arith.constant 1 : index
        scf.for %arg1 = %c0_72 to %3 step %c1_73 {
          %4 = aie.objectfifo.acquire @C_L1L2_1_0(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
          %5 = aie.objectfifo.subview.access %4[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
          func.call @op0_zero_bf16(%5) : (memref<64x64xbf16>) -> ()
          %c0_74 = arith.constant 0 : index
          %6 = arith.index_cast %0 : i32 to index
          %c1_75 = arith.constant 1 : index
          scf.for %arg2 = %c0_74 to %6 step %c1_75 {
            %7 = aie.objectfifo.acquire @A_L2L1_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %8 = aie.objectfifo.subview.access %7[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            %9 = aie.objectfifo.acquire @B_L2L1_1(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %10 = aie.objectfifo.subview.access %9[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            func.call @op0_matmul_bf16_bf16(%8, %10, %5) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>) -> ()
            aie.objectfifo.release @A_L2L1_0(Consume, 1)
            aie.objectfifo.release @B_L2L1_1(Consume, 1)
          }
          aie.objectfifo.release @C_L1L2_1_0(Produce, 1)
        }
      }
      aie.end
    } {stack_size = 3328 : i32}
    %lock_2_2 = aie.lock(%logical_core_1)
    %core_2_2 = aie.core(%logical_core_1) {
      %c0 = arith.constant 0 : index
      %c9223372036854775807 = arith.constant 9223372036854775807 : index
      %c1 = arith.constant 1 : index
      scf.for %arg0 = %c0 to %c9223372036854775807 step %c1 {
        %c1_i32 = arith.constant 1 : i32
        aie.use_lock(%lock_2_2, Acquire, %c1_i32)
        %c0_69 = arith.constant 0 : index
        %0 = memref.load %rtp0_2[%c0_69] : memref<2xi32>
        %c1_70 = arith.constant 1 : index
        %1 = memref.load %rtp0_2[%c1_70] : memref<2xi32>
        %c1_i32_71 = arith.constant 1 : i32
        %2 = arith.cmpi sgt, %1, %c1_i32_71 : i32
        %c0_72 = arith.constant 0 : index
        %3 = arith.index_cast %1 : i32 to index
        %c1_73 = arith.constant 1 : index
        scf.for %arg1 = %c0_72 to %3 step %c1_73 {
          %4 = aie.objectfifo.acquire @C_L1L2_2_0(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
          %5 = aie.objectfifo.subview.access %4[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
          func.call @op0_zero_bf16(%5) : (memref<64x64xbf16>) -> ()
          %c0_74 = arith.constant 0 : index
          %6 = arith.index_cast %0 : i32 to index
          %c1_75 = arith.constant 1 : index
          scf.for %arg2 = %c0_74 to %6 step %c1_75 {
            %7 = aie.objectfifo.acquire @A_L2L1_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %8 = aie.objectfifo.subview.access %7[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            %9 = aie.objectfifo.acquire @B_L2L1_2(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %10 = aie.objectfifo.subview.access %9[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            func.call @op0_matmul_bf16_bf16(%8, %10, %5) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>) -> ()
            aie.objectfifo.release @A_L2L1_0(Consume, 1)
            aie.objectfifo.release @B_L2L1_2(Consume, 1)
          }
          aie.objectfifo.release @C_L1L2_2_0(Produce, 1)
        }
      }
      aie.end
    } {stack_size = 3328 : i32}
    %lock_3_2 = aie.lock(%logical_core_2)
    %core_3_2 = aie.core(%logical_core_2) {
      %c0 = arith.constant 0 : index
      %c9223372036854775807 = arith.constant 9223372036854775807 : index
      %c1 = arith.constant 1 : index
      scf.for %arg0 = %c0 to %c9223372036854775807 step %c1 {
        %c1_i32 = arith.constant 1 : i32
        aie.use_lock(%lock_3_2, Acquire, %c1_i32)
        %c0_69 = arith.constant 0 : index
        %0 = memref.load %rtp0_3[%c0_69] : memref<2xi32>
        %c1_70 = arith.constant 1 : index
        %1 = memref.load %rtp0_3[%c1_70] : memref<2xi32>
        %c1_i32_71 = arith.constant 1 : i32
        %2 = arith.cmpi sgt, %1, %c1_i32_71 : i32
        %c0_72 = arith.constant 0 : index
        %3 = arith.index_cast %1 : i32 to index
        %c1_73 = arith.constant 1 : index
        scf.for %arg1 = %c0_72 to %3 step %c1_73 {
          %4 = aie.objectfifo.acquire @C_L1L2_3_0(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
          %5 = aie.objectfifo.subview.access %4[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
          func.call @op0_zero_bf16(%5) : (memref<64x64xbf16>) -> ()
          %c0_74 = arith.constant 0 : index
          %6 = arith.index_cast %0 : i32 to index
          %c1_75 = arith.constant 1 : index
          scf.for %arg2 = %c0_74 to %6 step %c1_75 {
            %7 = aie.objectfifo.acquire @A_L2L1_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %8 = aie.objectfifo.subview.access %7[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            %9 = aie.objectfifo.acquire @B_L2L1_3(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %10 = aie.objectfifo.subview.access %9[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            func.call @op0_matmul_bf16_bf16(%8, %10, %5) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>) -> ()
            aie.objectfifo.release @A_L2L1_0(Consume, 1)
            aie.objectfifo.release @B_L2L1_3(Consume, 1)
          }
          aie.objectfifo.release @C_L1L2_3_0(Produce, 1)
        }
      }
      aie.end
    } {stack_size = 3328 : i32}
    %lock_4_2 = aie.lock(%logical_core_3)
    %core_4_2 = aie.core(%logical_core_3) {
      %c0 = arith.constant 0 : index
      %c9223372036854775807 = arith.constant 9223372036854775807 : index
      %c1 = arith.constant 1 : index
      scf.for %arg0 = %c0 to %c9223372036854775807 step %c1 {
        %c1_i32 = arith.constant 1 : i32
        aie.use_lock(%lock_4_2, Acquire, %c1_i32)
        %c0_69 = arith.constant 0 : index
        %0 = memref.load %rtp0_4[%c0_69] : memref<2xi32>
        %c1_70 = arith.constant 1 : index
        %1 = memref.load %rtp0_4[%c1_70] : memref<2xi32>
        %c1_i32_71 = arith.constant 1 : i32
        %2 = arith.cmpi sgt, %1, %c1_i32_71 : i32
        %c0_72 = arith.constant 0 : index
        %3 = arith.index_cast %1 : i32 to index
        %c1_73 = arith.constant 1 : index
        scf.for %arg1 = %c0_72 to %3 step %c1_73 {
          %4 = aie.objectfifo.acquire @C_L1L2_4_0(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
          %5 = aie.objectfifo.subview.access %4[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
          func.call @op0_zero_bf16(%5) : (memref<64x64xbf16>) -> ()
          %c0_74 = arith.constant 0 : index
          %6 = arith.index_cast %0 : i32 to index
          %c1_75 = arith.constant 1 : index
          scf.for %arg2 = %c0_74 to %6 step %c1_75 {
            %7 = aie.objectfifo.acquire @A_L2L1_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %8 = aie.objectfifo.subview.access %7[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            %9 = aie.objectfifo.acquire @B_L2L1_4(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %10 = aie.objectfifo.subview.access %9[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            func.call @op0_matmul_bf16_bf16(%8, %10, %5) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>) -> ()
            aie.objectfifo.release @A_L2L1_0(Consume, 1)
            aie.objectfifo.release @B_L2L1_4(Consume, 1)
          }
          aie.objectfifo.release @C_L1L2_4_0(Produce, 1)
        }
      }
      aie.end
    } {stack_size = 3328 : i32}
    %lock_5_2 = aie.lock(%logical_core_4)
    %core_5_2 = aie.core(%logical_core_4) {
      %c0 = arith.constant 0 : index
      %c9223372036854775807 = arith.constant 9223372036854775807 : index
      %c1 = arith.constant 1 : index
      scf.for %arg0 = %c0 to %c9223372036854775807 step %c1 {
        %c1_i32 = arith.constant 1 : i32
        aie.use_lock(%lock_5_2, Acquire, %c1_i32)
        %c0_69 = arith.constant 0 : index
        %0 = memref.load %rtp0_5[%c0_69] : memref<2xi32>
        %c1_70 = arith.constant 1 : index
        %1 = memref.load %rtp0_5[%c1_70] : memref<2xi32>
        %c1_i32_71 = arith.constant 1 : i32
        %2 = arith.cmpi sgt, %1, %c1_i32_71 : i32
        %c0_72 = arith.constant 0 : index
        %3 = arith.index_cast %1 : i32 to index
        %c1_73 = arith.constant 1 : index
        scf.for %arg1 = %c0_72 to %3 step %c1_73 {
          %4 = aie.objectfifo.acquire @C_L1L2_5_0(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
          %5 = aie.objectfifo.subview.access %4[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
          func.call @op0_zero_bf16(%5) : (memref<64x64xbf16>) -> ()
          %c0_74 = arith.constant 0 : index
          %6 = arith.index_cast %0 : i32 to index
          %c1_75 = arith.constant 1 : index
          scf.for %arg2 = %c0_74 to %6 step %c1_75 {
            %7 = aie.objectfifo.acquire @A_L2L1_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %8 = aie.objectfifo.subview.access %7[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            %9 = aie.objectfifo.acquire @B_L2L1_5(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %10 = aie.objectfifo.subview.access %9[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            func.call @op0_matmul_bf16_bf16(%8, %10, %5) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>) -> ()
            aie.objectfifo.release @A_L2L1_0(Consume, 1)
            aie.objectfifo.release @B_L2L1_5(Consume, 1)
          }
          aie.objectfifo.release @C_L1L2_5_0(Produce, 1)
        }
      }
      aie.end
    } {stack_size = 3328 : i32}
    %lock_6_2 = aie.lock(%logical_core_5)
    %core_6_2 = aie.core(%logical_core_5) {
      %c0 = arith.constant 0 : index
      %c9223372036854775807 = arith.constant 9223372036854775807 : index
      %c1 = arith.constant 1 : index
      scf.for %arg0 = %c0 to %c9223372036854775807 step %c1 {
        %c1_i32 = arith.constant 1 : i32
        aie.use_lock(%lock_6_2, Acquire, %c1_i32)
        %c0_69 = arith.constant 0 : index
        %0 = memref.load %rtp0_6[%c0_69] : memref<2xi32>
        %c1_70 = arith.constant 1 : index
        %1 = memref.load %rtp0_6[%c1_70] : memref<2xi32>
        %c1_i32_71 = arith.constant 1 : i32
        %2 = arith.cmpi sgt, %1, %c1_i32_71 : i32
        %c0_72 = arith.constant 0 : index
        %3 = arith.index_cast %1 : i32 to index
        %c1_73 = arith.constant 1 : index
        scf.for %arg1 = %c0_72 to %3 step %c1_73 {
          %4 = aie.objectfifo.acquire @C_L1L2_6_0(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
          %5 = aie.objectfifo.subview.access %4[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
          func.call @op0_zero_bf16(%5) : (memref<64x64xbf16>) -> ()
          %c0_74 = arith.constant 0 : index
          %6 = arith.index_cast %0 : i32 to index
          %c1_75 = arith.constant 1 : index
          scf.for %arg2 = %c0_74 to %6 step %c1_75 {
            %7 = aie.objectfifo.acquire @A_L2L1_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %8 = aie.objectfifo.subview.access %7[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            %9 = aie.objectfifo.acquire @B_L2L1_6(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %10 = aie.objectfifo.subview.access %9[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            func.call @op0_matmul_bf16_bf16(%8, %10, %5) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>) -> ()
            aie.objectfifo.release @A_L2L1_0(Consume, 1)
            aie.objectfifo.release @B_L2L1_6(Consume, 1)
          }
          aie.objectfifo.release @C_L1L2_6_0(Produce, 1)
        }
      }
      aie.end
    } {stack_size = 3328 : i32}
    %lock_7_2 = aie.lock(%logical_core_6)
    %core_7_2 = aie.core(%logical_core_6) {
      %c0 = arith.constant 0 : index
      %c9223372036854775807 = arith.constant 9223372036854775807 : index
      %c1 = arith.constant 1 : index
      scf.for %arg0 = %c0 to %c9223372036854775807 step %c1 {
        %c1_i32 = arith.constant 1 : i32
        aie.use_lock(%lock_7_2, Acquire, %c1_i32)
        %c0_69 = arith.constant 0 : index
        %0 = memref.load %rtp0_7[%c0_69] : memref<2xi32>
        %c1_70 = arith.constant 1 : index
        %1 = memref.load %rtp0_7[%c1_70] : memref<2xi32>
        %c1_i32_71 = arith.constant 1 : i32
        %2 = arith.cmpi sgt, %1, %c1_i32_71 : i32
        %c0_72 = arith.constant 0 : index
        %3 = arith.index_cast %1 : i32 to index
        %c1_73 = arith.constant 1 : index
        scf.for %arg1 = %c0_72 to %3 step %c1_73 {
          %4 = aie.objectfifo.acquire @C_L1L2_7_0(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
          %5 = aie.objectfifo.subview.access %4[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
          func.call @op0_zero_bf16(%5) : (memref<64x64xbf16>) -> ()
          %c0_74 = arith.constant 0 : index
          %6 = arith.index_cast %0 : i32 to index
          %c1_75 = arith.constant 1 : index
          scf.for %arg2 = %c0_74 to %6 step %c1_75 {
            %7 = aie.objectfifo.acquire @A_L2L1_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %8 = aie.objectfifo.subview.access %7[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            %9 = aie.objectfifo.acquire @B_L2L1_7(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %10 = aie.objectfifo.subview.access %9[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            func.call @op0_matmul_bf16_bf16(%8, %10, %5) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>) -> ()
            aie.objectfifo.release @A_L2L1_0(Consume, 1)
            aie.objectfifo.release @B_L2L1_7(Consume, 1)
          }
          aie.objectfifo.release @C_L1L2_7_0(Produce, 1)
        }
      }
      aie.end
    } {stack_size = 3328 : i32}
    %lock_0_3 = aie.lock(%logical_core_7)
    %core_0_3 = aie.core(%logical_core_7) {
      %c0 = arith.constant 0 : index
      %c9223372036854775807 = arith.constant 9223372036854775807 : index
      %c1 = arith.constant 1 : index
      scf.for %arg0 = %c0 to %c9223372036854775807 step %c1 {
        %c1_i32 = arith.constant 1 : i32
        aie.use_lock(%lock_0_3, Acquire, %c1_i32)
        %c0_69 = arith.constant 0 : index
        %0 = memref.load %rtp1_0[%c0_69] : memref<2xi32>
        %c1_70 = arith.constant 1 : index
        %1 = memref.load %rtp1_0[%c1_70] : memref<2xi32>
        %c1_i32_71 = arith.constant 1 : i32
        %2 = arith.cmpi sgt, %1, %c1_i32_71 : i32
        %c0_72 = arith.constant 0 : index
        %3 = arith.index_cast %1 : i32 to index
        %c1_73 = arith.constant 1 : index
        scf.for %arg1 = %c0_72 to %3 step %c1_73 {
          %4 = aie.objectfifo.acquire @C_L1L2_0_1(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
          %5 = aie.objectfifo.subview.access %4[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
          func.call @op0_zero_bf16(%5) : (memref<64x64xbf16>) -> ()
          %c0_74 = arith.constant 0 : index
          %6 = arith.index_cast %0 : i32 to index
          %c1_75 = arith.constant 1 : index
          scf.for %arg2 = %c0_74 to %6 step %c1_75 {
            %7 = aie.objectfifo.acquire @A_L2L1_1(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %8 = aie.objectfifo.subview.access %7[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            %9 = aie.objectfifo.acquire @B_L2L1_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %10 = aie.objectfifo.subview.access %9[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            func.call @op0_matmul_bf16_bf16(%8, %10, %5) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>) -> ()
            aie.objectfifo.release @A_L2L1_1(Consume, 1)
            aie.objectfifo.release @B_L2L1_0(Consume, 1)
          }
          aie.objectfifo.release @C_L1L2_0_1(Produce, 1)
        }
      }
      aie.end
    } {stack_size = 3328 : i32}
    %lock_1_3 = aie.lock(%logical_core_8)
    %core_1_3 = aie.core(%logical_core_8) {
      %c0 = arith.constant 0 : index
      %c9223372036854775807 = arith.constant 9223372036854775807 : index
      %c1 = arith.constant 1 : index
      scf.for %arg0 = %c0 to %c9223372036854775807 step %c1 {
        %c1_i32 = arith.constant 1 : i32
        aie.use_lock(%lock_1_3, Acquire, %c1_i32)
        %c0_69 = arith.constant 0 : index
        %0 = memref.load %rtp1_1[%c0_69] : memref<2xi32>
        %c1_70 = arith.constant 1 : index
        %1 = memref.load %rtp1_1[%c1_70] : memref<2xi32>
        %c1_i32_71 = arith.constant 1 : i32
        %2 = arith.cmpi sgt, %1, %c1_i32_71 : i32
        %c0_72 = arith.constant 0 : index
        %3 = arith.index_cast %1 : i32 to index
        %c1_73 = arith.constant 1 : index
        scf.for %arg1 = %c0_72 to %3 step %c1_73 {
          %4 = aie.objectfifo.acquire @C_L1L2_1_1(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
          %5 = aie.objectfifo.subview.access %4[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
          func.call @op0_zero_bf16(%5) : (memref<64x64xbf16>) -> ()
          %c0_74 = arith.constant 0 : index
          %6 = arith.index_cast %0 : i32 to index
          %c1_75 = arith.constant 1 : index
          scf.for %arg2 = %c0_74 to %6 step %c1_75 {
            %7 = aie.objectfifo.acquire @A_L2L1_1(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %8 = aie.objectfifo.subview.access %7[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            %9 = aie.objectfifo.acquire @B_L2L1_1(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %10 = aie.objectfifo.subview.access %9[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            func.call @op0_matmul_bf16_bf16(%8, %10, %5) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>) -> ()
            aie.objectfifo.release @A_L2L1_1(Consume, 1)
            aie.objectfifo.release @B_L2L1_1(Consume, 1)
          }
          aie.objectfifo.release @C_L1L2_1_1(Produce, 1)
        }
      }
      aie.end
    } {stack_size = 3328 : i32}
    %lock_2_3 = aie.lock(%logical_core_9)
    %core_2_3 = aie.core(%logical_core_9) {
      %c0 = arith.constant 0 : index
      %c9223372036854775807 = arith.constant 9223372036854775807 : index
      %c1 = arith.constant 1 : index
      scf.for %arg0 = %c0 to %c9223372036854775807 step %c1 {
        %c1_i32 = arith.constant 1 : i32
        aie.use_lock(%lock_2_3, Acquire, %c1_i32)
        %c0_69 = arith.constant 0 : index
        %0 = memref.load %rtp1_2[%c0_69] : memref<2xi32>
        %c1_70 = arith.constant 1 : index
        %1 = memref.load %rtp1_2[%c1_70] : memref<2xi32>
        %c1_i32_71 = arith.constant 1 : i32
        %2 = arith.cmpi sgt, %1, %c1_i32_71 : i32
        %c0_72 = arith.constant 0 : index
        %3 = arith.index_cast %1 : i32 to index
        %c1_73 = arith.constant 1 : index
        scf.for %arg1 = %c0_72 to %3 step %c1_73 {
          %4 = aie.objectfifo.acquire @C_L1L2_2_1(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
          %5 = aie.objectfifo.subview.access %4[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
          func.call @op0_zero_bf16(%5) : (memref<64x64xbf16>) -> ()
          %c0_74 = arith.constant 0 : index
          %6 = arith.index_cast %0 : i32 to index
          %c1_75 = arith.constant 1 : index
          scf.for %arg2 = %c0_74 to %6 step %c1_75 {
            %7 = aie.objectfifo.acquire @A_L2L1_1(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %8 = aie.objectfifo.subview.access %7[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            %9 = aie.objectfifo.acquire @B_L2L1_2(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %10 = aie.objectfifo.subview.access %9[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            func.call @op0_matmul_bf16_bf16(%8, %10, %5) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>) -> ()
            aie.objectfifo.release @A_L2L1_1(Consume, 1)
            aie.objectfifo.release @B_L2L1_2(Consume, 1)
          }
          aie.objectfifo.release @C_L1L2_2_1(Produce, 1)
        }
      }
      aie.end
    } {stack_size = 3328 : i32}
    %lock_3_3 = aie.lock(%logical_core_10)
    %core_3_3 = aie.core(%logical_core_10) {
      %c0 = arith.constant 0 : index
      %c9223372036854775807 = arith.constant 9223372036854775807 : index
      %c1 = arith.constant 1 : index
      scf.for %arg0 = %c0 to %c9223372036854775807 step %c1 {
        %c1_i32 = arith.constant 1 : i32
        aie.use_lock(%lock_3_3, Acquire, %c1_i32)
        %c0_69 = arith.constant 0 : index
        %0 = memref.load %rtp1_3[%c0_69] : memref<2xi32>
        %c1_70 = arith.constant 1 : index
        %1 = memref.load %rtp1_3[%c1_70] : memref<2xi32>
        %c1_i32_71 = arith.constant 1 : i32
        %2 = arith.cmpi sgt, %1, %c1_i32_71 : i32
        %c0_72 = arith.constant 0 : index
        %3 = arith.index_cast %1 : i32 to index
        %c1_73 = arith.constant 1 : index
        scf.for %arg1 = %c0_72 to %3 step %c1_73 {
          %4 = aie.objectfifo.acquire @C_L1L2_3_1(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
          %5 = aie.objectfifo.subview.access %4[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
          func.call @op0_zero_bf16(%5) : (memref<64x64xbf16>) -> ()
          %c0_74 = arith.constant 0 : index
          %6 = arith.index_cast %0 : i32 to index
          %c1_75 = arith.constant 1 : index
          scf.for %arg2 = %c0_74 to %6 step %c1_75 {
            %7 = aie.objectfifo.acquire @A_L2L1_1(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %8 = aie.objectfifo.subview.access %7[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            %9 = aie.objectfifo.acquire @B_L2L1_3(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %10 = aie.objectfifo.subview.access %9[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            func.call @op0_matmul_bf16_bf16(%8, %10, %5) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>) -> ()
            aie.objectfifo.release @A_L2L1_1(Consume, 1)
            aie.objectfifo.release @B_L2L1_3(Consume, 1)
          }
          aie.objectfifo.release @C_L1L2_3_1(Produce, 1)
        }
      }
      aie.end
    } {stack_size = 3328 : i32}
    %lock_4_3 = aie.lock(%logical_core_11)
    %core_4_3 = aie.core(%logical_core_11) {
      %c0 = arith.constant 0 : index
      %c9223372036854775807 = arith.constant 9223372036854775807 : index
      %c1 = arith.constant 1 : index
      scf.for %arg0 = %c0 to %c9223372036854775807 step %c1 {
        %c1_i32 = arith.constant 1 : i32
        aie.use_lock(%lock_4_3, Acquire, %c1_i32)
        %c0_69 = arith.constant 0 : index
        %0 = memref.load %rtp1_4[%c0_69] : memref<2xi32>
        %c1_70 = arith.constant 1 : index
        %1 = memref.load %rtp1_4[%c1_70] : memref<2xi32>
        %c1_i32_71 = arith.constant 1 : i32
        %2 = arith.cmpi sgt, %1, %c1_i32_71 : i32
        %c0_72 = arith.constant 0 : index
        %3 = arith.index_cast %1 : i32 to index
        %c1_73 = arith.constant 1 : index
        scf.for %arg1 = %c0_72 to %3 step %c1_73 {
          %4 = aie.objectfifo.acquire @C_L1L2_4_1(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
          %5 = aie.objectfifo.subview.access %4[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
          func.call @op0_zero_bf16(%5) : (memref<64x64xbf16>) -> ()
          %c0_74 = arith.constant 0 : index
          %6 = arith.index_cast %0 : i32 to index
          %c1_75 = arith.constant 1 : index
          scf.for %arg2 = %c0_74 to %6 step %c1_75 {
            %7 = aie.objectfifo.acquire @A_L2L1_1(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %8 = aie.objectfifo.subview.access %7[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            %9 = aie.objectfifo.acquire @B_L2L1_4(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %10 = aie.objectfifo.subview.access %9[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            func.call @op0_matmul_bf16_bf16(%8, %10, %5) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>) -> ()
            aie.objectfifo.release @A_L2L1_1(Consume, 1)
            aie.objectfifo.release @B_L2L1_4(Consume, 1)
          }
          aie.objectfifo.release @C_L1L2_4_1(Produce, 1)
        }
      }
      aie.end
    } {stack_size = 3328 : i32}
    %lock_5_3 = aie.lock(%logical_core_12)
    %core_5_3 = aie.core(%logical_core_12) {
      %c0 = arith.constant 0 : index
      %c9223372036854775807 = arith.constant 9223372036854775807 : index
      %c1 = arith.constant 1 : index
      scf.for %arg0 = %c0 to %c9223372036854775807 step %c1 {
        %c1_i32 = arith.constant 1 : i32
        aie.use_lock(%lock_5_3, Acquire, %c1_i32)
        %c0_69 = arith.constant 0 : index
        %0 = memref.load %rtp1_5[%c0_69] : memref<2xi32>
        %c1_70 = arith.constant 1 : index
        %1 = memref.load %rtp1_5[%c1_70] : memref<2xi32>
        %c1_i32_71 = arith.constant 1 : i32
        %2 = arith.cmpi sgt, %1, %c1_i32_71 : i32
        %c0_72 = arith.constant 0 : index
        %3 = arith.index_cast %1 : i32 to index
        %c1_73 = arith.constant 1 : index
        scf.for %arg1 = %c0_72 to %3 step %c1_73 {
          %4 = aie.objectfifo.acquire @C_L1L2_5_1(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
          %5 = aie.objectfifo.subview.access %4[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
          func.call @op0_zero_bf16(%5) : (memref<64x64xbf16>) -> ()
          %c0_74 = arith.constant 0 : index
          %6 = arith.index_cast %0 : i32 to index
          %c1_75 = arith.constant 1 : index
          scf.for %arg2 = %c0_74 to %6 step %c1_75 {
            %7 = aie.objectfifo.acquire @A_L2L1_1(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %8 = aie.objectfifo.subview.access %7[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            %9 = aie.objectfifo.acquire @B_L2L1_5(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %10 = aie.objectfifo.subview.access %9[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            func.call @op0_matmul_bf16_bf16(%8, %10, %5) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>) -> ()
            aie.objectfifo.release @A_L2L1_1(Consume, 1)
            aie.objectfifo.release @B_L2L1_5(Consume, 1)
          }
          aie.objectfifo.release @C_L1L2_5_1(Produce, 1)
        }
      }
      aie.end
    } {stack_size = 3328 : i32}
    %lock_6_3 = aie.lock(%logical_core_13)
    %core_6_3 = aie.core(%logical_core_13) {
      %c0 = arith.constant 0 : index
      %c9223372036854775807 = arith.constant 9223372036854775807 : index
      %c1 = arith.constant 1 : index
      scf.for %arg0 = %c0 to %c9223372036854775807 step %c1 {
        %c1_i32 = arith.constant 1 : i32
        aie.use_lock(%lock_6_3, Acquire, %c1_i32)
        %c0_69 = arith.constant 0 : index
        %0 = memref.load %rtp1_6[%c0_69] : memref<2xi32>
        %c1_70 = arith.constant 1 : index
        %1 = memref.load %rtp1_6[%c1_70] : memref<2xi32>
        %c1_i32_71 = arith.constant 1 : i32
        %2 = arith.cmpi sgt, %1, %c1_i32_71 : i32
        %c0_72 = arith.constant 0 : index
        %3 = arith.index_cast %1 : i32 to index
        %c1_73 = arith.constant 1 : index
        scf.for %arg1 = %c0_72 to %3 step %c1_73 {
          %4 = aie.objectfifo.acquire @C_L1L2_6_1(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
          %5 = aie.objectfifo.subview.access %4[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
          func.call @op0_zero_bf16(%5) : (memref<64x64xbf16>) -> ()
          %c0_74 = arith.constant 0 : index
          %6 = arith.index_cast %0 : i32 to index
          %c1_75 = arith.constant 1 : index
          scf.for %arg2 = %c0_74 to %6 step %c1_75 {
            %7 = aie.objectfifo.acquire @A_L2L1_1(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %8 = aie.objectfifo.subview.access %7[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            %9 = aie.objectfifo.acquire @B_L2L1_6(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %10 = aie.objectfifo.subview.access %9[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            func.call @op0_matmul_bf16_bf16(%8, %10, %5) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>) -> ()
            aie.objectfifo.release @A_L2L1_1(Consume, 1)
            aie.objectfifo.release @B_L2L1_6(Consume, 1)
          }
          aie.objectfifo.release @C_L1L2_6_1(Produce, 1)
        }
      }
      aie.end
    } {stack_size = 3328 : i32}
    %lock_7_3 = aie.lock(%logical_core_14)
    %core_7_3 = aie.core(%logical_core_14) {
      %c0 = arith.constant 0 : index
      %c9223372036854775807 = arith.constant 9223372036854775807 : index
      %c1 = arith.constant 1 : index
      scf.for %arg0 = %c0 to %c9223372036854775807 step %c1 {
        %c1_i32 = arith.constant 1 : i32
        aie.use_lock(%lock_7_3, Acquire, %c1_i32)
        %c0_69 = arith.constant 0 : index
        %0 = memref.load %rtp1_7[%c0_69] : memref<2xi32>
        %c1_70 = arith.constant 1 : index
        %1 = memref.load %rtp1_7[%c1_70] : memref<2xi32>
        %c1_i32_71 = arith.constant 1 : i32
        %2 = arith.cmpi sgt, %1, %c1_i32_71 : i32
        %c0_72 = arith.constant 0 : index
        %3 = arith.index_cast %1 : i32 to index
        %c1_73 = arith.constant 1 : index
        scf.for %arg1 = %c0_72 to %3 step %c1_73 {
          %4 = aie.objectfifo.acquire @C_L1L2_7_1(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
          %5 = aie.objectfifo.subview.access %4[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
          func.call @op0_zero_bf16(%5) : (memref<64x64xbf16>) -> ()
          %c0_74 = arith.constant 0 : index
          %6 = arith.index_cast %0 : i32 to index
          %c1_75 = arith.constant 1 : index
          scf.for %arg2 = %c0_74 to %6 step %c1_75 {
            %7 = aie.objectfifo.acquire @A_L2L1_1(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %8 = aie.objectfifo.subview.access %7[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            %9 = aie.objectfifo.acquire @B_L2L1_7(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %10 = aie.objectfifo.subview.access %9[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            func.call @op0_matmul_bf16_bf16(%8, %10, %5) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>) -> ()
            aie.objectfifo.release @A_L2L1_1(Consume, 1)
            aie.objectfifo.release @B_L2L1_7(Consume, 1)
          }
          aie.objectfifo.release @C_L1L2_7_1(Produce, 1)
        }
      }
      aie.end
    } {stack_size = 3328 : i32}
    %lock_0_4 = aie.lock(%logical_core_15)
    %core_0_4 = aie.core(%logical_core_15) {
      %c0 = arith.constant 0 : index
      %c9223372036854775807 = arith.constant 9223372036854775807 : index
      %c1 = arith.constant 1 : index
      scf.for %arg0 = %c0 to %c9223372036854775807 step %c1 {
        %c1_i32 = arith.constant 1 : i32
        aie.use_lock(%lock_0_4, Acquire, %c1_i32)
        %c0_69 = arith.constant 0 : index
        %0 = memref.load %rtp2_0[%c0_69] : memref<2xi32>
        %c1_70 = arith.constant 1 : index
        %1 = memref.load %rtp2_0[%c1_70] : memref<2xi32>
        %c1_i32_71 = arith.constant 1 : i32
        %2 = arith.cmpi sgt, %1, %c1_i32_71 : i32
        %c0_72 = arith.constant 0 : index
        %3 = arith.index_cast %1 : i32 to index
        %c1_73 = arith.constant 1 : index
        scf.for %arg1 = %c0_72 to %3 step %c1_73 {
          %4 = aie.objectfifo.acquire @C_L1L2_0_2(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
          %5 = aie.objectfifo.subview.access %4[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
          func.call @op0_zero_bf16(%5) : (memref<64x64xbf16>) -> ()
          %c0_74 = arith.constant 0 : index
          %6 = arith.index_cast %0 : i32 to index
          %c1_75 = arith.constant 1 : index
          scf.for %arg2 = %c0_74 to %6 step %c1_75 {
            %7 = aie.objectfifo.acquire @A_L2L1_2(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %8 = aie.objectfifo.subview.access %7[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            %9 = aie.objectfifo.acquire @B_L2L1_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %10 = aie.objectfifo.subview.access %9[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            func.call @op0_matmul_bf16_bf16(%8, %10, %5) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>) -> ()
            aie.objectfifo.release @A_L2L1_2(Consume, 1)
            aie.objectfifo.release @B_L2L1_0(Consume, 1)
          }
          aie.objectfifo.release @C_L1L2_0_2(Produce, 1)
        }
      }
      aie.end
    } {stack_size = 3328 : i32}
    %lock_1_4 = aie.lock(%logical_core_16)
    %core_1_4 = aie.core(%logical_core_16) {
      %c0 = arith.constant 0 : index
      %c9223372036854775807 = arith.constant 9223372036854775807 : index
      %c1 = arith.constant 1 : index
      scf.for %arg0 = %c0 to %c9223372036854775807 step %c1 {
        %c1_i32 = arith.constant 1 : i32
        aie.use_lock(%lock_1_4, Acquire, %c1_i32)
        %c0_69 = arith.constant 0 : index
        %0 = memref.load %rtp2_1[%c0_69] : memref<2xi32>
        %c1_70 = arith.constant 1 : index
        %1 = memref.load %rtp2_1[%c1_70] : memref<2xi32>
        %c1_i32_71 = arith.constant 1 : i32
        %2 = arith.cmpi sgt, %1, %c1_i32_71 : i32
        %c0_72 = arith.constant 0 : index
        %3 = arith.index_cast %1 : i32 to index
        %c1_73 = arith.constant 1 : index
        scf.for %arg1 = %c0_72 to %3 step %c1_73 {
          %4 = aie.objectfifo.acquire @C_L1L2_1_2(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
          %5 = aie.objectfifo.subview.access %4[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
          func.call @op0_zero_bf16(%5) : (memref<64x64xbf16>) -> ()
          %c0_74 = arith.constant 0 : index
          %6 = arith.index_cast %0 : i32 to index
          %c1_75 = arith.constant 1 : index
          scf.for %arg2 = %c0_74 to %6 step %c1_75 {
            %7 = aie.objectfifo.acquire @A_L2L1_2(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %8 = aie.objectfifo.subview.access %7[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            %9 = aie.objectfifo.acquire @B_L2L1_1(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %10 = aie.objectfifo.subview.access %9[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            func.call @op0_matmul_bf16_bf16(%8, %10, %5) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>) -> ()
            aie.objectfifo.release @A_L2L1_2(Consume, 1)
            aie.objectfifo.release @B_L2L1_1(Consume, 1)
          }
          aie.objectfifo.release @C_L1L2_1_2(Produce, 1)
        }
      }
      aie.end
    } {stack_size = 3328 : i32}
    %lock_2_4 = aie.lock(%logical_core_17)
    %core_2_4 = aie.core(%logical_core_17) {
      %c0 = arith.constant 0 : index
      %c9223372036854775807 = arith.constant 9223372036854775807 : index
      %c1 = arith.constant 1 : index
      scf.for %arg0 = %c0 to %c9223372036854775807 step %c1 {
        %c1_i32 = arith.constant 1 : i32
        aie.use_lock(%lock_2_4, Acquire, %c1_i32)
        %c0_69 = arith.constant 0 : index
        %0 = memref.load %rtp2_2[%c0_69] : memref<2xi32>
        %c1_70 = arith.constant 1 : index
        %1 = memref.load %rtp2_2[%c1_70] : memref<2xi32>
        %c1_i32_71 = arith.constant 1 : i32
        %2 = arith.cmpi sgt, %1, %c1_i32_71 : i32
        %c0_72 = arith.constant 0 : index
        %3 = arith.index_cast %1 : i32 to index
        %c1_73 = arith.constant 1 : index
        scf.for %arg1 = %c0_72 to %3 step %c1_73 {
          %4 = aie.objectfifo.acquire @C_L1L2_2_2(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
          %5 = aie.objectfifo.subview.access %4[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
          func.call @op0_zero_bf16(%5) : (memref<64x64xbf16>) -> ()
          %c0_74 = arith.constant 0 : index
          %6 = arith.index_cast %0 : i32 to index
          %c1_75 = arith.constant 1 : index
          scf.for %arg2 = %c0_74 to %6 step %c1_75 {
            %7 = aie.objectfifo.acquire @A_L2L1_2(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %8 = aie.objectfifo.subview.access %7[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            %9 = aie.objectfifo.acquire @B_L2L1_2(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %10 = aie.objectfifo.subview.access %9[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            func.call @op0_matmul_bf16_bf16(%8, %10, %5) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>) -> ()
            aie.objectfifo.release @A_L2L1_2(Consume, 1)
            aie.objectfifo.release @B_L2L1_2(Consume, 1)
          }
          aie.objectfifo.release @C_L1L2_2_2(Produce, 1)
        }
      }
      aie.end
    } {stack_size = 3328 : i32}
    %lock_3_4 = aie.lock(%logical_core_18)
    %core_3_4 = aie.core(%logical_core_18) {
      %c0 = arith.constant 0 : index
      %c9223372036854775807 = arith.constant 9223372036854775807 : index
      %c1 = arith.constant 1 : index
      scf.for %arg0 = %c0 to %c9223372036854775807 step %c1 {
        %c1_i32 = arith.constant 1 : i32
        aie.use_lock(%lock_3_4, Acquire, %c1_i32)
        %c0_69 = arith.constant 0 : index
        %0 = memref.load %rtp2_3[%c0_69] : memref<2xi32>
        %c1_70 = arith.constant 1 : index
        %1 = memref.load %rtp2_3[%c1_70] : memref<2xi32>
        %c1_i32_71 = arith.constant 1 : i32
        %2 = arith.cmpi sgt, %1, %c1_i32_71 : i32
        %c0_72 = arith.constant 0 : index
        %3 = arith.index_cast %1 : i32 to index
        %c1_73 = arith.constant 1 : index
        scf.for %arg1 = %c0_72 to %3 step %c1_73 {
          %4 = aie.objectfifo.acquire @C_L1L2_3_2(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
          %5 = aie.objectfifo.subview.access %4[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
          func.call @op0_zero_bf16(%5) : (memref<64x64xbf16>) -> ()
          %c0_74 = arith.constant 0 : index
          %6 = arith.index_cast %0 : i32 to index
          %c1_75 = arith.constant 1 : index
          scf.for %arg2 = %c0_74 to %6 step %c1_75 {
            %7 = aie.objectfifo.acquire @A_L2L1_2(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %8 = aie.objectfifo.subview.access %7[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            %9 = aie.objectfifo.acquire @B_L2L1_3(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %10 = aie.objectfifo.subview.access %9[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            func.call @op0_matmul_bf16_bf16(%8, %10, %5) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>) -> ()
            aie.objectfifo.release @A_L2L1_2(Consume, 1)
            aie.objectfifo.release @B_L2L1_3(Consume, 1)
          }
          aie.objectfifo.release @C_L1L2_3_2(Produce, 1)
        }
      }
      aie.end
    } {stack_size = 3328 : i32}
    %lock_4_4 = aie.lock(%logical_core_19)
    %core_4_4 = aie.core(%logical_core_19) {
      %c0 = arith.constant 0 : index
      %c9223372036854775807 = arith.constant 9223372036854775807 : index
      %c1 = arith.constant 1 : index
      scf.for %arg0 = %c0 to %c9223372036854775807 step %c1 {
        %c1_i32 = arith.constant 1 : i32
        aie.use_lock(%lock_4_4, Acquire, %c1_i32)
        %c0_69 = arith.constant 0 : index
        %0 = memref.load %rtp2_4[%c0_69] : memref<2xi32>
        %c1_70 = arith.constant 1 : index
        %1 = memref.load %rtp2_4[%c1_70] : memref<2xi32>
        %c1_i32_71 = arith.constant 1 : i32
        %2 = arith.cmpi sgt, %1, %c1_i32_71 : i32
        %c0_72 = arith.constant 0 : index
        %3 = arith.index_cast %1 : i32 to index
        %c1_73 = arith.constant 1 : index
        scf.for %arg1 = %c0_72 to %3 step %c1_73 {
          %4 = aie.objectfifo.acquire @C_L1L2_4_2(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
          %5 = aie.objectfifo.subview.access %4[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
          func.call @op0_zero_bf16(%5) : (memref<64x64xbf16>) -> ()
          %c0_74 = arith.constant 0 : index
          %6 = arith.index_cast %0 : i32 to index
          %c1_75 = arith.constant 1 : index
          scf.for %arg2 = %c0_74 to %6 step %c1_75 {
            %7 = aie.objectfifo.acquire @A_L2L1_2(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %8 = aie.objectfifo.subview.access %7[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            %9 = aie.objectfifo.acquire @B_L2L1_4(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %10 = aie.objectfifo.subview.access %9[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            func.call @op0_matmul_bf16_bf16(%8, %10, %5) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>) -> ()
            aie.objectfifo.release @A_L2L1_2(Consume, 1)
            aie.objectfifo.release @B_L2L1_4(Consume, 1)
          }
          aie.objectfifo.release @C_L1L2_4_2(Produce, 1)
        }
      }
      aie.end
    } {stack_size = 3328 : i32}
    %lock_5_4 = aie.lock(%logical_core_20)
    %core_5_4 = aie.core(%logical_core_20) {
      %c0 = arith.constant 0 : index
      %c9223372036854775807 = arith.constant 9223372036854775807 : index
      %c1 = arith.constant 1 : index
      scf.for %arg0 = %c0 to %c9223372036854775807 step %c1 {
        %c1_i32 = arith.constant 1 : i32
        aie.use_lock(%lock_5_4, Acquire, %c1_i32)
        %c0_69 = arith.constant 0 : index
        %0 = memref.load %rtp2_5[%c0_69] : memref<2xi32>
        %c1_70 = arith.constant 1 : index
        %1 = memref.load %rtp2_5[%c1_70] : memref<2xi32>
        %c1_i32_71 = arith.constant 1 : i32
        %2 = arith.cmpi sgt, %1, %c1_i32_71 : i32
        %c0_72 = arith.constant 0 : index
        %3 = arith.index_cast %1 : i32 to index
        %c1_73 = arith.constant 1 : index
        scf.for %arg1 = %c0_72 to %3 step %c1_73 {
          %4 = aie.objectfifo.acquire @C_L1L2_5_2(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
          %5 = aie.objectfifo.subview.access %4[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
          func.call @op0_zero_bf16(%5) : (memref<64x64xbf16>) -> ()
          %c0_74 = arith.constant 0 : index
          %6 = arith.index_cast %0 : i32 to index
          %c1_75 = arith.constant 1 : index
          scf.for %arg2 = %c0_74 to %6 step %c1_75 {
            %7 = aie.objectfifo.acquire @A_L2L1_2(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %8 = aie.objectfifo.subview.access %7[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            %9 = aie.objectfifo.acquire @B_L2L1_5(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %10 = aie.objectfifo.subview.access %9[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            func.call @op0_matmul_bf16_bf16(%8, %10, %5) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>) -> ()
            aie.objectfifo.release @A_L2L1_2(Consume, 1)
            aie.objectfifo.release @B_L2L1_5(Consume, 1)
          }
          aie.objectfifo.release @C_L1L2_5_2(Produce, 1)
        }
      }
      aie.end
    } {stack_size = 3328 : i32}
    %lock_6_4 = aie.lock(%logical_core_21)
    %core_6_4 = aie.core(%logical_core_21) {
      %c0 = arith.constant 0 : index
      %c9223372036854775807 = arith.constant 9223372036854775807 : index
      %c1 = arith.constant 1 : index
      scf.for %arg0 = %c0 to %c9223372036854775807 step %c1 {
        %c1_i32 = arith.constant 1 : i32
        aie.use_lock(%lock_6_4, Acquire, %c1_i32)
        %c0_69 = arith.constant 0 : index
        %0 = memref.load %rtp2_6[%c0_69] : memref<2xi32>
        %c1_70 = arith.constant 1 : index
        %1 = memref.load %rtp2_6[%c1_70] : memref<2xi32>
        %c1_i32_71 = arith.constant 1 : i32
        %2 = arith.cmpi sgt, %1, %c1_i32_71 : i32
        %c0_72 = arith.constant 0 : index
        %3 = arith.index_cast %1 : i32 to index
        %c1_73 = arith.constant 1 : index
        scf.for %arg1 = %c0_72 to %3 step %c1_73 {
          %4 = aie.objectfifo.acquire @C_L1L2_6_2(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
          %5 = aie.objectfifo.subview.access %4[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
          func.call @op0_zero_bf16(%5) : (memref<64x64xbf16>) -> ()
          %c0_74 = arith.constant 0 : index
          %6 = arith.index_cast %0 : i32 to index
          %c1_75 = arith.constant 1 : index
          scf.for %arg2 = %c0_74 to %6 step %c1_75 {
            %7 = aie.objectfifo.acquire @A_L2L1_2(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %8 = aie.objectfifo.subview.access %7[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            %9 = aie.objectfifo.acquire @B_L2L1_6(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %10 = aie.objectfifo.subview.access %9[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            func.call @op0_matmul_bf16_bf16(%8, %10, %5) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>) -> ()
            aie.objectfifo.release @A_L2L1_2(Consume, 1)
            aie.objectfifo.release @B_L2L1_6(Consume, 1)
          }
          aie.objectfifo.release @C_L1L2_6_2(Produce, 1)
        }
      }
      aie.end
    } {stack_size = 3328 : i32}
    %lock_7_4 = aie.lock(%logical_core_22)
    %core_7_4 = aie.core(%logical_core_22) {
      %c0 = arith.constant 0 : index
      %c9223372036854775807 = arith.constant 9223372036854775807 : index
      %c1 = arith.constant 1 : index
      scf.for %arg0 = %c0 to %c9223372036854775807 step %c1 {
        %c1_i32 = arith.constant 1 : i32
        aie.use_lock(%lock_7_4, Acquire, %c1_i32)
        %c0_69 = arith.constant 0 : index
        %0 = memref.load %rtp2_7[%c0_69] : memref<2xi32>
        %c1_70 = arith.constant 1 : index
        %1 = memref.load %rtp2_7[%c1_70] : memref<2xi32>
        %c1_i32_71 = arith.constant 1 : i32
        %2 = arith.cmpi sgt, %1, %c1_i32_71 : i32
        %c0_72 = arith.constant 0 : index
        %3 = arith.index_cast %1 : i32 to index
        %c1_73 = arith.constant 1 : index
        scf.for %arg1 = %c0_72 to %3 step %c1_73 {
          %4 = aie.objectfifo.acquire @C_L1L2_7_2(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
          %5 = aie.objectfifo.subview.access %4[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
          func.call @op0_zero_bf16(%5) : (memref<64x64xbf16>) -> ()
          %c0_74 = arith.constant 0 : index
          %6 = arith.index_cast %0 : i32 to index
          %c1_75 = arith.constant 1 : index
          scf.for %arg2 = %c0_74 to %6 step %c1_75 {
            %7 = aie.objectfifo.acquire @A_L2L1_2(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %8 = aie.objectfifo.subview.access %7[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            %9 = aie.objectfifo.acquire @B_L2L1_7(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %10 = aie.objectfifo.subview.access %9[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            func.call @op0_matmul_bf16_bf16(%8, %10, %5) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>) -> ()
            aie.objectfifo.release @A_L2L1_2(Consume, 1)
            aie.objectfifo.release @B_L2L1_7(Consume, 1)
          }
          aie.objectfifo.release @C_L1L2_7_2(Produce, 1)
        }
      }
      aie.end
    } {stack_size = 3328 : i32}
    %lock_0_5 = aie.lock(%logical_core_23)
    %core_0_5 = aie.core(%logical_core_23) {
      %c0 = arith.constant 0 : index
      %c9223372036854775807 = arith.constant 9223372036854775807 : index
      %c1 = arith.constant 1 : index
      scf.for %arg0 = %c0 to %c9223372036854775807 step %c1 {
        %c1_i32 = arith.constant 1 : i32
        aie.use_lock(%lock_0_5, Acquire, %c1_i32)
        %c0_69 = arith.constant 0 : index
        %0 = memref.load %rtp3_0[%c0_69] : memref<2xi32>
        %c1_70 = arith.constant 1 : index
        %1 = memref.load %rtp3_0[%c1_70] : memref<2xi32>
        %c1_i32_71 = arith.constant 1 : i32
        %2 = arith.cmpi sgt, %1, %c1_i32_71 : i32
        %c0_72 = arith.constant 0 : index
        %3 = arith.index_cast %1 : i32 to index
        %c1_73 = arith.constant 1 : index
        scf.for %arg1 = %c0_72 to %3 step %c1_73 {
          %4 = aie.objectfifo.acquire @C_L1L2_0_3(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
          %5 = aie.objectfifo.subview.access %4[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
          func.call @op0_zero_bf16(%5) : (memref<64x64xbf16>) -> ()
          %c0_74 = arith.constant 0 : index
          %6 = arith.index_cast %0 : i32 to index
          %c1_75 = arith.constant 1 : index
          scf.for %arg2 = %c0_74 to %6 step %c1_75 {
            %7 = aie.objectfifo.acquire @A_L2L1_3(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %8 = aie.objectfifo.subview.access %7[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            %9 = aie.objectfifo.acquire @B_L2L1_0(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %10 = aie.objectfifo.subview.access %9[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            func.call @op0_matmul_bf16_bf16(%8, %10, %5) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>) -> ()
            aie.objectfifo.release @A_L2L1_3(Consume, 1)
            aie.objectfifo.release @B_L2L1_0(Consume, 1)
          }
          aie.objectfifo.release @C_L1L2_0_3(Produce, 1)
        }
      }
      aie.end
    } {stack_size = 3328 : i32}
    %lock_1_5 = aie.lock(%logical_core_24)
    %core_1_5 = aie.core(%logical_core_24) {
      %c0 = arith.constant 0 : index
      %c9223372036854775807 = arith.constant 9223372036854775807 : index
      %c1 = arith.constant 1 : index
      scf.for %arg0 = %c0 to %c9223372036854775807 step %c1 {
        %c1_i32 = arith.constant 1 : i32
        aie.use_lock(%lock_1_5, Acquire, %c1_i32)
        %c0_69 = arith.constant 0 : index
        %0 = memref.load %rtp3_1[%c0_69] : memref<2xi32>
        %c1_70 = arith.constant 1 : index
        %1 = memref.load %rtp3_1[%c1_70] : memref<2xi32>
        %c1_i32_71 = arith.constant 1 : i32
        %2 = arith.cmpi sgt, %1, %c1_i32_71 : i32
        %c0_72 = arith.constant 0 : index
        %3 = arith.index_cast %1 : i32 to index
        %c1_73 = arith.constant 1 : index
        scf.for %arg1 = %c0_72 to %3 step %c1_73 {
          %4 = aie.objectfifo.acquire @C_L1L2_1_3(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
          %5 = aie.objectfifo.subview.access %4[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
          func.call @op0_zero_bf16(%5) : (memref<64x64xbf16>) -> ()
          %c0_74 = arith.constant 0 : index
          %6 = arith.index_cast %0 : i32 to index
          %c1_75 = arith.constant 1 : index
          scf.for %arg2 = %c0_74 to %6 step %c1_75 {
            %7 = aie.objectfifo.acquire @A_L2L1_3(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %8 = aie.objectfifo.subview.access %7[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            %9 = aie.objectfifo.acquire @B_L2L1_1(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %10 = aie.objectfifo.subview.access %9[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            func.call @op0_matmul_bf16_bf16(%8, %10, %5) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>) -> ()
            aie.objectfifo.release @A_L2L1_3(Consume, 1)
            aie.objectfifo.release @B_L2L1_1(Consume, 1)
          }
          aie.objectfifo.release @C_L1L2_1_3(Produce, 1)
        }
      }
      aie.end
    } {stack_size = 3328 : i32}
    %lock_2_5 = aie.lock(%logical_core_25)
    %core_2_5 = aie.core(%logical_core_25) {
      %c0 = arith.constant 0 : index
      %c9223372036854775807 = arith.constant 9223372036854775807 : index
      %c1 = arith.constant 1 : index
      scf.for %arg0 = %c0 to %c9223372036854775807 step %c1 {
        %c1_i32 = arith.constant 1 : i32
        aie.use_lock(%lock_2_5, Acquire, %c1_i32)
        %c0_69 = arith.constant 0 : index
        %0 = memref.load %rtp3_2[%c0_69] : memref<2xi32>
        %c1_70 = arith.constant 1 : index
        %1 = memref.load %rtp3_2[%c1_70] : memref<2xi32>
        %c1_i32_71 = arith.constant 1 : i32
        %2 = arith.cmpi sgt, %1, %c1_i32_71 : i32
        %c0_72 = arith.constant 0 : index
        %3 = arith.index_cast %1 : i32 to index
        %c1_73 = arith.constant 1 : index
        scf.for %arg1 = %c0_72 to %3 step %c1_73 {
          %4 = aie.objectfifo.acquire @C_L1L2_2_3(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
          %5 = aie.objectfifo.subview.access %4[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
          func.call @op0_zero_bf16(%5) : (memref<64x64xbf16>) -> ()
          %c0_74 = arith.constant 0 : index
          %6 = arith.index_cast %0 : i32 to index
          %c1_75 = arith.constant 1 : index
          scf.for %arg2 = %c0_74 to %6 step %c1_75 {
            %7 = aie.objectfifo.acquire @A_L2L1_3(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %8 = aie.objectfifo.subview.access %7[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            %9 = aie.objectfifo.acquire @B_L2L1_2(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %10 = aie.objectfifo.subview.access %9[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            func.call @op0_matmul_bf16_bf16(%8, %10, %5) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>) -> ()
            aie.objectfifo.release @A_L2L1_3(Consume, 1)
            aie.objectfifo.release @B_L2L1_2(Consume, 1)
          }
          aie.objectfifo.release @C_L1L2_2_3(Produce, 1)
        }
      }
      aie.end
    } {stack_size = 3328 : i32}
    %lock_3_5 = aie.lock(%logical_core_26)
    %core_3_5 = aie.core(%logical_core_26) {
      %c0 = arith.constant 0 : index
      %c9223372036854775807 = arith.constant 9223372036854775807 : index
      %c1 = arith.constant 1 : index
      scf.for %arg0 = %c0 to %c9223372036854775807 step %c1 {
        %c1_i32 = arith.constant 1 : i32
        aie.use_lock(%lock_3_5, Acquire, %c1_i32)
        %c0_69 = arith.constant 0 : index
        %0 = memref.load %rtp3_3[%c0_69] : memref<2xi32>
        %c1_70 = arith.constant 1 : index
        %1 = memref.load %rtp3_3[%c1_70] : memref<2xi32>
        %c1_i32_71 = arith.constant 1 : i32
        %2 = arith.cmpi sgt, %1, %c1_i32_71 : i32
        %c0_72 = arith.constant 0 : index
        %3 = arith.index_cast %1 : i32 to index
        %c1_73 = arith.constant 1 : index
        scf.for %arg1 = %c0_72 to %3 step %c1_73 {
          %4 = aie.objectfifo.acquire @C_L1L2_3_3(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
          %5 = aie.objectfifo.subview.access %4[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
          func.call @op0_zero_bf16(%5) : (memref<64x64xbf16>) -> ()
          %c0_74 = arith.constant 0 : index
          %6 = arith.index_cast %0 : i32 to index
          %c1_75 = arith.constant 1 : index
          scf.for %arg2 = %c0_74 to %6 step %c1_75 {
            %7 = aie.objectfifo.acquire @A_L2L1_3(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %8 = aie.objectfifo.subview.access %7[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            %9 = aie.objectfifo.acquire @B_L2L1_3(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %10 = aie.objectfifo.subview.access %9[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            func.call @op0_matmul_bf16_bf16(%8, %10, %5) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>) -> ()
            aie.objectfifo.release @A_L2L1_3(Consume, 1)
            aie.objectfifo.release @B_L2L1_3(Consume, 1)
          }
          aie.objectfifo.release @C_L1L2_3_3(Produce, 1)
        }
      }
      aie.end
    } {stack_size = 3328 : i32}
    %lock_4_5 = aie.lock(%logical_core_27)
    %core_4_5 = aie.core(%logical_core_27) {
      %c0 = arith.constant 0 : index
      %c9223372036854775807 = arith.constant 9223372036854775807 : index
      %c1 = arith.constant 1 : index
      scf.for %arg0 = %c0 to %c9223372036854775807 step %c1 {
        %c1_i32 = arith.constant 1 : i32
        aie.use_lock(%lock_4_5, Acquire, %c1_i32)
        %c0_69 = arith.constant 0 : index
        %0 = memref.load %rtp3_4[%c0_69] : memref<2xi32>
        %c1_70 = arith.constant 1 : index
        %1 = memref.load %rtp3_4[%c1_70] : memref<2xi32>
        %c1_i32_71 = arith.constant 1 : i32
        %2 = arith.cmpi sgt, %1, %c1_i32_71 : i32
        %c0_72 = arith.constant 0 : index
        %3 = arith.index_cast %1 : i32 to index
        %c1_73 = arith.constant 1 : index
        scf.for %arg1 = %c0_72 to %3 step %c1_73 {
          %4 = aie.objectfifo.acquire @C_L1L2_4_3(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
          %5 = aie.objectfifo.subview.access %4[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
          func.call @op0_zero_bf16(%5) : (memref<64x64xbf16>) -> ()
          %c0_74 = arith.constant 0 : index
          %6 = arith.index_cast %0 : i32 to index
          %c1_75 = arith.constant 1 : index
          scf.for %arg2 = %c0_74 to %6 step %c1_75 {
            %7 = aie.objectfifo.acquire @A_L2L1_3(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %8 = aie.objectfifo.subview.access %7[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            %9 = aie.objectfifo.acquire @B_L2L1_4(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %10 = aie.objectfifo.subview.access %9[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            func.call @op0_matmul_bf16_bf16(%8, %10, %5) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>) -> ()
            aie.objectfifo.release @A_L2L1_3(Consume, 1)
            aie.objectfifo.release @B_L2L1_4(Consume, 1)
          }
          aie.objectfifo.release @C_L1L2_4_3(Produce, 1)
        }
      }
      aie.end
    } {stack_size = 3328 : i32}
    %lock_5_5 = aie.lock(%logical_core_28)
    %core_5_5 = aie.core(%logical_core_28) {
      %c0 = arith.constant 0 : index
      %c9223372036854775807 = arith.constant 9223372036854775807 : index
      %c1 = arith.constant 1 : index
      scf.for %arg0 = %c0 to %c9223372036854775807 step %c1 {
        %c1_i32 = arith.constant 1 : i32
        aie.use_lock(%lock_5_5, Acquire, %c1_i32)
        %c0_69 = arith.constant 0 : index
        %0 = memref.load %rtp3_5[%c0_69] : memref<2xi32>
        %c1_70 = arith.constant 1 : index
        %1 = memref.load %rtp3_5[%c1_70] : memref<2xi32>
        %c1_i32_71 = arith.constant 1 : i32
        %2 = arith.cmpi sgt, %1, %c1_i32_71 : i32
        %c0_72 = arith.constant 0 : index
        %3 = arith.index_cast %1 : i32 to index
        %c1_73 = arith.constant 1 : index
        scf.for %arg1 = %c0_72 to %3 step %c1_73 {
          %4 = aie.objectfifo.acquire @C_L1L2_5_3(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
          %5 = aie.objectfifo.subview.access %4[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
          func.call @op0_zero_bf16(%5) : (memref<64x64xbf16>) -> ()
          %c0_74 = arith.constant 0 : index
          %6 = arith.index_cast %0 : i32 to index
          %c1_75 = arith.constant 1 : index
          scf.for %arg2 = %c0_74 to %6 step %c1_75 {
            %7 = aie.objectfifo.acquire @A_L2L1_3(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %8 = aie.objectfifo.subview.access %7[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            %9 = aie.objectfifo.acquire @B_L2L1_5(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %10 = aie.objectfifo.subview.access %9[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            func.call @op0_matmul_bf16_bf16(%8, %10, %5) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>) -> ()
            aie.objectfifo.release @A_L2L1_3(Consume, 1)
            aie.objectfifo.release @B_L2L1_5(Consume, 1)
          }
          aie.objectfifo.release @C_L1L2_5_3(Produce, 1)
        }
      }
      aie.end
    } {stack_size = 3328 : i32}
    %lock_6_5 = aie.lock(%logical_core_29)
    %core_6_5 = aie.core(%logical_core_29) {
      %c0 = arith.constant 0 : index
      %c9223372036854775807 = arith.constant 9223372036854775807 : index
      %c1 = arith.constant 1 : index
      scf.for %arg0 = %c0 to %c9223372036854775807 step %c1 {
        %c1_i32 = arith.constant 1 : i32
        aie.use_lock(%lock_6_5, Acquire, %c1_i32)
        %c0_69 = arith.constant 0 : index
        %0 = memref.load %rtp3_6[%c0_69] : memref<2xi32>
        %c1_70 = arith.constant 1 : index
        %1 = memref.load %rtp3_6[%c1_70] : memref<2xi32>
        %c1_i32_71 = arith.constant 1 : i32
        %2 = arith.cmpi sgt, %1, %c1_i32_71 : i32
        %c0_72 = arith.constant 0 : index
        %3 = arith.index_cast %1 : i32 to index
        %c1_73 = arith.constant 1 : index
        scf.for %arg1 = %c0_72 to %3 step %c1_73 {
          %4 = aie.objectfifo.acquire @C_L1L2_6_3(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
          %5 = aie.objectfifo.subview.access %4[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
          func.call @op0_zero_bf16(%5) : (memref<64x64xbf16>) -> ()
          %c0_74 = arith.constant 0 : index
          %6 = arith.index_cast %0 : i32 to index
          %c1_75 = arith.constant 1 : index
          scf.for %arg2 = %c0_74 to %6 step %c1_75 {
            %7 = aie.objectfifo.acquire @A_L2L1_3(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %8 = aie.objectfifo.subview.access %7[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            %9 = aie.objectfifo.acquire @B_L2L1_6(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %10 = aie.objectfifo.subview.access %9[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            func.call @op0_matmul_bf16_bf16(%8, %10, %5) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>) -> ()
            aie.objectfifo.release @A_L2L1_3(Consume, 1)
            aie.objectfifo.release @B_L2L1_6(Consume, 1)
          }
          aie.objectfifo.release @C_L1L2_6_3(Produce, 1)
        }
      }
      aie.end
    } {stack_size = 3328 : i32}
    %lock_7_5 = aie.lock(%logical_core_30)
    %core_7_5 = aie.core(%logical_core_30) {
      %c0 = arith.constant 0 : index
      %c9223372036854775807 = arith.constant 9223372036854775807 : index
      %c1 = arith.constant 1 : index
      scf.for %arg0 = %c0 to %c9223372036854775807 step %c1 {
        %c1_i32 = arith.constant 1 : i32
        aie.use_lock(%lock_7_5, Acquire, %c1_i32)
        %c0_69 = arith.constant 0 : index
        %0 = memref.load %rtp3_7[%c0_69] : memref<2xi32>
        %c1_70 = arith.constant 1 : index
        %1 = memref.load %rtp3_7[%c1_70] : memref<2xi32>
        %c1_i32_71 = arith.constant 1 : i32
        %2 = arith.cmpi sgt, %1, %c1_i32_71 : i32
        %c0_72 = arith.constant 0 : index
        %3 = arith.index_cast %1 : i32 to index
        %c1_73 = arith.constant 1 : index
        scf.for %arg1 = %c0_72 to %3 step %c1_73 {
          %4 = aie.objectfifo.acquire @C_L1L2_7_3(Produce, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
          %5 = aie.objectfifo.subview.access %4[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
          func.call @op0_zero_bf16(%5) : (memref<64x64xbf16>) -> ()
          %c0_74 = arith.constant 0 : index
          %6 = arith.index_cast %0 : i32 to index
          %c1_75 = arith.constant 1 : index
          scf.for %arg2 = %c0_74 to %6 step %c1_75 {
            %7 = aie.objectfifo.acquire @A_L2L1_3(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %8 = aie.objectfifo.subview.access %7[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            %9 = aie.objectfifo.acquire @B_L2L1_7(Consume, 1) : !aie.objectfifosubview<memref<64x64xbf16>>
            %10 = aie.objectfifo.subview.access %9[0] : !aie.objectfifosubview<memref<64x64xbf16>> -> memref<64x64xbf16>
            func.call @op0_matmul_bf16_bf16(%8, %10, %5) : (memref<64x64xbf16>, memref<64x64xbf16>, memref<64x64xbf16>) -> ()
            aie.objectfifo.release @A_L2L1_3(Consume, 1)
            aie.objectfifo.release @B_L2L1_7(Consume, 1)
          }
          aie.objectfifo.release @C_L1L2_7_3(Produce, 1)
        }
      }
      aie.end
    } {stack_size = 3328 : i32}
    aie.runtime_sequence(%arg0: memref<1048576xbf16>, %arg1: memref<1048576xbf16>, %arg2: memref<4194304xbf16>) {
      %c8_i32 = arith.constant 8 : i32
      aiex.npu.rtp_write(@rtp0_0, 0, %c8_i32) : i32
      %c32_i32 = arith.constant 32 : i32
      aiex.npu.rtp_write(@rtp0_0, 1, %c32_i32) : i32
      %c8_i32_69 = arith.constant 8 : i32
      aiex.npu.rtp_write(@rtp0_1, 0, %c8_i32_69) : i32
      %c32_i32_70 = arith.constant 32 : i32
      aiex.npu.rtp_write(@rtp0_1, 1, %c32_i32_70) : i32
      %c8_i32_71 = arith.constant 8 : i32
      aiex.npu.rtp_write(@rtp0_2, 0, %c8_i32_71) : i32
      %c32_i32_72 = arith.constant 32 : i32
      aiex.npu.rtp_write(@rtp0_2, 1, %c32_i32_72) : i32
      %c8_i32_73 = arith.constant 8 : i32
      aiex.npu.rtp_write(@rtp0_3, 0, %c8_i32_73) : i32
      %c32_i32_74 = arith.constant 32 : i32
      aiex.npu.rtp_write(@rtp0_3, 1, %c32_i32_74) : i32
      %c8_i32_75 = arith.constant 8 : i32
      aiex.npu.rtp_write(@rtp0_4, 0, %c8_i32_75) : i32
      %c32_i32_76 = arith.constant 32 : i32
      aiex.npu.rtp_write(@rtp0_4, 1, %c32_i32_76) : i32
      %c8_i32_77 = arith.constant 8 : i32
      aiex.npu.rtp_write(@rtp0_5, 0, %c8_i32_77) : i32
      %c32_i32_78 = arith.constant 32 : i32
      aiex.npu.rtp_write(@rtp0_5, 1, %c32_i32_78) : i32
      %c8_i32_79 = arith.constant 8 : i32
      aiex.npu.rtp_write(@rtp0_6, 0, %c8_i32_79) : i32
      %c32_i32_80 = arith.constant 32 : i32
      aiex.npu.rtp_write(@rtp0_6, 1, %c32_i32_80) : i32
      %c8_i32_81 = arith.constant 8 : i32
      aiex.npu.rtp_write(@rtp0_7, 0, %c8_i32_81) : i32
      %c32_i32_82 = arith.constant 32 : i32
      aiex.npu.rtp_write(@rtp0_7, 1, %c32_i32_82) : i32
      %c8_i32_83 = arith.constant 8 : i32
      aiex.npu.rtp_write(@rtp1_0, 0, %c8_i32_83) : i32
      %c32_i32_84 = arith.constant 32 : i32
      aiex.npu.rtp_write(@rtp1_0, 1, %c32_i32_84) : i32
      %c8_i32_85 = arith.constant 8 : i32
      aiex.npu.rtp_write(@rtp1_1, 0, %c8_i32_85) : i32
      %c32_i32_86 = arith.constant 32 : i32
      aiex.npu.rtp_write(@rtp1_1, 1, %c32_i32_86) : i32
      %c8_i32_87 = arith.constant 8 : i32
      aiex.npu.rtp_write(@rtp1_2, 0, %c8_i32_87) : i32
      %c32_i32_88 = arith.constant 32 : i32
      aiex.npu.rtp_write(@rtp1_2, 1, %c32_i32_88) : i32
      %c8_i32_89 = arith.constant 8 : i32
      aiex.npu.rtp_write(@rtp1_3, 0, %c8_i32_89) : i32
      %c32_i32_90 = arith.constant 32 : i32
      aiex.npu.rtp_write(@rtp1_3, 1, %c32_i32_90) : i32
      %c8_i32_91 = arith.constant 8 : i32
      aiex.npu.rtp_write(@rtp1_4, 0, %c8_i32_91) : i32
      %c32_i32_92 = arith.constant 32 : i32
      aiex.npu.rtp_write(@rtp1_4, 1, %c32_i32_92) : i32
      %c8_i32_93 = arith.constant 8 : i32
      aiex.npu.rtp_write(@rtp1_5, 0, %c8_i32_93) : i32
      %c32_i32_94 = arith.constant 32 : i32
      aiex.npu.rtp_write(@rtp1_5, 1, %c32_i32_94) : i32
      %c8_i32_95 = arith.constant 8 : i32
      aiex.npu.rtp_write(@rtp1_6, 0, %c8_i32_95) : i32
      %c32_i32_96 = arith.constant 32 : i32
      aiex.npu.rtp_write(@rtp1_6, 1, %c32_i32_96) : i32
      %c8_i32_97 = arith.constant 8 : i32
      aiex.npu.rtp_write(@rtp1_7, 0, %c8_i32_97) : i32
      %c32_i32_98 = arith.constant 32 : i32
      aiex.npu.rtp_write(@rtp1_7, 1, %c32_i32_98) : i32
      %c8_i32_99 = arith.constant 8 : i32
      aiex.npu.rtp_write(@rtp2_0, 0, %c8_i32_99) : i32
      %c32_i32_100 = arith.constant 32 : i32
      aiex.npu.rtp_write(@rtp2_0, 1, %c32_i32_100) : i32
      %c8_i32_101 = arith.constant 8 : i32
      aiex.npu.rtp_write(@rtp2_1, 0, %c8_i32_101) : i32
      %c32_i32_102 = arith.constant 32 : i32
      aiex.npu.rtp_write(@rtp2_1, 1, %c32_i32_102) : i32
      %c8_i32_103 = arith.constant 8 : i32
      aiex.npu.rtp_write(@rtp2_2, 0, %c8_i32_103) : i32
      %c32_i32_104 = arith.constant 32 : i32
      aiex.npu.rtp_write(@rtp2_2, 1, %c32_i32_104) : i32
      %c8_i32_105 = arith.constant 8 : i32
      aiex.npu.rtp_write(@rtp2_3, 0, %c8_i32_105) : i32
      %c32_i32_106 = arith.constant 32 : i32
      aiex.npu.rtp_write(@rtp2_3, 1, %c32_i32_106) : i32
      %c8_i32_107 = arith.constant 8 : i32
      aiex.npu.rtp_write(@rtp2_4, 0, %c8_i32_107) : i32
      %c32_i32_108 = arith.constant 32 : i32
      aiex.npu.rtp_write(@rtp2_4, 1, %c32_i32_108) : i32
      %c8_i32_109 = arith.constant 8 : i32
      aiex.npu.rtp_write(@rtp2_5, 0, %c8_i32_109) : i32
      %c32_i32_110 = arith.constant 32 : i32
      aiex.npu.rtp_write(@rtp2_5, 1, %c32_i32_110) : i32
      %c8_i32_111 = arith.constant 8 : i32
      aiex.npu.rtp_write(@rtp2_6, 0, %c8_i32_111) : i32
      %c32_i32_112 = arith.constant 32 : i32
      aiex.npu.rtp_write(@rtp2_6, 1, %c32_i32_112) : i32
      %c8_i32_113 = arith.constant 8 : i32
      aiex.npu.rtp_write(@rtp2_7, 0, %c8_i32_113) : i32
      %c32_i32_114 = arith.constant 32 : i32
      aiex.npu.rtp_write(@rtp2_7, 1, %c32_i32_114) : i32
      %c8_i32_115 = arith.constant 8 : i32
      aiex.npu.rtp_write(@rtp3_0, 0, %c8_i32_115) : i32
      %c32_i32_116 = arith.constant 32 : i32
      aiex.npu.rtp_write(@rtp3_0, 1, %c32_i32_116) : i32
      %c8_i32_117 = arith.constant 8 : i32
      aiex.npu.rtp_write(@rtp3_1, 0, %c8_i32_117) : i32
      %c32_i32_118 = arith.constant 32 : i32
      aiex.npu.rtp_write(@rtp3_1, 1, %c32_i32_118) : i32
      %c8_i32_119 = arith.constant 8 : i32
      aiex.npu.rtp_write(@rtp3_2, 0, %c8_i32_119) : i32
      %c32_i32_120 = arith.constant 32 : i32
      aiex.npu.rtp_write(@rtp3_2, 1, %c32_i32_120) : i32
      %c8_i32_121 = arith.constant 8 : i32
      aiex.npu.rtp_write(@rtp3_3, 0, %c8_i32_121) : i32
      %c32_i32_122 = arith.constant 32 : i32
      aiex.npu.rtp_write(@rtp3_3, 1, %c32_i32_122) : i32
      %c8_i32_123 = arith.constant 8 : i32
      aiex.npu.rtp_write(@rtp3_4, 0, %c8_i32_123) : i32
      %c32_i32_124 = arith.constant 32 : i32
      aiex.npu.rtp_write(@rtp3_4, 1, %c32_i32_124) : i32
      %c8_i32_125 = arith.constant 8 : i32
      aiex.npu.rtp_write(@rtp3_5, 0, %c8_i32_125) : i32
      %c32_i32_126 = arith.constant 32 : i32
      aiex.npu.rtp_write(@rtp3_5, 1, %c32_i32_126) : i32
      %c8_i32_127 = arith.constant 8 : i32
      aiex.npu.rtp_write(@rtp3_6, 0, %c8_i32_127) : i32
      %c32_i32_128 = arith.constant 32 : i32
      aiex.npu.rtp_write(@rtp3_6, 1, %c32_i32_128) : i32
      %c8_i32_129 = arith.constant 8 : i32
      aiex.npu.rtp_write(@rtp3_7, 0, %c8_i32_129) : i32
      %c32_i32_130 = arith.constant 32 : i32
      aiex.npu.rtp_write(@rtp3_7, 1, %c32_i32_130) : i32
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
      aiex.set_lock(%lock_0_5, 1)
      aiex.set_lock(%lock_1_5, 1)
      aiex.set_lock(%lock_2_5, 1)
      aiex.set_lock(%lock_3_5, 1)
      aiex.set_lock(%lock_4_5, 1)
      aiex.set_lock(%lock_5_5, 1)
      aiex.set_lock(%lock_6_5, 1)
      aiex.set_lock(%lock_7_5, 1)
      %0 = aiex.dma_configure_task_for @C_L2L3_0 {
        aie.dma_bd(%arg2 : memref<4194304xbf16> offset = 0 len = 65536 sizes = [2, 4, 256, 64] strides = [524288, 512, 2048, 1])
        aie.end
      } {issue_token = true, repeat_count = 1 : i32}
      aiex.dma_start_task(%0)
      %1 = aiex.dma_configure_task_for @A_L3L2_0 {
        aie.dma_bd(%arg0 : memref<1048576xbf16> offset = 0 len = 32768 sizes = [4, 8, 64, 64] strides = [0, 64, 512, 1])
        aie.end
      } {repeat_count = 3 : i32}
      aiex.dma_start_task(%1)
      %2 = aiex.dma_configure_task_for @B_L3L2_0 {
        aie.dma_bd(%arg1 : memref<1048576xbf16> offset = 0 len = 32768 sizes = [4, 8, 64, 64] strides = [512, 131072, 2048, 1])
        aie.end
      } {repeat_count = 3 : i32}
      aiex.dma_start_task(%2)
      %3 = aiex.dma_configure_task_for @A_L3L2_0 {
        aie.dma_bd(%arg0 : memref<1048576xbf16> offset = 131072 len = 32768 sizes = [4, 8, 64, 64] strides = [0, 64, 512, 1])
        aie.end
      } {repeat_count = 3 : i32}
      aiex.dma_start_task(%3)
      %4 = aiex.dma_configure_task_for @B_L3L2_0 {
        aie.dma_bd(%arg1 : memref<1048576xbf16> offset = 0 len = 32768 sizes = [4, 8, 64, 64] strides = [512, 131072, 2048, 1])
        aie.end
      } {repeat_count = 3 : i32}
      aiex.dma_start_task(%4)
      %5 = aiex.dma_configure_task_for @C_L2L3_1 {
        aie.dma_bd(%arg2 : memref<4194304xbf16> offset = 64 len = 65536 sizes = [2, 4, 256, 64] strides = [524288, 512, 2048, 1])
        aie.end
      } {issue_token = true, repeat_count = 1 : i32}
      aiex.dma_start_task(%5)
      %6 = aiex.dma_configure_task_for @A_L3L2_1 {
        aie.dma_bd(%arg0 : memref<1048576xbf16> offset = 32768 len = 32768 sizes = [4, 8, 64, 64] strides = [0, 64, 512, 1])
        aie.end
      } {repeat_count = 3 : i32}
      aiex.dma_start_task(%6)
      %7 = aiex.dma_configure_task_for @B_L3L2_1 {
        aie.dma_bd(%arg1 : memref<1048576xbf16> offset = 64 len = 32768 sizes = [4, 8, 64, 64] strides = [512, 131072, 2048, 1])
        aie.end
      } {repeat_count = 3 : i32}
      aiex.dma_start_task(%7)
      %8 = aiex.dma_configure_task_for @A_L3L2_1 {
        aie.dma_bd(%arg0 : memref<1048576xbf16> offset = 163840 len = 32768 sizes = [4, 8, 64, 64] strides = [0, 64, 512, 1])
        aie.end
      } {repeat_count = 3 : i32}
      aiex.dma_start_task(%8)
      %9 = aiex.dma_configure_task_for @B_L3L2_1 {
        aie.dma_bd(%arg1 : memref<1048576xbf16> offset = 64 len = 32768 sizes = [4, 8, 64, 64] strides = [512, 131072, 2048, 1])
        aie.end
      } {repeat_count = 3 : i32}
      aiex.dma_start_task(%9)
      %10 = aiex.dma_configure_task_for @C_L2L3_2 {
        aie.dma_bd(%arg2 : memref<4194304xbf16> offset = 128 len = 65536 sizes = [2, 4, 256, 64] strides = [524288, 512, 2048, 1])
        aie.end
      } {issue_token = true, repeat_count = 1 : i32}
      aiex.dma_start_task(%10)
      %11 = aiex.dma_configure_task_for @A_L3L2_2 {
        aie.dma_bd(%arg0 : memref<1048576xbf16> offset = 65536 len = 32768 sizes = [4, 8, 64, 64] strides = [0, 64, 512, 1])
        aie.end
      } {repeat_count = 3 : i32}
      aiex.dma_start_task(%11)
      %12 = aiex.dma_configure_task_for @B_L3L2_2 {
        aie.dma_bd(%arg1 : memref<1048576xbf16> offset = 128 len = 32768 sizes = [4, 8, 64, 64] strides = [512, 131072, 2048, 1])
        aie.end
      } {repeat_count = 3 : i32}
      aiex.dma_start_task(%12)
      %13 = aiex.dma_configure_task_for @A_L3L2_2 {
        aie.dma_bd(%arg0 : memref<1048576xbf16> offset = 196608 len = 32768 sizes = [4, 8, 64, 64] strides = [0, 64, 512, 1])
        aie.end
      } {repeat_count = 3 : i32}
      aiex.dma_start_task(%13)
      %14 = aiex.dma_configure_task_for @B_L3L2_2 {
        aie.dma_bd(%arg1 : memref<1048576xbf16> offset = 128 len = 32768 sizes = [4, 8, 64, 64] strides = [512, 131072, 2048, 1])
        aie.end
      } {repeat_count = 3 : i32}
      aiex.dma_start_task(%14)
      %15 = aiex.dma_configure_task_for @C_L2L3_3 {
        aie.dma_bd(%arg2 : memref<4194304xbf16> offset = 192 len = 65536 sizes = [2, 4, 256, 64] strides = [524288, 512, 2048, 1])
        aie.end
      } {issue_token = true, repeat_count = 1 : i32}
      aiex.dma_start_task(%15)
      %16 = aiex.dma_configure_task_for @A_L3L2_3 {
        aie.dma_bd(%arg0 : memref<1048576xbf16> offset = 98304 len = 32768 sizes = [4, 8, 64, 64] strides = [0, 64, 512, 1])
        aie.end
      } {repeat_count = 3 : i32}
      aiex.dma_start_task(%16)
      %17 = aiex.dma_configure_task_for @B_L3L2_3 {
        aie.dma_bd(%arg1 : memref<1048576xbf16> offset = 192 len = 32768 sizes = [4, 8, 64, 64] strides = [512, 131072, 2048, 1])
        aie.end
      } {repeat_count = 3 : i32}
      aiex.dma_start_task(%17)
      %18 = aiex.dma_configure_task_for @A_L3L2_3 {
        aie.dma_bd(%arg0 : memref<1048576xbf16> offset = 229376 len = 32768 sizes = [4, 8, 64, 64] strides = [0, 64, 512, 1])
        aie.end
      } {repeat_count = 3 : i32}
      aiex.dma_start_task(%18)
      %19 = aiex.dma_configure_task_for @B_L3L2_3 {
        aie.dma_bd(%arg1 : memref<1048576xbf16> offset = 192 len = 32768 sizes = [4, 8, 64, 64] strides = [512, 131072, 2048, 1])
        aie.end
      } {repeat_count = 3 : i32}
      aiex.dma_start_task(%19)
      %20 = aiex.dma_configure_task_for @C_L2L3_4 {
        aie.dma_bd(%arg2 : memref<4194304xbf16> offset = 256 len = 65536 sizes = [2, 4, 256, 64] strides = [524288, 512, 2048, 1])
        aie.end
      } {issue_token = true, repeat_count = 1 : i32}
      aiex.dma_start_task(%20)
      %21 = aiex.dma_configure_task_for @B_L3L2_4 {
        aie.dma_bd(%arg1 : memref<1048576xbf16> offset = 256 len = 32768 sizes = [4, 8, 64, 64] strides = [512, 131072, 2048, 1])
        aie.end
      } {repeat_count = 3 : i32}
      aiex.dma_start_task(%21)
      %22 = aiex.dma_configure_task_for @B_L3L2_4 {
        aie.dma_bd(%arg1 : memref<1048576xbf16> offset = 256 len = 32768 sizes = [4, 8, 64, 64] strides = [512, 131072, 2048, 1])
        aie.end
      } {repeat_count = 3 : i32}
      aiex.dma_start_task(%22)
      %23 = aiex.dma_configure_task_for @C_L2L3_5 {
        aie.dma_bd(%arg2 : memref<4194304xbf16> offset = 320 len = 65536 sizes = [2, 4, 256, 64] strides = [524288, 512, 2048, 1])
        aie.end
      } {issue_token = true, repeat_count = 1 : i32}
      aiex.dma_start_task(%23)
      %24 = aiex.dma_configure_task_for @B_L3L2_5 {
        aie.dma_bd(%arg1 : memref<1048576xbf16> offset = 320 len = 32768 sizes = [4, 8, 64, 64] strides = [512, 131072, 2048, 1])
        aie.end
      } {repeat_count = 3 : i32}
      aiex.dma_start_task(%24)
      %25 = aiex.dma_configure_task_for @B_L3L2_5 {
        aie.dma_bd(%arg1 : memref<1048576xbf16> offset = 320 len = 32768 sizes = [4, 8, 64, 64] strides = [512, 131072, 2048, 1])
        aie.end
      } {repeat_count = 3 : i32}
      aiex.dma_start_task(%25)
      %26 = aiex.dma_configure_task_for @C_L2L3_6 {
        aie.dma_bd(%arg2 : memref<4194304xbf16> offset = 384 len = 65536 sizes = [2, 4, 256, 64] strides = [524288, 512, 2048, 1])
        aie.end
      } {issue_token = true, repeat_count = 1 : i32}
      aiex.dma_start_task(%26)
      %27 = aiex.dma_configure_task_for @B_L3L2_6 {
        aie.dma_bd(%arg1 : memref<1048576xbf16> offset = 384 len = 32768 sizes = [4, 8, 64, 64] strides = [512, 131072, 2048, 1])
        aie.end
      } {repeat_count = 3 : i32}
      aiex.dma_start_task(%27)
      %28 = aiex.dma_configure_task_for @B_L3L2_6 {
        aie.dma_bd(%arg1 : memref<1048576xbf16> offset = 384 len = 32768 sizes = [4, 8, 64, 64] strides = [512, 131072, 2048, 1])
        aie.end
      } {repeat_count = 3 : i32}
      aiex.dma_start_task(%28)
      %29 = aiex.dma_configure_task_for @C_L2L3_7 {
        aie.dma_bd(%arg2 : memref<4194304xbf16> offset = 448 len = 65536 sizes = [2, 4, 256, 64] strides = [524288, 512, 2048, 1])
        aie.end
      } {issue_token = true, repeat_count = 1 : i32}
      aiex.dma_start_task(%29)
      %30 = aiex.dma_configure_task_for @B_L3L2_7 {
        aie.dma_bd(%arg1 : memref<1048576xbf16> offset = 448 len = 32768 sizes = [4, 8, 64, 64] strides = [512, 131072, 2048, 1])
        aie.end
      } {repeat_count = 3 : i32}
      aiex.dma_start_task(%30)
      %31 = aiex.dma_configure_task_for @B_L3L2_7 {
        aie.dma_bd(%arg1 : memref<1048576xbf16> offset = 448 len = 32768 sizes = [4, 8, 64, 64] strides = [512, 131072, 2048, 1])
        aie.end
      } {repeat_count = 3 : i32}
      aiex.dma_start_task(%31)
      %32 = aiex.dma_configure_task_for @C_L2L3_0 {
        aie.dma_bd(%arg2 : memref<4194304xbf16> offset = 1048576 len = 65536 sizes = [2, 4, 256, 64] strides = [524288, 512, 2048, 1])
        aie.end
      } {issue_token = true, repeat_count = 1 : i32}
      aiex.dma_start_task(%32)
      %33 = aiex.dma_configure_task_for @A_L3L2_0 {
        aie.dma_bd(%arg0 : memref<1048576xbf16> offset = 262144 len = 32768 sizes = [4, 8, 64, 64] strides = [0, 64, 512, 1])
        aie.end
      } {repeat_count = 3 : i32}
      aiex.dma_start_task(%33)
      %34 = aiex.dma_configure_task_for @B_L3L2_0 {
        aie.dma_bd(%arg1 : memref<1048576xbf16> offset = 0 len = 32768 sizes = [4, 8, 64, 64] strides = [512, 131072, 2048, 1])
        aie.end
      } {repeat_count = 3 : i32}
      aiex.dma_start_task(%34)
      %35 = aiex.dma_configure_task_for @A_L3L2_0 {
        aie.dma_bd(%arg0 : memref<1048576xbf16> offset = 393216 len = 32768 sizes = [4, 8, 64, 64] strides = [0, 64, 512, 1])
        aie.end
      } {repeat_count = 3 : i32}
      aiex.dma_start_task(%35)
      %36 = aiex.dma_configure_task_for @B_L3L2_0 {
        aie.dma_bd(%arg1 : memref<1048576xbf16> offset = 0 len = 32768 sizes = [4, 8, 64, 64] strides = [512, 131072, 2048, 1])
        aie.end
      } {repeat_count = 3 : i32}
      aiex.dma_start_task(%36)
      %37 = aiex.dma_configure_task_for @C_L2L3_1 {
        aie.dma_bd(%arg2 : memref<4194304xbf16> offset = 1048640 len = 65536 sizes = [2, 4, 256, 64] strides = [524288, 512, 2048, 1])
        aie.end
      } {issue_token = true, repeat_count = 1 : i32}
      aiex.dma_start_task(%37)
      %38 = aiex.dma_configure_task_for @A_L3L2_1 {
        aie.dma_bd(%arg0 : memref<1048576xbf16> offset = 294912 len = 32768 sizes = [4, 8, 64, 64] strides = [0, 64, 512, 1])
        aie.end
      } {repeat_count = 3 : i32}
      aiex.dma_start_task(%38)
      %39 = aiex.dma_configure_task_for @B_L3L2_1 {
        aie.dma_bd(%arg1 : memref<1048576xbf16> offset = 64 len = 32768 sizes = [4, 8, 64, 64] strides = [512, 131072, 2048, 1])
        aie.end
      } {repeat_count = 3 : i32}
      aiex.dma_start_task(%39)
      %40 = aiex.dma_configure_task_for @A_L3L2_1 {
        aie.dma_bd(%arg0 : memref<1048576xbf16> offset = 425984 len = 32768 sizes = [4, 8, 64, 64] strides = [0, 64, 512, 1])
        aie.end
      } {repeat_count = 3 : i32}
      aiex.dma_start_task(%40)
      %41 = aiex.dma_configure_task_for @B_L3L2_1 {
        aie.dma_bd(%arg1 : memref<1048576xbf16> offset = 64 len = 32768 sizes = [4, 8, 64, 64] strides = [512, 131072, 2048, 1])
        aie.end
      } {repeat_count = 3 : i32}
      aiex.dma_start_task(%41)
      %42 = aiex.dma_configure_task_for @C_L2L3_2 {
        aie.dma_bd(%arg2 : memref<4194304xbf16> offset = 1048704 len = 65536 sizes = [2, 4, 256, 64] strides = [524288, 512, 2048, 1])
        aie.end
      } {issue_token = true, repeat_count = 1 : i32}
      aiex.dma_start_task(%42)
      %43 = aiex.dma_configure_task_for @A_L3L2_2 {
        aie.dma_bd(%arg0 : memref<1048576xbf16> offset = 327680 len = 32768 sizes = [4, 8, 64, 64] strides = [0, 64, 512, 1])
        aie.end
      } {repeat_count = 3 : i32}
      aiex.dma_start_task(%43)
      %44 = aiex.dma_configure_task_for @B_L3L2_2 {
        aie.dma_bd(%arg1 : memref<1048576xbf16> offset = 128 len = 32768 sizes = [4, 8, 64, 64] strides = [512, 131072, 2048, 1])
        aie.end
      } {repeat_count = 3 : i32}
      aiex.dma_start_task(%44)
      %45 = aiex.dma_configure_task_for @A_L3L2_2 {
        aie.dma_bd(%arg0 : memref<1048576xbf16> offset = 458752 len = 32768 sizes = [4, 8, 64, 64] strides = [0, 64, 512, 1])
        aie.end
      } {repeat_count = 3 : i32}
      aiex.dma_start_task(%45)
      %46 = aiex.dma_configure_task_for @B_L3L2_2 {
        aie.dma_bd(%arg1 : memref<1048576xbf16> offset = 128 len = 32768 sizes = [4, 8, 64, 64] strides = [512, 131072, 2048, 1])
        aie.end
      } {repeat_count = 3 : i32}
      aiex.dma_start_task(%46)
      %47 = aiex.dma_configure_task_for @C_L2L3_3 {
        aie.dma_bd(%arg2 : memref<4194304xbf16> offset = 1048768 len = 65536 sizes = [2, 4, 256, 64] strides = [524288, 512, 2048, 1])
        aie.end
      } {issue_token = true, repeat_count = 1 : i32}
      aiex.dma_start_task(%47)
      %48 = aiex.dma_configure_task_for @A_L3L2_3 {
        aie.dma_bd(%arg0 : memref<1048576xbf16> offset = 360448 len = 32768 sizes = [4, 8, 64, 64] strides = [0, 64, 512, 1])
        aie.end
      } {repeat_count = 3 : i32}
      aiex.dma_start_task(%48)
      %49 = aiex.dma_configure_task_for @B_L3L2_3 {
        aie.dma_bd(%arg1 : memref<1048576xbf16> offset = 192 len = 32768 sizes = [4, 8, 64, 64] strides = [512, 131072, 2048, 1])
        aie.end
      } {repeat_count = 3 : i32}
      aiex.dma_start_task(%49)
      %50 = aiex.dma_configure_task_for @A_L3L2_3 {
        aie.dma_bd(%arg0 : memref<1048576xbf16> offset = 491520 len = 32768 sizes = [4, 8, 64, 64] strides = [0, 64, 512, 1])
        aie.end
      } {repeat_count = 3 : i32}
      aiex.dma_start_task(%50)
      %51 = aiex.dma_configure_task_for @B_L3L2_3 {
        aie.dma_bd(%arg1 : memref<1048576xbf16> offset = 192 len = 32768 sizes = [4, 8, 64, 64] strides = [512, 131072, 2048, 1])
        aie.end
      } {repeat_count = 3 : i32}
      aiex.dma_start_task(%51)
      %52 = aiex.dma_configure_task_for @C_L2L3_4 {
        aie.dma_bd(%arg2 : memref<4194304xbf16> offset = 1048832 len = 65536 sizes = [2, 4, 256, 64] strides = [524288, 512, 2048, 1])
        aie.end
      } {issue_token = true, repeat_count = 1 : i32}
      aiex.dma_start_task(%52)
      %53 = aiex.dma_configure_task_for @B_L3L2_4 {
        aie.dma_bd(%arg1 : memref<1048576xbf16> offset = 256 len = 32768 sizes = [4, 8, 64, 64] strides = [512, 131072, 2048, 1])
        aie.end
      } {repeat_count = 3 : i32}
      aiex.dma_start_task(%53)
      %54 = aiex.dma_configure_task_for @B_L3L2_4 {
        aie.dma_bd(%arg1 : memref<1048576xbf16> offset = 256 len = 32768 sizes = [4, 8, 64, 64] strides = [512, 131072, 2048, 1])
        aie.end
      } {repeat_count = 3 : i32}
      aiex.dma_start_task(%54)
      %55 = aiex.dma_configure_task_for @C_L2L3_5 {
        aie.dma_bd(%arg2 : memref<4194304xbf16> offset = 1048896 len = 65536 sizes = [2, 4, 256, 64] strides = [524288, 512, 2048, 1])
        aie.end
      } {issue_token = true, repeat_count = 1 : i32}
      aiex.dma_start_task(%55)
      %56 = aiex.dma_configure_task_for @B_L3L2_5 {
        aie.dma_bd(%arg1 : memref<1048576xbf16> offset = 320 len = 32768 sizes = [4, 8, 64, 64] strides = [512, 131072, 2048, 1])
        aie.end
      } {repeat_count = 3 : i32}
      aiex.dma_start_task(%56)
      %57 = aiex.dma_configure_task_for @B_L3L2_5 {
        aie.dma_bd(%arg1 : memref<1048576xbf16> offset = 320 len = 32768 sizes = [4, 8, 64, 64] strides = [512, 131072, 2048, 1])
        aie.end
      } {repeat_count = 3 : i32}
      aiex.dma_start_task(%57)
      %58 = aiex.dma_configure_task_for @C_L2L3_6 {
        aie.dma_bd(%arg2 : memref<4194304xbf16> offset = 1048960 len = 65536 sizes = [2, 4, 256, 64] strides = [524288, 512, 2048, 1])
        aie.end
      } {issue_token = true, repeat_count = 1 : i32}
      aiex.dma_start_task(%58)
      %59 = aiex.dma_configure_task_for @B_L3L2_6 {
        aie.dma_bd(%arg1 : memref<1048576xbf16> offset = 384 len = 32768 sizes = [4, 8, 64, 64] strides = [512, 131072, 2048, 1])
        aie.end
      } {repeat_count = 3 : i32}
      aiex.dma_start_task(%59)
      %60 = aiex.dma_configure_task_for @B_L3L2_6 {
        aie.dma_bd(%arg1 : memref<1048576xbf16> offset = 384 len = 32768 sizes = [4, 8, 64, 64] strides = [512, 131072, 2048, 1])
        aie.end
      } {repeat_count = 3 : i32}
      aiex.dma_start_task(%60)
      %61 = aiex.dma_configure_task_for @C_L2L3_7 {
        aie.dma_bd(%arg2 : memref<4194304xbf16> offset = 1049024 len = 65536 sizes = [2, 4, 256, 64] strides = [524288, 512, 2048, 1])
        aie.end
      } {issue_token = true, repeat_count = 1 : i32}
      aiex.dma_start_task(%61)
      %62 = aiex.dma_configure_task_for @B_L3L2_7 {
        aie.dma_bd(%arg1 : memref<1048576xbf16> offset = 448 len = 32768 sizes = [4, 8, 64, 64] strides = [512, 131072, 2048, 1])
        aie.end
      } {repeat_count = 3 : i32}
      aiex.dma_start_task(%62)
      %63 = aiex.dma_configure_task_for @B_L3L2_7 {
        aie.dma_bd(%arg1 : memref<1048576xbf16> offset = 448 len = 32768 sizes = [4, 8, 64, 64] strides = [512, 131072, 2048, 1])
        aie.end
      } {repeat_count = 3 : i32}
      aiex.dma_start_task(%63)
      aiex.dma_await_task(%0)
      aiex.dma_await_task(%5)
      aiex.dma_await_task(%10)
      aiex.dma_await_task(%15)
      aiex.dma_await_task(%20)
      aiex.dma_await_task(%23)
      aiex.dma_await_task(%26)
      aiex.dma_await_task(%29)
      aiex.dma_await_task(%32)
      aiex.dma_await_task(%37)
      aiex.dma_await_task(%42)
      aiex.dma_await_task(%47)
      aiex.dma_await_task(%52)
      aiex.dma_await_task(%55)
      aiex.dma_await_task(%58)
      aiex.dma_await_task(%61)
      aiex.dma_free_task(%0)
      aiex.dma_free_task(%1)
      aiex.dma_free_task(%2)
      aiex.dma_free_task(%3)
      aiex.dma_free_task(%4)
      aiex.dma_free_task(%5)
      aiex.dma_free_task(%6)
      aiex.dma_free_task(%7)
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
      aiex.dma_free_task(%24)
      aiex.dma_free_task(%25)
      aiex.dma_free_task(%26)
      aiex.dma_free_task(%27)
      aiex.dma_free_task(%28)
      aiex.dma_free_task(%29)
      aiex.dma_free_task(%30)
      aiex.dma_free_task(%31)
      aiex.dma_free_task(%32)
      aiex.dma_free_task(%33)
      aiex.dma_free_task(%34)
      aiex.dma_free_task(%35)
      aiex.dma_free_task(%36)
      aiex.dma_free_task(%37)
      aiex.dma_free_task(%38)
      aiex.dma_free_task(%39)
      aiex.dma_free_task(%40)
      aiex.dma_free_task(%41)
      aiex.dma_free_task(%42)
      aiex.dma_free_task(%43)
      aiex.dma_free_task(%44)
      aiex.dma_free_task(%45)
      aiex.dma_free_task(%46)
      aiex.dma_free_task(%47)
      aiex.dma_free_task(%48)
      aiex.dma_free_task(%49)
      aiex.dma_free_task(%50)
      aiex.dma_free_task(%51)
      aiex.dma_free_task(%52)
      aiex.dma_free_task(%53)
      aiex.dma_free_task(%54)
      aiex.dma_free_task(%55)
      aiex.dma_free_task(%56)
      aiex.dma_free_task(%57)
      aiex.dma_free_task(%58)
      aiex.dma_free_task(%59)
      aiex.dma_free_task(%60)
      aiex.dma_free_task(%61)
      aiex.dma_free_task(%62)
      aiex.dma_free_task(%63)
      %64 = aiex.dma_configure_task_for @C_L2L3_0 {
        aie.dma_bd(%arg2 : memref<4194304xbf16> offset = 2097152 len = 65536 sizes = [2, 4, 256, 64] strides = [524288, 512, 2048, 1])
        aie.end
      } {issue_token = true, repeat_count = 1 : i32}
      aiex.dma_start_task(%64)
      %65 = aiex.dma_configure_task_for @A_L3L2_0 {
        aie.dma_bd(%arg0 : memref<1048576xbf16> offset = 524288 len = 32768 sizes = [4, 8, 64, 64] strides = [0, 64, 512, 1])
        aie.end
      } {repeat_count = 3 : i32}
      aiex.dma_start_task(%65)
      %66 = aiex.dma_configure_task_for @B_L3L2_0 {
        aie.dma_bd(%arg1 : memref<1048576xbf16> offset = 0 len = 32768 sizes = [4, 8, 64, 64] strides = [512, 131072, 2048, 1])
        aie.end
      } {repeat_count = 3 : i32}
      aiex.dma_start_task(%66)
      %67 = aiex.dma_configure_task_for @A_L3L2_0 {
        aie.dma_bd(%arg0 : memref<1048576xbf16> offset = 655360 len = 32768 sizes = [4, 8, 64, 64] strides = [0, 64, 512, 1])
        aie.end
      } {repeat_count = 3 : i32}
      aiex.dma_start_task(%67)
      %68 = aiex.dma_configure_task_for @B_L3L2_0 {
        aie.dma_bd(%arg1 : memref<1048576xbf16> offset = 0 len = 32768 sizes = [4, 8, 64, 64] strides = [512, 131072, 2048, 1])
        aie.end
      } {repeat_count = 3 : i32}
      aiex.dma_start_task(%68)
      %69 = aiex.dma_configure_task_for @C_L2L3_1 {
        aie.dma_bd(%arg2 : memref<4194304xbf16> offset = 2097216 len = 65536 sizes = [2, 4, 256, 64] strides = [524288, 512, 2048, 1])
        aie.end
      } {issue_token = true, repeat_count = 1 : i32}
      aiex.dma_start_task(%69)
      %70 = aiex.dma_configure_task_for @A_L3L2_1 {
        aie.dma_bd(%arg0 : memref<1048576xbf16> offset = 557056 len = 32768 sizes = [4, 8, 64, 64] strides = [0, 64, 512, 1])
        aie.end
      } {repeat_count = 3 : i32}
      aiex.dma_start_task(%70)
      %71 = aiex.dma_configure_task_for @B_L3L2_1 {
        aie.dma_bd(%arg1 : memref<1048576xbf16> offset = 64 len = 32768 sizes = [4, 8, 64, 64] strides = [512, 131072, 2048, 1])
        aie.end
      } {repeat_count = 3 : i32}
      aiex.dma_start_task(%71)
      %72 = aiex.dma_configure_task_for @A_L3L2_1 {
        aie.dma_bd(%arg0 : memref<1048576xbf16> offset = 688128 len = 32768 sizes = [4, 8, 64, 64] strides = [0, 64, 512, 1])
        aie.end
      } {repeat_count = 3 : i32}
      aiex.dma_start_task(%72)
      %73 = aiex.dma_configure_task_for @B_L3L2_1 {
        aie.dma_bd(%arg1 : memref<1048576xbf16> offset = 64 len = 32768 sizes = [4, 8, 64, 64] strides = [512, 131072, 2048, 1])
        aie.end
      } {repeat_count = 3 : i32}
      aiex.dma_start_task(%73)
      %74 = aiex.dma_configure_task_for @C_L2L3_2 {
        aie.dma_bd(%arg2 : memref<4194304xbf16> offset = 2097280 len = 65536 sizes = [2, 4, 256, 64] strides = [524288, 512, 2048, 1])
        aie.end
      } {issue_token = true, repeat_count = 1 : i32}
      aiex.dma_start_task(%74)
      %75 = aiex.dma_configure_task_for @A_L3L2_2 {
        aie.dma_bd(%arg0 : memref<1048576xbf16> offset = 589824 len = 32768 sizes = [4, 8, 64, 64] strides = [0, 64, 512, 1])
        aie.end
      } {repeat_count = 3 : i32}
      aiex.dma_start_task(%75)
      %76 = aiex.dma_configure_task_for @B_L3L2_2 {
        aie.dma_bd(%arg1 : memref<1048576xbf16> offset = 128 len = 32768 sizes = [4, 8, 64, 64] strides = [512, 131072, 2048, 1])
        aie.end
      } {repeat_count = 3 : i32}
      aiex.dma_start_task(%76)
      %77 = aiex.dma_configure_task_for @A_L3L2_2 {
        aie.dma_bd(%arg0 : memref<1048576xbf16> offset = 720896 len = 32768 sizes = [4, 8, 64, 64] strides = [0, 64, 512, 1])
        aie.end
      } {repeat_count = 3 : i32}
      aiex.dma_start_task(%77)
      %78 = aiex.dma_configure_task_for @B_L3L2_2 {
        aie.dma_bd(%arg1 : memref<1048576xbf16> offset = 128 len = 32768 sizes = [4, 8, 64, 64] strides = [512, 131072, 2048, 1])
        aie.end
      } {repeat_count = 3 : i32}
      aiex.dma_start_task(%78)
      %79 = aiex.dma_configure_task_for @C_L2L3_3 {
        aie.dma_bd(%arg2 : memref<4194304xbf16> offset = 2097344 len = 65536 sizes = [2, 4, 256, 64] strides = [524288, 512, 2048, 1])
        aie.end
      } {issue_token = true, repeat_count = 1 : i32}
      aiex.dma_start_task(%79)
      %80 = aiex.dma_configure_task_for @A_L3L2_3 {
        aie.dma_bd(%arg0 : memref<1048576xbf16> offset = 622592 len = 32768 sizes = [4, 8, 64, 64] strides = [0, 64, 512, 1])
        aie.end
      } {repeat_count = 3 : i32}
      aiex.dma_start_task(%80)
      %81 = aiex.dma_configure_task_for @B_L3L2_3 {
        aie.dma_bd(%arg1 : memref<1048576xbf16> offset = 192 len = 32768 sizes = [4, 8, 64, 64] strides = [512, 131072, 2048, 1])
        aie.end
      } {repeat_count = 3 : i32}
      aiex.dma_start_task(%81)
      %82 = aiex.dma_configure_task_for @A_L3L2_3 {
        aie.dma_bd(%arg0 : memref<1048576xbf16> offset = 753664 len = 32768 sizes = [4, 8, 64, 64] strides = [0, 64, 512, 1])
        aie.end
      } {repeat_count = 3 : i32}
      aiex.dma_start_task(%82)
      %83 = aiex.dma_configure_task_for @B_L3L2_3 {
        aie.dma_bd(%arg1 : memref<1048576xbf16> offset = 192 len = 32768 sizes = [4, 8, 64, 64] strides = [512, 131072, 2048, 1])
        aie.end
      } {repeat_count = 3 : i32}
      aiex.dma_start_task(%83)
      %84 = aiex.dma_configure_task_for @C_L2L3_4 {
        aie.dma_bd(%arg2 : memref<4194304xbf16> offset = 2097408 len = 65536 sizes = [2, 4, 256, 64] strides = [524288, 512, 2048, 1])
        aie.end
      } {issue_token = true, repeat_count = 1 : i32}
      aiex.dma_start_task(%84)
      %85 = aiex.dma_configure_task_for @B_L3L2_4 {
        aie.dma_bd(%arg1 : memref<1048576xbf16> offset = 256 len = 32768 sizes = [4, 8, 64, 64] strides = [512, 131072, 2048, 1])
        aie.end
      } {repeat_count = 3 : i32}
      aiex.dma_start_task(%85)
      %86 = aiex.dma_configure_task_for @B_L3L2_4 {
        aie.dma_bd(%arg1 : memref<1048576xbf16> offset = 256 len = 32768 sizes = [4, 8, 64, 64] strides = [512, 131072, 2048, 1])
        aie.end
      } {repeat_count = 3 : i32}
      aiex.dma_start_task(%86)
      %87 = aiex.dma_configure_task_for @C_L2L3_5 {
        aie.dma_bd(%arg2 : memref<4194304xbf16> offset = 2097472 len = 65536 sizes = [2, 4, 256, 64] strides = [524288, 512, 2048, 1])
        aie.end
      } {issue_token = true, repeat_count = 1 : i32}
      aiex.dma_start_task(%87)
      %88 = aiex.dma_configure_task_for @B_L3L2_5 {
        aie.dma_bd(%arg1 : memref<1048576xbf16> offset = 320 len = 32768 sizes = [4, 8, 64, 64] strides = [512, 131072, 2048, 1])
        aie.end
      } {repeat_count = 3 : i32}
      aiex.dma_start_task(%88)
      %89 = aiex.dma_configure_task_for @B_L3L2_5 {
        aie.dma_bd(%arg1 : memref<1048576xbf16> offset = 320 len = 32768 sizes = [4, 8, 64, 64] strides = [512, 131072, 2048, 1])
        aie.end
      } {repeat_count = 3 : i32}
      aiex.dma_start_task(%89)
      %90 = aiex.dma_configure_task_for @C_L2L3_6 {
        aie.dma_bd(%arg2 : memref<4194304xbf16> offset = 2097536 len = 65536 sizes = [2, 4, 256, 64] strides = [524288, 512, 2048, 1])
        aie.end
      } {issue_token = true, repeat_count = 1 : i32}
      aiex.dma_start_task(%90)
      %91 = aiex.dma_configure_task_for @B_L3L2_6 {
        aie.dma_bd(%arg1 : memref<1048576xbf16> offset = 384 len = 32768 sizes = [4, 8, 64, 64] strides = [512, 131072, 2048, 1])
        aie.end
      } {repeat_count = 3 : i32}
      aiex.dma_start_task(%91)
      %92 = aiex.dma_configure_task_for @B_L3L2_6 {
        aie.dma_bd(%arg1 : memref<1048576xbf16> offset = 384 len = 32768 sizes = [4, 8, 64, 64] strides = [512, 131072, 2048, 1])
        aie.end
      } {repeat_count = 3 : i32}
      aiex.dma_start_task(%92)
      %93 = aiex.dma_configure_task_for @C_L2L3_7 {
        aie.dma_bd(%arg2 : memref<4194304xbf16> offset = 2097600 len = 65536 sizes = [2, 4, 256, 64] strides = [524288, 512, 2048, 1])
        aie.end
      } {issue_token = true, repeat_count = 1 : i32}
      aiex.dma_start_task(%93)
      %94 = aiex.dma_configure_task_for @B_L3L2_7 {
        aie.dma_bd(%arg1 : memref<1048576xbf16> offset = 448 len = 32768 sizes = [4, 8, 64, 64] strides = [512, 131072, 2048, 1])
        aie.end
      } {repeat_count = 3 : i32}
      aiex.dma_start_task(%94)
      %95 = aiex.dma_configure_task_for @B_L3L2_7 {
        aie.dma_bd(%arg1 : memref<1048576xbf16> offset = 448 len = 32768 sizes = [4, 8, 64, 64] strides = [512, 131072, 2048, 1])
        aie.end
      } {repeat_count = 3 : i32}
      aiex.dma_start_task(%95)
      aiex.dma_await_task(%64)
      aiex.dma_await_task(%69)
      aiex.dma_await_task(%74)
      aiex.dma_await_task(%79)
      aiex.dma_await_task(%84)
      aiex.dma_await_task(%87)
      aiex.dma_await_task(%90)
      aiex.dma_await_task(%93)
      aiex.dma_free_task(%64)
      aiex.dma_free_task(%65)
      aiex.dma_free_task(%66)
      aiex.dma_free_task(%67)
      aiex.dma_free_task(%68)
      aiex.dma_free_task(%69)
      aiex.dma_free_task(%70)
      aiex.dma_free_task(%71)
      aiex.dma_free_task(%72)
      aiex.dma_free_task(%73)
      aiex.dma_free_task(%74)
      aiex.dma_free_task(%75)
      aiex.dma_free_task(%76)
      aiex.dma_free_task(%77)
      aiex.dma_free_task(%78)
      aiex.dma_free_task(%79)
      aiex.dma_free_task(%80)
      aiex.dma_free_task(%81)
      aiex.dma_free_task(%82)
      aiex.dma_free_task(%83)
      aiex.dma_free_task(%84)
      aiex.dma_free_task(%85)
      aiex.dma_free_task(%86)
      aiex.dma_free_task(%87)
      aiex.dma_free_task(%88)
      aiex.dma_free_task(%89)
      aiex.dma_free_task(%90)
      aiex.dma_free_task(%91)
      aiex.dma_free_task(%92)
      aiex.dma_free_task(%93)
      aiex.dma_free_task(%94)
      aiex.dma_free_task(%95)
      %96 = aiex.dma_configure_task_for @C_L2L3_0 {
        aie.dma_bd(%arg2 : memref<4194304xbf16> offset = 3145728 len = 65536 sizes = [2, 4, 256, 64] strides = [524288, 512, 2048, 1])
        aie.end
      } {issue_token = true, repeat_count = 1 : i32}
      aiex.dma_start_task(%96)
      %97 = aiex.dma_configure_task_for @A_L3L2_0 {
        aie.dma_bd(%arg0 : memref<1048576xbf16> offset = 786432 len = 32768 sizes = [4, 8, 64, 64] strides = [0, 64, 512, 1])
        aie.end
      } {repeat_count = 3 : i32}
      aiex.dma_start_task(%97)
      %98 = aiex.dma_configure_task_for @B_L3L2_0 {
        aie.dma_bd(%arg1 : memref<1048576xbf16> offset = 0 len = 32768 sizes = [4, 8, 64, 64] strides = [512, 131072, 2048, 1])
        aie.end
      } {repeat_count = 3 : i32}
      aiex.dma_start_task(%98)
      %99 = aiex.dma_configure_task_for @A_L3L2_0 {
        aie.dma_bd(%arg0 : memref<1048576xbf16> offset = 917504 len = 32768 sizes = [4, 8, 64, 64] strides = [0, 64, 512, 1])
        aie.end
      } {repeat_count = 3 : i32}
      aiex.dma_start_task(%99)
      %100 = aiex.dma_configure_task_for @B_L3L2_0 {
        aie.dma_bd(%arg1 : memref<1048576xbf16> offset = 0 len = 32768 sizes = [4, 8, 64, 64] strides = [512, 131072, 2048, 1])
        aie.end
      } {repeat_count = 3 : i32}
      aiex.dma_start_task(%100)
      %101 = aiex.dma_configure_task_for @C_L2L3_1 {
        aie.dma_bd(%arg2 : memref<4194304xbf16> offset = 3145792 len = 65536 sizes = [2, 4, 256, 64] strides = [524288, 512, 2048, 1])
        aie.end
      } {issue_token = true, repeat_count = 1 : i32}
      aiex.dma_start_task(%101)
      %102 = aiex.dma_configure_task_for @A_L3L2_1 {
        aie.dma_bd(%arg0 : memref<1048576xbf16> offset = 819200 len = 32768 sizes = [4, 8, 64, 64] strides = [0, 64, 512, 1])
        aie.end
      } {repeat_count = 3 : i32}
      aiex.dma_start_task(%102)
      %103 = aiex.dma_configure_task_for @B_L3L2_1 {
        aie.dma_bd(%arg1 : memref<1048576xbf16> offset = 64 len = 32768 sizes = [4, 8, 64, 64] strides = [512, 131072, 2048, 1])
        aie.end
      } {repeat_count = 3 : i32}
      aiex.dma_start_task(%103)
      %104 = aiex.dma_configure_task_for @A_L3L2_1 {
        aie.dma_bd(%arg0 : memref<1048576xbf16> offset = 950272 len = 32768 sizes = [4, 8, 64, 64] strides = [0, 64, 512, 1])
        aie.end
      } {repeat_count = 3 : i32}
      aiex.dma_start_task(%104)
      %105 = aiex.dma_configure_task_for @B_L3L2_1 {
        aie.dma_bd(%arg1 : memref<1048576xbf16> offset = 64 len = 32768 sizes = [4, 8, 64, 64] strides = [512, 131072, 2048, 1])
        aie.end
      } {repeat_count = 3 : i32}
      aiex.dma_start_task(%105)
      %106 = aiex.dma_configure_task_for @C_L2L3_2 {
        aie.dma_bd(%arg2 : memref<4194304xbf16> offset = 3145856 len = 65536 sizes = [2, 4, 256, 64] strides = [524288, 512, 2048, 1])
        aie.end
      } {issue_token = true, repeat_count = 1 : i32}
      aiex.dma_start_task(%106)
      %107 = aiex.dma_configure_task_for @A_L3L2_2 {
        aie.dma_bd(%arg0 : memref<1048576xbf16> offset = 851968 len = 32768 sizes = [4, 8, 64, 64] strides = [0, 64, 512, 1])
        aie.end
      } {repeat_count = 3 : i32}
      aiex.dma_start_task(%107)
      %108 = aiex.dma_configure_task_for @B_L3L2_2 {
        aie.dma_bd(%arg1 : memref<1048576xbf16> offset = 128 len = 32768 sizes = [4, 8, 64, 64] strides = [512, 131072, 2048, 1])
        aie.end
      } {repeat_count = 3 : i32}
      aiex.dma_start_task(%108)
      %109 = aiex.dma_configure_task_for @A_L3L2_2 {
        aie.dma_bd(%arg0 : memref<1048576xbf16> offset = 983040 len = 32768 sizes = [4, 8, 64, 64] strides = [0, 64, 512, 1])
        aie.end
      } {repeat_count = 3 : i32}
      aiex.dma_start_task(%109)
      %110 = aiex.dma_configure_task_for @B_L3L2_2 {
        aie.dma_bd(%arg1 : memref<1048576xbf16> offset = 128 len = 32768 sizes = [4, 8, 64, 64] strides = [512, 131072, 2048, 1])
        aie.end
      } {repeat_count = 3 : i32}
      aiex.dma_start_task(%110)
      %111 = aiex.dma_configure_task_for @C_L2L3_3 {
        aie.dma_bd(%arg2 : memref<4194304xbf16> offset = 3145920 len = 65536 sizes = [2, 4, 256, 64] strides = [524288, 512, 2048, 1])
        aie.end
      } {issue_token = true, repeat_count = 1 : i32}
      aiex.dma_start_task(%111)
      %112 = aiex.dma_configure_task_for @A_L3L2_3 {
        aie.dma_bd(%arg0 : memref<1048576xbf16> offset = 884736 len = 32768 sizes = [4, 8, 64, 64] strides = [0, 64, 512, 1])
        aie.end
      } {repeat_count = 3 : i32}
      aiex.dma_start_task(%112)
      %113 = aiex.dma_configure_task_for @B_L3L2_3 {
        aie.dma_bd(%arg1 : memref<1048576xbf16> offset = 192 len = 32768 sizes = [4, 8, 64, 64] strides = [512, 131072, 2048, 1])
        aie.end
      } {repeat_count = 3 : i32}
      aiex.dma_start_task(%113)
      %114 = aiex.dma_configure_task_for @A_L3L2_3 {
        aie.dma_bd(%arg0 : memref<1048576xbf16> offset = 1015808 len = 32768 sizes = [4, 8, 64, 64] strides = [0, 64, 512, 1])
        aie.end
      } {repeat_count = 3 : i32}
      aiex.dma_start_task(%114)
      %115 = aiex.dma_configure_task_for @B_L3L2_3 {
        aie.dma_bd(%arg1 : memref<1048576xbf16> offset = 192 len = 32768 sizes = [4, 8, 64, 64] strides = [512, 131072, 2048, 1])
        aie.end
      } {repeat_count = 3 : i32}
      aiex.dma_start_task(%115)
      %116 = aiex.dma_configure_task_for @C_L2L3_4 {
        aie.dma_bd(%arg2 : memref<4194304xbf16> offset = 3145984 len = 65536 sizes = [2, 4, 256, 64] strides = [524288, 512, 2048, 1])
        aie.end
      } {issue_token = true, repeat_count = 1 : i32}
      aiex.dma_start_task(%116)
      %117 = aiex.dma_configure_task_for @B_L3L2_4 {
        aie.dma_bd(%arg1 : memref<1048576xbf16> offset = 256 len = 32768 sizes = [4, 8, 64, 64] strides = [512, 131072, 2048, 1])
        aie.end
      } {repeat_count = 3 : i32}
      aiex.dma_start_task(%117)
      %118 = aiex.dma_configure_task_for @B_L3L2_4 {
        aie.dma_bd(%arg1 : memref<1048576xbf16> offset = 256 len = 32768 sizes = [4, 8, 64, 64] strides = [512, 131072, 2048, 1])
        aie.end
      } {repeat_count = 3 : i32}
      aiex.dma_start_task(%118)
      %119 = aiex.dma_configure_task_for @C_L2L3_5 {
        aie.dma_bd(%arg2 : memref<4194304xbf16> offset = 3146048 len = 65536 sizes = [2, 4, 256, 64] strides = [524288, 512, 2048, 1])
        aie.end
      } {issue_token = true, repeat_count = 1 : i32}
      aiex.dma_start_task(%119)
      %120 = aiex.dma_configure_task_for @B_L3L2_5 {
        aie.dma_bd(%arg1 : memref<1048576xbf16> offset = 320 len = 32768 sizes = [4, 8, 64, 64] strides = [512, 131072, 2048, 1])
        aie.end
      } {repeat_count = 3 : i32}
      aiex.dma_start_task(%120)
      %121 = aiex.dma_configure_task_for @B_L3L2_5 {
        aie.dma_bd(%arg1 : memref<1048576xbf16> offset = 320 len = 32768 sizes = [4, 8, 64, 64] strides = [512, 131072, 2048, 1])
        aie.end
      } {repeat_count = 3 : i32}
      aiex.dma_start_task(%121)
      %122 = aiex.dma_configure_task_for @C_L2L3_6 {
        aie.dma_bd(%arg2 : memref<4194304xbf16> offset = 3146112 len = 65536 sizes = [2, 4, 256, 64] strides = [524288, 512, 2048, 1])
        aie.end
      } {issue_token = true, repeat_count = 1 : i32}
      aiex.dma_start_task(%122)
      %123 = aiex.dma_configure_task_for @B_L3L2_6 {
        aie.dma_bd(%arg1 : memref<1048576xbf16> offset = 384 len = 32768 sizes = [4, 8, 64, 64] strides = [512, 131072, 2048, 1])
        aie.end
      } {repeat_count = 3 : i32}
      aiex.dma_start_task(%123)
      %124 = aiex.dma_configure_task_for @B_L3L2_6 {
        aie.dma_bd(%arg1 : memref<1048576xbf16> offset = 384 len = 32768 sizes = [4, 8, 64, 64] strides = [512, 131072, 2048, 1])
        aie.end
      } {repeat_count = 3 : i32}
      aiex.dma_start_task(%124)
      %125 = aiex.dma_configure_task_for @C_L2L3_7 {
        aie.dma_bd(%arg2 : memref<4194304xbf16> offset = 3146176 len = 65536 sizes = [2, 4, 256, 64] strides = [524288, 512, 2048, 1])
        aie.end
      } {issue_token = true, repeat_count = 1 : i32}
      aiex.dma_start_task(%125)
      %126 = aiex.dma_configure_task_for @B_L3L2_7 {
        aie.dma_bd(%arg1 : memref<1048576xbf16> offset = 448 len = 32768 sizes = [4, 8, 64, 64] strides = [512, 131072, 2048, 1])
        aie.end
      } {repeat_count = 3 : i32}
      aiex.dma_start_task(%126)
      %127 = aiex.dma_configure_task_for @B_L3L2_7 {
        aie.dma_bd(%arg1 : memref<1048576xbf16> offset = 448 len = 32768 sizes = [4, 8, 64, 64] strides = [512, 131072, 2048, 1])
        aie.end
      } {repeat_count = 3 : i32}
      aiex.dma_start_task(%127)
      aiex.dma_await_task(%96)
      aiex.dma_await_task(%101)
      aiex.dma_await_task(%106)
      aiex.dma_await_task(%111)
      aiex.dma_await_task(%116)
      aiex.dma_await_task(%119)
      aiex.dma_await_task(%122)
      aiex.dma_await_task(%125)
      aiex.dma_free_task(%96)
      aiex.dma_free_task(%97)
      aiex.dma_free_task(%98)
      aiex.dma_free_task(%99)
      aiex.dma_free_task(%100)
      aiex.dma_free_task(%101)
      aiex.dma_free_task(%102)
      aiex.dma_free_task(%103)
      aiex.dma_free_task(%104)
      aiex.dma_free_task(%105)
      aiex.dma_free_task(%106)
      aiex.dma_free_task(%107)
      aiex.dma_free_task(%108)
      aiex.dma_free_task(%109)
      aiex.dma_free_task(%110)
      aiex.dma_free_task(%111)
      aiex.dma_free_task(%112)
      aiex.dma_free_task(%113)
      aiex.dma_free_task(%114)
      aiex.dma_free_task(%115)
      aiex.dma_free_task(%116)
      aiex.dma_free_task(%117)
      aiex.dma_free_task(%118)
      aiex.dma_free_task(%119)
      aiex.dma_free_task(%120)
      aiex.dma_free_task(%121)
      aiex.dma_free_task(%122)
      aiex.dma_free_task(%123)
      aiex.dma_free_task(%124)
      aiex.dma_free_task(%125)
      aiex.dma_free_task(%126)
      aiex.dma_free_task(%127)
    }
  }
}
