; ModuleID = '/home/micas/iron-stream-dse/experiments/headscale/hs_k3_s256_h1/mha_prefill_stream_k3_h1_s256_d64_causal_shared_fused.mlir.d/peano-linked_op1__MHAStreamGroup_core_0_3.ll'
source_filename = "LLVMDialectModule"
target datalayout = "e-m:e-p:20:32-i1:8:32-i8:8:32-i16:16:32-i32:32:32-f32:32:32-i64:32-f64:32-a:0:32-n32"
target triple = "aie2p"

@of_1_distribute_0_1_cons_buff_1 = external global [1 x [256 x bfloat]]
@of_1_distribute_0_1_cons_buff_0 = external global [1 x [256 x bfloat]]
@of_2_join_0_1_buff_1 = external global [1 x [256 x bfloat]]
@of_2_join_0_1_buff_0 = external global [1 x [256 x bfloat]]

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.aie2p.acquire(i32, i32) #0

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.aie2p.release(i32, i32) #0

declare void @op1_softmax_rows_causal_bf16(ptr, ptr, i32, i32, i32) local_unnamed_addr

define void @core_0_3() local_unnamed_addr {
  br label %.preheader

.preheader:                                       ; preds = %0, %51
  %1 = phi i32 [ 0, %0 ], [ %45, %51 ]
  %2 = phi i32 [ 0, %0 ], [ %48, %51 ]
  %3 = phi i64 [ 0, %0 ], [ %52, %51 ]
  br label %4

4:                                                ; preds = %4, %.preheader
  %5 = phi i32 [ %1, %.preheader ], [ %45, %4 ]
  %6 = phi i32 [ %2, %.preheader ], [ %48, %4 ]
  %7 = phi i64 [ 0, %.preheader ], [ %49, %4 ]
  tail call void @llvm.aie2p.acquire(i32 48, i32 -1)
  %cond = icmp eq i32 %6, 1
  %spec.select = select i1 %cond, ptr @of_2_join_0_1_buff_1, ptr @of_2_join_0_1_buff_0
  tail call void @llvm.aie2p.acquire(i32 51, i32 -1)
  %cond1 = icmp eq i32 %5, 1
  %8 = select i1 %cond1, ptr @of_1_distribute_0_1_cons_buff_1, ptr @of_1_distribute_0_1_cons_buff_0
  %9 = trunc nuw nsw i64 %7 to i32
  %10 = shl nuw nsw i32 %9, 2
  %11 = or disjoint i32 %10, 1
  tail call void @op1_softmax_rows_causal_bf16(ptr nonnull %8, ptr nonnull %spec.select, i32 1, i32 256, i32 %11)
  tail call void @llvm.aie2p.release(i32 50, i32 1)
  %12 = add i32 %5, 1
  %13 = icmp sgt i32 %12, 1
  %14 = select i1 %13, i32 0, i32 %12
  tail call void @llvm.aie2p.release(i32 49, i32 1)
  %15 = add i32 %6, 1
  %16 = icmp sgt i32 %15, 1
  %17 = select i1 %16, i32 0, i32 %15
  tail call void @llvm.aie2p.acquire(i32 48, i32 -1)
  %cond.1 = icmp eq i32 %17, 1
  %spec.select.1 = select i1 %cond.1, ptr @of_2_join_0_1_buff_1, ptr @of_2_join_0_1_buff_0
  tail call void @llvm.aie2p.acquire(i32 51, i32 -1)
  %cond1.1 = icmp eq i32 %14, 1
  %18 = select i1 %cond1.1, ptr @of_1_distribute_0_1_cons_buff_1, ptr @of_1_distribute_0_1_cons_buff_0
  %19 = trunc i64 %7 to i32
  %20 = shl i32 %19, 2
  %21 = or disjoint i32 %20, 5
  tail call void @op1_softmax_rows_causal_bf16(ptr nonnull %18, ptr nonnull %spec.select.1, i32 1, i32 256, i32 %21)
  tail call void @llvm.aie2p.release(i32 50, i32 1)
  %22 = add i32 %14, 1
  %23 = icmp sgt i32 %22, 1
  %24 = select i1 %23, i32 0, i32 %22
  tail call void @llvm.aie2p.release(i32 49, i32 1)
  %25 = add i32 %17, 1
  %26 = icmp sgt i32 %25, 1
  %27 = select i1 %26, i32 0, i32 %25
  tail call void @llvm.aie2p.acquire(i32 48, i32 -1)
  %cond.2 = icmp eq i32 %27, 1
  %spec.select.2 = select i1 %cond.2, ptr @of_2_join_0_1_buff_1, ptr @of_2_join_0_1_buff_0
  tail call void @llvm.aie2p.acquire(i32 51, i32 -1)
  %cond1.2 = icmp eq i32 %24, 1
  %28 = select i1 %cond1.2, ptr @of_1_distribute_0_1_cons_buff_1, ptr @of_1_distribute_0_1_cons_buff_0
  %29 = trunc i64 %7 to i32
  %30 = shl i32 %29, 2
  %31 = or disjoint i32 %30, 9
  tail call void @op1_softmax_rows_causal_bf16(ptr nonnull %28, ptr nonnull %spec.select.2, i32 1, i32 256, i32 %31)
  tail call void @llvm.aie2p.release(i32 50, i32 1)
  %32 = add i32 %24, 1
  %33 = icmp sgt i32 %32, 1
  %34 = select i1 %33, i32 0, i32 %32
  tail call void @llvm.aie2p.release(i32 49, i32 1)
  %35 = add i32 %27, 1
  %36 = icmp sgt i32 %35, 1
  %37 = select i1 %36, i32 0, i32 %35
  %38 = or disjoint i64 %7, 3
  tail call void @llvm.aie2p.acquire(i32 48, i32 -1)
  %cond.3 = icmp eq i32 %37, 1
  %spec.select.3 = select i1 %cond.3, ptr @of_2_join_0_1_buff_1, ptr @of_2_join_0_1_buff_0
  tail call void @llvm.aie2p.acquire(i32 51, i32 -1)
  %cond1.3 = icmp eq i32 %34, 1
  %39 = select i1 %cond1.3, ptr @of_1_distribute_0_1_cons_buff_1, ptr @of_1_distribute_0_1_cons_buff_0
  %40 = trunc nuw nsw i64 %38 to i32
  %41 = shl nuw nsw i32 %40, 2
  %42 = or disjoint i32 %41, 1
  tail call void @op1_softmax_rows_causal_bf16(ptr nonnull %39, ptr nonnull %spec.select.3, i32 1, i32 256, i32 %42)
  tail call void @llvm.aie2p.release(i32 50, i32 1)
  %43 = add i32 %34, 1
  %44 = icmp sgt i32 %43, 1
  %45 = select i1 %44, i32 0, i32 %43
  tail call void @llvm.aie2p.release(i32 49, i32 1)
  %46 = add i32 %37, 1
  %47 = icmp sgt i32 %46, 1
  %48 = select i1 %47, i32 0, i32 %46
  %49 = add nuw nsw i64 %7, 4
  %50 = icmp samesign ult i64 %38, 63
  br i1 %50, label %4, label %51

51:                                               ; preds = %4
  %52 = add nuw nsw i64 %3, 1
  %53 = icmp samesign ult i64 %3, 4294967294
  br i1 %53, label %.preheader, label %54

54:                                               ; preds = %51
  ret void
}

attributes #0 = { mustprogress nocallback nofree nosync nounwind willreturn }

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
