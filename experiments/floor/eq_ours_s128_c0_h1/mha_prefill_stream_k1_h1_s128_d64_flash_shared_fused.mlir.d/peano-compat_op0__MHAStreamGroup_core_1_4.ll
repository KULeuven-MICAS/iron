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

define void @core_1_4() {
  br label %1

1:                                                ; preds = %40, %0
  %2 = phi i64 [ %44, %40 ], [ 0, %0 ]
  %3 = phi i32 [ %43, %40 ], [ 0, %0 ]
  %4 = phi i32 [ %14, %40 ], [ 0, %0 ]
  %5 = icmp slt i64 %2, 4294967295
  br i1 %5, label %6, label %45

6:                                                ; preds = %1
  call void @llvm.aie2p.acquire(i32 48, i32 -1)
  %7 = sext i32 %3 to i64
  switch i64 %7, label %8 [
    i64 0, label %46
    i64 1, label %48
  ]

8:                                                ; preds = %46, %48, %6
  %9 = phi ptr [ %49, %48 ], [ %47, %46 ], [ @of_10_unicast_1_buff_0, %6 ]
  %10 = getelementptr [64 x [64 x bfloat]], ptr %9, i32 0, i32 0, i32 0
  br label %11

11:                                               ; preds = %8
  call void @op0_zero_bf16(ptr %10)
  call void @llvm.aie2p.acquire(i32 51, i32 -2)
  call void @llvm.aie2p.acquire(i32 53, i32 -2)
  br label %12

12:                                               ; preds = %35, %11
  %13 = phi i64 [ %39, %35 ], [ 0, %11 ]
  %14 = phi i32 [ %38, %35 ], [ %4, %11 ]
  %15 = icmp slt i64 %13, 2
  br i1 %15, label %16, label %40

16:                                               ; preds = %12
  switch i64 %13, label %17 [
    i64 0, label %50
    i64 1, label %52
  ]

17:                                               ; preds = %50, %52, %16
  %18 = phi ptr [ %53, %52 ], [ %51, %50 ], [ @of_9_unicast_1_0_cons_buff_0, %16 ]
  %19 = getelementptr [64 x [64 x bfloat]], ptr %18, i32 0, i32 0, i32 0
  br label %20

20:                                               ; preds = %17
  switch i64 %13, label %21 [
    i64 0, label %54
    i64 1, label %56
  ]

21:                                               ; preds = %54, %56, %20
  %22 = phi ptr [ %57, %56 ], [ %55, %54 ], [ @of_5_broadcast_0_0_1_cons_buff_0, %20 ]
  %23 = getelementptr [64 x [64 x bfloat]], ptr %22, i32 0, i32 0, i32 0
  br label %24

24:                                               ; preds = %21
  %25 = trunc i64 %13 to i32
  store i32 %25, ptr @flash_index_1_4
  store i32 1, ptr getelementptr inbounds nuw (i8, ptr @flash_index_1_4, i64 4)
  call void @llvm.aie2p.acquire(i32 5, i32 -1)
  %26 = sext i32 %14 to i64
  switch i64 %26, label %27 [
    i64 0, label %58
    i64 1, label %60
  ]

27:                                               ; preds = %58, %60, %24
  %28 = phi ptr [ %61, %60 ], [ %59, %58 ], [ @flash_scale_1_3_1_4_buff_0, %24 ]
  %29 = getelementptr [256 x bfloat], ptr %28, i32 0, i32 0
  br label %30

30:                                               ; preds = %27
  %31 = icmp ne i32 %25, 0
  %32 = zext i1 %31 to i32
  call void @op0_matmul_PV(ptr %19, ptr %23, ptr %10, ptr %29, i32 64, i32 %32, ptr @flash_index_1_4)
  %33 = icmp eq i32 %25, 1
  br i1 %33, label %34, label %35

34:                                               ; preds = %30
  call void @op0_rescale_O(ptr %10, ptr %29, i32 64, ptr @flash_index_1_4)
  br label %35

35:                                               ; preds = %34, %30
  call void @llvm.aie2p.release(i32 4, i32 1)
  %36 = add i32 %14, 1
  %37 = icmp sge i32 %36, 2
  %38 = select i1 %37, i32 0, i32 %36
  %39 = add i64 %13, 1
  br label %12

40:                                               ; preds = %12
  call void @llvm.aie2p.release(i32 52, i32 2)
  call void @llvm.aie2p.release(i32 50, i32 2)
  call void @llvm.aie2p.release(i32 49, i32 1)
  %41 = add i32 %3, 1
  %42 = icmp sge i32 %41, 2
  %43 = select i1 %42, i32 0, i32 %41
  %44 = add i64 %2, 1
  br label %1

45:                                               ; preds = %1
  ret void

46:                                               ; preds = %6
  %47 = phi ptr [ @of_10_unicast_1_buff_0, %6 ]
  br label %8

48:                                               ; preds = %6
  %49 = phi ptr [ @of_10_unicast_1_buff_1, %6 ]
  br label %8

50:                                               ; preds = %16
  %51 = phi ptr [ @of_9_unicast_1_0_cons_buff_0, %16 ]
  br label %17

52:                                               ; preds = %16
  %53 = phi ptr [ @of_9_unicast_1_0_cons_buff_1, %16 ]
  br label %17

54:                                               ; preds = %20
  %55 = phi ptr [ @of_5_broadcast_0_0_1_cons_buff_0, %20 ]
  br label %21

56:                                               ; preds = %20
  %57 = phi ptr [ @of_5_broadcast_0_0_1_cons_buff_1, %20 ]
  br label %21

58:                                               ; preds = %24
  %59 = phi ptr [ @flash_scale_1_3_1_4_buff_0, %24 ]
  br label %27

60:                                               ; preds = %24
  %61 = phi ptr [ @flash_scale_1_3_1_4_buff_1, %24 ]
  br label %27
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
