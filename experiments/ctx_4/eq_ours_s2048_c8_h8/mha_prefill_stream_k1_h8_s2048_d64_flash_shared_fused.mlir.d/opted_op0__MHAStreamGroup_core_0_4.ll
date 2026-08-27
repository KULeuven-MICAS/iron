; ModuleID = '/home/micas/iron-stream-dse/experiments/ctx_4/eq_ours_s2048_c8_h8/mha_prefill_stream_k1_h8_s2048_d64_flash_shared_fused.mlir.d/peano-linked_op0__MHAStreamGroup_core_0_4.ll'
source_filename = "LLVMDialectModule"
target datalayout = "e-m:e-p:20:32-i1:8:32-i8:8:32-i16:16:32-i32:32:32-f32:32:32-i64:32-f64:32-a:0:32-n32"
target triple = "aie2p"

@flash_index_0_4 = external global [2 x i32]
@flash_scale_0_3_buff_3 = external global [256 x bfloat]
@flash_scale_0_3_buff_2 = external global [256 x bfloat]
@flash_scale_0_3_buff_1 = external global [256 x bfloat]
@flash_scale_0_3_buff_0 = external global [256 x bfloat]
@flash_scale_0_5_buff_3 = external global [256 x bfloat]
@flash_scale_0_5_buff_2 = external global [256 x bfloat]
@flash_scale_0_5_buff_1 = external global [256 x bfloat]
@flash_scale_0_5_buff_0 = external global [256 x bfloat]
@of_5_broadcast_0_0_0_cons_buff_3 = external global [64 x [64 x bfloat]]
@of_5_broadcast_0_0_0_cons_buff_2 = external global [64 x [64 x bfloat]]
@of_5_broadcast_0_0_0_cons_buff_1 = external global [64 x [64 x bfloat]]
@of_5_broadcast_0_0_0_cons_buff_0 = external global [64 x [64 x bfloat]]
@of_8_switch_join_0_0_buff_1 = external global [64 x [64 x bfloat]]
@of_8_switch_join_0_0_buff_0 = external global [64 x [64 x bfloat]]
@of_8_switch_join_0_1_buff_1 = external global [64 x [64 x bfloat]]
@of_8_switch_join_0_1_buff_0 = external global [64 x [64 x bfloat]]
@of_9_unicast_0_buff_1 = external global [64 x [64 x bfloat]]
@of_9_unicast_0_buff_0 = external global [64 x [64 x bfloat]]
@switch.table.core_0_4 = private unnamed_addr constant [3 x ptr] [ptr @of_5_broadcast_0_0_0_cons_buff_1, ptr @of_5_broadcast_0_0_0_cons_buff_2, ptr @of_5_broadcast_0_0_0_cons_buff_3], align 4
@switch.table.core_0_4.1 = private unnamed_addr constant [3 x ptr] [ptr @flash_scale_0_3_buff_1, ptr @flash_scale_0_3_buff_2, ptr @flash_scale_0_3_buff_3], align 4
@switch.table.core_0_4.2 = private unnamed_addr constant [3 x ptr] [ptr @flash_scale_0_5_buff_1, ptr @flash_scale_0_5_buff_2, ptr @flash_scale_0_5_buff_3], align 4

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.aie2p.acquire(i32, i32) #0

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.aie2p.release(i32, i32) #0

declare void @op0_rescale_O(ptr, ptr, i32, ptr) local_unnamed_addr

declare void @op0_zero_bf16(ptr) local_unnamed_addr

declare void @op0_matmul_PV(ptr, ptr, ptr, ptr, i32, i32, ptr) local_unnamed_addr

define void @core_0_4() local_unnamed_addr {
  br label %.preheader

.preheader:                                       ; preds = %0, %82
  %1 = phi i32 [ 0, %0 ], [ %64, %82 ]
  %2 = phi i32 [ 0, %0 ], [ %63, %82 ]
  %3 = phi i32 [ 0, %0 ], [ %73, %82 ]
  %4 = phi i32 [ 0, %0 ], [ %70, %82 ]
  %5 = phi i32 [ 0, %0 ], [ %76, %82 ]
  %6 = phi i64 [ 0, %0 ], [ %83, %82 ]
  br label %7

7:                                                ; preds = %.preheader, %79
  %8 = phi i32 [ %1, %.preheader ], [ %64, %79 ]
  %9 = phi i32 [ %2, %.preheader ], [ %63, %79 ]
  %10 = phi i32 [ %3, %.preheader ], [ %73, %79 ]
  %11 = phi i32 [ %4, %.preheader ], [ %70, %79 ]
  %12 = phi i32 [ %5, %.preheader ], [ %76, %79 ]
  %13 = phi i64 [ 0, %.preheader ], [ %80, %79 ]
  tail call void @llvm.aie2p.acquire(i32 48, i32 -2)
  tail call void @op0_zero_bf16(ptr nonnull @of_9_unicast_0_buff_0)
  tail call void @op0_zero_bf16(ptr nonnull @of_9_unicast_0_buff_1)
  %14 = trunc nuw nsw i64 %13 to i32
  %15 = shl nuw nsw i32 %14, 4
  br label %16

16:                                               ; preds = %7, %67
  %17 = phi i32 [ %8, %7 ], [ %64, %67 ]
  %18 = phi i32 [ %9, %7 ], [ %63, %67 ]
  %19 = phi i32 [ %10, %7 ], [ %73, %67 ]
  %20 = phi i32 [ %11, %7 ], [ %70, %67 ]
  %21 = phi i32 [ %12, %7 ], [ %76, %67 ]
  %22 = phi i64 [ 0, %7 ], [ %77, %67 ]
  tail call void @llvm.aie2p.acquire(i32 51, i32 -1)
  %switch.tableidx = add i32 %21, -1
  %23 = icmp ult i32 %switch.tableidx, 3
  br i1 %23, label %switch.lookup, label %25

switch.lookup:                                    ; preds = %16
  %24 = trunc nuw i32 %switch.tableidx to i20
  %switch.gep = getelementptr inbounds nuw [3 x ptr], ptr @switch.table.core_0_4, i20 0, i20 %24
  %switch.load = load ptr, ptr %switch.gep, align 4
  br label %25

25:                                               ; preds = %switch.lookup, %16
  %26 = phi ptr [ @of_5_broadcast_0_0_0_cons_buff_0, %16 ], [ %switch.load, %switch.lookup ]
  tail call void @llvm.aie2p.acquire(i32 1, i32 -1)
  tail call void @llvm.aie2p.acquire(i32 33, i32 -1)
  %cond2 = icmp eq i32 %20, 1
  %spec.select = select i1 %cond2, ptr @of_8_switch_join_0_0_buff_1, ptr @of_8_switch_join_0_0_buff_0
  %cond3 = icmp eq i32 %19, 1
  %27 = select i1 %cond3, ptr @of_8_switch_join_0_1_buff_1, ptr @of_8_switch_join_0_1_buff_0
  %28 = trunc nuw nsw i64 %22 to i32
  %29 = icmp ne i32 %28, 0
  %30 = zext i1 %29 to i32
  %31 = icmp eq i32 %28, 31
  %32 = icmp ne i32 %28, 0
  %33 = zext i1 %32 to i32
  %34 = icmp eq i32 %28, 31
  br label %35

35:                                               ; preds = %25, %62
  %36 = phi i32 [ %17, %25 ], [ %64, %62 ]
  %37 = phi i32 [ %18, %25 ], [ %63, %62 ]
  %38 = phi i64 [ 0, %25 ], [ %65, %62 ]
  %cond4 = icmp eq i64 %38, 1
  %spec.select18 = select i1 %cond4, ptr @of_9_unicast_0_buff_1, ptr @of_9_unicast_0_buff_0
  %.pn17 = select i1 %cond4, ptr %27, ptr %spec.select
  %39 = trunc nuw nsw i64 %38 to i32
  %40 = shl nuw nsw i32 %39, 3
  %41 = add nuw nsw i32 %40, %15
  store i32 %28, ptr @flash_index_0_4, align 4
  store i32 %41, ptr getelementptr inbounds nuw (i8, ptr @flash_index_0_4, i20 4), align 4
  br i1 %cond4, label %52, label %42

42:                                               ; preds = %35
  tail call void @llvm.aie2p.acquire(i32 5, i32 -1)
  %switch.tableidx39 = add i32 %37, -1
  %43 = icmp ult i32 %switch.tableidx39, 3
  br i1 %43, label %switch.lookup38, label %45

switch.lookup38:                                  ; preds = %42
  %44 = trunc nuw i32 %switch.tableidx39 to i20
  %switch.gep40 = getelementptr inbounds nuw [3 x ptr], ptr @switch.table.core_0_4.1, i20 0, i20 %44
  %switch.load41 = load ptr, ptr %switch.gep40, align 4
  br label %45

45:                                               ; preds = %switch.lookup38, %42
  %46 = phi ptr [ @flash_scale_0_3_buff_0, %42 ], [ %switch.load41, %switch.lookup38 ]
  tail call void @op0_matmul_PV(ptr nonnull %.pn17, ptr nonnull %26, ptr nonnull %spec.select18, ptr nonnull %46, i32 64, i32 %30, ptr nonnull @flash_index_0_4)
  br i1 %31, label %47, label %48

47:                                               ; preds = %45
  tail call void @op0_rescale_O(ptr nonnull %spec.select18, ptr nonnull %46, i32 64, ptr nonnull @flash_index_0_4)
  br label %48

48:                                               ; preds = %47, %45
  tail call void @llvm.aie2p.release(i32 4, i32 1)
  %49 = add i32 %37, 1
  %50 = icmp sgt i32 %49, 3
  %51 = select i1 %50, i32 0, i32 %49
  br label %62

52:                                               ; preds = %35
  tail call void @llvm.aie2p.acquire(i32 37, i32 -1)
  %switch.tableidx43 = add i32 %36, -1
  %53 = icmp ult i32 %switch.tableidx43, 3
  br i1 %53, label %switch.lookup42, label %55

switch.lookup42:                                  ; preds = %52
  %54 = trunc nuw i32 %switch.tableidx43 to i20
  %switch.gep44 = getelementptr inbounds nuw [3 x ptr], ptr @switch.table.core_0_4.2, i20 0, i20 %54
  %switch.load45 = load ptr, ptr %switch.gep44, align 4
  br label %55

55:                                               ; preds = %switch.lookup42, %52
  %56 = phi ptr [ @flash_scale_0_5_buff_0, %52 ], [ %switch.load45, %switch.lookup42 ]
  tail call void @op0_matmul_PV(ptr nonnull %.pn17, ptr nonnull %26, ptr nonnull %spec.select18, ptr nonnull %56, i32 64, i32 %33, ptr nonnull @flash_index_0_4)
  br i1 %34, label %57, label %58

57:                                               ; preds = %55
  tail call void @op0_rescale_O(ptr nonnull %spec.select18, ptr nonnull %56, i32 64, ptr nonnull @flash_index_0_4)
  br label %58

58:                                               ; preds = %57, %55
  tail call void @llvm.aie2p.release(i32 36, i32 1)
  %59 = add i32 %36, 1
  %60 = icmp sgt i32 %59, 3
  %61 = select i1 %60, i32 0, i32 %59
  br label %62

62:                                               ; preds = %58, %48
  %63 = phi i32 [ %37, %58 ], [ %51, %48 ]
  %64 = phi i32 [ %61, %58 ], [ %36, %48 ]
  %65 = add nuw nsw i64 %38, 1
  %66 = icmp eq i64 %38, 0
  br i1 %66, label %35, label %67

67:                                               ; preds = %62
  tail call void @llvm.aie2p.release(i32 0, i32 1)
  %68 = add i32 %20, 1
  %69 = icmp sgt i32 %68, 1
  %70 = select i1 %69, i32 0, i32 %68
  tail call void @llvm.aie2p.release(i32 32, i32 1)
  %71 = add i32 %19, 1
  %72 = icmp sgt i32 %71, 1
  %73 = select i1 %72, i32 0, i32 %71
  tail call void @llvm.aie2p.release(i32 50, i32 1)
  %74 = add i32 %21, 1
  %75 = icmp sgt i32 %74, 3
  %76 = select i1 %75, i32 0, i32 %74
  %77 = add nuw nsw i64 %22, 1
  %78 = icmp samesign ult i64 %22, 31
  br i1 %78, label %16, label %79

79:                                               ; preds = %67
  tail call void @llvm.aie2p.release(i32 49, i32 2)
  %80 = add nuw nsw i64 %13, 1
  %81 = icmp eq i64 %13, 0
  br i1 %81, label %7, label %82

82:                                               ; preds = %79
  %83 = add nuw nsw i64 %6, 1
  %84 = icmp samesign ult i64 %6, 4294967294
  br i1 %84, label %.preheader, label %85

85:                                               ; preds = %82
  ret void
}

attributes #0 = { mustprogress nocallback nofree nosync nounwind willreturn }

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
