; ModuleID = '/home/micas/iron-stream-dse/experiments/d4_mha/mha_prefill_stream_k1_h1_s512_d64_flash_shared_fused.mlir.d/peano-linked_op0__MHAStreamGroup_core_3_4.ll'
source_filename = "LLVMDialectModule"
target datalayout = "e-m:e-p:20:32-i1:8:32-i8:8:32-i16:16:32-i32:32:32-f32:32:32-i64:32-f64:32-a:0:32-n32"
target triple = "aie2p"

@flash_index_3_4 = external global [2 x i32]
@flash_scale_3_3_3_4_buff_1 = external global [256 x bfloat]
@flash_scale_3_3_3_4_buff_0 = external global [256 x bfloat]
@flash_scale_3_5_3_4_buff_1 = external global [256 x bfloat]
@flash_scale_3_5_3_4_buff_0 = external global [256 x bfloat]
@of_5_broadcast_0_0_3_cons_buff_1 = external global [64 x [64 x bfloat]]
@of_5_broadcast_0_0_3_cons_buff_0 = external global [64 x [64 x bfloat]]
@of_8_switch_join_3_0_buff_3 = external global [64 x [64 x bfloat]]
@of_8_switch_join_3_0_buff_2 = external global [64 x [64 x bfloat]]
@of_8_switch_join_3_0_buff_1 = external global [64 x [64 x bfloat]]
@of_8_switch_join_3_0_buff_0 = external global [64 x [64 x bfloat]]
@of_8_switch_join_3_1_buff_3 = external global [64 x [64 x bfloat]]
@of_8_switch_join_3_1_buff_2 = external global [64 x [64 x bfloat]]
@of_8_switch_join_3_1_buff_1 = external global [64 x [64 x bfloat]]
@of_8_switch_join_3_1_buff_0 = external global [64 x [64 x bfloat]]
@of_9_unicast_3_buff_1 = external global [64 x [64 x bfloat]]
@of_9_unicast_3_buff_0 = external global [64 x [64 x bfloat]]
@switch.table.core_3_4 = private unnamed_addr constant [3 x ptr] [ptr @of_8_switch_join_3_0_buff_1, ptr @of_8_switch_join_3_0_buff_2, ptr @of_8_switch_join_3_0_buff_3], align 4
@switch.table.core_3_4.1 = private unnamed_addr constant [3 x ptr] [ptr @of_8_switch_join_3_1_buff_1, ptr @of_8_switch_join_3_1_buff_2, ptr @of_8_switch_join_3_1_buff_3], align 4

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.aie2p.acquire(i32, i32) #0

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.aie2p.release(i32, i32) #0

declare void @op0_rescale_O(ptr, ptr, i32, ptr) local_unnamed_addr

declare void @op0_zero_bf16(ptr) local_unnamed_addr

declare void @op0_matmul_PV(ptr, ptr, ptr, ptr, i32, i32, ptr) local_unnamed_addr

define void @core_3_4() local_unnamed_addr {
  br label %1

1:                                                ; preds = %0, %66
  %2 = phi i32 [ 0, %0 ], [ %51, %66 ]
  %3 = phi i32 [ 0, %0 ], [ %50, %66 ]
  %4 = phi i32 [ 0, %0 ], [ %60, %66 ]
  %5 = phi i32 [ 0, %0 ], [ %57, %66 ]
  %6 = phi i32 [ 0, %0 ], [ %63, %66 ]
  %7 = phi i64 [ 0, %0 ], [ %67, %66 ]
  tail call void @llvm.aie2p.acquire(i32 48, i32 -2)
  tail call void @op0_zero_bf16(ptr nonnull @of_9_unicast_3_buff_0)
  tail call void @op0_zero_bf16(ptr nonnull @of_9_unicast_3_buff_1)
  br label %8

8:                                                ; preds = %1, %54
  %9 = phi i32 [ %2, %1 ], [ %51, %54 ]
  %10 = phi i32 [ %3, %1 ], [ %50, %54 ]
  %11 = phi i32 [ %4, %1 ], [ %60, %54 ]
  %12 = phi i32 [ %5, %1 ], [ %57, %54 ]
  %13 = phi i32 [ %6, %1 ], [ %63, %54 ]
  %14 = phi i64 [ 0, %1 ], [ %64, %54 ]
  tail call void @llvm.aie2p.acquire(i32 51, i32 -1)
  %cond2 = icmp eq i32 %13, 1
  %spec.select = select i1 %cond2, ptr @of_5_broadcast_0_0_3_cons_buff_1, ptr @of_5_broadcast_0_0_3_cons_buff_0
  tail call void @llvm.aie2p.acquire(i32 1, i32 -1)
  tail call void @llvm.aie2p.acquire(i32 33, i32 -1)
  %switch.tableidx = add i32 %12, -1
  %15 = icmp ult i32 %switch.tableidx, 3
  br i1 %15, label %switch.lookup, label %17

switch.lookup:                                    ; preds = %8
  %16 = trunc nuw i32 %switch.tableidx to i20
  %switch.gep = getelementptr inbounds nuw [3 x ptr], ptr @switch.table.core_3_4, i20 0, i20 %16
  %switch.load = load ptr, ptr %switch.gep, align 4
  br label %17

17:                                               ; preds = %switch.lookup, %8
  %18 = phi ptr [ @of_8_switch_join_3_0_buff_0, %8 ], [ %switch.load, %switch.lookup ]
  %switch.tableidx37 = add i32 %11, -1
  %19 = icmp ult i32 %switch.tableidx37, 3
  br i1 %19, label %switch.lookup36, label %21

switch.lookup36:                                  ; preds = %17
  %20 = trunc nuw i32 %switch.tableidx37 to i20
  %switch.gep38 = getelementptr inbounds nuw [3 x ptr], ptr @switch.table.core_3_4.1, i20 0, i20 %20
  %switch.load39 = load ptr, ptr %switch.gep38, align 4
  br label %21

21:                                               ; preds = %switch.lookup36, %17
  %22 = phi ptr [ @of_8_switch_join_3_1_buff_0, %17 ], [ %switch.load39, %switch.lookup36 ]
  %23 = trunc nuw nsw i64 %14 to i32
  %24 = icmp ne i32 %23, 0
  %25 = zext i1 %24 to i32
  %26 = icmp eq i32 %23, 7
  %27 = icmp ne i32 %23, 0
  %28 = zext i1 %27 to i32
  %29 = icmp eq i32 %23, 7
  br label %30

30:                                               ; preds = %21, %49
  %31 = phi i32 [ %9, %21 ], [ %51, %49 ]
  %32 = phi i32 [ %10, %21 ], [ %50, %49 ]
  %33 = phi i64 [ 0, %21 ], [ %52, %49 ]
  %cond3 = icmp eq i64 %33, 1
  %spec.select19 = select i1 %cond3, ptr @of_9_unicast_3_buff_1, ptr @of_9_unicast_3_buff_0
  %.pn18 = select i1 %cond3, ptr %22, ptr %18
  %34 = trunc nuw nsw i64 %33 to i32
  %35 = shl nuw nsw i32 %34, 2
  %36 = or disjoint i32 %35, 3
  store i32 %23, ptr @flash_index_3_4, align 4
  store i32 %36, ptr getelementptr inbounds nuw (i8, ptr @flash_index_3_4, i20 4), align 4
  br i1 %cond3, label %43, label %37

37:                                               ; preds = %30
  tail call void @llvm.aie2p.acquire(i32 5, i32 -1)
  %cond4 = icmp eq i32 %32, 1
  %spec.select20 = select i1 %cond4, ptr @flash_scale_3_3_3_4_buff_1, ptr @flash_scale_3_3_3_4_buff_0
  tail call void @op0_matmul_PV(ptr nonnull %.pn18, ptr nonnull %spec.select, ptr nonnull %spec.select19, ptr nonnull %spec.select20, i32 64, i32 %25, ptr nonnull @flash_index_3_4)
  br i1 %26, label %38, label %39

38:                                               ; preds = %37
  tail call void @op0_rescale_O(ptr nonnull %spec.select19, ptr nonnull %spec.select20, i32 64, ptr nonnull @flash_index_3_4)
  br label %39

39:                                               ; preds = %38, %37
  tail call void @llvm.aie2p.release(i32 4, i32 1)
  %40 = add i32 %32, 1
  %41 = icmp sgt i32 %40, 1
  %42 = select i1 %41, i32 0, i32 %40
  br label %49

43:                                               ; preds = %30
  tail call void @llvm.aie2p.acquire(i32 37, i32 -1)
  %cond5 = icmp eq i32 %31, 1
  %spec.select21 = select i1 %cond5, ptr @flash_scale_3_5_3_4_buff_1, ptr @flash_scale_3_5_3_4_buff_0
  tail call void @op0_matmul_PV(ptr nonnull %.pn18, ptr nonnull %spec.select, ptr nonnull %spec.select19, ptr nonnull %spec.select21, i32 64, i32 %28, ptr nonnull @flash_index_3_4)
  br i1 %29, label %44, label %45

44:                                               ; preds = %43
  tail call void @op0_rescale_O(ptr nonnull %spec.select19, ptr nonnull %spec.select21, i32 64, ptr nonnull @flash_index_3_4)
  br label %45

45:                                               ; preds = %44, %43
  tail call void @llvm.aie2p.release(i32 36, i32 1)
  %46 = add i32 %31, 1
  %47 = icmp sgt i32 %46, 1
  %48 = select i1 %47, i32 0, i32 %46
  br label %49

49:                                               ; preds = %45, %39
  %50 = phi i32 [ %32, %45 ], [ %42, %39 ]
  %51 = phi i32 [ %48, %45 ], [ %31, %39 ]
  %52 = add nuw nsw i64 %33, 1
  %53 = icmp eq i64 %33, 0
  br i1 %53, label %30, label %54

54:                                               ; preds = %49
  tail call void @llvm.aie2p.release(i32 0, i32 1)
  %55 = add i32 %12, 1
  %56 = icmp sgt i32 %55, 3
  %57 = select i1 %56, i32 0, i32 %55
  tail call void @llvm.aie2p.release(i32 32, i32 1)
  %58 = add i32 %11, 1
  %59 = icmp sgt i32 %58, 3
  %60 = select i1 %59, i32 0, i32 %58
  tail call void @llvm.aie2p.release(i32 50, i32 1)
  %61 = add i32 %13, 1
  %62 = icmp sgt i32 %61, 1
  %63 = select i1 %62, i32 0, i32 %61
  %64 = add nuw nsw i64 %14, 1
  %65 = icmp samesign ult i64 %14, 7
  br i1 %65, label %8, label %66

66:                                               ; preds = %54
  tail call void @llvm.aie2p.release(i32 49, i32 2)
  %67 = add nuw nsw i64 %7, 1
  %68 = icmp samesign ult i64 %7, 4294967294
  br i1 %68, label %1, label %69

69:                                               ; preds = %66
  ret void
}

attributes #0 = { mustprogress nocallback nofree nosync nounwind willreturn }

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
