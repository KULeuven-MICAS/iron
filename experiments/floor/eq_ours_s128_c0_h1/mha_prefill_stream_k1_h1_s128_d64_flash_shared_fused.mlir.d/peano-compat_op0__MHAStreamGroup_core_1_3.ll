; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"
target triple = "aie2p"

@flash_index_1_3 = external global [2 x i32]
@flash_state_1_3 = external global [256 x bfloat]
@flash_index_0_3 = external global [2 x i32]
@flash_state_0_3 = external global [256 x bfloat]
@flash_index_1_4 = external global [2 x i32]
@flash_index_0_4 = external global [2 x i32]
@flash_scale_0_3_0_4_buff_1 = external global [256 x bfloat]
@flash_scale_0_3_0_4_buff_0 = external global [256 x bfloat]
@flash_scale_1_3_1_4_buff_1 = external global [256 x bfloat]
@flash_scale_1_3_1_4_buff_0 = external global [256 x bfloat]
@of_1_mem_cons_buff_1 = external global [2 x [64 x [64 x bfloat]]]
@of_1_mem_cons_buff_0 = external global [2 x [64 x [64 x bfloat]]]
@of_2_mem_cons_buff_1 = external global [2 x [64 x [64 x bfloat]]]
@of_2_mem_cons_buff_0 = external global [2 x [64 x [64 x bfloat]]]
@of_0_mem_0_cons_buff_1 = external global [64 x [64 x bfloat]]
@of_0_mem_0_cons_buff_0 = external global [64 x [64 x bfloat]]
@of_0_mem_1_cons_buff_1 = external global [64 x [64 x bfloat]]
@of_0_mem_1_cons_buff_0 = external global [64 x [64 x bfloat]]
@of_3_unicast_0_0_cons_buff_0 = external global [64 x [64 x bfloat]]
@of_3_unicast_1_0_cons_buff_0 = external global [64 x [64 x bfloat]]
@of_4_broadcast_0_0_1_cons_buff_1 = external global [64 x [64 x bfloat]]
@of_4_broadcast_0_0_1_cons_buff_0 = external global [64 x [64 x bfloat]]
@of_4_broadcast_0_0_0_cons_buff_1 = external global [64 x [64 x bfloat]]
@of_4_broadcast_0_0_0_cons_buff_0 = external global [64 x [64 x bfloat]]
@of_5_broadcast_0_0_1_cons_buff_1 = external global [64 x [64 x bfloat]]
@of_5_broadcast_0_0_1_cons_buff_0 = external global [64 x [64 x bfloat]]
@of_5_broadcast_0_0_0_cons_buff_1 = external global [64 x [64 x bfloat]]
@of_5_broadcast_0_0_0_cons_buff_0 = external global [64 x [64 x bfloat]]
@of_6_unicast_0_buff_1 = external global [64 x [64 x bfloat]]
@of_6_unicast_0_buff_0 = external global [64 x [64 x bfloat]]
@of_6_unicast_0_cons_buff_1 = external global [64 x [64 x bfloat]]
@of_6_unicast_0_cons_buff_0 = external global [64 x [64 x bfloat]]
@of_6_unicast_1_buff_1 = external global [64 x [64 x bfloat]]
@of_6_unicast_1_buff_0 = external global [64 x [64 x bfloat]]
@of_6_unicast_1_cons_buff_1 = external global [64 x [64 x bfloat]]
@of_6_unicast_1_cons_buff_0 = external global [64 x [64 x bfloat]]
@of_7_unicast_0_0_cons_buff_1 = external global [64 x [64 x bfloat]]
@of_7_unicast_0_0_cons_buff_0 = external global [64 x [64 x bfloat]]
@of_7_unicast_1_0_cons_buff_1 = external global [64 x [64 x bfloat]]
@of_7_unicast_1_0_cons_buff_0 = external global [64 x [64 x bfloat]]
@of_8_unicast_0_buff_1 = external global [64 x [64 x bfloat]]
@of_8_unicast_0_buff_0 = external global [64 x [64 x bfloat]]
@of_8_unicast_0_cons_buff_1 = external global [64 x [64 x bfloat]]
@of_8_unicast_0_cons_buff_0 = external global [64 x [64 x bfloat]]
@of_8_unicast_1_buff_1 = external global [64 x [64 x bfloat]]
@of_8_unicast_1_buff_0 = external global [64 x [64 x bfloat]]
@of_8_unicast_1_cons_buff_1 = external global [64 x [64 x bfloat]]
@of_8_unicast_1_cons_buff_0 = external global [64 x [64 x bfloat]]
@of_9_unicast_0_0_cons_buff_1 = external global [64 x [64 x bfloat]]
@of_9_unicast_0_0_cons_buff_0 = external global [64 x [64 x bfloat]]
@of_9_unicast_1_0_cons_buff_1 = external global [64 x [64 x bfloat]]
@of_9_unicast_1_0_cons_buff_0 = external global [64 x [64 x bfloat]]
@of_10_unicast_0_buff_1 = external global [64 x [64 x bfloat]]
@of_10_unicast_0_buff_0 = external global [64 x [64 x bfloat]]
@of_10_unicast_0_cons_buff_1 = external global [64 x [64 x bfloat]]
@of_10_unicast_0_cons_buff_0 = external global [64 x [64 x bfloat]]
@of_10_unicast_1_buff_1 = external global [64 x [64 x bfloat]]
@of_10_unicast_1_buff_0 = external global [64 x [64 x bfloat]]
@of_10_unicast_1_cons_buff_1 = external global [64 x [64 x bfloat]]
@of_10_unicast_1_cons_buff_0 = external global [64 x [64 x bfloat]]

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

declare void @op0_zero_bf16_64_64_64(ptr)

declare void @op0_matmul_bf16_bf16_64_64_64(ptr, ptr, ptr)

declare void @op0_rescale_O(ptr, ptr, i32, ptr)

declare void @op0_zero_bf16(ptr)

declare void @op0_matmul_PV(ptr, ptr, ptr, ptr, i32, i32, ptr)

declare void @op0_init_scale_buffer(ptr, i32)

declare void @op0_passThroughLine(ptr, ptr, i32)

declare void @op0_partial_softmax(ptr, ptr, ptr, ptr, bfloat, i32, i32, i32, i32)

define void @core_1_3() {
  br label %1

1:                                                ; preds = %38, %0
  %2 = phi i64 [ %39, %38 ], [ 0, %0 ]
  %3 = phi i32 [ %9, %38 ], [ 0, %0 ]
  %4 = phi i32 [ %10, %38 ], [ 0, %0 ]
  %5 = icmp slt i64 %2, 4294967295
  br i1 %5, label %6, label %40

6:                                                ; preds = %1
  call void @llvm.aie2p.acquire(i32 51, i32 -2)
  br label %7

7:                                                ; preds = %30, %6
  %8 = phi i64 [ %37, %30 ], [ 0, %6 ]
  %9 = phi i32 [ %36, %30 ], [ %3, %6 ]
  %10 = phi i32 [ %33, %30 ], [ %4, %6 ]
  %11 = icmp slt i64 %8, 2
  br i1 %11, label %12, label %38

12:                                               ; preds = %7
  call void @llvm.aie2p.acquire(i32 48, i32 -1)
  %13 = sext i32 %9 to i64
  switch i64 %13, label %14 [
    i64 0, label %41
    i64 1, label %43
  ]

14:                                               ; preds = %41, %43, %12
  %15 = phi ptr [ %44, %43 ], [ %42, %41 ], [ @of_8_unicast_1_buff_0, %12 ]
  %16 = getelementptr [64 x [64 x bfloat]], ptr %15, i32 0, i32 0, i32 0
  br label %17

17:                                               ; preds = %14
  switch i64 %8, label %18 [
    i64 0, label %45
    i64 1, label %47
  ]

18:                                               ; preds = %45, %47, %17
  %19 = phi ptr [ %48, %47 ], [ %46, %45 ], [ @of_7_unicast_1_0_cons_buff_0, %17 ]
  %20 = getelementptr [64 x [64 x bfloat]], ptr %19, i32 0, i32 0, i32 0
  br label %21

21:                                               ; preds = %18
  %22 = trunc i64 %8 to i32
  store i32 %22, ptr @flash_index_1_3
  store i32 1, ptr getelementptr inbounds nuw (i8, ptr @flash_index_1_3, i64 4)
  %23 = icmp eq i32 %22, 0
  br i1 %23, label %24, label %25

24:                                               ; preds = %21
  call void @op0_init_scale_buffer(ptr @flash_state_1_3, i32 64)
  br label %25

25:                                               ; preds = %24, %21
  call void @op0_partial_softmax(ptr %20, ptr %16, ptr @flash_state_1_3, ptr @flash_index_1_3, bfloat 0xR3FB9, i32 64, i32 64, i32 128, i32 128)
  call void @llvm.aie2p.acquire(i32 52, i32 -1)
  %26 = sext i32 %10 to i64
  switch i64 %26, label %27 [
    i64 0, label %49
    i64 1, label %51
  ]

27:                                               ; preds = %49, %51, %25
  %28 = phi ptr [ %52, %51 ], [ %50, %49 ], [ @flash_scale_1_3_1_4_buff_0, %25 ]
  %29 = getelementptr [256 x bfloat], ptr %28, i32 0, i32 0
  br label %30

30:                                               ; preds = %27
  call void @op0_passThroughLine(ptr @flash_state_1_3, ptr %29, i32 256)
  call void @llvm.aie2p.release(i32 53, i32 1)
  %31 = add i32 %10, 1
  %32 = icmp sge i32 %31, 2
  %33 = select i1 %32, i32 0, i32 %31
  call void @llvm.aie2p.release(i32 49, i32 1)
  %34 = add i32 %9, 1
  %35 = icmp sge i32 %34, 2
  %36 = select i1 %35, i32 0, i32 %34
  %37 = add i64 %8, 1
  br label %7

38:                                               ; preds = %7
  call void @llvm.aie2p.release(i32 50, i32 2)
  %39 = add i64 %2, 1
  br label %1

40:                                               ; preds = %1
  ret void

41:                                               ; preds = %12
  %42 = phi ptr [ @of_8_unicast_1_buff_0, %12 ]
  br label %14

43:                                               ; preds = %12
  %44 = phi ptr [ @of_8_unicast_1_buff_1, %12 ]
  br label %14

45:                                               ; preds = %17
  %46 = phi ptr [ @of_7_unicast_1_0_cons_buff_0, %17 ]
  br label %18

47:                                               ; preds = %17
  %48 = phi ptr [ @of_7_unicast_1_0_cons_buff_1, %17 ]
  br label %18

49:                                               ; preds = %25
  %50 = phi ptr [ @flash_scale_1_3_1_4_buff_0, %25 ]
  br label %27

51:                                               ; preds = %25
  %52 = phi ptr [ @flash_scale_1_3_1_4_buff_1, %25 ]
  br label %27
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
