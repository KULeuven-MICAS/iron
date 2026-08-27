; ModuleID = '/home/micas/iron-stream-dse/experiments/depth_012_6/eq_ours_s2048_c8_h8/mha_prefill_stream_k1_h8_s2048_d64_flash_shared_fused.mlir.d/peano-linked_op0__MHAStreamGroup_core_7_4.ll'
source_filename = "LLVMDialectModule"
target datalayout = "e-m:e-p:20:32-i1:8:32-i8:8:32-i16:16:32-i32:32:32-f32:32:32-i64:32-f64:32-a:0:32-n32"
target triple = "aie2p"

@flash_index_7_4 = external global [2 x i32]
@flash_scale_7_3_buff_5 = external global [256 x bfloat]
@flash_scale_7_3_buff_4 = external global [256 x bfloat]
@flash_scale_7_3_buff_3 = external global [256 x bfloat]
@flash_scale_7_3_buff_2 = external global [256 x bfloat]
@flash_scale_7_3_buff_1 = external global [256 x bfloat]
@flash_scale_7_3_buff_0 = external global [256 x bfloat]
@of_5_broadcast_0_0_7_cons_buff_1 = external global [64 x [64 x bfloat]]
@of_5_broadcast_0_0_7_cons_buff_0 = external global [64 x [64 x bfloat]]
@of_9_unicast_7_0_cons_buff_1 = external global [64 x [64 x bfloat]]
@of_9_unicast_7_0_cons_buff_0 = external global [64 x [64 x bfloat]]
@of_10_unicast_7_buff_1 = external global [64 x [64 x bfloat]]
@of_10_unicast_7_buff_0 = external global [64 x [64 x bfloat]]
@switch.table.core_7_4 = private unnamed_addr constant [5 x ptr] [ptr @flash_scale_7_3_buff_1, ptr @flash_scale_7_3_buff_2, ptr @flash_scale_7_3_buff_3, ptr @flash_scale_7_3_buff_4, ptr @flash_scale_7_3_buff_5], align 4

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.aie2p.acquire(i32, i32) #0

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.aie2p.release(i32, i32) #0

declare void @op0_rescale_O(ptr, ptr, i32, ptr) local_unnamed_addr

declare void @op0_zero_bf16(ptr) local_unnamed_addr

declare void @op0_matmul_PV(ptr, ptr, ptr, ptr, i32, i32, ptr) local_unnamed_addr

define void @core_7_4() local_unnamed_addr {
  br label %.preheader

.preheader:                                       ; preds = %0, %48
  %1 = phi i32 [ 0, %0 ], [ %33, %48 ]
  %2 = phi i32 [ 0, %0 ], [ %36, %48 ]
  %3 = phi i32 [ 0, %0 ], [ %39, %48 ]
  %4 = phi i32 [ 0, %0 ], [ %45, %48 ]
  %5 = phi i64 [ 0, %0 ], [ %49, %48 ]
  br label %6

6:                                                ; preds = %.preheader, %42
  %7 = phi i32 [ %1, %.preheader ], [ %33, %42 ]
  %8 = phi i32 [ %2, %.preheader ], [ %36, %42 ]
  %9 = phi i32 [ %3, %.preheader ], [ %39, %42 ]
  %10 = phi i32 [ %4, %.preheader ], [ %45, %42 ]
  %11 = phi i64 [ 0, %.preheader ], [ %46, %42 ]
  tail call void @llvm.aie2p.acquire(i32 48, i32 -1)
  %cond = icmp eq i32 %10, 1
  %spec.select = select i1 %cond, ptr @of_10_unicast_7_buff_1, ptr @of_10_unicast_7_buff_0
  tail call void @op0_zero_bf16(ptr nonnull %spec.select)
  %12 = trunc nuw nsw i64 %11 to i32
  %13 = shl nuw nsw i32 %12, 3
  %14 = or disjoint i32 %13, 7
  br label %15

15:                                               ; preds = %6, %30
  %16 = phi i32 [ %7, %6 ], [ %33, %30 ]
  %17 = phi i32 [ %8, %6 ], [ %36, %30 ]
  %18 = phi i32 [ %9, %6 ], [ %39, %30 ]
  %19 = phi i64 [ 0, %6 ], [ %40, %30 ]
  tail call void @llvm.aie2p.acquire(i32 51, i32 -1)
  %cond1 = icmp eq i32 %18, 1
  %spec.select4 = select i1 %cond1, ptr @of_9_unicast_7_0_cons_buff_1, ptr @of_9_unicast_7_0_cons_buff_0
  tail call void @llvm.aie2p.acquire(i32 53, i32 -1)
  %cond2 = icmp eq i32 %17, 1
  %20 = select i1 %cond2, ptr @of_5_broadcast_0_0_7_cons_buff_1, ptr @of_5_broadcast_0_0_7_cons_buff_0
  %21 = trunc nuw nsw i64 %19 to i32
  store i32 %21, ptr @flash_index_7_4, align 4
  store i32 %14, ptr getelementptr inbounds nuw (i8, ptr @flash_index_7_4, i20 4), align 4
  tail call void @llvm.aie2p.acquire(i32 5, i32 -1)
  %switch.tableidx = add i32 %16, -1
  %22 = icmp ult i32 %switch.tableidx, 5
  br i1 %22, label %switch.lookup, label %24

switch.lookup:                                    ; preds = %15
  %23 = trunc nuw i32 %switch.tableidx to i20
  %switch.gep = getelementptr inbounds nuw [5 x ptr], ptr @switch.table.core_7_4, i20 0, i20 %23
  %switch.load = load ptr, ptr %switch.gep, align 4
  br label %24

24:                                               ; preds = %switch.lookup, %15
  %25 = phi ptr [ @flash_scale_7_3_buff_0, %15 ], [ %switch.load, %switch.lookup ]
  %26 = icmp ne i32 %21, 0
  %27 = zext i1 %26 to i32
  tail call void @op0_matmul_PV(ptr nonnull %spec.select4, ptr nonnull %20, ptr nonnull %spec.select, ptr nonnull %25, i32 64, i32 %27, ptr nonnull @flash_index_7_4)
  %28 = icmp eq i32 %21, 31
  br i1 %28, label %29, label %30

29:                                               ; preds = %24
  tail call void @op0_rescale_O(ptr nonnull %spec.select, ptr nonnull %25, i32 64, ptr nonnull @flash_index_7_4)
  br label %30

30:                                               ; preds = %29, %24
  tail call void @llvm.aie2p.release(i32 4, i32 1)
  %31 = add i32 %16, 1
  %32 = icmp sgt i32 %31, 5
  %33 = select i1 %32, i32 0, i32 %31
  tail call void @llvm.aie2p.release(i32 52, i32 1)
  %34 = add i32 %17, 1
  %35 = icmp sgt i32 %34, 1
  %36 = select i1 %35, i32 0, i32 %34
  tail call void @llvm.aie2p.release(i32 50, i32 1)
  %37 = add i32 %18, 1
  %38 = icmp sgt i32 %37, 1
  %39 = select i1 %38, i32 0, i32 %37
  %40 = add nuw nsw i64 %19, 1
  %41 = icmp samesign ult i64 %19, 31
  br i1 %41, label %15, label %42

42:                                               ; preds = %30
  tail call void @llvm.aie2p.release(i32 49, i32 1)
  %43 = add i32 %10, 1
  %44 = icmp sgt i32 %43, 1
  %45 = select i1 %44, i32 0, i32 %43
  %46 = add nuw nsw i64 %11, 1
  %47 = icmp samesign ult i64 %11, 3
  br i1 %47, label %6, label %48

48:                                               ; preds = %42
  %49 = add nuw nsw i64 %5, 1
  %50 = icmp samesign ult i64 %5, 4294967294
  br i1 %50, label %.preheader, label %51

51:                                               ; preds = %48
  ret void
}

attributes #0 = { mustprogress nocallback nofree nosync nounwind willreturn }

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
