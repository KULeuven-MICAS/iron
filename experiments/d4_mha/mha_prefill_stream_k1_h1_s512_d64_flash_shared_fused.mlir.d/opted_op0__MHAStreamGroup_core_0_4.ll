; ModuleID = '/home/micas/iron-stream-dse/experiments/d4_mha/mha_prefill_stream_k1_h1_s512_d64_flash_shared_fused.mlir.d/peano-linked_op0__MHAStreamGroup_core_0_4.ll'
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
@of_8_switch_join_0_0_buff_3 = external global [64 x [64 x bfloat]]
@of_8_switch_join_0_0_buff_2 = external global [64 x [64 x bfloat]]
@of_8_switch_join_0_0_buff_1 = external global [64 x [64 x bfloat]]
@of_8_switch_join_0_0_buff_0 = external global [64 x [64 x bfloat]]
@of_8_switch_join_0_1_buff_3 = external global [64 x [64 x bfloat]]
@of_8_switch_join_0_1_buff_2 = external global [64 x [64 x bfloat]]
@of_8_switch_join_0_1_buff_1 = external global [64 x [64 x bfloat]]
@of_8_switch_join_0_1_buff_0 = external global [64 x [64 x bfloat]]
@of_9_unicast_0_buff_1 = external global [64 x [64 x bfloat]]
@of_9_unicast_0_buff_0 = external global [64 x [64 x bfloat]]
@switch.table.core_0_4 = private unnamed_addr constant [3 x ptr] [ptr @of_8_switch_join_0_0_buff_1, ptr @of_8_switch_join_0_0_buff_2, ptr @of_8_switch_join_0_0_buff_3], align 4
@switch.table.core_0_4.1 = private unnamed_addr constant [3 x ptr] [ptr @of_8_switch_join_0_1_buff_1, ptr @of_8_switch_join_0_1_buff_2, ptr @of_8_switch_join_0_1_buff_3], align 4

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.aie2p.acquire(i32, i32) #0

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.aie2p.release(i32, i32) #0

declare void @op0_rescale_O(ptr, ptr, i32, ptr) local_unnamed_addr

declare void @op0_zero_bf16(ptr) local_unnamed_addr

declare void @op0_matmul_PV(ptr, ptr, ptr, ptr, i32, i32, ptr) local_unnamed_addr

define void @core_0_4() local_unnamed_addr {
  br label %1

1:                                                ; preds = %0, %65
  %2 = phi i32 [ 0, %0 ], [ %50, %65 ]
  %3 = phi i32 [ 0, %0 ], [ %49, %65 ]
  %4 = phi i32 [ 0, %0 ], [ %59, %65 ]
  %5 = phi i32 [ 0, %0 ], [ %56, %65 ]
  %6 = phi i32 [ 0, %0 ], [ %62, %65 ]
  %7 = phi i64 [ 0, %0 ], [ %66, %65 ]
  tail call void @llvm.aie2p.acquire(i32 48, i32 -2)
  tail call void @op0_zero_bf16(ptr nonnull @of_9_unicast_0_buff_0)
  tail call void @op0_zero_bf16(ptr nonnull @of_9_unicast_0_buff_1)
  br label %8

8:                                                ; preds = %1, %53
  %9 = phi i32 [ %2, %1 ], [ %50, %53 ]
  %10 = phi i32 [ %3, %1 ], [ %49, %53 ]
  %11 = phi i32 [ %4, %1 ], [ %59, %53 ]
  %12 = phi i32 [ %5, %1 ], [ %56, %53 ]
  %13 = phi i32 [ %6, %1 ], [ %62, %53 ]
  %14 = phi i64 [ 0, %1 ], [ %63, %53 ]
  tail call void @llvm.aie2p.acquire(i32 51, i32 -1)
  %cond2 = icmp eq i32 %13, 1
  %spec.select = select i1 %cond2, ptr @of_5_broadcast_0_0_0_cons_buff_1, ptr @of_5_broadcast_0_0_0_cons_buff_0
  tail call void @llvm.aie2p.acquire(i32 1, i32 -1)
  tail call void @llvm.aie2p.acquire(i32 33, i32 -1)
  %switch.tableidx = add i32 %12, -1
  %15 = icmp ult i32 %switch.tableidx, 3
  br i1 %15, label %switch.lookup, label %17

switch.lookup:                                    ; preds = %8
  %16 = trunc nuw i32 %switch.tableidx to i20
  %switch.gep = getelementptr inbounds nuw [3 x ptr], ptr @switch.table.core_0_4, i20 0, i20 %16
  %switch.load = load ptr, ptr %switch.gep, align 4
  br label %17

17:                                               ; preds = %switch.lookup, %8
  %18 = phi ptr [ @of_8_switch_join_0_0_buff_0, %8 ], [ %switch.load, %switch.lookup ]
  %switch.tableidx37 = add i32 %11, -1
  %19 = icmp ult i32 %switch.tableidx37, 3
  br i1 %19, label %switch.lookup36, label %21

switch.lookup36:                                  ; preds = %17
  %20 = trunc nuw i32 %switch.tableidx37 to i20
  %switch.gep38 = getelementptr inbounds nuw [3 x ptr], ptr @switch.table.core_0_4.1, i20 0, i20 %20
  %switch.load39 = load ptr, ptr %switch.gep38, align 4
  br label %21

21:                                               ; preds = %switch.lookup36, %17
  %22 = phi ptr [ @of_8_switch_join_0_1_buff_0, %17 ], [ %switch.load39, %switch.lookup36 ]
  %23 = trunc nuw nsw i64 %14 to i32
  %24 = icmp ne i32 %23, 0
  %25 = zext i1 %24 to i32
  %26 = icmp eq i32 %23, 7
  %27 = icmp ne i32 %23, 0
  %28 = zext i1 %27 to i32
  %29 = icmp eq i32 %23, 7
  br label %30

30:                                               ; preds = %21, %48
  %31 = phi i32 [ %9, %21 ], [ %50, %48 ]
  %32 = phi i32 [ %10, %21 ], [ %49, %48 ]
  %33 = phi i64 [ 0, %21 ], [ %51, %48 ]
  %cond3 = icmp eq i64 %33, 1
  %spec.select19 = select i1 %cond3, ptr @of_9_unicast_0_buff_1, ptr @of_9_unicast_0_buff_0
  %.pn18 = select i1 %cond3, ptr %22, ptr %18
  %34 = trunc nuw nsw i64 %33 to i32
  %35 = shl nuw nsw i32 %34, 2
  store i32 %23, ptr @flash_index_0_4, align 4
  store i32 %35, ptr getelementptr inbounds nuw (i8, ptr @flash_index_0_4, i20 4), align 4
  br i1 %cond3, label %42, label %36

36:                                               ; preds = %30
  tail call void @llvm.aie2p.acquire(i32 5, i32 -1)
  %cond4 = icmp eq i32 %32, 1
  %spec.select20 = select i1 %cond4, ptr @flash_scale_0_3_0_4_buff_1, ptr @flash_scale_0_3_0_4_buff_0
  tail call void @op0_matmul_PV(ptr nonnull %.pn18, ptr nonnull %spec.select, ptr nonnull %spec.select19, ptr nonnull %spec.select20, i32 64, i32 %25, ptr nonnull @flash_index_0_4)
  br i1 %26, label %37, label %38

37:                                               ; preds = %36
  tail call void @op0_rescale_O(ptr nonnull %spec.select19, ptr nonnull %spec.select20, i32 64, ptr nonnull @flash_index_0_4)
  br label %38

38:                                               ; preds = %37, %36
  tail call void @llvm.aie2p.release(i32 4, i32 1)
  %39 = add i32 %32, 1
  %40 = icmp sgt i32 %39, 1
  %41 = select i1 %40, i32 0, i32 %39
  br label %48

42:                                               ; preds = %30
  tail call void @llvm.aie2p.acquire(i32 37, i32 -1)
  %cond5 = icmp eq i32 %31, 1
  %spec.select21 = select i1 %cond5, ptr @flash_scale_0_5_0_4_buff_1, ptr @flash_scale_0_5_0_4_buff_0
  tail call void @op0_matmul_PV(ptr nonnull %.pn18, ptr nonnull %spec.select, ptr nonnull %spec.select19, ptr nonnull %spec.select21, i32 64, i32 %28, ptr nonnull @flash_index_0_4)
  br i1 %29, label %43, label %44

43:                                               ; preds = %42
  tail call void @op0_rescale_O(ptr nonnull %spec.select19, ptr nonnull %spec.select21, i32 64, ptr nonnull @flash_index_0_4)
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
  %54 = add i32 %12, 1
  %55 = icmp sgt i32 %54, 3
  %56 = select i1 %55, i32 0, i32 %54
  tail call void @llvm.aie2p.release(i32 32, i32 1)
  %57 = add i32 %11, 1
  %58 = icmp sgt i32 %57, 3
  %59 = select i1 %58, i32 0, i32 %57
  tail call void @llvm.aie2p.release(i32 50, i32 1)
  %60 = add i32 %13, 1
  %61 = icmp sgt i32 %60, 1
  %62 = select i1 %61, i32 0, i32 %60
  %63 = add nuw nsw i64 %14, 1
  %64 = icmp samesign ult i64 %14, 7
  br i1 %64, label %8, label %65

65:                                               ; preds = %53
  tail call void @llvm.aie2p.release(i32 49, i32 2)
  %66 = add nuw nsw i64 %7, 1
  %67 = icmp samesign ult i64 %7, 4294967294
  br i1 %67, label %1, label %68

68:                                               ; preds = %65
  ret void
}

attributes #0 = { mustprogress nocallback nofree nosync nounwind willreturn }

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
