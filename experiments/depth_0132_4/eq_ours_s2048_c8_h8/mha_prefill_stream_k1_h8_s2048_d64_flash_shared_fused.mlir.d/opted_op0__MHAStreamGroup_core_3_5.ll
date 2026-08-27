; ModuleID = '/home/micas/iron-stream-dse/experiments/depth_0132_4/eq_ours_s2048_c8_h8/mha_prefill_stream_k1_h8_s2048_d64_flash_shared_fused.mlir.d/peano-linked_op0__MHAStreamGroup_core_3_5.ll'
source_filename = "LLVMDialectModule"
target datalayout = "e-m:e-p:20:32-i1:8:32-i8:8:32-i16:16:32-i32:32:32-f32:32:32-i64:32-f64:32-a:0:32-n32"
target triple = "aie2p"

@flash_index_3_5 = external global [2 x i32]
@flash_state_3_5 = external global [256 x bfloat]
@flash_scale_3_5_buff_3 = external global [256 x bfloat]
@flash_scale_3_5_buff_2 = external global [256 x bfloat]
@flash_scale_3_5_buff_1 = external global [256 x bfloat]
@flash_scale_3_5_buff_0 = external global [256 x bfloat]
@of_7_distribute_3_1_cons_buff_1 = external global [64 x [64 x bfloat]]
@of_7_distribute_3_1_cons_buff_0 = external global [64 x [64 x bfloat]]
@of_8_switch_join_3_1_buff_1 = external global [64 x [64 x bfloat]]
@of_8_switch_join_3_1_buff_0 = external global [64 x [64 x bfloat]]
@switch.table.core_3_5 = private unnamed_addr constant [3 x ptr] [ptr @flash_scale_3_5_buff_1, ptr @flash_scale_3_5_buff_2, ptr @flash_scale_3_5_buff_3], align 4

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.aie2p.acquire(i32, i32) #0

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.aie2p.release(i32, i32) #0

declare void @op0_init_scale_buffer(ptr, i32) local_unnamed_addr

declare void @op0_passThroughLine(ptr, ptr, i32) local_unnamed_addr

declare void @op0_partial_softmax_mode(ptr, ptr, ptr, ptr, bfloat, i32, i32, i32, i32, i32) local_unnamed_addr

define void @core_3_5() local_unnamed_addr {
  br label %.preheader

.preheader:                                       ; preds = %0, %41
  %1 = phi i32 [ 0, %0 ], [ %29, %41 ]
  %2 = phi i32 [ 0, %0 ], [ %32, %41 ]
  %3 = phi i32 [ 0, %0 ], [ %35, %41 ]
  %4 = phi i64 [ 0, %0 ], [ %42, %41 ]
  br label %5

5:                                                ; preds = %.preheader, %38
  %6 = phi i32 [ %1, %.preheader ], [ %29, %38 ]
  %7 = phi i32 [ %2, %.preheader ], [ %32, %38 ]
  %8 = phi i32 [ %3, %.preheader ], [ %35, %38 ]
  %9 = phi i64 [ 0, %.preheader ], [ %39, %38 ]
  %10 = trunc nuw nsw i64 %9 to i32
  %11 = shl nuw nsw i32 %10, 4
  %12 = or disjoint i32 %11, 11
  br label %13

13:                                               ; preds = %5, %25
  %14 = phi i32 [ %6, %5 ], [ %29, %25 ]
  %15 = phi i32 [ %7, %5 ], [ %32, %25 ]
  %16 = phi i32 [ %8, %5 ], [ %35, %25 ]
  %17 = phi i64 [ 0, %5 ], [ %36, %25 ]
  tail call void @llvm.aie2p.acquire(i32 48, i32 -1)
  %cond = icmp eq i32 %16, 1
  %spec.select = select i1 %cond, ptr @of_8_switch_join_3_1_buff_1, ptr @of_8_switch_join_3_1_buff_0
  tail call void @llvm.aie2p.acquire(i32 51, i32 -1)
  %cond1 = icmp eq i32 %15, 1
  %18 = select i1 %cond1, ptr @of_7_distribute_3_1_cons_buff_1, ptr @of_7_distribute_3_1_cons_buff_0
  %19 = trunc nuw nsw i64 %17 to i32
  store i32 %19, ptr @flash_index_3_5, align 4
  store i32 %12, ptr getelementptr inbounds nuw (i8, ptr @flash_index_3_5, i20 4), align 4
  %20 = icmp eq i32 %19, 0
  br i1 %20, label %21, label %22

21:                                               ; preds = %13
  tail call void @op0_init_scale_buffer(ptr nonnull @flash_state_3_5, i32 64)
  br label %22

22:                                               ; preds = %21, %13
  tail call void @op0_partial_softmax_mode(ptr nonnull %18, ptr nonnull %spec.select, ptr nonnull @flash_state_3_5, ptr nonnull @flash_index_3_5, bfloat 0xR3FB9, i32 64, i32 64, i32 2048, i32 2048, i32 2)
  tail call void @llvm.aie2p.acquire(i32 52, i32 -1)
  %switch.tableidx = add i32 %14, -1
  %23 = icmp ult i32 %switch.tableidx, 3
  br i1 %23, label %switch.lookup, label %25

switch.lookup:                                    ; preds = %22
  %24 = trunc nuw i32 %switch.tableidx to i20
  %switch.gep = getelementptr inbounds nuw [3 x ptr], ptr @switch.table.core_3_5, i20 0, i20 %24
  %switch.load = load ptr, ptr %switch.gep, align 4
  br label %25

25:                                               ; preds = %switch.lookup, %22
  %26 = phi ptr [ @flash_scale_3_5_buff_0, %22 ], [ %switch.load, %switch.lookup ]
  tail call void @op0_passThroughLine(ptr nonnull @flash_state_3_5, ptr nonnull %26, i32 256)
  tail call void @llvm.aie2p.release(i32 53, i32 1)
  %27 = add i32 %14, 1
  %28 = icmp sgt i32 %27, 3
  %29 = select i1 %28, i32 0, i32 %27
  tail call void @llvm.aie2p.release(i32 50, i32 1)
  %30 = add i32 %15, 1
  %31 = icmp sgt i32 %30, 1
  %32 = select i1 %31, i32 0, i32 %30
  tail call void @llvm.aie2p.release(i32 49, i32 1)
  %33 = add i32 %16, 1
  %34 = icmp sgt i32 %33, 1
  %35 = select i1 %34, i32 0, i32 %33
  %36 = add nuw nsw i64 %17, 1
  %37 = icmp samesign ult i64 %17, 31
  br i1 %37, label %13, label %38

38:                                               ; preds = %25
  %39 = add nuw nsw i64 %9, 1
  %40 = icmp eq i64 %9, 0
  br i1 %40, label %5, label %41

41:                                               ; preds = %38
  %42 = add nuw nsw i64 %4, 1
  %43 = icmp samesign ult i64 %4, 4294967294
  br i1 %43, label %.preheader, label %44

44:                                               ; preds = %41
  ret void
}

attributes #0 = { mustprogress nocallback nofree nosync nounwind willreturn }

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
