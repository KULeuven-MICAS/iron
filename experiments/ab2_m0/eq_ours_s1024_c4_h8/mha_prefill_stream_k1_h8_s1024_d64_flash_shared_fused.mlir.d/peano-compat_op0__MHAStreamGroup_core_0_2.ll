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

define void @core_0_2() {
  br label %1

1:                                                ; preds = %53, %0
  %2 = phi i64 [ %54, %53 ], [ 0, %0 ]
  %3 = phi i32 [ %9, %53 ], [ 0, %0 ]
  %4 = phi i32 [ %10, %53 ], [ 0, %0 ]
  %5 = phi i32 [ %11, %53 ], [ 0, %0 ]
  %6 = icmp slt i64 %2, 4294967295
  br i1 %6, label %7, label %55

7:                                                ; preds = %48, %1
  %8 = phi i64 [ %52, %48 ], [ 0, %1 ]
  %9 = phi i32 [ %51, %48 ], [ %3, %1 ]
  %10 = phi i32 [ %23, %48 ], [ %4, %1 ]
  %11 = phi i32 [ %24, %48 ], [ %5, %1 ]
  %12 = icmp slt i64 %8, 4
  br i1 %12, label %13, label %53

13:                                               ; preds = %7
  call void @llvm.aie2p.acquire(i32 53, i32 -1)
  %14 = sext i32 %9 to i64
  switch i64 %14, label %15 [
    i64 0, label %56
    i64 1, label %58
  ]

15:                                               ; preds = %56, %58, %13
  %16 = phi ptr [ %59, %58 ], [ %57, %56 ], [ @of_3_unicast_0_0_cons_buff_0, %13 ]
  %17 = getelementptr [64 x [64 x bfloat]], ptr %16, i32 0, i32 0, i32 0
  br label %18

18:                                               ; preds = %15
  %19 = trunc i64 %8 to i32
  %20 = mul i32 %19, 4
  br label %21

21:                                               ; preds = %40, %18
  %22 = phi i64 [ %47, %40 ], [ 0, %18 ]
  %23 = phi i32 [ %46, %40 ], [ %10, %18 ]
  %24 = phi i32 [ %43, %40 ], [ %11, %18 ]
  %25 = icmp slt i64 %22, 16
  br i1 %25, label %26, label %48

26:                                               ; preds = %21
  call void @llvm.aie2p.acquire(i32 48, i32 -1)
  %27 = sext i32 %23 to i64
  switch i64 %27, label %28 [
    i64 0, label %60
    i64 1, label %62
  ]

28:                                               ; preds = %60, %62, %26
  %29 = phi ptr [ %63, %62 ], [ %61, %60 ], [ @of_6_unicast_0_buff_0, %26 ]
  %30 = getelementptr [64 x [64 x bfloat]], ptr %29, i32 0, i32 0, i32 0
  br label %31

31:                                               ; preds = %28
  call void @op0_zero_bf16_64_64_64(ptr %30)
  call void @llvm.aie2p.acquire(i32 51, i32 -1)
  %32 = sext i32 %24 to i64
  switch i64 %32, label %33 [
    i64 0, label %64
    i64 1, label %66
  ]

33:                                               ; preds = %64, %66, %31
  %34 = phi ptr [ %67, %66 ], [ %65, %64 ], [ @of_4_broadcast_0_0_0_cons_buff_0, %31 ]
  %35 = getelementptr [64 x [64 x bfloat]], ptr %34, i32 0, i32 0, i32 0
  br label %36

36:                                               ; preds = %33
  %37 = trunc i64 %22 to i32
  %38 = icmp sle i32 %37, %20
  br i1 %38, label %39, label %40

39:                                               ; preds = %36
  call void @op0_matmul_bf16_bf16_64_64_64(ptr %17, ptr %35, ptr %30)
  br label %40

40:                                               ; preds = %39, %36
  call void @llvm.aie2p.release(i32 50, i32 1)
  %41 = add i32 %24, 1
  %42 = icmp sge i32 %41, 2
  %43 = select i1 %42, i32 0, i32 %41
  call void @llvm.aie2p.release(i32 49, i32 1)
  %44 = add i32 %23, 1
  %45 = icmp sge i32 %44, 2
  %46 = select i1 %45, i32 0, i32 %44
  %47 = add i64 %22, 1
  br label %21

48:                                               ; preds = %21
  call void @llvm.aie2p.release(i32 52, i32 1)
  %49 = add i32 %9, 1
  %50 = icmp sge i32 %49, 2
  %51 = select i1 %50, i32 0, i32 %49
  %52 = add i64 %8, 1
  br label %7

53:                                               ; preds = %7
  %54 = add i64 %2, 1
  br label %1

55:                                               ; preds = %1
  ret void

56:                                               ; preds = %13
  %57 = phi ptr [ @of_3_unicast_0_0_cons_buff_0, %13 ]
  br label %15

58:                                               ; preds = %13
  %59 = phi ptr [ @of_3_unicast_0_0_cons_buff_1, %13 ]
  br label %15

60:                                               ; preds = %26
  %61 = phi ptr [ @of_6_unicast_0_buff_0, %26 ]
  br label %28

62:                                               ; preds = %26
  %63 = phi ptr [ @of_6_unicast_0_buff_1, %26 ]
  br label %28

64:                                               ; preds = %31
  %65 = phi ptr [ @of_4_broadcast_0_0_0_cons_buff_0, %31 ]
  br label %33

66:                                               ; preds = %31
  %67 = phi ptr [ @of_4_broadcast_0_0_0_cons_buff_1, %31 ]
  br label %33
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
