; ModuleID = '/home/micas/iron-stream-dse/experiments/disp256/eq_ours_s256_c0_h1/mha_prefill_stream_k1_h1_s256_d64_flash_shared_fused.mlir.d/peano-linked_op0__MHAStreamGroup_core_3_2.ll'
source_filename = "LLVMDialectModule"
target datalayout = "e-m:e-p:20:32-i1:8:32-i8:8:32-i16:16:32-i32:32:32-f32:32:32-i64:32-f64:32-a:0:32-n32"
target triple = "aie2p"

@of_3_unicast_3_0_cons_buff_0 = external global [64 x [64 x bfloat]]
@of_4_broadcast_0_0_3_cons_buff_1 = external global [64 x [64 x bfloat]]
@of_4_broadcast_0_0_3_cons_buff_0 = external global [64 x [64 x bfloat]]
@of_6_unicast_3_buff_1 = external global [64 x [64 x bfloat]]
@of_6_unicast_3_buff_0 = external global [64 x [64 x bfloat]]

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.aie2p.acquire(i32, i32) #0

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.aie2p.release(i32, i32) #0

declare void @op0_zero_bf16_64_64_64(ptr) local_unnamed_addr

declare void @op0_matmul_bf16_bf16_64_64_64(ptr, ptr, ptr) local_unnamed_addr

define void @core_3_2() local_unnamed_addr {
  br label %1

1:                                                ; preds = %0, %1
  %2 = phi i32 [ 0, %0 ], [ %29, %1 ]
  %3 = phi i32 [ 0, %0 ], [ %32, %1 ]
  %4 = phi i64 [ 0, %0 ], [ %33, %1 ]
  tail call void @llvm.aie2p.acquire(i32 53, i32 -1)
  tail call void @llvm.aie2p.acquire(i32 48, i32 -1)
  %cond = icmp eq i32 %3, 1
  %spec.select = select i1 %cond, ptr @of_6_unicast_3_buff_1, ptr @of_6_unicast_3_buff_0
  tail call void @op0_zero_bf16_64_64_64(ptr nonnull %spec.select)
  tail call void @llvm.aie2p.acquire(i32 51, i32 -1)
  %cond1 = icmp eq i32 %2, 1
  %5 = select i1 %cond1, ptr @of_4_broadcast_0_0_3_cons_buff_1, ptr @of_4_broadcast_0_0_3_cons_buff_0
  tail call void @op0_matmul_bf16_bf16_64_64_64(ptr nonnull @of_3_unicast_3_0_cons_buff_0, ptr nonnull %5, ptr nonnull %spec.select)
  tail call void @llvm.aie2p.release(i32 50, i32 1)
  %6 = add i32 %2, 1
  %7 = icmp sgt i32 %6, 1
  %8 = select i1 %7, i32 0, i32 %6
  tail call void @llvm.aie2p.release(i32 49, i32 1)
  %9 = add i32 %3, 1
  %10 = icmp sgt i32 %9, 1
  %11 = select i1 %10, i32 0, i32 %9
  tail call void @llvm.aie2p.acquire(i32 48, i32 -1)
  %cond.1 = icmp eq i32 %11, 1
  %spec.select.1 = select i1 %cond.1, ptr @of_6_unicast_3_buff_1, ptr @of_6_unicast_3_buff_0
  tail call void @op0_zero_bf16_64_64_64(ptr nonnull %spec.select.1)
  tail call void @llvm.aie2p.acquire(i32 51, i32 -1)
  %cond1.1 = icmp eq i32 %8, 1
  %12 = select i1 %cond1.1, ptr @of_4_broadcast_0_0_3_cons_buff_1, ptr @of_4_broadcast_0_0_3_cons_buff_0
  tail call void @op0_matmul_bf16_bf16_64_64_64(ptr nonnull @of_3_unicast_3_0_cons_buff_0, ptr nonnull %12, ptr nonnull %spec.select.1)
  tail call void @llvm.aie2p.release(i32 50, i32 1)
  %13 = add i32 %8, 1
  %14 = icmp sgt i32 %13, 1
  %15 = select i1 %14, i32 0, i32 %13
  tail call void @llvm.aie2p.release(i32 49, i32 1)
  %16 = add i32 %11, 1
  %17 = icmp sgt i32 %16, 1
  %18 = select i1 %17, i32 0, i32 %16
  tail call void @llvm.aie2p.acquire(i32 48, i32 -1)
  %cond.2 = icmp eq i32 %18, 1
  %spec.select.2 = select i1 %cond.2, ptr @of_6_unicast_3_buff_1, ptr @of_6_unicast_3_buff_0
  tail call void @op0_zero_bf16_64_64_64(ptr nonnull %spec.select.2)
  tail call void @llvm.aie2p.acquire(i32 51, i32 -1)
  %cond1.2 = icmp eq i32 %15, 1
  %19 = select i1 %cond1.2, ptr @of_4_broadcast_0_0_3_cons_buff_1, ptr @of_4_broadcast_0_0_3_cons_buff_0
  tail call void @op0_matmul_bf16_bf16_64_64_64(ptr nonnull @of_3_unicast_3_0_cons_buff_0, ptr nonnull %19, ptr nonnull %spec.select.2)
  tail call void @llvm.aie2p.release(i32 50, i32 1)
  %20 = add i32 %15, 1
  %21 = icmp sgt i32 %20, 1
  %22 = select i1 %21, i32 0, i32 %20
  tail call void @llvm.aie2p.release(i32 49, i32 1)
  %23 = add i32 %18, 1
  %24 = icmp sgt i32 %23, 1
  %25 = select i1 %24, i32 0, i32 %23
  tail call void @llvm.aie2p.acquire(i32 48, i32 -1)
  %cond.3 = icmp eq i32 %25, 1
  %spec.select.3 = select i1 %cond.3, ptr @of_6_unicast_3_buff_1, ptr @of_6_unicast_3_buff_0
  tail call void @op0_zero_bf16_64_64_64(ptr nonnull %spec.select.3)
  tail call void @llvm.aie2p.acquire(i32 51, i32 -1)
  %cond1.3 = icmp eq i32 %22, 1
  %26 = select i1 %cond1.3, ptr @of_4_broadcast_0_0_3_cons_buff_1, ptr @of_4_broadcast_0_0_3_cons_buff_0
  tail call void @op0_matmul_bf16_bf16_64_64_64(ptr nonnull @of_3_unicast_3_0_cons_buff_0, ptr nonnull %26, ptr nonnull %spec.select.3)
  tail call void @llvm.aie2p.release(i32 50, i32 1)
  %27 = add i32 %22, 1
  %28 = icmp sgt i32 %27, 1
  %29 = select i1 %28, i32 0, i32 %27
  tail call void @llvm.aie2p.release(i32 49, i32 1)
  %30 = add i32 %25, 1
  %31 = icmp sgt i32 %30, 1
  %32 = select i1 %31, i32 0, i32 %30
  tail call void @llvm.aie2p.release(i32 52, i32 1)
  %33 = add nuw nsw i64 %4, 1
  %34 = icmp samesign ult i64 %4, 4294967294
  br i1 %34, label %1, label %35

35:                                               ; preds = %1
  ret void
}

attributes #0 = { mustprogress nocallback nofree nosync nounwind willreturn }

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
