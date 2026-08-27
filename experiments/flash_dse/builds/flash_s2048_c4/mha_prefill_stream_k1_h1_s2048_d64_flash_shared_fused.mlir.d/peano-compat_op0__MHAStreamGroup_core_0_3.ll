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
@flash_scale_0_3_buff_1 = external global [256 x bfloat]
@flash_scale_0_3_buff_0 = external global [256 x bfloat]
@flash_scale_1_3_buff_1 = external global [256 x bfloat]
@flash_scale_1_3_buff_0 = external global [256 x bfloat]
@flash_scale_2_3_buff_1 = external global [256 x bfloat]
@flash_scale_2_3_buff_0 = external global [256 x bfloat]
@flash_scale_3_3_buff_1 = external global [256 x bfloat]
@flash_scale_3_3_buff_0 = external global [256 x bfloat]
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
@of_3_unicast_0_0_cons_buff_1 = external global [64 x [64 x bfloat]]
@of_3_unicast_0_0_cons_buff_0 = external global [64 x [64 x bfloat]]
@of_3_unicast_1_0_cons_buff_1 = external global [64 x [64 x bfloat]]
@of_3_unicast_1_0_cons_buff_0 = external global [64 x [64 x bfloat]]
@of_3_unicast_2_0_cons_buff_1 = external global [64 x [64 x bfloat]]
@of_3_unicast_2_0_cons_buff_0 = external global [64 x [64 x bfloat]]
@of_3_unicast_3_0_cons_buff_1 = external global [64 x [64 x bfloat]]
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

define void @core_0_3() {
  br label %1

1:                                                ; preds = %54, %0
  %2 = phi i64 [ %55, %54 ], [ 0, %0 ]
  %3 = phi i32 [ %9, %54 ], [ 0, %0 ]
  %4 = phi i32 [ %10, %54 ], [ 0, %0 ]
  %5 = phi i32 [ %11, %54 ], [ 0, %0 ]
  %6 = icmp slt i64 %2, 4294967295
  br i1 %6, label %7, label %56

7:                                                ; preds = %52, %1
  %8 = phi i64 [ %53, %52 ], [ 0, %1 ]
  %9 = phi i32 [ %18, %52 ], [ %3, %1 ]
  %10 = phi i32 [ %19, %52 ], [ %4, %1 ]
  %11 = phi i32 [ %20, %52 ], [ %5, %1 ]
  %12 = icmp slt i64 %8, 8
  br i1 %12, label %13, label %54

13:                                               ; preds = %7
  %14 = trunc i64 %8 to i32
  %15 = mul i32 %14, 4
  br label %16

16:                                               ; preds = %41, %13
  %17 = phi i64 [ %51, %41 ], [ 0, %13 ]
  %18 = phi i32 [ %50, %41 ], [ %9, %13 ]
  %19 = phi i32 [ %47, %41 ], [ %10, %13 ]
  %20 = phi i32 [ %44, %41 ], [ %11, %13 ]
  %21 = icmp slt i64 %17, 32
  br i1 %21, label %22, label %52

22:                                               ; preds = %16
  call void @llvm.aie2p.acquire(i32 48, i32 -1)
  %23 = sext i32 %18 to i64
  switch i64 %23, label %24 [
    i64 0, label %57
    i64 1, label %59
  ]

24:                                               ; preds = %57, %59, %22
  %25 = phi ptr [ %60, %59 ], [ %58, %57 ], [ @of_8_unicast_0_buff_0, %22 ]
  %26 = getelementptr [64 x [64 x bfloat]], ptr %25, i32 0, i32 0, i32 0
  br label %27

27:                                               ; preds = %24
  call void @llvm.aie2p.acquire(i32 51, i32 -1)
  %28 = sext i32 %19 to i64
  switch i64 %28, label %29 [
    i64 0, label %61
    i64 1, label %63
  ]

29:                                               ; preds = %61, %63, %27
  %30 = phi ptr [ %64, %63 ], [ %62, %61 ], [ @of_7_unicast_0_0_cons_buff_0, %27 ]
  %31 = getelementptr [64 x [64 x bfloat]], ptr %30, i32 0, i32 0, i32 0
  br label %32

32:                                               ; preds = %29
  %33 = trunc i64 %17 to i32
  store i32 %33, ptr @flash_index_0_3
  store i32 %15, ptr getelementptr inbounds nuw (i8, ptr @flash_index_0_3, i64 4)
  %34 = icmp eq i32 %33, 0
  br i1 %34, label %35, label %36

35:                                               ; preds = %32
  call void @op0_init_scale_buffer(ptr @flash_state_0_3, i32 64)
  br label %36

36:                                               ; preds = %35, %32
  call void @op0_partial_softmax(ptr %31, ptr %26, ptr @flash_state_0_3, ptr @flash_index_0_3, bfloat 0xR3FB9, i32 64, i32 64, i32 2048, i32 2048)
  call void @llvm.aie2p.acquire(i32 52, i32 -1)
  %37 = sext i32 %20 to i64
  switch i64 %37, label %38 [
    i64 0, label %65
    i64 1, label %67
  ]

38:                                               ; preds = %65, %67, %36
  %39 = phi ptr [ %68, %67 ], [ %66, %65 ], [ @flash_scale_0_3_buff_0, %36 ]
  %40 = getelementptr [256 x bfloat], ptr %39, i32 0, i32 0
  br label %41

41:                                               ; preds = %38
  call void @op0_passThroughLine(ptr @flash_state_0_3, ptr %40, i32 256)
  call void @llvm.aie2p.release(i32 53, i32 1)
  %42 = add i32 %20, 1
  %43 = icmp sge i32 %42, 2
  %44 = select i1 %43, i32 0, i32 %42
  call void @llvm.aie2p.release(i32 50, i32 1)
  %45 = add i32 %19, 1
  %46 = icmp sge i32 %45, 2
  %47 = select i1 %46, i32 0, i32 %45
  call void @llvm.aie2p.release(i32 49, i32 1)
  %48 = add i32 %18, 1
  %49 = icmp sge i32 %48, 2
  %50 = select i1 %49, i32 0, i32 %48
  %51 = add i64 %17, 1
  br label %16

52:                                               ; preds = %16
  %53 = add i64 %8, 1
  br label %7

54:                                               ; preds = %7
  %55 = add i64 %2, 1
  br label %1

56:                                               ; preds = %1
  ret void

57:                                               ; preds = %22
  %58 = phi ptr [ @of_8_unicast_0_buff_0, %22 ]
  br label %24

59:                                               ; preds = %22
  %60 = phi ptr [ @of_8_unicast_0_buff_1, %22 ]
  br label %24

61:                                               ; preds = %27
  %62 = phi ptr [ @of_7_unicast_0_0_cons_buff_0, %27 ]
  br label %29

63:                                               ; preds = %27
  %64 = phi ptr [ @of_7_unicast_0_0_cons_buff_1, %27 ]
  br label %29

65:                                               ; preds = %36
  %66 = phi ptr [ @flash_scale_0_3_buff_0, %36 ]
  br label %38

67:                                               ; preds = %36
  %68 = phi ptr [ @flash_scale_0_3_buff_1, %36 ]
  br label %38
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
