; ModuleID = '/home/micas/iron-stream-dse/experiments/ctx_4/eq_ours_s2048_c8_h8/mha_prefill_stream_k1_h8_s2048_d64_flash_shared_fused.mlir.d/peano-linked_op0__MHAStreamGroup_core_4_4.ll'
source_filename = "LLVMDialectModule"
target datalayout = "e-m:e-p:20:32-i1:8:32-i8:8:32-i16:16:32-i32:32:32-f32:32:32-i64:32-f64:32-a:0:32-n32"
target triple = "aie2p"

@flash_index_4_4 = external global [2 x i32]
@flash_scale_4_3_buff_3 = external global [256 x bfloat]
@flash_scale_4_3_buff_2 = external global [256 x bfloat]
@flash_scale_4_3_buff_1 = external global [256 x bfloat]
@flash_scale_4_3_buff_0 = external global [256 x bfloat]
@flash_scale_4_5_buff_3 = external global [256 x bfloat]
@flash_scale_4_5_buff_2 = external global [256 x bfloat]
@flash_scale_4_5_buff_1 = external global [256 x bfloat]
@flash_scale_4_5_buff_0 = external global [256 x bfloat]
@of_5_broadcast_0_0_4_cons_buff_3 = external global [64 x [64 x bfloat]]
@of_5_broadcast_0_0_4_cons_buff_2 = external global [64 x [64 x bfloat]]
@of_5_broadcast_0_0_4_cons_buff_1 = external global [64 x [64 x bfloat]]
@of_5_broadcast_0_0_4_cons_buff_0 = external global [64 x [64 x bfloat]]
@of_8_switch_join_4_0_buff_1 = external global [64 x [64 x bfloat]]
@of_8_switch_join_4_0_buff_0 = external global [64 x [64 x bfloat]]
@of_8_switch_join_4_1_buff_1 = external global [64 x [64 x bfloat]]
@of_8_switch_join_4_1_buff_0 = external global [64 x [64 x bfloat]]
@of_9_unicast_4_buff_1 = external global [64 x [64 x bfloat]]
@of_9_unicast_4_buff_0 = external global [64 x [64 x bfloat]]
@switch.table.core_4_4 = private unnamed_addr constant [3 x ptr] [ptr @of_5_broadcast_0_0_4_cons_buff_1, ptr @of_5_broadcast_0_0_4_cons_buff_2, ptr @of_5_broadcast_0_0_4_cons_buff_3], align 4
@switch.table.core_4_4.1 = private unnamed_addr constant [3 x ptr] [ptr @flash_scale_4_3_buff_1, ptr @flash_scale_4_3_buff_2, ptr @flash_scale_4_3_buff_3], align 4
@switch.table.core_4_4.2 = private unnamed_addr constant [3 x ptr] [ptr @flash_scale_4_5_buff_1, ptr @flash_scale_4_5_buff_2, ptr @flash_scale_4_5_buff_3], align 4

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.aie2p.acquire(i32, i32) #0

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.aie2p.release(i32, i32) #0

declare void @op0_rescale_O(ptr, ptr, i32, ptr) local_unnamed_addr

declare void @op0_zero_bf16(ptr) local_unnamed_addr

declare void @op0_matmul_PV(ptr, ptr, ptr, ptr, i32, i32, ptr) local_unnamed_addr

define void @core_4_4() local_unnamed_addr {
  br label %.preheader

.preheader:                                       ; preds = %0, %81
  %1 = phi i32 [ 0, %0 ], [ %63, %81 ]
  %2 = phi i32 [ 0, %0 ], [ %62, %81 ]
  %3 = phi i32 [ 0, %0 ], [ %72, %81 ]
  %4 = phi i32 [ 0, %0 ], [ %69, %81 ]
  %5 = phi i32 [ 0, %0 ], [ %75, %81 ]
  %6 = phi i64 [ 0, %0 ], [ %82, %81 ]
  br label %7

7:                                                ; preds = %.preheader, %78
  %8 = phi i32 [ %1, %.preheader ], [ %63, %78 ]
  %9 = phi i32 [ %2, %.preheader ], [ %62, %78 ]
  %10 = phi i32 [ %3, %.preheader ], [ %72, %78 ]
  %11 = phi i32 [ %4, %.preheader ], [ %69, %78 ]
  %12 = phi i32 [ %5, %.preheader ], [ %75, %78 ]
  %13 = phi i64 [ 0, %.preheader ], [ %79, %78 ]
  tail call void @llvm.aie2p.acquire(i32 48, i32 -2)
  tail call void @op0_zero_bf16(ptr nonnull @of_9_unicast_4_buff_0)
  tail call void @op0_zero_bf16(ptr nonnull @of_9_unicast_4_buff_1)
  %14 = trunc nuw nsw i64 %13 to i32
  %15 = shl nuw nsw i32 %14, 4
  %invariant.op = or disjoint i32 %15, 4
  br label %16

16:                                               ; preds = %7, %66
  %17 = phi i32 [ %8, %7 ], [ %63, %66 ]
  %18 = phi i32 [ %9, %7 ], [ %62, %66 ]
  %19 = phi i32 [ %10, %7 ], [ %72, %66 ]
  %20 = phi i32 [ %11, %7 ], [ %69, %66 ]
  %21 = phi i32 [ %12, %7 ], [ %75, %66 ]
  %22 = phi i64 [ 0, %7 ], [ %76, %66 ]
  tail call void @llvm.aie2p.acquire(i32 51, i32 -1)
  %switch.tableidx = add i32 %21, -1
  %23 = icmp ult i32 %switch.tableidx, 3
  br i1 %23, label %switch.lookup, label %25

switch.lookup:                                    ; preds = %16
  %24 = trunc nuw i32 %switch.tableidx to i20
  %switch.gep = getelementptr inbounds nuw [3 x ptr], ptr @switch.table.core_4_4, i20 0, i20 %24
  %switch.load = load ptr, ptr %switch.gep, align 4
  br label %25

25:                                               ; preds = %switch.lookup, %16
  %26 = phi ptr [ @of_5_broadcast_0_0_4_cons_buff_0, %16 ], [ %switch.load, %switch.lookup ]
  tail call void @llvm.aie2p.acquire(i32 1, i32 -1)
  tail call void @llvm.aie2p.acquire(i32 33, i32 -1)
  %cond2 = icmp eq i32 %20, 1
  %spec.select = select i1 %cond2, ptr @of_8_switch_join_4_0_buff_1, ptr @of_8_switch_join_4_0_buff_0
  %cond3 = icmp eq i32 %19, 1
  %27 = select i1 %cond3, ptr @of_8_switch_join_4_1_buff_1, ptr @of_8_switch_join_4_1_buff_0
  %28 = trunc nuw nsw i64 %22 to i32
  %29 = icmp ne i32 %28, 0
  %30 = zext i1 %29 to i32
  %31 = icmp eq i32 %28, 31
  %32 = icmp ne i32 %28, 0
  %33 = zext i1 %32 to i32
  %34 = icmp eq i32 %28, 31
  br label %35

35:                                               ; preds = %25, %61
  %36 = phi i32 [ %17, %25 ], [ %63, %61 ]
  %37 = phi i32 [ %18, %25 ], [ %62, %61 ]
  %38 = phi i64 [ 0, %25 ], [ %64, %61 ]
  %cond4 = icmp eq i64 %38, 1
  %spec.select18 = select i1 %cond4, ptr @of_9_unicast_4_buff_1, ptr @of_9_unicast_4_buff_0
  %.pn17 = select i1 %cond4, ptr %27, ptr %spec.select
  %39 = trunc nuw nsw i64 %38 to i32
  %40 = shl nuw nsw i32 %39, 3
  %.reass = add nuw nsw i32 %40, %invariant.op
  store i32 %28, ptr @flash_index_4_4, align 4
  store i32 %.reass, ptr getelementptr inbounds nuw (i8, ptr @flash_index_4_4, i20 4), align 4
  br i1 %cond4, label %51, label %41

41:                                               ; preds = %35
  tail call void @llvm.aie2p.acquire(i32 5, i32 -1)
  %switch.tableidx39 = add i32 %37, -1
  %42 = icmp ult i32 %switch.tableidx39, 3
  br i1 %42, label %switch.lookup38, label %44

switch.lookup38:                                  ; preds = %41
  %43 = trunc nuw i32 %switch.tableidx39 to i20
  %switch.gep40 = getelementptr inbounds nuw [3 x ptr], ptr @switch.table.core_4_4.1, i20 0, i20 %43
  %switch.load41 = load ptr, ptr %switch.gep40, align 4
  br label %44

44:                                               ; preds = %switch.lookup38, %41
  %45 = phi ptr [ @flash_scale_4_3_buff_0, %41 ], [ %switch.load41, %switch.lookup38 ]
  tail call void @op0_matmul_PV(ptr nonnull %.pn17, ptr nonnull %26, ptr nonnull %spec.select18, ptr nonnull %45, i32 64, i32 %30, ptr nonnull @flash_index_4_4)
  br i1 %31, label %46, label %47

46:                                               ; preds = %44
  tail call void @op0_rescale_O(ptr nonnull %spec.select18, ptr nonnull %45, i32 64, ptr nonnull @flash_index_4_4)
  br label %47

47:                                               ; preds = %46, %44
  tail call void @llvm.aie2p.release(i32 4, i32 1)
  %48 = add i32 %37, 1
  %49 = icmp sgt i32 %48, 3
  %50 = select i1 %49, i32 0, i32 %48
  br label %61

51:                                               ; preds = %35
  tail call void @llvm.aie2p.acquire(i32 37, i32 -1)
  %switch.tableidx43 = add i32 %36, -1
  %52 = icmp ult i32 %switch.tableidx43, 3
  br i1 %52, label %switch.lookup42, label %54

switch.lookup42:                                  ; preds = %51
  %53 = trunc nuw i32 %switch.tableidx43 to i20
  %switch.gep44 = getelementptr inbounds nuw [3 x ptr], ptr @switch.table.core_4_4.2, i20 0, i20 %53
  %switch.load45 = load ptr, ptr %switch.gep44, align 4
  br label %54

54:                                               ; preds = %switch.lookup42, %51
  %55 = phi ptr [ @flash_scale_4_5_buff_0, %51 ], [ %switch.load45, %switch.lookup42 ]
  tail call void @op0_matmul_PV(ptr nonnull %.pn17, ptr nonnull %26, ptr nonnull %spec.select18, ptr nonnull %55, i32 64, i32 %33, ptr nonnull @flash_index_4_4)
  br i1 %34, label %56, label %57

56:                                               ; preds = %54
  tail call void @op0_rescale_O(ptr nonnull %spec.select18, ptr nonnull %55, i32 64, ptr nonnull @flash_index_4_4)
  br label %57

57:                                               ; preds = %56, %54
  tail call void @llvm.aie2p.release(i32 36, i32 1)
  %58 = add i32 %36, 1
  %59 = icmp sgt i32 %58, 3
  %60 = select i1 %59, i32 0, i32 %58
  br label %61

61:                                               ; preds = %57, %47
  %62 = phi i32 [ %37, %57 ], [ %50, %47 ]
  %63 = phi i32 [ %60, %57 ], [ %36, %47 ]
  %64 = add nuw nsw i64 %38, 1
  %65 = icmp eq i64 %38, 0
  br i1 %65, label %35, label %66

66:                                               ; preds = %61
  tail call void @llvm.aie2p.release(i32 0, i32 1)
  %67 = add i32 %20, 1
  %68 = icmp sgt i32 %67, 1
  %69 = select i1 %68, i32 0, i32 %67
  tail call void @llvm.aie2p.release(i32 32, i32 1)
  %70 = add i32 %19, 1
  %71 = icmp sgt i32 %70, 1
  %72 = select i1 %71, i32 0, i32 %70
  tail call void @llvm.aie2p.release(i32 50, i32 1)
  %73 = add i32 %21, 1
  %74 = icmp sgt i32 %73, 3
  %75 = select i1 %74, i32 0, i32 %73
  %76 = add nuw nsw i64 %22, 1
  %77 = icmp samesign ult i64 %22, 31
  br i1 %77, label %16, label %78

78:                                               ; preds = %66
  tail call void @llvm.aie2p.release(i32 49, i32 2)
  %79 = add nuw nsw i64 %13, 1
  %80 = icmp eq i64 %13, 0
  br i1 %80, label %7, label %81

81:                                               ; preds = %78
  %82 = add nuw nsw i64 %6, 1
  %83 = icmp samesign ult i64 %6, 4294967294
  br i1 %83, label %.preheader, label %84

84:                                               ; preds = %81
  ret void
}

attributes #0 = { mustprogress nocallback nofree nosync nounwind willreturn }

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
