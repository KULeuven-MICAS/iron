; ModuleID = '/home/micas/iron-stream-dse/experiments/arm_fused/eq_ours_s2048_c8_h8/mha_prefill_stream_k1_h8_s2048_d64_flash_shared_fused.mlir.d/peano-linked_op0__MHAStreamGroup_core_0_2.ll'
source_filename = "LLVMDialectModule"
target datalayout = "e-m:e-p:20:32-i1:8:32-i8:8:32-i16:16:32-i32:32:32-f32:32:32-i64:32-f64:32-a:0:32-n32"
target triple = "aie2p"

@flash_index_0_2 = external global [2 x i32]
@flash_scale_0_3_buff_1 = external global [256 x bfloat]
@flash_scale_0_3_buff_0 = external global [256 x bfloat]
@of_5_broadcast_0_0_0_cons_buff_1 = external global [64 x [64 x bfloat]]
@of_5_broadcast_0_0_0_cons_buff_0 = external global [64 x [64 x bfloat]]
@of_6_unicast_0_buff_1 = external global [64 x [64 x bfloat]]
@of_6_unicast_0_buff_0 = external global [64 x [64 x bfloat]]
@of_7_join_0_0_buff_1 = external global [64 x [64 x bfloat]]
@of_7_join_0_0_buff_0 = external global [64 x [64 x bfloat]]

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.aie2p.acquire(i32, i32) #0

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.aie2p.release(i32, i32) #0

declare void @op0_zero_bf16(ptr) local_unnamed_addr

declare void @op0_rescale_O(ptr, ptr, i32, ptr) local_unnamed_addr

declare void @op0_matmul_PV(ptr, ptr, ptr, ptr, i32, i32, ptr) local_unnamed_addr

define void @core_0_2() local_unnamed_addr {
  br label %.preheader

.preheader:                                       ; preds = %0, %44
  %1 = phi i32 [ 0, %0 ], [ %29, %44 ]
  %2 = phi i32 [ 0, %0 ], [ %32, %44 ]
  %3 = phi i32 [ 0, %0 ], [ %35, %44 ]
  %4 = phi i32 [ 0, %0 ], [ %41, %44 ]
  %5 = phi i64 [ 0, %0 ], [ %45, %44 ]
  br label %6

6:                                                ; preds = %.preheader, %38
  %7 = phi i32 [ %1, %.preheader ], [ %29, %38 ]
  %8 = phi i32 [ %2, %.preheader ], [ %32, %38 ]
  %9 = phi i32 [ %3, %.preheader ], [ %35, %38 ]
  %10 = phi i32 [ %4, %.preheader ], [ %41, %38 ]
  %11 = phi i64 [ 0, %.preheader ], [ %42, %38 ]
  tail call void @llvm.aie2p.acquire(i32 48, i32 -1)
  %cond = icmp eq i32 %10, 1
  %spec.select = select i1 %cond, ptr @of_7_join_0_0_buff_1, ptr @of_7_join_0_0_buff_0
  tail call void @op0_zero_bf16(ptr nonnull %spec.select)
  %12 = trunc nuw nsw i64 %11 to i32
  %13 = shl nuw nsw i32 %12, 4
  br label %14

14:                                               ; preds = %6, %26
  %15 = phi i32 [ %7, %6 ], [ %29, %26 ]
  %16 = phi i32 [ %8, %6 ], [ %32, %26 ]
  %17 = phi i32 [ %9, %6 ], [ %35, %26 ]
  %18 = phi i64 [ 0, %6 ], [ %36, %26 ]
  tail call void @llvm.aie2p.acquire(i32 33, i32 -1)
  %cond1 = icmp eq i32 %17, 1
  %spec.select5 = select i1 %cond1, ptr @of_6_unicast_0_buff_1, ptr @of_6_unicast_0_buff_0
  tail call void @llvm.aie2p.acquire(i32 51, i32 -1)
  %cond2 = icmp eq i32 %16, 1
  %19 = select i1 %cond2, ptr @of_5_broadcast_0_0_0_cons_buff_1, ptr @of_5_broadcast_0_0_0_cons_buff_0
  %20 = trunc nuw nsw i64 %18 to i32
  store i32 %20, ptr @flash_index_0_2, align 4
  store i32 %13, ptr getelementptr inbounds nuw (i8, ptr @flash_index_0_2, i20 4), align 4
  tail call void @llvm.aie2p.acquire(i32 39, i32 -1)
  %cond3 = icmp eq i32 %15, 1
  %21 = select i1 %cond3, ptr @flash_scale_0_3_buff_1, ptr @flash_scale_0_3_buff_0
  %22 = icmp ne i32 %20, 0
  %23 = zext i1 %22 to i32
  tail call void @op0_matmul_PV(ptr nonnull %spec.select5, ptr nonnull %19, ptr nonnull %spec.select, ptr nonnull %21, i32 64, i32 %23, ptr nonnull @flash_index_0_2)
  %24 = icmp eq i32 %20, 31
  br i1 %24, label %25, label %26

25:                                               ; preds = %14
  tail call void @op0_rescale_O(ptr nonnull %spec.select, ptr nonnull %21, i32 64, ptr nonnull @flash_index_0_2)
  br label %26

26:                                               ; preds = %25, %14
  tail call void @llvm.aie2p.release(i32 38, i32 1)
  %27 = add i32 %15, 1
  %28 = icmp sgt i32 %27, 1
  %29 = select i1 %28, i32 0, i32 %27
  tail call void @llvm.aie2p.release(i32 50, i32 1)
  %30 = add i32 %16, 1
  %31 = icmp sgt i32 %30, 1
  %32 = select i1 %31, i32 0, i32 %30
  tail call void @llvm.aie2p.release(i32 32, i32 1)
  %33 = add i32 %17, 1
  %34 = icmp sgt i32 %33, 1
  %35 = select i1 %34, i32 0, i32 %33
  %36 = add nuw nsw i64 %18, 1
  %37 = icmp samesign ult i64 %18, 31
  br i1 %37, label %14, label %38

38:                                               ; preds = %26
  tail call void @llvm.aie2p.release(i32 49, i32 1)
  %39 = add i32 %10, 1
  %40 = icmp sgt i32 %39, 1
  %41 = select i1 %40, i32 0, i32 %39
  %42 = add nuw nsw i64 %11, 1
  %43 = icmp eq i64 %11, 0
  br i1 %43, label %6, label %44

44:                                               ; preds = %38
  %45 = add nuw nsw i64 %5, 1
  %46 = icmp samesign ult i64 %5, 4294967294
  br i1 %46, label %.preheader, label %47

47:                                               ; preds = %44
  ret void
}

attributes #0 = { mustprogress nocallback nofree nosync nounwind willreturn }

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
