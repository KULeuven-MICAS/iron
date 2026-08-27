; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"
target triple = "aie2p"

@flash_index_7_3 = external global [2 x i32]
@flash_state_7_3 = external global [256 x bfloat]
@flash_index_6_3 = external global [2 x i32]
@flash_state_6_3 = external global [256 x bfloat]
@flash_index_5_3 = external global [2 x i32]
@flash_state_5_3 = external global [256 x bfloat]
@flash_index_4_3 = external global [2 x i32]
@flash_state_4_3 = external global [256 x bfloat]
@flash_index_3_3 = external global [2 x i32]
@flash_state_3_3 = external global [256 x bfloat]
@flash_index_2_3 = external global [2 x i32]
@flash_state_2_3 = external global [256 x bfloat]
@flash_index_1_3 = external global [2 x i32]
@flash_state_1_3 = external global [256 x bfloat]
@flash_index_0_3 = external global [2 x i32]
@flash_state_0_3 = external global [256 x bfloat]
@flash_index_7_4 = external global [2 x i32]
@flash_index_6_4 = external global [2 x i32]
@flash_index_5_4 = external global [2 x i32]
@flash_index_4_4 = external global [2 x i32]
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
@flash_scale_4_3_buff_1 = external global [256 x bfloat]
@flash_scale_4_3_buff_0 = external global [256 x bfloat]
@flash_scale_5_3_buff_1 = external global [256 x bfloat]
@flash_scale_5_3_buff_0 = external global [256 x bfloat]
@flash_scale_6_3_buff_1 = external global [256 x bfloat]
@flash_scale_6_3_buff_0 = external global [256 x bfloat]
@flash_scale_7_3_buff_1 = external global [256 x bfloat]
@flash_scale_7_3_buff_0 = external global [256 x bfloat]
@of_0_mem_0_cons_buff_1 = external global [64 x [64 x bfloat]]
@of_0_mem_0_cons_buff_0 = external global [64 x [64 x bfloat]]
@of_0_mem_1_cons_buff_1 = external global [64 x [64 x bfloat]]
@of_0_mem_1_cons_buff_0 = external global [64 x [64 x bfloat]]
@of_0_mem_2_cons_buff_1 = external global [64 x [64 x bfloat]]
@of_0_mem_2_cons_buff_0 = external global [64 x [64 x bfloat]]
@of_0_mem_3_cons_buff_1 = external global [64 x [64 x bfloat]]
@of_0_mem_3_cons_buff_0 = external global [64 x [64 x bfloat]]
@of_0_mem_4_cons_buff_1 = external global [64 x [64 x bfloat]]
@of_0_mem_4_cons_buff_0 = external global [64 x [64 x bfloat]]
@of_0_mem_5_cons_buff_1 = external global [64 x [64 x bfloat]]
@of_0_mem_5_cons_buff_0 = external global [64 x [64 x bfloat]]
@of_0_mem_6_cons_buff_1 = external global [64 x [64 x bfloat]]
@of_0_mem_6_cons_buff_0 = external global [64 x [64 x bfloat]]
@of_0_mem_7_cons_buff_1 = external global [64 x [64 x bfloat]]
@of_0_mem_7_cons_buff_0 = external global [64 x [64 x bfloat]]
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
@of_3_unicast_4_0_cons_buff_1 = external global [64 x [64 x bfloat]]
@of_3_unicast_4_0_cons_buff_0 = external global [64 x [64 x bfloat]]
@of_3_unicast_5_0_cons_buff_1 = external global [64 x [64 x bfloat]]
@of_3_unicast_5_0_cons_buff_0 = external global [64 x [64 x bfloat]]
@of_3_unicast_6_0_cons_buff_1 = external global [64 x [64 x bfloat]]
@of_3_unicast_6_0_cons_buff_0 = external global [64 x [64 x bfloat]]
@of_3_unicast_7_0_cons_buff_1 = external global [64 x [64 x bfloat]]
@of_3_unicast_7_0_cons_buff_0 = external global [64 x [64 x bfloat]]
@of_4_broadcast_0_0_7_cons_buff_1 = external global [64 x [64 x bfloat]]
@of_4_broadcast_0_0_7_cons_buff_0 = external global [64 x [64 x bfloat]]
@of_4_broadcast_0_0_6_cons_buff_1 = external global [64 x [64 x bfloat]]
@of_4_broadcast_0_0_6_cons_buff_0 = external global [64 x [64 x bfloat]]
@of_4_broadcast_0_0_5_cons_buff_1 = external global [64 x [64 x bfloat]]
@of_4_broadcast_0_0_5_cons_buff_0 = external global [64 x [64 x bfloat]]
@of_4_broadcast_0_0_4_cons_buff_1 = external global [64 x [64 x bfloat]]
@of_4_broadcast_0_0_4_cons_buff_0 = external global [64 x [64 x bfloat]]
@of_4_broadcast_0_0_3_cons_buff_1 = external global [64 x [64 x bfloat]]
@of_4_broadcast_0_0_3_cons_buff_0 = external global [64 x [64 x bfloat]]
@of_4_broadcast_0_0_2_cons_buff_1 = external global [64 x [64 x bfloat]]
@of_4_broadcast_0_0_2_cons_buff_0 = external global [64 x [64 x bfloat]]
@of_4_broadcast_0_0_1_cons_buff_1 = external global [64 x [64 x bfloat]]
@of_4_broadcast_0_0_1_cons_buff_0 = external global [64 x [64 x bfloat]]
@of_4_broadcast_0_0_0_cons_buff_1 = external global [64 x [64 x bfloat]]
@of_4_broadcast_0_0_0_cons_buff_0 = external global [64 x [64 x bfloat]]
@of_5_broadcast_0_0_7_cons_buff_1 = external global [64 x [64 x bfloat]]
@of_5_broadcast_0_0_7_cons_buff_0 = external global [64 x [64 x bfloat]]
@of_5_broadcast_0_0_6_cons_buff_1 = external global [64 x [64 x bfloat]]
@of_5_broadcast_0_0_6_cons_buff_0 = external global [64 x [64 x bfloat]]
@of_5_broadcast_0_0_5_cons_buff_1 = external global [64 x [64 x bfloat]]
@of_5_broadcast_0_0_5_cons_buff_0 = external global [64 x [64 x bfloat]]
@of_5_broadcast_0_0_4_cons_buff_1 = external global [64 x [64 x bfloat]]
@of_5_broadcast_0_0_4_cons_buff_0 = external global [64 x [64 x bfloat]]
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
@of_6_unicast_1_buff_1 = external global [64 x [64 x bfloat]]
@of_6_unicast_1_buff_0 = external global [64 x [64 x bfloat]]
@of_6_unicast_2_buff_1 = external global [64 x [64 x bfloat]]
@of_6_unicast_2_buff_0 = external global [64 x [64 x bfloat]]
@of_6_unicast_3_buff_1 = external global [64 x [64 x bfloat]]
@of_6_unicast_3_buff_0 = external global [64 x [64 x bfloat]]
@of_6_unicast_4_buff_1 = external global [64 x [64 x bfloat]]
@of_6_unicast_4_buff_0 = external global [64 x [64 x bfloat]]
@of_6_unicast_5_buff_1 = external global [64 x [64 x bfloat]]
@of_6_unicast_5_buff_0 = external global [64 x [64 x bfloat]]
@of_6_unicast_6_buff_1 = external global [64 x [64 x bfloat]]
@of_6_unicast_6_buff_0 = external global [64 x [64 x bfloat]]
@of_6_unicast_7_buff_1 = external global [64 x [64 x bfloat]]
@of_6_unicast_7_buff_0 = external global [64 x [64 x bfloat]]
@of_7_unicast_0_buff_1 = external global [64 x [64 x bfloat]]
@of_7_unicast_0_buff_0 = external global [64 x [64 x bfloat]]
@of_7_unicast_1_buff_1 = external global [64 x [64 x bfloat]]
@of_7_unicast_1_buff_0 = external global [64 x [64 x bfloat]]
@of_7_unicast_2_buff_1 = external global [64 x [64 x bfloat]]
@of_7_unicast_2_buff_0 = external global [64 x [64 x bfloat]]
@of_7_unicast_3_buff_1 = external global [64 x [64 x bfloat]]
@of_7_unicast_3_buff_0 = external global [64 x [64 x bfloat]]
@of_7_unicast_4_buff_1 = external global [64 x [64 x bfloat]]
@of_7_unicast_4_buff_0 = external global [64 x [64 x bfloat]]
@of_7_unicast_5_buff_1 = external global [64 x [64 x bfloat]]
@of_7_unicast_5_buff_0 = external global [64 x [64 x bfloat]]
@of_7_unicast_6_buff_1 = external global [64 x [64 x bfloat]]
@of_7_unicast_6_buff_0 = external global [64 x [64 x bfloat]]
@of_7_unicast_7_buff_1 = external global [64 x [64 x bfloat]]
@of_7_unicast_7_buff_0 = external global [64 x [64 x bfloat]]
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
@of_8_unicast_4_buff_1 = external global [64 x [64 x bfloat]]
@of_8_unicast_4_buff_0 = external global [64 x [64 x bfloat]]
@of_8_unicast_4_cons_buff_1 = external global [64 x [64 x bfloat]]
@of_8_unicast_4_cons_buff_0 = external global [64 x [64 x bfloat]]
@of_8_unicast_5_buff_1 = external global [64 x [64 x bfloat]]
@of_8_unicast_5_buff_0 = external global [64 x [64 x bfloat]]
@of_8_unicast_5_cons_buff_1 = external global [64 x [64 x bfloat]]
@of_8_unicast_5_cons_buff_0 = external global [64 x [64 x bfloat]]
@of_8_unicast_6_buff_1 = external global [64 x [64 x bfloat]]
@of_8_unicast_6_buff_0 = external global [64 x [64 x bfloat]]
@of_8_unicast_6_cons_buff_1 = external global [64 x [64 x bfloat]]
@of_8_unicast_6_cons_buff_0 = external global [64 x [64 x bfloat]]
@of_8_unicast_7_buff_1 = external global [64 x [64 x bfloat]]
@of_8_unicast_7_buff_0 = external global [64 x [64 x bfloat]]
@of_8_unicast_7_cons_buff_1 = external global [64 x [64 x bfloat]]
@of_8_unicast_7_cons_buff_0 = external global [64 x [64 x bfloat]]

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

declare void @op0_partial_softmax_mode(ptr, ptr, ptr, ptr, bfloat, i32, i32, i32, i32, i32)

define void @core_2_2() {
  br label %1

1:                                                ; preds = %54, %0
  %2 = phi i64 [ %55, %54 ], [ 0, %0 ]
  %3 = phi i32 [ %9, %54 ], [ 0, %0 ]
  %4 = phi i32 [ %10, %54 ], [ 0, %0 ]
  %5 = phi i32 [ %11, %54 ], [ 0, %0 ]
  %6 = icmp slt i64 %2, 4294967295
  br i1 %6, label %7, label %56

7:                                                ; preds = %49, %1
  %8 = phi i64 [ %53, %49 ], [ 0, %1 ]
  %9 = phi i32 [ %52, %49 ], [ %3, %1 ]
  %10 = phi i32 [ %24, %49 ], [ %4, %1 ]
  %11 = phi i32 [ %25, %49 ], [ %5, %1 ]
  %12 = icmp slt i64 %8, 4
  br i1 %12, label %13, label %54

13:                                               ; preds = %7
  call void @llvm.aie2p.acquire(i32 53, i32 -1)
  %14 = sext i32 %9 to i64
  switch i64 %14, label %15 [
    i64 0, label %57
    i64 1, label %59
  ]

15:                                               ; preds = %57, %59, %13
  %16 = phi ptr [ %60, %59 ], [ %58, %57 ], [ @of_3_unicast_2_0_cons_buff_0, %13 ]
  %17 = getelementptr [64 x [64 x bfloat]], ptr %16, i32 0, i32 0, i32 0
  br label %18

18:                                               ; preds = %15
  %19 = trunc i64 %8 to i32
  %20 = mul i32 %19, 8
  %21 = add i32 %20, 2
  br label %22

22:                                               ; preds = %41, %18
  %23 = phi i64 [ %48, %41 ], [ 0, %18 ]
  %24 = phi i32 [ %47, %41 ], [ %10, %18 ]
  %25 = phi i32 [ %44, %41 ], [ %11, %18 ]
  %26 = icmp slt i64 %23, 32
  br i1 %26, label %27, label %49

27:                                               ; preds = %22
  call void @llvm.aie2p.acquire(i32 48, i32 -1)
  %28 = sext i32 %24 to i64
  switch i64 %28, label %29 [
    i64 0, label %61
    i64 1, label %63
  ]

29:                                               ; preds = %61, %63, %27
  %30 = phi ptr [ %64, %63 ], [ %62, %61 ], [ @of_6_unicast_2_buff_0, %27 ]
  %31 = getelementptr [64 x [64 x bfloat]], ptr %30, i32 0, i32 0, i32 0
  br label %32

32:                                               ; preds = %29
  call void @op0_zero_bf16_64_64_64(ptr %31)
  call void @llvm.aie2p.acquire(i32 51, i32 -1)
  %33 = sext i32 %25 to i64
  switch i64 %33, label %34 [
    i64 0, label %65
    i64 1, label %67
  ]

34:                                               ; preds = %65, %67, %32
  %35 = phi ptr [ %68, %67 ], [ %66, %65 ], [ @of_4_broadcast_0_0_2_cons_buff_0, %32 ]
  %36 = getelementptr [64 x [64 x bfloat]], ptr %35, i32 0, i32 0, i32 0
  br label %37

37:                                               ; preds = %34
  %38 = trunc i64 %23 to i32
  %39 = icmp sle i32 %38, %21
  br i1 %39, label %40, label %41

40:                                               ; preds = %37
  call void @op0_matmul_bf16_bf16_64_64_64(ptr %17, ptr %36, ptr %31)
  br label %41

41:                                               ; preds = %40, %37
  call void @llvm.aie2p.release(i32 50, i32 1)
  %42 = add i32 %25, 1
  %43 = icmp sge i32 %42, 2
  %44 = select i1 %43, i32 0, i32 %42
  call void @llvm.aie2p.release(i32 49, i32 1)
  %45 = add i32 %24, 1
  %46 = icmp sge i32 %45, 2
  %47 = select i1 %46, i32 0, i32 %45
  %48 = add i64 %23, 1
  br label %22

49:                                               ; preds = %22
  call void @llvm.aie2p.release(i32 52, i32 1)
  %50 = add i32 %9, 1
  %51 = icmp sge i32 %50, 2
  %52 = select i1 %51, i32 0, i32 %50
  %53 = add i64 %8, 1
  br label %7

54:                                               ; preds = %7
  %55 = add i64 %2, 1
  br label %1

56:                                               ; preds = %1
  ret void

57:                                               ; preds = %13
  %58 = phi ptr [ @of_3_unicast_2_0_cons_buff_0, %13 ]
  br label %15

59:                                               ; preds = %13
  %60 = phi ptr [ @of_3_unicast_2_0_cons_buff_1, %13 ]
  br label %15

61:                                               ; preds = %27
  %62 = phi ptr [ @of_6_unicast_2_buff_0, %27 ]
  br label %29

63:                                               ; preds = %27
  %64 = phi ptr [ @of_6_unicast_2_buff_1, %27 ]
  br label %29

65:                                               ; preds = %32
  %66 = phi ptr [ @of_4_broadcast_0_0_2_cons_buff_0, %32 ]
  br label %34

67:                                               ; preds = %32
  %68 = phi ptr [ @of_4_broadcast_0_0_2_cons_buff_1, %32 ]
  br label %34
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
