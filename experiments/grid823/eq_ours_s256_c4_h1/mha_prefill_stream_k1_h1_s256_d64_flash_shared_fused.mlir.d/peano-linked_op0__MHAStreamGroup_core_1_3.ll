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

define void @core_1_3() {
  br label %1

1:                                                ; preds = %43, %0
  %2 = phi i64 [ %44, %43 ], [ 0, %0 ]
  %3 = phi i32 [ %9, %43 ], [ 0, %0 ]
  %4 = phi i32 [ %10, %43 ], [ 0, %0 ]
  %5 = phi i32 [ %11, %43 ], [ 0, %0 ]
  %6 = icmp slt i64 %2, 4294967295
  br i1 %6, label %7, label %45

7:                                                ; preds = %32, %1
  %8 = phi i64 [ %42, %32 ], [ 0, %1 ]
  %9 = phi i32 [ %41, %32 ], [ %3, %1 ]
  %10 = phi i32 [ %38, %32 ], [ %4, %1 ]
  %11 = phi i32 [ %35, %32 ], [ %5, %1 ]
  %12 = icmp slt i64 %8, 4
  br i1 %12, label %13, label %43

13:                                               ; preds = %7
  call void @llvm.aie2p.acquire(i32 48, i32 -1)
  %14 = sext i32 %9 to i64
  switch i64 %14, label %15 [
    i64 0, label %46
    i64 1, label %48
  ]

15:                                               ; preds = %46, %48, %13
  %16 = phi ptr [ %49, %48 ], [ %47, %46 ], [ @of_8_unicast_1_buff_0, %13 ]
  %17 = getelementptr [64 x [64 x bfloat]], ptr %16, i32 0, i32 0, i32 0
  br label %18

18:                                               ; preds = %15
  call void @llvm.aie2p.acquire(i32 51, i32 -1)
  %19 = sext i32 %10 to i64
  switch i64 %19, label %20 [
    i64 0, label %50
    i64 1, label %52
  ]

20:                                               ; preds = %50, %52, %18
  %21 = phi ptr [ %53, %52 ], [ %51, %50 ], [ @of_7_unicast_1_0_cons_buff_0, %18 ]
  %22 = getelementptr [64 x [64 x bfloat]], ptr %21, i32 0, i32 0, i32 0
  br label %23

23:                                               ; preds = %20
  %24 = trunc i64 %8 to i32
  store i32 %24, ptr @flash_index_1_3
  store i32 1, ptr getelementptr inbounds nuw (i8, ptr @flash_index_1_3, i64 4)
  %25 = icmp eq i32 %24, 0
  br i1 %25, label %26, label %27

26:                                               ; preds = %23
  call void @op0_init_scale_buffer(ptr @flash_state_1_3, i32 64)
  br label %27

27:                                               ; preds = %26, %23
  call void @op0_partial_softmax(ptr %22, ptr %17, ptr @flash_state_1_3, ptr @flash_index_1_3, bfloat 0xR3FB9, i32 64, i32 64, i32 256, i32 256)
  call void @llvm.aie2p.acquire(i32 52, i32 -1)
  %28 = sext i32 %11 to i64
  switch i64 %28, label %29 [
    i64 0, label %54
    i64 1, label %56
  ]

29:                                               ; preds = %54, %56, %27
  %30 = phi ptr [ %57, %56 ], [ %55, %54 ], [ @flash_scale_1_3_buff_0, %27 ]
  %31 = getelementptr [256 x bfloat], ptr %30, i32 0, i32 0
  br label %32

32:                                               ; preds = %29
  call void @op0_passThroughLine(ptr @flash_state_1_3, ptr %31, i32 256)
  call void @llvm.aie2p.release(i32 53, i32 1)
  %33 = add i32 %11, 1
  %34 = icmp sge i32 %33, 2
  %35 = select i1 %34, i32 0, i32 %33
  call void @llvm.aie2p.release(i32 50, i32 1)
  %36 = add i32 %10, 1
  %37 = icmp sge i32 %36, 2
  %38 = select i1 %37, i32 0, i32 %36
  call void @llvm.aie2p.release(i32 49, i32 1)
  %39 = add i32 %9, 1
  %40 = icmp sge i32 %39, 2
  %41 = select i1 %40, i32 0, i32 %39
  %42 = add i64 %8, 1
  br label %7

43:                                               ; preds = %7
  %44 = add i64 %2, 1
  br label %1

45:                                               ; preds = %1
  ret void

46:                                               ; preds = %13
  %47 = phi ptr [ @of_8_unicast_1_buff_0, %13 ]
  br label %15

48:                                               ; preds = %13
  %49 = phi ptr [ @of_8_unicast_1_buff_1, %13 ]
  br label %15

50:                                               ; preds = %18
  %51 = phi ptr [ @of_7_unicast_1_0_cons_buff_0, %18 ]
  br label %20

52:                                               ; preds = %18
  %53 = phi ptr [ @of_7_unicast_1_0_cons_buff_1, %18 ]
  br label %20

54:                                               ; preds = %27
  %55 = phi ptr [ @flash_scale_1_3_buff_0, %27 ]
  br label %29

56:                                               ; preds = %27
  %57 = phi ptr [ @flash_scale_1_3_buff_1, %27 ]
  br label %29
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
