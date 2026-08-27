; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"
target triple = "aie2p"

@idx_buffer_pv_3 = global [2 x i32] zeroinitializer
@mha_rtpss_3_stage2 = external global [4 x i32]
@idx_buffer_pv_2 = external global [2 x i32]
@mha_rtpss_2_stage2 = external global [4 x i32]
@idx_buffer_pv_1 = external global [2 x i32]
@mha_rtpss_1_stage2 = external global [4 x i32]
@idx_buffer_pv_0 = external global [2 x i32]
@mha_rtpss_0_stage2 = external global [4 x i32]
@scale_buffer_softmax_3 = external global [256 x bfloat]
@idx_buffer_softmax_3 = external global [2 x i32]
@mha_rtpss_3_stage1 = external global [4 x i32]
@scale_buffer_softmax_2 = external global [256 x bfloat]
@idx_buffer_softmax_2 = external global [2 x i32]
@mha_rtpss_2_stage1 = external global [4 x i32]
@scale_buffer_softmax_1 = external global [256 x bfloat]
@idx_buffer_softmax_1 = external global [2 x i32]
@mha_rtpss_1_stage1 = external global [4 x i32]
@scale_buffer_softmax_0 = external global [256 x bfloat]
@idx_buffer_softmax_0 = external global [2 x i32]
@mha_rtpss_0_stage1 = external global [4 x i32]
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
@memO_buff_1 = external global [256 x [64 x bfloat]]
@memO_buff_0 = external global [256 x [64 x bfloat]]
@memK_3_cons_buff_1 = external global [64 x [64 x bfloat]]
@memK_3_cons_buff_0 = external global [64 x [64 x bfloat]]
@memK_2_cons_buff_1 = external global [64 x [64 x bfloat]]
@memK_2_cons_buff_0 = external global [64 x [64 x bfloat]]
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
@memQ2_cons_buff_1 = external global [64 x [64 x bfloat]]
@memQ2_cons_buff_0 = external global [64 x [64 x bfloat]]
@memQ3_cons_buff_1 = external global [64 x [64 x bfloat]]
@memQ3_cons_buff_0 = external global [64 x [64 x bfloat]]
@inV_cons_buff_1 = external global [64 x [64 x bfloat]]
@inV_cons_buff_0 = external global [64 x [64 x bfloat]]
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
@memA2_buff_1 = external global [64 x [64 x bfloat]]
@memA2_buff_0 = external global [64 x [64 x bfloat]]
@memA2_cons_buff_1 = external global [64 x [64 x bfloat]]
@memA2_cons_buff_0 = external global [64 x [64 x bfloat]]
@outA2_cons_buff_1 = external global [64 x [64 x bfloat]]
@outA2_cons_buff_0 = external global [64 x [64 x bfloat]]
@memA3_buff_1 = external global [64 x [64 x bfloat]]
@memA3_buff_0 = external global [64 x [64 x bfloat]]
@memA3_cons_buff_1 = external global [64 x [64 x bfloat]]
@memA3_cons_buff_0 = external global [64 x [64 x bfloat]]
@outA3_cons_buff_1 = external global [64 x [64 x bfloat]]
@outA3_cons_buff_0 = external global [64 x [64 x bfloat]]
@outO0_buff_1 = external global [64 x [64 x bfloat]]
@outO0_buff_0 = external global [64 x [64 x bfloat]]
@outO1_buff_1 = external global [64 x [64 x bfloat]]
@outO1_buff_0 = external global [64 x [64 x bfloat]]
@outO2_buff_1 = external global [64 x [64 x bfloat]]
@outO2_buff_0 = external global [64 x [64 x bfloat]]
@outO3_buff_1 = external global [64 x [64 x bfloat]]
@outO3_buff_0 = external global [64 x [64 x bfloat]]
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
@scaleOF0_buff_1 = external global [256 x bfloat]
@scaleOF0_buff_0 = external global [256 x bfloat]
@scaleOF1_buff_1 = external global [256 x bfloat]
@scaleOF1_buff_0 = external global [256 x bfloat]
@scaleOF2_buff_1 = external global [256 x bfloat]
@scaleOF2_buff_0 = external global [256 x bfloat]
@scaleOF3_buff_1 = external global [256 x bfloat]
@scaleOF3_buff_0 = external global [256 x bfloat]

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

define void @core_3_4() {
  call void @llvm.aie2p.acquire(i32 54, i32 1)
  %1 = load i32, ptr @mha_rtpss_3_stage2
  %2 = load i32, ptr getelementptr inbounds nuw (i8, ptr @mha_rtpss_3_stage2, i64 4)
  %3 = sext i32 %1 to i64
  %4 = icmp sgt i32 %2, 2
  %5 = icmp sgt i32 %2, 1
  br label %6

6:                                                ; preds = %134, %0
  %7 = phi i64 [ %135, %134 ], [ 0, %0 ]
  %8 = phi i32 [ %16, %134 ], [ 0, %0 ]
  %9 = phi i32 [ %17, %134 ], [ 0, %0 ]
  %10 = phi i32 [ %18, %134 ], [ 0, %0 ]
  %11 = phi i32 [ %19, %134 ], [ 0, %0 ]
  %12 = icmp slt i64 %7, 9223372036854775807
  br i1 %12, label %13, label %136

13:                                               ; preds = %6
  store i32 0, ptr @idx_buffer_pv_3
  store i32 3, ptr getelementptr inbounds nuw (i8, ptr @idx_buffer_pv_3, i64 4)
  br label %14

14:                                               ; preds = %124, %13
  %15 = phi i64 [ %133, %124 ], [ 0, %13 ]
  %16 = phi i32 [ %132, %124 ], [ %8, %13 ]
  %17 = phi i32 [ %125, %124 ], [ %9, %13 ]
  %18 = phi i32 [ %126, %124 ], [ %10, %13 ]
  %19 = phi i32 [ %127, %124 ], [ %11, %13 ]
  %20 = icmp slt i64 %15, %3
  br i1 %20, label %21, label %134

21:                                               ; preds = %14
  call void @llvm.aie2p.acquire(i32 50, i32 -1)
  %22 = sext i32 %16 to i64
  switch i64 %22, label %23 [
    i64 0, label %137
    i64 1, label %139
  ]

23:                                               ; preds = %137, %139, %21
  %24 = phi ptr [ %140, %139 ], [ %138, %137 ], [ @outO3_buff_0, %21 ]
  %25 = getelementptr [64 x [64 x bfloat]], ptr %24, i32 0, i32 0, i32 0
  br label %26

26:                                               ; preds = %23
  call void @zero_bf16(ptr %25)
  call void @llvm.aie2p.acquire(i32 49, i32 -1)
  %27 = sext i32 %17 to i64
  switch i64 %27, label %28 [
    i64 0, label %141
    i64 1, label %143
  ]

28:                                               ; preds = %141, %143, %26
  %29 = phi ptr [ %144, %143 ], [ %142, %141 ], [ @outP3_cons_buff_0, %26 ]
  %30 = getelementptr [64 x [64 x bfloat]], ptr %29, i32 0, i32 0, i32 0
  br label %31

31:                                               ; preds = %28
  call void @llvm.aie2p.acquire(i32 53, i32 -1)
  %32 = sext i32 %18 to i64
  switch i64 %32, label %33 [
    i64 0, label %145
    i64 1, label %147
  ]

33:                                               ; preds = %145, %147, %31
  %34 = phi ptr [ %148, %147 ], [ %146, %145 ], [ @memV_3_cons_buff_0, %31 ]
  %35 = getelementptr [64 x [64 x bfloat]], ptr %34, i32 0, i32 0, i32 0
  br label %36

36:                                               ; preds = %33
  call void @llvm.aie2p.acquire(i32 1, i32 -1)
  %37 = sext i32 %19 to i64
  switch i64 %37, label %38 [
    i64 0, label %149
    i64 1, label %151
  ]

38:                                               ; preds = %149, %151, %36
  %39 = phi ptr [ %152, %151 ], [ %150, %149 ], [ @scaleOF3_buff_0, %36 ]
  %40 = getelementptr [256 x bfloat], ptr %39, i32 0, i32 0
  br label %41

41:                                               ; preds = %38
  call void @matmul_PV(ptr %30, ptr %35, ptr %25, ptr %40, i32 64, i32 0, ptr @idx_buffer_pv_3)
  call void @llvm.aie2p.release(i32 48, i32 1)
  %42 = add i32 %17, 1
  %43 = icmp sge i32 %42, 2
  %44 = select i1 %43, i32 0, i32 %42
  call void @llvm.aie2p.release(i32 52, i32 1)
  %45 = add i32 %18, 1
  %46 = icmp sge i32 %45, 2
  %47 = select i1 %46, i32 0, i32 %45
  call void @llvm.aie2p.release(i32 0, i32 1)
  %48 = add i32 %19, 1
  %49 = icmp sge i32 %48, 2
  %50 = select i1 %49, i32 0, i32 %48
  %51 = load i32, ptr @idx_buffer_pv_3
  %52 = add i32 %51, 1
  store i32 %52, ptr @idx_buffer_pv_3
  br i1 %4, label %53, label %90

53:                                               ; preds = %41
  %54 = sub i32 %2, 2
  %55 = sext i32 %54 to i64
  br label %56

56:                                               ; preds = %77, %53
  %57 = phi i64 [ %89, %77 ], [ 0, %53 ]
  %58 = phi i32 [ %80, %77 ], [ %44, %53 ]
  %59 = phi i32 [ %83, %77 ], [ %47, %53 ]
  %60 = phi i32 [ %86, %77 ], [ %50, %53 ]
  %61 = icmp slt i64 %57, %55
  br i1 %61, label %62, label %90

62:                                               ; preds = %56
  call void @llvm.aie2p.acquire(i32 49, i32 -1)
  %63 = sext i32 %58 to i64
  switch i64 %63, label %64 [
    i64 0, label %153
    i64 1, label %155
  ]

64:                                               ; preds = %153, %155, %62
  %65 = phi ptr [ %156, %155 ], [ %154, %153 ], [ @outP3_cons_buff_0, %62 ]
  %66 = getelementptr [64 x [64 x bfloat]], ptr %65, i32 0, i32 0, i32 0
  br label %67

67:                                               ; preds = %64
  call void @llvm.aie2p.acquire(i32 53, i32 -1)
  %68 = sext i32 %59 to i64
  switch i64 %68, label %69 [
    i64 0, label %157
    i64 1, label %159
  ]

69:                                               ; preds = %157, %159, %67
  %70 = phi ptr [ %160, %159 ], [ %158, %157 ], [ @memV_3_cons_buff_0, %67 ]
  %71 = getelementptr [64 x [64 x bfloat]], ptr %70, i32 0, i32 0, i32 0
  br label %72

72:                                               ; preds = %69
  call void @llvm.aie2p.acquire(i32 1, i32 -1)
  %73 = sext i32 %60 to i64
  switch i64 %73, label %74 [
    i64 0, label %161
    i64 1, label %163
  ]

74:                                               ; preds = %161, %163, %72
  %75 = phi ptr [ %164, %163 ], [ %162, %161 ], [ @scaleOF3_buff_0, %72 ]
  %76 = getelementptr [256 x bfloat], ptr %75, i32 0, i32 0
  br label %77

77:                                               ; preds = %74
  call void @matmul_PV(ptr %66, ptr %71, ptr %25, ptr %76, i32 64, i32 1, ptr @idx_buffer_pv_3)
  call void @llvm.aie2p.release(i32 48, i32 1)
  %78 = add i32 %58, 1
  %79 = icmp sge i32 %78, 2
  %80 = select i1 %79, i32 0, i32 %78
  call void @llvm.aie2p.release(i32 52, i32 1)
  %81 = add i32 %59, 1
  %82 = icmp sge i32 %81, 2
  %83 = select i1 %82, i32 0, i32 %81
  call void @llvm.aie2p.release(i32 0, i32 1)
  %84 = add i32 %60, 1
  %85 = icmp sge i32 %84, 2
  %86 = select i1 %85, i32 0, i32 %84
  %87 = load i32, ptr @idx_buffer_pv_3
  %88 = add i32 %87, 1
  store i32 %88, ptr @idx_buffer_pv_3
  %89 = add i64 %57, 1
  br label %56

90:                                               ; preds = %56, %41
  %91 = phi i32 [ %58, %56 ], [ %44, %41 ]
  %92 = phi i32 [ %59, %56 ], [ %47, %41 ]
  %93 = phi i32 [ %60, %56 ], [ %50, %41 ]
  br i1 %5, label %94, label %121

94:                                               ; preds = %90
  call void @llvm.aie2p.acquire(i32 49, i32 -1)
  %95 = sext i32 %91 to i64
  switch i64 %95, label %96 [
    i64 0, label %165
    i64 1, label %167
  ]

96:                                               ; preds = %165, %167, %94
  %97 = phi ptr [ %168, %167 ], [ %166, %165 ], [ @outP3_cons_buff_0, %94 ]
  %98 = getelementptr [64 x [64 x bfloat]], ptr %97, i32 0, i32 0, i32 0
  br label %99

99:                                               ; preds = %96
  call void @llvm.aie2p.acquire(i32 53, i32 -1)
  %100 = sext i32 %92 to i64
  switch i64 %100, label %101 [
    i64 0, label %169
    i64 1, label %171
  ]

101:                                              ; preds = %169, %171, %99
  %102 = phi ptr [ %172, %171 ], [ %170, %169 ], [ @memV_3_cons_buff_0, %99 ]
  %103 = getelementptr [64 x [64 x bfloat]], ptr %102, i32 0, i32 0, i32 0
  br label %104

104:                                              ; preds = %101
  call void @llvm.aie2p.acquire(i32 1, i32 -1)
  %105 = sext i32 %93 to i64
  switch i64 %105, label %106 [
    i64 0, label %173
    i64 1, label %175
  ]

106:                                              ; preds = %173, %175, %104
  %107 = phi ptr [ %176, %175 ], [ %174, %173 ], [ @scaleOF3_buff_0, %104 ]
  %108 = getelementptr [256 x bfloat], ptr %107, i32 0, i32 0
  br label %109

109:                                              ; preds = %106
  call void @matmul_PV(ptr %98, ptr %103, ptr %25, ptr %108, i32 64, i32 1, ptr @idx_buffer_pv_3)
  call void @rescale_O(ptr %25, ptr %108, i32 64, ptr @idx_buffer_pv_3)
  call void @llvm.aie2p.release(i32 48, i32 1)
  %110 = add i32 %91, 1
  %111 = icmp sge i32 %110, 2
  %112 = select i1 %111, i32 0, i32 %110
  call void @llvm.aie2p.release(i32 52, i32 1)
  %113 = add i32 %92, 1
  %114 = icmp sge i32 %113, 2
  %115 = select i1 %114, i32 0, i32 %113
  call void @llvm.aie2p.release(i32 0, i32 1)
  %116 = add i32 %93, 1
  %117 = icmp sge i32 %116, 2
  %118 = select i1 %117, i32 0, i32 %116
  %119 = load i32, ptr @idx_buffer_pv_3
  %120 = add i32 %119, 1
  store i32 %120, ptr @idx_buffer_pv_3
  br label %124

121:                                              ; preds = %90
  call void @rescale_O(ptr %25, ptr %40, i32 64, ptr @idx_buffer_pv_3)
  %122 = load i32, ptr @idx_buffer_pv_3
  %123 = add i32 %122, 1
  store i32 %123, ptr @idx_buffer_pv_3
  br label %124

124:                                              ; preds = %109, %121
  %125 = phi i32 [ %91, %121 ], [ %112, %109 ]
  %126 = phi i32 [ %92, %121 ], [ %115, %109 ]
  %127 = phi i32 [ %93, %121 ], [ %118, %109 ]
  store i32 0, ptr @idx_buffer_pv_3
  %128 = load i32, ptr getelementptr inbounds nuw (i8, ptr @idx_buffer_pv_3, i64 4)
  %129 = add i32 %128, 4
  store i32 %129, ptr getelementptr inbounds nuw (i8, ptr @idx_buffer_pv_3, i64 4)
  call void @llvm.aie2p.release(i32 51, i32 1)
  %130 = add i32 %16, 1
  %131 = icmp sge i32 %130, 2
  %132 = select i1 %131, i32 0, i32 %130
  %133 = add i64 %15, 1
  br label %14

134:                                              ; preds = %14
  %135 = add i64 %7, 1
  br label %6

136:                                              ; preds = %6
  ret void

137:                                              ; preds = %21
  %138 = phi ptr [ @outO3_buff_0, %21 ]
  br label %23

139:                                              ; preds = %21
  %140 = phi ptr [ @outO3_buff_1, %21 ]
  br label %23

141:                                              ; preds = %26
  %142 = phi ptr [ @outP3_cons_buff_0, %26 ]
  br label %28

143:                                              ; preds = %26
  %144 = phi ptr [ @outP3_cons_buff_1, %26 ]
  br label %28

145:                                              ; preds = %31
  %146 = phi ptr [ @memV_3_cons_buff_0, %31 ]
  br label %33

147:                                              ; preds = %31
  %148 = phi ptr [ @memV_3_cons_buff_1, %31 ]
  br label %33

149:                                              ; preds = %36
  %150 = phi ptr [ @scaleOF3_buff_0, %36 ]
  br label %38

151:                                              ; preds = %36
  %152 = phi ptr [ @scaleOF3_buff_1, %36 ]
  br label %38

153:                                              ; preds = %62
  %154 = phi ptr [ @outP3_cons_buff_0, %62 ]
  br label %64

155:                                              ; preds = %62
  %156 = phi ptr [ @outP3_cons_buff_1, %62 ]
  br label %64

157:                                              ; preds = %67
  %158 = phi ptr [ @memV_3_cons_buff_0, %67 ]
  br label %69

159:                                              ; preds = %67
  %160 = phi ptr [ @memV_3_cons_buff_1, %67 ]
  br label %69

161:                                              ; preds = %72
  %162 = phi ptr [ @scaleOF3_buff_0, %72 ]
  br label %74

163:                                              ; preds = %72
  %164 = phi ptr [ @scaleOF3_buff_1, %72 ]
  br label %74

165:                                              ; preds = %94
  %166 = phi ptr [ @outP3_cons_buff_0, %94 ]
  br label %96

167:                                              ; preds = %94
  %168 = phi ptr [ @outP3_cons_buff_1, %94 ]
  br label %96

169:                                              ; preds = %99
  %170 = phi ptr [ @memV_3_cons_buff_0, %99 ]
  br label %101

171:                                              ; preds = %99
  %172 = phi ptr [ @memV_3_cons_buff_1, %99 ]
  br label %101

173:                                              ; preds = %104
  %174 = phi ptr [ @scaleOF3_buff_0, %104 ]
  br label %106

175:                                              ; preds = %104
  %176 = phi ptr [ @scaleOF3_buff_1, %104 ]
  br label %106
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
