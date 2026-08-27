; ModuleID = '/home/micas/iron-stream-dse/experiments/depth_0132_8/eq_ours_s2048_c8_h8/mha_prefill_stream_k1_h8_s2048_d64_flash_shared_fused.mlir.d/peano-linked_op0__MHAStreamGroup_core_4_4.ll'
source_filename = "LLVMDialectModule"
target datalayout = "e-m:e-p:20:32-i1:8:32-i8:8:32-i16:16:32-i32:32:32-f32:32:32-i64:32-f64:32-a:0:32-n32"
target triple = "aie2p"

@flash_index_4_4 = external global [2 x i32]
@flash_scale_4_3_buff_7 = external global [256 x bfloat]
@flash_scale_4_3_buff_6 = external global [256 x bfloat]
@flash_scale_4_3_buff_5 = external global [256 x bfloat]
@flash_scale_4_3_buff_4 = external global [256 x bfloat]
@flash_scale_4_3_buff_3 = external global [256 x bfloat]
@flash_scale_4_3_buff_2 = external global [256 x bfloat]
@flash_scale_4_3_buff_1 = external global [256 x bfloat]
@flash_scale_4_3_buff_0 = external global [256 x bfloat]
@flash_scale_4_5_buff_7 = external global [256 x bfloat]
@flash_scale_4_5_buff_6 = external global [256 x bfloat]
@flash_scale_4_5_buff_5 = external global [256 x bfloat]
@flash_scale_4_5_buff_4 = external global [256 x bfloat]
@flash_scale_4_5_buff_3 = external global [256 x bfloat]
@flash_scale_4_5_buff_2 = external global [256 x bfloat]
@flash_scale_4_5_buff_1 = external global [256 x bfloat]
@flash_scale_4_5_buff_0 = external global [256 x bfloat]
@of_5_broadcast_0_0_4_cons_buff_1 = external global [64 x [64 x bfloat]]
@of_5_broadcast_0_0_4_cons_buff_0 = external global [64 x [64 x bfloat]]
@of_8_switch_join_4_0_buff_1 = external global [64 x [64 x bfloat]]
@of_8_switch_join_4_0_buff_0 = external global [64 x [64 x bfloat]]
@of_8_switch_join_4_1_buff_1 = external global [64 x [64 x bfloat]]
@of_8_switch_join_4_1_buff_0 = external global [64 x [64 x bfloat]]
@of_9_unicast_4_buff_1 = external global [64 x [64 x bfloat]]
@of_9_unicast_4_buff_0 = external global [64 x [64 x bfloat]]
@switch.table.core_4_4 = private unnamed_addr constant [7 x ptr] [ptr @flash_scale_4_3_buff_1, ptr @flash_scale_4_3_buff_2, ptr @flash_scale_4_3_buff_3, ptr @flash_scale_4_3_buff_4, ptr @flash_scale_4_3_buff_5, ptr @flash_scale_4_3_buff_6, ptr @flash_scale_4_3_buff_7], align 4
@switch.table.core_4_4.1 = private unnamed_addr constant [7 x ptr] [ptr @flash_scale_4_5_buff_1, ptr @flash_scale_4_5_buff_2, ptr @flash_scale_4_5_buff_3, ptr @flash_scale_4_5_buff_4, ptr @flash_scale_4_5_buff_5, ptr @flash_scale_4_5_buff_6, ptr @flash_scale_4_5_buff_7], align 4

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.aie2p.acquire(i32, i32) #0

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.aie2p.release(i32, i32) #0

declare void @op0_rescale_O(ptr, ptr, i32, ptr) local_unnamed_addr

declare void @op0_zero_bf16(ptr) local_unnamed_addr

declare void @op0_matmul_PV(ptr, ptr, ptr, ptr, i32, i32, ptr) local_unnamed_addr

define void @core_4_4() local_unnamed_addr {
  br label %.preheader

.preheader:                                       ; preds = %0, %78
  %1 = phi i32 [ 0, %0 ], [ %60, %78 ]
  %2 = phi i32 [ 0, %0 ], [ %59, %78 ]
  %3 = phi i32 [ 0, %0 ], [ %69, %78 ]
  %4 = phi i32 [ 0, %0 ], [ %66, %78 ]
  %5 = phi i32 [ 0, %0 ], [ %72, %78 ]
  %6 = phi i64 [ 0, %0 ], [ %79, %78 ]
  br label %7

7:                                                ; preds = %.preheader, %75
  %8 = phi i32 [ %1, %.preheader ], [ %60, %75 ]
  %9 = phi i32 [ %2, %.preheader ], [ %59, %75 ]
  %10 = phi i32 [ %3, %.preheader ], [ %69, %75 ]
  %11 = phi i32 [ %4, %.preheader ], [ %66, %75 ]
  %12 = phi i32 [ %5, %.preheader ], [ %72, %75 ]
  %13 = phi i64 [ 0, %.preheader ], [ %76, %75 ]
  tail call void @llvm.aie2p.acquire(i32 48, i32 -2)
  tail call void @op0_zero_bf16(ptr nonnull @of_9_unicast_4_buff_0)
  tail call void @op0_zero_bf16(ptr nonnull @of_9_unicast_4_buff_1)
  %14 = trunc nuw nsw i64 %13 to i32
  %15 = shl nuw nsw i32 %14, 4
  %invariant.op = or disjoint i32 %15, 4
  br label %16

16:                                               ; preds = %7, %63
  %17 = phi i32 [ %8, %7 ], [ %60, %63 ]
  %18 = phi i32 [ %9, %7 ], [ %59, %63 ]
  %19 = phi i32 [ %10, %7 ], [ %69, %63 ]
  %20 = phi i32 [ %11, %7 ], [ %66, %63 ]
  %21 = phi i32 [ %12, %7 ], [ %72, %63 ]
  %22 = phi i64 [ 0, %7 ], [ %73, %63 ]
  tail call void @llvm.aie2p.acquire(i32 51, i32 -1)
  %cond2 = icmp eq i32 %21, 1
  %spec.select = select i1 %cond2, ptr @of_5_broadcast_0_0_4_cons_buff_1, ptr @of_5_broadcast_0_0_4_cons_buff_0
  tail call void @llvm.aie2p.acquire(i32 1, i32 -1)
  tail call void @llvm.aie2p.acquire(i32 33, i32 -1)
  %cond3 = icmp eq i32 %20, 1
  %23 = select i1 %cond3, ptr @of_8_switch_join_4_0_buff_1, ptr @of_8_switch_join_4_0_buff_0
  %cond4 = icmp eq i32 %19, 1
  %24 = select i1 %cond4, ptr @of_8_switch_join_4_1_buff_1, ptr @of_8_switch_join_4_1_buff_0
  %25 = trunc nuw nsw i64 %22 to i32
  %26 = icmp ne i32 %25, 0
  %27 = zext i1 %26 to i32
  %28 = icmp eq i32 %25, 31
  %29 = icmp ne i32 %25, 0
  %30 = zext i1 %29 to i32
  %31 = icmp eq i32 %25, 31
  br label %32

32:                                               ; preds = %16, %58
  %33 = phi i32 [ %17, %16 ], [ %60, %58 ]
  %34 = phi i32 [ %18, %16 ], [ %59, %58 ]
  %35 = phi i64 [ 0, %16 ], [ %61, %58 ]
  %cond5 = icmp eq i64 %35, 1
  %spec.select19 = select i1 %cond5, ptr @of_9_unicast_4_buff_1, ptr @of_9_unicast_4_buff_0
  %.pn18 = select i1 %cond5, ptr %24, ptr %23
  %36 = trunc nuw nsw i64 %35 to i32
  %37 = shl nuw nsw i32 %36, 3
  %.reass = add nuw nsw i32 %37, %invariant.op
  store i32 %25, ptr @flash_index_4_4, align 4
  store i32 %.reass, ptr getelementptr inbounds nuw (i8, ptr @flash_index_4_4, i20 4), align 4
  br i1 %cond5, label %48, label %38

38:                                               ; preds = %32
  tail call void @llvm.aie2p.acquire(i32 5, i32 -1)
  %switch.tableidx = add i32 %34, -1
  %39 = icmp ult i32 %switch.tableidx, 7
  br i1 %39, label %switch.lookup, label %41

switch.lookup:                                    ; preds = %38
  %40 = trunc nuw i32 %switch.tableidx to i20
  %switch.gep = getelementptr inbounds nuw [7 x ptr], ptr @switch.table.core_4_4, i20 0, i20 %40
  %switch.load = load ptr, ptr %switch.gep, align 4
  br label %41

41:                                               ; preds = %switch.lookup, %38
  %42 = phi ptr [ @flash_scale_4_3_buff_0, %38 ], [ %switch.load, %switch.lookup ]
  tail call void @op0_matmul_PV(ptr nonnull %.pn18, ptr nonnull %spec.select, ptr nonnull %spec.select19, ptr nonnull %42, i32 64, i32 %27, ptr nonnull @flash_index_4_4)
  br i1 %28, label %43, label %44

43:                                               ; preds = %41
  tail call void @op0_rescale_O(ptr nonnull %spec.select19, ptr nonnull %42, i32 64, ptr nonnull @flash_index_4_4)
  br label %44

44:                                               ; preds = %43, %41
  tail call void @llvm.aie2p.release(i32 4, i32 1)
  %45 = add i32 %34, 1
  %46 = icmp sgt i32 %45, 7
  %47 = select i1 %46, i32 0, i32 %45
  br label %58

48:                                               ; preds = %32
  tail call void @llvm.aie2p.acquire(i32 37, i32 -1)
  %switch.tableidx40 = add i32 %33, -1
  %49 = icmp ult i32 %switch.tableidx40, 7
  br i1 %49, label %switch.lookup39, label %51

switch.lookup39:                                  ; preds = %48
  %50 = trunc nuw i32 %switch.tableidx40 to i20
  %switch.gep41 = getelementptr inbounds nuw [7 x ptr], ptr @switch.table.core_4_4.1, i20 0, i20 %50
  %switch.load42 = load ptr, ptr %switch.gep41, align 4
  br label %51

51:                                               ; preds = %switch.lookup39, %48
  %52 = phi ptr [ @flash_scale_4_5_buff_0, %48 ], [ %switch.load42, %switch.lookup39 ]
  tail call void @op0_matmul_PV(ptr nonnull %.pn18, ptr nonnull %spec.select, ptr nonnull %spec.select19, ptr nonnull %52, i32 64, i32 %30, ptr nonnull @flash_index_4_4)
  br i1 %31, label %53, label %54

53:                                               ; preds = %51
  tail call void @op0_rescale_O(ptr nonnull %spec.select19, ptr nonnull %52, i32 64, ptr nonnull @flash_index_4_4)
  br label %54

54:                                               ; preds = %53, %51
  tail call void @llvm.aie2p.release(i32 36, i32 1)
  %55 = add i32 %33, 1
  %56 = icmp sgt i32 %55, 7
  %57 = select i1 %56, i32 0, i32 %55
  br label %58

58:                                               ; preds = %54, %44
  %59 = phi i32 [ %34, %54 ], [ %47, %44 ]
  %60 = phi i32 [ %57, %54 ], [ %33, %44 ]
  %61 = add nuw nsw i64 %35, 1
  %62 = icmp eq i64 %35, 0
  br i1 %62, label %32, label %63

63:                                               ; preds = %58
  tail call void @llvm.aie2p.release(i32 0, i32 1)
  %64 = add i32 %20, 1
  %65 = icmp sgt i32 %64, 1
  %66 = select i1 %65, i32 0, i32 %64
  tail call void @llvm.aie2p.release(i32 32, i32 1)
  %67 = add i32 %19, 1
  %68 = icmp sgt i32 %67, 1
  %69 = select i1 %68, i32 0, i32 %67
  tail call void @llvm.aie2p.release(i32 50, i32 1)
  %70 = add i32 %21, 1
  %71 = icmp sgt i32 %70, 1
  %72 = select i1 %71, i32 0, i32 %70
  %73 = add nuw nsw i64 %22, 1
  %74 = icmp samesign ult i64 %22, 31
  br i1 %74, label %16, label %75

75:                                               ; preds = %63
  tail call void @llvm.aie2p.release(i32 49, i32 2)
  %76 = add nuw nsw i64 %13, 1
  %77 = icmp eq i64 %13, 0
  br i1 %77, label %7, label %78

78:                                               ; preds = %75
  %79 = add nuw nsw i64 %6, 1
  %80 = icmp samesign ult i64 %6, 4294967294
  br i1 %80, label %.preheader, label %81

81:                                               ; preds = %78
  ret void
}

attributes #0 = { mustprogress nocallback nofree nosync nounwind willreturn }

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
