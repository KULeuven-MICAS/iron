; ModuleID = '/home/micas/iron-stream-dse/experiments/wide_sound/c32rowmaj/eq_ours_s2048_c8_h8/mha_prefill_stream_k1_h8_s2048_d64_flash_shared_fused.mlir.d/peano-linked_op0__MHAStreamGroup_core_6_2.ll'
source_filename = "LLVMDialectModule"
target datalayout = "e-m:e-p:20:32-i1:8:32-i8:8:32-i16:16:32-i32:32:32-f32:32:32-i64:32-f64:32-a:0:32-n32"
target triple = "aie2p"

@of_3_unicast_6_0_cons_buff_1 = external global [64 x [64 x bfloat]]
@of_3_unicast_6_0_cons_buff_0 = external global [64 x [64 x bfloat]]
@of_4_broadcast_0_0_6_cons_buff_1 = external global [64 x [64 x bfloat]]
@of_4_broadcast_0_0_6_cons_buff_0 = external global [64 x [64 x bfloat]]
@of_6_unicast_6_buff_0 = external global [64 x [64 x bfloat]]
@of_6_unicast_6_relay_1_buff_0 = external global [64 x [64 x bfloat]]

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.aie2p.acquire(i32, i32) #0

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.aie2p.release(i32, i32) #0

declare void @op0_zero_bf16_64_64_64(ptr) local_unnamed_addr

declare void @op0_matmul_bf16_bf16_64_64_64(ptr, ptr, ptr) local_unnamed_addr

define void @core_6_2() local_unnamed_addr {
  br label %.preheader

.preheader:                                       ; preds = %0, %30
  %1 = phi i32 [ 0, %0 ], [ %24, %30 ]
  %2 = phi i64 [ 0, %0 ], [ %31, %30 ]
  br label %3

3:                                                ; preds = %.preheader, %27
  %4 = phi i32 [ %1, %.preheader ], [ %24, %27 ]
  %5 = phi i64 [ 0, %.preheader ], [ %28, %27 ]
  tail call void @llvm.aie2p.acquire(i32 55, i32 -2)
  %6 = trunc nuw nsw i64 %5 to i32
  %7 = shl nuw nsw i32 %6, 4
  %invariant.op = or disjoint i32 %7, 6
  br label %8

8:                                                ; preds = %3, %21
  %9 = phi i32 [ %4, %3 ], [ %24, %21 ]
  %10 = phi i64 [ 0, %3 ], [ %25, %21 ]
  tail call void @llvm.aie2p.acquire(i32 53, i32 -1)
  %cond = icmp eq i32 %9, 1
  %spec.select = select i1 %cond, ptr @of_4_broadcast_0_0_6_cons_buff_1, ptr @of_4_broadcast_0_0_6_cons_buff_0
  tail call void @llvm.aie2p.acquire(i32 50, i32 -1)
  tail call void @llvm.aie2p.acquire(i32 48, i32 -1)
  tail call void @op0_zero_bf16_64_64_64(ptr nonnull @of_6_unicast_6_buff_0)
  tail call void @op0_zero_bf16_64_64_64(ptr nonnull @of_6_unicast_6_relay_1_buff_0)
  %11 = trunc nuw nsw i64 %10 to i32
  br label %12

12:                                               ; preds = %8, %18
  %13 = phi i64 [ 0, %8 ], [ %19, %18 ]
  %14 = trunc nuw nsw i64 %13 to i32
  %15 = shl nuw nsw i32 %14, 3
  %.reass = add nuw nsw i32 %15, %invariant.op
  %.not = icmp slt i32 %.reass, %11
  br i1 %.not, label %18, label %16

16:                                               ; preds = %12
  %cond1 = icmp eq i64 %13, 1
  %17 = select i1 %cond1, ptr @of_3_unicast_6_0_cons_buff_1, ptr @of_3_unicast_6_0_cons_buff_0
  %spec.select5 = select i1 %cond1, ptr @of_6_unicast_6_relay_1_buff_0, ptr @of_6_unicast_6_buff_0
  tail call void @op0_matmul_bf16_bf16_64_64_64(ptr nonnull %17, ptr nonnull %spec.select, ptr nonnull %spec.select5)
  br label %18

18:                                               ; preds = %16, %12
  %19 = add nuw nsw i64 %13, 1
  %20 = icmp eq i64 %13, 0
  br i1 %20, label %12, label %21

21:                                               ; preds = %18
  tail call void @llvm.aie2p.release(i32 51, i32 1)
  tail call void @llvm.aie2p.release(i32 49, i32 1)
  tail call void @llvm.aie2p.release(i32 52, i32 1)
  %22 = add i32 %9, 1
  %23 = icmp sgt i32 %22, 1
  %24 = select i1 %23, i32 0, i32 %22
  %25 = add nuw nsw i64 %10, 1
  %26 = icmp samesign ult i64 %10, 31
  br i1 %26, label %8, label %27

27:                                               ; preds = %21
  tail call void @llvm.aie2p.release(i32 54, i32 2)
  %28 = add nuw nsw i64 %5, 1
  %29 = icmp eq i64 %5, 0
  br i1 %29, label %3, label %30

30:                                               ; preds = %27
  %31 = add nuw nsw i64 %2, 1
  %32 = icmp samesign ult i64 %2, 4294967294
  br i1 %32, label %.preheader, label %33

33:                                               ; preds = %30
  ret void
}

attributes #0 = { mustprogress nocallback nofree nosync nounwind willreturn }

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
