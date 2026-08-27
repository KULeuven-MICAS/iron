; ModuleID = '/home/micas/iron-stream-dse/experiments/final/swiglu_stream/stream_s512_e4096_h11008/swiglu_prefill_stream_k2_m512_e4096_h11008_shared_fused.mlir.d/peano-linked_op0__SwiGLUStreamGroup_core_5_5.ll'
source_filename = "LLVMDialectModule"
target datalayout = "e-m:e-p:20:32-i1:8:32-i8:8:32-i16:16:32-i32:32:32-f32:32:32-i64:32-f64:32-a:0:32-n32"
target triple = "aie2p"

@of_7_switch_join_3_0_cons_buff_1 = external global [32 x [64 x bfloat]]
@of_7_switch_join_3_0_cons_buff_0 = external global [32 x [64 x bfloat]]
@of_7_switch_join_3_1_cons_buff_1 = external global [32 x [64 x bfloat]]
@of_7_switch_join_3_1_cons_buff_0 = external global [32 x [64 x bfloat]]
@of_8_unicast_3_buff_1 = external global [32 x [64 x bfloat]]
@of_8_unicast_3_buff_0 = external global [32 x [64 x bfloat]]
@of_9_join_0_3_buff_1 = external global [32 x [64 x bfloat]]
@of_9_join_0_3_buff_0 = external global [32 x [64 x bfloat]]

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.aie2p.acquire(i32, i32) #0

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.aie2p.release(i32, i32) #0

declare void @op0_eltwise_mul_bf16_vector(ptr, ptr, ptr, i32) local_unnamed_addr

define void @core_5_5() local_unnamed_addr {
  br label %.preheader18

.preheader18:                                     ; preds = %0, %31
  %1 = phi i32 [ 0, %0 ], [ %25, %31 ]
  %2 = phi i32 [ 0, %0 ], [ %22, %31 ]
  %3 = phi i64 [ 0, %0 ], [ %32, %31 ]
  br label %.preheader

.preheader:                                       ; preds = %.preheader18, %28
  %4 = phi i32 [ %1, %.preheader18 ], [ %25, %28 ]
  %5 = phi i32 [ %2, %.preheader18 ], [ %22, %28 ]
  %6 = phi i64 [ 0, %.preheader18 ], [ %29, %28 ]
  br label %7

7:                                                ; preds = %7, %.preheader
  %8 = phi i32 [ %4, %.preheader ], [ %25, %7 ]
  %9 = phi i32 [ %5, %.preheader ], [ %22, %7 ]
  %10 = phi i64 [ 0, %.preheader ], [ %26, %7 ]
  tail call void @llvm.aie2p.acquire(i32 53, i32 -1)
  tail call void @llvm.aie2p.acquire(i32 51, i32 -1)
  %cond2 = icmp eq i32 %8, 1
  %11 = select i1 %cond2, ptr @of_7_switch_join_3_1_cons_buff_1, ptr @of_7_switch_join_3_1_cons_buff_0
  %cond1 = icmp eq i32 %9, 1
  %spec.select = select i1 %cond1, ptr @of_7_switch_join_3_0_cons_buff_1, ptr @of_7_switch_join_3_0_cons_buff_0
  tail call void @llvm.aie2p.acquire(i32 48, i32 -1)
  tail call void @llvm.aie2p.acquire(i32 17, i32 -1)
  tail call void @op0_eltwise_mul_bf16_vector(ptr nonnull @of_8_unicast_3_buff_0, ptr nonnull %spec.select, ptr nonnull @of_9_join_0_3_buff_0, i32 2048)
  tail call void @llvm.aie2p.release(i32 16, i32 1)
  tail call void @llvm.aie2p.release(i32 49, i32 1)
  tail call void @llvm.aie2p.acquire(i32 48, i32 -1)
  tail call void @llvm.aie2p.acquire(i32 17, i32 -1)
  tail call void @op0_eltwise_mul_bf16_vector(ptr nonnull @of_8_unicast_3_buff_1, ptr nonnull %11, ptr nonnull @of_9_join_0_3_buff_1, i32 2048)
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
  %18 = or disjoint i64 %10, 1
  tail call void @llvm.aie2p.acquire(i32 53, i32 -1)
  tail call void @llvm.aie2p.acquire(i32 51, i32 -1)
  %cond2.1 = icmp eq i32 %17, 1
  %19 = select i1 %cond2.1, ptr @of_7_switch_join_3_1_cons_buff_1, ptr @of_7_switch_join_3_1_cons_buff_0
  %cond1.1 = icmp eq i32 %14, 1
  %spec.select.1 = select i1 %cond1.1, ptr @of_7_switch_join_3_0_cons_buff_1, ptr @of_7_switch_join_3_0_cons_buff_0
  tail call void @llvm.aie2p.acquire(i32 48, i32 -1)
  tail call void @llvm.aie2p.acquire(i32 17, i32 -1)
  tail call void @op0_eltwise_mul_bf16_vector(ptr nonnull @of_8_unicast_3_buff_0, ptr nonnull %spec.select.1, ptr nonnull @of_9_join_0_3_buff_0, i32 2048)
  tail call void @llvm.aie2p.release(i32 16, i32 1)
  tail call void @llvm.aie2p.release(i32 49, i32 1)
  tail call void @llvm.aie2p.acquire(i32 48, i32 -1)
  tail call void @llvm.aie2p.acquire(i32 17, i32 -1)
  tail call void @op0_eltwise_mul_bf16_vector(ptr nonnull @of_8_unicast_3_buff_1, ptr nonnull %19, ptr nonnull @of_9_join_0_3_buff_1, i32 2048)
  tail call void @llvm.aie2p.release(i32 16, i32 1)
  tail call void @llvm.aie2p.release(i32 49, i32 1)
  tail call void @llvm.aie2p.release(i32 52, i32 1)
  %20 = add i32 %14, 1
  %21 = icmp sgt i32 %20, 1
  %22 = select i1 %21, i32 0, i32 %20
  tail call void @llvm.aie2p.release(i32 50, i32 1)
  %23 = add i32 %17, 1
  %24 = icmp sgt i32 %23, 1
  %25 = select i1 %24, i32 0, i32 %23
  %26 = add nuw nsw i64 %10, 2
  %27 = icmp samesign ult i64 %18, 85
  br i1 %27, label %7, label %28

28:                                               ; preds = %7
  %29 = add nuw nsw i64 %6, 1
  %30 = icmp samesign ult i64 %6, 3
  br i1 %30, label %.preheader, label %31

31:                                               ; preds = %28
  %32 = add nuw nsw i64 %3, 1
  %33 = icmp samesign ult i64 %3, 4294967294
  br i1 %33, label %.preheader18, label %34

34:                                               ; preds = %31
  ret void
}

attributes #0 = { mustprogress nocallback nofree nosync nounwind willreturn }

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
