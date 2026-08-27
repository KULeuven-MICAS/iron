; ModuleID = '/home/micas/iron-stream-dse/experiments/grid823/eq_ours_s2048_c4_h32/mha_prefill_stream_k1_h32_s2048_d64_flash_shared_fused.mlir.d/peano-linked_op0__MHAStreamGroup_core_1_3.ll'
source_filename = "LLVMDialectModule"
target datalayout = "e-m:e-p:20:32-i1:8:32-i8:8:32-i16:16:32-i32:32:32-f32:32:32-i64:32-f64:32-a:0:32-n32"
target triple = "aie2p"

@flash_index_1_3 = external global [2 x i32]
@flash_state_1_3 = external global [256 x bfloat]
@flash_scale_1_3_buff_1 = external global [256 x bfloat]
@flash_scale_1_3_buff_0 = external global [256 x bfloat]
@of_7_unicast_1_0_cons_buff_1 = external global [64 x [64 x bfloat]]
@of_7_unicast_1_0_cons_buff_0 = external global [64 x [64 x bfloat]]
@of_8_unicast_1_buff_1 = external global [64 x [64 x bfloat]]
@of_8_unicast_1_buff_0 = external global [64 x [64 x bfloat]]

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.aie2p.acquire(i32, i32) #0

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.aie2p.release(i32, i32) #0

declare void @op0_init_scale_buffer(ptr, i32) local_unnamed_addr

declare void @op0_passThroughLine(ptr, ptr, i32) local_unnamed_addr

declare void @op0_partial_softmax(ptr, ptr, ptr, ptr, bfloat, i32, i32, i32, i32) local_unnamed_addr

define void @core_1_3() local_unnamed_addr {
  br label %.preheader

.preheader:                                       ; preds = %0, %37
  %1 = phi i32 [ 0, %0 ], [ %25, %37 ]
  %2 = phi i32 [ 0, %0 ], [ %28, %37 ]
  %3 = phi i32 [ 0, %0 ], [ %31, %37 ]
  %4 = phi i64 [ 0, %0 ], [ %38, %37 ]
  br label %5

5:                                                ; preds = %.preheader, %34
  %6 = phi i32 [ %1, %.preheader ], [ %25, %34 ]
  %7 = phi i32 [ %2, %.preheader ], [ %28, %34 ]
  %8 = phi i32 [ %3, %.preheader ], [ %31, %34 ]
  %9 = phi i64 [ 0, %.preheader ], [ %35, %34 ]
  %10 = trunc nuw nsw i64 %9 to i32
  %11 = shl nuw nsw i32 %10, 2
  %12 = or disjoint i32 %11, 1
  br label %13

13:                                               ; preds = %5, %22
  %14 = phi i32 [ %6, %5 ], [ %25, %22 ]
  %15 = phi i32 [ %7, %5 ], [ %28, %22 ]
  %16 = phi i32 [ %8, %5 ], [ %31, %22 ]
  %17 = phi i64 [ 0, %5 ], [ %32, %22 ]
  tail call void @llvm.aie2p.acquire(i32 48, i32 -1)
  %cond = icmp eq i32 %16, 1
  %spec.select = select i1 %cond, ptr @of_8_unicast_1_buff_1, ptr @of_8_unicast_1_buff_0
  tail call void @llvm.aie2p.acquire(i32 51, i32 -1)
  %cond1 = icmp eq i32 %15, 1
  %18 = select i1 %cond1, ptr @of_7_unicast_1_0_cons_buff_1, ptr @of_7_unicast_1_0_cons_buff_0
  %19 = trunc nuw nsw i64 %17 to i32
  store i32 %19, ptr @flash_index_1_3, align 4
  store i32 %12, ptr getelementptr inbounds nuw (i8, ptr @flash_index_1_3, i20 4), align 4
  %20 = icmp eq i32 %19, 0
  br i1 %20, label %21, label %22

21:                                               ; preds = %13
  tail call void @op0_init_scale_buffer(ptr nonnull @flash_state_1_3, i32 64)
  br label %22

22:                                               ; preds = %21, %13
  tail call void @op0_partial_softmax(ptr nonnull %18, ptr nonnull %spec.select, ptr nonnull @flash_state_1_3, ptr nonnull @flash_index_1_3, bfloat 0xR3FB9, i32 64, i32 64, i32 2048, i32 2048)
  tail call void @llvm.aie2p.acquire(i32 52, i32 -1)
  %cond2 = icmp eq i32 %14, 1
  %spec.select4 = select i1 %cond2, ptr @flash_scale_1_3_buff_1, ptr @flash_scale_1_3_buff_0
  tail call void @op0_passThroughLine(ptr nonnull @flash_state_1_3, ptr nonnull %spec.select4, i32 256)
  tail call void @llvm.aie2p.release(i32 53, i32 1)
  %23 = add i32 %14, 1
  %24 = icmp sgt i32 %23, 1
  %25 = select i1 %24, i32 0, i32 %23
  tail call void @llvm.aie2p.release(i32 50, i32 1)
  %26 = add i32 %15, 1
  %27 = icmp sgt i32 %26, 1
  %28 = select i1 %27, i32 0, i32 %26
  tail call void @llvm.aie2p.release(i32 49, i32 1)
  %29 = add i32 %16, 1
  %30 = icmp sgt i32 %29, 1
  %31 = select i1 %30, i32 0, i32 %29
  %32 = add nuw nsw i64 %17, 1
  %33 = icmp samesign ult i64 %17, 31
  br i1 %33, label %13, label %34

34:                                               ; preds = %22
  %35 = add nuw nsw i64 %9, 1
  %36 = icmp samesign ult i64 %9, 7
  br i1 %36, label %5, label %37

37:                                               ; preds = %34
  %38 = add nuw nsw i64 %4, 1
  %39 = icmp samesign ult i64 %4, 4294967294
  br i1 %39, label %.preheader, label %40

40:                                               ; preds = %37
  ret void
}

attributes #0 = { mustprogress nocallback nofree nosync nounwind willreturn }

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
