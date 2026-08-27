; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"
target triple = "aie2p"

@of_1_mem_cons_buff_1 = external global [64 x [256 x bfloat]]
@of_1_mem_cons_buff_0 = external global [64 x [256 x bfloat]]
@of_2_mem_cons_buff_1 = external global [256 x [64 x bfloat]]
@of_2_mem_cons_buff_0 = external global [256 x [64 x bfloat]]
@of_6_unicast_0_cons_buff_1 = external global [16 x [256 x bfloat]]
@of_6_unicast_0_cons_buff_0 = external global [16 x [256 x bfloat]]
@of_6_unicast_1_cons_buff_1 = external global [16 x [256 x bfloat]]
@of_6_unicast_1_cons_buff_0 = external global [16 x [256 x bfloat]]
@of_6_unicast_2_cons_buff_1 = external global [16 x [256 x bfloat]]
@of_6_unicast_2_cons_buff_0 = external global [16 x [256 x bfloat]]
@of_3_unicast_0_0_cons_buff_1 = external global [16 x [64 x bfloat]]
@of_3_unicast_0_0_cons_buff_0 = external global [16 x [64 x bfloat]]
@of_6_unicast_3_cons_buff_1 = external global [16 x [256 x bfloat]]
@of_6_unicast_3_cons_buff_0 = external global [16 x [256 x bfloat]]
@of_3_unicast_1_0_cons_buff_1 = external global [16 x [64 x bfloat]]
@of_3_unicast_1_0_cons_buff_0 = external global [16 x [64 x bfloat]]
@of_3_unicast_2_0_cons_buff_1 = external global [16 x [64 x bfloat]]
@of_3_unicast_2_0_cons_buff_0 = external global [16 x [64 x bfloat]]
@of_3_unicast_3_0_cons_buff_1 = external global [16 x [64 x bfloat]]
@of_3_unicast_3_0_cons_buff_0 = external global [16 x [64 x bfloat]]
@of_4_broadcast_0_0_3_cons_buff_0 = external global [64 x [256 x bfloat]]
@of_4_broadcast_0_0_2_cons_buff_0 = external global [64 x [256 x bfloat]]
@of_4_broadcast_0_0_1_cons_buff_0 = external global [64 x [256 x bfloat]]
@of_4_broadcast_0_0_0_cons_buff_0 = external global [64 x [256 x bfloat]]
@of_5_broadcast_0_0_3_cons_buff_0 = external global [256 x [64 x bfloat]]
@of_5_broadcast_0_0_2_cons_buff_0 = external global [256 x [64 x bfloat]]
@of_5_broadcast_0_0_1_cons_buff_0 = external global [256 x [64 x bfloat]]
@of_5_broadcast_0_0_0_cons_buff_0 = external global [256 x [64 x bfloat]]
@of_6_unicast_0_buff_1 = external global [16 x [256 x bfloat]]
@of_6_unicast_0_buff_0 = external global [16 x [256 x bfloat]]
@of_8_unicast_0_cons_buff_1 = external global [16 x [256 x bfloat]]
@of_8_unicast_0_cons_buff_0 = external global [16 x [256 x bfloat]]
@of_6_unicast_1_buff_1 = external global [16 x [256 x bfloat]]
@of_6_unicast_1_buff_0 = external global [16 x [256 x bfloat]]
@of_8_unicast_1_cons_buff_1 = external global [16 x [256 x bfloat]]
@of_8_unicast_1_cons_buff_0 = external global [16 x [256 x bfloat]]
@of_6_unicast_2_buff_1 = external global [16 x [256 x bfloat]]
@of_6_unicast_2_buff_0 = external global [16 x [256 x bfloat]]
@of_8_unicast_2_cons_buff_1 = external global [16 x [256 x bfloat]]
@of_8_unicast_2_cons_buff_0 = external global [16 x [256 x bfloat]]
@of_6_unicast_3_buff_1 = external global [16 x [256 x bfloat]]
@of_6_unicast_3_buff_0 = external global [16 x [256 x bfloat]]
@of_8_unicast_3_cons_buff_1 = external global [16 x [256 x bfloat]]
@of_8_unicast_3_cons_buff_0 = external global [16 x [256 x bfloat]]
@of_7_unicast_0_0_cons_buff_1 = external global [16 x [256 x bfloat]]
@of_7_unicast_0_0_cons_buff_0 = external global [16 x [256 x bfloat]]
@of_7_unicast_1_0_cons_buff_1 = external global [16 x [256 x bfloat]]
@of_7_unicast_1_0_cons_buff_0 = external global [16 x [256 x bfloat]]
@of_7_unicast_2_0_cons_buff_1 = external global [16 x [256 x bfloat]]
@of_7_unicast_2_0_cons_buff_0 = external global [16 x [256 x bfloat]]
@of_7_unicast_3_0_cons_buff_1 = external global [16 x [256 x bfloat]]
@of_7_unicast_3_0_cons_buff_0 = external global [16 x [256 x bfloat]]
@of_8_unicast_0_buff_1 = external global [16 x [256 x bfloat]]
@of_8_unicast_0_buff_0 = external global [16 x [256 x bfloat]]
@of_0_mem_0_cons_buff_1 = external global [16 x [64 x bfloat]]
@of_0_mem_0_cons_buff_0 = external global [16 x [64 x bfloat]]
@of_8_unicast_1_buff_1 = external global [16 x [256 x bfloat]]
@of_8_unicast_1_buff_0 = external global [16 x [256 x bfloat]]
@of_0_mem_1_cons_buff_1 = external global [16 x [64 x bfloat]]
@of_0_mem_1_cons_buff_0 = external global [16 x [64 x bfloat]]
@of_8_unicast_2_buff_1 = external global [16 x [256 x bfloat]]
@of_8_unicast_2_buff_0 = external global [16 x [256 x bfloat]]
@of_0_mem_2_cons_buff_1 = external global [16 x [64 x bfloat]]
@of_0_mem_2_cons_buff_0 = external global [16 x [64 x bfloat]]
@of_8_unicast_3_buff_1 = external global [16 x [256 x bfloat]]
@of_8_unicast_3_buff_0 = external global [16 x [256 x bfloat]]
@of_0_mem_3_cons_buff_1 = external global [16 x [64 x bfloat]]
@of_0_mem_3_cons_buff_0 = external global [16 x [64 x bfloat]]
@of_9_unicast_0_0_cons_buff_1 = external global [16 x [256 x bfloat]]
@of_9_unicast_0_0_cons_buff_0 = external global [16 x [256 x bfloat]]
@of_9_unicast_1_0_cons_buff_1 = external global [16 x [256 x bfloat]]
@of_9_unicast_1_0_cons_buff_0 = external global [16 x [256 x bfloat]]
@of_9_unicast_2_0_cons_buff_1 = external global [16 x [256 x bfloat]]
@of_9_unicast_2_0_cons_buff_0 = external global [16 x [256 x bfloat]]
@of_9_unicast_3_0_cons_buff_1 = external global [16 x [256 x bfloat]]
@of_9_unicast_3_0_cons_buff_0 = external global [16 x [256 x bfloat]]
@of_10_unicast_0_buff_1 = external global [16 x [64 x bfloat]]
@of_10_unicast_0_buff_0 = external global [16 x [64 x bfloat]]
@of_10_unicast_0_cons_buff_1 = external global [16 x [64 x bfloat]]
@of_10_unicast_0_cons_buff_0 = external global [16 x [64 x bfloat]]
@of_10_unicast_1_buff_1 = external global [16 x [64 x bfloat]]
@of_10_unicast_1_buff_0 = external global [16 x [64 x bfloat]]
@of_10_unicast_1_cons_buff_1 = external global [16 x [64 x bfloat]]
@of_10_unicast_1_cons_buff_0 = external global [16 x [64 x bfloat]]
@of_10_unicast_2_buff_1 = external global [16 x [64 x bfloat]]
@of_10_unicast_2_buff_0 = external global [16 x [64 x bfloat]]
@of_10_unicast_2_cons_buff_1 = external global [16 x [64 x bfloat]]
@of_10_unicast_2_cons_buff_0 = external global [16 x [64 x bfloat]]
@of_10_unicast_3_buff_1 = external global [16 x [64 x bfloat]]
@of_10_unicast_3_buff_0 = external global [16 x [64 x bfloat]]
@of_10_unicast_3_cons_buff_1 = external global [16 x [64 x bfloat]]
@of_10_unicast_3_cons_buff_0 = external global [16 x [64 x bfloat]]

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

declare void @op0_zero_bf16_16_64_256(ptr)

declare void @op0_matmul_bf16_bf16_16_64_256(ptr, ptr, ptr)

declare void @op0_zero_bf16_16_256_64(ptr)

declare void @op0_matmul_bf16_bf16_16_256_64(ptr, ptr, ptr)

declare void @op0_softmax_rows_bf16(ptr, ptr, i32, i32)

define void @core_1_4() {
  br label %1

1:                                                ; preds = %30, %0
  %2 = phi i64 [ %31, %30 ], [ 0, %0 ]
  %3 = phi i32 [ %9, %30 ], [ 0, %0 ]
  %4 = phi i32 [ %10, %30 ], [ 0, %0 ]
  %5 = icmp slt i64 %2, 4294967295
  br i1 %5, label %6, label %32

6:                                                ; preds = %1
  call void @llvm.aie2p.acquire(i32 53, i32 -1)
  br label %7

7:                                                ; preds = %22, %6
  %8 = phi i64 [ %29, %22 ], [ 0, %6 ]
  %9 = phi i32 [ %28, %22 ], [ %3, %6 ]
  %10 = phi i32 [ %25, %22 ], [ %4, %6 ]
  %11 = icmp slt i64 %8, 4
  br i1 %11, label %12, label %30

12:                                               ; preds = %7
  call void @llvm.aie2p.acquire(i32 48, i32 -1)
  %13 = sext i32 %9 to i64
  switch i64 %13, label %14 [
    i64 0, label %33
    i64 1, label %35
  ]

14:                                               ; preds = %33, %35, %12
  %15 = phi ptr [ %36, %35 ], [ %34, %33 ], [ @of_10_unicast_1_buff_0, %12 ]
  %16 = getelementptr [16 x [64 x bfloat]], ptr %15, i32 0, i32 0, i32 0
  br label %17

17:                                               ; preds = %14
  call void @op0_zero_bf16_16_256_64(ptr %16)
  call void @llvm.aie2p.acquire(i32 51, i32 -1)
  %18 = sext i32 %10 to i64
  switch i64 %18, label %19 [
    i64 0, label %37
    i64 1, label %39
  ]

19:                                               ; preds = %37, %39, %17
  %20 = phi ptr [ %40, %39 ], [ %38, %37 ], [ @of_9_unicast_1_0_cons_buff_0, %17 ]
  %21 = getelementptr [16 x [256 x bfloat]], ptr %20, i32 0, i32 0, i32 0
  br label %22

22:                                               ; preds = %19
  call void @op0_matmul_bf16_bf16_16_256_64(ptr %21, ptr @of_5_broadcast_0_0_1_cons_buff_0, ptr %16)
  call void @llvm.aie2p.release(i32 50, i32 1)
  %23 = add i32 %10, 1
  %24 = icmp sge i32 %23, 2
  %25 = select i1 %24, i32 0, i32 %23
  call void @llvm.aie2p.release(i32 49, i32 1)
  %26 = add i32 %9, 1
  %27 = icmp sge i32 %26, 2
  %28 = select i1 %27, i32 0, i32 %26
  %29 = add i64 %8, 1
  br label %7

30:                                               ; preds = %7
  call void @llvm.aie2p.release(i32 52, i32 1)
  %31 = add i64 %2, 1
  br label %1

32:                                               ; preds = %1
  ret void

33:                                               ; preds = %12
  %34 = phi ptr [ @of_10_unicast_1_buff_0, %12 ]
  br label %14

35:                                               ; preds = %12
  %36 = phi ptr [ @of_10_unicast_1_buff_1, %12 ]
  br label %14

37:                                               ; preds = %17
  %38 = phi ptr [ @of_9_unicast_1_0_cons_buff_0, %17 ]
  br label %19

39:                                               ; preds = %17
  %40 = phi ptr [ @of_9_unicast_1_0_cons_buff_1, %17 ]
  br label %19
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
