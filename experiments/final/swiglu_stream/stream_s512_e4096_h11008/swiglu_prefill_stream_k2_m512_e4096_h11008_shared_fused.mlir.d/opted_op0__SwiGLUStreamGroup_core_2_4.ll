; ModuleID = '/home/micas/iron-stream-dse/experiments/final/swiglu_stream/stream_s512_e4096_h11008/swiglu_prefill_stream_k2_m512_e4096_h11008_shared_fused.mlir.d/peano-linked_op0__SwiGLUStreamGroup_core_2_4.ll'
source_filename = "LLVMDialectModule"
target datalayout = "e-m:e-p:20:32-i1:8:32-i8:8:32-i16:16:32-i32:32:32-f32:32:32-i64:32-f64:32-a:0:32-n32"
target triple = "aie2p"

@of_3_distribute_0_2_1_cons_buff_1 = external global [32 x [32 x bfloat]]
@of_3_distribute_0_2_1_cons_buff_0 = external global [32 x [32 x bfloat]]
@of_5_broadcast_0_0_2_cons_buff_1 = external global [32 x [64 x bfloat]]
@of_5_broadcast_0_0_2_cons_buff_0 = external global [32 x [64 x bfloat]]
@of_7_switch_join_2_0_buff_1 = external global [32 x [64 x bfloat]]
@of_7_switch_join_2_0_buff_0 = external global [32 x [64 x bfloat]]

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.aie2p.acquire(i32, i32) #0

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.aie2p.release(i32, i32) #0

declare void @op0_zero_bf16_32_32_64(ptr) local_unnamed_addr

declare void @op0_matmul_bf16_bf16_32_32_64(ptr, ptr, ptr) local_unnamed_addr

define void @core_2_4() local_unnamed_addr {
  br label %.preheader5

.preheader5:                                      ; preds = %0, %58
  %1 = phi i32 [ 0, %0 ], [ %43, %58 ]
  %2 = phi i32 [ 0, %0 ], [ %46, %58 ]
  %3 = phi i32 [ 0, %0 ], [ %52, %58 ]
  %4 = phi i64 [ 0, %0 ], [ %59, %58 ]
  br label %.preheader

.preheader:                                       ; preds = %.preheader5, %55
  %5 = phi i32 [ %1, %.preheader5 ], [ %43, %55 ]
  %6 = phi i32 [ %2, %.preheader5 ], [ %46, %55 ]
  %7 = phi i32 [ %3, %.preheader5 ], [ %52, %55 ]
  %8 = phi i64 [ 0, %.preheader5 ], [ %56, %55 ]
  br label %9

9:                                                ; preds = %.preheader, %49
  %10 = phi i32 [ %5, %.preheader ], [ %43, %49 ]
  %11 = phi i32 [ %6, %.preheader ], [ %46, %49 ]
  %12 = phi i32 [ %7, %.preheader ], [ %52, %49 ]
  %13 = phi i64 [ 0, %.preheader ], [ %53, %49 ]
  tail call void @llvm.aie2p.acquire(i32 48, i32 -1)
  %cond = icmp eq i32 %12, 1
  %spec.select = select i1 %cond, ptr @of_7_switch_join_2_0_buff_1, ptr @of_7_switch_join_2_0_buff_0
  tail call void @op0_zero_bf16_32_32_64(ptr nonnull %spec.select)
  br label %14

14:                                               ; preds = %14, %9
  %15 = phi i32 [ %10, %9 ], [ %43, %14 ]
  %16 = phi i32 [ %11, %9 ], [ %46, %14 ]
  %17 = phi i64 [ 0, %9 ], [ %47, %14 ]
  tail call void @llvm.aie2p.acquire(i32 51, i32 -1)
  %cond1 = icmp eq i32 %16, 1
  %spec.select4 = select i1 %cond1, ptr @of_5_broadcast_0_0_2_cons_buff_1, ptr @of_5_broadcast_0_0_2_cons_buff_0
  tail call void @llvm.aie2p.acquire(i32 53, i32 -1)
  %cond2 = icmp eq i32 %15, 1
  %18 = select i1 %cond2, ptr @of_3_distribute_0_2_1_cons_buff_1, ptr @of_3_distribute_0_2_1_cons_buff_0
  tail call void @op0_matmul_bf16_bf16_32_32_64(ptr nonnull %18, ptr nonnull %spec.select4, ptr nonnull %spec.select)
  tail call void @llvm.aie2p.release(i32 52, i32 1)
  %19 = add i32 %15, 1
  %20 = icmp sgt i32 %19, 1
  %21 = select i1 %20, i32 0, i32 %19
  tail call void @llvm.aie2p.release(i32 50, i32 1)
  %22 = add i32 %16, 1
  %23 = icmp sgt i32 %22, 1
  %24 = select i1 %23, i32 0, i32 %22
  tail call void @llvm.aie2p.acquire(i32 51, i32 -1)
  %cond1.1 = icmp eq i32 %24, 1
  %spec.select4.1 = select i1 %cond1.1, ptr @of_5_broadcast_0_0_2_cons_buff_1, ptr @of_5_broadcast_0_0_2_cons_buff_0
  tail call void @llvm.aie2p.acquire(i32 53, i32 -1)
  %cond2.1 = icmp eq i32 %21, 1
  %25 = select i1 %cond2.1, ptr @of_3_distribute_0_2_1_cons_buff_1, ptr @of_3_distribute_0_2_1_cons_buff_0
  tail call void @op0_matmul_bf16_bf16_32_32_64(ptr nonnull %25, ptr nonnull %spec.select4.1, ptr nonnull %spec.select)
  tail call void @llvm.aie2p.release(i32 52, i32 1)
  %26 = add i32 %21, 1
  %27 = icmp sgt i32 %26, 1
  %28 = select i1 %27, i32 0, i32 %26
  tail call void @llvm.aie2p.release(i32 50, i32 1)
  %29 = add i32 %24, 1
  %30 = icmp sgt i32 %29, 1
  %31 = select i1 %30, i32 0, i32 %29
  tail call void @llvm.aie2p.acquire(i32 51, i32 -1)
  %cond1.2 = icmp eq i32 %31, 1
  %spec.select4.2 = select i1 %cond1.2, ptr @of_5_broadcast_0_0_2_cons_buff_1, ptr @of_5_broadcast_0_0_2_cons_buff_0
  tail call void @llvm.aie2p.acquire(i32 53, i32 -1)
  %cond2.2 = icmp eq i32 %28, 1
  %32 = select i1 %cond2.2, ptr @of_3_distribute_0_2_1_cons_buff_1, ptr @of_3_distribute_0_2_1_cons_buff_0
  tail call void @op0_matmul_bf16_bf16_32_32_64(ptr nonnull %32, ptr nonnull %spec.select4.2, ptr nonnull %spec.select)
  tail call void @llvm.aie2p.release(i32 52, i32 1)
  %33 = add i32 %28, 1
  %34 = icmp sgt i32 %33, 1
  %35 = select i1 %34, i32 0, i32 %33
  tail call void @llvm.aie2p.release(i32 50, i32 1)
  %36 = add i32 %31, 1
  %37 = icmp sgt i32 %36, 1
  %38 = select i1 %37, i32 0, i32 %36
  %39 = or disjoint i64 %17, 3
  tail call void @llvm.aie2p.acquire(i32 51, i32 -1)
  %cond1.3 = icmp eq i32 %38, 1
  %spec.select4.3 = select i1 %cond1.3, ptr @of_5_broadcast_0_0_2_cons_buff_1, ptr @of_5_broadcast_0_0_2_cons_buff_0
  tail call void @llvm.aie2p.acquire(i32 53, i32 -1)
  %cond2.3 = icmp eq i32 %35, 1
  %40 = select i1 %cond2.3, ptr @of_3_distribute_0_2_1_cons_buff_1, ptr @of_3_distribute_0_2_1_cons_buff_0
  tail call void @op0_matmul_bf16_bf16_32_32_64(ptr nonnull %40, ptr nonnull %spec.select4.3, ptr nonnull %spec.select)
  tail call void @llvm.aie2p.release(i32 52, i32 1)
  %41 = add i32 %35, 1
  %42 = icmp sgt i32 %41, 1
  %43 = select i1 %42, i32 0, i32 %41
  tail call void @llvm.aie2p.release(i32 50, i32 1)
  %44 = add i32 %38, 1
  %45 = icmp sgt i32 %44, 1
  %46 = select i1 %45, i32 0, i32 %44
  %47 = add nuw nsw i64 %17, 4
  %48 = icmp samesign ult i64 %39, 127
  br i1 %48, label %14, label %49

49:                                               ; preds = %14
  tail call void @llvm.aie2p.release(i32 49, i32 1)
  %50 = add i32 %12, 1
  %51 = icmp sgt i32 %50, 1
  %52 = select i1 %51, i32 0, i32 %50
  %53 = add nuw nsw i64 %13, 1
  %54 = icmp samesign ult i64 %13, 85
  br i1 %54, label %9, label %55

55:                                               ; preds = %49
  %56 = add nuw nsw i64 %8, 1
  %57 = icmp samesign ult i64 %8, 3
  br i1 %57, label %.preheader, label %58

58:                                               ; preds = %55
  %59 = add nuw nsw i64 %4, 1
  %60 = icmp samesign ult i64 %4, 4294967294
  br i1 %60, label %.preheader5, label %61

61:                                               ; preds = %58
  ret void
}

attributes #0 = { mustprogress nocallback nofree nosync nounwind willreturn }

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
