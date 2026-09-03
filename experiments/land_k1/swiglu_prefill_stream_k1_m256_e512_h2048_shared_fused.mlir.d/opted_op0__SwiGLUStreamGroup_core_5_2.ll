; ModuleID = '/home/micas/iron-stream-dse/experiments/land_k1/swiglu_prefill_stream_k1_m256_e512_h2048_shared_fused.mlir.d/peano-linked_op0__SwiGLUStreamGroup_core_5_2.ll'
source_filename = "LLVMDialectModule"
target datalayout = "e-m:e-p:20:32-i1:8:32-i8:8:32-i16:16:32-i32:32:32-f32:32:32-i64:32-f64:32-a:0:32-n32"
target triple = "aie2p"

@of_9_switch_join_0_0_cons_buff_1 = external global [32 x [64 x bfloat]]
@of_9_switch_join_0_0_cons_buff_0 = external global [32 x [64 x bfloat]]
@of_9_switch_join_0_1_cons_buff_1 = external global [32 x [64 x bfloat]]
@of_9_switch_join_0_1_cons_buff_0 = external global [32 x [64 x bfloat]]
@of_10_unicast_0_buff_1 = external global [32 x [64 x bfloat]]
@of_10_unicast_0_buff_0 = external global [32 x [64 x bfloat]]
@of_11_broadcast_0_buff_1 = external global [32 x [64 x bfloat]]
@of_11_broadcast_0_buff_0 = external global [32 x [64 x bfloat]]

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.aie2p.acquire(i32, i32) #0

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.aie2p.release(i32, i32) #0

declare void @op0_eltwise_mul_bf16_vector(ptr, ptr, ptr, i32) local_unnamed_addr

define void @core_5_2() local_unnamed_addr {
  br label %.preheader18

.preheader18:                                     ; preds = %0, %45
  %1 = phi i32 [ 0, %0 ], [ %39, %45 ]
  %2 = phi i32 [ 0, %0 ], [ %36, %45 ]
  %3 = phi i64 [ 0, %0 ], [ %46, %45 ]
  br label %.preheader

.preheader:                                       ; preds = %.preheader18, %42
  %4 = phi i32 [ %1, %.preheader18 ], [ %39, %42 ]
  %5 = phi i32 [ %2, %.preheader18 ], [ %36, %42 ]
  %6 = phi i64 [ 0, %.preheader18 ], [ %43, %42 ]
  br label %7

7:                                                ; preds = %7, %.preheader
  %8 = phi i32 [ %4, %.preheader ], [ %39, %7 ]
  %9 = phi i32 [ %5, %.preheader ], [ %36, %7 ]
  %10 = phi i64 [ 0, %.preheader ], [ %40, %7 ]
  tail call void @llvm.aie2p.acquire(i32 53, i32 -1)
  tail call void @llvm.aie2p.acquire(i32 51, i32 -1)
  %cond2 = icmp eq i32 %8, 1
  %11 = select i1 %cond2, ptr @of_9_switch_join_0_1_cons_buff_1, ptr @of_9_switch_join_0_1_cons_buff_0
  %cond1 = icmp eq i32 %9, 1
  %spec.select = select i1 %cond1, ptr @of_9_switch_join_0_0_cons_buff_1, ptr @of_9_switch_join_0_0_cons_buff_0
  tail call void @llvm.aie2p.acquire(i32 48, i32 -1)
  tail call void @llvm.aie2p.acquire(i32 17, i32 -1)
  tail call void @op0_eltwise_mul_bf16_vector(ptr nonnull @of_10_unicast_0_buff_0, ptr nonnull %spec.select, ptr nonnull @of_11_broadcast_0_buff_0, i32 2048)
  tail call void @llvm.aie2p.release(i32 16, i32 1)
  tail call void @llvm.aie2p.release(i32 49, i32 1)
  tail call void @llvm.aie2p.acquire(i32 48, i32 -1)
  tail call void @llvm.aie2p.acquire(i32 17, i32 -1)
  tail call void @op0_eltwise_mul_bf16_vector(ptr nonnull @of_10_unicast_0_buff_1, ptr nonnull %11, ptr nonnull @of_11_broadcast_0_buff_1, i32 2048)
  tail call void @llvm.aie2p.release(i32 16, i32 1)
  tail call void @llvm.aie2p.release(i32 49, i32 1)
  tail call void @llvm.aie2p.release(i32 52, i32 1)
  %12 = add i32 %9, 1
  %13 = icmp sgt i32 %12, 1
  %14 = select i1 %13, i32 0, i32 %12
  tail call void @llvm.aie2p.release(i32 50, i32 1)
  %15 = add i32 %8, 1
  %16 = icmp sgt i32 %15, 1
  %17 = select i1 %16, i32 0, i32 %15
  tail call void @llvm.aie2p.acquire(i32 53, i32 -1)
  tail call void @llvm.aie2p.acquire(i32 51, i32 -1)
  %cond2.1 = icmp eq i32 %17, 1
  %18 = select i1 %cond2.1, ptr @of_9_switch_join_0_1_cons_buff_1, ptr @of_9_switch_join_0_1_cons_buff_0
  %cond1.1 = icmp eq i32 %14, 1
  %spec.select.1 = select i1 %cond1.1, ptr @of_9_switch_join_0_0_cons_buff_1, ptr @of_9_switch_join_0_0_cons_buff_0
  tail call void @llvm.aie2p.acquire(i32 48, i32 -1)
  tail call void @llvm.aie2p.acquire(i32 17, i32 -1)
  tail call void @op0_eltwise_mul_bf16_vector(ptr nonnull @of_10_unicast_0_buff_0, ptr nonnull %spec.select.1, ptr nonnull @of_11_broadcast_0_buff_0, i32 2048)
  tail call void @llvm.aie2p.release(i32 16, i32 1)
  tail call void @llvm.aie2p.release(i32 49, i32 1)
  tail call void @llvm.aie2p.acquire(i32 48, i32 -1)
  tail call void @llvm.aie2p.acquire(i32 17, i32 -1)
  tail call void @op0_eltwise_mul_bf16_vector(ptr nonnull @of_10_unicast_0_buff_1, ptr nonnull %18, ptr nonnull @of_11_broadcast_0_buff_1, i32 2048)
  tail call void @llvm.aie2p.release(i32 16, i32 1)
  tail call void @llvm.aie2p.release(i32 49, i32 1)
  tail call void @llvm.aie2p.release(i32 52, i32 1)
  %19 = add i32 %14, 1
  %20 = icmp sgt i32 %19, 1
  %21 = select i1 %20, i32 0, i32 %19
  tail call void @llvm.aie2p.release(i32 50, i32 1)
  %22 = add i32 %17, 1
  %23 = icmp sgt i32 %22, 1
  %24 = select i1 %23, i32 0, i32 %22
  tail call void @llvm.aie2p.acquire(i32 53, i32 -1)
  tail call void @llvm.aie2p.acquire(i32 51, i32 -1)
  %cond2.2 = icmp eq i32 %24, 1
  %25 = select i1 %cond2.2, ptr @of_9_switch_join_0_1_cons_buff_1, ptr @of_9_switch_join_0_1_cons_buff_0
  %cond1.2 = icmp eq i32 %21, 1
  %spec.select.2 = select i1 %cond1.2, ptr @of_9_switch_join_0_0_cons_buff_1, ptr @of_9_switch_join_0_0_cons_buff_0
  tail call void @llvm.aie2p.acquire(i32 48, i32 -1)
  tail call void @llvm.aie2p.acquire(i32 17, i32 -1)
  tail call void @op0_eltwise_mul_bf16_vector(ptr nonnull @of_10_unicast_0_buff_0, ptr nonnull %spec.select.2, ptr nonnull @of_11_broadcast_0_buff_0, i32 2048)
  tail call void @llvm.aie2p.release(i32 16, i32 1)
  tail call void @llvm.aie2p.release(i32 49, i32 1)
  tail call void @llvm.aie2p.acquire(i32 48, i32 -1)
  tail call void @llvm.aie2p.acquire(i32 17, i32 -1)
  tail call void @op0_eltwise_mul_bf16_vector(ptr nonnull @of_10_unicast_0_buff_1, ptr nonnull %25, ptr nonnull @of_11_broadcast_0_buff_1, i32 2048)
  tail call void @llvm.aie2p.release(i32 16, i32 1)
  tail call void @llvm.aie2p.release(i32 49, i32 1)
  tail call void @llvm.aie2p.release(i32 52, i32 1)
  %26 = add i32 %21, 1
  %27 = icmp sgt i32 %26, 1
  %28 = select i1 %27, i32 0, i32 %26
  tail call void @llvm.aie2p.release(i32 50, i32 1)
  %29 = add i32 %24, 1
  %30 = icmp sgt i32 %29, 1
  %31 = select i1 %30, i32 0, i32 %29
  %32 = or disjoint i64 %10, 3
  tail call void @llvm.aie2p.acquire(i32 53, i32 -1)
  tail call void @llvm.aie2p.acquire(i32 51, i32 -1)
  %cond2.3 = icmp eq i32 %31, 1
  %33 = select i1 %cond2.3, ptr @of_9_switch_join_0_1_cons_buff_1, ptr @of_9_switch_join_0_1_cons_buff_0
  %cond1.3 = icmp eq i32 %28, 1
  %spec.select.3 = select i1 %cond1.3, ptr @of_9_switch_join_0_0_cons_buff_1, ptr @of_9_switch_join_0_0_cons_buff_0
  tail call void @llvm.aie2p.acquire(i32 48, i32 -1)
  tail call void @llvm.aie2p.acquire(i32 17, i32 -1)
  tail call void @op0_eltwise_mul_bf16_vector(ptr nonnull @of_10_unicast_0_buff_0, ptr nonnull %spec.select.3, ptr nonnull @of_11_broadcast_0_buff_0, i32 2048)
  tail call void @llvm.aie2p.release(i32 16, i32 1)
  tail call void @llvm.aie2p.release(i32 49, i32 1)
  tail call void @llvm.aie2p.acquire(i32 48, i32 -1)
  tail call void @llvm.aie2p.acquire(i32 17, i32 -1)
  tail call void @op0_eltwise_mul_bf16_vector(ptr nonnull @of_10_unicast_0_buff_1, ptr nonnull %33, ptr nonnull @of_11_broadcast_0_buff_1, i32 2048)
  tail call void @llvm.aie2p.release(i32 16, i32 1)
  tail call void @llvm.aie2p.release(i32 49, i32 1)
  tail call void @llvm.aie2p.release(i32 52, i32 1)
  %34 = add i32 %28, 1
  %35 = icmp sgt i32 %34, 1
  %36 = select i1 %35, i32 0, i32 %34
  tail call void @llvm.aie2p.release(i32 50, i32 1)
  %37 = add i32 %31, 1
  %38 = icmp sgt i32 %37, 1
  %39 = select i1 %38, i32 0, i32 %37
  %40 = add nuw nsw i64 %10, 4
  %41 = icmp samesign ult i64 %32, 15
  br i1 %41, label %7, label %42

42:                                               ; preds = %7
  %43 = add nuw nsw i64 %6, 1
  %44 = icmp eq i64 %6, 0
  br i1 %44, label %.preheader, label %45

45:                                               ; preds = %42
  %46 = add nuw nsw i64 %3, 1
  %47 = icmp samesign ult i64 %3, 4294967294
  br i1 %47, label %.preheader18, label %48

48:                                               ; preds = %45
  ret void
}

attributes #0 = { mustprogress nocallback nofree nosync nounwind willreturn }

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
