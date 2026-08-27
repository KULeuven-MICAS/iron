; ModuleID = '/home/micas/iron-stream-dse/experiments/deck_260826/eq_mha_s8192_p8_h8/MHA_h8_s8192_d64_kv0_npu2.mlir.d/peano-linked_main_core_6_3.ll'
source_filename = "LLVMDialectModule"
target datalayout = "e-m:e-p:20:32-i1:8:32-i8:8:32-i16:16:32-i32:32:32-f32:32:32-i64:32-f64:32-a:0:32-n32"
target triple = "aie2p"

@scale_buffer_softmax_6 = global [256 x bfloat] zeroinitializer
@idx_buffer_softmax_6 = global [2 x i32] zeroinitializer
@mha_rtpss_6_stage1 = external local_unnamed_addr global [4 x i32]
@outA6_cons_buff_1 = external global [64 x [64 x bfloat]]
@outA6_cons_buff_0 = external global [64 x [64 x bfloat]]
@memP6_buff_1 = external global [64 x [64 x bfloat]]
@memP6_buff_0 = external global [64 x [64 x bfloat]]
@scaleOF6_buff_1 = external global [256 x bfloat]
@scaleOF6_buff_0 = external global [256 x bfloat]

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.aie2p.acquire(i32, i32) #0

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.aie2p.release(i32, i32) #0

declare void @partial_softmax(ptr, ptr, ptr, ptr, bfloat, i32, i32, i32, i32) local_unnamed_addr

declare void @init_scale_buffer(ptr, i32) local_unnamed_addr

declare void @passThroughLine(ptr, ptr, i32) local_unnamed_addr

define void @core_6_3() local_unnamed_addr {
  tail call void @llvm.aie2p.acquire(i32 54, i32 1)
  %1 = load i32, ptr @mha_rtpss_6_stage1, align 4
  %2 = load i32, ptr getelementptr inbounds nuw (i8, ptr @mha_rtpss_6_stage1, i20 4), align 4
  %3 = load i32, ptr getelementptr inbounds nuw (i8, ptr @mha_rtpss_6_stage1, i20 8), align 4
  %4 = load i32, ptr getelementptr inbounds nuw (i8, ptr @mha_rtpss_6_stage1, i20 12), align 4
  %5 = sext i32 %1 to i64
  %6 = sext i32 %2 to i64
  %7 = icmp sgt i32 %1, 0
  %8 = icmp sgt i32 %2, 0
  br label %9

9:                                                ; preds = %0, %._crit_edge14
  %10 = phi i32 [ 0, %0 ], [ %.lcssa7, %._crit_edge14 ]
  %11 = phi i32 [ 0, %0 ], [ %.lcssa8, %._crit_edge14 ]
  %12 = phi i32 [ 0, %0 ], [ %.lcssa9, %._crit_edge14 ]
  %13 = phi i64 [ 0, %0 ], [ %41, %._crit_edge14 ]
  store i32 0, ptr @idx_buffer_softmax_6, align 4
  store i32 6, ptr getelementptr inbounds nuw (i8, ptr @idx_buffer_softmax_6, i20 4), align 4
  br i1 %7, label %.lr.ph13, label %._crit_edge14

.lr.ph13:                                         ; preds = %9, %._crit_edge
  %14 = phi i32 [ %.lcssa, %._crit_edge ], [ %10, %9 ]
  %15 = phi i32 [ %.lcssa5, %._crit_edge ], [ %11, %9 ]
  %16 = phi i32 [ %.lcssa6, %._crit_edge ], [ %12, %9 ]
  %17 = phi i64 [ %39, %._crit_edge ], [ 0, %9 ]
  tail call void @init_scale_buffer(ptr nonnull @scale_buffer_softmax_6, i32 64)
  br i1 %8, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %.lr.ph13, %.lr.ph
  %18 = phi i32 [ %32, %.lr.ph ], [ %14, %.lr.ph13 ]
  %19 = phi i32 [ %26, %.lr.ph ], [ %15, %.lr.ph13 ]
  %20 = phi i32 [ %29, %.lr.ph ], [ %16, %.lr.ph13 ]
  %21 = phi i64 [ %35, %.lr.ph ], [ 0, %.lr.ph13 ]
  tail call void @llvm.aie2p.acquire(i32 50, i32 -1)
  %cond = icmp eq i32 %20, 1
  %spec.select = select i1 %cond, ptr @memP6_buff_1, ptr @memP6_buff_0
  tail call void @llvm.aie2p.acquire(i32 53, i32 -1)
  %cond1 = icmp eq i32 %19, 1
  %22 = select i1 %cond1, ptr @outA6_cons_buff_1, ptr @outA6_cons_buff_0
  tail call void @llvm.aie2p.acquire(i32 48, i32 -1)
  %cond2 = icmp eq i32 %18, 1
  %23 = select i1 %cond2, ptr @scaleOF6_buff_1, ptr @scaleOF6_buff_0
  tail call void @partial_softmax(ptr nonnull %22, ptr nonnull %spec.select, ptr nonnull @scale_buffer_softmax_6, ptr nonnull @idx_buffer_softmax_6, bfloat 0xR3E39, i32 64, i32 64, i32 %3, i32 %4)
  tail call void @passThroughLine(ptr nonnull @scale_buffer_softmax_6, ptr nonnull %23, i32 256)
  tail call void @llvm.aie2p.release(i32 52, i32 1)
  %24 = add i32 %19, 1
  %25 = icmp sgt i32 %24, 1
  %26 = select i1 %25, i32 0, i32 %24
  tail call void @llvm.aie2p.release(i32 51, i32 1)
  %27 = add i32 %20, 1
  %28 = icmp sgt i32 %27, 1
  %29 = select i1 %28, i32 0, i32 %27
  tail call void @llvm.aie2p.release(i32 49, i32 1)
  %30 = add i32 %18, 1
  %31 = icmp sgt i32 %30, 1
  %32 = select i1 %31, i32 0, i32 %30
  %33 = load i32, ptr @idx_buffer_softmax_6, align 4
  %34 = add i32 %33, 1
  store i32 %34, ptr @idx_buffer_softmax_6, align 4
  %35 = add nuw nsw i64 %21, 1
  %36 = icmp slt i64 %35, %6
  br i1 %36, label %.lr.ph, label %._crit_edge

._crit_edge:                                      ; preds = %.lr.ph, %.lr.ph13
  %.lcssa6 = phi i32 [ %16, %.lr.ph13 ], [ %29, %.lr.ph ]
  %.lcssa5 = phi i32 [ %15, %.lr.ph13 ], [ %26, %.lr.ph ]
  %.lcssa = phi i32 [ %14, %.lr.ph13 ], [ %32, %.lr.ph ]
  store i32 0, ptr @idx_buffer_softmax_6, align 4
  %37 = load i32, ptr getelementptr inbounds nuw (i8, ptr @idx_buffer_softmax_6, i20 4), align 4
  %38 = add i32 %37, 8
  store i32 %38, ptr getelementptr inbounds nuw (i8, ptr @idx_buffer_softmax_6, i20 4), align 4
  %39 = add nuw nsw i64 %17, 1
  %40 = icmp slt i64 %39, %5
  br i1 %40, label %.lr.ph13, label %._crit_edge14

._crit_edge14:                                    ; preds = %._crit_edge, %9
  %.lcssa9 = phi i32 [ %12, %9 ], [ %.lcssa6, %._crit_edge ]
  %.lcssa8 = phi i32 [ %11, %9 ], [ %.lcssa5, %._crit_edge ]
  %.lcssa7 = phi i32 [ %10, %9 ], [ %.lcssa, %._crit_edge ]
  %41 = add nuw nsw i64 %13, 1
  %.not = icmp eq i64 %41, 9223372036854775807
  br i1 %.not, label %42, label %9

42:                                               ; preds = %._crit_edge14
  ret void
}

attributes #0 = { mustprogress nocallback nofree nosync nounwind willreturn }

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
