; ModuleID = '/home/micas/iron-stream-dse/experiments/sw_dflt_1024/swiglu_prefill_stream_k5_m1024_e512_h2048_shared_fused.mlir.d/peano-linked_op0__SwiGLUStreamGroup_core_1_5.ll'
source_filename = "LLVMDialectModule"
target datalayout = "e-m:e-p:20:32-i1:8:32-i8:8:32-i16:16:32-i32:32:32-f32:32:32-i64:32-f64:32-a:0:32-n32"
target triple = "aie2p"

@of_2_broadcast_3_0_1_cons_buff_1 = external global [64 x [64 x bfloat]]
@of_2_broadcast_3_0_1_cons_buff_0 = external global [64 x [64 x bfloat]]
@of_3_broadcast_1_0_3_cons_buff_1 = external global [64 x [64 x bfloat]]
@of_3_broadcast_1_0_3_cons_buff_0 = external global [64 x [64 x bfloat]]
@of_4_join_1_3_buff_1 = external global [64 x [64 x bfloat]]
@of_4_join_1_3_buff_0 = external global [64 x [64 x bfloat]]

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.aie2p.acquire(i32, i32) #0

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.aie2p.release(i32, i32) #0

declare void @op0_zero_bf16_64_64_64(ptr) local_unnamed_addr

declare void @op0_matmul_bf16_bf16_64_64_64(ptr, ptr, ptr) local_unnamed_addr

define void @core_1_5() local_unnamed_addr {
  br label %.preheader5

.preheader5:                                      ; preds = %0, %19
  %1 = phi i32 [ 0, %0 ], [ %16, %19 ]
  %2 = phi i64 [ 0, %0 ], [ %20, %19 ]
  br label %.preheader

.preheader:                                       ; preds = %.preheader5, %.preheader
  %3 = phi i32 [ %1, %.preheader5 ], [ %16, %.preheader ]
  %4 = phi i64 [ 0, %.preheader5 ], [ %17, %.preheader ]
  tail call void @llvm.aie2p.acquire(i32 48, i32 -1)
  %cond = icmp eq i32 %3, 1
  %spec.select = select i1 %cond, ptr @of_4_join_1_3_buff_1, ptr @of_4_join_1_3_buff_0
  tail call void @op0_zero_bf16_64_64_64(ptr nonnull %spec.select)
  tail call void @llvm.aie2p.acquire(i32 51, i32 -1)
  tail call void @llvm.aie2p.acquire(i32 53, i32 -1)
  tail call void @op0_matmul_bf16_bf16_64_64_64(ptr nonnull @of_2_broadcast_3_0_1_cons_buff_0, ptr nonnull @of_3_broadcast_1_0_3_cons_buff_0, ptr nonnull %spec.select)
  tail call void @llvm.aie2p.release(i32 52, i32 1)
  tail call void @llvm.aie2p.release(i32 50, i32 1)
  tail call void @llvm.aie2p.acquire(i32 51, i32 -1)
  tail call void @llvm.aie2p.acquire(i32 53, i32 -1)
  tail call void @op0_matmul_bf16_bf16_64_64_64(ptr nonnull @of_2_broadcast_3_0_1_cons_buff_1, ptr nonnull @of_3_broadcast_1_0_3_cons_buff_1, ptr nonnull %spec.select)
  tail call void @llvm.aie2p.release(i32 52, i32 1)
  tail call void @llvm.aie2p.release(i32 50, i32 1)
  tail call void @llvm.aie2p.acquire(i32 51, i32 -1)
  tail call void @llvm.aie2p.acquire(i32 53, i32 -1)
  tail call void @op0_matmul_bf16_bf16_64_64_64(ptr nonnull @of_2_broadcast_3_0_1_cons_buff_0, ptr nonnull @of_3_broadcast_1_0_3_cons_buff_0, ptr nonnull %spec.select)
  tail call void @llvm.aie2p.release(i32 52, i32 1)
  tail call void @llvm.aie2p.release(i32 50, i32 1)
  tail call void @llvm.aie2p.acquire(i32 51, i32 -1)
  tail call void @llvm.aie2p.acquire(i32 53, i32 -1)
  tail call void @op0_matmul_bf16_bf16_64_64_64(ptr nonnull @of_2_broadcast_3_0_1_cons_buff_1, ptr nonnull @of_3_broadcast_1_0_3_cons_buff_1, ptr nonnull %spec.select)
  tail call void @llvm.aie2p.release(i32 52, i32 1)
  tail call void @llvm.aie2p.release(i32 50, i32 1)
  tail call void @llvm.aie2p.acquire(i32 51, i32 -1)
  tail call void @llvm.aie2p.acquire(i32 53, i32 -1)
  tail call void @op0_matmul_bf16_bf16_64_64_64(ptr nonnull @of_2_broadcast_3_0_1_cons_buff_0, ptr nonnull @of_3_broadcast_1_0_3_cons_buff_0, ptr nonnull %spec.select)
  tail call void @llvm.aie2p.release(i32 52, i32 1)
  tail call void @llvm.aie2p.release(i32 50, i32 1)
  tail call void @llvm.aie2p.acquire(i32 51, i32 -1)
  tail call void @llvm.aie2p.acquire(i32 53, i32 -1)
  tail call void @op0_matmul_bf16_bf16_64_64_64(ptr nonnull @of_2_broadcast_3_0_1_cons_buff_1, ptr nonnull @of_3_broadcast_1_0_3_cons_buff_1, ptr nonnull %spec.select)
  tail call void @llvm.aie2p.release(i32 52, i32 1)
  tail call void @llvm.aie2p.release(i32 50, i32 1)
  tail call void @llvm.aie2p.acquire(i32 51, i32 -1)
  tail call void @llvm.aie2p.acquire(i32 53, i32 -1)
  tail call void @op0_matmul_bf16_bf16_64_64_64(ptr nonnull @of_2_broadcast_3_0_1_cons_buff_0, ptr nonnull @of_3_broadcast_1_0_3_cons_buff_0, ptr nonnull %spec.select)
  tail call void @llvm.aie2p.release(i32 52, i32 1)
  tail call void @llvm.aie2p.release(i32 50, i32 1)
  tail call void @llvm.aie2p.acquire(i32 51, i32 -1)
  tail call void @llvm.aie2p.acquire(i32 53, i32 -1)
  tail call void @op0_matmul_bf16_bf16_64_64_64(ptr nonnull @of_2_broadcast_3_0_1_cons_buff_1, ptr nonnull @of_3_broadcast_1_0_3_cons_buff_1, ptr nonnull %spec.select)
  tail call void @llvm.aie2p.release(i32 52, i32 1)
  tail call void @llvm.aie2p.release(i32 50, i32 1)
  tail call void @llvm.aie2p.release(i32 49, i32 1)
  %5 = add i32 %3, 1
  %6 = icmp sgt i32 %5, 1
  %7 = select i1 %6, i32 0, i32 %5
  tail call void @llvm.aie2p.acquire(i32 48, i32 -1)
  %cond.1 = icmp eq i32 %7, 1
  %spec.select.1 = select i1 %cond.1, ptr @of_4_join_1_3_buff_1, ptr @of_4_join_1_3_buff_0
  tail call void @op0_zero_bf16_64_64_64(ptr nonnull %spec.select.1)
  tail call void @llvm.aie2p.acquire(i32 51, i32 -1)
  tail call void @llvm.aie2p.acquire(i32 53, i32 -1)
  tail call void @op0_matmul_bf16_bf16_64_64_64(ptr nonnull @of_2_broadcast_3_0_1_cons_buff_0, ptr nonnull @of_3_broadcast_1_0_3_cons_buff_0, ptr nonnull %spec.select.1)
  tail call void @llvm.aie2p.release(i32 52, i32 1)
  tail call void @llvm.aie2p.release(i32 50, i32 1)
  tail call void @llvm.aie2p.acquire(i32 51, i32 -1)
  tail call void @llvm.aie2p.acquire(i32 53, i32 -1)
  tail call void @op0_matmul_bf16_bf16_64_64_64(ptr nonnull @of_2_broadcast_3_0_1_cons_buff_1, ptr nonnull @of_3_broadcast_1_0_3_cons_buff_1, ptr nonnull %spec.select.1)
  tail call void @llvm.aie2p.release(i32 52, i32 1)
  tail call void @llvm.aie2p.release(i32 50, i32 1)
  tail call void @llvm.aie2p.acquire(i32 51, i32 -1)
  tail call void @llvm.aie2p.acquire(i32 53, i32 -1)
  tail call void @op0_matmul_bf16_bf16_64_64_64(ptr nonnull @of_2_broadcast_3_0_1_cons_buff_0, ptr nonnull @of_3_broadcast_1_0_3_cons_buff_0, ptr nonnull %spec.select.1)
  tail call void @llvm.aie2p.release(i32 52, i32 1)
  tail call void @llvm.aie2p.release(i32 50, i32 1)
  tail call void @llvm.aie2p.acquire(i32 51, i32 -1)
  tail call void @llvm.aie2p.acquire(i32 53, i32 -1)
  tail call void @op0_matmul_bf16_bf16_64_64_64(ptr nonnull @of_2_broadcast_3_0_1_cons_buff_1, ptr nonnull @of_3_broadcast_1_0_3_cons_buff_1, ptr nonnull %spec.select.1)
  tail call void @llvm.aie2p.release(i32 52, i32 1)
  tail call void @llvm.aie2p.release(i32 50, i32 1)
  tail call void @llvm.aie2p.acquire(i32 51, i32 -1)
  tail call void @llvm.aie2p.acquire(i32 53, i32 -1)
  tail call void @op0_matmul_bf16_bf16_64_64_64(ptr nonnull @of_2_broadcast_3_0_1_cons_buff_0, ptr nonnull @of_3_broadcast_1_0_3_cons_buff_0, ptr nonnull %spec.select.1)
  tail call void @llvm.aie2p.release(i32 52, i32 1)
  tail call void @llvm.aie2p.release(i32 50, i32 1)
  tail call void @llvm.aie2p.acquire(i32 51, i32 -1)
  tail call void @llvm.aie2p.acquire(i32 53, i32 -1)
  tail call void @op0_matmul_bf16_bf16_64_64_64(ptr nonnull @of_2_broadcast_3_0_1_cons_buff_1, ptr nonnull @of_3_broadcast_1_0_3_cons_buff_1, ptr nonnull %spec.select.1)
  tail call void @llvm.aie2p.release(i32 52, i32 1)
  tail call void @llvm.aie2p.release(i32 50, i32 1)
  tail call void @llvm.aie2p.acquire(i32 51, i32 -1)
  tail call void @llvm.aie2p.acquire(i32 53, i32 -1)
  tail call void @op0_matmul_bf16_bf16_64_64_64(ptr nonnull @of_2_broadcast_3_0_1_cons_buff_0, ptr nonnull @of_3_broadcast_1_0_3_cons_buff_0, ptr nonnull %spec.select.1)
  tail call void @llvm.aie2p.release(i32 52, i32 1)
  tail call void @llvm.aie2p.release(i32 50, i32 1)
  tail call void @llvm.aie2p.acquire(i32 51, i32 -1)
  tail call void @llvm.aie2p.acquire(i32 53, i32 -1)
  tail call void @op0_matmul_bf16_bf16_64_64_64(ptr nonnull @of_2_broadcast_3_0_1_cons_buff_1, ptr nonnull @of_3_broadcast_1_0_3_cons_buff_1, ptr nonnull %spec.select.1)
  tail call void @llvm.aie2p.release(i32 52, i32 1)
  tail call void @llvm.aie2p.release(i32 50, i32 1)
  tail call void @llvm.aie2p.release(i32 49, i32 1)
  %8 = add i32 %7, 1
  %9 = icmp sgt i32 %8, 1
  %10 = select i1 %9, i32 0, i32 %8
  tail call void @llvm.aie2p.acquire(i32 48, i32 -1)
  %cond.2 = icmp eq i32 %10, 1
  %spec.select.2 = select i1 %cond.2, ptr @of_4_join_1_3_buff_1, ptr @of_4_join_1_3_buff_0
  tail call void @op0_zero_bf16_64_64_64(ptr nonnull %spec.select.2)
  tail call void @llvm.aie2p.acquire(i32 51, i32 -1)
  tail call void @llvm.aie2p.acquire(i32 53, i32 -1)
  tail call void @op0_matmul_bf16_bf16_64_64_64(ptr nonnull @of_2_broadcast_3_0_1_cons_buff_0, ptr nonnull @of_3_broadcast_1_0_3_cons_buff_0, ptr nonnull %spec.select.2)
  tail call void @llvm.aie2p.release(i32 52, i32 1)
  tail call void @llvm.aie2p.release(i32 50, i32 1)
  tail call void @llvm.aie2p.acquire(i32 51, i32 -1)
  tail call void @llvm.aie2p.acquire(i32 53, i32 -1)
  tail call void @op0_matmul_bf16_bf16_64_64_64(ptr nonnull @of_2_broadcast_3_0_1_cons_buff_1, ptr nonnull @of_3_broadcast_1_0_3_cons_buff_1, ptr nonnull %spec.select.2)
  tail call void @llvm.aie2p.release(i32 52, i32 1)
  tail call void @llvm.aie2p.release(i32 50, i32 1)
  tail call void @llvm.aie2p.acquire(i32 51, i32 -1)
  tail call void @llvm.aie2p.acquire(i32 53, i32 -1)
  tail call void @op0_matmul_bf16_bf16_64_64_64(ptr nonnull @of_2_broadcast_3_0_1_cons_buff_0, ptr nonnull @of_3_broadcast_1_0_3_cons_buff_0, ptr nonnull %spec.select.2)
  tail call void @llvm.aie2p.release(i32 52, i32 1)
  tail call void @llvm.aie2p.release(i32 50, i32 1)
  tail call void @llvm.aie2p.acquire(i32 51, i32 -1)
  tail call void @llvm.aie2p.acquire(i32 53, i32 -1)
  tail call void @op0_matmul_bf16_bf16_64_64_64(ptr nonnull @of_2_broadcast_3_0_1_cons_buff_1, ptr nonnull @of_3_broadcast_1_0_3_cons_buff_1, ptr nonnull %spec.select.2)
  tail call void @llvm.aie2p.release(i32 52, i32 1)
  tail call void @llvm.aie2p.release(i32 50, i32 1)
  tail call void @llvm.aie2p.acquire(i32 51, i32 -1)
  tail call void @llvm.aie2p.acquire(i32 53, i32 -1)
  tail call void @op0_matmul_bf16_bf16_64_64_64(ptr nonnull @of_2_broadcast_3_0_1_cons_buff_0, ptr nonnull @of_3_broadcast_1_0_3_cons_buff_0, ptr nonnull %spec.select.2)
  tail call void @llvm.aie2p.release(i32 52, i32 1)
  tail call void @llvm.aie2p.release(i32 50, i32 1)
  tail call void @llvm.aie2p.acquire(i32 51, i32 -1)
  tail call void @llvm.aie2p.acquire(i32 53, i32 -1)
  tail call void @op0_matmul_bf16_bf16_64_64_64(ptr nonnull @of_2_broadcast_3_0_1_cons_buff_1, ptr nonnull @of_3_broadcast_1_0_3_cons_buff_1, ptr nonnull %spec.select.2)
  tail call void @llvm.aie2p.release(i32 52, i32 1)
  tail call void @llvm.aie2p.release(i32 50, i32 1)
  tail call void @llvm.aie2p.acquire(i32 51, i32 -1)
  tail call void @llvm.aie2p.acquire(i32 53, i32 -1)
  tail call void @op0_matmul_bf16_bf16_64_64_64(ptr nonnull @of_2_broadcast_3_0_1_cons_buff_0, ptr nonnull @of_3_broadcast_1_0_3_cons_buff_0, ptr nonnull %spec.select.2)
  tail call void @llvm.aie2p.release(i32 52, i32 1)
  tail call void @llvm.aie2p.release(i32 50, i32 1)
  tail call void @llvm.aie2p.acquire(i32 51, i32 -1)
  tail call void @llvm.aie2p.acquire(i32 53, i32 -1)
  tail call void @op0_matmul_bf16_bf16_64_64_64(ptr nonnull @of_2_broadcast_3_0_1_cons_buff_1, ptr nonnull @of_3_broadcast_1_0_3_cons_buff_1, ptr nonnull %spec.select.2)
  tail call void @llvm.aie2p.release(i32 52, i32 1)
  tail call void @llvm.aie2p.release(i32 50, i32 1)
  tail call void @llvm.aie2p.release(i32 49, i32 1)
  %11 = add i32 %10, 1
  %12 = icmp sgt i32 %11, 1
  %13 = select i1 %12, i32 0, i32 %11
  tail call void @llvm.aie2p.acquire(i32 48, i32 -1)
  %cond.3 = icmp eq i32 %13, 1
  %spec.select.3 = select i1 %cond.3, ptr @of_4_join_1_3_buff_1, ptr @of_4_join_1_3_buff_0
  tail call void @op0_zero_bf16_64_64_64(ptr nonnull %spec.select.3)
  tail call void @llvm.aie2p.acquire(i32 51, i32 -1)
  tail call void @llvm.aie2p.acquire(i32 53, i32 -1)
  tail call void @op0_matmul_bf16_bf16_64_64_64(ptr nonnull @of_2_broadcast_3_0_1_cons_buff_0, ptr nonnull @of_3_broadcast_1_0_3_cons_buff_0, ptr nonnull %spec.select.3)
  tail call void @llvm.aie2p.release(i32 52, i32 1)
  tail call void @llvm.aie2p.release(i32 50, i32 1)
  tail call void @llvm.aie2p.acquire(i32 51, i32 -1)
  tail call void @llvm.aie2p.acquire(i32 53, i32 -1)
  tail call void @op0_matmul_bf16_bf16_64_64_64(ptr nonnull @of_2_broadcast_3_0_1_cons_buff_1, ptr nonnull @of_3_broadcast_1_0_3_cons_buff_1, ptr nonnull %spec.select.3)
  tail call void @llvm.aie2p.release(i32 52, i32 1)
  tail call void @llvm.aie2p.release(i32 50, i32 1)
  tail call void @llvm.aie2p.acquire(i32 51, i32 -1)
  tail call void @llvm.aie2p.acquire(i32 53, i32 -1)
  tail call void @op0_matmul_bf16_bf16_64_64_64(ptr nonnull @of_2_broadcast_3_0_1_cons_buff_0, ptr nonnull @of_3_broadcast_1_0_3_cons_buff_0, ptr nonnull %spec.select.3)
  tail call void @llvm.aie2p.release(i32 52, i32 1)
  tail call void @llvm.aie2p.release(i32 50, i32 1)
  tail call void @llvm.aie2p.acquire(i32 51, i32 -1)
  tail call void @llvm.aie2p.acquire(i32 53, i32 -1)
  tail call void @op0_matmul_bf16_bf16_64_64_64(ptr nonnull @of_2_broadcast_3_0_1_cons_buff_1, ptr nonnull @of_3_broadcast_1_0_3_cons_buff_1, ptr nonnull %spec.select.3)
  tail call void @llvm.aie2p.release(i32 52, i32 1)
  tail call void @llvm.aie2p.release(i32 50, i32 1)
  tail call void @llvm.aie2p.acquire(i32 51, i32 -1)
  tail call void @llvm.aie2p.acquire(i32 53, i32 -1)
  tail call void @op0_matmul_bf16_bf16_64_64_64(ptr nonnull @of_2_broadcast_3_0_1_cons_buff_0, ptr nonnull @of_3_broadcast_1_0_3_cons_buff_0, ptr nonnull %spec.select.3)
  tail call void @llvm.aie2p.release(i32 52, i32 1)
  tail call void @llvm.aie2p.release(i32 50, i32 1)
  tail call void @llvm.aie2p.acquire(i32 51, i32 -1)
  tail call void @llvm.aie2p.acquire(i32 53, i32 -1)
  tail call void @op0_matmul_bf16_bf16_64_64_64(ptr nonnull @of_2_broadcast_3_0_1_cons_buff_1, ptr nonnull @of_3_broadcast_1_0_3_cons_buff_1, ptr nonnull %spec.select.3)
  tail call void @llvm.aie2p.release(i32 52, i32 1)
  tail call void @llvm.aie2p.release(i32 50, i32 1)
  tail call void @llvm.aie2p.acquire(i32 51, i32 -1)
  tail call void @llvm.aie2p.acquire(i32 53, i32 -1)
  tail call void @op0_matmul_bf16_bf16_64_64_64(ptr nonnull @of_2_broadcast_3_0_1_cons_buff_0, ptr nonnull @of_3_broadcast_1_0_3_cons_buff_0, ptr nonnull %spec.select.3)
  tail call void @llvm.aie2p.release(i32 52, i32 1)
  tail call void @llvm.aie2p.release(i32 50, i32 1)
  tail call void @llvm.aie2p.acquire(i32 51, i32 -1)
  tail call void @llvm.aie2p.acquire(i32 53, i32 -1)
  tail call void @op0_matmul_bf16_bf16_64_64_64(ptr nonnull @of_2_broadcast_3_0_1_cons_buff_1, ptr nonnull @of_3_broadcast_1_0_3_cons_buff_1, ptr nonnull %spec.select.3)
  tail call void @llvm.aie2p.release(i32 52, i32 1)
  tail call void @llvm.aie2p.release(i32 50, i32 1)
  tail call void @llvm.aie2p.release(i32 49, i32 1)
  %14 = add i32 %13, 1
  %15 = icmp sgt i32 %14, 1
  %16 = select i1 %15, i32 0, i32 %14
  %17 = add nuw nsw i64 %4, 1
  %18 = icmp samesign ult i64 %4, 3
  br i1 %18, label %.preheader, label %19

19:                                               ; preds = %.preheader
  %20 = add nuw nsw i64 %2, 1
  %21 = icmp samesign ult i64 %2, 4294967294
  br i1 %21, label %.preheader5, label %22

22:                                               ; preds = %19
  ret void
}

attributes #0 = { mustprogress nocallback nofree nosync nounwind willreturn }

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
