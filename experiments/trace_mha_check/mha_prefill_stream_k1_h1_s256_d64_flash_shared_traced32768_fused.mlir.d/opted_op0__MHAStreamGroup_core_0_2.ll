; ModuleID = '/home/micas/iron-stream-dse/experiments/trace_mha_check/mha_prefill_stream_k1_h1_s256_d64_flash_shared_traced32768_fused.mlir.d/peano-linked_op0__MHAStreamGroup_core_0_2.ll'
source_filename = "LLVMDialectModule"
target datalayout = "e-m:e-p:20:32-i1:8:32-i8:8:32-i16:16:32-i32:32:32-f32:32:32-i64:32-f64:32-a:0:32-n32"
target triple = "aie2p"

@of_3_unicast_0_0_cons_buff_1 = external global [64 x [64 x bfloat]]
@of_3_unicast_0_0_cons_buff_0 = external global [64 x [64 x bfloat]]
@of_4_broadcast_0_0_0_cons_buff_1 = external global [64 x [64 x bfloat]]
@of_4_broadcast_0_0_0_cons_buff_0 = external global [64 x [64 x bfloat]]
@of_6_unicast_0_buff_0 = external global [64 x [64 x bfloat]]
@of_6_unicast_0_relay_1_buff_0 = external global [64 x [64 x bfloat]]

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.aie2p.acquire(i32, i32) #0

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.aie2p.release(i32, i32) #0

declare void @op0_zero_bf16_64_64_64(ptr) local_unnamed_addr

declare void @op0_matmul_bf16_bf16_64_64_64(ptr, ptr, ptr) local_unnamed_addr

define void @core_0_2() local_unnamed_addr {
  br label %1

1:                                                ; preds = %0, %23
  %2 = phi i32 [ 0, %0 ], [ %20, %23 ]
  %3 = phi i64 [ 0, %0 ], [ %24, %23 ]
  tail call void @llvm.aie2p.acquire(i32 55, i32 -2)
  br label %4

4:                                                ; preds = %1, %17
  %5 = phi i32 [ %2, %1 ], [ %20, %17 ]
  %6 = phi i64 [ 0, %1 ], [ %21, %17 ]
  tail call void @llvm.aie2p.acquire(i32 53, i32 -1)
  %cond = icmp eq i32 %5, 1
  %spec.select = select i1 %cond, ptr @of_4_broadcast_0_0_0_cons_buff_1, ptr @of_4_broadcast_0_0_0_cons_buff_0
  tail call void @llvm.aie2p.acquire(i32 50, i32 -1)
  tail call void @llvm.aie2p.acquire(i32 48, i32 -1)
  tail call void @op0_zero_bf16_64_64_64(ptr nonnull @of_6_unicast_0_buff_0)
  tail call void @op0_zero_bf16_64_64_64(ptr nonnull @of_6_unicast_0_relay_1_buff_0)
  %7 = trunc nuw nsw i64 %6 to i32
  br label %8

8:                                                ; preds = %4, %14
  %9 = phi i64 [ 0, %4 ], [ %15, %14 ]
  %10 = trunc nuw nsw i64 %9 to i32
  %11 = shl nuw nsw i32 %10, 1
  %.not = icmp slt i32 %11, %7
  br i1 %.not, label %14, label %12

12:                                               ; preds = %8
  %cond1 = icmp eq i64 %9, 1
  %13 = select i1 %cond1, ptr @of_3_unicast_0_0_cons_buff_1, ptr @of_3_unicast_0_0_cons_buff_0
  %spec.select5 = select i1 %cond1, ptr @of_6_unicast_0_relay_1_buff_0, ptr @of_6_unicast_0_buff_0
  tail call void @op0_matmul_bf16_bf16_64_64_64(ptr nonnull %13, ptr nonnull %spec.select, ptr nonnull %spec.select5)
  br label %14

14:                                               ; preds = %12, %8
  %15 = add nuw nsw i64 %9, 1
  %16 = icmp eq i64 %9, 0
  br i1 %16, label %8, label %17

17:                                               ; preds = %14
  tail call void @llvm.aie2p.release(i32 51, i32 1)
  tail call void @llvm.aie2p.release(i32 49, i32 1)
  tail call void @llvm.aie2p.release(i32 52, i32 1)
  %18 = add i32 %5, 1
  %19 = icmp sgt i32 %18, 1
  %20 = select i1 %19, i32 0, i32 %18
  %21 = add nuw nsw i64 %6, 1
  %22 = icmp samesign ult i64 %6, 3
  br i1 %22, label %4, label %23

23:                                               ; preds = %17
  tail call void @llvm.aie2p.release(i32 54, i32 2)
  %24 = add nuw nsw i64 %3, 1
  %25 = icmp samesign ult i64 %3, 4294967294
  br i1 %25, label %1, label %26

26:                                               ; preds = %23
  ret void
}

attributes #0 = { mustprogress nocallback nofree nosync nounwind willreturn }

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
