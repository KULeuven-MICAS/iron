; ModuleID = '/home/micas/iron-stream-dse/experiments/perf_base/stream_s256_e512_h2048/swiglu_prefill_stream_k5_m256_e512_h2048_shared_fused.mlir.d/peano-linked_op3__SwiGLUStreamGroup_core_1_2.ll'
source_filename = "LLVMDialectModule"
target datalayout = "e-m:e-p:20:32-i1:8:32-i8:8:32-i16:16:32-i32:32:32-f32:32:32-i64:32-f64:32-a:0:32-n32"
target triple = "aie2p"

@of_2_broadcast_0_0_1_cons_buff_1 = external global [64 x [64 x bfloat]]
@of_2_broadcast_0_0_1_cons_buff_0 = external global [64 x [64 x bfloat]]
@of_3_broadcast_1_0_0_cons_buff_1 = external global [64 x [64 x bfloat]]
@of_3_broadcast_1_0_0_cons_buff_0 = external global [64 x [64 x bfloat]]
@of_4_join_1_0_buff_1 = external global [64 x [64 x bfloat]]
@of_4_join_1_0_buff_0 = external global [64 x [64 x bfloat]]

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.aie2p.acquire(i32, i32) #0

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.aie2p.release(i32, i32) #0

declare void @op3_zero_bf16_64_64_64(ptr) local_unnamed_addr

declare void @op3_matmul_bf16_bf16_64_64_64(ptr, ptr, ptr) local_unnamed_addr

define void @core_1_2() local_unnamed_addr {
  br label %1

1:                                                ; preds = %0, %41
  %2 = phi i32 [ 0, %0 ], [ %35, %41 ]
  %3 = phi i32 [ 0, %0 ], [ %38, %41 ]
  %4 = phi i32 [ 0, %0 ], [ %44, %41 ]
  %5 = phi i64 [ 0, %0 ], [ %45, %41 ]
  tail call void @llvm.aie2p.acquire(i32 48, i32 -1)
  %cond = icmp eq i32 %4, 1
  %spec.select = select i1 %cond, ptr @of_4_join_1_0_buff_1, ptr @of_4_join_1_0_buff_0
  tail call void @op3_zero_bf16_64_64_64(ptr nonnull %spec.select)
  br label %6

6:                                                ; preds = %6, %1
  %7 = phi i32 [ %2, %1 ], [ %35, %6 ]
  %8 = phi i32 [ %3, %1 ], [ %38, %6 ]
  %9 = phi i64 [ 0, %1 ], [ %39, %6 ]
  tail call void @llvm.aie2p.acquire(i32 51, i32 -1)
  %cond1 = icmp eq i32 %8, 1
  %spec.select4 = select i1 %cond1, ptr @of_3_broadcast_1_0_0_cons_buff_1, ptr @of_3_broadcast_1_0_0_cons_buff_0
  tail call void @llvm.aie2p.acquire(i32 53, i32 -1)
  %cond2 = icmp eq i32 %7, 1
  %10 = select i1 %cond2, ptr @of_2_broadcast_0_0_1_cons_buff_1, ptr @of_2_broadcast_0_0_1_cons_buff_0
  tail call void @op3_matmul_bf16_bf16_64_64_64(ptr nonnull %10, ptr nonnull %spec.select4, ptr nonnull %spec.select)
  tail call void @llvm.aie2p.release(i32 52, i32 1)
  %11 = add i32 %7, 1
  %12 = icmp sgt i32 %11, 1
  %13 = select i1 %12, i32 0, i32 %11
  tail call void @llvm.aie2p.release(i32 50, i32 1)
  %14 = add i32 %8, 1
  %15 = icmp sgt i32 %14, 1
  %16 = select i1 %15, i32 0, i32 %14
  tail call void @llvm.aie2p.acquire(i32 51, i32 -1)
  %cond1.1 = icmp eq i32 %16, 1
  %spec.select4.1 = select i1 %cond1.1, ptr @of_3_broadcast_1_0_0_cons_buff_1, ptr @of_3_broadcast_1_0_0_cons_buff_0
  tail call void @llvm.aie2p.acquire(i32 53, i32 -1)
  %cond2.1 = icmp eq i32 %13, 1
  %17 = select i1 %cond2.1, ptr @of_2_broadcast_0_0_1_cons_buff_1, ptr @of_2_broadcast_0_0_1_cons_buff_0
  tail call void @op3_matmul_bf16_bf16_64_64_64(ptr nonnull %17, ptr nonnull %spec.select4.1, ptr nonnull %spec.select)
  tail call void @llvm.aie2p.release(i32 52, i32 1)
  %18 = add i32 %13, 1
  %19 = icmp sgt i32 %18, 1
  %20 = select i1 %19, i32 0, i32 %18
  tail call void @llvm.aie2p.release(i32 50, i32 1)
  %21 = add i32 %16, 1
  %22 = icmp sgt i32 %21, 1
  %23 = select i1 %22, i32 0, i32 %21
  tail call void @llvm.aie2p.acquire(i32 51, i32 -1)
  %cond1.2 = icmp eq i32 %23, 1
  %spec.select4.2 = select i1 %cond1.2, ptr @of_3_broadcast_1_0_0_cons_buff_1, ptr @of_3_broadcast_1_0_0_cons_buff_0
  tail call void @llvm.aie2p.acquire(i32 53, i32 -1)
  %cond2.2 = icmp eq i32 %20, 1
  %24 = select i1 %cond2.2, ptr @of_2_broadcast_0_0_1_cons_buff_1, ptr @of_2_broadcast_0_0_1_cons_buff_0
  tail call void @op3_matmul_bf16_bf16_64_64_64(ptr nonnull %24, ptr nonnull %spec.select4.2, ptr nonnull %spec.select)
  tail call void @llvm.aie2p.release(i32 52, i32 1)
  %25 = add i32 %20, 1
  %26 = icmp sgt i32 %25, 1
  %27 = select i1 %26, i32 0, i32 %25
  tail call void @llvm.aie2p.release(i32 50, i32 1)
  %28 = add i32 %23, 1
  %29 = icmp sgt i32 %28, 1
  %30 = select i1 %29, i32 0, i32 %28
  %31 = or disjoint i64 %9, 3
  tail call void @llvm.aie2p.acquire(i32 51, i32 -1)
  %cond1.3 = icmp eq i32 %30, 1
  %spec.select4.3 = select i1 %cond1.3, ptr @of_3_broadcast_1_0_0_cons_buff_1, ptr @of_3_broadcast_1_0_0_cons_buff_0
  tail call void @llvm.aie2p.acquire(i32 53, i32 -1)
  %cond2.3 = icmp eq i32 %27, 1
  %32 = select i1 %cond2.3, ptr @of_2_broadcast_0_0_1_cons_buff_1, ptr @of_2_broadcast_0_0_1_cons_buff_0
  tail call void @op3_matmul_bf16_bf16_64_64_64(ptr nonnull %32, ptr nonnull %spec.select4.3, ptr nonnull %spec.select)
  tail call void @llvm.aie2p.release(i32 52, i32 1)
  %33 = add i32 %27, 1
  %34 = icmp sgt i32 %33, 1
  %35 = select i1 %34, i32 0, i32 %33
  tail call void @llvm.aie2p.release(i32 50, i32 1)
  %36 = add i32 %30, 1
  %37 = icmp sgt i32 %36, 1
  %38 = select i1 %37, i32 0, i32 %36
  %39 = add nuw nsw i64 %9, 4
  %40 = icmp samesign ult i64 %31, 31
  br i1 %40, label %6, label %41

41:                                               ; preds = %6
  tail call void @llvm.aie2p.release(i32 49, i32 1)
  %42 = add i32 %4, 1
  %43 = icmp sgt i32 %42, 1
  %44 = select i1 %43, i32 0, i32 %42
  %45 = add nuw nsw i64 %5, 1
  %46 = icmp samesign ult i64 %5, 4294967294
  br i1 %46, label %1, label %47

47:                                               ; preds = %41
  ret void
}

attributes #0 = { mustprogress nocallback nofree nosync nounwind willreturn }

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
