; ModuleID = '/home/micas/iron-stream-dse/experiments/depth_012_6/eq_ours_s2048_c8_h8/mha_prefill_stream_k1_h8_s2048_d64_flash_shared_fused.mlir.d/peano-linked_op0__MHAStreamGroup_core_0_4.ll'
source_filename = "LLVMDialectModule"
target datalayout = "e-m:e-p:20:32-i1:8:32-i8:8:32-i16:16:32-i32:32:32-f32:32:32-i64:32-f64:32-a:0:32-n32"
target triple = "aie2p"

@flash_index_0_4 = external global [2 x i32]
@flash_scale_0_3_buff_5 = external global [256 x bfloat]
@flash_scale_0_3_buff_4 = external global [256 x bfloat]
@flash_scale_0_3_buff_3 = external global [256 x bfloat]
@flash_scale_0_3_buff_2 = external global [256 x bfloat]
@flash_scale_0_3_buff_1 = external global [256 x bfloat]
@flash_scale_0_3_buff_0 = external global [256 x bfloat]
@of_5_broadcast_0_0_0_cons_buff_1 = external global [64 x [64 x bfloat]]
@of_5_broadcast_0_0_0_cons_buff_0 = external global [64 x [64 x bfloat]]
@of_9_unicast_0_0_cons_buff_1 = external global [64 x [64 x bfloat]]
@of_9_unicast_0_0_cons_buff_0 = external global [64 x [64 x bfloat]]
@of_10_unicast_0_buff_1 = external global [64 x [64 x bfloat]]
@of_10_unicast_0_buff_0 = external global [64 x [64 x bfloat]]
@switch.table.core_0_4 = private unnamed_addr constant [5 x ptr] [ptr @flash_scale_0_3_buff_1, ptr @flash_scale_0_3_buff_2, ptr @flash_scale_0_3_buff_3, ptr @flash_scale_0_3_buff_4, ptr @flash_scale_0_3_buff_5], align 4

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.aie2p.acquire(i32, i32) #0

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.aie2p.release(i32, i32) #0

declare void @op0_rescale_O(ptr, ptr, i32, ptr) local_unnamed_addr

declare void @op0_zero_bf16(ptr) local_unnamed_addr

declare void @op0_matmul_PV(ptr, ptr, ptr, ptr, i32, i32, ptr) local_unnamed_addr

define void @core_0_4() local_unnamed_addr {
  br label %.preheader

.preheader:                                       ; preds = %0, %47
  %1 = phi i32 [ 0, %0 ], [ %32, %47 ]
  %2 = phi i32 [ 0, %0 ], [ %35, %47 ]
  %3 = phi i32 [ 0, %0 ], [ %38, %47 ]
  %4 = phi i32 [ 0, %0 ], [ %44, %47 ]
  %5 = phi i64 [ 0, %0 ], [ %48, %47 ]
  br label %6

6:                                                ; preds = %.preheader, %41
  %7 = phi i32 [ %1, %.preheader ], [ %32, %41 ]
  %8 = phi i32 [ %2, %.preheader ], [ %35, %41 ]
  %9 = phi i32 [ %3, %.preheader ], [ %38, %41 ]
  %10 = phi i32 [ %4, %.preheader ], [ %44, %41 ]
  %11 = phi i64 [ 0, %.preheader ], [ %45, %41 ]
  tail call void @llvm.aie2p.acquire(i32 48, i32 -1)
  %cond = icmp eq i32 %10, 1
  %spec.select = select i1 %cond, ptr @of_10_unicast_0_buff_1, ptr @of_10_unicast_0_buff_0
  tail call void @op0_zero_bf16(ptr nonnull %spec.select)
  %12 = trunc nuw nsw i64 %11 to i32
  %13 = shl nuw nsw i32 %12, 3
  br label %14

14:                                               ; preds = %6, %29
  %15 = phi i32 [ %7, %6 ], [ %32, %29 ]
  %16 = phi i32 [ %8, %6 ], [ %35, %29 ]
  %17 = phi i32 [ %9, %6 ], [ %38, %29 ]
  %18 = phi i64 [ 0, %6 ], [ %39, %29 ]
  tail call void @llvm.aie2p.acquire(i32 51, i32 -1)
  %cond1 = icmp eq i32 %17, 1
  %spec.select4 = select i1 %cond1, ptr @of_9_unicast_0_0_cons_buff_1, ptr @of_9_unicast_0_0_cons_buff_0
  tail call void @llvm.aie2p.acquire(i32 53, i32 -1)
  %cond2 = icmp eq i32 %16, 1
  %19 = select i1 %cond2, ptr @of_5_broadcast_0_0_0_cons_buff_1, ptr @of_5_broadcast_0_0_0_cons_buff_0
  %20 = trunc nuw nsw i64 %18 to i32
  store i32 %20, ptr @flash_index_0_4, align 4
  store i32 %13, ptr getelementptr inbounds nuw (i8, ptr @flash_index_0_4, i20 4), align 4
  tail call void @llvm.aie2p.acquire(i32 5, i32 -1)
  %switch.tableidx = add i32 %15, -1
  %21 = icmp ult i32 %switch.tableidx, 5
  br i1 %21, label %switch.lookup, label %23

switch.lookup:                                    ; preds = %14
  %22 = trunc nuw i32 %switch.tableidx to i20
  %switch.gep = getelementptr inbounds nuw [5 x ptr], ptr @switch.table.core_0_4, i20 0, i20 %22
  %switch.load = load ptr, ptr %switch.gep, align 4
  br label %23

23:                                               ; preds = %switch.lookup, %14
  %24 = phi ptr [ @flash_scale_0_3_buff_0, %14 ], [ %switch.load, %switch.lookup ]
  %25 = icmp ne i32 %20, 0
  %26 = zext i1 %25 to i32
  tail call void @op0_matmul_PV(ptr nonnull %spec.select4, ptr nonnull %19, ptr nonnull %spec.select, ptr nonnull %24, i32 64, i32 %26, ptr nonnull @flash_index_0_4)
  %27 = icmp eq i32 %20, 31
  br i1 %27, label %28, label %29

28:                                               ; preds = %23
  tail call void @op0_rescale_O(ptr nonnull %spec.select, ptr nonnull %24, i32 64, ptr nonnull @flash_index_0_4)
  br label %29

29:                                               ; preds = %28, %23
  tail call void @llvm.aie2p.release(i32 4, i32 1)
  %30 = add i32 %15, 1
  %31 = icmp sgt i32 %30, 5
  %32 = select i1 %31, i32 0, i32 %30
  tail call void @llvm.aie2p.release(i32 52, i32 1)
  %33 = add i32 %16, 1
  %34 = icmp sgt i32 %33, 1
  %35 = select i1 %34, i32 0, i32 %33
  tail call void @llvm.aie2p.release(i32 50, i32 1)
  %36 = add i32 %17, 1
  %37 = icmp sgt i32 %36, 1
  %38 = select i1 %37, i32 0, i32 %36
  %39 = add nuw nsw i64 %18, 1
  %40 = icmp samesign ult i64 %18, 31
  br i1 %40, label %14, label %41

41:                                               ; preds = %29
  tail call void @llvm.aie2p.release(i32 49, i32 1)
  %42 = add i32 %10, 1
  %43 = icmp sgt i32 %42, 1
  %44 = select i1 %43, i32 0, i32 %42
  %45 = add nuw nsw i64 %11, 1
  %46 = icmp samesign ult i64 %11, 3
  br i1 %46, label %6, label %47

47:                                               ; preds = %41
  %48 = add nuw nsw i64 %5, 1
  %49 = icmp samesign ult i64 %5, 4294967294
  br i1 %49, label %.preheader, label %50

50:                                               ; preds = %47
  ret void
}

attributes #0 = { mustprogress nocallback nofree nosync nounwind willreturn }

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
