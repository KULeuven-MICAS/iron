; ModuleID = '/home/micas/iron-stream-dse/experiments/full_dma/mha/eq_mha_s32768_p8_h8/MHA_h8_s32768_d64_kv0_npu2.mlir.d/peano-linked_main_core_4_4.ll'
source_filename = "LLVMDialectModule"
target datalayout = "e-m:e-p:20:32-i1:8:32-i8:8:32-i16:16:32-i32:32:32-f32:32:32-i64:32-f64:32-a:0:32-n32"
target triple = "aie2p"

@idx_buffer_pv_4 = global [2 x i32] zeroinitializer
@mha_rtpss_4_stage2 = external local_unnamed_addr global [4 x i32]
@memV_4_cons_buff_1 = external global [64 x [64 x bfloat]]
@memV_4_cons_buff_0 = external global [64 x [64 x bfloat]]
@outO20_buff_1 = external global [64 x [64 x bfloat]]
@outO20_buff_0 = external global [64 x [64 x bfloat]]
@outP4_cons_buff_1 = external global [64 x [64 x bfloat]]
@outP4_cons_buff_0 = external global [64 x [64 x bfloat]]
@scaleOF4_buff_1 = external global [256 x bfloat]
@scaleOF4_buff_0 = external global [256 x bfloat]

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.aie2p.acquire(i32, i32) #0

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.aie2p.release(i32, i32) #0

declare void @zero_bf16(ptr) local_unnamed_addr

declare void @matmul_PV(ptr, ptr, ptr, ptr, i32, i32, ptr) local_unnamed_addr

declare void @rescale_O(ptr, ptr, i32, ptr) local_unnamed_addr

define void @core_4_4() local_unnamed_addr {
  tail call void @llvm.aie2p.acquire(i32 54, i32 1)
  %1 = load i32, ptr @mha_rtpss_4_stage2, align 4
  %2 = load i32, ptr getelementptr inbounds nuw (i8, ptr @mha_rtpss_4_stage2, i20 4), align 4
  %3 = sext i32 %1 to i64
  %4 = icmp sgt i32 %2, 1
  %5 = icmp sgt i32 %1, 0
  %6 = add nsw i32 %2, -2
  %7 = zext nneg i32 %6 to i64
  %brmerge = icmp slt i32 %2, 3
  br label %8

8:                                                ; preds = %0, %._crit_edge
  %9 = phi i32 [ 0, %0 ], [ %.lcssa17, %._crit_edge ]
  %10 = phi i32 [ 0, %0 ], [ %.lcssa18, %._crit_edge ]
  %11 = phi i32 [ 0, %0 ], [ %.lcssa19, %._crit_edge ]
  %12 = phi i32 [ 0, %0 ], [ %.lcssa20, %._crit_edge ]
  %13 = phi i64 [ 0, %0 ], [ %79, %._crit_edge ]
  store i32 0, ptr @idx_buffer_pv_4, align 4
  store i32 4, ptr getelementptr inbounds nuw (i8, ptr @idx_buffer_pv_4, i20 4), align 4
  br i1 %5, label %.lr.ph23, label %._crit_edge

.lr.ph23:                                         ; preds = %8, %68
  %14 = phi i32 [ %71, %68 ], [ %9, %8 ]
  %15 = phi i32 [ %70, %68 ], [ %10, %8 ]
  %16 = phi i32 [ %69, %68 ], [ %11, %8 ]
  %17 = phi i32 [ %76, %68 ], [ %12, %8 ]
  %18 = phi i64 [ %77, %68 ], [ 0, %8 ]
  tail call void @llvm.aie2p.acquire(i32 50, i32 -1)
  %cond = icmp eq i32 %17, 1
  %spec.select = select i1 %cond, ptr @outO20_buff_1, ptr @outO20_buff_0
  tail call void @zero_bf16(ptr nonnull %spec.select)
  tail call void @llvm.aie2p.acquire(i32 49, i32 -1)
  %cond1 = icmp eq i32 %16, 1
  %19 = select i1 %cond1, ptr @outP4_cons_buff_1, ptr @outP4_cons_buff_0
  tail call void @llvm.aie2p.acquire(i32 53, i32 -1)
  %cond2 = icmp eq i32 %15, 1
  %20 = select i1 %cond2, ptr @memV_4_cons_buff_1, ptr @memV_4_cons_buff_0
  tail call void @llvm.aie2p.acquire(i32 1, i32 -1)
  %cond3 = icmp eq i32 %14, 1
  %21 = select i1 %cond3, ptr @scaleOF4_buff_1, ptr @scaleOF4_buff_0
  tail call void @matmul_PV(ptr nonnull %19, ptr nonnull %20, ptr nonnull %spec.select, ptr nonnull %21, i32 64, i32 0, ptr nonnull @idx_buffer_pv_4)
  tail call void @llvm.aie2p.release(i32 48, i32 1)
  %22 = add i32 %16, 1
  %23 = icmp sgt i32 %22, 1
  %24 = select i1 %23, i32 0, i32 %22
  tail call void @llvm.aie2p.release(i32 52, i32 1)
  %25 = add i32 %15, 1
  %26 = icmp sgt i32 %25, 1
  %27 = select i1 %26, i32 0, i32 %25
  tail call void @llvm.aie2p.release(i32 0, i32 1)
  %28 = add i32 %14, 1
  %29 = icmp sgt i32 %28, 1
  %30 = select i1 %29, i32 0, i32 %28
  %31 = load i32, ptr @idx_buffer_pv_4, align 4
  %32 = add i32 %31, 1
  store i32 %32, ptr @idx_buffer_pv_4, align 4
  br i1 %brmerge, label %.loopexit, label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph23, %.lr.ph
  %33 = phi i32 [ %47, %.lr.ph ], [ %30, %.lr.ph23 ]
  %34 = phi i32 [ %44, %.lr.ph ], [ %27, %.lr.ph23 ]
  %35 = phi i32 [ %41, %.lr.ph ], [ %24, %.lr.ph23 ]
  %36 = phi i64 [ %50, %.lr.ph ], [ 0, %.lr.ph23 ]
  tail call void @llvm.aie2p.acquire(i32 49, i32 -1)
  %cond4 = icmp eq i32 %35, 1
  %spec.select13 = select i1 %cond4, ptr @outP4_cons_buff_1, ptr @outP4_cons_buff_0
  tail call void @llvm.aie2p.acquire(i32 53, i32 -1)
  %cond5 = icmp eq i32 %34, 1
  %37 = select i1 %cond5, ptr @memV_4_cons_buff_1, ptr @memV_4_cons_buff_0
  tail call void @llvm.aie2p.acquire(i32 1, i32 -1)
  %cond6 = icmp eq i32 %33, 1
  %38 = select i1 %cond6, ptr @scaleOF4_buff_1, ptr @scaleOF4_buff_0
  tail call void @matmul_PV(ptr nonnull %spec.select13, ptr nonnull %37, ptr nonnull %spec.select, ptr nonnull %38, i32 64, i32 1, ptr nonnull @idx_buffer_pv_4)
  tail call void @llvm.aie2p.release(i32 48, i32 1)
  %39 = add i32 %35, 1
  %40 = icmp sgt i32 %39, 1
  %41 = select i1 %40, i32 0, i32 %39
  tail call void @llvm.aie2p.release(i32 52, i32 1)
  %42 = add i32 %34, 1
  %43 = icmp sgt i32 %42, 1
  %44 = select i1 %43, i32 0, i32 %42
  tail call void @llvm.aie2p.release(i32 0, i32 1)
  %45 = add i32 %33, 1
  %46 = icmp sgt i32 %45, 1
  %47 = select i1 %46, i32 0, i32 %45
  %48 = load i32, ptr @idx_buffer_pv_4, align 4
  %49 = add i32 %48, 1
  store i32 %49, ptr @idx_buffer_pv_4, align 4
  %50 = add nuw nsw i64 %36, 1
  %51 = icmp samesign ult i64 %50, %7
  br i1 %51, label %.lr.ph, label %.loopexit

.loopexit:                                        ; preds = %.lr.ph, %.lr.ph23
  %52 = phi i32 [ %24, %.lr.ph23 ], [ %41, %.lr.ph ]
  %53 = phi i32 [ %27, %.lr.ph23 ], [ %44, %.lr.ph ]
  %54 = phi i32 [ %30, %.lr.ph23 ], [ %47, %.lr.ph ]
  br i1 %4, label %55, label %67

55:                                               ; preds = %.loopexit
  tail call void @llvm.aie2p.acquire(i32 49, i32 -1)
  %cond7 = icmp eq i32 %52, 1
  %spec.select14 = select i1 %cond7, ptr @outP4_cons_buff_1, ptr @outP4_cons_buff_0
  tail call void @llvm.aie2p.acquire(i32 53, i32 -1)
  %cond8 = icmp eq i32 %53, 1
  %56 = select i1 %cond8, ptr @memV_4_cons_buff_1, ptr @memV_4_cons_buff_0
  tail call void @llvm.aie2p.acquire(i32 1, i32 -1)
  %cond9 = icmp eq i32 %54, 1
  %57 = select i1 %cond9, ptr @scaleOF4_buff_1, ptr @scaleOF4_buff_0
  tail call void @matmul_PV(ptr nonnull %spec.select14, ptr nonnull %56, ptr nonnull %spec.select, ptr nonnull %57, i32 64, i32 1, ptr nonnull @idx_buffer_pv_4)
  tail call void @rescale_O(ptr nonnull %spec.select, ptr nonnull %57, i32 64, ptr nonnull @idx_buffer_pv_4)
  tail call void @llvm.aie2p.release(i32 48, i32 1)
  %58 = add i32 %52, 1
  %59 = icmp sgt i32 %58, 1
  %60 = select i1 %59, i32 0, i32 %58
  tail call void @llvm.aie2p.release(i32 52, i32 1)
  %61 = add i32 %53, 1
  %62 = icmp sgt i32 %61, 1
  %63 = select i1 %62, i32 0, i32 %61
  tail call void @llvm.aie2p.release(i32 0, i32 1)
  %64 = add i32 %54, 1
  %65 = icmp sgt i32 %64, 1
  %66 = select i1 %65, i32 0, i32 %64
  br label %68

67:                                               ; preds = %.loopexit
  tail call void @rescale_O(ptr nonnull %spec.select, ptr nonnull %21, i32 64, ptr nonnull @idx_buffer_pv_4)
  br label %68

68:                                               ; preds = %67, %55
  %69 = phi i32 [ %52, %67 ], [ %60, %55 ]
  %70 = phi i32 [ %53, %67 ], [ %63, %55 ]
  %71 = phi i32 [ %54, %67 ], [ %66, %55 ]
  store i32 0, ptr @idx_buffer_pv_4, align 4
  %72 = load i32, ptr getelementptr inbounds nuw (i8, ptr @idx_buffer_pv_4, i20 4), align 4
  %73 = add i32 %72, 8
  store i32 %73, ptr getelementptr inbounds nuw (i8, ptr @idx_buffer_pv_4, i20 4), align 4
  tail call void @llvm.aie2p.release(i32 51, i32 1)
  %74 = add i32 %17, 1
  %75 = icmp sgt i32 %74, 1
  %76 = select i1 %75, i32 0, i32 %74
  %77 = add nuw nsw i64 %18, 1
  %78 = icmp slt i64 %77, %3
  br i1 %78, label %.lr.ph23, label %._crit_edge

._crit_edge:                                      ; preds = %68, %8
  %.lcssa20 = phi i32 [ %12, %8 ], [ %76, %68 ]
  %.lcssa19 = phi i32 [ %11, %8 ], [ %69, %68 ]
  %.lcssa18 = phi i32 [ %10, %8 ], [ %70, %68 ]
  %.lcssa17 = phi i32 [ %9, %8 ], [ %71, %68 ]
  %79 = add nuw nsw i64 %13, 1
  %.not = icmp eq i64 %79, 9223372036854775807
  br i1 %.not, label %80, label %8

80:                                               ; preds = %._crit_edge
  ret void
}

attributes #0 = { mustprogress nocallback nofree nosync nounwind willreturn }

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
