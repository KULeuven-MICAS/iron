; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"
target triple = "aie2p"

@flash_index_1_5 = external global [2 x i32]
@flash_state_1_5 = external global [256 x bfloat]
@flash_index_0_5 = external global [2 x i32]
@flash_state_0_5 = external global [256 x bfloat]
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
@flash_scale_0_5_0_4_buff_1 = external global [256 x bfloat]
@flash_scale_0_5_0_4_buff_0 = external global [256 x bfloat]
@flash_scale_1_5_1_4_buff_1 = external global [256 x bfloat]
@flash_scale_1_5_1_4_buff_0 = external global [256 x bfloat]
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
@of_6_unicast_0_buff_0 = external global [64 x [64 x bfloat]]
@of_6_unicast_0_relay_1_buff_0 = external global [64 x [64 x bfloat]]
@of_6_unicast_1_buff_0 = external global [64 x [64 x bfloat]]
@of_6_unicast_0_cons_buff_1 = external global [64 x [64 x bfloat]]
@of_6_unicast_0_cons_buff_0 = external global [64 x [64 x bfloat]]
@of_6_unicast_1_relay_1_buff_0 = external global [64 x [64 x bfloat]]
@of_6_unicast_0_relay_1_cons_buff_1 = external global [64 x [64 x bfloat]]
@of_6_unicast_0_relay_1_cons_buff_0 = external global [64 x [64 x bfloat]]
@of_6_unicast_1_cons_buff_1 = external global [64 x [64 x bfloat]]
@of_6_unicast_1_cons_buff_0 = external global [64 x [64 x bfloat]]
@of_7_distribute_0_0_cons_buff_1 = external global [64 x [64 x bfloat]]
@of_7_distribute_0_0_cons_buff_0 = external global [64 x [64 x bfloat]]
@of_6_unicast_1_relay_1_cons_buff_1 = external global [64 x [64 x bfloat]]
@of_6_unicast_1_relay_1_cons_buff_0 = external global [64 x [64 x bfloat]]
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

declare void @op0_partial_softmax_mode(ptr, ptr, ptr, ptr, bfloat, i32, i32, i32, i32, i32)

define void @core_1_2() {
  br label %1

1:                                                ; preds = %41, %0
  %2 = phi i64 [ %42, %41 ], [ 0, %0 ]
  %3 = phi i32 [ %8, %41 ], [ 0, %0 ]
  %4 = icmp slt i64 %2, 4294967295
  br i1 %4, label %5, label %43

5:                                                ; preds = %1
  call void @llvm.aie2p.acquire(i32 55, i32 -2)
  br label %6

6:                                                ; preds = %36, %5
  %7 = phi i64 [ %40, %36 ], [ 0, %5 ]
  %8 = phi i32 [ %39, %36 ], [ %3, %5 ]
  %9 = icmp slt i64 %7, 4
  br i1 %9, label %10, label %41

10:                                               ; preds = %6
  call void @llvm.aie2p.acquire(i32 53, i32 -1)
  %11 = sext i32 %8 to i64
  switch i64 %11, label %12 [
    i64 0, label %44
    i64 1, label %46
  ]

12:                                               ; preds = %44, %46, %10
  %13 = phi ptr [ %47, %46 ], [ %45, %44 ], [ @of_4_broadcast_0_0_1_cons_buff_0, %10 ]
  %14 = getelementptr [64 x [64 x bfloat]], ptr %13, i32 0, i32 0, i32 0
  br label %15

15:                                               ; preds = %12
  call void @llvm.aie2p.acquire(i32 50, i32 -1)
  call void @llvm.aie2p.acquire(i32 48, i32 -1)
  call void @op0_zero_bf16_64_64_64(ptr @of_6_unicast_1_buff_0)
  call void @op0_zero_bf16_64_64_64(ptr @of_6_unicast_1_relay_1_buff_0)
  %16 = trunc i64 %7 to i32
  br label %17

17:                                               ; preds = %34, %15
  %18 = phi i64 [ %35, %34 ], [ 0, %15 ]
  %19 = icmp slt i64 %18, 2
  br i1 %19, label %20, label %36

20:                                               ; preds = %17
  switch i64 %18, label %21 [
    i64 0, label %48
    i64 1, label %50
  ]

21:                                               ; preds = %48, %50, %20
  %22 = phi { ptr, ptr, i64, [2 x i64], [2 x i64] } [ %51, %50 ], [ %49, %48 ], [ { ptr inttoptr (i64 3735928559 to ptr), ptr @of_6_unicast_1_buff_0, i64 0, [2 x i64] [i64 64, i64 64], [2 x i64] [i64 64, i64 1] }, %20 ]
  br label %23

23:                                               ; preds = %21
  switch i64 %18, label %24 [
    i64 0, label %52
    i64 1, label %54
  ]

24:                                               ; preds = %52, %54, %23
  %25 = phi ptr [ %55, %54 ], [ %53, %52 ], [ @of_3_unicast_1_0_cons_buff_0, %23 ]
  %26 = getelementptr [64 x [64 x bfloat]], ptr %25, i32 0, i32 0, i32 0
  br label %27

27:                                               ; preds = %24
  %28 = trunc i64 %18 to i32
  %29 = mul i32 %28, 2
  %30 = add i32 %29, 1
  %31 = icmp sle i32 %16, %30
  br i1 %31, label %32, label %34

32:                                               ; preds = %27
  %33 = extractvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %22, 1
  call void @op0_matmul_bf16_bf16_64_64_64(ptr %26, ptr %14, ptr %33)
  br label %34

34:                                               ; preds = %32, %27
  %35 = add i64 %18, 1
  br label %17

36:                                               ; preds = %17
  call void @llvm.aie2p.release(i32 51, i32 1)
  call void @llvm.aie2p.release(i32 49, i32 1)
  call void @llvm.aie2p.release(i32 52, i32 1)
  %37 = add i32 %8, 1
  %38 = icmp sge i32 %37, 2
  %39 = select i1 %38, i32 0, i32 %37
  %40 = add i64 %7, 1
  br label %6

41:                                               ; preds = %6
  call void @llvm.aie2p.release(i32 54, i32 2)
  %42 = add i64 %2, 1
  br label %1

43:                                               ; preds = %1
  ret void

44:                                               ; preds = %10
  %45 = phi ptr [ @of_4_broadcast_0_0_1_cons_buff_0, %10 ]
  br label %12

46:                                               ; preds = %10
  %47 = phi ptr [ @of_4_broadcast_0_0_1_cons_buff_1, %10 ]
  br label %12

48:                                               ; preds = %20
  %49 = phi { ptr, ptr, i64, [2 x i64], [2 x i64] } [ { ptr inttoptr (i64 3735928559 to ptr), ptr @of_6_unicast_1_buff_0, i64 0, [2 x i64] [i64 64, i64 64], [2 x i64] [i64 64, i64 1] }, %20 ]
  br label %21

50:                                               ; preds = %20
  %51 = phi { ptr, ptr, i64, [2 x i64], [2 x i64] } [ { ptr inttoptr (i64 3735928559 to ptr), ptr @of_6_unicast_1_relay_1_buff_0, i64 0, [2 x i64] [i64 64, i64 64], [2 x i64] [i64 64, i64 1] }, %20 ]
  br label %21

52:                                               ; preds = %23
  %53 = phi ptr [ @of_3_unicast_1_0_cons_buff_0, %23 ]
  br label %24

54:                                               ; preds = %23
  %55 = phi ptr [ @of_3_unicast_1_0_cons_buff_1, %23 ]
  br label %24
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
