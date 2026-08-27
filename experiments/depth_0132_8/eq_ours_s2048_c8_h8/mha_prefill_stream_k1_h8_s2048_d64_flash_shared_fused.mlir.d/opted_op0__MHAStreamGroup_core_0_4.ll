; ModuleID = '/home/micas/iron-stream-dse/experiments/depth_0132_8/eq_ours_s2048_c8_h8/mha_prefill_stream_k1_h8_s2048_d64_flash_shared_fused.mlir.d/peano-linked_op0__MHAStreamGroup_core_0_4.ll'
source_filename = "LLVMDialectModule"
target datalayout = "e-m:e-p:20:32-i1:8:32-i8:8:32-i16:16:32-i32:32:32-f32:32:32-i64:32-f64:32-a:0:32-n32"
target triple = "aie2p"

@flash_index_0_4 = external global [2 x i32]
@flash_scale_0_3_buff_7 = external global [256 x bfloat]
@flash_scale_0_3_buff_6 = external global [256 x bfloat]
@flash_scale_0_3_buff_5 = external global [256 x bfloat]
@flash_scale_0_3_buff_4 = external global [256 x bfloat]
@flash_scale_0_3_buff_3 = external global [256 x bfloat]
@flash_scale_0_3_buff_2 = external global [256 x bfloat]
@flash_scale_0_3_buff_1 = external global [256 x bfloat]
@flash_scale_0_3_buff_0 = external global [256 x bfloat]
@flash_scale_0_5_buff_7 = external global [256 x bfloat]
@flash_scale_0_5_buff_6 = external global [256 x bfloat]
@flash_scale_0_5_buff_5 = external global [256 x bfloat]
@flash_scale_0_5_buff_4 = external global [256 x bfloat]
@flash_scale_0_5_buff_3 = external global [256 x bfloat]
@flash_scale_0_5_buff_2 = external global [256 x bfloat]
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
@switch.table.core_0_4 = private unnamed_addr constant [7 x ptr] [ptr @flash_scale_0_3_buff_1, ptr @flash_scale_0_3_buff_2, ptr @flash_scale_0_3_buff_3, ptr @flash_scale_0_3_buff_4, ptr @flash_scale_0_3_buff_5, ptr @flash_scale_0_3_buff_6, ptr @flash_scale_0_3_buff_7], align 4
@switch.table.core_0_4.1 = private unnamed_addr constant [7 x ptr] [ptr @flash_scale_0_5_buff_1, ptr @flash_scale_0_5_buff_2, ptr @flash_scale_0_5_buff_3, ptr @flash_scale_0_5_buff_4, ptr @flash_scale_0_5_buff_5, ptr @flash_scale_0_5_buff_6, ptr @flash_scale_0_5_buff_7], align 4

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.aie2p.acquire(i32, i32) #0

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.aie2p.release(i32, i32) #0

declare void @op0_rescale_O(ptr, ptr, i32, ptr) local_unnamed_addr

declare void @op0_zero_bf16(ptr) local_unnamed_addr

declare void @op0_matmul_PV(ptr, ptr, ptr, ptr, i32, i32, ptr) local_unnamed_addr

define void @core_0_4() local_unnamed_addr {
  br label %.preheader

.preheader:                                       ; preds = %0, %79
  %1 = phi i32 [ 0, %0 ], [ %61, %79 ]
  %2 = phi i32 [ 0, %0 ], [ %60, %79 ]
  %3 = phi i32 [ 0, %0 ], [ %70, %79 ]
  %4 = phi i32 [ 0, %0 ], [ %67, %79 ]
  %5 = phi i32 [ 0, %0 ], [ %73, %79 ]
  %6 = phi i64 [ 0, %0 ], [ %80, %79 ]
  br label %7

7:                                                ; preds = %.preheader, %76
  %8 = phi i32 [ %1, %.preheader ], [ %61, %76 ]
  %9 = phi i32 [ %2, %.preheader ], [ %60, %76 ]
  %10 = phi i32 [ %3, %.preheader ], [ %70, %76 ]
  %11 = phi i32 [ %4, %.preheader ], [ %67, %76 ]
  %12 = phi i32 [ %5, %.preheader ], [ %73, %76 ]
  %13 = phi i64 [ 0, %.preheader ], [ %77, %76 ]
  tail call void @llvm.aie2p.acquire(i32 48, i32 -2)
  tail call void @op0_zero_bf16(ptr nonnull @of_9_unicast_0_buff_0)
  tail call void @op0_zero_bf16(ptr nonnull @of_9_unicast_0_buff_1)
  %14 = trunc nuw nsw i64 %13 to i32
  %15 = shl nuw nsw i32 %14, 4
  br label %16

16:                                               ; preds = %7, %64
  %17 = phi i32 [ %8, %7 ], [ %61, %64 ]
  %18 = phi i32 [ %9, %7 ], [ %60, %64 ]
  %19 = phi i32 [ %10, %7 ], [ %70, %64 ]
  %20 = phi i32 [ %11, %7 ], [ %67, %64 ]
  %21 = phi i32 [ %12, %7 ], [ %73, %64 ]
  %22 = phi i64 [ 0, %7 ], [ %74, %64 ]
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
  %28 = icmp eq i32 %25, 31
  %29 = icmp ne i32 %25, 0
  %30 = zext i1 %29 to i32
  %31 = icmp eq i32 %25, 31
  br label %32

32:                                               ; preds = %16, %59
  %33 = phi i32 [ %17, %16 ], [ %61, %59 ]
  %34 = phi i32 [ %18, %16 ], [ %60, %59 ]
  %35 = phi i64 [ 0, %16 ], [ %62, %59 ]
  %cond5 = icmp eq i64 %35, 1
  %spec.select19 = select i1 %cond5, ptr @of_9_unicast_0_buff_1, ptr @of_9_unicast_0_buff_0
  %.pn18 = select i1 %cond5, ptr %24, ptr %23
  %36 = trunc nuw nsw i64 %35 to i32
  %37 = shl nuw nsw i32 %36, 3
  %38 = add nuw nsw i32 %37, %15
  store i32 %25, ptr @flash_index_0_4, align 4
  store i32 %38, ptr getelementptr inbounds nuw (i8, ptr @flash_index_0_4, i20 4), align 4
  br i1 %cond5, label %49, label %39

39:                                               ; preds = %32
  tail call void @llvm.aie2p.acquire(i32 5, i32 -1)
  %switch.tableidx = add i32 %34, -1
  %40 = icmp ult i32 %switch.tableidx, 7
  br i1 %40, label %switch.lookup, label %42

switch.lookup:                                    ; preds = %39
  %41 = trunc nuw i32 %switch.tableidx to i20
  %switch.gep = getelementptr inbounds nuw [7 x ptr], ptr @switch.table.core_0_4, i20 0, i20 %41
  %switch.load = load ptr, ptr %switch.gep, align 4
  br label %42

42:                                               ; preds = %switch.lookup, %39
  %43 = phi ptr [ @flash_scale_0_3_buff_0, %39 ], [ %switch.load, %switch.lookup ]
  tail call void @op0_matmul_PV(ptr nonnull %.pn18, ptr nonnull %spec.select, ptr nonnull %spec.select19, ptr nonnull %43, i32 64, i32 %27, ptr nonnull @flash_index_0_4)
  br i1 %28, label %44, label %45

44:                                               ; preds = %42
  tail call void @op0_rescale_O(ptr nonnull %spec.select19, ptr nonnull %43, i32 64, ptr nonnull @flash_index_0_4)
  br label %45

45:                                               ; preds = %44, %42
  tail call void @llvm.aie2p.release(i32 4, i32 1)
  %46 = add i32 %34, 1
  %47 = icmp sgt i32 %46, 7
  %48 = select i1 %47, i32 0, i32 %46
  br label %59

49:                                               ; preds = %32
  tail call void @llvm.aie2p.acquire(i32 37, i32 -1)
  %switch.tableidx40 = add i32 %33, -1
  %50 = icmp ult i32 %switch.tableidx40, 7
  br i1 %50, label %switch.lookup39, label %52

switch.lookup39:                                  ; preds = %49
  %51 = trunc nuw i32 %switch.tableidx40 to i20
  %switch.gep41 = getelementptr inbounds nuw [7 x ptr], ptr @switch.table.core_0_4.1, i20 0, i20 %51
  %switch.load42 = load ptr, ptr %switch.gep41, align 4
  br label %52

52:                                               ; preds = %switch.lookup39, %49
  %53 = phi ptr [ @flash_scale_0_5_buff_0, %49 ], [ %switch.load42, %switch.lookup39 ]
  tail call void @op0_matmul_PV(ptr nonnull %.pn18, ptr nonnull %spec.select, ptr nonnull %spec.select19, ptr nonnull %53, i32 64, i32 %30, ptr nonnull @flash_index_0_4)
  br i1 %31, label %54, label %55

54:                                               ; preds = %52
  tail call void @op0_rescale_O(ptr nonnull %spec.select19, ptr nonnull %53, i32 64, ptr nonnull @flash_index_0_4)
  br label %55

55:                                               ; preds = %54, %52
  tail call void @llvm.aie2p.release(i32 36, i32 1)
  %56 = add i32 %33, 1
  %57 = icmp sgt i32 %56, 7
  %58 = select i1 %57, i32 0, i32 %56
  br label %59

59:                                               ; preds = %55, %45
  %60 = phi i32 [ %34, %55 ], [ %48, %45 ]
  %61 = phi i32 [ %58, %55 ], [ %33, %45 ]
  %62 = add nuw nsw i64 %35, 1
  %63 = icmp eq i64 %35, 0
  br i1 %63, label %32, label %64

64:                                               ; preds = %59
  tail call void @llvm.aie2p.release(i32 0, i32 1)
  %65 = add i32 %20, 1
  %66 = icmp sgt i32 %65, 1
  %67 = select i1 %66, i32 0, i32 %65
  tail call void @llvm.aie2p.release(i32 32, i32 1)
  %68 = add i32 %19, 1
  %69 = icmp sgt i32 %68, 1
  %70 = select i1 %69, i32 0, i32 %68
  tail call void @llvm.aie2p.release(i32 50, i32 1)
  %71 = add i32 %21, 1
  %72 = icmp sgt i32 %71, 1
  %73 = select i1 %72, i32 0, i32 %71
  %74 = add nuw nsw i64 %22, 1
  %75 = icmp samesign ult i64 %22, 31
  br i1 %75, label %16, label %76

76:                                               ; preds = %64
  tail call void @llvm.aie2p.release(i32 49, i32 2)
  %77 = add nuw nsw i64 %13, 1
  %78 = icmp eq i64 %13, 0
  br i1 %78, label %7, label %79

79:                                               ; preds = %76
  %80 = add nuw nsw i64 %6, 1
  %81 = icmp samesign ult i64 %6, 4294967294
  br i1 %81, label %.preheader, label %82

82:                                               ; preds = %79
  ret void
}

attributes #0 = { mustprogress nocallback nofree nosync nounwind willreturn }

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
