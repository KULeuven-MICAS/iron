; ModuleID = '/home/micas/iron-stream-dse/experiments/fusedab_1/eq_ours_s4096_c4_h32/mha_prefill_stream_k1_h32_s4096_d64_flash_shared_fused.mlir.d/peano-linked_op0__MHAStreamGroup_core_2_4.ll'
source_filename = "LLVMDialectModule"
target datalayout = "e-m:e-p:20:32-i1:8:32-i8:8:32-i16:16:32-i32:32:32-f32:32:32-i64:32-f64:32-a:0:32-n32"
target triple = "aie2p"

@flash_index_2_4 = external global [2 x i32]
@flash_state_2_4 = external global [256 x bfloat]
@flash_scale_2_4_buff_1 = external global [256 x bfloat]
@flash_scale_2_4_buff_0 = external global [256 x bfloat]
@of_3_distribute_1_1_cons_buff_1 = external global [64 x [64 x bfloat]]
@of_3_distribute_1_1_cons_buff_0 = external global [64 x [64 x bfloat]]
@of_4_broadcast_0_0_5_cons_buff_1 = external global [64 x [64 x bfloat]]
@of_4_broadcast_0_0_5_cons_buff_0 = external global [64 x [64 x bfloat]]
@of_6_join_1_1_buff_1 = external global [64 x [64 x bfloat]]
@of_6_join_1_1_buff_0 = external global [64 x [64 x bfloat]]

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.aie2p.acquire(i32, i32) #0

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.aie2p.release(i32, i32) #0

declare void @op0_init_scale_buffer(ptr, i32) local_unnamed_addr

declare void @op0_passThroughLine(ptr, ptr, i32) local_unnamed_addr

declare void @op0_zero_bf16(ptr) local_unnamed_addr

declare void @op0_matmul_softmax(ptr, ptr, ptr, ptr, ptr, bfloat, i32, i32, i32, i32) local_unnamed_addr

define void @core_2_4() local_unnamed_addr {
  br label %.preheader

.preheader:                                       ; preds = %0, %42
  %1 = phi i32 [ 0, %0 ], [ %27, %42 ]
  %2 = phi i32 [ 0, %0 ], [ %30, %42 ]
  %3 = phi i32 [ 0, %0 ], [ %33, %42 ]
  %4 = phi i32 [ 0, %0 ], [ %39, %42 ]
  %5 = phi i64 [ 0, %0 ], [ %43, %42 ]
  br label %6

6:                                                ; preds = %.preheader, %36
  %7 = phi i32 [ %1, %.preheader ], [ %27, %36 ]
  %8 = phi i32 [ %2, %.preheader ], [ %30, %36 ]
  %9 = phi i32 [ %3, %.preheader ], [ %33, %36 ]
  %10 = phi i32 [ %4, %.preheader ], [ %39, %36 ]
  %11 = phi i64 [ 0, %.preheader ], [ %40, %36 ]
  tail call void @llvm.aie2p.acquire(i32 53, i32 -1)
  %cond = icmp eq i32 %10, 1
  %spec.select = select i1 %cond, ptr @of_3_distribute_1_1_cons_buff_1, ptr @of_3_distribute_1_1_cons_buff_0
  %12 = trunc nuw nsw i64 %11 to i32
  %13 = shl nuw nsw i32 %12, 3
  %14 = or disjoint i32 %13, 5
  br label %15

15:                                               ; preds = %6, %24
  %16 = phi i32 [ %7, %6 ], [ %27, %24 ]
  %17 = phi i32 [ %8, %6 ], [ %30, %24 ]
  %18 = phi i32 [ %9, %6 ], [ %33, %24 ]
  %19 = phi i64 [ 0, %6 ], [ %34, %24 ]
  tail call void @llvm.aie2p.acquire(i32 48, i32 -1)
  %cond1 = icmp eq i32 %18, 1
  %spec.select5 = select i1 %cond1, ptr @of_6_join_1_1_buff_1, ptr @of_6_join_1_1_buff_0
  tail call void @op0_zero_bf16(ptr nonnull %spec.select5)
  tail call void @llvm.aie2p.acquire(i32 51, i32 -1)
  %cond2 = icmp eq i32 %17, 1
  %20 = select i1 %cond2, ptr @of_4_broadcast_0_0_5_cons_buff_1, ptr @of_4_broadcast_0_0_5_cons_buff_0
  %21 = trunc nuw nsw i64 %19 to i32
  store i32 %21, ptr @flash_index_2_4, align 4
  store i32 %14, ptr getelementptr inbounds nuw (i8, ptr @flash_index_2_4, i20 4), align 4
  %22 = icmp eq i32 %21, 0
  br i1 %22, label %23, label %24

23:                                               ; preds = %15
  tail call void @op0_init_scale_buffer(ptr nonnull @flash_state_2_4, i32 64)
  br label %24

24:                                               ; preds = %23, %15
  tail call void @op0_matmul_softmax(ptr nonnull %spec.select, ptr nonnull %20, ptr nonnull %spec.select5, ptr nonnull @flash_state_2_4, ptr nonnull @flash_index_2_4, bfloat 0xR3FB9, i32 64, i32 64, i32 4096, i32 4096)
  tail call void @llvm.aie2p.acquire(i32 54, i32 -1)
  %cond3 = icmp eq i32 %16, 1
  %spec.select6 = select i1 %cond3, ptr @flash_scale_2_4_buff_1, ptr @flash_scale_2_4_buff_0
  tail call void @op0_passThroughLine(ptr nonnull @flash_state_2_4, ptr nonnull %spec.select6, i32 256)
  tail call void @llvm.aie2p.release(i32 55, i32 1)
  %25 = add i32 %16, 1
  %26 = icmp sgt i32 %25, 1
  %27 = select i1 %26, i32 0, i32 %25
  tail call void @llvm.aie2p.release(i32 50, i32 1)
  %28 = add i32 %17, 1
  %29 = icmp sgt i32 %28, 1
  %30 = select i1 %29, i32 0, i32 %28
  tail call void @llvm.aie2p.release(i32 49, i32 1)
  %31 = add i32 %18, 1
  %32 = icmp sgt i32 %31, 1
  %33 = select i1 %32, i32 0, i32 %31
  %34 = add nuw nsw i64 %19, 1
  %35 = icmp samesign ult i64 %19, 63
  br i1 %35, label %15, label %36

36:                                               ; preds = %24
  tail call void @llvm.aie2p.release(i32 52, i32 1)
  %37 = add i32 %10, 1
  %38 = icmp sgt i32 %37, 1
  %39 = select i1 %38, i32 0, i32 %37
  %40 = add nuw nsw i64 %11, 1
  %41 = icmp samesign ult i64 %11, 7
  br i1 %41, label %6, label %42

42:                                               ; preds = %36
  %43 = add nuw nsw i64 %5, 1
  %44 = icmp samesign ult i64 %5, 4294967294
  br i1 %44, label %.preheader, label %45

45:                                               ; preds = %42
  ret void
}

attributes #0 = { mustprogress nocallback nofree nosync nounwind willreturn }

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
