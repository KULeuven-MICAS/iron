; ModuleID = '/home/micas/iron-stream-dse/experiments/fable_final/sw_stream/stream_s1024_e512_h2048/swiglu_prefill_stream_k5_m1024_e512_h2048_shared_fused.mlir.d/peano-linked_op3__SwiGLUStreamGroup_core_7_2.ll'
source_filename = "LLVMDialectModule"
target datalayout = "e-m:e-p:20:32-i1:8:32-i8:8:32-i16:16:32-i32:32:32-f32:32:32-i64:32-f64:32-a:0:32-n32"
target triple = "aie2p"

@of_2_broadcast_0_0_7_cons_buff_1 = external global [64 x [64 x bfloat]]
@of_2_broadcast_0_0_7_cons_buff_0 = external global [64 x [64 x bfloat]]
@of_3_broadcast_7_0_0_cons_buff_1 = external global [64 x [64 x bfloat]]
@of_3_broadcast_7_0_0_cons_buff_0 = external global [64 x [64 x bfloat]]
@of_4_join_7_0_buff_1 = external global [64 x [64 x bfloat]]
@of_4_join_7_0_buff_0 = external global [64 x [64 x bfloat]]

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.aie2p.acquire(i32, i32) #0

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.aie2p.release(i32, i32) #0

declare void @op3_zero_bf16_64_64_64(ptr) local_unnamed_addr

declare void @op3_matmul_bf16_bf16_64_64_64(ptr, ptr, ptr) local_unnamed_addr

define void @core_7_2() local_unnamed_addr {
  br label %.preheader

.preheader:                                       ; preds = %0, %51
  %1 = phi i32 [ 0, %0 ], [ %39, %51 ]
  %2 = phi i32 [ 0, %0 ], [ %42, %51 ]
  %3 = phi i32 [ 0, %0 ], [ %48, %51 ]
  %4 = phi i64 [ 0, %0 ], [ %52, %51 ]
  br label %5

5:                                                ; preds = %.preheader, %45
  %6 = phi i32 [ %1, %.preheader ], [ %39, %45 ]
  %7 = phi i32 [ %2, %.preheader ], [ %42, %45 ]
  %8 = phi i32 [ %3, %.preheader ], [ %48, %45 ]
  %9 = phi i64 [ 0, %.preheader ], [ %49, %45 ]
  tail call void @llvm.aie2p.acquire(i32 48, i32 -1)
  %cond = icmp eq i32 %8, 1
  %spec.select = select i1 %cond, ptr @of_4_join_7_0_buff_1, ptr @of_4_join_7_0_buff_0
  tail call void @op3_zero_bf16_64_64_64(ptr nonnull %spec.select)
  br label %10

10:                                               ; preds = %10, %5
  %11 = phi i32 [ %6, %5 ], [ %39, %10 ]
  %12 = phi i32 [ %7, %5 ], [ %42, %10 ]
  %13 = phi i64 [ 0, %5 ], [ %43, %10 ]
  tail call void @llvm.aie2p.acquire(i32 51, i32 -1)
  %cond1 = icmp eq i32 %12, 1
  %spec.select4 = select i1 %cond1, ptr @of_3_broadcast_7_0_0_cons_buff_1, ptr @of_3_broadcast_7_0_0_cons_buff_0
  tail call void @llvm.aie2p.acquire(i32 53, i32 -1)
  %cond2 = icmp eq i32 %11, 1
  %14 = select i1 %cond2, ptr @of_2_broadcast_0_0_7_cons_buff_1, ptr @of_2_broadcast_0_0_7_cons_buff_0
  tail call void @op3_matmul_bf16_bf16_64_64_64(ptr nonnull %14, ptr nonnull %spec.select4, ptr nonnull %spec.select)
  tail call void @llvm.aie2p.release(i32 52, i32 1)
  %15 = add i32 %11, 1
  %16 = icmp sgt i32 %15, 1
  %17 = select i1 %16, i32 0, i32 %15
  tail call void @llvm.aie2p.release(i32 50, i32 1)
  %18 = add i32 %12, 1
  %19 = icmp sgt i32 %18, 1
  %20 = select i1 %19, i32 0, i32 %18
  tail call void @llvm.aie2p.acquire(i32 51, i32 -1)
  %cond1.1 = icmp eq i32 %20, 1
  %spec.select4.1 = select i1 %cond1.1, ptr @of_3_broadcast_7_0_0_cons_buff_1, ptr @of_3_broadcast_7_0_0_cons_buff_0
  tail call void @llvm.aie2p.acquire(i32 53, i32 -1)
  %cond2.1 = icmp eq i32 %17, 1
  %21 = select i1 %cond2.1, ptr @of_2_broadcast_0_0_7_cons_buff_1, ptr @of_2_broadcast_0_0_7_cons_buff_0
  tail call void @op3_matmul_bf16_bf16_64_64_64(ptr nonnull %21, ptr nonnull %spec.select4.1, ptr nonnull %spec.select)
  tail call void @llvm.aie2p.release(i32 52, i32 1)
  %22 = add i32 %17, 1
  %23 = icmp sgt i32 %22, 1
  %24 = select i1 %23, i32 0, i32 %22
  tail call void @llvm.aie2p.release(i32 50, i32 1)
  %25 = add i32 %20, 1
  %26 = icmp sgt i32 %25, 1
  %27 = select i1 %26, i32 0, i32 %25
  tail call void @llvm.aie2p.acquire(i32 51, i32 -1)
  %cond1.2 = icmp eq i32 %27, 1
  %spec.select4.2 = select i1 %cond1.2, ptr @of_3_broadcast_7_0_0_cons_buff_1, ptr @of_3_broadcast_7_0_0_cons_buff_0
  tail call void @llvm.aie2p.acquire(i32 53, i32 -1)
  %cond2.2 = icmp eq i32 %24, 1
  %28 = select i1 %cond2.2, ptr @of_2_broadcast_0_0_7_cons_buff_1, ptr @of_2_broadcast_0_0_7_cons_buff_0
  tail call void @op3_matmul_bf16_bf16_64_64_64(ptr nonnull %28, ptr nonnull %spec.select4.2, ptr nonnull %spec.select)
  tail call void @llvm.aie2p.release(i32 52, i32 1)
  %29 = add i32 %24, 1
  %30 = icmp sgt i32 %29, 1
  %31 = select i1 %30, i32 0, i32 %29
  tail call void @llvm.aie2p.release(i32 50, i32 1)
  %32 = add i32 %27, 1
  %33 = icmp sgt i32 %32, 1
  %34 = select i1 %33, i32 0, i32 %32
  %35 = or disjoint i64 %13, 3
  tail call void @llvm.aie2p.acquire(i32 51, i32 -1)
  %cond1.3 = icmp eq i32 %34, 1
  %spec.select4.3 = select i1 %cond1.3, ptr @of_3_broadcast_7_0_0_cons_buff_1, ptr @of_3_broadcast_7_0_0_cons_buff_0
  tail call void @llvm.aie2p.acquire(i32 53, i32 -1)
  %cond2.3 = icmp eq i32 %31, 1
  %36 = select i1 %cond2.3, ptr @of_2_broadcast_0_0_7_cons_buff_1, ptr @of_2_broadcast_0_0_7_cons_buff_0
  tail call void @op3_matmul_bf16_bf16_64_64_64(ptr nonnull %36, ptr nonnull %spec.select4.3, ptr nonnull %spec.select)
  tail call void @llvm.aie2p.release(i32 52, i32 1)
  %37 = add i32 %31, 1
  %38 = icmp sgt i32 %37, 1
  %39 = select i1 %38, i32 0, i32 %37
  tail call void @llvm.aie2p.release(i32 50, i32 1)
  %40 = add i32 %34, 1
  %41 = icmp sgt i32 %40, 1
  %42 = select i1 %41, i32 0, i32 %40
  %43 = add nuw nsw i64 %13, 4
  %44 = icmp samesign ult i64 %35, 31
  br i1 %44, label %10, label %45

45:                                               ; preds = %10
  tail call void @llvm.aie2p.release(i32 49, i32 1)
  %46 = add i32 %8, 1
  %47 = icmp sgt i32 %46, 1
  %48 = select i1 %47, i32 0, i32 %46
  %49 = add nuw nsw i64 %9, 1
  %50 = icmp samesign ult i64 %9, 3
  br i1 %50, label %5, label %51

51:                                               ; preds = %45
  %52 = add nuw nsw i64 %4, 1
  %53 = icmp samesign ult i64 %4, 4294967294
  br i1 %53, label %.preheader, label %54

54:                                               ; preds = %51
  ret void
}

attributes #0 = { mustprogress nocallback nofree nosync nounwind willreturn }

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
