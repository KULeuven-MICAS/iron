; ModuleID = '/home/micas/iron-stream-dse/experiments/reorder/ro_group_k3_s256_h8/reorder_group_k3_s256_h8_shared_fused.mlir.d/peano-linked_op1__MHAStreamGroup_core_0_2.ll'
source_filename = "LLVMDialectModule"
target datalayout = "e-m:e-p:20:32-i1:8:32-i8:8:32-i16:16:32-i32:32:32-f32:32:32-i64:32-f64:32-a:0:32-n32"
target triple = "aie2p"

@of_1_distribute_0_0_cons_buff_1 = external global [1 x [256 x bfloat]]
@of_1_distribute_0_0_cons_buff_0 = external global [1 x [256 x bfloat]]
@of_2_join_0_0_buff_1 = external global [1 x [256 x bfloat]]
@of_2_join_0_0_buff_0 = external global [1 x [256 x bfloat]]

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.aie2p.acquire(i32, i32) #0

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.aie2p.release(i32, i32) #0

declare void @op1_softmax_rows_causal_bf16(ptr, ptr, i32, i32, i32) local_unnamed_addr

define void @core_0_2() local_unnamed_addr {
  br label %.preheader

.preheader:                                       ; preds = %0, %49
  %1 = phi i32 [ 0, %0 ], [ %43, %49 ]
  %2 = phi i32 [ 0, %0 ], [ %46, %49 ]
  %3 = phi i64 [ 0, %0 ], [ %50, %49 ]
  br label %4

4:                                                ; preds = %4, %.preheader
  %5 = phi i32 [ %1, %.preheader ], [ %43, %4 ]
  %6 = phi i32 [ %2, %.preheader ], [ %46, %4 ]
  %7 = phi i64 [ 0, %.preheader ], [ %47, %4 ]
  tail call void @llvm.aie2p.acquire(i32 48, i32 -1)
  %cond = icmp eq i32 %6, 1
  %spec.select = select i1 %cond, ptr @of_2_join_0_0_buff_1, ptr @of_2_join_0_0_buff_0
  tail call void @llvm.aie2p.acquire(i32 51, i32 -1)
  %cond1 = icmp eq i32 %5, 1
  %8 = select i1 %cond1, ptr @of_1_distribute_0_0_cons_buff_1, ptr @of_1_distribute_0_0_cons_buff_0
  %9 = trunc nuw nsw i64 %7 to i32
  %10 = shl nuw nsw i32 %9, 2
  tail call void @op1_softmax_rows_causal_bf16(ptr nonnull %8, ptr nonnull %spec.select, i32 1, i32 256, i32 %10)
  tail call void @llvm.aie2p.release(i32 50, i32 1)
  %11 = add i32 %5, 1
  %12 = icmp sgt i32 %11, 1
  %13 = select i1 %12, i32 0, i32 %11
  tail call void @llvm.aie2p.release(i32 49, i32 1)
  %14 = add i32 %6, 1
  %15 = icmp sgt i32 %14, 1
  %16 = select i1 %15, i32 0, i32 %14
  tail call void @llvm.aie2p.acquire(i32 48, i32 -1)
  %cond.1 = icmp eq i32 %16, 1
  %spec.select.1 = select i1 %cond.1, ptr @of_2_join_0_0_buff_1, ptr @of_2_join_0_0_buff_0
  tail call void @llvm.aie2p.acquire(i32 51, i32 -1)
  %cond1.1 = icmp eq i32 %13, 1
  %17 = select i1 %cond1.1, ptr @of_1_distribute_0_0_cons_buff_1, ptr @of_1_distribute_0_0_cons_buff_0
  %18 = trunc i64 %7 to i32
  %19 = shl i32 %18, 2
  %20 = or disjoint i32 %19, 4
  tail call void @op1_softmax_rows_causal_bf16(ptr nonnull %17, ptr nonnull %spec.select.1, i32 1, i32 256, i32 %20)
  tail call void @llvm.aie2p.release(i32 50, i32 1)
  %21 = add i32 %13, 1
  %22 = icmp sgt i32 %21, 1
  %23 = select i1 %22, i32 0, i32 %21
  tail call void @llvm.aie2p.release(i32 49, i32 1)
  %24 = add i32 %16, 1
  %25 = icmp sgt i32 %24, 1
  %26 = select i1 %25, i32 0, i32 %24
  tail call void @llvm.aie2p.acquire(i32 48, i32 -1)
  %cond.2 = icmp eq i32 %26, 1
  %spec.select.2 = select i1 %cond.2, ptr @of_2_join_0_0_buff_1, ptr @of_2_join_0_0_buff_0
  tail call void @llvm.aie2p.acquire(i32 51, i32 -1)
  %cond1.2 = icmp eq i32 %23, 1
  %27 = select i1 %cond1.2, ptr @of_1_distribute_0_0_cons_buff_1, ptr @of_1_distribute_0_0_cons_buff_0
  %28 = trunc i64 %7 to i32
  %29 = shl i32 %28, 2
  %30 = or disjoint i32 %29, 8
  tail call void @op1_softmax_rows_causal_bf16(ptr nonnull %27, ptr nonnull %spec.select.2, i32 1, i32 256, i32 %30)
  tail call void @llvm.aie2p.release(i32 50, i32 1)
  %31 = add i32 %23, 1
  %32 = icmp sgt i32 %31, 1
  %33 = select i1 %32, i32 0, i32 %31
  tail call void @llvm.aie2p.release(i32 49, i32 1)
  %34 = add i32 %26, 1
  %35 = icmp sgt i32 %34, 1
  %36 = select i1 %35, i32 0, i32 %34
  %37 = or disjoint i64 %7, 3
  tail call void @llvm.aie2p.acquire(i32 48, i32 -1)
  %cond.3 = icmp eq i32 %36, 1
  %spec.select.3 = select i1 %cond.3, ptr @of_2_join_0_0_buff_1, ptr @of_2_join_0_0_buff_0
  tail call void @llvm.aie2p.acquire(i32 51, i32 -1)
  %cond1.3 = icmp eq i32 %33, 1
  %38 = select i1 %cond1.3, ptr @of_1_distribute_0_0_cons_buff_1, ptr @of_1_distribute_0_0_cons_buff_0
  %39 = trunc nuw nsw i64 %37 to i32
  %40 = shl nuw nsw i32 %39, 2
  tail call void @op1_softmax_rows_causal_bf16(ptr nonnull %38, ptr nonnull %spec.select.3, i32 1, i32 256, i32 %40)
  tail call void @llvm.aie2p.release(i32 50, i32 1)
  %41 = add i32 %33, 1
  %42 = icmp sgt i32 %41, 1
  %43 = select i1 %42, i32 0, i32 %41
  tail call void @llvm.aie2p.release(i32 49, i32 1)
  %44 = add i32 %36, 1
  %45 = icmp sgt i32 %44, 1
  %46 = select i1 %45, i32 0, i32 %44
  %47 = add nuw nsw i64 %7, 4
  %48 = icmp samesign ult i64 %37, 63
  br i1 %48, label %4, label %49

49:                                               ; preds = %4
  %50 = add nuw nsw i64 %3, 1
  %51 = icmp samesign ult i64 %3, 4294967294
  br i1 %51, label %.preheader, label %52

52:                                               ; preds = %49
  ret void
}

attributes #0 = { mustprogress nocallback nofree nosync nounwind willreturn }

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
