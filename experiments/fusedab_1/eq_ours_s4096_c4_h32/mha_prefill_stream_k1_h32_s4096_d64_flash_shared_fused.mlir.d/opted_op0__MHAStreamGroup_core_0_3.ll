; ModuleID = '/home/micas/iron-stream-dse/experiments/fusedab_1/eq_ours_s4096_c4_h32/mha_prefill_stream_k1_h32_s4096_d64_flash_shared_fused.mlir.d/peano-linked_op0__MHAStreamGroup_core_0_3.ll'
source_filename = "LLVMDialectModule"
target datalayout = "e-m:e-p:20:32-i1:8:32-i8:8:32-i16:16:32-i32:32:32-f32:32:32-i64:32-f64:32-a:0:32-n32"
target triple = "aie2p"

@flash_index_0_3 = external global [2 x i32]
@flash_state_0_3 = external global [256 x bfloat]
@flash_scale_0_3_buff_1 = external global [256 x bfloat]
@flash_scale_0_3_buff_0 = external global [256 x bfloat]
@of_3_distribute_0_0_cons_buff_1 = external global [64 x [64 x bfloat]]
@of_3_distribute_0_0_cons_buff_0 = external global [64 x [64 x bfloat]]
@of_4_broadcast_0_0_0_cons_buff_1 = external global [64 x [64 x bfloat]]
@of_4_broadcast_0_0_0_cons_buff_0 = external global [64 x [64 x bfloat]]
@of_6_join_0_0_buff_1 = external global [64 x [64 x bfloat]]
@of_6_join_0_0_buff_0 = external global [64 x [64 x bfloat]]

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.aie2p.acquire(i32, i32) #0

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.aie2p.release(i32, i32) #0

declare void @op0_init_scale_buffer(ptr, i32) local_unnamed_addr

declare void @op0_passThroughLine(ptr, ptr, i32) local_unnamed_addr

declare void @op0_zero_bf16(ptr) local_unnamed_addr

declare void @op0_matmul_softmax(ptr, ptr, ptr, ptr, ptr, bfloat, i32, i32, i32, i32) local_unnamed_addr

define void @core_0_3() local_unnamed_addr {
  br label %.preheader

.preheader:                                       ; preds = %0, %41
  %1 = phi i32 [ 0, %0 ], [ %26, %41 ]
  %2 = phi i32 [ 0, %0 ], [ %29, %41 ]
  %3 = phi i32 [ 0, %0 ], [ %32, %41 ]
  %4 = phi i32 [ 0, %0 ], [ %38, %41 ]
  %5 = phi i64 [ 0, %0 ], [ %42, %41 ]
  br label %6

6:                                                ; preds = %.preheader, %35
  %7 = phi i32 [ %1, %.preheader ], [ %26, %35 ]
  %8 = phi i32 [ %2, %.preheader ], [ %29, %35 ]
  %9 = phi i32 [ %3, %.preheader ], [ %32, %35 ]
  %10 = phi i32 [ %4, %.preheader ], [ %38, %35 ]
  %11 = phi i64 [ 0, %.preheader ], [ %39, %35 ]
  tail call void @llvm.aie2p.acquire(i32 53, i32 -1)
  %cond = icmp eq i32 %10, 1
  %spec.select = select i1 %cond, ptr @of_3_distribute_0_0_cons_buff_1, ptr @of_3_distribute_0_0_cons_buff_0
  %12 = trunc nuw nsw i64 %11 to i32
  %13 = shl nuw nsw i32 %12, 3
  br label %14

14:                                               ; preds = %6, %23
  %15 = phi i32 [ %7, %6 ], [ %26, %23 ]
  %16 = phi i32 [ %8, %6 ], [ %29, %23 ]
  %17 = phi i32 [ %9, %6 ], [ %32, %23 ]
  %18 = phi i64 [ 0, %6 ], [ %33, %23 ]
  tail call void @llvm.aie2p.acquire(i32 48, i32 -1)
  %cond1 = icmp eq i32 %17, 1
  %spec.select5 = select i1 %cond1, ptr @of_6_join_0_0_buff_1, ptr @of_6_join_0_0_buff_0
  tail call void @op0_zero_bf16(ptr nonnull %spec.select5)
  tail call void @llvm.aie2p.acquire(i32 51, i32 -1)
  %cond2 = icmp eq i32 %16, 1
  %19 = select i1 %cond2, ptr @of_4_broadcast_0_0_0_cons_buff_1, ptr @of_4_broadcast_0_0_0_cons_buff_0
  %20 = trunc nuw nsw i64 %18 to i32
  store i32 %20, ptr @flash_index_0_3, align 4
  store i32 %13, ptr getelementptr inbounds nuw (i8, ptr @flash_index_0_3, i20 4), align 4
  %21 = icmp eq i32 %20, 0
  br i1 %21, label %22, label %23

22:                                               ; preds = %14
  tail call void @op0_init_scale_buffer(ptr nonnull @flash_state_0_3, i32 64)
  br label %23

23:                                               ; preds = %22, %14
  tail call void @op0_matmul_softmax(ptr nonnull %spec.select, ptr nonnull %19, ptr nonnull %spec.select5, ptr nonnull @flash_state_0_3, ptr nonnull @flash_index_0_3, bfloat 0xR3FB9, i32 64, i32 64, i32 4096, i32 4096)
  tail call void @llvm.aie2p.acquire(i32 54, i32 -1)
  %cond3 = icmp eq i32 %15, 1
  %spec.select6 = select i1 %cond3, ptr @flash_scale_0_3_buff_1, ptr @flash_scale_0_3_buff_0
  tail call void @op0_passThroughLine(ptr nonnull @flash_state_0_3, ptr nonnull %spec.select6, i32 256)
  tail call void @llvm.aie2p.release(i32 55, i32 1)
  %24 = add i32 %15, 1
  %25 = icmp sgt i32 %24, 1
  %26 = select i1 %25, i32 0, i32 %24
  tail call void @llvm.aie2p.release(i32 50, i32 1)
  %27 = add i32 %16, 1
  %28 = icmp sgt i32 %27, 1
  %29 = select i1 %28, i32 0, i32 %27
  tail call void @llvm.aie2p.release(i32 49, i32 1)
  %30 = add i32 %17, 1
  %31 = icmp sgt i32 %30, 1
  %32 = select i1 %31, i32 0, i32 %30
  %33 = add nuw nsw i64 %18, 1
  %34 = icmp samesign ult i64 %18, 63
  br i1 %34, label %14, label %35

35:                                               ; preds = %23
  tail call void @llvm.aie2p.release(i32 52, i32 1)
  %36 = add i32 %10, 1
  %37 = icmp sgt i32 %36, 1
  %38 = select i1 %37, i32 0, i32 %36
  %39 = add nuw nsw i64 %11, 1
  %40 = icmp samesign ult i64 %11, 7
  br i1 %40, label %6, label %41

41:                                               ; preds = %35
  %42 = add nuw nsw i64 %5, 1
  %43 = icmp samesign ult i64 %5, 4294967294
  br i1 %43, label %.preheader, label %44

44:                                               ; preds = %41
  ret void
}

attributes #0 = { mustprogress nocallback nofree nosync nounwind willreturn }

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
