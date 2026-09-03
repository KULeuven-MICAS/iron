; ModuleID = '/home/micas/iron-stream-dse/experiments/lowheads/eq_ours_s512_c0_h8/mha_prefill_stream_k1_h8_s512_d64_flash_shared_fused.mlir.d/peano-linked_op0__MHAStreamGroup_core_7_2.ll'
source_filename = "LLVMDialectModule"
target datalayout = "e-m:e-p:20:32-i1:8:32-i8:8:32-i16:16:32-i32:32:32-f32:32:32-i64:32-f64:32-a:0:32-n32"
target triple = "aie2p"

@of_3_unicast_7_0_cons_buff_0 = external global [64 x [64 x bfloat]]
@of_4_broadcast_0_0_7_cons_buff_1 = external global [64 x [64 x bfloat]]
@of_4_broadcast_0_0_7_cons_buff_0 = external global [64 x [64 x bfloat]]
@of_6_unicast_7_buff_1 = external global [64 x [64 x bfloat]]
@of_6_unicast_7_buff_0 = external global [64 x [64 x bfloat]]

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.aie2p.acquire(i32, i32) #0

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.aie2p.release(i32, i32) #0

declare void @op0_zero_bf16_64_64_64(ptr) local_unnamed_addr

declare void @op0_matmul_bf16_bf16_64_64_64(ptr, ptr, ptr) local_unnamed_addr

define void @core_7_2() local_unnamed_addr {
  br label %1

1:                                                ; preds = %0, %1
  %2 = phi i32 [ 0, %0 ], [ %57, %1 ]
  %3 = phi i32 [ 0, %0 ], [ %60, %1 ]
  %4 = phi i64 [ 0, %0 ], [ %61, %1 ]
  tail call void @llvm.aie2p.acquire(i32 53, i32 -1)
  tail call void @llvm.aie2p.acquire(i32 48, i32 -1)
  %cond = icmp eq i32 %3, 1
  %spec.select = select i1 %cond, ptr @of_6_unicast_7_buff_1, ptr @of_6_unicast_7_buff_0
  tail call void @op0_zero_bf16_64_64_64(ptr nonnull %spec.select)
  tail call void @llvm.aie2p.acquire(i32 51, i32 -1)
  %cond1 = icmp eq i32 %2, 1
  %5 = select i1 %cond1, ptr @of_4_broadcast_0_0_7_cons_buff_1, ptr @of_4_broadcast_0_0_7_cons_buff_0
  tail call void @op0_matmul_bf16_bf16_64_64_64(ptr nonnull @of_3_unicast_7_0_cons_buff_0, ptr nonnull %5, ptr nonnull %spec.select)
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
  %spec.select.1 = select i1 %cond.1, ptr @of_6_unicast_7_buff_1, ptr @of_6_unicast_7_buff_0
  tail call void @op0_zero_bf16_64_64_64(ptr nonnull %spec.select.1)
  tail call void @llvm.aie2p.acquire(i32 51, i32 -1)
  %cond1.1 = icmp eq i32 %8, 1
  %12 = select i1 %cond1.1, ptr @of_4_broadcast_0_0_7_cons_buff_1, ptr @of_4_broadcast_0_0_7_cons_buff_0
  tail call void @op0_matmul_bf16_bf16_64_64_64(ptr nonnull @of_3_unicast_7_0_cons_buff_0, ptr nonnull %12, ptr nonnull %spec.select.1)
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
  %spec.select.2 = select i1 %cond.2, ptr @of_6_unicast_7_buff_1, ptr @of_6_unicast_7_buff_0
  tail call void @op0_zero_bf16_64_64_64(ptr nonnull %spec.select.2)
  tail call void @llvm.aie2p.acquire(i32 51, i32 -1)
  %cond1.2 = icmp eq i32 %15, 1
  %19 = select i1 %cond1.2, ptr @of_4_broadcast_0_0_7_cons_buff_1, ptr @of_4_broadcast_0_0_7_cons_buff_0
  tail call void @op0_matmul_bf16_bf16_64_64_64(ptr nonnull @of_3_unicast_7_0_cons_buff_0, ptr nonnull %19, ptr nonnull %spec.select.2)
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
  %spec.select.3 = select i1 %cond.3, ptr @of_6_unicast_7_buff_1, ptr @of_6_unicast_7_buff_0
  tail call void @op0_zero_bf16_64_64_64(ptr nonnull %spec.select.3)
  tail call void @llvm.aie2p.acquire(i32 51, i32 -1)
  %cond1.3 = icmp eq i32 %22, 1
  %26 = select i1 %cond1.3, ptr @of_4_broadcast_0_0_7_cons_buff_1, ptr @of_4_broadcast_0_0_7_cons_buff_0
  tail call void @op0_matmul_bf16_bf16_64_64_64(ptr nonnull @of_3_unicast_7_0_cons_buff_0, ptr nonnull %26, ptr nonnull %spec.select.3)
  tail call void @llvm.aie2p.release(i32 50, i32 1)
  %27 = add i32 %22, 1
  %28 = icmp sgt i32 %27, 1
  %29 = select i1 %28, i32 0, i32 %27
  tail call void @llvm.aie2p.release(i32 49, i32 1)
  %30 = add i32 %25, 1
  %31 = icmp sgt i32 %30, 1
  %32 = select i1 %31, i32 0, i32 %30
  tail call void @llvm.aie2p.acquire(i32 48, i32 -1)
  %cond.4 = icmp eq i32 %32, 1
  %spec.select.4 = select i1 %cond.4, ptr @of_6_unicast_7_buff_1, ptr @of_6_unicast_7_buff_0
  tail call void @op0_zero_bf16_64_64_64(ptr nonnull %spec.select.4)
  tail call void @llvm.aie2p.acquire(i32 51, i32 -1)
  %cond1.4 = icmp eq i32 %29, 1
  %33 = select i1 %cond1.4, ptr @of_4_broadcast_0_0_7_cons_buff_1, ptr @of_4_broadcast_0_0_7_cons_buff_0
  tail call void @op0_matmul_bf16_bf16_64_64_64(ptr nonnull @of_3_unicast_7_0_cons_buff_0, ptr nonnull %33, ptr nonnull %spec.select.4)
  tail call void @llvm.aie2p.release(i32 50, i32 1)
  %34 = add i32 %29, 1
  %35 = icmp sgt i32 %34, 1
  %36 = select i1 %35, i32 0, i32 %34
  tail call void @llvm.aie2p.release(i32 49, i32 1)
  %37 = add i32 %32, 1
  %38 = icmp sgt i32 %37, 1
  %39 = select i1 %38, i32 0, i32 %37
  tail call void @llvm.aie2p.acquire(i32 48, i32 -1)
  %cond.5 = icmp eq i32 %39, 1
  %spec.select.5 = select i1 %cond.5, ptr @of_6_unicast_7_buff_1, ptr @of_6_unicast_7_buff_0
  tail call void @op0_zero_bf16_64_64_64(ptr nonnull %spec.select.5)
  tail call void @llvm.aie2p.acquire(i32 51, i32 -1)
  %cond1.5 = icmp eq i32 %36, 1
  %40 = select i1 %cond1.5, ptr @of_4_broadcast_0_0_7_cons_buff_1, ptr @of_4_broadcast_0_0_7_cons_buff_0
  tail call void @op0_matmul_bf16_bf16_64_64_64(ptr nonnull @of_3_unicast_7_0_cons_buff_0, ptr nonnull %40, ptr nonnull %spec.select.5)
  tail call void @llvm.aie2p.release(i32 50, i32 1)
  %41 = add i32 %36, 1
  %42 = icmp sgt i32 %41, 1
  %43 = select i1 %42, i32 0, i32 %41
  tail call void @llvm.aie2p.release(i32 49, i32 1)
  %44 = add i32 %39, 1
  %45 = icmp sgt i32 %44, 1
  %46 = select i1 %45, i32 0, i32 %44
  tail call void @llvm.aie2p.acquire(i32 48, i32 -1)
  %cond.6 = icmp eq i32 %46, 1
  %spec.select.6 = select i1 %cond.6, ptr @of_6_unicast_7_buff_1, ptr @of_6_unicast_7_buff_0
  tail call void @op0_zero_bf16_64_64_64(ptr nonnull %spec.select.6)
  tail call void @llvm.aie2p.acquire(i32 51, i32 -1)
  %cond1.6 = icmp eq i32 %43, 1
  %47 = select i1 %cond1.6, ptr @of_4_broadcast_0_0_7_cons_buff_1, ptr @of_4_broadcast_0_0_7_cons_buff_0
  tail call void @op0_matmul_bf16_bf16_64_64_64(ptr nonnull @of_3_unicast_7_0_cons_buff_0, ptr nonnull %47, ptr nonnull %spec.select.6)
  tail call void @llvm.aie2p.release(i32 50, i32 1)
  %48 = add i32 %43, 1
  %49 = icmp sgt i32 %48, 1
  %50 = select i1 %49, i32 0, i32 %48
  tail call void @llvm.aie2p.release(i32 49, i32 1)
  %51 = add i32 %46, 1
  %52 = icmp sgt i32 %51, 1
  %53 = select i1 %52, i32 0, i32 %51
  tail call void @llvm.aie2p.acquire(i32 48, i32 -1)
  %cond.7 = icmp eq i32 %53, 1
  %spec.select.7 = select i1 %cond.7, ptr @of_6_unicast_7_buff_1, ptr @of_6_unicast_7_buff_0
  tail call void @op0_zero_bf16_64_64_64(ptr nonnull %spec.select.7)
  tail call void @llvm.aie2p.acquire(i32 51, i32 -1)
  %cond1.7 = icmp eq i32 %50, 1
  %54 = select i1 %cond1.7, ptr @of_4_broadcast_0_0_7_cons_buff_1, ptr @of_4_broadcast_0_0_7_cons_buff_0
  tail call void @op0_matmul_bf16_bf16_64_64_64(ptr nonnull @of_3_unicast_7_0_cons_buff_0, ptr nonnull %54, ptr nonnull %spec.select.7)
  tail call void @llvm.aie2p.release(i32 50, i32 1)
  %55 = add i32 %50, 1
  %56 = icmp sgt i32 %55, 1
  %57 = select i1 %56, i32 0, i32 %55
  tail call void @llvm.aie2p.release(i32 49, i32 1)
  %58 = add i32 %53, 1
  %59 = icmp sgt i32 %58, 1
  %60 = select i1 %59, i32 0, i32 %58
  tail call void @llvm.aie2p.release(i32 52, i32 1)
  %61 = add nuw nsw i64 %4, 1
  %62 = icmp samesign ult i64 %4, 4294967294
  br i1 %62, label %1, label %63

63:                                               ; preds = %1
  ret void
}

attributes #0 = { mustprogress nocallback nofree nosync nounwind willreturn }

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
