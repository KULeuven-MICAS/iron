; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"
target triple = "aie2p"

@flash_index_3_3 = external global [2 x i32]
@flash_state_3_3 = external global [256 x bfloat]
@flash_index_2_3 = external global [2 x i32]
@flash_state_2_3 = external global [256 x bfloat]
@flash_index_1_3 = external global [2 x i32]
@flash_state_1_3 = external global [256 x bfloat]
@flash_index_0_3 = external global [2 x i32]
@flash_state_0_3 = external global [256 x bfloat]
@flash_index_3_4 = external global [2 x i32]
@flash_index_2_4 = external global [2 x i32]
@flash_index_1_4 = external global [2 x i32]
@flash_index_0_4 = external global [2 x i32]
@flash_scale_0_3_0_4_buff_1 = external global [256 x bfloat]
@flash_scale_0_3_0_4_buff_0 = external global [256 x bfloat]
@flash_scale_1_3_1_4_buff_1 = external global [256 x bfloat]
@flash_scale_1_3_1_4_buff_0 = external global [256 x bfloat]
@flash_scale_2_3_2_4_buff_1 = external global [256 x bfloat]
@flash_scale_2_3_2_4_buff_0 = external global [256 x bfloat]
@flash_scale_3_3_3_4_buff_1 = external global [256 x bfloat]
@flash_scale_3_3_3_4_buff_0 = external global [256 x bfloat]
@of_0_mem_0_cons_buff_1 = external global [64 x [64 x bfloat]]
@of_0_mem_0_cons_buff_0 = external global [64 x [64 x bfloat]]
@of_0_mem_1_cons_buff_1 = external global [64 x [64 x bfloat]]
@of_0_mem_1_cons_buff_0 = external global [64 x [64 x bfloat]]
@of_0_mem_2_cons_buff_1 = external global [64 x [64 x bfloat]]
@of_0_mem_2_cons_buff_0 = external global [64 x [64 x bfloat]]
@of_0_mem_3_cons_buff_1 = external global [64 x [64 x bfloat]]
@of_0_mem_3_cons_buff_0 = external global [64 x [64 x bfloat]]
@of_1_mem_cons_buff_1 = external global [64 x [64 x bfloat]]
@of_1_mem_cons_buff_0 = external global [64 x [64 x bfloat]]
@of_2_mem_cons_buff_1 = external global [64 x [64 x bfloat]]
@of_2_mem_cons_buff_0 = external global [64 x [64 x bfloat]]
@of_3_unicast_0_0_cons_buff_0 = external global [64 x [64 x bfloat]]
@of_3_unicast_1_0_cons_buff_0 = external global [64 x [64 x bfloat]]
@of_3_unicast_2_0_cons_buff_0 = external global [64 x [64 x bfloat]]
@of_3_unicast_3_0_cons_buff_0 = external global [64 x [64 x bfloat]]
@of_4_broadcast_0_0_3_cons_buff_1 = external global [64 x [64 x bfloat]]
@of_4_broadcast_0_0_3_cons_buff_0 = external global [64 x [64 x bfloat]]
@of_4_broadcast_0_0_2_cons_buff_1 = external global [64 x [64 x bfloat]]
@of_4_broadcast_0_0_2_cons_buff_0 = external global [64 x [64 x bfloat]]
@of_4_broadcast_0_0_1_cons_buff_1 = external global [64 x [64 x bfloat]]
@of_4_broadcast_0_0_1_cons_buff_0 = external global [64 x [64 x bfloat]]
@of_4_broadcast_0_0_0_cons_buff_1 = external global [64 x [64 x bfloat]]
@of_4_broadcast_0_0_0_cons_buff_0 = external global [64 x [64 x bfloat]]
@of_5_broadcast_0_0_3_cons_buff_1 = external global [64 x [64 x bfloat]]
@of_5_broadcast_0_0_3_cons_buff_0 = external global [64 x [64 x bfloat]]
@of_5_broadcast_0_0_2_cons_buff_1 = external global [64 x [64 x bfloat]]
@of_5_broadcast_0_0_2_cons_buff_0 = external global [64 x [64 x bfloat]]
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
@of_6_unicast_2_buff_1 = external global [64 x [64 x bfloat]]
@of_6_unicast_2_buff_0 = external global [64 x [64 x bfloat]]
@of_6_unicast_2_cons_buff_1 = external global [64 x [64 x bfloat]]
@of_6_unicast_2_cons_buff_0 = external global [64 x [64 x bfloat]]
@of_6_unicast_3_buff_1 = external global [64 x [64 x bfloat]]
@of_6_unicast_3_buff_0 = external global [64 x [64 x bfloat]]
@of_6_unicast_3_cons_buff_1 = external global [64 x [64 x bfloat]]
@of_6_unicast_3_cons_buff_0 = external global [64 x [64 x bfloat]]
@of_7_unicast_0_0_cons_buff_1 = external global [64 x [64 x bfloat]]
@of_7_unicast_0_0_cons_buff_0 = external global [64 x [64 x bfloat]]
@of_7_unicast_1_0_cons_buff_1 = external global [64 x [64 x bfloat]]
@of_7_unicast_1_0_cons_buff_0 = external global [64 x [64 x bfloat]]
@of_7_unicast_2_0_cons_buff_1 = external global [64 x [64 x bfloat]]
@of_7_unicast_2_0_cons_buff_0 = external global [64 x [64 x bfloat]]
@of_7_unicast_3_0_cons_buff_1 = external global [64 x [64 x bfloat]]
@of_7_unicast_3_0_cons_buff_0 = external global [64 x [64 x bfloat]]
@of_8_unicast_0_buff_1 = external global [64 x [64 x bfloat]]
@of_8_unicast_0_buff_0 = external global [64 x [64 x bfloat]]
@of_8_unicast_0_cons_buff_1 = external global [64 x [64 x bfloat]]
@of_8_unicast_0_cons_buff_0 = external global [64 x [64 x bfloat]]
@of_8_unicast_1_buff_1 = external global [64 x [64 x bfloat]]
@of_8_unicast_1_buff_0 = external global [64 x [64 x bfloat]]
@of_8_unicast_1_cons_buff_1 = external global [64 x [64 x bfloat]]
@of_8_unicast_1_cons_buff_0 = external global [64 x [64 x bfloat]]
@of_8_unicast_2_buff_1 = external global [64 x [64 x bfloat]]
@of_8_unicast_2_buff_0 = external global [64 x [64 x bfloat]]
@of_8_unicast_2_cons_buff_1 = external global [64 x [64 x bfloat]]
@of_8_unicast_2_cons_buff_0 = external global [64 x [64 x bfloat]]
@of_8_unicast_3_buff_1 = external global [64 x [64 x bfloat]]
@of_8_unicast_3_buff_0 = external global [64 x [64 x bfloat]]
@of_8_unicast_3_cons_buff_1 = external global [64 x [64 x bfloat]]
@of_8_unicast_3_cons_buff_0 = external global [64 x [64 x bfloat]]
@of_9_unicast_0_0_cons_buff_1 = external global [64 x [64 x bfloat]]
@of_9_unicast_0_0_cons_buff_0 = external global [64 x [64 x bfloat]]
@of_9_unicast_1_0_cons_buff_1 = external global [64 x [64 x bfloat]]
@of_9_unicast_1_0_cons_buff_0 = external global [64 x [64 x bfloat]]
@of_9_unicast_2_0_cons_buff_1 = external global [64 x [64 x bfloat]]
@of_9_unicast_2_0_cons_buff_0 = external global [64 x [64 x bfloat]]
@of_9_unicast_3_0_cons_buff_1 = external global [64 x [64 x bfloat]]
@of_9_unicast_3_0_cons_buff_0 = external global [64 x [64 x bfloat]]
@of_10_unicast_0_buff_1 = external global [64 x [64 x bfloat]]
@of_10_unicast_0_buff_0 = external global [64 x [64 x bfloat]]
@of_10_unicast_0_cons_buff_1 = external global [64 x [64 x bfloat]]
@of_10_unicast_0_cons_buff_0 = external global [64 x [64 x bfloat]]
@of_10_unicast_1_buff_1 = external global [64 x [64 x bfloat]]
@of_10_unicast_1_buff_0 = external global [64 x [64 x bfloat]]
@of_10_unicast_1_cons_buff_1 = external global [64 x [64 x bfloat]]
@of_10_unicast_1_cons_buff_0 = external global [64 x [64 x bfloat]]
@of_10_unicast_2_buff_1 = external global [64 x [64 x bfloat]]
@of_10_unicast_2_buff_0 = external global [64 x [64 x bfloat]]
@of_10_unicast_2_cons_buff_1 = external global [64 x [64 x bfloat]]
@of_10_unicast_2_cons_buff_0 = external global [64 x [64 x bfloat]]
@of_10_unicast_3_buff_1 = external global [64 x [64 x bfloat]]
@of_10_unicast_3_buff_0 = external global [64 x [64 x bfloat]]
@of_10_unicast_3_cons_buff_1 = external global [64 x [64 x bfloat]]
@of_10_unicast_3_cons_buff_0 = external global [64 x [64 x bfloat]]

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

define void @core_3_4() {
  br label %1

1:                                                ; preds = %52, %0
  %2 = phi i64 [ %56, %52 ], [ 0, %0 ]
  %3 = phi i32 [ %55, %52 ], [ 0, %0 ]
  %4 = phi i32 [ %16, %52 ], [ 0, %0 ]
  %5 = phi i32 [ %17, %52 ], [ 0, %0 ]
  %6 = phi i32 [ %18, %52 ], [ 0, %0 ]
  %7 = icmp slt i64 %2, 4294967295
  br i1 %7, label %8, label %57

8:                                                ; preds = %1
  call void @llvm.aie2p.acquire(i32 48, i32 -1)
  %9 = sext i32 %3 to i64
  switch i64 %9, label %10 [
    i64 0, label %58
    i64 1, label %60
  ]

10:                                               ; preds = %58, %60, %8
  %11 = phi ptr [ %61, %60 ], [ %59, %58 ], [ @of_10_unicast_3_buff_0, %8 ]
  %12 = getelementptr [64 x [64 x bfloat]], ptr %11, i32 0, i32 0, i32 0
  br label %13

13:                                               ; preds = %10
  call void @op0_zero_bf16(ptr %12)
  br label %14

14:                                               ; preds = %41, %13
  %15 = phi i64 [ %51, %41 ], [ 0, %13 ]
  %16 = phi i32 [ %50, %41 ], [ %4, %13 ]
  %17 = phi i32 [ %47, %41 ], [ %5, %13 ]
  %18 = phi i32 [ %44, %41 ], [ %6, %13 ]
  %19 = icmp slt i64 %15, 4
  br i1 %19, label %20, label %52

20:                                               ; preds = %14
  call void @llvm.aie2p.acquire(i32 51, i32 -1)
  %21 = sext i32 %16 to i64
  switch i64 %21, label %22 [
    i64 0, label %62
    i64 1, label %64
  ]

22:                                               ; preds = %62, %64, %20
  %23 = phi ptr [ %65, %64 ], [ %63, %62 ], [ @of_9_unicast_3_0_cons_buff_0, %20 ]
  %24 = getelementptr [64 x [64 x bfloat]], ptr %23, i32 0, i32 0, i32 0
  br label %25

25:                                               ; preds = %22
  call void @llvm.aie2p.acquire(i32 53, i32 -1)
  %26 = sext i32 %17 to i64
  switch i64 %26, label %27 [
    i64 0, label %66
    i64 1, label %68
  ]

27:                                               ; preds = %66, %68, %25
  %28 = phi ptr [ %69, %68 ], [ %67, %66 ], [ @of_5_broadcast_0_0_3_cons_buff_0, %25 ]
  %29 = getelementptr [64 x [64 x bfloat]], ptr %28, i32 0, i32 0, i32 0
  br label %30

30:                                               ; preds = %27
  %31 = trunc i64 %15 to i32
  store i32 %31, ptr @flash_index_3_4
  store i32 3, ptr getelementptr inbounds nuw (i8, ptr @flash_index_3_4, i64 4)
  call void @llvm.aie2p.acquire(i32 5, i32 -1)
  %32 = sext i32 %18 to i64
  switch i64 %32, label %33 [
    i64 0, label %70
    i64 1, label %72
  ]

33:                                               ; preds = %70, %72, %30
  %34 = phi ptr [ %73, %72 ], [ %71, %70 ], [ @flash_scale_3_3_3_4_buff_0, %30 ]
  %35 = getelementptr [256 x bfloat], ptr %34, i32 0, i32 0
  br label %36

36:                                               ; preds = %33
  %37 = icmp ne i32 %31, 0
  %38 = zext i1 %37 to i32
  call void @op0_matmul_PV(ptr %24, ptr %29, ptr %12, ptr %35, i32 64, i32 %38, ptr @flash_index_3_4)
  %39 = icmp eq i32 %31, 3
  br i1 %39, label %40, label %41

40:                                               ; preds = %36
  call void @op0_rescale_O(ptr %12, ptr %35, i32 64, ptr @flash_index_3_4)
  br label %41

41:                                               ; preds = %40, %36
  call void @llvm.aie2p.release(i32 4, i32 1)
  %42 = add i32 %18, 1
  %43 = icmp sge i32 %42, 2
  %44 = select i1 %43, i32 0, i32 %42
  call void @llvm.aie2p.release(i32 52, i32 1)
  %45 = add i32 %17, 1
  %46 = icmp sge i32 %45, 2
  %47 = select i1 %46, i32 0, i32 %45
  call void @llvm.aie2p.release(i32 50, i32 1)
  %48 = add i32 %16, 1
  %49 = icmp sge i32 %48, 2
  %50 = select i1 %49, i32 0, i32 %48
  %51 = add i64 %15, 1
  br label %14

52:                                               ; preds = %14
  call void @llvm.aie2p.release(i32 49, i32 1)
  %53 = add i32 %3, 1
  %54 = icmp sge i32 %53, 2
  %55 = select i1 %54, i32 0, i32 %53
  %56 = add i64 %2, 1
  br label %1

57:                                               ; preds = %1
  ret void

58:                                               ; preds = %8
  %59 = phi ptr [ @of_10_unicast_3_buff_0, %8 ]
  br label %10

60:                                               ; preds = %8
  %61 = phi ptr [ @of_10_unicast_3_buff_1, %8 ]
  br label %10

62:                                               ; preds = %20
  %63 = phi ptr [ @of_9_unicast_3_0_cons_buff_0, %20 ]
  br label %22

64:                                               ; preds = %20
  %65 = phi ptr [ @of_9_unicast_3_0_cons_buff_1, %20 ]
  br label %22

66:                                               ; preds = %25
  %67 = phi ptr [ @of_5_broadcast_0_0_3_cons_buff_0, %25 ]
  br label %27

68:                                               ; preds = %25
  %69 = phi ptr [ @of_5_broadcast_0_0_3_cons_buff_1, %25 ]
  br label %27

70:                                               ; preds = %30
  %71 = phi ptr [ @flash_scale_3_3_3_4_buff_0, %30 ]
  br label %33

72:                                               ; preds = %30
  %73 = phi ptr [ @flash_scale_3_3_3_4_buff_1, %30 ]
  br label %33
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
