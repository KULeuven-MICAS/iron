; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"
target triple = "aie2p"

@in1_0_cons_buff_1 = external global [256 x bfloat]
@in1_0_cons_buff_0 = external global [256 x bfloat]
@in1_1_cons_buff_1 = external global [256 x bfloat]
@in1_1_cons_buff_0 = external global [256 x bfloat]
@in1_2_cons_buff_1 = external global [256 x bfloat]
@in1_2_cons_buff_0 = external global [256 x bfloat]
@in1_3_cons_buff_1 = external global [256 x bfloat]
@in1_3_cons_buff_0 = external global [256 x bfloat]
@in1_4_cons_buff_1 = external global [256 x bfloat]
@in1_4_cons_buff_0 = external global [256 x bfloat]
@in1_5_cons_buff_1 = external global [256 x bfloat]
@in1_5_cons_buff_0 = external global [256 x bfloat]
@in1_6_cons_buff_1 = external global [256 x bfloat]
@in1_6_cons_buff_0 = external global [256 x bfloat]
@in1_7_cons_buff_1 = external global [256 x bfloat]
@in1_7_cons_buff_0 = external global [256 x bfloat]
@in2_0_cons_buff_1 = external global [256 x bfloat]
@in2_0_cons_buff_0 = external global [256 x bfloat]
@in2_1_cons_buff_1 = external global [256 x bfloat]
@in2_1_cons_buff_0 = external global [256 x bfloat]
@in2_2_cons_buff_1 = external global [256 x bfloat]
@in2_2_cons_buff_0 = external global [256 x bfloat]
@in2_3_cons_buff_1 = external global [256 x bfloat]
@in2_3_cons_buff_0 = external global [256 x bfloat]
@in2_4_cons_buff_1 = external global [256 x bfloat]
@in2_4_cons_buff_0 = external global [256 x bfloat]
@in2_5_cons_buff_1 = external global [256 x bfloat]
@in2_5_cons_buff_0 = external global [256 x bfloat]
@in2_6_cons_buff_1 = external global [256 x bfloat]
@in2_6_cons_buff_0 = external global [256 x bfloat]
@in2_7_cons_buff_1 = external global [256 x bfloat]
@in2_7_cons_buff_0 = external global [256 x bfloat]
@out_0_buff_1 = external global [256 x bfloat]
@out_0_buff_0 = external global [256 x bfloat]
@out_1_buff_1 = external global [256 x bfloat]
@out_1_buff_0 = external global [256 x bfloat]
@out_2_buff_1 = external global [256 x bfloat]
@out_2_buff_0 = external global [256 x bfloat]
@out_3_buff_1 = external global [256 x bfloat]
@out_3_buff_0 = external global [256 x bfloat]
@out_4_buff_1 = external global [256 x bfloat]
@out_4_buff_0 = external global [256 x bfloat]
@out_5_buff_1 = external global [256 x bfloat]
@out_5_buff_0 = external global [256 x bfloat]
@out_6_buff_1 = external global [256 x bfloat]
@out_6_buff_0 = external global [256 x bfloat]
@out_7_buff_1 = external global [256 x bfloat]
@out_7_buff_0 = external global [256 x bfloat]

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

declare void @op2_eltwise_mul_bf16_vector(ptr, ptr, ptr, i32)

define void @core_1_3() {
  br label %1

1:                                                ; preds = %39, %0
  %2 = phi i64 [ %40, %39 ], [ 0, %0 ]
  %3 = phi i32 [ %9, %39 ], [ 0, %0 ]
  %4 = phi i32 [ %10, %39 ], [ 0, %0 ]
  %5 = phi i32 [ %11, %39 ], [ 0, %0 ]
  %6 = icmp slt i64 %2, 9223372036854775807
  br i1 %6, label %7, label %41

7:                                                ; preds = %28, %1
  %8 = phi i64 [ %38, %28 ], [ 0, %1 ]
  %9 = phi i32 [ %31, %28 ], [ %3, %1 ]
  %10 = phi i32 [ %34, %28 ], [ %4, %1 ]
  %11 = phi i32 [ %37, %28 ], [ %5, %1 ]
  %12 = icmp slt i64 %8, 512
  br i1 %12, label %13, label %39

13:                                               ; preds = %7
  call void @llvm.aie2p.acquire(i32 53, i32 -1)
  %14 = sext i32 %9 to i64
  switch i64 %14, label %15 [
    i64 0, label %42
    i64 1, label %44
  ]

15:                                               ; preds = %42, %44, %13
  %16 = phi ptr [ %45, %44 ], [ %43, %42 ], [ @in1_5_cons_buff_0, %13 ]
  %17 = getelementptr [256 x bfloat], ptr %16, i32 0, i32 0
  br label %18

18:                                               ; preds = %15
  call void @llvm.aie2p.acquire(i32 51, i32 -1)
  %19 = sext i32 %10 to i64
  switch i64 %19, label %20 [
    i64 0, label %46
    i64 1, label %48
  ]

20:                                               ; preds = %46, %48, %18
  %21 = phi ptr [ %49, %48 ], [ %47, %46 ], [ @in2_5_cons_buff_0, %18 ]
  %22 = getelementptr [256 x bfloat], ptr %21, i32 0, i32 0
  br label %23

23:                                               ; preds = %20
  call void @llvm.aie2p.acquire(i32 48, i32 -1)
  %24 = sext i32 %11 to i64
  switch i64 %24, label %25 [
    i64 0, label %50
    i64 1, label %52
  ]

25:                                               ; preds = %50, %52, %23
  %26 = phi ptr [ %53, %52 ], [ %51, %50 ], [ @out_5_buff_0, %23 ]
  %27 = getelementptr [256 x bfloat], ptr %26, i32 0, i32 0
  br label %28

28:                                               ; preds = %25
  call void @op2_eltwise_mul_bf16_vector(ptr %17, ptr %22, ptr %27, i32 256)
  call void @llvm.aie2p.release(i32 52, i32 1)
  %29 = add i32 %9, 1
  %30 = icmp sge i32 %29, 2
  %31 = select i1 %30, i32 0, i32 %29
  call void @llvm.aie2p.release(i32 50, i32 1)
  %32 = add i32 %10, 1
  %33 = icmp sge i32 %32, 2
  %34 = select i1 %33, i32 0, i32 %32
  call void @llvm.aie2p.release(i32 49, i32 1)
  %35 = add i32 %11, 1
  %36 = icmp sge i32 %35, 2
  %37 = select i1 %36, i32 0, i32 %35
  %38 = add i64 %8, 1
  br label %7

39:                                               ; preds = %7
  %40 = add i64 %2, 1
  br label %1

41:                                               ; preds = %1
  ret void

42:                                               ; preds = %13
  %43 = phi ptr [ @in1_5_cons_buff_0, %13 ]
  br label %15

44:                                               ; preds = %13
  %45 = phi ptr [ @in1_5_cons_buff_1, %13 ]
  br label %15

46:                                               ; preds = %18
  %47 = phi ptr [ @in2_5_cons_buff_0, %18 ]
  br label %20

48:                                               ; preds = %18
  %49 = phi ptr [ @in2_5_cons_buff_1, %18 ]
  br label %20

50:                                               ; preds = %23
  %51 = phi ptr [ @out_5_buff_0, %23 ]
  br label %25

52:                                               ; preds = %23
  %53 = phi ptr [ @out_5_buff_1, %23 ]
  br label %25
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
