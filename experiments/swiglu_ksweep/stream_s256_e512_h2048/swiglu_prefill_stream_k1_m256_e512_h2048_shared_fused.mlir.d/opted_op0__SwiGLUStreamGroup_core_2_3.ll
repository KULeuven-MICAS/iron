; ModuleID = '/home/micas/iron-stream-dse/experiments/swiglu_ksweep/stream_s256_e512_h2048/swiglu_prefill_stream_k1_m256_e512_h2048_shared_fused.mlir.d/peano-linked_op0__SwiGLUStreamGroup_core_2_3.ll'
source_filename = "LLVMDialectModule"
target datalayout = "e-m:e-p:20:32-i1:8:32-i8:8:32-i16:16:32-i32:32:32-f32:32:32-i64:32-f64:32-a:0:32-n32"
target triple = "aie2p"

@of_4_distribute_0_1_1_cons_buff_1 = external global [32 x [32 x bfloat]]
@of_4_distribute_0_1_1_cons_buff_0 = external global [32 x [32 x bfloat]]
@of_6_broadcast_0_0_1_cons_buff_1 = external global [32 x [64 x bfloat]]
@of_6_broadcast_0_0_1_cons_buff_0 = external global [32 x [64 x bfloat]]
@of_9_switch_join_1_0_buff_1 = external global [32 x [64 x bfloat]]
@of_9_switch_join_1_0_buff_0 = external global [32 x [64 x bfloat]]

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.aie2p.acquire(i32, i32) #0

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.aie2p.release(i32, i32) #0

declare void @op0_zero_bf16_32_32_64(ptr) local_unnamed_addr

declare void @op0_matmul_bf16_bf16_32_32_64(ptr, ptr, ptr) local_unnamed_addr

define void @core_2_3() local_unnamed_addr {
  br label %.preheader5

.preheader5:                                      ; preds = %0, %16
  %1 = phi i32 [ 0, %0 ], [ %10, %16 ]
  %2 = phi i64 [ 0, %0 ], [ %17, %16 ]
  br label %.preheader

.preheader:                                       ; preds = %.preheader5, %13
  %3 = phi i32 [ %1, %.preheader5 ], [ %10, %13 ]
  %4 = phi i64 [ 0, %.preheader5 ], [ %14, %13 ]
  br label %5

5:                                                ; preds = %.preheader, %5
  %6 = phi i32 [ %3, %.preheader ], [ %10, %5 ]
  %7 = phi i64 [ 0, %.preheader ], [ %11, %5 ]
  tail call void @llvm.aie2p.acquire(i32 48, i32 -1)
  %cond = icmp eq i32 %6, 1
  %spec.select = select i1 %cond, ptr @of_9_switch_join_1_0_buff_1, ptr @of_9_switch_join_1_0_buff_0
  tail call void @op0_zero_bf16_32_32_64(ptr nonnull %spec.select)
  tail call void @llvm.aie2p.acquire(i32 51, i32 -1)
  tail call void @llvm.aie2p.acquire(i32 53, i32 -1)
  tail call void @op0_matmul_bf16_bf16_32_32_64(ptr nonnull @of_4_distribute_0_1_1_cons_buff_0, ptr nonnull @of_6_broadcast_0_0_1_cons_buff_0, ptr nonnull %spec.select)
  tail call void @llvm.aie2p.release(i32 52, i32 1)
  tail call void @llvm.aie2p.release(i32 50, i32 1)
  tail call void @llvm.aie2p.acquire(i32 51, i32 -1)
  tail call void @llvm.aie2p.acquire(i32 53, i32 -1)
  tail call void @op0_matmul_bf16_bf16_32_32_64(ptr nonnull @of_4_distribute_0_1_1_cons_buff_1, ptr nonnull @of_6_broadcast_0_0_1_cons_buff_1, ptr nonnull %spec.select)
  tail call void @llvm.aie2p.release(i32 52, i32 1)
  tail call void @llvm.aie2p.release(i32 50, i32 1)
  tail call void @llvm.aie2p.acquire(i32 51, i32 -1)
  tail call void @llvm.aie2p.acquire(i32 53, i32 -1)
  tail call void @op0_matmul_bf16_bf16_32_32_64(ptr nonnull @of_4_distribute_0_1_1_cons_buff_0, ptr nonnull @of_6_broadcast_0_0_1_cons_buff_0, ptr nonnull %spec.select)
  tail call void @llvm.aie2p.release(i32 52, i32 1)
  tail call void @llvm.aie2p.release(i32 50, i32 1)
  tail call void @llvm.aie2p.acquire(i32 51, i32 -1)
  tail call void @llvm.aie2p.acquire(i32 53, i32 -1)
  tail call void @op0_matmul_bf16_bf16_32_32_64(ptr nonnull @of_4_distribute_0_1_1_cons_buff_1, ptr nonnull @of_6_broadcast_0_0_1_cons_buff_1, ptr nonnull %spec.select)
  tail call void @llvm.aie2p.release(i32 52, i32 1)
  tail call void @llvm.aie2p.release(i32 50, i32 1)
  tail call void @llvm.aie2p.acquire(i32 51, i32 -1)
  tail call void @llvm.aie2p.acquire(i32 53, i32 -1)
  tail call void @op0_matmul_bf16_bf16_32_32_64(ptr nonnull @of_4_distribute_0_1_1_cons_buff_0, ptr nonnull @of_6_broadcast_0_0_1_cons_buff_0, ptr nonnull %spec.select)
  tail call void @llvm.aie2p.release(i32 52, i32 1)
  tail call void @llvm.aie2p.release(i32 50, i32 1)
  tail call void @llvm.aie2p.acquire(i32 51, i32 -1)
  tail call void @llvm.aie2p.acquire(i32 53, i32 -1)
  tail call void @op0_matmul_bf16_bf16_32_32_64(ptr nonnull @of_4_distribute_0_1_1_cons_buff_1, ptr nonnull @of_6_broadcast_0_0_1_cons_buff_1, ptr nonnull %spec.select)
  tail call void @llvm.aie2p.release(i32 52, i32 1)
  tail call void @llvm.aie2p.release(i32 50, i32 1)
  tail call void @llvm.aie2p.acquire(i32 51, i32 -1)
  tail call void @llvm.aie2p.acquire(i32 53, i32 -1)
  tail call void @op0_matmul_bf16_bf16_32_32_64(ptr nonnull @of_4_distribute_0_1_1_cons_buff_0, ptr nonnull @of_6_broadcast_0_0_1_cons_buff_0, ptr nonnull %spec.select)
  tail call void @llvm.aie2p.release(i32 52, i32 1)
  tail call void @llvm.aie2p.release(i32 50, i32 1)
  tail call void @llvm.aie2p.acquire(i32 51, i32 -1)
  tail call void @llvm.aie2p.acquire(i32 53, i32 -1)
  tail call void @op0_matmul_bf16_bf16_32_32_64(ptr nonnull @of_4_distribute_0_1_1_cons_buff_1, ptr nonnull @of_6_broadcast_0_0_1_cons_buff_1, ptr nonnull %spec.select)
  tail call void @llvm.aie2p.release(i32 52, i32 1)
  tail call void @llvm.aie2p.release(i32 50, i32 1)
  tail call void @llvm.aie2p.acquire(i32 51, i32 -1)
  tail call void @llvm.aie2p.acquire(i32 53, i32 -1)
  tail call void @op0_matmul_bf16_bf16_32_32_64(ptr nonnull @of_4_distribute_0_1_1_cons_buff_0, ptr nonnull @of_6_broadcast_0_0_1_cons_buff_0, ptr nonnull %spec.select)
  tail call void @llvm.aie2p.release(i32 52, i32 1)
  tail call void @llvm.aie2p.release(i32 50, i32 1)
  tail call void @llvm.aie2p.acquire(i32 51, i32 -1)
  tail call void @llvm.aie2p.acquire(i32 53, i32 -1)
  tail call void @op0_matmul_bf16_bf16_32_32_64(ptr nonnull @of_4_distribute_0_1_1_cons_buff_1, ptr nonnull @of_6_broadcast_0_0_1_cons_buff_1, ptr nonnull %spec.select)
  tail call void @llvm.aie2p.release(i32 52, i32 1)
  tail call void @llvm.aie2p.release(i32 50, i32 1)
  tail call void @llvm.aie2p.acquire(i32 51, i32 -1)
  tail call void @llvm.aie2p.acquire(i32 53, i32 -1)
  tail call void @op0_matmul_bf16_bf16_32_32_64(ptr nonnull @of_4_distribute_0_1_1_cons_buff_0, ptr nonnull @of_6_broadcast_0_0_1_cons_buff_0, ptr nonnull %spec.select)
  tail call void @llvm.aie2p.release(i32 52, i32 1)
  tail call void @llvm.aie2p.release(i32 50, i32 1)
  tail call void @llvm.aie2p.acquire(i32 51, i32 -1)
  tail call void @llvm.aie2p.acquire(i32 53, i32 -1)
  tail call void @op0_matmul_bf16_bf16_32_32_64(ptr nonnull @of_4_distribute_0_1_1_cons_buff_1, ptr nonnull @of_6_broadcast_0_0_1_cons_buff_1, ptr nonnull %spec.select)
  tail call void @llvm.aie2p.release(i32 52, i32 1)
  tail call void @llvm.aie2p.release(i32 50, i32 1)
  tail call void @llvm.aie2p.acquire(i32 51, i32 -1)
  tail call void @llvm.aie2p.acquire(i32 53, i32 -1)
  tail call void @op0_matmul_bf16_bf16_32_32_64(ptr nonnull @of_4_distribute_0_1_1_cons_buff_0, ptr nonnull @of_6_broadcast_0_0_1_cons_buff_0, ptr nonnull %spec.select)
  tail call void @llvm.aie2p.release(i32 52, i32 1)
  tail call void @llvm.aie2p.release(i32 50, i32 1)
  tail call void @llvm.aie2p.acquire(i32 51, i32 -1)
  tail call void @llvm.aie2p.acquire(i32 53, i32 -1)
  tail call void @op0_matmul_bf16_bf16_32_32_64(ptr nonnull @of_4_distribute_0_1_1_cons_buff_1, ptr nonnull @of_6_broadcast_0_0_1_cons_buff_1, ptr nonnull %spec.select)
  tail call void @llvm.aie2p.release(i32 52, i32 1)
  tail call void @llvm.aie2p.release(i32 50, i32 1)
  tail call void @llvm.aie2p.acquire(i32 51, i32 -1)
  tail call void @llvm.aie2p.acquire(i32 53, i32 -1)
  tail call void @op0_matmul_bf16_bf16_32_32_64(ptr nonnull @of_4_distribute_0_1_1_cons_buff_0, ptr nonnull @of_6_broadcast_0_0_1_cons_buff_0, ptr nonnull %spec.select)
  tail call void @llvm.aie2p.release(i32 52, i32 1)
  tail call void @llvm.aie2p.release(i32 50, i32 1)
  tail call void @llvm.aie2p.acquire(i32 51, i32 -1)
  tail call void @llvm.aie2p.acquire(i32 53, i32 -1)
  tail call void @op0_matmul_bf16_bf16_32_32_64(ptr nonnull @of_4_distribute_0_1_1_cons_buff_1, ptr nonnull @of_6_broadcast_0_0_1_cons_buff_1, ptr nonnull %spec.select)
  tail call void @llvm.aie2p.release(i32 52, i32 1)
  tail call void @llvm.aie2p.release(i32 50, i32 1)
  tail call void @llvm.aie2p.release(i32 49, i32 1)
  %8 = add i32 %6, 1
  %9 = icmp sgt i32 %8, 1
  %10 = select i1 %9, i32 0, i32 %8
  %11 = add nuw nsw i64 %7, 1
  %12 = icmp samesign ult i64 %7, 15
  br i1 %12, label %5, label %13

13:                                               ; preds = %5
  %14 = add nuw nsw i64 %4, 1
  %15 = icmp eq i64 %4, 0
  br i1 %15, label %.preheader, label %16

16:                                               ; preds = %13
  %17 = add nuw nsw i64 %2, 1
  %18 = icmp samesign ult i64 %2, 4294967294
  br i1 %18, label %.preheader5, label %19

19:                                               ; preds = %16
  ret void
}

attributes #0 = { mustprogress nocallback nofree nosync nounwind willreturn }

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
