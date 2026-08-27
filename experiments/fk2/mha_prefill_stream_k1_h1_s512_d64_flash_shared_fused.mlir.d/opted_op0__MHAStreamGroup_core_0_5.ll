; ModuleID = '/home/micas/iron-stream-dse/experiments/fk2/mha_prefill_stream_k1_h1_s512_d64_flash_shared_fused.mlir.d/peano-linked_op0__MHAStreamGroup_core_0_5.ll'
source_filename = "LLVMDialectModule"
target datalayout = "e-m:e-p:20:32-i1:8:32-i8:8:32-i16:16:32-i32:32:32-f32:32:32-i64:32-f64:32-a:0:32-n32"
target triple = "aie2p"

@of_3_unicast_0_0_cons_buff_1 = external global [64 x [64 x bfloat]]
@of_3_unicast_0_0_cons_buff_0 = external global [64 x [64 x bfloat]]
@of_4_broadcast_0_0_0_cons_buff_1 = external global [64 x [64 x bfloat]]
@of_4_broadcast_0_0_0_cons_buff_0 = external global [64 x [64 x bfloat]]
@of_6_unicast_0_buff_1 = external global [64 x [64 x bfloat]]
@of_6_unicast_0_buff_0 = external global [64 x [64 x bfloat]]

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.aie2p.acquire(i32, i32) #0

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.aie2p.release(i32, i32) #0

declare void @op0_zero_bf16_64_64_64(ptr) local_unnamed_addr

declare void @op0_matmul_bf16_bf16_64_64_64(ptr, ptr, ptr) local_unnamed_addr

define void @core_0_5() local_unnamed_addr {
  br label %.preheader

.preheader:                                       ; preds = %0, %35
  %1 = phi i32 [ 0, %0 ], [ %23, %35 ]
  %2 = phi i32 [ 0, %0 ], [ %29, %35 ]
  %3 = phi i64 [ 0, %0 ], [ %36, %35 ]
  br label %4

4:                                                ; preds = %.preheader, %32
  %5 = phi i32 [ %1, %.preheader ], [ %23, %32 ]
  %6 = phi i32 [ %2, %.preheader ], [ %29, %32 ]
  %7 = phi i64 [ 0, %.preheader ], [ %33, %32 ]
  tail call void @llvm.aie2p.acquire(i32 53, i32 -2)
  br label %8

8:                                                ; preds = %4, %26
  %9 = phi i32 [ %5, %4 ], [ %23, %26 ]
  %10 = phi i32 [ %6, %4 ], [ %29, %26 ]
  %11 = phi i64 [ 0, %4 ], [ %30, %26 ]
  tail call void @llvm.aie2p.acquire(i32 51, i32 -1)
  %cond = icmp eq i32 %10, 1
  %spec.select = select i1 %cond, ptr @of_4_broadcast_0_0_0_cons_buff_1, ptr @of_4_broadcast_0_0_0_cons_buff_0
  %12 = trunc nuw nsw i64 %11 to i32
  br label %13

13:                                               ; preds = %8, %20
  %14 = phi i32 [ %9, %8 ], [ %23, %20 ]
  %15 = phi i64 [ 0, %8 ], [ %24, %20 ]
  tail call void @llvm.aie2p.acquire(i32 48, i32 -1)
  %cond1 = icmp eq i32 %14, 1
  %spec.select5 = select i1 %cond1, ptr @of_6_unicast_0_buff_1, ptr @of_6_unicast_0_buff_0
  tail call void @op0_zero_bf16_64_64_64(ptr nonnull %spec.select5)
  %16 = trunc nuw nsw i64 %15 to i32
  %17 = mul nuw nsw i32 %16, 5
  %.not = icmp slt i32 %17, %12
  br i1 %.not, label %20, label %18

18:                                               ; preds = %13
  %cond2 = icmp eq i64 %15, 1
  %19 = select i1 %cond2, ptr @of_3_unicast_0_0_cons_buff_1, ptr @of_3_unicast_0_0_cons_buff_0
  tail call void @op0_matmul_bf16_bf16_64_64_64(ptr nonnull %19, ptr nonnull %spec.select, ptr nonnull %spec.select5)
  br label %20

20:                                               ; preds = %18, %13
  tail call void @llvm.aie2p.release(i32 49, i32 1)
  %21 = add i32 %14, 1
  %22 = icmp sgt i32 %21, 1
  %23 = select i1 %22, i32 0, i32 %21
  %24 = add nuw nsw i64 %15, 1
  %25 = icmp eq i64 %15, 0
  br i1 %25, label %13, label %26

26:                                               ; preds = %20
  tail call void @llvm.aie2p.release(i32 50, i32 1)
  %27 = add i32 %10, 1
  %28 = icmp sgt i32 %27, 1
  %29 = select i1 %28, i32 0, i32 %27
  %30 = add nuw nsw i64 %11, 1
  %31 = icmp samesign ult i64 %11, 7
  br i1 %31, label %8, label %32

32:                                               ; preds = %26
  tail call void @llvm.aie2p.release(i32 52, i32 2)
  %33 = add nuw nsw i64 %7, 1
  %34 = icmp eq i64 %7, 0
  br i1 %34, label %4, label %35

35:                                               ; preds = %32
  %36 = add nuw nsw i64 %3, 1
  %37 = icmp samesign ult i64 %3, 4294967294
  br i1 %37, label %.preheader, label %38

38:                                               ; preds = %35
  ret void
}

attributes #0 = { mustprogress nocallback nofree nosync nounwind willreturn }

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
