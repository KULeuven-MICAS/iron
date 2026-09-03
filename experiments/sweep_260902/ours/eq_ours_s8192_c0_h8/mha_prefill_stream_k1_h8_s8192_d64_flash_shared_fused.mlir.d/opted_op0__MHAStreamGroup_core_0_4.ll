; ModuleID = '/home/micas/iron-stream-dse/experiments/sweep_260902/ours/eq_ours_s8192_c0_h8/mha_prefill_stream_k1_h8_s8192_d64_flash_shared_fused.mlir.d/peano-linked_op0__MHAStreamGroup_core_0_4.ll'
source_filename = "LLVMDialectModule"
target datalayout = "e-m:e-p:20:32-i1:8:32-i8:8:32-i16:16:32-i32:32:32-f32:32:32-i64:32-f64:32-a:0:32-n32"
target triple = "aie2p"

@flash_index_0_4 = external global [2 x i32]
@flash_scale_0_3_0_4_buff_1 = external global [256 x bfloat]
@flash_scale_0_3_0_4_buff_0 = external global [256 x bfloat]
@flash_scale_0_5_0_4_buff_1 = external global [256 x bfloat]
@flash_scale_0_5_0_4_buff_0 = external global [256 x bfloat]
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
  br label %.preheader

.preheader:                                       ; preds = %0, %71
  %1 = phi i32 [ 0, %0 ], [ %53, %71 ]
  %2 = phi i32 [ 0, %0 ], [ %52, %71 ]
  %3 = phi i32 [ 0, %0 ], [ %62, %71 ]
  %4 = phi i32 [ 0, %0 ], [ %59, %71 ]
  %5 = phi i32 [ 0, %0 ], [ %65, %71 ]
  %6 = phi i64 [ 0, %0 ], [ %72, %71 ]
  br label %7

7:                                                ; preds = %.preheader, %68
  %8 = phi i32 [ %1, %.preheader ], [ %53, %68 ]
  %9 = phi i32 [ %2, %.preheader ], [ %52, %68 ]
  %10 = phi i32 [ %3, %.preheader ], [ %62, %68 ]
  %11 = phi i32 [ %4, %.preheader ], [ %59, %68 ]
  %12 = phi i32 [ %5, %.preheader ], [ %65, %68 ]
  %13 = phi i64 [ 0, %.preheader ], [ %69, %68 ]
  tail call void @llvm.aie2p.acquire(i32 48, i32 -2)
  tail call void @op0_zero_bf16(ptr nonnull @of_9_unicast_0_buff_0)
  tail call void @op0_zero_bf16(ptr nonnull @of_9_unicast_0_buff_1)
  %14 = trunc nuw nsw i64 %13 to i32
  %15 = shl nuw nsw i32 %14, 4
  br label %16

16:                                               ; preds = %7, %56
  %17 = phi i32 [ %8, %7 ], [ %53, %56 ]
  %18 = phi i32 [ %9, %7 ], [ %52, %56 ]
  %19 = phi i32 [ %10, %7 ], [ %62, %56 ]
  %20 = phi i32 [ %11, %7 ], [ %59, %56 ]
  %21 = phi i32 [ %12, %7 ], [ %65, %56 ]
  %22 = phi i64 [ 0, %7 ], [ %66, %56 ]
  tail call void @llvm.aie2p.acquire(i32 51, i32 -1)
  %cond2 = icmp eq i32 %21, 1
  %spec.select = select i1 %cond2, ptr @of_5_broadcast_0_0_0_cons_buff_1, ptr @of_5_broadcast_0_0_0_cons_buff_0
  tail call void @llvm.aie2p.acquire(i32 1, i32 -1)
  tail call void @llvm.aie2p.acquire(i32 33, i32 -1)
  %cond3 = icmp eq i32 %20, 1
  %23 = select i1 %cond3, ptr @of_8_switch_join_0_0_buff_1, ptr @of_8_switch_join_0_0_buff_0
  %cond4 = icmp eq i32 %19, 1
  %24 = select i1 %cond4, ptr @of_8_switch_join_0_1_buff_1, ptr @of_8_switch_join_0_1_buff_0
  %25 = trunc nuw nsw i64 %22 to i32
  %26 = icmp ne i32 %25, 0
  %27 = zext i1 %26 to i32
  %28 = icmp eq i32 %25, 127
  %29 = icmp ne i32 %25, 0
  %30 = zext i1 %29 to i32
  %31 = icmp eq i32 %25, 127
  br label %32

32:                                               ; preds = %16, %51
  %33 = phi i32 [ %17, %16 ], [ %53, %51 ]
  %34 = phi i32 [ %18, %16 ], [ %52, %51 ]
  %35 = phi i64 [ 0, %16 ], [ %54, %51 ]
  %cond5 = icmp eq i64 %35, 1
  %spec.select21 = select i1 %cond5, ptr @of_9_unicast_0_buff_1, ptr @of_9_unicast_0_buff_0
  %.pn20 = select i1 %cond5, ptr %24, ptr %23
  %36 = trunc nuw nsw i64 %35 to i32
  %37 = shl nuw nsw i32 %36, 3
  %38 = add nuw nsw i32 %37, %15
  store i32 %25, ptr @flash_index_0_4, align 4
  store i32 %38, ptr getelementptr inbounds nuw (i8, ptr @flash_index_0_4, i20 4), align 4
  br i1 %cond5, label %45, label %39

39:                                               ; preds = %32
  tail call void @llvm.aie2p.acquire(i32 5, i32 -1)
  %cond6 = icmp eq i32 %34, 1
  %spec.select22 = select i1 %cond6, ptr @flash_scale_0_3_0_4_buff_1, ptr @flash_scale_0_3_0_4_buff_0
  tail call void @op0_matmul_PV(ptr nonnull %.pn20, ptr nonnull %spec.select, ptr nonnull %spec.select21, ptr nonnull %spec.select22, i32 64, i32 %27, ptr nonnull @flash_index_0_4)
  br i1 %28, label %40, label %41

40:                                               ; preds = %39
  tail call void @op0_rescale_O(ptr nonnull %spec.select21, ptr nonnull %spec.select22, i32 64, ptr nonnull @flash_index_0_4)
  br label %41

41:                                               ; preds = %40, %39
  tail call void @llvm.aie2p.release(i32 4, i32 1)
  %42 = add i32 %34, 1
  %43 = icmp sgt i32 %42, 1
  %44 = select i1 %43, i32 0, i32 %42
  br label %51

45:                                               ; preds = %32
  tail call void @llvm.aie2p.acquire(i32 37, i32 -1)
  %cond7 = icmp eq i32 %33, 1
  %spec.select23 = select i1 %cond7, ptr @flash_scale_0_5_0_4_buff_1, ptr @flash_scale_0_5_0_4_buff_0
  tail call void @op0_matmul_PV(ptr nonnull %.pn20, ptr nonnull %spec.select, ptr nonnull %spec.select21, ptr nonnull %spec.select23, i32 64, i32 %30, ptr nonnull @flash_index_0_4)
  br i1 %31, label %46, label %47

46:                                               ; preds = %45
  tail call void @op0_rescale_O(ptr nonnull %spec.select21, ptr nonnull %spec.select23, i32 64, ptr nonnull @flash_index_0_4)
  br label %47

47:                                               ; preds = %46, %45
  tail call void @llvm.aie2p.release(i32 36, i32 1)
  %48 = add i32 %33, 1
  %49 = icmp sgt i32 %48, 1
  %50 = select i1 %49, i32 0, i32 %48
  br label %51

51:                                               ; preds = %47, %41
  %52 = phi i32 [ %34, %47 ], [ %44, %41 ]
  %53 = phi i32 [ %50, %47 ], [ %33, %41 ]
  %54 = add nuw nsw i64 %35, 1
  %55 = icmp eq i64 %35, 0
  br i1 %55, label %32, label %56

56:                                               ; preds = %51
  tail call void @llvm.aie2p.release(i32 0, i32 1)
  %57 = add i32 %20, 1
  %58 = icmp sgt i32 %57, 1
  %59 = select i1 %58, i32 0, i32 %57
  tail call void @llvm.aie2p.release(i32 32, i32 1)
  %60 = add i32 %19, 1
  %61 = icmp sgt i32 %60, 1
  %62 = select i1 %61, i32 0, i32 %60
  tail call void @llvm.aie2p.release(i32 50, i32 1)
  %63 = add i32 %21, 1
  %64 = icmp sgt i32 %63, 1
  %65 = select i1 %64, i32 0, i32 %63
  %66 = add nuw nsw i64 %22, 1
  %67 = icmp samesign ult i64 %22, 127
  br i1 %67, label %16, label %68

68:                                               ; preds = %56
  tail call void @llvm.aie2p.release(i32 49, i32 2)
  %69 = add nuw nsw i64 %13, 1
  %70 = icmp samesign ult i64 %13, 7
  br i1 %70, label %7, label %71

71:                                               ; preds = %68
  %72 = add nuw nsw i64 %6, 1
  %73 = icmp samesign ult i64 %6, 4294967294
  br i1 %73, label %.preheader, label %74

74:                                               ; preds = %71
  ret void
}

attributes #0 = { mustprogress nocallback nofree nosync nounwind willreturn }

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
