; ModuleID = '/home/micas/iron-stream-dse/experiments/ix/mha_prefill_stream_k1_h2_s2048_d64_flash_shared_fused.mlir.d/peano-linked_op0__MHAStreamGroup_core_5_3.ll'
source_filename = "LLVMDialectModule"
target datalayout = "e-m:e-p:20:32-i1:8:32-i8:8:32-i16:16:32-i32:32:32-f32:32:32-i64:32-f64:32-a:0:32-n32"
target triple = "aie2p"

@flash_index_5_3 = external global [2 x i32]
@flash_scale_5_4_buff_1 = external global [256 x bfloat]
@flash_scale_5_4_buff_0 = external global [256 x bfloat]
@flash_scale_5_2_buff_1 = external global [256 x bfloat]
@flash_scale_5_2_buff_0 = external global [256 x bfloat]
@of_5_broadcast_0_0_5_cons_buff_1 = external global [64 x [64 x bfloat]]
@of_5_broadcast_0_0_5_cons_buff_0 = external global [64 x [64 x bfloat]]
@of_6_switch_join_5_0_buff_1 = external global [64 x [64 x bfloat]]
@of_6_switch_join_5_0_buff_0 = external global [64 x [64 x bfloat]]
@of_6_switch_join_5_1_buff_1 = external global [64 x [64 x bfloat]]
@of_6_switch_join_5_1_buff_0 = external global [64 x [64 x bfloat]]
@of_7_unicast_5_buff_1 = external global [64 x [64 x bfloat]]
@of_7_unicast_5_buff_0 = external global [64 x [64 x bfloat]]

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.aie2p.acquire(i32, i32) #0

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.aie2p.release(i32, i32) #0

declare void @op0_zero_bf16(ptr) local_unnamed_addr

declare void @op0_rescale_O(ptr, ptr, i32, ptr) local_unnamed_addr

declare void @op0_matmul_PV(ptr, ptr, ptr, ptr, i32, i32, ptr) local_unnamed_addr

define void @core_5_3() local_unnamed_addr {
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
  tail call void @op0_zero_bf16(ptr nonnull @of_7_unicast_5_buff_0)
  tail call void @op0_zero_bf16(ptr nonnull @of_7_unicast_5_buff_1)
  br label %14

14:                                               ; preds = %7, %55
  %15 = phi i32 [ %8, %7 ], [ %52, %55 ]
  %16 = phi i32 [ %9, %7 ], [ %51, %55 ]
  %17 = phi i32 [ %10, %7 ], [ %61, %55 ]
  %18 = phi i32 [ %11, %7 ], [ %58, %55 ]
  %19 = phi i32 [ %12, %7 ], [ %64, %55 ]
  %20 = phi i64 [ 0, %7 ], [ %65, %55 ]
  tail call void @llvm.aie2p.acquire(i32 51, i32 -1)
  %cond2 = icmp eq i32 %19, 1
  %spec.select = select i1 %cond2, ptr @of_5_broadcast_0_0_5_cons_buff_1, ptr @of_5_broadcast_0_0_5_cons_buff_0
  tail call void @llvm.aie2p.acquire(i32 1, i32 -1)
  tail call void @llvm.aie2p.acquire(i32 33, i32 -1)
  %cond3 = icmp eq i32 %18, 1
  %21 = select i1 %cond3, ptr @of_6_switch_join_5_0_buff_1, ptr @of_6_switch_join_5_0_buff_0
  %cond4 = icmp eq i32 %17, 1
  %22 = select i1 %cond4, ptr @of_6_switch_join_5_1_buff_1, ptr @of_6_switch_join_5_1_buff_0
  %23 = trunc nuw nsw i64 %20 to i32
  %24 = icmp ne i32 %23, 0
  %25 = zext i1 %24 to i32
  %26 = icmp eq i32 %23, 31
  %27 = icmp ne i32 %23, 0
  %28 = zext i1 %27 to i32
  %29 = icmp eq i32 %23, 31
  br label %30

30:                                               ; preds = %14, %50
  %31 = phi i32 [ %15, %14 ], [ %52, %50 ]
  %32 = phi i32 [ %16, %14 ], [ %51, %50 ]
  %33 = phi i64 [ 0, %14 ], [ %53, %50 ]
  %cond5 = icmp eq i64 %33, 1
  %spec.select21 = select i1 %cond5, ptr @of_7_unicast_5_buff_1, ptr @of_7_unicast_5_buff_0
  %.pn20 = select i1 %cond5, ptr %22, ptr %21
  %34 = trunc nuw nsw i64 %33 to i32
  %35 = mul nuw nsw i32 %34, 17
  store i32 %23, ptr @flash_index_5_3, align 4
  br i1 %cond5, label %43, label %36

36:                                               ; preds = %30
  %37 = or disjoint i32 %35, 10
  store i32 %37, ptr getelementptr inbounds nuw (i8, ptr @flash_index_5_3, i20 4), align 4
  tail call void @llvm.aie2p.acquire(i32 7, i32 -1)
  %cond6 = icmp eq i32 %32, 1
  %spec.select22 = select i1 %cond6, ptr @flash_scale_5_2_buff_1, ptr @flash_scale_5_2_buff_0
  tail call void @op0_matmul_PV(ptr nonnull %.pn20, ptr nonnull %spec.select, ptr nonnull %spec.select21, ptr nonnull %spec.select22, i32 64, i32 %25, ptr nonnull @flash_index_5_3)
  br i1 %26, label %38, label %39

38:                                               ; preds = %36
  tail call void @op0_rescale_O(ptr nonnull %spec.select21, ptr nonnull %spec.select22, i32 64, ptr nonnull @flash_index_5_3)
  br label %39

39:                                               ; preds = %38, %36
  tail call void @llvm.aie2p.release(i32 6, i32 1)
  %40 = add i32 %32, 1
  %41 = icmp sgt i32 %40, 1
  %42 = select i1 %41, i32 0, i32 %40
  br label %50

43:                                               ; preds = %30
  %44 = add nuw nsw i32 %35, 18
  store i32 %44, ptr getelementptr inbounds nuw (i8, ptr @flash_index_5_3, i20 4), align 4
  tail call void @llvm.aie2p.acquire(i32 39, i32 -1)
  %cond7 = icmp eq i32 %31, 1
  %spec.select23 = select i1 %cond7, ptr @flash_scale_5_4_buff_1, ptr @flash_scale_5_4_buff_0
  tail call void @op0_matmul_PV(ptr nonnull %.pn20, ptr nonnull %spec.select, ptr nonnull %spec.select21, ptr nonnull %spec.select23, i32 64, i32 %28, ptr nonnull @flash_index_5_3)
  br i1 %29, label %45, label %46

45:                                               ; preds = %43
  tail call void @op0_rescale_O(ptr nonnull %spec.select21, ptr nonnull %spec.select23, i32 64, ptr nonnull @flash_index_5_3)
  br label %46

46:                                               ; preds = %45, %43
  tail call void @llvm.aie2p.release(i32 38, i32 1)
  %47 = add i32 %31, 1
  %48 = icmp sgt i32 %47, 1
  %49 = select i1 %48, i32 0, i32 %47
  br label %50

50:                                               ; preds = %46, %39
  %51 = phi i32 [ %32, %46 ], [ %42, %39 ]
  %52 = phi i32 [ %49, %46 ], [ %31, %39 ]
  %53 = add nuw nsw i64 %33, 1
  %54 = icmp eq i64 %33, 0
  br i1 %54, label %30, label %55

55:                                               ; preds = %50
  tail call void @llvm.aie2p.release(i32 0, i32 1)
  %56 = add i32 %18, 1
  %57 = icmp sgt i32 %56, 1
  %58 = select i1 %57, i32 0, i32 %56
  tail call void @llvm.aie2p.release(i32 32, i32 1)
  %59 = add i32 %17, 1
  %60 = icmp sgt i32 %59, 1
  %61 = select i1 %60, i32 0, i32 %59
  tail call void @llvm.aie2p.release(i32 50, i32 1)
  %62 = add i32 %19, 1
  %63 = icmp sgt i32 %62, 1
  %64 = select i1 %63, i32 0, i32 %62
  %65 = add nuw nsw i64 %20, 1
  %66 = icmp samesign ult i64 %20, 31
  br i1 %66, label %14, label %67

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
