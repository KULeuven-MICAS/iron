; ModuleID = '/home/micas/iron-stream-dse/experiments/depth_0132_8/eq_ours_s2048_c8_h8/mha_prefill_stream_k1_h8_s2048_d64_flash_shared_fused.mlir.d/peano-linked_op0__MHAStreamGroup_core_0_3.ll'
source_filename = "LLVMDialectModule"
target datalayout = "e-m:e-p:20:32-i1:8:32-i8:8:32-i16:16:32-i32:32:32-f32:32:32-i64:32-f64:32-a:0:32-n32"
target triple = "aie2p"

@flash_index_0_3 = external global [2 x i32]
@flash_state_0_3 = external global [256 x bfloat]
@flash_scale_0_3_buff_7 = external global [256 x bfloat]
@flash_scale_0_3_buff_6 = external global [256 x bfloat]
@flash_scale_0_3_buff_5 = external global [256 x bfloat]
@flash_scale_0_3_buff_4 = external global [256 x bfloat]
@flash_scale_0_3_buff_3 = external global [256 x bfloat]
@flash_scale_0_3_buff_2 = external global [256 x bfloat]
@flash_scale_0_3_buff_1 = external global [256 x bfloat]
@flash_scale_0_3_buff_0 = external global [256 x bfloat]
@of_7_distribute_0_0_cons_buff_1 = external global [64 x [64 x bfloat]]
@of_7_distribute_0_0_cons_buff_0 = external global [64 x [64 x bfloat]]
@of_8_switch_join_0_0_buff_1 = external global [64 x [64 x bfloat]]
@of_8_switch_join_0_0_buff_0 = external global [64 x [64 x bfloat]]
@switch.table.core_0_3 = private unnamed_addr constant [7 x ptr] [ptr @flash_scale_0_3_buff_1, ptr @flash_scale_0_3_buff_2, ptr @flash_scale_0_3_buff_3, ptr @flash_scale_0_3_buff_4, ptr @flash_scale_0_3_buff_5, ptr @flash_scale_0_3_buff_6, ptr @flash_scale_0_3_buff_7], align 4

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.aie2p.acquire(i32, i32) #0

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.aie2p.release(i32, i32) #0

declare void @op0_init_scale_buffer(ptr, i32) local_unnamed_addr

declare void @op0_passThroughLine(ptr, ptr, i32) local_unnamed_addr

declare void @op0_partial_softmax_mode(ptr, ptr, ptr, ptr, bfloat, i32, i32, i32, i32, i32) local_unnamed_addr

define void @core_0_3() local_unnamed_addr {
  br label %.preheader

.preheader:                                       ; preds = %0, %40
  %1 = phi i32 [ 0, %0 ], [ %28, %40 ]
  %2 = phi i32 [ 0, %0 ], [ %31, %40 ]
  %3 = phi i32 [ 0, %0 ], [ %34, %40 ]
  %4 = phi i64 [ 0, %0 ], [ %41, %40 ]
  br label %5

5:                                                ; preds = %.preheader, %37
  %6 = phi i32 [ %1, %.preheader ], [ %28, %37 ]
  %7 = phi i32 [ %2, %.preheader ], [ %31, %37 ]
  %8 = phi i32 [ %3, %.preheader ], [ %34, %37 ]
  %9 = phi i64 [ 0, %.preheader ], [ %38, %37 ]
  %10 = trunc nuw nsw i64 %9 to i32
  %11 = shl nuw nsw i32 %10, 4
  br label %12

12:                                               ; preds = %5, %24
  %13 = phi i32 [ %6, %5 ], [ %28, %24 ]
  %14 = phi i32 [ %7, %5 ], [ %31, %24 ]
  %15 = phi i32 [ %8, %5 ], [ %34, %24 ]
  %16 = phi i64 [ 0, %5 ], [ %35, %24 ]
  tail call void @llvm.aie2p.acquire(i32 48, i32 -1)
  %cond = icmp eq i32 %15, 1
  %spec.select = select i1 %cond, ptr @of_8_switch_join_0_0_buff_1, ptr @of_8_switch_join_0_0_buff_0
  tail call void @llvm.aie2p.acquire(i32 51, i32 -1)
  %cond1 = icmp eq i32 %14, 1
  %17 = select i1 %cond1, ptr @of_7_distribute_0_0_cons_buff_1, ptr @of_7_distribute_0_0_cons_buff_0
  %18 = trunc nuw nsw i64 %16 to i32
  store i32 %18, ptr @flash_index_0_3, align 4
  store i32 %11, ptr getelementptr inbounds nuw (i8, ptr @flash_index_0_3, i20 4), align 4
  %19 = icmp eq i32 %18, 0
  br i1 %19, label %20, label %21

20:                                               ; preds = %12
  tail call void @op0_init_scale_buffer(ptr nonnull @flash_state_0_3, i32 64)
  br label %21

21:                                               ; preds = %20, %12
  tail call void @op0_partial_softmax_mode(ptr nonnull %17, ptr nonnull %spec.select, ptr nonnull @flash_state_0_3, ptr nonnull @flash_index_0_3, bfloat 0xR3FB9, i32 64, i32 64, i32 2048, i32 2048, i32 2)
  tail call void @llvm.aie2p.acquire(i32 52, i32 -1)
  %switch.tableidx = add i32 %13, -1
  %22 = icmp ult i32 %switch.tableidx, 7
  br i1 %22, label %switch.lookup, label %24

switch.lookup:                                    ; preds = %21
  %23 = trunc nuw i32 %switch.tableidx to i20
  %switch.gep = getelementptr inbounds nuw [7 x ptr], ptr @switch.table.core_0_3, i20 0, i20 %23
  %switch.load = load ptr, ptr %switch.gep, align 4
  br label %24

24:                                               ; preds = %switch.lookup, %21
  %25 = phi ptr [ @flash_scale_0_3_buff_0, %21 ], [ %switch.load, %switch.lookup ]
  tail call void @op0_passThroughLine(ptr nonnull @flash_state_0_3, ptr nonnull %25, i32 256)
  tail call void @llvm.aie2p.release(i32 53, i32 1)
  %26 = add i32 %13, 1
  %27 = icmp sgt i32 %26, 7
  %28 = select i1 %27, i32 0, i32 %26
  tail call void @llvm.aie2p.release(i32 50, i32 1)
  %29 = add i32 %14, 1
  %30 = icmp sgt i32 %29, 1
  %31 = select i1 %30, i32 0, i32 %29
  tail call void @llvm.aie2p.release(i32 49, i32 1)
  %32 = add i32 %15, 1
  %33 = icmp sgt i32 %32, 1
  %34 = select i1 %33, i32 0, i32 %32
  %35 = add nuw nsw i64 %16, 1
  %36 = icmp samesign ult i64 %16, 31
  br i1 %36, label %12, label %37

37:                                               ; preds = %24
  %38 = add nuw nsw i64 %9, 1
  %39 = icmp eq i64 %9, 0
  br i1 %39, label %5, label %40

40:                                               ; preds = %37
  %41 = add nuw nsw i64 %4, 1
  %42 = icmp samesign ult i64 %4, 4294967294
  br i1 %42, label %.preheader, label %43

43:                                               ; preds = %40
  ret void
}

attributes #0 = { mustprogress nocallback nofree nosync nounwind willreturn }

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
