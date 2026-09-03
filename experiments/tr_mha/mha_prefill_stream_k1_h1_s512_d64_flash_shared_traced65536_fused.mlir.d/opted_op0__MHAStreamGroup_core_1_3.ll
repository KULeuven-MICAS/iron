; ModuleID = '/home/micas/iron-stream-dse/experiments/tr_mha/mha_prefill_stream_k1_h1_s512_d64_flash_shared_traced65536_fused.mlir.d/peano-linked_op0__MHAStreamGroup_core_1_3.ll'
source_filename = "LLVMDialectModule"
target datalayout = "e-m:e-p:20:32-i1:8:32-i8:8:32-i16:16:32-i32:32:32-f32:32:32-i64:32-f64:32-a:0:32-n32"
target triple = "aie2p"

@flash_index_1_3 = external global [2 x i32]
@flash_state_1_3 = external global [256 x bfloat]
@flash_scale_1_3_1_4_buff_1 = external global [256 x bfloat]
@flash_scale_1_3_1_4_buff_0 = external global [256 x bfloat]
@of_7_distribute_1_0_cons_buff_1 = external global [64 x [64 x bfloat]]
@of_7_distribute_1_0_cons_buff_0 = external global [64 x [64 x bfloat]]
@of_8_switch_join_1_0_buff_1 = external global [64 x [64 x bfloat]]
@of_8_switch_join_1_0_buff_0 = external global [64 x [64 x bfloat]]

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.aie2p.acquire(i32, i32) #0

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.aie2p.release(i32, i32) #0

declare void @op0_init_scale_buffer(ptr, i32) local_unnamed_addr

declare void @op0_passThroughLine(ptr, ptr, i32) local_unnamed_addr

declare void @op0_partial_softmax_mode(ptr, ptr, ptr, ptr, bfloat, i32, i32, i32, i32, i32) local_unnamed_addr

define void @core_1_3() local_unnamed_addr {
  br label %.preheader

.preheader:                                       ; preds = %0, %26
  %1 = phi i32 [ 0, %0 ], [ %17, %26 ]
  %2 = phi i32 [ 0, %0 ], [ %20, %26 ]
  %3 = phi i32 [ 0, %0 ], [ %23, %26 ]
  %4 = phi i64 [ 0, %0 ], [ %27, %26 ]
  br label %5

5:                                                ; preds = %.preheader, %14
  %6 = phi i32 [ %1, %.preheader ], [ %17, %14 ]
  %7 = phi i32 [ %2, %.preheader ], [ %20, %14 ]
  %8 = phi i32 [ %3, %.preheader ], [ %23, %14 ]
  %9 = phi i64 [ 0, %.preheader ], [ %24, %14 ]
  tail call void @llvm.aie2p.acquire(i32 48, i32 -1)
  %cond = icmp eq i32 %8, 1
  %spec.select = select i1 %cond, ptr @of_8_switch_join_1_0_buff_1, ptr @of_8_switch_join_1_0_buff_0
  tail call void @llvm.aie2p.acquire(i32 51, i32 -1)
  %cond1 = icmp eq i32 %7, 1
  %10 = select i1 %cond1, ptr @of_7_distribute_1_0_cons_buff_1, ptr @of_7_distribute_1_0_cons_buff_0
  %11 = trunc nuw nsw i64 %9 to i32
  store i32 %11, ptr @flash_index_1_3, align 4
  store i32 1, ptr getelementptr inbounds nuw (i8, ptr @flash_index_1_3, i20 4), align 4
  %12 = icmp eq i32 %11, 0
  br i1 %12, label %13, label %14

13:                                               ; preds = %5
  tail call void @op0_init_scale_buffer(ptr nonnull @flash_state_1_3, i32 64)
  br label %14

14:                                               ; preds = %13, %5
  tail call void @op0_partial_softmax_mode(ptr nonnull %10, ptr nonnull %spec.select, ptr nonnull @flash_state_1_3, ptr nonnull @flash_index_1_3, bfloat 0xR3FB9, i32 64, i32 64, i32 512, i32 512, i32 2)
  tail call void @llvm.aie2p.acquire(i32 52, i32 -1)
  %cond2 = icmp eq i32 %6, 1
  %spec.select3 = select i1 %cond2, ptr @flash_scale_1_3_1_4_buff_1, ptr @flash_scale_1_3_1_4_buff_0
  tail call void @op0_passThroughLine(ptr nonnull @flash_state_1_3, ptr nonnull %spec.select3, i32 256)
  tail call void @llvm.aie2p.release(i32 53, i32 1)
  %15 = add i32 %6, 1
  %16 = icmp sgt i32 %15, 1
  %17 = select i1 %16, i32 0, i32 %15
  tail call void @llvm.aie2p.release(i32 50, i32 1)
  %18 = add i32 %7, 1
  %19 = icmp sgt i32 %18, 1
  %20 = select i1 %19, i32 0, i32 %18
  tail call void @llvm.aie2p.release(i32 49, i32 1)
  %21 = add i32 %8, 1
  %22 = icmp sgt i32 %21, 1
  %23 = select i1 %22, i32 0, i32 %21
  %24 = add nuw nsw i64 %9, 1
  %25 = icmp samesign ult i64 %9, 7
  br i1 %25, label %5, label %26

26:                                               ; preds = %14
  %27 = add nuw nsw i64 %4, 1
  %28 = icmp samesign ult i64 %4, 4294967294
  br i1 %28, label %.preheader, label %29

29:                                               ; preds = %26
  ret void
}

attributes #0 = { mustprogress nocallback nofree nosync nounwind willreturn }

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
