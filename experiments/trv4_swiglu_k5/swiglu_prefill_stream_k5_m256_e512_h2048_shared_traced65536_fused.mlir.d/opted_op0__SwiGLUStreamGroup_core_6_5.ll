; ModuleID = '/home/micas/iron-stream-dse/experiments/trv4_swiglu_k5/swiglu_prefill_stream_k5_m256_e512_h2048_shared_traced65536_fused.mlir.d/peano-linked_op0__SwiGLUStreamGroup_core_6_5.ll'
source_filename = "LLVMDialectModule"
target datalayout = "e-m:e-p:20:32-i1:8:32-i8:8:32-i16:16:32-i32:32:32-f32:32:32-i64:32-f64:32-a:0:32-n32"
target triple = "aie2p"

@of_2_broadcast_3_0_6_cons_buff_1 = external global [64 x [64 x bfloat]]
@of_2_broadcast_3_0_6_cons_buff_0 = external global [64 x [64 x bfloat]]
@of_3_broadcast_6_0_3_cons_buff_1 = external global [64 x [64 x bfloat]]
@of_3_broadcast_6_0_3_cons_buff_0 = external global [64 x [64 x bfloat]]
@of_4_join_6_3_buff_1 = external global [64 x [64 x bfloat]]
@of_4_join_6_3_buff_0 = external global [64 x [64 x bfloat]]

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.aie2p.acquire(i32, i32) #0

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.aie2p.release(i32, i32) #0

declare void @op0_zero_bf16_64_64_64(ptr) local_unnamed_addr

declare void @op0_matmul_bf16_bf16_64_64_64(ptr, ptr, ptr) local_unnamed_addr

define void @core_6_5() local_unnamed_addr {
  br label %.preheader

.preheader:                                       ; preds = %0, %.preheader
  %1 = phi i32 [ 0, %0 ], [ %14, %.preheader ]
  %2 = phi i64 [ 0, %0 ], [ %15, %.preheader ]
  tail call void @llvm.aie2p.acquire(i32 48, i32 -1)
  %cond = icmp eq i32 %1, 1
  %spec.select = select i1 %cond, ptr @of_4_join_6_3_buff_1, ptr @of_4_join_6_3_buff_0
  tail call void @op0_zero_bf16_64_64_64(ptr nonnull %spec.select)
  tail call void @llvm.aie2p.acquire(i32 51, i32 -1)
  tail call void @llvm.aie2p.acquire(i32 53, i32 -1)
  tail call void @op0_matmul_bf16_bf16_64_64_64(ptr nonnull @of_2_broadcast_3_0_6_cons_buff_0, ptr nonnull @of_3_broadcast_6_0_3_cons_buff_0, ptr nonnull %spec.select)
  tail call void @llvm.aie2p.release(i32 52, i32 1)
  tail call void @llvm.aie2p.release(i32 50, i32 1)
  tail call void @llvm.aie2p.acquire(i32 51, i32 -1)
  tail call void @llvm.aie2p.acquire(i32 53, i32 -1)
  tail call void @op0_matmul_bf16_bf16_64_64_64(ptr nonnull @of_2_broadcast_3_0_6_cons_buff_1, ptr nonnull @of_3_broadcast_6_0_3_cons_buff_1, ptr nonnull %spec.select)
  tail call void @llvm.aie2p.release(i32 52, i32 1)
  tail call void @llvm.aie2p.release(i32 50, i32 1)
  tail call void @llvm.aie2p.acquire(i32 51, i32 -1)
  tail call void @llvm.aie2p.acquire(i32 53, i32 -1)
  tail call void @op0_matmul_bf16_bf16_64_64_64(ptr nonnull @of_2_broadcast_3_0_6_cons_buff_0, ptr nonnull @of_3_broadcast_6_0_3_cons_buff_0, ptr nonnull %spec.select)
  tail call void @llvm.aie2p.release(i32 52, i32 1)
  tail call void @llvm.aie2p.release(i32 50, i32 1)
  tail call void @llvm.aie2p.acquire(i32 51, i32 -1)
  tail call void @llvm.aie2p.acquire(i32 53, i32 -1)
  tail call void @op0_matmul_bf16_bf16_64_64_64(ptr nonnull @of_2_broadcast_3_0_6_cons_buff_1, ptr nonnull @of_3_broadcast_6_0_3_cons_buff_1, ptr nonnull %spec.select)
  tail call void @llvm.aie2p.release(i32 52, i32 1)
  tail call void @llvm.aie2p.release(i32 50, i32 1)
  tail call void @llvm.aie2p.acquire(i32 51, i32 -1)
  tail call void @llvm.aie2p.acquire(i32 53, i32 -1)
  tail call void @op0_matmul_bf16_bf16_64_64_64(ptr nonnull @of_2_broadcast_3_0_6_cons_buff_0, ptr nonnull @of_3_broadcast_6_0_3_cons_buff_0, ptr nonnull %spec.select)
  tail call void @llvm.aie2p.release(i32 52, i32 1)
  tail call void @llvm.aie2p.release(i32 50, i32 1)
  tail call void @llvm.aie2p.acquire(i32 51, i32 -1)
  tail call void @llvm.aie2p.acquire(i32 53, i32 -1)
  tail call void @op0_matmul_bf16_bf16_64_64_64(ptr nonnull @of_2_broadcast_3_0_6_cons_buff_1, ptr nonnull @of_3_broadcast_6_0_3_cons_buff_1, ptr nonnull %spec.select)
  tail call void @llvm.aie2p.release(i32 52, i32 1)
  tail call void @llvm.aie2p.release(i32 50, i32 1)
  tail call void @llvm.aie2p.acquire(i32 51, i32 -1)
  tail call void @llvm.aie2p.acquire(i32 53, i32 -1)
  tail call void @op0_matmul_bf16_bf16_64_64_64(ptr nonnull @of_2_broadcast_3_0_6_cons_buff_0, ptr nonnull @of_3_broadcast_6_0_3_cons_buff_0, ptr nonnull %spec.select)
  tail call void @llvm.aie2p.release(i32 52, i32 1)
  tail call void @llvm.aie2p.release(i32 50, i32 1)
  tail call void @llvm.aie2p.acquire(i32 51, i32 -1)
  tail call void @llvm.aie2p.acquire(i32 53, i32 -1)
  tail call void @op0_matmul_bf16_bf16_64_64_64(ptr nonnull @of_2_broadcast_3_0_6_cons_buff_1, ptr nonnull @of_3_broadcast_6_0_3_cons_buff_1, ptr nonnull %spec.select)
  tail call void @llvm.aie2p.release(i32 52, i32 1)
  tail call void @llvm.aie2p.release(i32 50, i32 1)
  tail call void @llvm.aie2p.release(i32 49, i32 1)
  %3 = add i32 %1, 1
  %4 = icmp sgt i32 %3, 1
  %5 = select i1 %4, i32 0, i32 %3
  tail call void @llvm.aie2p.acquire(i32 48, i32 -1)
  %cond.1 = icmp eq i32 %5, 1
  %spec.select.1 = select i1 %cond.1, ptr @of_4_join_6_3_buff_1, ptr @of_4_join_6_3_buff_0
  tail call void @op0_zero_bf16_64_64_64(ptr nonnull %spec.select.1)
  tail call void @llvm.aie2p.acquire(i32 51, i32 -1)
  tail call void @llvm.aie2p.acquire(i32 53, i32 -1)
  tail call void @op0_matmul_bf16_bf16_64_64_64(ptr nonnull @of_2_broadcast_3_0_6_cons_buff_0, ptr nonnull @of_3_broadcast_6_0_3_cons_buff_0, ptr nonnull %spec.select.1)
  tail call void @llvm.aie2p.release(i32 52, i32 1)
  tail call void @llvm.aie2p.release(i32 50, i32 1)
  tail call void @llvm.aie2p.acquire(i32 51, i32 -1)
  tail call void @llvm.aie2p.acquire(i32 53, i32 -1)
  tail call void @op0_matmul_bf16_bf16_64_64_64(ptr nonnull @of_2_broadcast_3_0_6_cons_buff_1, ptr nonnull @of_3_broadcast_6_0_3_cons_buff_1, ptr nonnull %spec.select.1)
  tail call void @llvm.aie2p.release(i32 52, i32 1)
  tail call void @llvm.aie2p.release(i32 50, i32 1)
  tail call void @llvm.aie2p.acquire(i32 51, i32 -1)
  tail call void @llvm.aie2p.acquire(i32 53, i32 -1)
  tail call void @op0_matmul_bf16_bf16_64_64_64(ptr nonnull @of_2_broadcast_3_0_6_cons_buff_0, ptr nonnull @of_3_broadcast_6_0_3_cons_buff_0, ptr nonnull %spec.select.1)
  tail call void @llvm.aie2p.release(i32 52, i32 1)
  tail call void @llvm.aie2p.release(i32 50, i32 1)
  tail call void @llvm.aie2p.acquire(i32 51, i32 -1)
  tail call void @llvm.aie2p.acquire(i32 53, i32 -1)
  tail call void @op0_matmul_bf16_bf16_64_64_64(ptr nonnull @of_2_broadcast_3_0_6_cons_buff_1, ptr nonnull @of_3_broadcast_6_0_3_cons_buff_1, ptr nonnull %spec.select.1)
  tail call void @llvm.aie2p.release(i32 52, i32 1)
  tail call void @llvm.aie2p.release(i32 50, i32 1)
  tail call void @llvm.aie2p.acquire(i32 51, i32 -1)
  tail call void @llvm.aie2p.acquire(i32 53, i32 -1)
  tail call void @op0_matmul_bf16_bf16_64_64_64(ptr nonnull @of_2_broadcast_3_0_6_cons_buff_0, ptr nonnull @of_3_broadcast_6_0_3_cons_buff_0, ptr nonnull %spec.select.1)
  tail call void @llvm.aie2p.release(i32 52, i32 1)
  tail call void @llvm.aie2p.release(i32 50, i32 1)
  tail call void @llvm.aie2p.acquire(i32 51, i32 -1)
  tail call void @llvm.aie2p.acquire(i32 53, i32 -1)
  tail call void @op0_matmul_bf16_bf16_64_64_64(ptr nonnull @of_2_broadcast_3_0_6_cons_buff_1, ptr nonnull @of_3_broadcast_6_0_3_cons_buff_1, ptr nonnull %spec.select.1)
  tail call void @llvm.aie2p.release(i32 52, i32 1)
  tail call void @llvm.aie2p.release(i32 50, i32 1)
  tail call void @llvm.aie2p.acquire(i32 51, i32 -1)
  tail call void @llvm.aie2p.acquire(i32 53, i32 -1)
  tail call void @op0_matmul_bf16_bf16_64_64_64(ptr nonnull @of_2_broadcast_3_0_6_cons_buff_0, ptr nonnull @of_3_broadcast_6_0_3_cons_buff_0, ptr nonnull %spec.select.1)
  tail call void @llvm.aie2p.release(i32 52, i32 1)
  tail call void @llvm.aie2p.release(i32 50, i32 1)
  tail call void @llvm.aie2p.acquire(i32 51, i32 -1)
  tail call void @llvm.aie2p.acquire(i32 53, i32 -1)
  tail call void @op0_matmul_bf16_bf16_64_64_64(ptr nonnull @of_2_broadcast_3_0_6_cons_buff_1, ptr nonnull @of_3_broadcast_6_0_3_cons_buff_1, ptr nonnull %spec.select.1)
  tail call void @llvm.aie2p.release(i32 52, i32 1)
  tail call void @llvm.aie2p.release(i32 50, i32 1)
  tail call void @llvm.aie2p.release(i32 49, i32 1)
  %6 = add i32 %5, 1
  %7 = icmp sgt i32 %6, 1
  %8 = select i1 %7, i32 0, i32 %6
  tail call void @llvm.aie2p.acquire(i32 48, i32 -1)
  %cond.2 = icmp eq i32 %8, 1
  %spec.select.2 = select i1 %cond.2, ptr @of_4_join_6_3_buff_1, ptr @of_4_join_6_3_buff_0
  tail call void @op0_zero_bf16_64_64_64(ptr nonnull %spec.select.2)
  tail call void @llvm.aie2p.acquire(i32 51, i32 -1)
  tail call void @llvm.aie2p.acquire(i32 53, i32 -1)
  tail call void @op0_matmul_bf16_bf16_64_64_64(ptr nonnull @of_2_broadcast_3_0_6_cons_buff_0, ptr nonnull @of_3_broadcast_6_0_3_cons_buff_0, ptr nonnull %spec.select.2)
  tail call void @llvm.aie2p.release(i32 52, i32 1)
  tail call void @llvm.aie2p.release(i32 50, i32 1)
  tail call void @llvm.aie2p.acquire(i32 51, i32 -1)
  tail call void @llvm.aie2p.acquire(i32 53, i32 -1)
  tail call void @op0_matmul_bf16_bf16_64_64_64(ptr nonnull @of_2_broadcast_3_0_6_cons_buff_1, ptr nonnull @of_3_broadcast_6_0_3_cons_buff_1, ptr nonnull %spec.select.2)
  tail call void @llvm.aie2p.release(i32 52, i32 1)
  tail call void @llvm.aie2p.release(i32 50, i32 1)
  tail call void @llvm.aie2p.acquire(i32 51, i32 -1)
  tail call void @llvm.aie2p.acquire(i32 53, i32 -1)
  tail call void @op0_matmul_bf16_bf16_64_64_64(ptr nonnull @of_2_broadcast_3_0_6_cons_buff_0, ptr nonnull @of_3_broadcast_6_0_3_cons_buff_0, ptr nonnull %spec.select.2)
  tail call void @llvm.aie2p.release(i32 52, i32 1)
  tail call void @llvm.aie2p.release(i32 50, i32 1)
  tail call void @llvm.aie2p.acquire(i32 51, i32 -1)
  tail call void @llvm.aie2p.acquire(i32 53, i32 -1)
  tail call void @op0_matmul_bf16_bf16_64_64_64(ptr nonnull @of_2_broadcast_3_0_6_cons_buff_1, ptr nonnull @of_3_broadcast_6_0_3_cons_buff_1, ptr nonnull %spec.select.2)
  tail call void @llvm.aie2p.release(i32 52, i32 1)
  tail call void @llvm.aie2p.release(i32 50, i32 1)
  tail call void @llvm.aie2p.acquire(i32 51, i32 -1)
  tail call void @llvm.aie2p.acquire(i32 53, i32 -1)
  tail call void @op0_matmul_bf16_bf16_64_64_64(ptr nonnull @of_2_broadcast_3_0_6_cons_buff_0, ptr nonnull @of_3_broadcast_6_0_3_cons_buff_0, ptr nonnull %spec.select.2)
  tail call void @llvm.aie2p.release(i32 52, i32 1)
  tail call void @llvm.aie2p.release(i32 50, i32 1)
  tail call void @llvm.aie2p.acquire(i32 51, i32 -1)
  tail call void @llvm.aie2p.acquire(i32 53, i32 -1)
  tail call void @op0_matmul_bf16_bf16_64_64_64(ptr nonnull @of_2_broadcast_3_0_6_cons_buff_1, ptr nonnull @of_3_broadcast_6_0_3_cons_buff_1, ptr nonnull %spec.select.2)
  tail call void @llvm.aie2p.release(i32 52, i32 1)
  tail call void @llvm.aie2p.release(i32 50, i32 1)
  tail call void @llvm.aie2p.acquire(i32 51, i32 -1)
  tail call void @llvm.aie2p.acquire(i32 53, i32 -1)
  tail call void @op0_matmul_bf16_bf16_64_64_64(ptr nonnull @of_2_broadcast_3_0_6_cons_buff_0, ptr nonnull @of_3_broadcast_6_0_3_cons_buff_0, ptr nonnull %spec.select.2)
  tail call void @llvm.aie2p.release(i32 52, i32 1)
  tail call void @llvm.aie2p.release(i32 50, i32 1)
  tail call void @llvm.aie2p.acquire(i32 51, i32 -1)
  tail call void @llvm.aie2p.acquire(i32 53, i32 -1)
  tail call void @op0_matmul_bf16_bf16_64_64_64(ptr nonnull @of_2_broadcast_3_0_6_cons_buff_1, ptr nonnull @of_3_broadcast_6_0_3_cons_buff_1, ptr nonnull %spec.select.2)
  tail call void @llvm.aie2p.release(i32 52, i32 1)
  tail call void @llvm.aie2p.release(i32 50, i32 1)
  tail call void @llvm.aie2p.release(i32 49, i32 1)
  %9 = add i32 %8, 1
  %10 = icmp sgt i32 %9, 1
  %11 = select i1 %10, i32 0, i32 %9
  tail call void @llvm.aie2p.acquire(i32 48, i32 -1)
  %cond.3 = icmp eq i32 %11, 1
  %spec.select.3 = select i1 %cond.3, ptr @of_4_join_6_3_buff_1, ptr @of_4_join_6_3_buff_0
  tail call void @op0_zero_bf16_64_64_64(ptr nonnull %spec.select.3)
  tail call void @llvm.aie2p.acquire(i32 51, i32 -1)
  tail call void @llvm.aie2p.acquire(i32 53, i32 -1)
  tail call void @op0_matmul_bf16_bf16_64_64_64(ptr nonnull @of_2_broadcast_3_0_6_cons_buff_0, ptr nonnull @of_3_broadcast_6_0_3_cons_buff_0, ptr nonnull %spec.select.3)
  tail call void @llvm.aie2p.release(i32 52, i32 1)
  tail call void @llvm.aie2p.release(i32 50, i32 1)
  tail call void @llvm.aie2p.acquire(i32 51, i32 -1)
  tail call void @llvm.aie2p.acquire(i32 53, i32 -1)
  tail call void @op0_matmul_bf16_bf16_64_64_64(ptr nonnull @of_2_broadcast_3_0_6_cons_buff_1, ptr nonnull @of_3_broadcast_6_0_3_cons_buff_1, ptr nonnull %spec.select.3)
  tail call void @llvm.aie2p.release(i32 52, i32 1)
  tail call void @llvm.aie2p.release(i32 50, i32 1)
  tail call void @llvm.aie2p.acquire(i32 51, i32 -1)
  tail call void @llvm.aie2p.acquire(i32 53, i32 -1)
  tail call void @op0_matmul_bf16_bf16_64_64_64(ptr nonnull @of_2_broadcast_3_0_6_cons_buff_0, ptr nonnull @of_3_broadcast_6_0_3_cons_buff_0, ptr nonnull %spec.select.3)
  tail call void @llvm.aie2p.release(i32 52, i32 1)
  tail call void @llvm.aie2p.release(i32 50, i32 1)
  tail call void @llvm.aie2p.acquire(i32 51, i32 -1)
  tail call void @llvm.aie2p.acquire(i32 53, i32 -1)
  tail call void @op0_matmul_bf16_bf16_64_64_64(ptr nonnull @of_2_broadcast_3_0_6_cons_buff_1, ptr nonnull @of_3_broadcast_6_0_3_cons_buff_1, ptr nonnull %spec.select.3)
  tail call void @llvm.aie2p.release(i32 52, i32 1)
  tail call void @llvm.aie2p.release(i32 50, i32 1)
  tail call void @llvm.aie2p.acquire(i32 51, i32 -1)
  tail call void @llvm.aie2p.acquire(i32 53, i32 -1)
  tail call void @op0_matmul_bf16_bf16_64_64_64(ptr nonnull @of_2_broadcast_3_0_6_cons_buff_0, ptr nonnull @of_3_broadcast_6_0_3_cons_buff_0, ptr nonnull %spec.select.3)
  tail call void @llvm.aie2p.release(i32 52, i32 1)
  tail call void @llvm.aie2p.release(i32 50, i32 1)
  tail call void @llvm.aie2p.acquire(i32 51, i32 -1)
  tail call void @llvm.aie2p.acquire(i32 53, i32 -1)
  tail call void @op0_matmul_bf16_bf16_64_64_64(ptr nonnull @of_2_broadcast_3_0_6_cons_buff_1, ptr nonnull @of_3_broadcast_6_0_3_cons_buff_1, ptr nonnull %spec.select.3)
  tail call void @llvm.aie2p.release(i32 52, i32 1)
  tail call void @llvm.aie2p.release(i32 50, i32 1)
  tail call void @llvm.aie2p.acquire(i32 51, i32 -1)
  tail call void @llvm.aie2p.acquire(i32 53, i32 -1)
  tail call void @op0_matmul_bf16_bf16_64_64_64(ptr nonnull @of_2_broadcast_3_0_6_cons_buff_0, ptr nonnull @of_3_broadcast_6_0_3_cons_buff_0, ptr nonnull %spec.select.3)
  tail call void @llvm.aie2p.release(i32 52, i32 1)
  tail call void @llvm.aie2p.release(i32 50, i32 1)
  tail call void @llvm.aie2p.acquire(i32 51, i32 -1)
  tail call void @llvm.aie2p.acquire(i32 53, i32 -1)
  tail call void @op0_matmul_bf16_bf16_64_64_64(ptr nonnull @of_2_broadcast_3_0_6_cons_buff_1, ptr nonnull @of_3_broadcast_6_0_3_cons_buff_1, ptr nonnull %spec.select.3)
  tail call void @llvm.aie2p.release(i32 52, i32 1)
  tail call void @llvm.aie2p.release(i32 50, i32 1)
  tail call void @llvm.aie2p.release(i32 49, i32 1)
  %12 = add i32 %11, 1
  %13 = icmp sgt i32 %12, 1
  %14 = select i1 %13, i32 0, i32 %12
  %15 = add nuw nsw i64 %2, 1
  %16 = icmp samesign ult i64 %2, 4294967294
  br i1 %16, label %.preheader, label %17

17:                                               ; preds = %.preheader
  ret void
}

attributes #0 = { mustprogress nocallback nofree nosync nounwind willreturn }

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
