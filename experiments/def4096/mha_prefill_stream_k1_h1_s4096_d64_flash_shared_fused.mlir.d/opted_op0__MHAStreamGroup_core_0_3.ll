; ModuleID = '/home/micas/iron-stream-dse/experiments/def4096/mha_prefill_stream_k1_h1_s4096_d64_flash_shared_fused.mlir.d/peano-linked_op0__MHAStreamGroup_core_0_3.ll'
source_filename = "LLVMDialectModule"
target datalayout = "e-m:e-p:20:32-i1:8:32-i8:8:32-i16:16:32-i32:32:32-f32:32:32-i64:32-f64:32-a:0:32-n32"
target triple = "aie2p"

@flash_index_0_3 = external global [2 x i32]
@flash_state_0_3 = external global [256 x bfloat]
@flash_scale_0_3_buff_1 = external global [256 x bfloat]
@flash_scale_0_3_buff_0 = external global [256 x bfloat]
@of_7_distribute_0_0_cons_buff_1 = external global [64 x [64 x bfloat]]
@of_7_distribute_0_0_cons_buff_0 = external global [64 x [64 x bfloat]]
@of_8_switch_join_0_0_buff_1 = external global [64 x [64 x bfloat]]
@of_8_switch_join_0_0_buff_0 = external global [64 x [64 x bfloat]]

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.aie2p.acquire(i32, i32) #0

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.aie2p.release(i32, i32) #0

declare void @op0_init_scale_buffer(ptr, i32) local_unnamed_addr

declare void @op0_passThroughLine(ptr, ptr, i32) local_unnamed_addr

declare void @op0_partial_softmax_mode(ptr, ptr, ptr, ptr, bfloat, i32, i32, i32, i32, i32) local_unnamed_addr

define void @core_0_3() local_unnamed_addr {
  br label %.preheader

.preheader:                                       ; preds = %0, %36
  %1 = phi i32 [ 0, %0 ], [ %24, %36 ]
  %2 = phi i32 [ 0, %0 ], [ %27, %36 ]
  %3 = phi i32 [ 0, %0 ], [ %30, %36 ]
  %4 = phi i64 [ 0, %0 ], [ %37, %36 ]
  br label %5

5:                                                ; preds = %.preheader, %33
  %6 = phi i32 [ %1, %.preheader ], [ %24, %33 ]
  %7 = phi i32 [ %2, %.preheader ], [ %27, %33 ]
  %8 = phi i32 [ %3, %.preheader ], [ %30, %33 ]
  %9 = phi i64 [ 0, %.preheader ], [ %34, %33 ]
  %10 = trunc nuw nsw i64 %9 to i32
  %11 = shl nuw nsw i32 %10, 3
  br label %12

12:                                               ; preds = %5, %21
  %13 = phi i32 [ %6, %5 ], [ %24, %21 ]
  %14 = phi i32 [ %7, %5 ], [ %27, %21 ]
  %15 = phi i32 [ %8, %5 ], [ %30, %21 ]
  %16 = phi i64 [ 0, %5 ], [ %31, %21 ]
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
  tail call void @op0_partial_softmax_mode(ptr nonnull %17, ptr nonnull %spec.select, ptr nonnull @flash_state_0_3, ptr nonnull @flash_index_0_3, bfloat 0xR3FB9, i32 64, i32 64, i32 4096, i32 4096, i32 2)
  tail call void @llvm.aie2p.acquire(i32 52, i32 -1)
  %cond2 = icmp eq i32 %13, 1
  %spec.select4 = select i1 %cond2, ptr @flash_scale_0_3_buff_1, ptr @flash_scale_0_3_buff_0
  tail call void @op0_passThroughLine(ptr nonnull @flash_state_0_3, ptr nonnull %spec.select4, i32 256)
  tail call void @llvm.aie2p.release(i32 53, i32 1)
  %22 = add i32 %13, 1
  %23 = icmp sgt i32 %22, 1
  %24 = select i1 %23, i32 0, i32 %22
  tail call void @llvm.aie2p.release(i32 50, i32 1)
  %25 = add i32 %14, 1
  %26 = icmp sgt i32 %25, 1
  %27 = select i1 %26, i32 0, i32 %25
  tail call void @llvm.aie2p.release(i32 49, i32 1)
  %28 = add i32 %15, 1
  %29 = icmp sgt i32 %28, 1
  %30 = select i1 %29, i32 0, i32 %28
  %31 = add nuw nsw i64 %16, 1
  %32 = icmp samesign ult i64 %16, 63
  br i1 %32, label %12, label %33

33:                                               ; preds = %21
  %34 = add nuw nsw i64 %9, 1
  %35 = icmp samesign ult i64 %9, 7
  br i1 %35, label %5, label %36

36:                                               ; preds = %33
  %37 = add nuw nsw i64 %4, 1
  %38 = icmp samesign ult i64 %4, 4294967294
  br i1 %38, label %.preheader, label %39

39:                                               ; preds = %36
  ret void
}

attributes #0 = { mustprogress nocallback nofree nosync nounwind willreturn }

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
