; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"
target triple = "aie2p"

@idx_buffer_pv_7 = external global [2 x i32]
@mha_rtpss_7_stage2 = external global [4 x i32]
@idx_buffer_pv_6 = external global [2 x i32]
@mha_rtpss_6_stage2 = external global [4 x i32]
@idx_buffer_pv_5 = external global [2 x i32]
@mha_rtpss_5_stage2 = external global [4 x i32]
@idx_buffer_pv_4 = external global [2 x i32]
@mha_rtpss_4_stage2 = external global [4 x i32]
@idx_buffer_pv_3 = external global [2 x i32]
@mha_rtpss_3_stage2 = external global [4 x i32]
@idx_buffer_pv_2 = external global [2 x i32]
@mha_rtpss_2_stage2 = external global [4 x i32]
@idx_buffer_pv_1 = external global [2 x i32]
@mha_rtpss_1_stage2 = external global [4 x i32]
@idx_buffer_pv_0 = external global [2 x i32]
@mha_rtpss_0_stage2 = external global [4 x i32]
@scale_buffer_softmax_7 = external global [256 x bfloat]
@idx_buffer_softmax_7 = external global [2 x i32]
@mha_rtpss_7_stage1 = external global [4 x i32]
@scale_buffer_softmax_6 = external global [256 x bfloat]
@idx_buffer_softmax_6 = external global [2 x i32]
@mha_rtpss_6_stage1 = external global [4 x i32]
@scale_buffer_softmax_5 = external global [256 x bfloat]
@idx_buffer_softmax_5 = external global [2 x i32]
@mha_rtpss_5_stage1 = external global [4 x i32]
@scale_buffer_softmax_4 = external global [256 x bfloat]
@idx_buffer_softmax_4 = external global [2 x i32]
@mha_rtpss_4_stage1 = external global [4 x i32]
@scale_buffer_softmax_3 = external global [256 x bfloat]
@idx_buffer_softmax_3 = external global [2 x i32]
@mha_rtpss_3_stage1 = external global [4 x i32]
@scale_buffer_softmax_2 = global [256 x bfloat] zeroinitializer
@idx_buffer_softmax_2 = global [2 x i32] zeroinitializer
@mha_rtpss_2_stage1 = external global [4 x i32]
@scale_buffer_softmax_1 = external global [256 x bfloat]
@idx_buffer_softmax_1 = external global [2 x i32]
@mha_rtpss_1_stage1 = external global [4 x i32]
@scale_buffer_softmax_0 = external global [256 x bfloat]
@idx_buffer_softmax_0 = external global [2 x i32]
@mha_rtpss_0_stage1 = external global [4 x i32]
@idx_buffer_qk_7 = external global [2 x i32]
@mha_rtpss_7_stage0 = external global [4 x i32]
@idx_buffer_qk_6 = external global [2 x i32]
@mha_rtpss_6_stage0 = external global [4 x i32]
@idx_buffer_qk_5 = external global [2 x i32]
@mha_rtpss_5_stage0 = external global [4 x i32]
@idx_buffer_qk_4 = external global [2 x i32]
@mha_rtpss_4_stage0 = external global [4 x i32]
@idx_buffer_qk_3 = external global [2 x i32]
@mha_rtpss_3_stage0 = external global [4 x i32]
@idx_buffer_qk_2 = external global [2 x i32]
@mha_rtpss_2_stage0 = external global [4 x i32]
@idx_buffer_qk_1 = external global [2 x i32]
@mha_rtpss_1_stage0 = external global [4 x i32]
@idx_buffer_qk_0 = external global [2 x i32]
@mha_rtpss_0_stage0 = external global [4 x i32]
@inQ_cons_buff_1 = external global [256 x [64 x bfloat]]
@inQ_cons_buff_0 = external global [256 x [64 x bfloat]]
@inQ2_cons_buff_1 = external global [256 x [64 x bfloat]]
@inQ2_cons_buff_0 = external global [256 x [64 x bfloat]]
@memK_7_cons_buff_1 = external global [64 x [64 x bfloat]]
@memK_7_cons_buff_0 = external global [64 x [64 x bfloat]]
@memK_6_cons_buff_1 = external global [64 x [64 x bfloat]]
@memK_6_cons_buff_0 = external global [64 x [64 x bfloat]]
@memK_5_cons_buff_1 = external global [64 x [64 x bfloat]]
@memK_5_cons_buff_0 = external global [64 x [64 x bfloat]]
@memK_4_cons_buff_1 = external global [64 x [64 x bfloat]]
@memK_4_cons_buff_0 = external global [64 x [64 x bfloat]]
@memK_3_cons_buff_1 = external global [64 x [64 x bfloat]]
@memK_3_cons_buff_0 = external global [64 x [64 x bfloat]]
@memK_2_cons_buff_1 = external global [64 x [64 x bfloat]]
@memK_2_cons_buff_0 = external global [64 x [64 x bfloat]]
@memK_1_cons_buff_1 = external global [64 x [64 x bfloat]]
@memK_1_cons_buff_0 = external global [64 x [64 x bfloat]]
@memK_0_cons_buff_1 = external global [64 x [64 x bfloat]]
@memK_0_cons_buff_0 = external global [64 x [64 x bfloat]]
@memO_buff_1 = external global [256 x [64 x bfloat]]
@memO_buff_0 = external global [256 x [64 x bfloat]]
@memO2_buff_1 = external global [256 x [64 x bfloat]]
@memO2_buff_0 = external global [256 x [64 x bfloat]]
@memQ0_cons_buff_1 = external global [64 x [64 x bfloat]]
@memQ0_cons_buff_0 = external global [64 x [64 x bfloat]]
@inK_cons_buff_1 = external global [64 x [64 x bfloat]]
@inK_cons_buff_0 = external global [64 x [64 x bfloat]]
@memQ1_cons_buff_1 = external global [64 x [64 x bfloat]]
@memQ1_cons_buff_0 = external global [64 x [64 x bfloat]]
@memQ2_cons_buff_1 = external global [64 x [64 x bfloat]]
@memQ2_cons_buff_0 = external global [64 x [64 x bfloat]]
@memQ3_cons_buff_1 = external global [64 x [64 x bfloat]]
@memQ3_cons_buff_0 = external global [64 x [64 x bfloat]]
@memQ20_cons_buff_1 = external global [64 x [64 x bfloat]]
@memQ20_cons_buff_0 = external global [64 x [64 x bfloat]]
@memQ21_cons_buff_1 = external global [64 x [64 x bfloat]]
@memQ21_cons_buff_0 = external global [64 x [64 x bfloat]]
@memQ22_cons_buff_1 = external global [64 x [64 x bfloat]]
@memQ22_cons_buff_0 = external global [64 x [64 x bfloat]]
@memQ23_cons_buff_1 = external global [64 x [64 x bfloat]]
@memQ23_cons_buff_0 = external global [64 x [64 x bfloat]]
@memV_7_cons_buff_1 = external global [64 x [64 x bfloat]]
@memV_7_cons_buff_0 = external global [64 x [64 x bfloat]]
@memV_6_cons_buff_1 = external global [64 x [64 x bfloat]]
@memV_6_cons_buff_0 = external global [64 x [64 x bfloat]]
@memV_5_cons_buff_1 = external global [64 x [64 x bfloat]]
@memV_5_cons_buff_0 = external global [64 x [64 x bfloat]]
@memV_4_cons_buff_1 = external global [64 x [64 x bfloat]]
@memV_4_cons_buff_0 = external global [64 x [64 x bfloat]]
@memV_3_cons_buff_1 = external global [64 x [64 x bfloat]]
@memV_3_cons_buff_0 = external global [64 x [64 x bfloat]]
@memV_2_cons_buff_1 = external global [64 x [64 x bfloat]]
@memV_2_cons_buff_0 = external global [64 x [64 x bfloat]]
@memV_1_cons_buff_1 = external global [64 x [64 x bfloat]]
@memV_1_cons_buff_0 = external global [64 x [64 x bfloat]]
@memV_0_cons_buff_1 = external global [64 x [64 x bfloat]]
@memV_0_cons_buff_0 = external global [64 x [64 x bfloat]]
@memA0_buff_1 = external global [64 x [64 x bfloat]]
@memA0_buff_0 = external global [64 x [64 x bfloat]]
@inV_cons_buff_1 = external global [64 x [64 x bfloat]]
@inV_cons_buff_0 = external global [64 x [64 x bfloat]]
@outA0_cons_buff_1 = external global [64 x [64 x bfloat]]
@outA0_cons_buff_0 = external global [64 x [64 x bfloat]]
@memA1_buff_1 = external global [64 x [64 x bfloat]]
@memA1_buff_0 = external global [64 x [64 x bfloat]]
@memA0_cons_buff_1 = external global [64 x [64 x bfloat]]
@memA0_cons_buff_0 = external global [64 x [64 x bfloat]]
@outA1_cons_buff_1 = external global [64 x [64 x bfloat]]
@outA1_cons_buff_0 = external global [64 x [64 x bfloat]]
@memA2_buff_1 = external global [64 x [64 x bfloat]]
@memA2_buff_0 = external global [64 x [64 x bfloat]]
@memA1_cons_buff_1 = external global [64 x [64 x bfloat]]
@memA1_cons_buff_0 = external global [64 x [64 x bfloat]]
@outA2_cons_buff_1 = external global [64 x [64 x bfloat]]
@outA2_cons_buff_0 = external global [64 x [64 x bfloat]]
@memA3_buff_1 = external global [64 x [64 x bfloat]]
@memA3_buff_0 = external global [64 x [64 x bfloat]]
@memA2_cons_buff_1 = external global [64 x [64 x bfloat]]
@memA2_cons_buff_0 = external global [64 x [64 x bfloat]]
@outA3_cons_buff_1 = external global [64 x [64 x bfloat]]
@outA3_cons_buff_0 = external global [64 x [64 x bfloat]]
@memA4_buff_1 = external global [64 x [64 x bfloat]]
@memA4_buff_0 = external global [64 x [64 x bfloat]]
@memA3_cons_buff_1 = external global [64 x [64 x bfloat]]
@memA3_cons_buff_0 = external global [64 x [64 x bfloat]]
@outA4_cons_buff_1 = external global [64 x [64 x bfloat]]
@outA4_cons_buff_0 = external global [64 x [64 x bfloat]]
@memA5_buff_1 = external global [64 x [64 x bfloat]]
@memA5_buff_0 = external global [64 x [64 x bfloat]]
@memA4_cons_buff_1 = external global [64 x [64 x bfloat]]
@memA4_cons_buff_0 = external global [64 x [64 x bfloat]]
@outA5_cons_buff_1 = external global [64 x [64 x bfloat]]
@outA5_cons_buff_0 = external global [64 x [64 x bfloat]]
@memA6_buff_1 = external global [64 x [64 x bfloat]]
@memA6_buff_0 = external global [64 x [64 x bfloat]]
@memA5_cons_buff_1 = external global [64 x [64 x bfloat]]
@memA5_cons_buff_0 = external global [64 x [64 x bfloat]]
@outA6_cons_buff_1 = external global [64 x [64 x bfloat]]
@outA6_cons_buff_0 = external global [64 x [64 x bfloat]]
@memA7_buff_1 = external global [64 x [64 x bfloat]]
@memA7_buff_0 = external global [64 x [64 x bfloat]]
@memA6_cons_buff_1 = external global [64 x [64 x bfloat]]
@memA6_cons_buff_0 = external global [64 x [64 x bfloat]]
@outA7_cons_buff_1 = external global [64 x [64 x bfloat]]
@outA7_cons_buff_0 = external global [64 x [64 x bfloat]]
@memA7_cons_buff_1 = external global [64 x [64 x bfloat]]
@memA7_cons_buff_0 = external global [64 x [64 x bfloat]]
@outO0_buff_1 = external global [64 x [64 x bfloat]]
@outO0_buff_0 = external global [64 x [64 x bfloat]]
@outO1_buff_1 = external global [64 x [64 x bfloat]]
@outO1_buff_0 = external global [64 x [64 x bfloat]]
@outO2_buff_1 = external global [64 x [64 x bfloat]]
@outO2_buff_0 = external global [64 x [64 x bfloat]]
@outO3_buff_1 = external global [64 x [64 x bfloat]]
@outO3_buff_0 = external global [64 x [64 x bfloat]]
@outO20_buff_1 = external global [64 x [64 x bfloat]]
@outO20_buff_0 = external global [64 x [64 x bfloat]]
@outO21_buff_1 = external global [64 x [64 x bfloat]]
@outO21_buff_0 = external global [64 x [64 x bfloat]]
@outO22_buff_1 = external global [64 x [64 x bfloat]]
@outO22_buff_0 = external global [64 x [64 x bfloat]]
@outO23_buff_1 = external global [64 x [64 x bfloat]]
@outO23_buff_0 = external global [64 x [64 x bfloat]]
@memP0_buff_1 = external global [64 x [64 x bfloat]]
@memP0_buff_0 = external global [64 x [64 x bfloat]]
@memP0_cons_buff_1 = external global [64 x [64 x bfloat]]
@memP0_cons_buff_0 = external global [64 x [64 x bfloat]]
@outP0_cons_buff_1 = external global [64 x [64 x bfloat]]
@outP0_cons_buff_0 = external global [64 x [64 x bfloat]]
@memP1_buff_1 = external global [64 x [64 x bfloat]]
@memP1_buff_0 = external global [64 x [64 x bfloat]]
@memP1_cons_buff_1 = external global [64 x [64 x bfloat]]
@memP1_cons_buff_0 = external global [64 x [64 x bfloat]]
@outP1_cons_buff_1 = external global [64 x [64 x bfloat]]
@outP1_cons_buff_0 = external global [64 x [64 x bfloat]]
@memP2_buff_1 = external global [64 x [64 x bfloat]]
@memP2_buff_0 = external global [64 x [64 x bfloat]]
@memP2_cons_buff_1 = external global [64 x [64 x bfloat]]
@memP2_cons_buff_0 = external global [64 x [64 x bfloat]]
@outP2_cons_buff_1 = external global [64 x [64 x bfloat]]
@outP2_cons_buff_0 = external global [64 x [64 x bfloat]]
@memP3_buff_1 = external global [64 x [64 x bfloat]]
@memP3_buff_0 = external global [64 x [64 x bfloat]]
@memP3_cons_buff_1 = external global [64 x [64 x bfloat]]
@memP3_cons_buff_0 = external global [64 x [64 x bfloat]]
@outP3_cons_buff_1 = external global [64 x [64 x bfloat]]
@outP3_cons_buff_0 = external global [64 x [64 x bfloat]]
@memP4_buff_1 = external global [64 x [64 x bfloat]]
@memP4_buff_0 = external global [64 x [64 x bfloat]]
@memP4_cons_buff_1 = external global [64 x [64 x bfloat]]
@memP4_cons_buff_0 = external global [64 x [64 x bfloat]]
@outP4_cons_buff_1 = external global [64 x [64 x bfloat]]
@outP4_cons_buff_0 = external global [64 x [64 x bfloat]]
@memP5_buff_1 = external global [64 x [64 x bfloat]]
@memP5_buff_0 = external global [64 x [64 x bfloat]]
@memP5_cons_buff_1 = external global [64 x [64 x bfloat]]
@memP5_cons_buff_0 = external global [64 x [64 x bfloat]]
@outP5_cons_buff_1 = external global [64 x [64 x bfloat]]
@outP5_cons_buff_0 = external global [64 x [64 x bfloat]]
@memP6_buff_1 = external global [64 x [64 x bfloat]]
@memP6_buff_0 = external global [64 x [64 x bfloat]]
@memP6_cons_buff_1 = external global [64 x [64 x bfloat]]
@memP6_cons_buff_0 = external global [64 x [64 x bfloat]]
@outP6_cons_buff_1 = external global [64 x [64 x bfloat]]
@outP6_cons_buff_0 = external global [64 x [64 x bfloat]]
@memP7_buff_1 = external global [64 x [64 x bfloat]]
@memP7_buff_0 = external global [64 x [64 x bfloat]]
@memP7_cons_buff_1 = external global [64 x [64 x bfloat]]
@memP7_cons_buff_0 = external global [64 x [64 x bfloat]]
@outP7_cons_buff_1 = external global [64 x [64 x bfloat]]
@outP7_cons_buff_0 = external global [64 x [64 x bfloat]]
@scaleOF0_buff_1 = external global [256 x bfloat]
@scaleOF0_buff_0 = external global [256 x bfloat]
@scaleOF1_buff_1 = external global [256 x bfloat]
@scaleOF1_buff_0 = external global [256 x bfloat]
@scaleOF2_buff_1 = external global [256 x bfloat]
@scaleOF2_buff_0 = external global [256 x bfloat]
@scaleOF3_buff_1 = external global [256 x bfloat]
@scaleOF3_buff_0 = external global [256 x bfloat]
@scaleOF4_buff_1 = external global [256 x bfloat]
@scaleOF4_buff_0 = external global [256 x bfloat]
@scaleOF5_buff_1 = external global [256 x bfloat]
@scaleOF5_buff_0 = external global [256 x bfloat]
@scaleOF6_buff_1 = external global [256 x bfloat]
@scaleOF6_buff_0 = external global [256 x bfloat]
@scaleOF7_buff_1 = external global [256 x bfloat]
@scaleOF7_buff_0 = external global [256 x bfloat]

declare void @debug_i32(i32)

; Unknown intrinsic
declare void @llvm.aie2p.event(i32)

; Unknown intrinsic
declare void @llvm.aie2p.put.ms(i32, i32)

; Unknown intrinsic
declare { i32, i32 } @llvm.aie2p.get.ss()

; Unknown intrinsic
declare void @llvm.aie2p.mcd.write.vec(<16 x i32>, i32)

; Unknown intrinsic
declare <16 x i32> @llvm.aie2p.scd.read.vec(i32)

; Unknown intrinsic
declare void @llvm.aie2p.acquire(i32, i32)

; Unknown intrinsic
declare void @llvm.aie2p.release(i32, i32)

; Unknown intrinsic
declare void @llvm.aie2p.set.ctrl.reg(i32, i32)

declare void @zero_bf16(ptr)

declare void @matmul_bf16_bf16_wrapper(ptr, ptr, ptr, ptr)

declare void @partial_softmax(ptr, ptr, ptr, ptr, bfloat, i32, i32, i32, i32)

declare void @init_scale_buffer(ptr, i32)

declare void @passThroughLine(ptr, ptr, i32)

declare void @matmul_PV(ptr, ptr, ptr, ptr, i32, i32, ptr)

declare void @rescale_O(ptr, ptr, i32, ptr)

define void @core_2_3() {
  call void @llvm.aie2p.acquire(i32 54, i32 1)
  %1 = load i32, ptr @mha_rtpss_2_stage1
  %2 = load i32, ptr getelementptr inbounds nuw (i8, ptr @mha_rtpss_2_stage1, i64 4)
  %3 = load i32, ptr getelementptr inbounds nuw (i8, ptr @mha_rtpss_2_stage1, i64 8)
  %4 = load i32, ptr getelementptr inbounds nuw (i8, ptr @mha_rtpss_2_stage1, i64 12)
  %5 = sext i32 %1 to i64
  %6 = sext i32 %2 to i64
  br label %7

7:                                                ; preds = %59, %0
  %8 = phi i64 [ %60, %59 ], [ 0, %0 ]
  %9 = phi i32 [ %16, %59 ], [ 0, %0 ]
  %10 = phi i32 [ %17, %59 ], [ 0, %0 ]
  %11 = phi i32 [ %18, %59 ], [ 0, %0 ]
  %12 = icmp slt i64 %8, 9223372036854775807
  br i1 %12, label %13, label %61

13:                                               ; preds = %7
  store i32 0, ptr @idx_buffer_softmax_2
  store i32 2, ptr getelementptr inbounds nuw (i8, ptr @idx_buffer_softmax_2, i64 4)
  br label %14

14:                                               ; preds = %55, %13
  %15 = phi i64 [ %58, %55 ], [ 0, %13 ]
  %16 = phi i32 [ %23, %55 ], [ %9, %13 ]
  %17 = phi i32 [ %24, %55 ], [ %10, %13 ]
  %18 = phi i32 [ %25, %55 ], [ %11, %13 ]
  %19 = icmp slt i64 %15, %5
  br i1 %19, label %20, label %59

20:                                               ; preds = %14
  call void @init_scale_buffer(ptr @scale_buffer_softmax_2, i32 64)
  br label %21

21:                                               ; preds = %42, %20
  %22 = phi i64 [ %54, %42 ], [ 0, %20 ]
  %23 = phi i32 [ %48, %42 ], [ %16, %20 ]
  %24 = phi i32 [ %45, %42 ], [ %17, %20 ]
  %25 = phi i32 [ %51, %42 ], [ %18, %20 ]
  %26 = icmp slt i64 %22, %6
  br i1 %26, label %27, label %55

27:                                               ; preds = %21
  call void @llvm.aie2p.acquire(i32 50, i32 -1)
  %28 = sext i32 %23 to i64
  switch i64 %28, label %29 [
    i64 0, label %62
    i64 1, label %64
  ]

29:                                               ; preds = %62, %64, %27
  %30 = phi ptr [ %65, %64 ], [ %63, %62 ], [ @memP2_buff_0, %27 ]
  %31 = getelementptr [64 x [64 x bfloat]], ptr %30, i32 0, i32 0, i32 0
  br label %32

32:                                               ; preds = %29
  call void @llvm.aie2p.acquire(i32 53, i32 -1)
  %33 = sext i32 %24 to i64
  switch i64 %33, label %34 [
    i64 0, label %66
    i64 1, label %68
  ]

34:                                               ; preds = %66, %68, %32
  %35 = phi ptr [ %69, %68 ], [ %67, %66 ], [ @outA2_cons_buff_0, %32 ]
  %36 = getelementptr [64 x [64 x bfloat]], ptr %35, i32 0, i32 0, i32 0
  br label %37

37:                                               ; preds = %34
  call void @llvm.aie2p.acquire(i32 48, i32 -1)
  %38 = sext i32 %25 to i64
  switch i64 %38, label %39 [
    i64 0, label %70
    i64 1, label %72
  ]

39:                                               ; preds = %70, %72, %37
  %40 = phi ptr [ %73, %72 ], [ %71, %70 ], [ @scaleOF2_buff_0, %37 ]
  %41 = getelementptr [256 x bfloat], ptr %40, i32 0, i32 0
  br label %42

42:                                               ; preds = %39
  call void @partial_softmax(ptr %36, ptr %31, ptr @scale_buffer_softmax_2, ptr @idx_buffer_softmax_2, bfloat 0xR3E39, i32 64, i32 64, i32 %3, i32 %4)
  call void @passThroughLine(ptr @scale_buffer_softmax_2, ptr %41, i32 256)
  call void @llvm.aie2p.release(i32 52, i32 1)
  %43 = add i32 %24, 1
  %44 = icmp sge i32 %43, 2
  %45 = select i1 %44, i32 0, i32 %43
  call void @llvm.aie2p.release(i32 51, i32 1)
  %46 = add i32 %23, 1
  %47 = icmp sge i32 %46, 2
  %48 = select i1 %47, i32 0, i32 %46
  call void @llvm.aie2p.release(i32 49, i32 1)
  %49 = add i32 %25, 1
  %50 = icmp sge i32 %49, 2
  %51 = select i1 %50, i32 0, i32 %49
  %52 = load i32, ptr @idx_buffer_softmax_2
  %53 = add i32 %52, 1
  store i32 %53, ptr @idx_buffer_softmax_2
  %54 = add i64 %22, 1
  br label %21

55:                                               ; preds = %21
  store i32 0, ptr @idx_buffer_softmax_2
  %56 = load i32, ptr getelementptr inbounds nuw (i8, ptr @idx_buffer_softmax_2, i64 4)
  %57 = add i32 %56, 8
  store i32 %57, ptr getelementptr inbounds nuw (i8, ptr @idx_buffer_softmax_2, i64 4)
  %58 = add i64 %15, 1
  br label %14

59:                                               ; preds = %14
  %60 = add i64 %8, 1
  br label %7

61:                                               ; preds = %7
  ret void

62:                                               ; preds = %27
  %63 = phi ptr [ @memP2_buff_0, %27 ]
  br label %29

64:                                               ; preds = %27
  %65 = phi ptr [ @memP2_buff_1, %27 ]
  br label %29

66:                                               ; preds = %32
  %67 = phi ptr [ @outA2_cons_buff_0, %32 ]
  br label %34

68:                                               ; preds = %32
  %69 = phi ptr [ @outA2_cons_buff_1, %32 ]
  br label %34

70:                                               ; preds = %37
  %71 = phi ptr [ @scaleOF2_buff_0, %37 ]
  br label %39

72:                                               ; preds = %37
  %73 = phi ptr [ @scaleOF2_buff_1, %37 ]
  br label %39
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
