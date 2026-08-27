; ModuleID = '/home/micas/iron-stream-dse/experiments/v_wide/mha_prefill_stream_k1_h2_s2048_d64_flash_shared_fused.mlir.d/peano-linked_op0__MHAStreamGroup_core_1_5.ll'
source_filename = "LLVMDialectModule"
target datalayout = "e-m:e-p:20:32-i1:8:32-i8:8:32-i16:16:32-i32:32:32-f32:32:32-i64:32-f64:32-a:0:32-n32"
target triple = "aie2p"

@of_3_unicast_1_0_cons_buff_1 = external global [64 x [64 x bfloat]]
@of_3_unicast_1_0_cons_buff_0 = external global [64 x [64 x bfloat]]
@of_4_broadcast_0_0_1_cons_buff_1 = external global [64 x [64 x bfloat]]
@of_4_broadcast_0_0_1_cons_buff_0 = external global [64 x [64 x bfloat]]
@of_6_unicast_1_buff_1 = external global [64 x [64 x bfloat]]
@of_6_unicast_1_buff_0 = external global [64 x [64 x bfloat]]

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.aie2p.acquire(i32, i32) #0

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.aie2p.release(i32, i32) #0

declare void @op0_zero_bf16_64_64_64(ptr) local_unnamed_addr

declare void @op0_matmul_bf16_bf16_64_64_64(ptr, ptr, ptr) local_unnamed_addr

define void @core_1_5() local_unnamed_addr {
  br label %.preheader

.preheader:                                       ; preds = %0, %36
  %1 = phi i32 [ 0, %0 ], [ %24, %36 ]
  %2 = phi i32 [ 0, %0 ], [ %30, %36 ]
  %3 = phi i64 [ 0, %0 ], [ %37, %36 ]
  br label %4

4:                                                ; preds = %.preheader, %33
  %5 = phi i32 [ %1, %.preheader ], [ %24, %33 ]
  %6 = phi i32 [ %2, %.preheader ], [ %30, %33 ]
  %7 = phi i64 [ 0, %.preheader ], [ %34, %33 ]
  tail call void @llvm.aie2p.acquire(i32 53, i32 -2)
  br label %8

8:                                                ; preds = %4, %27
  %9 = phi i32 [ %5, %4 ], [ %24, %27 ]
  %10 = phi i32 [ %6, %4 ], [ %30, %27 ]
  %11 = phi i64 [ 0, %4 ], [ %31, %27 ]
  tail call void @llvm.aie2p.acquire(i32 51, i32 -1)
  %cond = icmp eq i32 %10, 1
  %spec.select = select i1 %cond, ptr @of_4_broadcast_0_0_1_cons_buff_1, ptr @of_4_broadcast_0_0_1_cons_buff_0
  %12 = trunc nuw nsw i64 %11 to i32
  br label %13

13:                                               ; preds = %8, %21
  %14 = phi i32 [ %9, %8 ], [ %24, %21 ]
  %15 = phi i64 [ 0, %8 ], [ %25, %21 ]
  tail call void @llvm.aie2p.acquire(i32 48, i32 -1)
  %cond1 = icmp eq i32 %14, 1
  %spec.select5 = select i1 %cond1, ptr @of_6_unicast_1_buff_1, ptr @of_6_unicast_1_buff_0
  tail call void @op0_zero_bf16_64_64_64(ptr nonnull %spec.select5)
  %16 = trunc nuw nsw i64 %15 to i32
  %17 = mul nuw nsw i32 %16, 17
  %18 = add nuw nsw i32 %17, 2
  %.not = icmp slt i32 %18, %12
  br i1 %.not, label %21, label %19

19:                                               ; preds = %13
  %cond2 = icmp eq i64 %15, 1
  %20 = select i1 %cond2, ptr @of_3_unicast_1_0_cons_buff_1, ptr @of_3_unicast_1_0_cons_buff_0
  tail call void @op0_matmul_bf16_bf16_64_64_64(ptr nonnull %20, ptr nonnull %spec.select, ptr nonnull %spec.select5)
  br label %21

21:                                               ; preds = %19, %13
  tail call void @llvm.aie2p.release(i32 49, i32 1)
  %22 = add i32 %14, 1
  %23 = icmp sgt i32 %22, 1
  %24 = select i1 %23, i32 0, i32 %22
  %25 = add nuw nsw i64 %15, 1
  %26 = icmp eq i64 %15, 0
  br i1 %26, label %13, label %27

27:                                               ; preds = %21
  tail call void @llvm.aie2p.release(i32 50, i32 1)
  %28 = add i32 %10, 1
  %29 = icmp sgt i32 %28, 1
  %30 = select i1 %29, i32 0, i32 %28
  %31 = add nuw nsw i64 %11, 1
  %32 = icmp samesign ult i64 %11, 31
  br i1 %32, label %8, label %33

33:                                               ; preds = %27
  tail call void @llvm.aie2p.release(i32 52, i32 2)
  %34 = add nuw nsw i64 %7, 1
  %35 = icmp eq i64 %7, 0
  br i1 %35, label %4, label %36

36:                                               ; preds = %33
  %37 = add nuw nsw i64 %3, 1
  %38 = icmp samesign ult i64 %3, 4294967294
  br i1 %38, label %.preheader, label %39

39:                                               ; preds = %36
  ret void
}

attributes #0 = { mustprogress nocallback nofree nosync nounwind willreturn }

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
