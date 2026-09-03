; ModuleID = '/home/micas/iron-stream-dse/experiments/reorder/ro_head_k3_s256_h1/reorder_head_k3_s256_h1_shared_fused.mlir.d/peano-linked_op2__MHAStreamGroup_core_0_4.ll'
source_filename = "LLVMDialectModule"
target datalayout = "e-m:e-p:20:32-i1:8:32-i8:8:32-i16:16:32-i32:32:32-f32:32:32-i64:32-f64:32-a:0:32-n32"
target triple = "aie2p"

@of_2_distribute_0_2_cons_buff_1 = external global [64 x [64 x bfloat]]
@of_2_distribute_0_2_cons_buff_0 = external global [64 x [64 x bfloat]]
@of_3_broadcast_0_0_2_cons_buff_1 = external global [64 x [64 x bfloat]]
@of_3_broadcast_0_0_2_cons_buff_0 = external global [64 x [64 x bfloat]]
@of_4_join_0_2_buff_1 = external global [64 x [64 x bfloat]]
@of_4_join_0_2_buff_0 = external global [64 x [64 x bfloat]]

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.aie2p.acquire(i32, i32) #0

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.aie2p.release(i32, i32) #0

declare void @op2_zero_bf16_64_64_64(ptr) local_unnamed_addr

declare void @op2_matmul_bf16_bf16_64_64_64(ptr, ptr, ptr) local_unnamed_addr

define void @core_0_4() local_unnamed_addr {
  br label %1

1:                                                ; preds = %1, %0
  %2 = phi i32 [ 0, %0 ], [ %12, %1 ]
  %3 = phi i64 [ 0, %0 ], [ %13, %1 ]
  tail call void @llvm.aie2p.acquire(i32 48, i32 -1)
  %cond = icmp eq i32 %2, 1
  %spec.select = select i1 %cond, ptr @of_4_join_0_2_buff_1, ptr @of_4_join_0_2_buff_0
  tail call void @op2_zero_bf16_64_64_64(ptr nonnull %spec.select)
  tail call void @llvm.aie2p.acquire(i32 51, i32 -1)
  tail call void @llvm.aie2p.acquire(i32 53, i32 -1)
  tail call void @op2_matmul_bf16_bf16_64_64_64(ptr nonnull @of_2_distribute_0_2_cons_buff_0, ptr nonnull @of_3_broadcast_0_0_2_cons_buff_0, ptr nonnull %spec.select)
  tail call void @llvm.aie2p.release(i32 52, i32 1)
  tail call void @llvm.aie2p.release(i32 50, i32 1)
  tail call void @llvm.aie2p.acquire(i32 51, i32 -1)
  tail call void @llvm.aie2p.acquire(i32 53, i32 -1)
  tail call void @op2_matmul_bf16_bf16_64_64_64(ptr nonnull @of_2_distribute_0_2_cons_buff_1, ptr nonnull @of_3_broadcast_0_0_2_cons_buff_1, ptr nonnull %spec.select)
  tail call void @llvm.aie2p.release(i32 52, i32 1)
  tail call void @llvm.aie2p.release(i32 50, i32 1)
  tail call void @llvm.aie2p.acquire(i32 51, i32 -1)
  tail call void @llvm.aie2p.acquire(i32 53, i32 -1)
  tail call void @op2_matmul_bf16_bf16_64_64_64(ptr nonnull @of_2_distribute_0_2_cons_buff_0, ptr nonnull @of_3_broadcast_0_0_2_cons_buff_0, ptr nonnull %spec.select)
  tail call void @llvm.aie2p.release(i32 52, i32 1)
  tail call void @llvm.aie2p.release(i32 50, i32 1)
  tail call void @llvm.aie2p.acquire(i32 51, i32 -1)
  tail call void @llvm.aie2p.acquire(i32 53, i32 -1)
  tail call void @op2_matmul_bf16_bf16_64_64_64(ptr nonnull @of_2_distribute_0_2_cons_buff_1, ptr nonnull @of_3_broadcast_0_0_2_cons_buff_1, ptr nonnull %spec.select)
  tail call void @llvm.aie2p.release(i32 52, i32 1)
  tail call void @llvm.aie2p.release(i32 50, i32 1)
  tail call void @llvm.aie2p.release(i32 49, i32 1)
  %4 = add i32 %2, 1
  %5 = icmp sgt i32 %4, 1
  %6 = select i1 %5, i32 0, i32 %4
  tail call void @llvm.aie2p.acquire(i32 48, i32 -1)
  %cond.1 = icmp eq i32 %6, 1
  %spec.select.1 = select i1 %cond.1, ptr @of_4_join_0_2_buff_1, ptr @of_4_join_0_2_buff_0
  tail call void @op2_zero_bf16_64_64_64(ptr nonnull %spec.select.1)
  tail call void @llvm.aie2p.acquire(i32 51, i32 -1)
  tail call void @llvm.aie2p.acquire(i32 53, i32 -1)
  tail call void @op2_matmul_bf16_bf16_64_64_64(ptr nonnull @of_2_distribute_0_2_cons_buff_0, ptr nonnull @of_3_broadcast_0_0_2_cons_buff_0, ptr nonnull %spec.select.1)
  tail call void @llvm.aie2p.release(i32 52, i32 1)
  tail call void @llvm.aie2p.release(i32 50, i32 1)
  tail call void @llvm.aie2p.acquire(i32 51, i32 -1)
  tail call void @llvm.aie2p.acquire(i32 53, i32 -1)
  tail call void @op2_matmul_bf16_bf16_64_64_64(ptr nonnull @of_2_distribute_0_2_cons_buff_1, ptr nonnull @of_3_broadcast_0_0_2_cons_buff_1, ptr nonnull %spec.select.1)
  tail call void @llvm.aie2p.release(i32 52, i32 1)
  tail call void @llvm.aie2p.release(i32 50, i32 1)
  tail call void @llvm.aie2p.acquire(i32 51, i32 -1)
  tail call void @llvm.aie2p.acquire(i32 53, i32 -1)
  tail call void @op2_matmul_bf16_bf16_64_64_64(ptr nonnull @of_2_distribute_0_2_cons_buff_0, ptr nonnull @of_3_broadcast_0_0_2_cons_buff_0, ptr nonnull %spec.select.1)
  tail call void @llvm.aie2p.release(i32 52, i32 1)
  tail call void @llvm.aie2p.release(i32 50, i32 1)
  tail call void @llvm.aie2p.acquire(i32 51, i32 -1)
  tail call void @llvm.aie2p.acquire(i32 53, i32 -1)
  tail call void @op2_matmul_bf16_bf16_64_64_64(ptr nonnull @of_2_distribute_0_2_cons_buff_1, ptr nonnull @of_3_broadcast_0_0_2_cons_buff_1, ptr nonnull %spec.select.1)
  tail call void @llvm.aie2p.release(i32 52, i32 1)
  tail call void @llvm.aie2p.release(i32 50, i32 1)
  tail call void @llvm.aie2p.release(i32 49, i32 1)
  %7 = add i32 %6, 1
  %8 = icmp sgt i32 %7, 1
  %9 = select i1 %8, i32 0, i32 %7
  tail call void @llvm.aie2p.acquire(i32 48, i32 -1)
  %cond.2 = icmp eq i32 %9, 1
  %spec.select.2 = select i1 %cond.2, ptr @of_4_join_0_2_buff_1, ptr @of_4_join_0_2_buff_0
  tail call void @op2_zero_bf16_64_64_64(ptr nonnull %spec.select.2)
  tail call void @llvm.aie2p.acquire(i32 51, i32 -1)
  tail call void @llvm.aie2p.acquire(i32 53, i32 -1)
  tail call void @op2_matmul_bf16_bf16_64_64_64(ptr nonnull @of_2_distribute_0_2_cons_buff_0, ptr nonnull @of_3_broadcast_0_0_2_cons_buff_0, ptr nonnull %spec.select.2)
  tail call void @llvm.aie2p.release(i32 52, i32 1)
  tail call void @llvm.aie2p.release(i32 50, i32 1)
  tail call void @llvm.aie2p.acquire(i32 51, i32 -1)
  tail call void @llvm.aie2p.acquire(i32 53, i32 -1)
  tail call void @op2_matmul_bf16_bf16_64_64_64(ptr nonnull @of_2_distribute_0_2_cons_buff_1, ptr nonnull @of_3_broadcast_0_0_2_cons_buff_1, ptr nonnull %spec.select.2)
  tail call void @llvm.aie2p.release(i32 52, i32 1)
  tail call void @llvm.aie2p.release(i32 50, i32 1)
  tail call void @llvm.aie2p.acquire(i32 51, i32 -1)
  tail call void @llvm.aie2p.acquire(i32 53, i32 -1)
  tail call void @op2_matmul_bf16_bf16_64_64_64(ptr nonnull @of_2_distribute_0_2_cons_buff_0, ptr nonnull @of_3_broadcast_0_0_2_cons_buff_0, ptr nonnull %spec.select.2)
  tail call void @llvm.aie2p.release(i32 52, i32 1)
  tail call void @llvm.aie2p.release(i32 50, i32 1)
  tail call void @llvm.aie2p.acquire(i32 51, i32 -1)
  tail call void @llvm.aie2p.acquire(i32 53, i32 -1)
  tail call void @op2_matmul_bf16_bf16_64_64_64(ptr nonnull @of_2_distribute_0_2_cons_buff_1, ptr nonnull @of_3_broadcast_0_0_2_cons_buff_1, ptr nonnull %spec.select.2)
  tail call void @llvm.aie2p.release(i32 52, i32 1)
  tail call void @llvm.aie2p.release(i32 50, i32 1)
  tail call void @llvm.aie2p.release(i32 49, i32 1)
  %10 = add i32 %9, 1
  %11 = icmp sgt i32 %10, 1
  %12 = select i1 %11, i32 0, i32 %10
  %13 = add nuw nsw i64 %3, 3
  %14 = icmp samesign ult i64 %3, 4294967292
  br i1 %14, label %1, label %15

15:                                               ; preds = %1
  ret void
}

attributes #0 = { mustprogress nocallback nofree nosync nounwind willreturn }

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
