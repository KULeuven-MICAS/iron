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

define void @core_1_2() {
  br label %1

1:                                                ; preds = %28, %0
  %2 = phi i64 [ %29, %28 ], [ 0, %0 ]
  %3 = phi i32 [ %8, %28 ], [ 0, %0 ]
  %4 = icmp slt i64 %2, 4294967295
  br i1 %4, label %5, label %30

5:                                                ; preds = %1
  call void @llvm.aie2p.acquire(i32 51, i32 -2)
  call void @llvm.aie2p.acquire(i32 53, i32 -1)
  br label %6

6:                                                ; preds = %23, %5
  %7 = phi i64 [ %27, %23 ], [ 0, %5 ]
  %8 = phi i32 [ %26, %23 ], [ %3, %5 ]
  %9 = icmp slt i64 %7, 2
  br i1 %9, label %10, label %28

10:                                               ; preds = %6
  call void @llvm.aie2p.acquire(i32 48, i32 -1)
  %11 = sext i32 %8 to i64
  switch i64 %11, label %12 [
    i64 0, label %31
    i64 1, label %33
  ]

12:                                               ; preds = %31, %33, %10
  %13 = phi ptr [ %34, %33 ], [ %32, %31 ], [ @of_6_unicast_1_buff_0, %10 ]
  %14 = getelementptr [64 x [64 x bfloat]], ptr %13, i32 0, i32 0, i32 0
  br label %15

15:                                               ; preds = %12
  call void @op0_zero_bf16_64_64_64(ptr %14)
  switch i64 %7, label %16 [
    i64 0, label %35
    i64 1, label %37
  ]

16:                                               ; preds = %35, %37, %15
  %17 = phi ptr [ %38, %37 ], [ %36, %35 ], [ @of_4_broadcast_0_0_1_cons_buff_0, %15 ]
  %18 = getelementptr [64 x [64 x bfloat]], ptr %17, i32 0, i32 0, i32 0
  br label %19

19:                                               ; preds = %16
  %20 = trunc i64 %7 to i32
  %21 = icmp sle i32 %20, 1
  br i1 %21, label %22, label %23

22:                                               ; preds = %19
  call void @op0_matmul_bf16_bf16_64_64_64(ptr @of_3_unicast_1_0_cons_buff_0, ptr %18, ptr %14)
  br label %23

23:                                               ; preds = %22, %19
  call void @llvm.aie2p.release(i32 49, i32 1)
  %24 = add i32 %8, 1
  %25 = icmp sge i32 %24, 2
  %26 = select i1 %25, i32 0, i32 %24
  %27 = add i64 %7, 1
  br label %6

28:                                               ; preds = %6
  call void @llvm.aie2p.release(i32 52, i32 1)
  call void @llvm.aie2p.release(i32 50, i32 2)
  %29 = add i64 %2, 1
  br label %1

30:                                               ; preds = %1
  ret void

31:                                               ; preds = %10
  %32 = phi ptr [ @of_6_unicast_1_buff_0, %10 ]
  br label %12

33:                                               ; preds = %10
  %34 = phi ptr [ @of_6_unicast_1_buff_1, %10 ]
  br label %12

35:                                               ; preds = %15
  %36 = phi ptr [ @of_4_broadcast_0_0_1_cons_buff_0, %15 ]
  br label %16

37:                                               ; preds = %15
  %38 = phi ptr [ @of_4_broadcast_0_0_1_cons_buff_1, %15 ]
  br label %16
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
