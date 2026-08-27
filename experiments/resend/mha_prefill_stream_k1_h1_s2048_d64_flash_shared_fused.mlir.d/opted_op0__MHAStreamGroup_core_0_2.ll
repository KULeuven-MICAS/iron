; ModuleID = '/home/micas/iron-stream-dse/experiments/resend/mha_prefill_stream_k1_h1_s2048_d64_flash_shared_fused.mlir.d/peano-linked_op0__MHAStreamGroup_core_0_2.ll'
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
  br label %.preheader

.preheader:                                       ; preds = %0, %31
  %1 = phi i32 [ 0, %0 ], [ %25, %31 ]
  %2 = phi i64 [ 0, %0 ], [ %32, %31 ]
  br label %3

3:                                                ; preds = %.preheader, %28
  %4 = phi i32 [ %1, %.preheader ], [ %25, %28 ]
  %5 = phi i64 [ 0, %.preheader ], [ %29, %28 ]
  tail call void @llvm.aie2p.acquire(i32 55, i32 -2)
  %6 = trunc nuw nsw i64 %5 to i32
  %7 = shl nuw nsw i32 %6, 4
  br label %8

8:                                                ; preds = %3, %22
  %9 = phi i32 [ %4, %3 ], [ %25, %22 ]
  %10 = phi i64 [ 0, %3 ], [ %26, %22 ]
  tail call void @llvm.aie2p.acquire(i32 53, i32 -1)
  %cond = icmp eq i32 %9, 1
  %spec.select = select i1 %cond, ptr @of_4_broadcast_0_0_0_cons_buff_1, ptr @of_4_broadcast_0_0_0_cons_buff_0
  tail call void @llvm.aie2p.acquire(i32 50, i32 -1)
  tail call void @llvm.aie2p.acquire(i32 48, i32 -1)
  tail call void @op0_zero_bf16_64_64_64(ptr nonnull @of_6_unicast_0_buff_0)
  tail call void @op0_zero_bf16_64_64_64(ptr nonnull @of_6_unicast_0_relay_1_buff_0)
  %11 = trunc nuw nsw i64 %10 to i32
  br label %12

12:                                               ; preds = %8, %19
  %13 = phi i64 [ 0, %8 ], [ %20, %19 ]
  %14 = trunc nuw nsw i64 %13 to i32
  %15 = shl nuw nsw i32 %14, 3
  %16 = add nuw nsw i32 %15, %7
  %.not = icmp slt i32 %16, %11
  br i1 %.not, label %19, label %17

17:                                               ; preds = %12
  %cond1 = icmp eq i64 %13, 1
  %18 = select i1 %cond1, ptr @of_3_unicast_0_0_cons_buff_1, ptr @of_3_unicast_0_0_cons_buff_0
  %spec.select5 = select i1 %cond1, ptr @of_6_unicast_0_relay_1_buff_0, ptr @of_6_unicast_0_buff_0
  tail call void @op0_matmul_bf16_bf16_64_64_64(ptr nonnull %18, ptr nonnull %spec.select, ptr nonnull %spec.select5)
  br label %19

19:                                               ; preds = %17, %12
  %20 = add nuw nsw i64 %13, 1
  %21 = icmp eq i64 %13, 0
  br i1 %21, label %12, label %22

22:                                               ; preds = %19
  tail call void @llvm.aie2p.release(i32 51, i32 1)
  tail call void @llvm.aie2p.release(i32 49, i32 1)
  tail call void @llvm.aie2p.release(i32 52, i32 1)
  %23 = add i32 %9, 1
  %24 = icmp sgt i32 %23, 1
  %25 = select i1 %24, i32 0, i32 %23
  %26 = add nuw nsw i64 %10, 1
  %27 = icmp samesign ult i64 %10, 31
  br i1 %27, label %8, label %28

28:                                               ; preds = %22
  tail call void @llvm.aie2p.release(i32 54, i32 2)
  %29 = add nuw nsw i64 %5, 1
  %30 = icmp eq i64 %5, 0
  br i1 %30, label %3, label %31

31:                                               ; preds = %28
  %32 = add nuw nsw i64 %2, 1
  %33 = icmp samesign ult i64 %2, 4294967294
  br i1 %33, label %.preheader, label %34

34:                                               ; preds = %31
  ret void
}

attributes #0 = { mustprogress nocallback nofree nosync nounwind willreturn }

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
