; ModuleID = '/home/micas/iron-stream-dse/experiments/mh2/eq_ours_s2048_c8_h8/mha_prefill_stream_k1_h8_s2048_d64_flash_shared_fused.mlir.d/peano-linked_op0__MHAStreamGroup_core_5_4.ll'
source_filename = "LLVMDialectModule"
target datalayout = "e-m:e-p:20:32-i1:8:32-i8:8:32-i16:16:32-i32:32:32-f32:32:32-i64:32-f64:32-a:0:32-n32"
target triple = "aie2p"

@flash_index_5_4 = external global [2 x i32]
@flash_scale_5_3_5_4_buff_1 = external global [256 x bfloat]
@flash_scale_5_3_5_4_buff_0 = external global [256 x bfloat]
@flash_scale_5_5_5_4_buff_1 = external global [256 x bfloat]
@flash_scale_5_5_5_4_buff_0 = external global [256 x bfloat]
@of_5_broadcast_0_0_5_cons_buff_1 = external global [64 x [64 x bfloat]]
@of_5_broadcast_0_0_5_cons_buff_0 = external global [64 x [64 x bfloat]]
@of_8_switch_join_5_0_buff_1 = external global [64 x [64 x bfloat]]
@of_8_switch_join_5_0_buff_0 = external global [64 x [64 x bfloat]]
@of_8_switch_join_5_1_buff_1 = external global [64 x [64 x bfloat]]
@of_8_switch_join_5_1_buff_0 = external global [64 x [64 x bfloat]]
@of_9_unicast_5_buff_1 = external global [64 x [64 x bfloat]]
@of_9_unicast_5_buff_0 = external global [64 x [64 x bfloat]]

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.aie2p.acquire(i32, i32) #0

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.aie2p.release(i32, i32) #0

declare void @op0_rescale_O(ptr, ptr, i32, ptr) local_unnamed_addr

declare void @op0_zero_bf16(ptr) local_unnamed_addr

declare void @op0_matmul_PV(ptr, ptr, ptr, ptr, i32, i32, ptr) local_unnamed_addr

define void @core_5_4() local_unnamed_addr {
  br label %.preheader

.preheader:                                       ; preds = %0, %70
  %1 = phi i32 [ 0, %0 ], [ %52, %70 ]
  %2 = phi i32 [ 0, %0 ], [ %51, %70 ]
  %3 = phi i32 [ 0, %0 ], [ %61, %70 ]
  %4 = phi i32 [ 0, %0 ], [ %58, %70 ]
  %5 = phi i32 [ 0, %0 ], [ %64, %70 ]
  %6 = phi i64 [ 0, %0 ], [ %71, %70 ]
  br label %7

7:                                                ; preds = %.preheader, %67
  %8 = phi i32 [ %1, %.preheader ], [ %52, %67 ]
  %9 = phi i32 [ %2, %.preheader ], [ %51, %67 ]
  %10 = phi i32 [ %3, %.preheader ], [ %61, %67 ]
  %11 = phi i32 [ %4, %.preheader ], [ %58, %67 ]
  %12 = phi i32 [ %5, %.preheader ], [ %64, %67 ]
  %13 = phi i64 [ 0, %.preheader ], [ %68, %67 ]
  tail call void @llvm.aie2p.acquire(i32 48, i32 -2)
  tail call void @op0_zero_bf16(ptr nonnull @of_9_unicast_5_buff_0)
  tail call void @op0_zero_bf16(ptr nonnull @of_9_unicast_5_buff_1)
  %14 = trunc nuw nsw i64 %13 to i32
  %15 = shl nuw nsw i32 %14, 4
  %invariant.op = or disjoint i32 %15, 5
  br label %16

16:                                               ; preds = %7, %55
  %17 = phi i32 [ %8, %7 ], [ %52, %55 ]
  %18 = phi i32 [ %9, %7 ], [ %51, %55 ]
  %19 = phi i32 [ %10, %7 ], [ %61, %55 ]
  %20 = phi i32 [ %11, %7 ], [ %58, %55 ]
  %21 = phi i32 [ %12, %7 ], [ %64, %55 ]
  %22 = phi i64 [ 0, %7 ], [ %65, %55 ]
  tail call void @llvm.aie2p.acquire(i32 51, i32 -1)
  %cond2 = icmp eq i32 %21, 1
  %spec.select = select i1 %cond2, ptr @of_5_broadcast_0_0_5_cons_buff_1, ptr @of_5_broadcast_0_0_5_cons_buff_0
  tail call void @llvm.aie2p.acquire(i32 1, i32 -1)
  tail call void @llvm.aie2p.acquire(i32 33, i32 -1)
  %cond3 = icmp eq i32 %20, 1
  %23 = select i1 %cond3, ptr @of_8_switch_join_5_0_buff_1, ptr @of_8_switch_join_5_0_buff_0
  %cond4 = icmp eq i32 %19, 1
  %24 = select i1 %cond4, ptr @of_8_switch_join_5_1_buff_1, ptr @of_8_switch_join_5_1_buff_0
  %25 = trunc nuw nsw i64 %22 to i32
  %26 = icmp ne i32 %25, 0
  %27 = zext i1 %26 to i32
  %28 = icmp eq i32 %25, 31
  %29 = icmp ne i32 %25, 0
  %30 = zext i1 %29 to i32
  %31 = icmp eq i32 %25, 31
  br label %32

32:                                               ; preds = %16, %50
  %33 = phi i32 [ %17, %16 ], [ %52, %50 ]
  %34 = phi i32 [ %18, %16 ], [ %51, %50 ]
  %35 = phi i64 [ 0, %16 ], [ %53, %50 ]
  %cond5 = icmp eq i64 %35, 1
  %spec.select21 = select i1 %cond5, ptr @of_9_unicast_5_buff_1, ptr @of_9_unicast_5_buff_0
  %.pn20 = select i1 %cond5, ptr %24, ptr %23
  %36 = trunc nuw nsw i64 %35 to i32
  %37 = shl nuw nsw i32 %36, 3
  %.reass = add nuw nsw i32 %37, %invariant.op
  store i32 %25, ptr @flash_index_5_4, align 4
  store i32 %.reass, ptr getelementptr inbounds nuw (i8, ptr @flash_index_5_4, i20 4), align 4
  br i1 %cond5, label %44, label %38

38:                                               ; preds = %32
  tail call void @llvm.aie2p.acquire(i32 5, i32 -1)
  %cond6 = icmp eq i32 %34, 1
  %spec.select22 = select i1 %cond6, ptr @flash_scale_5_3_5_4_buff_1, ptr @flash_scale_5_3_5_4_buff_0
  tail call void @op0_matmul_PV(ptr nonnull %.pn20, ptr nonnull %spec.select, ptr nonnull %spec.select21, ptr nonnull %spec.select22, i32 64, i32 %27, ptr nonnull @flash_index_5_4)
  br i1 %28, label %39, label %40

39:                                               ; preds = %38
  tail call void @op0_rescale_O(ptr nonnull %spec.select21, ptr nonnull %spec.select22, i32 64, ptr nonnull @flash_index_5_4)
  br label %40

40:                                               ; preds = %39, %38
  tail call void @llvm.aie2p.release(i32 4, i32 1)
  %41 = add i32 %34, 1
  %42 = icmp sgt i32 %41, 1
  %43 = select i1 %42, i32 0, i32 %41
  br label %50

44:                                               ; preds = %32
  tail call void @llvm.aie2p.acquire(i32 37, i32 -1)
  %cond7 = icmp eq i32 %33, 1
  %spec.select23 = select i1 %cond7, ptr @flash_scale_5_5_5_4_buff_1, ptr @flash_scale_5_5_5_4_buff_0
  tail call void @op0_matmul_PV(ptr nonnull %.pn20, ptr nonnull %spec.select, ptr nonnull %spec.select21, ptr nonnull %spec.select23, i32 64, i32 %30, ptr nonnull @flash_index_5_4)
  br i1 %31, label %45, label %46

45:                                               ; preds = %44
  tail call void @op0_rescale_O(ptr nonnull %spec.select21, ptr nonnull %spec.select23, i32 64, ptr nonnull @flash_index_5_4)
  br label %46

46:                                               ; preds = %45, %44
  tail call void @llvm.aie2p.release(i32 36, i32 1)
  %47 = add i32 %33, 1
  %48 = icmp sgt i32 %47, 1
  %49 = select i1 %48, i32 0, i32 %47
  br label %50

50:                                               ; preds = %46, %40
  %51 = phi i32 [ %34, %46 ], [ %43, %40 ]
  %52 = phi i32 [ %49, %46 ], [ %33, %40 ]
  %53 = add nuw nsw i64 %35, 1
  %54 = icmp eq i64 %35, 0
  br i1 %54, label %32, label %55

55:                                               ; preds = %50
  tail call void @llvm.aie2p.release(i32 0, i32 1)
  %56 = add i32 %20, 1
  %57 = icmp sgt i32 %56, 1
  %58 = select i1 %57, i32 0, i32 %56
  tail call void @llvm.aie2p.release(i32 32, i32 1)
  %59 = add i32 %19, 1
  %60 = icmp sgt i32 %59, 1
  %61 = select i1 %60, i32 0, i32 %59
  tail call void @llvm.aie2p.release(i32 50, i32 1)
  %62 = add i32 %21, 1
  %63 = icmp sgt i32 %62, 1
  %64 = select i1 %63, i32 0, i32 %62
  %65 = add nuw nsw i64 %22, 1
  %66 = icmp samesign ult i64 %22, 31
  br i1 %66, label %16, label %67

67:                                               ; preds = %55
  tail call void @llvm.aie2p.release(i32 49, i32 2)
  %68 = add nuw nsw i64 %13, 1
  %69 = icmp eq i64 %13, 0
  br i1 %69, label %7, label %70

70:                                               ; preds = %67
  %71 = add nuw nsw i64 %6, 1
  %72 = icmp samesign ult i64 %6, 4294967294
  br i1 %72, label %.preheader, label %73

73:                                               ; preds = %70
  ret void
}

attributes #0 = { mustprogress nocallback nofree nosync nounwind willreturn }

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
