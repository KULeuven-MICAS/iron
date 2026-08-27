; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"
target triple = "aie2p"

@idx_buffer_pv_1 = external global [2 x i32]
@mha_rtpss_1_stage2 = external global [4 x i32]
@idx_buffer_pv_0 = external global [2 x i32]
@mha_rtpss_0_stage2 = external global [4 x i32]
@scale_buffer_softmax_1 = external global [256 x bfloat]
@idx_buffer_softmax_1 = external global [2 x i32]
@mha_rtpss_1_stage1 = external global [4 x i32]
@scale_buffer_softmax_0 = external global [256 x bfloat]
@idx_buffer_softmax_0 = external global [2 x i32]
@mha_rtpss_0_stage1 = external global [4 x i32]
@idx_buffer_qk_1 = global [2 x i32] zeroinitializer
@mha_rtpss_1_stage0 = external global [4 x i32]
@idx_buffer_qk_0 = external global [2 x i32]
@mha_rtpss_0_stage0 = external global [4 x i32]
@inQ_cons_buff_1 = external global [128 x [64 x bfloat]]
@inQ_cons_buff_0 = external global [128 x [64 x bfloat]]
@memO_buff_1 = external global [128 x [64 x bfloat]]
@memO_buff_0 = external global [128 x [64 x bfloat]]
@memK_1_cons_buff_1 = external global [64 x [64 x bfloat]]
@memK_1_cons_buff_0 = external global [64 x [64 x bfloat]]
@memK_0_cons_buff_1 = external global [64 x [64 x bfloat]]
@memK_0_cons_buff_0 = external global [64 x [64 x bfloat]]
@inK_cons_buff_1 = external global [64 x [64 x bfloat]]
@inK_cons_buff_0 = external global [64 x [64 x bfloat]]
@memQ0_cons_buff_1 = external global [64 x [64 x bfloat]]
@memQ0_cons_buff_0 = external global [64 x [64 x bfloat]]
@memQ1_cons_buff_1 = external global [64 x [64 x bfloat]]
@memQ1_cons_buff_0 = external global [64 x [64 x bfloat]]
@inV_cons_buff_1 = external global [64 x [64 x bfloat]]
@inV_cons_buff_0 = external global [64 x [64 x bfloat]]
@memV_1_cons_buff_1 = external global [64 x [64 x bfloat]]
@memV_1_cons_buff_0 = external global [64 x [64 x bfloat]]
@memV_0_cons_buff_1 = external global [64 x [64 x bfloat]]
@memV_0_cons_buff_0 = external global [64 x [64 x bfloat]]
@memA0_buff_1 = external global [64 x [64 x bfloat]]
@memA0_buff_0 = external global [64 x [64 x bfloat]]
@memA0_cons_buff_1 = external global [64 x [64 x bfloat]]
@memA0_cons_buff_0 = external global [64 x [64 x bfloat]]
@outA0_cons_buff_1 = external global [64 x [64 x bfloat]]
@outA0_cons_buff_0 = external global [64 x [64 x bfloat]]
@memA1_buff_1 = external global [64 x [64 x bfloat]]
@memA1_buff_0 = external global [64 x [64 x bfloat]]
@memA1_cons_buff_1 = external global [64 x [64 x bfloat]]
@memA1_cons_buff_0 = external global [64 x [64 x bfloat]]
@outA1_cons_buff_1 = external global [64 x [64 x bfloat]]
@outA1_cons_buff_0 = external global [64 x [64 x bfloat]]
@outO0_buff_1 = external global [64 x [64 x bfloat]]
@outO0_buff_0 = external global [64 x [64 x bfloat]]
@outO1_buff_1 = external global [64 x [64 x bfloat]]
@outO1_buff_0 = external global [64 x [64 x bfloat]]
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
@scaleOF0_buff_1 = external global [256 x bfloat]
@scaleOF0_buff_0 = external global [256 x bfloat]
@scaleOF1_buff_1 = external global [256 x bfloat]
@scaleOF1_buff_0 = external global [256 x bfloat]

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

define void @core_1_2() {
  call void @llvm.aie2p.acquire(i32 54, i32 1)
  %1 = load i32, ptr @mha_rtpss_1_stage0
  %2 = load i32, ptr getelementptr inbounds nuw (i8, ptr @mha_rtpss_1_stage0, i64 4)
  %3 = sext i32 %1 to i64
  %4 = sext i32 %2 to i64
  br label %5

5:                                                ; preds = %56, %0
  %6 = phi i64 [ %57, %56 ], [ 0, %0 ]
  %7 = phi i32 [ %14, %56 ], [ 0, %0 ]
  %8 = phi i32 [ %15, %56 ], [ 0, %0 ]
  %9 = phi i32 [ %16, %56 ], [ 0, %0 ]
  %10 = icmp slt i64 %6, 9223372036854775807
  br i1 %10, label %11, label %58

11:                                               ; preds = %5
  store i32 0, ptr @idx_buffer_qk_1
  store i32 1, ptr getelementptr inbounds nuw (i8, ptr @idx_buffer_qk_1, i64 4)
  br label %12

12:                                               ; preds = %49, %11
  %13 = phi i64 [ %55, %49 ], [ 0, %11 ]
  %14 = phi i32 [ %54, %49 ], [ %7, %11 ]
  %15 = phi i32 [ %26, %49 ], [ %8, %11 ]
  %16 = phi i32 [ %27, %49 ], [ %9, %11 ]
  %17 = icmp slt i64 %13, %3
  br i1 %17, label %18, label %56

18:                                               ; preds = %12
  call void @llvm.aie2p.acquire(i32 51, i32 -1)
  %19 = sext i32 %14 to i64
  switch i64 %19, label %20 [
    i64 0, label %59
    i64 1, label %61
  ]

20:                                               ; preds = %59, %61, %18
  %21 = phi ptr [ %62, %61 ], [ %60, %59 ], [ @memQ1_cons_buff_0, %18 ]
  %22 = getelementptr [64 x [64 x bfloat]], ptr %21, i32 0, i32 0, i32 0
  br label %23

23:                                               ; preds = %20
  br label %24

24:                                               ; preds = %39, %23
  %25 = phi i64 [ %48, %39 ], [ 0, %23 ]
  %26 = phi i32 [ %42, %39 ], [ %15, %23 ]
  %27 = phi i32 [ %45, %39 ], [ %16, %23 ]
  %28 = icmp slt i64 %25, %4
  br i1 %28, label %29, label %49

29:                                               ; preds = %24
  call void @llvm.aie2p.acquire(i32 53, i32 -1)
  %30 = sext i32 %26 to i64
  switch i64 %30, label %31 [
    i64 0, label %63
    i64 1, label %65
  ]

31:                                               ; preds = %63, %65, %29
  %32 = phi ptr [ %66, %65 ], [ %64, %63 ], [ @memK_1_cons_buff_0, %29 ]
  %33 = getelementptr [64 x [64 x bfloat]], ptr %32, i32 0, i32 0, i32 0
  br label %34

34:                                               ; preds = %31
  call void @llvm.aie2p.acquire(i32 48, i32 -1)
  %35 = sext i32 %27 to i64
  switch i64 %35, label %36 [
    i64 0, label %67
    i64 1, label %69
  ]

36:                                               ; preds = %67, %69, %34
  %37 = phi ptr [ %70, %69 ], [ %68, %67 ], [ @memA1_buff_0, %34 ]
  %38 = getelementptr [64 x [64 x bfloat]], ptr %37, i32 0, i32 0, i32 0
  br label %39

39:                                               ; preds = %36
  call void @zero_bf16(ptr %38)
  call void @matmul_bf16_bf16_wrapper(ptr %22, ptr %33, ptr %38, ptr @idx_buffer_qk_1)
  call void @llvm.aie2p.release(i32 52, i32 1)
  %40 = add i32 %26, 1
  %41 = icmp sge i32 %40, 2
  %42 = select i1 %41, i32 0, i32 %40
  call void @llvm.aie2p.release(i32 49, i32 1)
  %43 = add i32 %27, 1
  %44 = icmp sge i32 %43, 2
  %45 = select i1 %44, i32 0, i32 %43
  %46 = load i32, ptr @idx_buffer_qk_1
  %47 = add i32 %46, 1
  store i32 %47, ptr @idx_buffer_qk_1
  %48 = add i64 %25, 1
  br label %24

49:                                               ; preds = %24
  store i32 0, ptr @idx_buffer_qk_1
  %50 = load i32, ptr getelementptr inbounds nuw (i8, ptr @idx_buffer_qk_1, i64 4)
  %51 = add i32 %50, 2
  store i32 %51, ptr getelementptr inbounds nuw (i8, ptr @idx_buffer_qk_1, i64 4)
  call void @llvm.aie2p.release(i32 50, i32 1)
  %52 = add i32 %14, 1
  %53 = icmp sge i32 %52, 2
  %54 = select i1 %53, i32 0, i32 %52
  %55 = add i64 %13, 1
  br label %12

56:                                               ; preds = %12
  %57 = add i64 %6, 1
  br label %5

58:                                               ; preds = %5
  ret void

59:                                               ; preds = %18
  %60 = phi ptr [ @memQ1_cons_buff_0, %18 ]
  br label %20

61:                                               ; preds = %18
  %62 = phi ptr [ @memQ1_cons_buff_1, %18 ]
  br label %20

63:                                               ; preds = %29
  %64 = phi ptr [ @memK_1_cons_buff_0, %29 ]
  br label %31

65:                                               ; preds = %29
  %66 = phi ptr [ @memK_1_cons_buff_1, %29 ]
  br label %31

67:                                               ; preds = %34
  %68 = phi ptr [ @memA1_buff_0, %34 ]
  br label %36

69:                                               ; preds = %34
  %70 = phi ptr [ @memA1_buff_1, %34 ]
  br label %36
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
