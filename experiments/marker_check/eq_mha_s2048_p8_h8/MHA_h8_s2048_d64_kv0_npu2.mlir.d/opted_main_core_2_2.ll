; ModuleID = '/home/micas/iron-stream-dse/experiments/marker_check/eq_mha_s2048_p8_h8/MHA_h8_s2048_d64_kv0_npu2.mlir.d/peano-linked_main_core_2_2.ll'
source_filename = "LLVMDialectModule"
target datalayout = "e-m:e-p:20:32-i1:8:32-i8:8:32-i16:16:32-i32:32:32-f32:32:32-i64:32-f64:32-a:0:32-n32"
target triple = "aie2p"

@idx_buffer_qk_2 = global [2 x i32] zeroinitializer
@mha_rtpss_2_stage0 = external local_unnamed_addr global [4 x i32]
@memK_2_cons_buff_1 = external global [64 x [64 x bfloat]]
@memK_2_cons_buff_0 = external global [64 x [64 x bfloat]]
@memQ2_cons_buff_1 = external global [64 x [64 x bfloat]]
@memQ2_cons_buff_0 = external global [64 x [64 x bfloat]]
@memA2_buff_1 = external global [64 x [64 x bfloat]]
@memA2_buff_0 = external global [64 x [64 x bfloat]]

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.aie2p.acquire(i32, i32) #0

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.aie2p.release(i32, i32) #0

declare void @zero_bf16(ptr) local_unnamed_addr

declare void @matmul_bf16_bf16_wrapper(ptr, ptr, ptr, ptr) local_unnamed_addr

define void @core_2_2() local_unnamed_addr {
  tail call void @llvm.aie2p.acquire(i32 54, i32 1)
  %1 = load i32, ptr @mha_rtpss_2_stage0, align 4
  %2 = load i32, ptr getelementptr inbounds nuw (i8, ptr @mha_rtpss_2_stage0, i20 4), align 4
  %3 = sext i32 %1 to i64
  %4 = sext i32 %2 to i64
  %5 = icmp sgt i32 %1, 0
  %6 = icmp sgt i32 %2, 0
  br label %7

7:                                                ; preds = %0, %._crit_edge13
  %8 = phi i32 [ 0, %0 ], [ %.lcssa7, %._crit_edge13 ]
  %9 = phi i32 [ 0, %0 ], [ %.lcssa8, %._crit_edge13 ]
  %10 = phi i32 [ 0, %0 ], [ %.lcssa9, %._crit_edge13 ]
  %11 = phi i64 [ 0, %0 ], [ %37, %._crit_edge13 ]
  store i32 0, ptr @idx_buffer_qk_2, align 4
  store i32 2, ptr getelementptr inbounds nuw (i8, ptr @idx_buffer_qk_2, i20 4), align 4
  br i1 %5, label %.lr.ph12, label %._crit_edge13

.lr.ph12:                                         ; preds = %7, %._crit_edge
  %12 = phi i32 [ %.lcssa, %._crit_edge ], [ %8, %7 ]
  %13 = phi i32 [ %.lcssa6, %._crit_edge ], [ %9, %7 ]
  %14 = phi i32 [ %34, %._crit_edge ], [ %10, %7 ]
  %15 = phi i64 [ %35, %._crit_edge ], [ 0, %7 ]
  tail call void @llvm.aie2p.acquire(i32 51, i32 -1)
  %cond = icmp eq i32 %14, 1
  %spec.select = select i1 %cond, ptr @memQ2_cons_buff_1, ptr @memQ2_cons_buff_0
  br i1 %6, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %.lr.ph12, %.lr.ph
  %16 = phi i32 [ %25, %.lr.ph ], [ %12, %.lr.ph12 ]
  %17 = phi i32 [ %22, %.lr.ph ], [ %13, %.lr.ph12 ]
  %18 = phi i64 [ %28, %.lr.ph ], [ 0, %.lr.ph12 ]
  tail call void @llvm.aie2p.acquire(i32 53, i32 -1)
  %cond1 = icmp eq i32 %17, 1
  %spec.select5 = select i1 %cond1, ptr @memK_2_cons_buff_1, ptr @memK_2_cons_buff_0
  tail call void @llvm.aie2p.acquire(i32 48, i32 -1)
  %cond2 = icmp eq i32 %16, 1
  %19 = select i1 %cond2, ptr @memA2_buff_1, ptr @memA2_buff_0
  tail call void @zero_bf16(ptr nonnull %19)
  tail call void @matmul_bf16_bf16_wrapper(ptr nonnull %spec.select, ptr nonnull %spec.select5, ptr nonnull %19, ptr nonnull @idx_buffer_qk_2)
  tail call void @llvm.aie2p.release(i32 52, i32 1)
  %20 = add i32 %17, 1
  %21 = icmp sgt i32 %20, 1
  %22 = select i1 %21, i32 0, i32 %20
  tail call void @llvm.aie2p.release(i32 49, i32 1)
  %23 = add i32 %16, 1
  %24 = icmp sgt i32 %23, 1
  %25 = select i1 %24, i32 0, i32 %23
  %26 = load i32, ptr @idx_buffer_qk_2, align 4
  %27 = add i32 %26, 1
  store i32 %27, ptr @idx_buffer_qk_2, align 4
  %28 = add nuw nsw i64 %18, 1
  %29 = icmp slt i64 %28, %4
  br i1 %29, label %.lr.ph, label %._crit_edge

._crit_edge:                                      ; preds = %.lr.ph, %.lr.ph12
  %.lcssa6 = phi i32 [ %13, %.lr.ph12 ], [ %22, %.lr.ph ]
  %.lcssa = phi i32 [ %12, %.lr.ph12 ], [ %25, %.lr.ph ]
  store i32 0, ptr @idx_buffer_qk_2, align 4
  %30 = load i32, ptr getelementptr inbounds nuw (i8, ptr @idx_buffer_qk_2, i20 4), align 4
  %31 = add i32 %30, 8
  store i32 %31, ptr getelementptr inbounds nuw (i8, ptr @idx_buffer_qk_2, i20 4), align 4
  tail call void @llvm.aie2p.release(i32 50, i32 1)
  %32 = add i32 %14, 1
  %33 = icmp sgt i32 %32, 1
  %34 = select i1 %33, i32 0, i32 %32
  %35 = add nuw nsw i64 %15, 1
  %36 = icmp slt i64 %35, %3
  br i1 %36, label %.lr.ph12, label %._crit_edge13

._crit_edge13:                                    ; preds = %._crit_edge, %7
  %.lcssa9 = phi i32 [ %10, %7 ], [ %34, %._crit_edge ]
  %.lcssa8 = phi i32 [ %9, %7 ], [ %.lcssa6, %._crit_edge ]
  %.lcssa7 = phi i32 [ %8, %7 ], [ %.lcssa, %._crit_edge ]
  %37 = add nuw nsw i64 %11, 1
  %.not = icmp eq i64 %37, 9223372036854775807
  br i1 %.not, label %38, label %7

38:                                               ; preds = %._crit_edge13
  ret void
}

attributes #0 = { mustprogress nocallback nofree nosync nounwind willreturn }

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
