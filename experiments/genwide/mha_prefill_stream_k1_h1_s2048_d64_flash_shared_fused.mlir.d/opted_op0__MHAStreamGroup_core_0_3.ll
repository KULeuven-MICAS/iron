; ModuleID = '/home/micas/iron-stream-dse/experiments/genwide/mha_prefill_stream_k1_h1_s2048_d64_flash_shared_fused.mlir.d/peano-linked_op0__MHAStreamGroup_core_0_3.ll'
source_filename = "LLVMDialectModule"
target datalayout = "e-m:e-p:20:32-i1:8:32-i8:8:32-i16:16:32-i32:32:32-f32:32:32-i64:32-f64:32-a:0:32-n32"
target triple = "aie2p"

@flash_index_0_3 = external global [2 x i32]
@flash_scale_0_2_buff_1 = external global [256 x bfloat]
@flash_scale_0_2_buff_0 = external global [256 x bfloat]
@flash_scale_0_4_buff_1 = external global [256 x bfloat]
@flash_scale_0_4_buff_0 = external global [256 x bfloat]
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

define void @core_0_3() local_unnamed_addr {
  br label %.preheader

.preheader:                                       ; preds = %0, %68
  %1 = phi i32 [ 0, %0 ], [ %50, %68 ]
  %2 = phi i32 [ 0, %0 ], [ %49, %68 ]
  %3 = phi i32 [ 0, %0 ], [ %59, %68 ]
  %4 = phi i32 [ 0, %0 ], [ %56, %68 ]
  %5 = phi i32 [ 0, %0 ], [ %62, %68 ]
  %6 = phi i64 [ 0, %0 ], [ %69, %68 ]
  br label %7

7:                                                ; preds = %.preheader, %65
  %8 = phi i32 [ %1, %.preheader ], [ %50, %65 ]
  %9 = phi i32 [ %2, %.preheader ], [ %49, %65 ]
  %10 = phi i32 [ %3, %.preheader ], [ %59, %65 ]
  %11 = phi i32 [ %4, %.preheader ], [ %56, %65 ]
  %12 = phi i32 [ %5, %.preheader ], [ %62, %65 ]
  %13 = phi i64 [ 0, %.preheader ], [ %66, %65 ]
  tail call void @llvm.aie2p.acquire(i32 48, i32 -2)
  tail call void @op0_zero_bf16(ptr nonnull @of_9_unicast_0_buff_0)
  tail call void @op0_zero_bf16(ptr nonnull @of_9_unicast_0_buff_1)
  br label %14

14:                                               ; preds = %7, %53
  %15 = phi i32 [ %8, %7 ], [ %50, %53 ]
  %16 = phi i32 [ %9, %7 ], [ %49, %53 ]
  %17 = phi i32 [ %10, %7 ], [ %59, %53 ]
  %18 = phi i32 [ %11, %7 ], [ %56, %53 ]
  %19 = phi i32 [ %12, %7 ], [ %62, %53 ]
  %20 = phi i64 [ 0, %7 ], [ %63, %53 ]
  tail call void @llvm.aie2p.acquire(i32 51, i32 -1)
  %cond2 = icmp eq i32 %19, 1
  %spec.select = select i1 %cond2, ptr @of_5_broadcast_0_0_0_cons_buff_1, ptr @of_5_broadcast_0_0_0_cons_buff_0
  tail call void @llvm.aie2p.acquire(i32 1, i32 -1)
  tail call void @llvm.aie2p.acquire(i32 33, i32 -1)
  %cond3 = icmp eq i32 %18, 1
  %21 = select i1 %cond3, ptr @of_8_switch_join_0_0_buff_1, ptr @of_8_switch_join_0_0_buff_0
  %cond4 = icmp eq i32 %17, 1
  %22 = select i1 %cond4, ptr @of_8_switch_join_0_1_buff_1, ptr @of_8_switch_join_0_1_buff_0
  %23 = trunc nuw nsw i64 %20 to i32
  %24 = icmp ne i32 %23, 0
  %25 = zext i1 %24 to i32
  %26 = icmp eq i32 %23, 31
  %27 = icmp ne i32 %23, 0
  %28 = zext i1 %27 to i32
  %29 = icmp eq i32 %23, 31
  br label %30

30:                                               ; preds = %14, %48
  %31 = phi i32 [ %15, %14 ], [ %50, %48 ]
  %32 = phi i32 [ %16, %14 ], [ %49, %48 ]
  %33 = phi i64 [ 0, %14 ], [ %51, %48 ]
  %cond5 = icmp eq i64 %33, 1
  %spec.select21 = select i1 %cond5, ptr @of_9_unicast_0_buff_1, ptr @of_9_unicast_0_buff_0
  %.pn20 = select i1 %cond5, ptr %22, ptr %21
  %34 = trunc nuw nsw i64 %33 to i32
  %35 = mul nuw nsw i32 %34, 17
  store i32 %23, ptr @flash_index_0_3, align 4
  store i32 %35, ptr getelementptr inbounds nuw (i8, ptr @flash_index_0_3, i20 4), align 4
  br i1 %cond5, label %42, label %36

36:                                               ; preds = %30
  tail call void @llvm.aie2p.acquire(i32 5, i32 -1)
  %cond6 = icmp eq i32 %32, 1
  %spec.select22 = select i1 %cond6, ptr @flash_scale_0_2_buff_1, ptr @flash_scale_0_2_buff_0
  tail call void @op0_matmul_PV(ptr nonnull %.pn20, ptr nonnull %spec.select, ptr nonnull %spec.select21, ptr nonnull %spec.select22, i32 64, i32 %25, ptr nonnull @flash_index_0_3)
  br i1 %26, label %37, label %38

37:                                               ; preds = %36
  tail call void @op0_rescale_O(ptr nonnull %spec.select21, ptr nonnull %spec.select22, i32 64, ptr nonnull @flash_index_0_3)
  br label %38

38:                                               ; preds = %37, %36
  tail call void @llvm.aie2p.release(i32 4, i32 1)
  %39 = add i32 %32, 1
  %40 = icmp sgt i32 %39, 1
  %41 = select i1 %40, i32 0, i32 %39
  br label %48

42:                                               ; preds = %30
  tail call void @llvm.aie2p.acquire(i32 37, i32 -1)
  %cond7 = icmp eq i32 %31, 1
  %spec.select23 = select i1 %cond7, ptr @flash_scale_0_4_buff_1, ptr @flash_scale_0_4_buff_0
  tail call void @op0_matmul_PV(ptr nonnull %.pn20, ptr nonnull %spec.select, ptr nonnull %spec.select21, ptr nonnull %spec.select23, i32 64, i32 %28, ptr nonnull @flash_index_0_3)
  br i1 %29, label %43, label %44

43:                                               ; preds = %42
  tail call void @op0_rescale_O(ptr nonnull %spec.select21, ptr nonnull %spec.select23, i32 64, ptr nonnull @flash_index_0_3)
  br label %44

44:                                               ; preds = %43, %42
  tail call void @llvm.aie2p.release(i32 36, i32 1)
  %45 = add i32 %31, 1
  %46 = icmp sgt i32 %45, 1
  %47 = select i1 %46, i32 0, i32 %45
  br label %48

48:                                               ; preds = %44, %38
  %49 = phi i32 [ %32, %44 ], [ %41, %38 ]
  %50 = phi i32 [ %47, %44 ], [ %31, %38 ]
  %51 = add nuw nsw i64 %33, 1
  %52 = icmp eq i64 %33, 0
  br i1 %52, label %30, label %53

53:                                               ; preds = %48
  tail call void @llvm.aie2p.release(i32 0, i32 1)
  %54 = add i32 %18, 1
  %55 = icmp sgt i32 %54, 1
  %56 = select i1 %55, i32 0, i32 %54
  tail call void @llvm.aie2p.release(i32 32, i32 1)
  %57 = add i32 %17, 1
  %58 = icmp sgt i32 %57, 1
  %59 = select i1 %58, i32 0, i32 %57
  tail call void @llvm.aie2p.release(i32 50, i32 1)
  %60 = add i32 %19, 1
  %61 = icmp sgt i32 %60, 1
  %62 = select i1 %61, i32 0, i32 %60
  %63 = add nuw nsw i64 %20, 1
  %64 = icmp samesign ult i64 %20, 31
  br i1 %64, label %14, label %65

65:                                               ; preds = %53
  tail call void @llvm.aie2p.release(i32 49, i32 2)
  %66 = add nuw nsw i64 %13, 1
  %67 = icmp eq i64 %13, 0
  br i1 %67, label %7, label %68

68:                                               ; preds = %65
  %69 = add nuw nsw i64 %6, 1
  %70 = icmp samesign ult i64 %6, 4294967294
  br i1 %70, label %.preheader, label %71

71:                                               ; preds = %68
  ret void
}

attributes #0 = { mustprogress nocallback nofree nosync nounwind willreturn }

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
