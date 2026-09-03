; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"
target triple = "aie2p"

@of_0_mem_cons_buff_1 = external global [4 x [1 x [256 x bfloat]]]
@of_0_mem_cons_buff_0 = external global [4 x [1 x [256 x bfloat]]]
@of_3_mem_buff_1 = external global [4 x [1 x [256 x bfloat]]]
@of_3_mem_buff_0 = external global [4 x [1 x [256 x bfloat]]]
@of_1_distribute_0_0_cons_buff_1 = external global [1 x [256 x bfloat]]
@of_1_distribute_0_0_cons_buff_0 = external global [1 x [256 x bfloat]]
@of_1_distribute_0_1_cons_buff_1 = external global [1 x [256 x bfloat]]
@of_1_distribute_0_1_cons_buff_0 = external global [1 x [256 x bfloat]]
@of_1_distribute_0_2_cons_buff_1 = external global [1 x [256 x bfloat]]
@of_1_distribute_0_2_cons_buff_0 = external global [1 x [256 x bfloat]]
@of_1_distribute_0_3_cons_buff_1 = external global [1 x [256 x bfloat]]
@of_1_distribute_0_3_cons_buff_0 = external global [1 x [256 x bfloat]]
@of_2_join_0_0_buff_1 = external global [1 x [256 x bfloat]]
@of_2_join_0_0_buff_0 = external global [1 x [256 x bfloat]]
@of_2_join_0_1_buff_1 = external global [1 x [256 x bfloat]]
@of_2_join_0_1_buff_0 = external global [1 x [256 x bfloat]]
@of_2_join_0_2_buff_1 = external global [1 x [256 x bfloat]]
@of_2_join_0_2_buff_0 = external global [1 x [256 x bfloat]]
@of_2_join_0_3_buff_1 = external global [1 x [256 x bfloat]]
@of_2_join_0_3_buff_0 = external global [1 x [256 x bfloat]]

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

declare void @op1_softmax_rows_causal_bf16(ptr, ptr, i32, i32, i32)

define void @core_0_2() {
  br label %1

1:                                                ; preds = %31, %0
  %2 = phi i64 [ %32, %31 ], [ 0, %0 ]
  %3 = phi i32 [ %8, %31 ], [ 0, %0 ]
  %4 = phi i32 [ %9, %31 ], [ 0, %0 ]
  %5 = icmp slt i64 %2, 4294967295
  br i1 %5, label %6, label %33

6:                                                ; preds = %21, %1
  %7 = phi i64 [ %30, %21 ], [ 0, %1 ]
  %8 = phi i32 [ %29, %21 ], [ %3, %1 ]
  %9 = phi i32 [ %26, %21 ], [ %4, %1 ]
  %10 = icmp slt i64 %7, 64
  br i1 %10, label %11, label %31

11:                                               ; preds = %6
  call void @llvm.aie2p.acquire(i32 48, i32 -1)
  %12 = sext i32 %8 to i64
  switch i64 %12, label %13 [
    i64 0, label %34
    i64 1, label %36
  ]

13:                                               ; preds = %34, %36, %11
  %14 = phi ptr [ %37, %36 ], [ %35, %34 ], [ @of_2_join_0_0_buff_0, %11 ]
  %15 = getelementptr [1 x [256 x bfloat]], ptr %14, i32 0, i32 0, i32 0
  br label %16

16:                                               ; preds = %13
  call void @llvm.aie2p.acquire(i32 51, i32 -1)
  %17 = sext i32 %9 to i64
  switch i64 %17, label %18 [
    i64 0, label %38
    i64 1, label %40
  ]

18:                                               ; preds = %38, %40, %16
  %19 = phi ptr [ %41, %40 ], [ %39, %38 ], [ @of_1_distribute_0_0_cons_buff_0, %16 ]
  %20 = getelementptr [1 x [256 x bfloat]], ptr %19, i32 0, i32 0, i32 0
  br label %21

21:                                               ; preds = %18
  %22 = trunc i64 %7 to i32
  %23 = mul i32 %22, 4
  call void @op1_softmax_rows_causal_bf16(ptr %20, ptr %15, i32 1, i32 256, i32 %23)
  call void @llvm.aie2p.release(i32 50, i32 1)
  %24 = add i32 %9, 1
  %25 = icmp sge i32 %24, 2
  %26 = select i1 %25, i32 0, i32 %24
  call void @llvm.aie2p.release(i32 49, i32 1)
  %27 = add i32 %8, 1
  %28 = icmp sge i32 %27, 2
  %29 = select i1 %28, i32 0, i32 %27
  %30 = add i64 %7, 1
  br label %6

31:                                               ; preds = %6
  %32 = add i64 %2, 1
  br label %1

33:                                               ; preds = %1
  ret void

34:                                               ; preds = %11
  %35 = phi ptr [ @of_2_join_0_0_buff_0, %11 ]
  br label %13

36:                                               ; preds = %11
  %37 = phi ptr [ @of_2_join_0_0_buff_1, %11 ]
  br label %13

38:                                               ; preds = %16
  %39 = phi ptr [ @of_1_distribute_0_0_cons_buff_0, %16 ]
  br label %18

40:                                               ; preds = %16
  %41 = phi ptr [ @of_1_distribute_0_0_cons_buff_1, %16 ]
  br label %18
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
