; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"
target triple = "aie2p"

@flash_index_7_3 = external global [2 x i32]
@flash_state_7_3 = external global [256 x bfloat]
@flash_index_6_3 = external global [2 x i32]
@flash_state_6_3 = external global [256 x bfloat]
@flash_index_5_3 = external global [2 x i32]
@flash_state_5_3 = external global [256 x bfloat]
@flash_index_4_3 = external global [2 x i32]
@flash_state_4_3 = external global [256 x bfloat]
@flash_index_3_3 = external global [2 x i32]
@flash_state_3_3 = external global [256 x bfloat]
@flash_index_2_3 = external global [2 x i32]
@flash_state_2_3 = external global [256 x bfloat]
@flash_index_1_3 = external global [2 x i32]
@flash_state_1_3 = external global [256 x bfloat]
@flash_index_0_3 = external global [2 x i32]
@flash_state_0_3 = external global [256 x bfloat]
@flash_index_7_4 = external global [2 x i32]
@flash_index_6_4 = external global [2 x i32]
@flash_index_5_4 = external global [2 x i32]
@flash_index_4_4 = external global [2 x i32]
@flash_index_3_4 = external global [2 x i32]
@flash_index_2_4 = external global [2 x i32]
@flash_index_1_4 = external global [2 x i32]
@flash_index_0_4 = external global [2 x i32]
@flash_scale_0_3_buff_1 = external global [256 x bfloat]
@flash_scale_0_3_buff_0 = external global [256 x bfloat]
@flash_scale_1_3_buff_1 = external global [256 x bfloat]
@flash_scale_1_3_buff_0 = external global [256 x bfloat]
@flash_scale_2_3_buff_1 = external global [256 x bfloat]
@flash_scale_2_3_buff_0 = external global [256 x bfloat]
@flash_scale_3_3_buff_1 = external global [256 x bfloat]
@flash_scale_3_3_buff_0 = external global [256 x bfloat]
@flash_scale_4_3_buff_1 = external global [256 x bfloat]
@flash_scale_4_3_buff_0 = external global [256 x bfloat]
@flash_scale_5_3_buff_1 = external global [256 x bfloat]
@flash_scale_5_3_buff_0 = external global [256 x bfloat]
@flash_scale_6_3_buff_1 = external global [256 x bfloat]
@flash_scale_6_3_buff_0 = external global [256 x bfloat]
@flash_scale_7_3_buff_1 = external global [256 x bfloat]
@flash_scale_7_3_buff_0 = external global [256 x bfloat]
@of_0_mem_0_cons_buff_1 = external global [64 x [64 x bfloat]]
@of_0_mem_0_cons_buff_0 = external global [64 x [64 x bfloat]]
@of_0_mem_1_cons_buff_1 = external global [64 x [64 x bfloat]]
@of_0_mem_1_cons_buff_0 = external global [64 x [64 x bfloat]]
@of_0_mem_2_cons_buff_1 = external global [64 x [64 x bfloat]]
@of_0_mem_2_cons_buff_0 = external global [64 x [64 x bfloat]]
@of_0_mem_3_cons_buff_1 = external global [64 x [64 x bfloat]]
@of_0_mem_3_cons_buff_0 = external global [64 x [64 x bfloat]]
@of_0_mem_4_cons_buff_1 = external global [64 x [64 x bfloat]]
@of_0_mem_4_cons_buff_0 = external global [64 x [64 x bfloat]]
@of_0_mem_5_cons_buff_1 = external global [64 x [64 x bfloat]]
@of_0_mem_5_cons_buff_0 = external global [64 x [64 x bfloat]]
@of_0_mem_6_cons_buff_1 = external global [64 x [64 x bfloat]]
@of_0_mem_6_cons_buff_0 = external global [64 x [64 x bfloat]]
@of_0_mem_7_cons_buff_1 = external global [64 x [64 x bfloat]]
@of_0_mem_7_cons_buff_0 = external global [64 x [64 x bfloat]]
@of_1_mem_cons_buff_1 = external global [64 x [64 x bfloat]]
@of_1_mem_cons_buff_0 = external global [64 x [64 x bfloat]]
@of_2_mem_cons_buff_1 = external global [64 x [64 x bfloat]]
@of_2_mem_cons_buff_0 = external global [64 x [64 x bfloat]]
@of_3_unicast_0_0_cons_buff_0 = external global [64 x [64 x bfloat]]
@of_3_unicast_1_0_cons_buff_0 = external global [64 x [64 x bfloat]]
@of_3_unicast_2_0_cons_buff_0 = external global [64 x [64 x bfloat]]
@of_3_unicast_3_0_cons_buff_0 = external global [64 x [64 x bfloat]]
@of_3_unicast_4_0_cons_buff_0 = external global [64 x [64 x bfloat]]
@of_3_unicast_5_0_cons_buff_0 = external global [64 x [64 x bfloat]]
@of_3_unicast_6_0_cons_buff_0 = external global [64 x [64 x bfloat]]
@of_3_unicast_7_0_cons_buff_0 = external global [64 x [64 x bfloat]]
@of_4_broadcast_0_0_7_cons_buff_1 = external global [64 x [64 x bfloat]]
@of_4_broadcast_0_0_7_cons_buff_0 = external global [64 x [64 x bfloat]]
@of_4_broadcast_0_0_6_cons_buff_1 = external global [64 x [64 x bfloat]]
@of_4_broadcast_0_0_6_cons_buff_0 = external global [64 x [64 x bfloat]]
@of_4_broadcast_0_0_5_cons_buff_1 = external global [64 x [64 x bfloat]]
@of_4_broadcast_0_0_5_cons_buff_0 = external global [64 x [64 x bfloat]]
@of_4_broadcast_0_0_4_cons_buff_1 = external global [64 x [64 x bfloat]]
@of_4_broadcast_0_0_4_cons_buff_0 = external global [64 x [64 x bfloat]]
@of_4_broadcast_0_0_3_cons_buff_1 = external global [64 x [64 x bfloat]]
@of_4_broadcast_0_0_3_cons_buff_0 = external global [64 x [64 x bfloat]]
@of_4_broadcast_0_0_2_cons_buff_1 = external global [64 x [64 x bfloat]]
@of_4_broadcast_0_0_2_cons_buff_0 = external global [64 x [64 x bfloat]]
@of_4_broadcast_0_0_1_cons_buff_1 = external global [64 x [64 x bfloat]]
@of_4_broadcast_0_0_1_cons_buff_0 = external global [64 x [64 x bfloat]]
@of_4_broadcast_0_0_0_cons_buff_1 = external global [64 x [64 x bfloat]]
@of_4_broadcast_0_0_0_cons_buff_0 = external global [64 x [64 x bfloat]]
@of_5_broadcast_0_0_7_cons_buff_1 = external global [64 x [64 x bfloat]]
@of_5_broadcast_0_0_7_cons_buff_0 = external global [64 x [64 x bfloat]]
@of_5_broadcast_0_0_6_cons_buff_1 = external global [64 x [64 x bfloat]]
@of_5_broadcast_0_0_6_cons_buff_0 = external global [64 x [64 x bfloat]]
@of_5_broadcast_0_0_5_cons_buff_1 = external global [64 x [64 x bfloat]]
@of_5_broadcast_0_0_5_cons_buff_0 = external global [64 x [64 x bfloat]]
@of_5_broadcast_0_0_4_cons_buff_1 = external global [64 x [64 x bfloat]]
@of_5_broadcast_0_0_4_cons_buff_0 = external global [64 x [64 x bfloat]]
@of_5_broadcast_0_0_3_cons_buff_1 = external global [64 x [64 x bfloat]]
@of_5_broadcast_0_0_3_cons_buff_0 = external global [64 x [64 x bfloat]]
@of_5_broadcast_0_0_2_cons_buff_1 = external global [64 x [64 x bfloat]]
@of_5_broadcast_0_0_2_cons_buff_0 = external global [64 x [64 x bfloat]]
@of_5_broadcast_0_0_1_cons_buff_1 = external global [64 x [64 x bfloat]]
@of_5_broadcast_0_0_1_cons_buff_0 = external global [64 x [64 x bfloat]]
@of_5_broadcast_0_0_0_cons_buff_1 = external global [64 x [64 x bfloat]]
@of_5_broadcast_0_0_0_cons_buff_0 = external global [64 x [64 x bfloat]]
@of_6_unicast_0_buff_1 = external global [64 x [64 x bfloat]]
@of_6_unicast_0_buff_0 = external global [64 x [64 x bfloat]]
@of_6_unicast_0_cons_buff_1 = external global [64 x [64 x bfloat]]
@of_6_unicast_0_cons_buff_0 = external global [64 x [64 x bfloat]]
@of_6_unicast_1_buff_1 = external global [64 x [64 x bfloat]]
@of_6_unicast_1_buff_0 = external global [64 x [64 x bfloat]]
@of_6_unicast_1_cons_buff_1 = external global [64 x [64 x bfloat]]
@of_6_unicast_1_cons_buff_0 = external global [64 x [64 x bfloat]]
@of_6_unicast_2_buff_1 = external global [64 x [64 x bfloat]]
@of_6_unicast_2_buff_0 = external global [64 x [64 x bfloat]]
@of_6_unicast_2_cons_buff_1 = external global [64 x [64 x bfloat]]
@of_6_unicast_2_cons_buff_0 = external global [64 x [64 x bfloat]]
@of_6_unicast_3_buff_1 = external global [64 x [64 x bfloat]]
@of_6_unicast_3_buff_0 = external global [64 x [64 x bfloat]]
@of_6_unicast_3_cons_buff_1 = external global [64 x [64 x bfloat]]
@of_6_unicast_3_cons_buff_0 = external global [64 x [64 x bfloat]]
@of_6_unicast_4_buff_1 = external global [64 x [64 x bfloat]]
@of_6_unicast_4_buff_0 = external global [64 x [64 x bfloat]]
@of_6_unicast_4_cons_buff_1 = external global [64 x [64 x bfloat]]
@of_6_unicast_4_cons_buff_0 = external global [64 x [64 x bfloat]]
@of_6_unicast_5_buff_1 = external global [64 x [64 x bfloat]]
@of_6_unicast_5_buff_0 = external global [64 x [64 x bfloat]]
@of_6_unicast_5_cons_buff_1 = external global [64 x [64 x bfloat]]
@of_6_unicast_5_cons_buff_0 = external global [64 x [64 x bfloat]]
@of_6_unicast_6_buff_1 = external global [64 x [64 x bfloat]]
@of_6_unicast_6_buff_0 = external global [64 x [64 x bfloat]]
@of_6_unicast_6_cons_buff_1 = external global [64 x [64 x bfloat]]
@of_6_unicast_6_cons_buff_0 = external global [64 x [64 x bfloat]]
@of_6_unicast_7_buff_1 = external global [64 x [64 x bfloat]]
@of_6_unicast_7_buff_0 = external global [64 x [64 x bfloat]]
@of_6_unicast_7_cons_buff_1 = external global [64 x [64 x bfloat]]
@of_6_unicast_7_cons_buff_0 = external global [64 x [64 x bfloat]]
@of_7_unicast_0_0_cons_buff_1 = external global [64 x [64 x bfloat]]
@of_7_unicast_0_0_cons_buff_0 = external global [64 x [64 x bfloat]]
@of_7_unicast_1_0_cons_buff_1 = external global [64 x [64 x bfloat]]
@of_7_unicast_1_0_cons_buff_0 = external global [64 x [64 x bfloat]]
@of_7_unicast_2_0_cons_buff_1 = external global [64 x [64 x bfloat]]
@of_7_unicast_2_0_cons_buff_0 = external global [64 x [64 x bfloat]]
@of_7_unicast_3_0_cons_buff_1 = external global [64 x [64 x bfloat]]
@of_7_unicast_3_0_cons_buff_0 = external global [64 x [64 x bfloat]]
@of_7_unicast_4_0_cons_buff_1 = external global [64 x [64 x bfloat]]
@of_7_unicast_4_0_cons_buff_0 = external global [64 x [64 x bfloat]]
@of_7_unicast_5_0_cons_buff_1 = external global [64 x [64 x bfloat]]
@of_7_unicast_5_0_cons_buff_0 = external global [64 x [64 x bfloat]]
@of_7_unicast_6_0_cons_buff_1 = external global [64 x [64 x bfloat]]
@of_7_unicast_6_0_cons_buff_0 = external global [64 x [64 x bfloat]]
@of_7_unicast_7_0_cons_buff_1 = external global [64 x [64 x bfloat]]
@of_7_unicast_7_0_cons_buff_0 = external global [64 x [64 x bfloat]]
@of_8_unicast_0_buff_1 = external global [64 x [64 x bfloat]]
@of_8_unicast_0_buff_0 = external global [64 x [64 x bfloat]]
@of_8_unicast_0_cons_buff_1 = external global [64 x [64 x bfloat]]
@of_8_unicast_0_cons_buff_0 = external global [64 x [64 x bfloat]]
@of_8_unicast_1_buff_1 = external global [64 x [64 x bfloat]]
@of_8_unicast_1_buff_0 = external global [64 x [64 x bfloat]]
@of_8_unicast_1_cons_buff_1 = external global [64 x [64 x bfloat]]
@of_8_unicast_1_cons_buff_0 = external global [64 x [64 x bfloat]]
@of_8_unicast_2_buff_1 = external global [64 x [64 x bfloat]]
@of_8_unicast_2_buff_0 = external global [64 x [64 x bfloat]]
@of_8_unicast_2_cons_buff_1 = external global [64 x [64 x bfloat]]
@of_8_unicast_2_cons_buff_0 = external global [64 x [64 x bfloat]]
@of_8_unicast_3_buff_1 = external global [64 x [64 x bfloat]]
@of_8_unicast_3_buff_0 = external global [64 x [64 x bfloat]]
@of_8_unicast_3_cons_buff_1 = external global [64 x [64 x bfloat]]
@of_8_unicast_3_cons_buff_0 = external global [64 x [64 x bfloat]]
@of_8_unicast_4_buff_1 = external global [64 x [64 x bfloat]]
@of_8_unicast_4_buff_0 = external global [64 x [64 x bfloat]]
@of_8_unicast_4_cons_buff_1 = external global [64 x [64 x bfloat]]
@of_8_unicast_4_cons_buff_0 = external global [64 x [64 x bfloat]]
@of_8_unicast_5_buff_1 = external global [64 x [64 x bfloat]]
@of_8_unicast_5_buff_0 = external global [64 x [64 x bfloat]]
@of_8_unicast_5_cons_buff_1 = external global [64 x [64 x bfloat]]
@of_8_unicast_5_cons_buff_0 = external global [64 x [64 x bfloat]]
@of_8_unicast_6_buff_1 = external global [64 x [64 x bfloat]]
@of_8_unicast_6_buff_0 = external global [64 x [64 x bfloat]]
@of_8_unicast_6_cons_buff_1 = external global [64 x [64 x bfloat]]
@of_8_unicast_6_cons_buff_0 = external global [64 x [64 x bfloat]]
@of_8_unicast_7_buff_1 = external global [64 x [64 x bfloat]]
@of_8_unicast_7_buff_0 = external global [64 x [64 x bfloat]]
@of_8_unicast_7_cons_buff_1 = external global [64 x [64 x bfloat]]
@of_8_unicast_7_cons_buff_0 = external global [64 x [64 x bfloat]]
@of_9_unicast_0_0_cons_buff_1 = external global [64 x [64 x bfloat]]
@of_9_unicast_0_0_cons_buff_0 = external global [64 x [64 x bfloat]]
@of_9_unicast_1_0_cons_buff_1 = external global [64 x [64 x bfloat]]
@of_9_unicast_1_0_cons_buff_0 = external global [64 x [64 x bfloat]]
@of_9_unicast_2_0_cons_buff_1 = external global [64 x [64 x bfloat]]
@of_9_unicast_2_0_cons_buff_0 = external global [64 x [64 x bfloat]]
@of_9_unicast_3_0_cons_buff_1 = external global [64 x [64 x bfloat]]
@of_9_unicast_3_0_cons_buff_0 = external global [64 x [64 x bfloat]]
@of_9_unicast_4_0_cons_buff_1 = external global [64 x [64 x bfloat]]
@of_9_unicast_4_0_cons_buff_0 = external global [64 x [64 x bfloat]]
@of_9_unicast_5_0_cons_buff_1 = external global [64 x [64 x bfloat]]
@of_9_unicast_5_0_cons_buff_0 = external global [64 x [64 x bfloat]]
@of_9_unicast_6_0_cons_buff_1 = external global [64 x [64 x bfloat]]
@of_9_unicast_6_0_cons_buff_0 = external global [64 x [64 x bfloat]]
@of_9_unicast_7_0_cons_buff_1 = external global [64 x [64 x bfloat]]
@of_9_unicast_7_0_cons_buff_0 = external global [64 x [64 x bfloat]]
@of_10_unicast_0_buff_1 = external global [64 x [64 x bfloat]]
@of_10_unicast_0_buff_0 = external global [64 x [64 x bfloat]]
@of_10_unicast_0_cons_buff_1 = external global [64 x [64 x bfloat]]
@of_10_unicast_0_cons_buff_0 = external global [64 x [64 x bfloat]]
@of_10_unicast_1_buff_1 = external global [64 x [64 x bfloat]]
@of_10_unicast_1_buff_0 = external global [64 x [64 x bfloat]]
@of_10_unicast_1_cons_buff_1 = external global [64 x [64 x bfloat]]
@of_10_unicast_1_cons_buff_0 = external global [64 x [64 x bfloat]]
@of_10_unicast_2_buff_1 = external global [64 x [64 x bfloat]]
@of_10_unicast_2_buff_0 = external global [64 x [64 x bfloat]]
@of_10_unicast_2_cons_buff_1 = external global [64 x [64 x bfloat]]
@of_10_unicast_2_cons_buff_0 = external global [64 x [64 x bfloat]]
@of_10_unicast_3_buff_1 = external global [64 x [64 x bfloat]]
@of_10_unicast_3_buff_0 = external global [64 x [64 x bfloat]]
@of_10_unicast_3_cons_buff_1 = external global [64 x [64 x bfloat]]
@of_10_unicast_3_cons_buff_0 = external global [64 x [64 x bfloat]]
@of_10_unicast_4_buff_1 = external global [64 x [64 x bfloat]]
@of_10_unicast_4_buff_0 = external global [64 x [64 x bfloat]]
@of_10_unicast_4_cons_buff_1 = external global [64 x [64 x bfloat]]
@of_10_unicast_4_cons_buff_0 = external global [64 x [64 x bfloat]]
@of_10_unicast_5_buff_1 = external global [64 x [64 x bfloat]]
@of_10_unicast_5_buff_0 = external global [64 x [64 x bfloat]]
@of_10_unicast_5_cons_buff_1 = external global [64 x [64 x bfloat]]
@of_10_unicast_5_cons_buff_0 = external global [64 x [64 x bfloat]]
@of_10_unicast_6_buff_1 = external global [64 x [64 x bfloat]]
@of_10_unicast_6_buff_0 = external global [64 x [64 x bfloat]]
@of_10_unicast_6_cons_buff_1 = external global [64 x [64 x bfloat]]
@of_10_unicast_6_cons_buff_0 = external global [64 x [64 x bfloat]]
@of_10_unicast_7_buff_1 = external global [64 x [64 x bfloat]]
@of_10_unicast_7_buff_0 = external global [64 x [64 x bfloat]]
@of_10_unicast_7_cons_buff_1 = external global [64 x [64 x bfloat]]
@of_10_unicast_7_cons_buff_0 = external global [64 x [64 x bfloat]]

declare void @debug_i32(i32)

; Unknown intrinsic
declare void @llvm.aie2p.event(i32)

; Unknown intrinsic
declare void @llvm.aie2p.put.ms(i32, i32)

; Unknown intrinsic
declare { i32, i32 } @llvm.aie2p.get.ss()

; Unknown intrinsic
declare void @llvm.aie2p.mcd.write.vec(<16 x i32>, i32)

; Unknown intrinsic
declare <16 x i32> @llvm.aie2p.scd.read.vec(i32)

; Unknown intrinsic
declare void @llvm.aie2p.acquire(i32, i32)

; Unknown intrinsic
declare void @llvm.aie2p.release(i32, i32)

; Unknown intrinsic
declare void @llvm.aie2p.set.ctrl.reg(i32, i32)

declare void @op0_zero_bf16_64_64_64(ptr)

declare void @op0_matmul_bf16_bf16_64_64_64(ptr, ptr, ptr)

declare void @op0_rescale_O(ptr, ptr, i32, ptr)

declare void @op0_zero_bf16(ptr)

declare void @op0_matmul_PV(ptr, ptr, ptr, ptr, i32, i32, ptr)

declare void @op0_init_scale_buffer(ptr, i32)

declare void @op0_passThroughLine(ptr, ptr, i32)

declare void @op0_partial_softmax(ptr, ptr, ptr, ptr, bfloat, i32, i32, i32, i32)

define void @core_5_2() {
  br label %1

1:                                                ; preds = %34, %0
  %2 = phi i64 [ %35, %34 ], [ 0, %0 ]
  %3 = phi i32 [ %9, %34 ], [ 0, %0 ]
  %4 = phi i32 [ %10, %34 ], [ 0, %0 ]
  %5 = icmp slt i64 %2, 4294967295
  br i1 %5, label %6, label %36

6:                                                ; preds = %1
  call void @llvm.aie2p.acquire(i32 53, i32 -1)
  br label %7

7:                                                ; preds = %26, %6
  %8 = phi i64 [ %33, %26 ], [ 0, %6 ]
  %9 = phi i32 [ %32, %26 ], [ %3, %6 ]
  %10 = phi i32 [ %29, %26 ], [ %4, %6 ]
  %11 = icmp slt i64 %8, 8
  br i1 %11, label %12, label %34

12:                                               ; preds = %7
  call void @llvm.aie2p.acquire(i32 48, i32 -1)
  %13 = sext i32 %9 to i64
  switch i64 %13, label %14 [
    i64 0, label %37
    i64 1, label %39
  ]

14:                                               ; preds = %37, %39, %12
  %15 = phi ptr [ %40, %39 ], [ %38, %37 ], [ @of_6_unicast_5_buff_0, %12 ]
  %16 = getelementptr [64 x [64 x bfloat]], ptr %15, i32 0, i32 0, i32 0
  br label %17

17:                                               ; preds = %14
  call void @op0_zero_bf16_64_64_64(ptr %16)
  call void @llvm.aie2p.acquire(i32 51, i32 -1)
  %18 = sext i32 %10 to i64
  switch i64 %18, label %19 [
    i64 0, label %41
    i64 1, label %43
  ]

19:                                               ; preds = %41, %43, %17
  %20 = phi ptr [ %44, %43 ], [ %42, %41 ], [ @of_4_broadcast_0_0_5_cons_buff_0, %17 ]
  %21 = getelementptr [64 x [64 x bfloat]], ptr %20, i32 0, i32 0, i32 0
  br label %22

22:                                               ; preds = %19
  %23 = trunc i64 %8 to i32
  %24 = icmp sle i32 %23, 5
  br i1 %24, label %25, label %26

25:                                               ; preds = %22
  call void @op0_matmul_bf16_bf16_64_64_64(ptr @of_3_unicast_5_0_cons_buff_0, ptr %21, ptr %16)
  br label %26

26:                                               ; preds = %25, %22
  call void @llvm.aie2p.release(i32 50, i32 1)
  %27 = add i32 %10, 1
  %28 = icmp sge i32 %27, 2
  %29 = select i1 %28, i32 0, i32 %27
  call void @llvm.aie2p.release(i32 49, i32 1)
  %30 = add i32 %9, 1
  %31 = icmp sge i32 %30, 2
  %32 = select i1 %31, i32 0, i32 %30
  %33 = add i64 %8, 1
  br label %7

34:                                               ; preds = %7
  call void @llvm.aie2p.release(i32 52, i32 1)
  %35 = add i64 %2, 1
  br label %1

36:                                               ; preds = %1
  ret void

37:                                               ; preds = %12
  %38 = phi ptr [ @of_6_unicast_5_buff_0, %12 ]
  br label %14

39:                                               ; preds = %12
  %40 = phi ptr [ @of_6_unicast_5_buff_1, %12 ]
  br label %14

41:                                               ; preds = %17
  %42 = phi ptr [ @of_4_broadcast_0_0_5_cons_buff_0, %17 ]
  br label %19

43:                                               ; preds = %17
  %44 = phi ptr [ @of_4_broadcast_0_0_5_cons_buff_1, %17 ]
  br label %19
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
