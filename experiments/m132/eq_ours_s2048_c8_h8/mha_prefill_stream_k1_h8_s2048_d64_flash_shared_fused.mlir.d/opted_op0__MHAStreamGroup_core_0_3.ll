; ModuleID = '/home/micas/iron-stream-dse/experiments/m132/eq_ours_s2048_c8_h8/mha_prefill_stream_k1_h8_s2048_d64_flash_shared_fused.mlir.d/peano-linked_op0__MHAStreamGroup_core_0_3.ll'
source_filename = "LLVMDialectModule"
target datalayout = "e-m:e-p:20:32-i1:8:32-i8:8:32-i16:16:32-i32:32:32-f32:32:32-i64:32-f64:32-a:0:32-n32"
target triple = "aie2p"

@flash_index_0_3 = external global [2 x i32]
@flash_state_0_3 = external global [256 x bfloat]
@flash_scale_0_3_buff_1 = external global [256 x bfloat]
@flash_scale_0_3_buff_0 = external global [256 x bfloat]
@of_6_switch_fork_0_0_buff_0 = external global [64 x [64 x bfloat]]
@of_7_switch_join_0_0_buff_1 = external global [64 x [64 x bfloat]]
@of_7_switch_join_0_0_buff_0 = external global [64 x [64 x bfloat]]

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.aie2p.acquire(i32, i32) #0

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.aie2p.release(i32, i32) #0

declare void @op0_init_scale_buffer(ptr, i32) local_unnamed_addr

declare void @op0_passThroughLine(ptr, ptr, i32) local_unnamed_addr

declare void @op0_partial_softmax_mode(ptr, ptr, ptr, ptr, bfloat, i32, i32, i32, i32, i32) local_unnamed_addr

define void @core_0_3() local_unnamed_addr {
  br label %.preheader

.preheader:                                       ; preds = %0, %29
  %1 = phi i32 [ 0, %0 ], [ %20, %29 ]
  %2 = phi i32 [ 0, %0 ], [ %23, %29 ]
  %3 = phi i64 [ 0, %0 ], [ %30, %29 ]
  br label %4

4:                                                ; preds = %.preheader, %26
  %5 = phi i32 [ %1, %.preheader ], [ %20, %26 ]
  %6 = phi i32 [ %2, %.preheader ], [ %23, %26 ]
  %7 = phi i64 [ 0, %.preheader ], [ %27, %26 ]
  %8 = trunc nuw nsw i64 %7 to i32
  %9 = shl nuw nsw i32 %8, 4
  br label %10

10:                                               ; preds = %4, %17
  %11 = phi i32 [ %5, %4 ], [ %20, %17 ]
  %12 = phi i32 [ %6, %4 ], [ %23, %17 ]
  %13 = phi i64 [ 0, %4 ], [ %24, %17 ]
  tail call void @llvm.aie2p.acquire(i32 48, i32 -1)
  %cond = icmp eq i32 %12, 1
  %spec.select = select i1 %cond, ptr @of_7_switch_join_0_0_buff_1, ptr @of_7_switch_join_0_0_buff_0
  tail call void @llvm.aie2p.acquire(i32 3, i32 -1)
  %14 = trunc nuw nsw i64 %13 to i32
  store i32 %14, ptr @flash_index_0_3, align 4
  store i32 %9, ptr getelementptr inbounds nuw (i8, ptr @flash_index_0_3, i20 4), align 4
  %15 = icmp eq i32 %14, 0
  br i1 %15, label %16, label %17

16:                                               ; preds = %10
  tail call void @op0_init_scale_buffer(ptr nonnull @flash_state_0_3, i32 64)
  br label %17

17:                                               ; preds = %16, %10
  tail call void @op0_partial_softmax_mode(ptr nonnull @of_6_switch_fork_0_0_buff_0, ptr nonnull %spec.select, ptr nonnull @flash_state_0_3, ptr nonnull @flash_index_0_3, bfloat 0xR3FB9, i32 64, i32 64, i32 2048, i32 2048, i32 3)
  tail call void @llvm.aie2p.acquire(i32 50, i32 -1)
  %cond1 = icmp eq i32 %11, 1
  %spec.select3 = select i1 %cond1, ptr @flash_scale_0_3_buff_1, ptr @flash_scale_0_3_buff_0
  tail call void @op0_passThroughLine(ptr nonnull @flash_state_0_3, ptr nonnull %spec.select3, i32 256)
  tail call void @llvm.aie2p.release(i32 51, i32 1)
  %18 = add i32 %11, 1
  %19 = icmp sgt i32 %18, 1
  %20 = select i1 %19, i32 0, i32 %18
  tail call void @llvm.aie2p.release(i32 2, i32 1)
  tail call void @llvm.aie2p.release(i32 49, i32 1)
  %21 = add i32 %12, 1
  %22 = icmp sgt i32 %21, 1
  %23 = select i1 %22, i32 0, i32 %21
  %24 = add nuw nsw i64 %13, 1
  %25 = icmp samesign ult i64 %13, 31
  br i1 %25, label %10, label %26

26:                                               ; preds = %17
  %27 = add nuw nsw i64 %7, 1
  %28 = icmp eq i64 %7, 0
  br i1 %28, label %4, label %29

29:                                               ; preds = %26
  %30 = add nuw nsw i64 %3, 1
  %31 = icmp samesign ult i64 %3, 4294967294
  br i1 %31, label %.preheader, label %32

32:                                               ; preds = %29
  ret void
}

attributes #0 = { mustprogress nocallback nofree nosync nounwind willreturn }

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
