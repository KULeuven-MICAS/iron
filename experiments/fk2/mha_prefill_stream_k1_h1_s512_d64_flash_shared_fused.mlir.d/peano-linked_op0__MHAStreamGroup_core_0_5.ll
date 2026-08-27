; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"
target triple = "aie2p"

@flash_index_1_4 = external global [2 x i32]
@flash_state_1_4 = external global [256 x bfloat]
@flash_index_0_4 = external global [2 x i32]
@flash_state_0_4 = external global [256 x bfloat]
@flash_index_1_2 = external global [2 x i32]
@flash_state_1_2 = external global [256 x bfloat]
@flash_index_0_2 = external global [2 x i32]
@flash_state_0_2 = external global [256 x bfloat]
@flash_index_1_3 = external global [2 x i32]
@flash_index_0_3 = external global [2 x i32]
@flash_scale_0_2_buff_1 = external global [256 x bfloat]
@flash_scale_0_2_buff_0 = external global [256 x bfloat]
@flash_scale_1_2_buff_1 = external global [256 x bfloat]
@flash_scale_1_2_buff_0 = external global [256 x bfloat]
@flash_scale_0_4_buff_1 = external global [256 x bfloat]
@flash_scale_0_4_buff_0 = external global [256 x bfloat]
@flash_scale_1_4_buff_1 = external global [256 x bfloat]
@flash_scale_1_4_buff_0 = external global [256 x bfloat]
@of_0_mem_0_cons_buff_1 = external global [2 x [64 x [64 x bfloat]]]
@of_0_mem_0_cons_buff_0 = external global [2 x [64 x [64 x bfloat]]]
@of_0_mem_1_cons_buff_1 = external global [2 x [64 x [64 x bfloat]]]
@of_0_mem_1_cons_buff_0 = external global [2 x [64 x [64 x bfloat]]]
@of_10_mem_0_buff_1 = external global [2 x [64 x [64 x bfloat]]]
@of_10_mem_0_buff_0 = external global [2 x [64 x [64 x bfloat]]]
@of_10_mem_1_buff_1 = external global [2 x [64 x [64 x bfloat]]]
@of_10_mem_1_buff_0 = external global [2 x [64 x [64 x bfloat]]]
@of_1_mem_cons_buff_1 = external global [64 x [64 x bfloat]]
@of_1_mem_cons_buff_0 = external global [64 x [64 x bfloat]]
@of_3_unicast_0_0_cons_buff_1 = external global [64 x [64 x bfloat]]
@of_3_unicast_0_0_cons_buff_0 = external global [64 x [64 x bfloat]]
@of_2_mem_cons_buff_1 = external global [64 x [64 x bfloat]]
@of_2_mem_cons_buff_0 = external global [64 x [64 x bfloat]]
@of_3_unicast_1_0_cons_buff_1 = external global [64 x [64 x bfloat]]
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
@of_6_unicast_1_buff_1 = external global [64 x [64 x bfloat]]
@of_6_unicast_1_buff_0 = external global [64 x [64 x bfloat]]
@of_6_unicast_0_cons_buff_1 = external global [64 x [64 x bfloat]]
@of_6_unicast_0_cons_buff_0 = external global [64 x [64 x bfloat]]
@of_7_distribute_0_0_cons_buff_1 = external global [64 x [64 x bfloat]]
@of_7_distribute_0_0_cons_buff_0 = external global [64 x [64 x bfloat]]
@of_6_unicast_1_cons_buff_1 = external global [64 x [64 x bfloat]]
@of_6_unicast_1_cons_buff_0 = external global [64 x [64 x bfloat]]
@of_7_distribute_0_1_cons_buff_1 = external global [64 x [64 x bfloat]]
@of_7_distribute_0_1_cons_buff_0 = external global [64 x [64 x bfloat]]
@of_7_distribute_1_0_cons_buff_1 = external global [64 x [64 x bfloat]]
@of_7_distribute_1_0_cons_buff_0 = external global [64 x [64 x bfloat]]
@of_7_distribute_1_1_cons_buff_1 = external global [64 x [64 x bfloat]]
@of_7_distribute_1_1_cons_buff_0 = external global [64 x [64 x bfloat]]
@of_8_switch_join_0_0_buff_1 = external global [64 x [64 x bfloat]]
@of_8_switch_join_0_0_buff_0 = external global [64 x [64 x bfloat]]
@of_8_switch_join_0_1_buff_1 = external global [64 x [64 x bfloat]]
@of_8_switch_join_0_1_buff_0 = external global [64 x [64 x bfloat]]
@of_8_switch_join_1_0_buff_1 = external global [64 x [64 x bfloat]]
@of_8_switch_join_1_0_buff_0 = external global [64 x [64 x bfloat]]
@of_8_switch_join_1_1_buff_1 = external global [64 x [64 x bfloat]]
@of_8_switch_join_1_1_buff_0 = external global [64 x [64 x bfloat]]
@of_9_unicast_0_buff_1 = external global [64 x [64 x bfloat]]
@of_9_unicast_0_buff_0 = external global [64 x [64 x bfloat]]
@of_9_unicast_1_buff_1 = external global [64 x [64 x bfloat]]
@of_9_unicast_1_buff_0 = external global [64 x [64 x bfloat]]

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

declare void @op0_partial_softmax_tiled(ptr, ptr, ptr, ptr, bfloat, i32, i32, i32, i32)

define void @core_0_5() {
  br label %1

1:                                                ; preds = %55, %0
  %2 = phi i64 [ %56, %55 ], [ 0, %0 ]
  %3 = phi i32 [ %8, %55 ], [ 0, %0 ]
  %4 = phi i32 [ %9, %55 ], [ 0, %0 ]
  %5 = icmp slt i64 %2, 4294967295
  br i1 %5, label %6, label %57

6:                                                ; preds = %53, %1
  %7 = phi i64 [ %54, %53 ], [ 0, %1 ]
  %8 = phi i32 [ %14, %53 ], [ %3, %1 ]
  %9 = phi i32 [ %15, %53 ], [ %4, %1 ]
  %10 = icmp slt i64 %7, 2
  br i1 %10, label %11, label %55

11:                                               ; preds = %6
  call void @llvm.aie2p.acquire(i32 53, i32 -2)
  br label %12

12:                                               ; preds = %48, %11
  %13 = phi i64 [ %52, %48 ], [ 0, %11 ]
  %14 = phi i32 [ %51, %48 ], [ %8, %11 ]
  %15 = phi i32 [ %26, %48 ], [ %9, %11 ]
  %16 = icmp slt i64 %13, 8
  br i1 %16, label %17, label %53

17:                                               ; preds = %12
  call void @llvm.aie2p.acquire(i32 51, i32 -1)
  %18 = sext i32 %14 to i64
  switch i64 %18, label %19 [
    i64 0, label %58
    i64 1, label %60
  ]

19:                                               ; preds = %58, %60, %17
  %20 = phi ptr [ %61, %60 ], [ %59, %58 ], [ @of_4_broadcast_0_0_0_cons_buff_0, %17 ]
  %21 = getelementptr [64 x [64 x bfloat]], ptr %20, i32 0, i32 0, i32 0
  br label %22

22:                                               ; preds = %19
  %23 = trunc i64 %13 to i32
  br label %24

24:                                               ; preds = %43, %22
  %25 = phi i64 [ %47, %43 ], [ 0, %22 ]
  %26 = phi i32 [ %46, %43 ], [ %15, %22 ]
  %27 = icmp slt i64 %25, 2
  br i1 %27, label %28, label %48

28:                                               ; preds = %24
  call void @llvm.aie2p.acquire(i32 48, i32 -1)
  %29 = sext i32 %26 to i64
  switch i64 %29, label %30 [
    i64 0, label %62
    i64 1, label %64
  ]

30:                                               ; preds = %62, %64, %28
  %31 = phi ptr [ %65, %64 ], [ %63, %62 ], [ @of_6_unicast_0_buff_0, %28 ]
  %32 = getelementptr [64 x [64 x bfloat]], ptr %31, i32 0, i32 0, i32 0
  br label %33

33:                                               ; preds = %30
  call void @op0_zero_bf16_64_64_64(ptr %32)
  switch i64 %25, label %34 [
    i64 0, label %66
    i64 1, label %68
  ]

34:                                               ; preds = %66, %68, %33
  %35 = phi ptr [ %69, %68 ], [ %67, %66 ], [ @of_3_unicast_0_0_cons_buff_0, %33 ]
  %36 = getelementptr [64 x [64 x bfloat]], ptr %35, i32 0, i32 0, i32 0
  br label %37

37:                                               ; preds = %34
  %38 = trunc i64 %25 to i32
  %39 = mul i32 %38, 4
  %40 = add i32 %38, %39
  %41 = icmp sle i32 %23, %40
  br i1 %41, label %42, label %43

42:                                               ; preds = %37
  call void @op0_matmul_bf16_bf16_64_64_64(ptr %36, ptr %21, ptr %32)
  br label %43

43:                                               ; preds = %42, %37
  call void @llvm.aie2p.release(i32 49, i32 1)
  %44 = add i32 %26, 1
  %45 = icmp sge i32 %44, 2
  %46 = select i1 %45, i32 0, i32 %44
  %47 = add i64 %25, 1
  br label %24

48:                                               ; preds = %24
  call void @llvm.aie2p.release(i32 50, i32 1)
  %49 = add i32 %14, 1
  %50 = icmp sge i32 %49, 2
  %51 = select i1 %50, i32 0, i32 %49
  %52 = add i64 %13, 1
  br label %12

53:                                               ; preds = %12
  call void @llvm.aie2p.release(i32 52, i32 2)
  %54 = add i64 %7, 1
  br label %6

55:                                               ; preds = %6
  %56 = add i64 %2, 1
  br label %1

57:                                               ; preds = %1
  ret void

58:                                               ; preds = %17
  %59 = phi ptr [ @of_4_broadcast_0_0_0_cons_buff_0, %17 ]
  br label %19

60:                                               ; preds = %17
  %61 = phi ptr [ @of_4_broadcast_0_0_0_cons_buff_1, %17 ]
  br label %19

62:                                               ; preds = %28
  %63 = phi ptr [ @of_6_unicast_0_buff_0, %28 ]
  br label %30

64:                                               ; preds = %28
  %65 = phi ptr [ @of_6_unicast_0_buff_1, %28 ]
  br label %30

66:                                               ; preds = %33
  %67 = phi ptr [ @of_3_unicast_0_0_cons_buff_0, %33 ]
  br label %34

68:                                               ; preds = %33
  %69 = phi ptr [ @of_3_unicast_0_0_cons_buff_1, %33 ]
  br label %34
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
