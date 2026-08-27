; ModuleID = '/home/micas/iron-stream-dse/experiments/dev132/mha_prefill_stream_k1_h2_s2048_d64_flash_shared_fused.mlir.d/peano-linked_op0__MHAStreamGroup_core_2_3.ll'
source_filename = "LLVMDialectModule"
target datalayout = "e-m:e-p:20:32-i1:8:32-i8:8:32-i16:16:32-i32:32:32-f32:32:32-i64:32-f64:32-a:0:32-n32"
target triple = "aie2p"

@flash_index_2_3 = external global [2 x i32]
@flash_state_2_3 = external global [256 x bfloat]
@flash_scale_2_3_buff_1 = external global [256 x bfloat]
@flash_scale_2_3_buff_0 = external global [256 x bfloat]
@of_6_switch_fork_2_0_buff_0 = external global [64 x [64 x bfloat]]
@of_7_switch_join_2_0_buff_1 = external global [64 x [64 x bfloat]]
@of_7_switch_join_2_0_buff_0 = external global [64 x [64 x bfloat]]

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.aie2p.acquire(i32, i32) #0

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.aie2p.release(i32, i32) #0

declare void @op0_init_scale_buffer(ptr, i32) local_unnamed_addr

declare void @op0_passThroughLine(ptr, ptr, i32) local_unnamed_addr

declare void @op0_partial_softmax_mode(ptr, ptr, ptr, ptr, bfloat, i32, i32, i32, i32, i32) local_unnamed_addr

define void @core_2_3() local_unnamed_addr {
  br label %.preheader

.preheader:                                       ; preds = %0, %30
  %1 = phi i32 [ 0, %0 ], [ %21, %30 ]
  %2 = phi i32 [ 0, %0 ], [ %24, %30 ]
  %3 = phi i64 [ 0, %0 ], [ %31, %30 ]
  br label %4

4:                                                ; preds = %.preheader, %27
  %5 = phi i32 [ %1, %.preheader ], [ %21, %27 ]
  %6 = phi i32 [ %2, %.preheader ], [ %24, %27 ]
  %7 = phi i64 [ 0, %.preheader ], [ %28, %27 ]
  %8 = trunc nuw nsw i64 %7 to i32
  %9 = shl nuw nsw i32 %8, 4
  %10 = or disjoint i32 %9, 2
  br label %11

11:                                               ; preds = %4, %18
  %12 = phi i32 [ %5, %4 ], [ %21, %18 ]
  %13 = phi i32 [ %6, %4 ], [ %24, %18 ]
  %14 = phi i64 [ 0, %4 ], [ %25, %18 ]
  tail call void @llvm.aie2p.acquire(i32 48, i32 -1)
  %cond = icmp eq i32 %13, 1
  %spec.select = select i1 %cond, ptr @of_7_switch_join_2_0_buff_1, ptr @of_7_switch_join_2_0_buff_0
  tail call void @llvm.aie2p.acquire(i32 3, i32 -1)
  %15 = trunc nuw nsw i64 %14 to i32
  store i32 %15, ptr @flash_index_2_3, align 4
  store i32 %10, ptr getelementptr inbounds nuw (i8, ptr @flash_index_2_3, i20 4), align 4
  %16 = icmp eq i32 %15, 0
  br i1 %16, label %17, label %18

17:                                               ; preds = %11
  tail call void @op0_init_scale_buffer(ptr nonnull @flash_state_2_3, i32 64)
  br label %18

18:                                               ; preds = %17, %11
  tail call void @op0_partial_softmax_mode(ptr nonnull @of_6_switch_fork_2_0_buff_0, ptr nonnull %spec.select, ptr nonnull @flash_state_2_3, ptr nonnull @flash_index_2_3, bfloat 0xR3FB9, i32 64, i32 64, i32 2048, i32 2048, i32 3)
  tail call void @llvm.aie2p.acquire(i32 50, i32 -1)
  %cond1 = icmp eq i32 %12, 1
  %spec.select3 = select i1 %cond1, ptr @flash_scale_2_3_buff_1, ptr @flash_scale_2_3_buff_0
  tail call void @op0_passThroughLine(ptr nonnull @flash_state_2_3, ptr nonnull %spec.select3, i32 256)
  tail call void @llvm.aie2p.release(i32 51, i32 1)
  %19 = add i32 %12, 1
  %20 = icmp sgt i32 %19, 1
  %21 = select i1 %20, i32 0, i32 %19
  tail call void @llvm.aie2p.release(i32 2, i32 1)
  tail call void @llvm.aie2p.release(i32 49, i32 1)
  %22 = add i32 %13, 1
  %23 = icmp sgt i32 %22, 1
  %24 = select i1 %23, i32 0, i32 %22
  %25 = add nuw nsw i64 %14, 1
  %26 = icmp samesign ult i64 %14, 31
  br i1 %26, label %11, label %27

27:                                               ; preds = %18
  %28 = add nuw nsw i64 %7, 1
  %29 = icmp eq i64 %7, 0
  br i1 %29, label %4, label %30

30:                                               ; preds = %27
  %31 = add nuw nsw i64 %3, 1
  %32 = icmp samesign ult i64 %3, 4294967294
  br i1 %32, label %.preheader, label %33

33:                                               ; preds = %30
  ret void
}

attributes #0 = { mustprogress nocallback nofree nosync nounwind willreturn }

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
