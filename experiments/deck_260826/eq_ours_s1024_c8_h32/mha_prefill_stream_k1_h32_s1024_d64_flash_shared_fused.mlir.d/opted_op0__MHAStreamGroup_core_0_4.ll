; ModuleID = '/home/micas/iron-stream-dse/experiments/deck_260826/eq_ours_s1024_c8_h32/mha_prefill_stream_k1_h32_s1024_d64_flash_shared_fused.mlir.d/peano-linked_op0__MHAStreamGroup_core_0_4.ll'
source_filename = "LLVMDialectModule"
target datalayout = "e-m:e-p:20:32-i1:8:32-i8:8:32-i16:16:32-i32:32:32-f32:32:32-i64:32-f64:32-a:0:32-n32"
target triple = "aie2p"

@flash_index_0_4 = external global [2 x i32]
@flash_scale_0_3_buff_1 = external global [256 x bfloat]
@flash_scale_0_3_buff_0 = external global [256 x bfloat]
@flash_scale_0_5_buff_1 = external global [256 x bfloat]
@flash_scale_0_5_buff_0 = external global [256 x bfloat]
@of_5_broadcast_0_0_0_cons_buff_1 = external global [64 x [64 x bfloat]]
@of_5_broadcast_0_0_0_cons_buff_0 = external global [64 x [64 x bfloat]]
@of_8_switch_join_0_0_buff_1 = external global [64 x [64 x bfloat]]
@of_8_switch_join_0_0_buff_0 = external global [64 x [64 x bfloat]]
@of_8_switch_join_0_1_buff_1 = external global [64 x [64 x bfloat]]
@of_8_switch_join_0_1_buff_0 = external global [64 x [64 x bfloat]]
@of_9_unicast_0_buff_1 = external global [64 x [64 x bfloat]]
@of_9_unicast_0_buff_0 = external global [64 x [64 x bfloat]]

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.aie2p.acquire(i32, i32) #0

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.aie2p.release(i32, i32) #0

declare void @op0_rescale_O(ptr, ptr, i32, ptr) local_unnamed_addr

declare void @op0_zero_bf16(ptr) local_unnamed_addr

declare void @op0_matmul_PV(ptr, ptr, ptr, ptr, i32, i32, ptr) local_unnamed_addr

define void @core_0_4() local_unnamed_addr {
  br label %1

1:                                                ; preds = %0, %59
  %2 = phi i32 [ 0, %0 ], [ %44, %59 ]
  %3 = phi i32 [ 0, %0 ], [ %43, %59 ]
  %4 = phi i32 [ 0, %0 ], [ %53, %59 ]
  %5 = phi i32 [ 0, %0 ], [ %50, %59 ]
  %6 = phi i32 [ 0, %0 ], [ %56, %59 ]
  %7 = phi i64 [ 0, %0 ], [ %60, %59 ]
  tail call void @llvm.aie2p.acquire(i32 48, i32 -2)
  tail call void @op0_zero_bf16(ptr nonnull @of_9_unicast_0_buff_0)
  tail call void @op0_zero_bf16(ptr nonnull @of_9_unicast_0_buff_1)
  br label %8

8:                                                ; preds = %1, %47
  %9 = phi i32 [ %2, %1 ], [ %44, %47 ]
  %10 = phi i32 [ %3, %1 ], [ %43, %47 ]
  %11 = phi i32 [ %4, %1 ], [ %53, %47 ]
  %12 = phi i32 [ %5, %1 ], [ %50, %47 ]
  %13 = phi i32 [ %6, %1 ], [ %56, %47 ]
  %14 = phi i64 [ 0, %1 ], [ %57, %47 ]
  tail call void @llvm.aie2p.acquire(i32 51, i32 -1)
  %cond2 = icmp eq i32 %13, 1
  %spec.select = select i1 %cond2, ptr @of_5_broadcast_0_0_0_cons_buff_1, ptr @of_5_broadcast_0_0_0_cons_buff_0
  tail call void @llvm.aie2p.acquire(i32 1, i32 -1)
  tail call void @llvm.aie2p.acquire(i32 33, i32 -1)
  %cond3 = icmp eq i32 %12, 1
  %15 = select i1 %cond3, ptr @of_8_switch_join_0_0_buff_1, ptr @of_8_switch_join_0_0_buff_0
  %cond4 = icmp eq i32 %11, 1
  %16 = select i1 %cond4, ptr @of_8_switch_join_0_1_buff_1, ptr @of_8_switch_join_0_1_buff_0
  %17 = trunc nuw nsw i64 %14 to i32
  %18 = icmp ne i32 %17, 0
  %19 = zext i1 %18 to i32
  %20 = icmp eq i32 %17, 15
  %21 = icmp ne i32 %17, 0
  %22 = zext i1 %21 to i32
  %23 = icmp eq i32 %17, 15
  br label %24

24:                                               ; preds = %8, %42
  %25 = phi i32 [ %9, %8 ], [ %44, %42 ]
  %26 = phi i32 [ %10, %8 ], [ %43, %42 ]
  %27 = phi i64 [ 0, %8 ], [ %45, %42 ]
  %cond5 = icmp eq i64 %27, 1
  %spec.select21 = select i1 %cond5, ptr @of_9_unicast_0_buff_1, ptr @of_9_unicast_0_buff_0
  %.pn20 = select i1 %cond5, ptr %16, ptr %15
  %28 = trunc nuw nsw i64 %27 to i32
  %29 = shl nuw nsw i32 %28, 3
  store i32 %17, ptr @flash_index_0_4, align 4
  store i32 %29, ptr getelementptr inbounds nuw (i8, ptr @flash_index_0_4, i20 4), align 4
  br i1 %cond5, label %36, label %30

30:                                               ; preds = %24
  tail call void @llvm.aie2p.acquire(i32 5, i32 -1)
  %cond6 = icmp eq i32 %26, 1
  %spec.select22 = select i1 %cond6, ptr @flash_scale_0_3_buff_1, ptr @flash_scale_0_3_buff_0
  tail call void @op0_matmul_PV(ptr nonnull %.pn20, ptr nonnull %spec.select, ptr nonnull %spec.select21, ptr nonnull %spec.select22, i32 64, i32 %19, ptr nonnull @flash_index_0_4)
  br i1 %20, label %31, label %32

31:                                               ; preds = %30
  tail call void @op0_rescale_O(ptr nonnull %spec.select21, ptr nonnull %spec.select22, i32 64, ptr nonnull @flash_index_0_4)
  br label %32

32:                                               ; preds = %31, %30
  tail call void @llvm.aie2p.release(i32 4, i32 1)
  %33 = add i32 %26, 1
  %34 = icmp sgt i32 %33, 1
  %35 = select i1 %34, i32 0, i32 %33
  br label %42

36:                                               ; preds = %24
  tail call void @llvm.aie2p.acquire(i32 37, i32 -1)
  %cond7 = icmp eq i32 %25, 1
  %spec.select23 = select i1 %cond7, ptr @flash_scale_0_5_buff_1, ptr @flash_scale_0_5_buff_0
  tail call void @op0_matmul_PV(ptr nonnull %.pn20, ptr nonnull %spec.select, ptr nonnull %spec.select21, ptr nonnull %spec.select23, i32 64, i32 %22, ptr nonnull @flash_index_0_4)
  br i1 %23, label %37, label %38

37:                                               ; preds = %36
  tail call void @op0_rescale_O(ptr nonnull %spec.select21, ptr nonnull %spec.select23, i32 64, ptr nonnull @flash_index_0_4)
  br label %38

38:                                               ; preds = %37, %36
  tail call void @llvm.aie2p.release(i32 36, i32 1)
  %39 = add i32 %25, 1
  %40 = icmp sgt i32 %39, 1
  %41 = select i1 %40, i32 0, i32 %39
  br label %42

42:                                               ; preds = %38, %32
  %43 = phi i32 [ %26, %38 ], [ %35, %32 ]
  %44 = phi i32 [ %41, %38 ], [ %25, %32 ]
  %45 = add nuw nsw i64 %27, 1
  %46 = icmp eq i64 %27, 0
  br i1 %46, label %24, label %47

47:                                               ; preds = %42
  tail call void @llvm.aie2p.release(i32 0, i32 1)
  %48 = add i32 %12, 1
  %49 = icmp sgt i32 %48, 1
  %50 = select i1 %49, i32 0, i32 %48
  tail call void @llvm.aie2p.release(i32 32, i32 1)
  %51 = add i32 %11, 1
  %52 = icmp sgt i32 %51, 1
  %53 = select i1 %52, i32 0, i32 %51
  tail call void @llvm.aie2p.release(i32 50, i32 1)
  %54 = add i32 %13, 1
  %55 = icmp sgt i32 %54, 1
  %56 = select i1 %55, i32 0, i32 %54
  %57 = add nuw nsw i64 %14, 1
  %58 = icmp samesign ult i64 %14, 15
  br i1 %58, label %8, label %59

59:                                               ; preds = %47
  tail call void @llvm.aie2p.release(i32 49, i32 2)
  %60 = add nuw nsw i64 %7, 1
  %61 = icmp samesign ult i64 %7, 4294967294
  br i1 %61, label %1, label %62

62:                                               ; preds = %59
  ret void
}

attributes #0 = { mustprogress nocallback nofree nosync nounwind willreturn }

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
