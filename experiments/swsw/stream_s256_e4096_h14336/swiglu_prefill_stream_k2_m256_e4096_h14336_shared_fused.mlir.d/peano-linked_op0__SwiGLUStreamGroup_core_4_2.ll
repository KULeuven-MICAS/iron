; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"
target triple = "aie2p"

@of_10_mem_buff_1 = external global [4 x [32 x [64 x bfloat]]]
@of_10_mem_buff_0 = external global [4 x [32 x [64 x bfloat]]]
@of_0_mem_0_cons_buff_1 = external global [4 x [32 x [32 x bfloat]]]
@of_0_mem_0_cons_buff_0 = external global [4 x [32 x [32 x bfloat]]]
@of_0_mem_1_cons_buff_1 = external global [4 x [32 x [32 x bfloat]]]
@of_0_mem_1_cons_buff_0 = external global [4 x [32 x [32 x bfloat]]]
@of_1_mem_0_cons_buff_1 = external global [32 x [64 x bfloat]]
@of_1_mem_0_cons_buff_0 = external global [32 x [64 x bfloat]]
@of_1_mem_1_cons_buff_1 = external global [32 x [64 x bfloat]]
@of_1_mem_1_cons_buff_0 = external global [32 x [64 x bfloat]]
@of_2_mem_0_cons_buff_1 = external global [32 x [64 x bfloat]]
@of_2_mem_0_cons_buff_0 = external global [32 x [64 x bfloat]]
@of_2_mem_1_cons_buff_1 = external global [32 x [64 x bfloat]]
@of_2_mem_1_cons_buff_0 = external global [32 x [64 x bfloat]]
@of_3_distribute_0_0_1_cons_buff_1 = external global [32 x [32 x bfloat]]
@of_3_distribute_0_0_1_cons_buff_0 = external global [32 x [32 x bfloat]]
@of_3_distribute_0_0_0_cons_buff_1 = external global [32 x [32 x bfloat]]
@of_3_distribute_0_0_0_cons_buff_0 = external global [32 x [32 x bfloat]]
@of_3_distribute_0_1_1_cons_buff_1 = external global [32 x [32 x bfloat]]
@of_3_distribute_0_1_1_cons_buff_0 = external global [32 x [32 x bfloat]]
@of_3_distribute_0_1_0_cons_buff_1 = external global [32 x [32 x bfloat]]
@of_3_distribute_0_1_0_cons_buff_0 = external global [32 x [32 x bfloat]]
@of_3_distribute_0_2_1_cons_buff_1 = external global [32 x [32 x bfloat]]
@of_3_distribute_0_2_1_cons_buff_0 = external global [32 x [32 x bfloat]]
@of_3_distribute_0_2_0_cons_buff_1 = external global [32 x [32 x bfloat]]
@of_3_distribute_0_2_0_cons_buff_0 = external global [32 x [32 x bfloat]]
@of_3_distribute_0_3_1_cons_buff_1 = external global [32 x [32 x bfloat]]
@of_3_distribute_0_3_1_cons_buff_0 = external global [32 x [32 x bfloat]]
@of_3_distribute_0_3_0_cons_buff_1 = external global [32 x [32 x bfloat]]
@of_3_distribute_0_3_0_cons_buff_0 = external global [32 x [32 x bfloat]]
@of_3_distribute_1_0_1_cons_buff_1 = external global [32 x [32 x bfloat]]
@of_3_distribute_1_0_1_cons_buff_0 = external global [32 x [32 x bfloat]]
@of_3_distribute_1_0_0_cons_buff_1 = external global [32 x [32 x bfloat]]
@of_3_distribute_1_0_0_cons_buff_0 = external global [32 x [32 x bfloat]]
@of_3_distribute_1_1_1_cons_buff_1 = external global [32 x [32 x bfloat]]
@of_3_distribute_1_1_1_cons_buff_0 = external global [32 x [32 x bfloat]]
@of_3_distribute_1_1_0_cons_buff_1 = external global [32 x [32 x bfloat]]
@of_3_distribute_1_1_0_cons_buff_0 = external global [32 x [32 x bfloat]]
@of_3_distribute_1_2_1_cons_buff_1 = external global [32 x [32 x bfloat]]
@of_3_distribute_1_2_1_cons_buff_0 = external global [32 x [32 x bfloat]]
@of_3_distribute_1_2_0_cons_buff_1 = external global [32 x [32 x bfloat]]
@of_3_distribute_1_2_0_cons_buff_0 = external global [32 x [32 x bfloat]]
@of_3_distribute_1_3_1_cons_buff_1 = external global [32 x [32 x bfloat]]
@of_3_distribute_1_3_1_cons_buff_0 = external global [32 x [32 x bfloat]]
@of_3_distribute_1_3_0_cons_buff_1 = external global [32 x [32 x bfloat]]
@of_3_distribute_1_3_0_cons_buff_0 = external global [32 x [32 x bfloat]]
@of_4_broadcast_0_0_3_cons_buff_1 = external global [32 x [64 x bfloat]]
@of_4_broadcast_0_0_3_cons_buff_0 = external global [32 x [64 x bfloat]]
@of_4_broadcast_0_0_2_cons_buff_1 = external global [32 x [64 x bfloat]]
@of_4_broadcast_0_0_2_cons_buff_0 = external global [32 x [64 x bfloat]]
@of_4_broadcast_0_0_1_cons_buff_1 = external global [32 x [64 x bfloat]]
@of_4_broadcast_0_0_1_cons_buff_0 = external global [32 x [64 x bfloat]]
@of_4_broadcast_0_0_0_cons_buff_1 = external global [32 x [64 x bfloat]]
@of_4_broadcast_0_0_0_cons_buff_0 = external global [32 x [64 x bfloat]]
@of_4_broadcast_1_0_3_cons_buff_1 = external global [32 x [64 x bfloat]]
@of_4_broadcast_1_0_3_cons_buff_0 = external global [32 x [64 x bfloat]]
@of_4_broadcast_1_0_2_cons_buff_1 = external global [32 x [64 x bfloat]]
@of_4_broadcast_1_0_2_cons_buff_0 = external global [32 x [64 x bfloat]]
@of_4_broadcast_1_0_1_cons_buff_1 = external global [32 x [64 x bfloat]]
@of_4_broadcast_1_0_1_cons_buff_0 = external global [32 x [64 x bfloat]]
@of_4_broadcast_1_0_0_cons_buff_1 = external global [32 x [64 x bfloat]]
@of_4_broadcast_1_0_0_cons_buff_0 = external global [32 x [64 x bfloat]]
@of_5_broadcast_0_0_3_cons_buff_1 = external global [32 x [64 x bfloat]]
@of_5_broadcast_0_0_3_cons_buff_0 = external global [32 x [64 x bfloat]]
@of_5_broadcast_0_0_2_cons_buff_1 = external global [32 x [64 x bfloat]]
@of_5_broadcast_0_0_2_cons_buff_0 = external global [32 x [64 x bfloat]]
@of_5_broadcast_0_0_1_cons_buff_1 = external global [32 x [64 x bfloat]]
@of_5_broadcast_0_0_1_cons_buff_0 = external global [32 x [64 x bfloat]]
@of_5_broadcast_0_0_0_cons_buff_1 = external global [32 x [64 x bfloat]]
@of_5_broadcast_0_0_0_cons_buff_0 = external global [32 x [64 x bfloat]]
@of_5_broadcast_1_0_3_cons_buff_1 = external global [32 x [64 x bfloat]]
@of_5_broadcast_1_0_3_cons_buff_0 = external global [32 x [64 x bfloat]]
@of_5_broadcast_1_0_2_cons_buff_1 = external global [32 x [64 x bfloat]]
@of_5_broadcast_1_0_2_cons_buff_0 = external global [32 x [64 x bfloat]]
@of_5_broadcast_1_0_1_cons_buff_1 = external global [32 x [64 x bfloat]]
@of_5_broadcast_1_0_1_cons_buff_0 = external global [32 x [64 x bfloat]]
@of_5_broadcast_1_0_0_cons_buff_1 = external global [32 x [64 x bfloat]]
@of_5_broadcast_1_0_0_cons_buff_0 = external global [32 x [64 x bfloat]]
@of_6_switch_join_0_0_buff_1 = external global [32 x [64 x bfloat]]
@of_6_switch_join_0_0_buff_0 = external global [32 x [64 x bfloat]]
@of_6_switch_join_0_0_cons_buff_1 = external global [32 x [64 x bfloat]]
@of_6_switch_join_0_0_cons_buff_0 = external global [32 x [64 x bfloat]]
@of_6_switch_join_0_1_buff_1 = external global [32 x [64 x bfloat]]
@of_6_switch_join_0_1_buff_0 = external global [32 x [64 x bfloat]]
@of_6_switch_join_0_1_cons_buff_1 = external global [32 x [64 x bfloat]]
@of_6_switch_join_0_1_cons_buff_0 = external global [32 x [64 x bfloat]]
@of_6_switch_join_1_0_buff_1 = external global [32 x [64 x bfloat]]
@of_6_switch_join_1_0_buff_0 = external global [32 x [64 x bfloat]]
@of_6_switch_join_1_0_cons_buff_1 = external global [32 x [64 x bfloat]]
@of_6_switch_join_1_0_cons_buff_0 = external global [32 x [64 x bfloat]]
@of_6_switch_join_1_1_buff_1 = external global [32 x [64 x bfloat]]
@of_6_switch_join_1_1_buff_0 = external global [32 x [64 x bfloat]]
@of_6_switch_join_1_1_cons_buff_1 = external global [32 x [64 x bfloat]]
@of_6_switch_join_1_1_cons_buff_0 = external global [32 x [64 x bfloat]]
@of_6_switch_join_2_0_buff_1 = external global [32 x [64 x bfloat]]
@of_6_switch_join_2_0_buff_0 = external global [32 x [64 x bfloat]]
@of_6_switch_join_2_0_cons_buff_1 = external global [32 x [64 x bfloat]]
@of_6_switch_join_2_0_cons_buff_0 = external global [32 x [64 x bfloat]]
@of_6_switch_join_2_1_buff_1 = external global [32 x [64 x bfloat]]
@of_6_switch_join_2_1_buff_0 = external global [32 x [64 x bfloat]]
@of_6_switch_join_2_1_cons_buff_1 = external global [32 x [64 x bfloat]]
@of_6_switch_join_2_1_cons_buff_0 = external global [32 x [64 x bfloat]]
@of_6_switch_join_3_0_buff_1 = external global [32 x [64 x bfloat]]
@of_6_switch_join_3_0_buff_0 = external global [32 x [64 x bfloat]]
@of_6_switch_join_3_0_cons_buff_1 = external global [32 x [64 x bfloat]]
@of_6_switch_join_3_0_cons_buff_0 = external global [32 x [64 x bfloat]]
@of_6_switch_join_3_1_buff_1 = external global [32 x [64 x bfloat]]
@of_6_switch_join_3_1_buff_0 = external global [32 x [64 x bfloat]]
@of_6_switch_join_3_1_cons_buff_1 = external global [32 x [64 x bfloat]]
@of_6_switch_join_3_1_cons_buff_0 = external global [32 x [64 x bfloat]]
@of_7_switch_join_0_0_buff_1 = external global [32 x [64 x bfloat]]
@of_7_switch_join_0_0_buff_0 = external global [32 x [64 x bfloat]]
@of_7_switch_join_0_0_cons_buff_1 = external global [32 x [64 x bfloat]]
@of_7_switch_join_0_0_cons_buff_0 = external global [32 x [64 x bfloat]]
@of_7_switch_join_0_1_buff_1 = external global [32 x [64 x bfloat]]
@of_7_switch_join_0_1_buff_0 = external global [32 x [64 x bfloat]]
@of_7_switch_join_0_1_cons_buff_1 = external global [32 x [64 x bfloat]]
@of_7_switch_join_0_1_cons_buff_0 = external global [32 x [64 x bfloat]]
@of_7_switch_join_1_0_buff_1 = external global [32 x [64 x bfloat]]
@of_7_switch_join_1_0_buff_0 = external global [32 x [64 x bfloat]]
@of_7_switch_join_1_0_cons_buff_1 = external global [32 x [64 x bfloat]]
@of_7_switch_join_1_0_cons_buff_0 = external global [32 x [64 x bfloat]]
@of_7_switch_join_1_1_buff_1 = external global [32 x [64 x bfloat]]
@of_7_switch_join_1_1_buff_0 = external global [32 x [64 x bfloat]]
@of_7_switch_join_1_1_cons_buff_1 = external global [32 x [64 x bfloat]]
@of_7_switch_join_1_1_cons_buff_0 = external global [32 x [64 x bfloat]]
@of_7_switch_join_2_0_buff_1 = external global [32 x [64 x bfloat]]
@of_7_switch_join_2_0_buff_0 = external global [32 x [64 x bfloat]]
@of_7_switch_join_2_0_cons_buff_1 = external global [32 x [64 x bfloat]]
@of_7_switch_join_2_0_cons_buff_0 = external global [32 x [64 x bfloat]]
@of_7_switch_join_2_1_buff_1 = external global [32 x [64 x bfloat]]
@of_7_switch_join_2_1_buff_0 = external global [32 x [64 x bfloat]]
@of_7_switch_join_2_1_cons_buff_1 = external global [32 x [64 x bfloat]]
@of_7_switch_join_2_1_cons_buff_0 = external global [32 x [64 x bfloat]]
@of_7_switch_join_3_0_buff_1 = external global [32 x [64 x bfloat]]
@of_7_switch_join_3_0_buff_0 = external global [32 x [64 x bfloat]]
@of_7_switch_join_3_0_cons_buff_1 = external global [32 x [64 x bfloat]]
@of_7_switch_join_3_0_cons_buff_0 = external global [32 x [64 x bfloat]]
@of_7_switch_join_3_1_buff_1 = external global [32 x [64 x bfloat]]
@of_7_switch_join_3_1_buff_0 = external global [32 x [64 x bfloat]]
@of_7_switch_join_3_1_cons_buff_1 = external global [32 x [64 x bfloat]]
@of_7_switch_join_3_1_cons_buff_0 = external global [32 x [64 x bfloat]]
@of_8_unicast_0_buff_1 = external global [32 x [64 x bfloat]]
@of_8_unicast_0_buff_0 = external global [32 x [64 x bfloat]]
@of_8_unicast_1_buff_1 = external global [32 x [64 x bfloat]]
@of_8_unicast_1_buff_0 = external global [32 x [64 x bfloat]]
@of_8_unicast_2_buff_1 = external global [32 x [64 x bfloat]]
@of_8_unicast_2_buff_0 = external global [32 x [64 x bfloat]]
@of_8_unicast_3_buff_1 = external global [32 x [64 x bfloat]]
@of_8_unicast_3_buff_0 = external global [32 x [64 x bfloat]]
@of_9_join_0_0_buff_1 = external global [32 x [64 x bfloat]]
@of_9_join_0_0_buff_0 = external global [32 x [64 x bfloat]]
@of_9_join_0_1_buff_1 = external global [32 x [64 x bfloat]]
@of_9_join_0_1_buff_0 = external global [32 x [64 x bfloat]]
@of_9_join_0_2_buff_1 = external global [32 x [64 x bfloat]]
@of_9_join_0_2_buff_0 = external global [32 x [64 x bfloat]]
@of_9_join_0_3_buff_1 = external global [32 x [64 x bfloat]]
@of_9_join_0_3_buff_0 = external global [32 x [64 x bfloat]]

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

declare void @op0_zero_bf16_32_32_64(ptr)

declare void @op0_matmul_bf16_bf16_32_32_64(ptr, ptr, ptr)

declare void @op0_silu_bf16(ptr, ptr, i32)

declare void @op0_eltwise_mul_bf16_vector(ptr, ptr, ptr, i32)

define void @core_4_2() {
  br label %1

1:                                                ; preds = %69, %0
  %2 = phi i64 [ %70, %69 ], [ 0, %0 ]
  %3 = phi i32 [ %9, %69 ], [ 0, %0 ]
  %4 = phi i32 [ %10, %69 ], [ 0, %0 ]
  %5 = phi i32 [ %11, %69 ], [ 0, %0 ]
  %6 = icmp slt i64 %2, 4294967295
  br i1 %6, label %7, label %71

7:                                                ; preds = %67, %1
  %8 = phi i64 [ %68, %67 ], [ 0, %1 ]
  %9 = phi i32 [ %15, %67 ], [ %3, %1 ]
  %10 = phi i32 [ %16, %67 ], [ %4, %1 ]
  %11 = phi i32 [ %17, %67 ], [ %5, %1 ]
  %12 = icmp slt i64 %8, 2
  br i1 %12, label %13, label %69

13:                                               ; preds = %59, %7
  %14 = phi i64 [ %66, %59 ], [ 0, %7 ]
  %15 = phi i32 [ %62, %59 ], [ %9, %7 ]
  %16 = phi i32 [ %65, %59 ], [ %10, %7 ]
  %17 = phi i32 [ %44, %59 ], [ %11, %7 ]
  %18 = icmp slt i64 %14, 112
  br i1 %18, label %19, label %67

19:                                               ; preds = %13
  call void @llvm.aie2p.acquire(i32 53, i32 -1)
  call void @llvm.aie2p.acquire(i32 51, i32 -1)
  %20 = sext i32 %15 to i64
  switch i64 %20, label %21 [
    i64 0, label %72
    i64 1, label %74
  ]

21:                                               ; preds = %72, %74, %19
  %22 = phi ptr [ %75, %74 ], [ %73, %72 ], [ @of_6_switch_join_0_0_cons_buff_0, %19 ]
  %23 = getelementptr [32 x [64 x bfloat]], ptr %22, i32 0, i32 0, i32 0
  %24 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } { ptr inttoptr (i64 3735928559 to ptr), ptr poison, i64 poison, [2 x i64] poison, [2 x i64] poison }, ptr %23, 1
  %25 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %24, i64 0, 2
  %26 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %25, i64 32, 3, 0
  %27 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %26, i64 64, 3, 1
  %28 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %27, i64 64, 4, 0
  %29 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %28, i64 1, 4, 1
  br label %30

30:                                               ; preds = %21
  %31 = sext i32 %16 to i64
  switch i64 %31, label %32 [
    i64 0, label %76
    i64 1, label %78
  ]

32:                                               ; preds = %76, %78, %30
  %33 = phi ptr [ %79, %78 ], [ %77, %76 ], [ @of_6_switch_join_0_1_cons_buff_0, %30 ]
  %34 = getelementptr [32 x [64 x bfloat]], ptr %33, i32 0, i32 0, i32 0
  %35 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } { ptr inttoptr (i64 3735928559 to ptr), ptr poison, i64 poison, [2 x i64] poison, [2 x i64] poison }, ptr %34, 1
  %36 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %35, i64 0, 2
  %37 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %36, i64 32, 3, 0
  %38 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %37, i64 64, 3, 1
  %39 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %38, i64 64, 4, 0
  %40 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %39, i64 1, 4, 1
  br label %41

41:                                               ; preds = %32
  br label %42

42:                                               ; preds = %52, %41
  %43 = phi i64 [ %58, %52 ], [ 0, %41 ]
  %44 = phi i32 [ %57, %52 ], [ %17, %41 ]
  %45 = icmp slt i64 %43, 2
  br i1 %45, label %46, label %59

46:                                               ; preds = %42
  call void @llvm.aie2p.acquire(i32 48, i32 -1)
  %47 = sext i32 %44 to i64
  switch i64 %47, label %48 [
    i64 0, label %80
    i64 1, label %82
  ]

48:                                               ; preds = %80, %82, %46
  %49 = phi ptr [ %83, %82 ], [ %81, %80 ], [ @of_8_unicast_0_buff_0, %46 ]
  %50 = getelementptr [32 x [64 x bfloat]], ptr %49, i32 0, i32 0, i32 0
  br label %51

51:                                               ; preds = %48
  switch i64 %43, label %52 [
    i64 1, label %84
  ]

52:                                               ; preds = %84, %51
  %53 = phi { ptr, ptr, i64, [2 x i64], [2 x i64] } [ %85, %84 ], [ %29, %51 ]
  %54 = extractvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %53, 1
  call void @op0_silu_bf16(ptr %54, ptr %50, i32 2048)
  call void @llvm.aie2p.release(i32 49, i32 1)
  %55 = add i32 %44, 1
  %56 = icmp sge i32 %55, 2
  %57 = select i1 %56, i32 0, i32 %55
  %58 = add i64 %43, 1
  br label %42

59:                                               ; preds = %42
  call void @llvm.aie2p.release(i32 52, i32 1)
  %60 = add i32 %15, 1
  %61 = icmp sge i32 %60, 2
  %62 = select i1 %61, i32 0, i32 %60
  call void @llvm.aie2p.release(i32 50, i32 1)
  %63 = add i32 %16, 1
  %64 = icmp sge i32 %63, 2
  %65 = select i1 %64, i32 0, i32 %63
  %66 = add i64 %14, 1
  br label %13

67:                                               ; preds = %13
  %68 = add i64 %8, 1
  br label %7

69:                                               ; preds = %7
  %70 = add i64 %2, 1
  br label %1

71:                                               ; preds = %1
  ret void

72:                                               ; preds = %19
  %73 = phi ptr [ @of_6_switch_join_0_0_cons_buff_0, %19 ]
  br label %21

74:                                               ; preds = %19
  %75 = phi ptr [ @of_6_switch_join_0_0_cons_buff_1, %19 ]
  br label %21

76:                                               ; preds = %30
  %77 = phi ptr [ @of_6_switch_join_0_1_cons_buff_0, %30 ]
  br label %32

78:                                               ; preds = %30
  %79 = phi ptr [ @of_6_switch_join_0_1_cons_buff_1, %30 ]
  br label %32

80:                                               ; preds = %46
  %81 = phi ptr [ @of_8_unicast_0_buff_0, %46 ]
  br label %48

82:                                               ; preds = %46
  %83 = phi ptr [ @of_8_unicast_0_buff_1, %46 ]
  br label %48

84:                                               ; preds = %51
  %85 = phi { ptr, ptr, i64, [2 x i64], [2 x i64] } [ %40, %51 ]
  br label %52
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
