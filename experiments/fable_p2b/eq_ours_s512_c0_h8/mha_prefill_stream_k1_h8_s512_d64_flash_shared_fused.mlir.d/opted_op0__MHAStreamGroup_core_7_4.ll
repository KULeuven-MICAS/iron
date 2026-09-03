; ModuleID = '/home/micas/iron-stream-dse/experiments/fable_p2b/eq_ours_s512_c0_h8/mha_prefill_stream_k1_h8_s512_d64_flash_shared_fused.mlir.d/peano-linked_op0__MHAStreamGroup_core_7_4.ll'
source_filename = "LLVMDialectModule"
target datalayout = "e-m:e-p:20:32-i1:8:32-i8:8:32-i16:16:32-i32:32:32-f32:32:32-i64:32-f64:32-a:0:32-n32"
target triple = "aie2p"

@flash_index_7_4 = external global [2 x i32]
@flash_scale_7_3_7_4_buff_1 = external global [256 x bfloat]
@flash_scale_7_3_7_4_buff_0 = external global [256 x bfloat]
@of_5_broadcast_0_0_7_cons_buff_1 = external global [64 x [64 x bfloat]]
@of_5_broadcast_0_0_7_cons_buff_0 = external global [64 x [64 x bfloat]]
@of_9_unicast_7_0_cons_buff_1 = external global [64 x [64 x bfloat]]
@of_9_unicast_7_0_cons_buff_0 = external global [64 x [64 x bfloat]]
@of_10_unicast_7_buff_1 = external global [64 x [64 x bfloat]]
@of_10_unicast_7_buff_0 = external global [64 x [64 x bfloat]]

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.aie2p.acquire(i32, i32) #0

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.aie2p.release(i32, i32) #0

declare void @op0_rescale_O(ptr, ptr, i32, ptr) local_unnamed_addr

declare void @op0_zero_bf16(ptr) local_unnamed_addr

declare void @op0_matmul_PV(ptr, ptr, ptr, ptr, i32, i32, ptr) local_unnamed_addr

define void @core_7_4() local_unnamed_addr {
  br label %1

1:                                                ; preds = %0, %31
  %2 = phi i32 [ 0, %0 ], [ %22, %31 ]
  %3 = phi i32 [ 0, %0 ], [ %25, %31 ]
  %4 = phi i32 [ 0, %0 ], [ %28, %31 ]
  %5 = phi i32 [ 0, %0 ], [ %34, %31 ]
  %6 = phi i64 [ 0, %0 ], [ %35, %31 ]
  tail call void @llvm.aie2p.acquire(i32 48, i32 -1)
  %cond = icmp eq i32 %5, 1
  %spec.select = select i1 %cond, ptr @of_10_unicast_7_buff_1, ptr @of_10_unicast_7_buff_0
  tail call void @op0_zero_bf16(ptr nonnull %spec.select)
  br label %7

7:                                                ; preds = %1, %19
  %8 = phi i32 [ %2, %1 ], [ %22, %19 ]
  %9 = phi i32 [ %3, %1 ], [ %25, %19 ]
  %10 = phi i32 [ %4, %1 ], [ %28, %19 ]
  %11 = phi i64 [ 0, %1 ], [ %29, %19 ]
  tail call void @llvm.aie2p.acquire(i32 51, i32 -1)
  %cond1 = icmp eq i32 %10, 1
  %spec.select5 = select i1 %cond1, ptr @of_9_unicast_7_0_cons_buff_1, ptr @of_9_unicast_7_0_cons_buff_0
  tail call void @llvm.aie2p.acquire(i32 53, i32 -1)
  %cond2 = icmp eq i32 %9, 1
  %12 = select i1 %cond2, ptr @of_5_broadcast_0_0_7_cons_buff_1, ptr @of_5_broadcast_0_0_7_cons_buff_0
  %13 = trunc nuw nsw i64 %11 to i32
  store i32 %13, ptr @flash_index_7_4, align 4
  store i32 7, ptr getelementptr inbounds nuw (i8, ptr @flash_index_7_4, i20 4), align 4
  tail call void @llvm.aie2p.acquire(i32 5, i32 -1)
  %cond3 = icmp eq i32 %8, 1
  %14 = select i1 %cond3, ptr @flash_scale_7_3_7_4_buff_1, ptr @flash_scale_7_3_7_4_buff_0
  %15 = icmp ne i32 %13, 0
  %16 = zext i1 %15 to i32
  tail call void @op0_matmul_PV(ptr nonnull %spec.select5, ptr nonnull %12, ptr nonnull %spec.select, ptr nonnull %14, i32 64, i32 %16, ptr nonnull @flash_index_7_4)
  %17 = icmp eq i32 %13, 7
  br i1 %17, label %18, label %19

18:                                               ; preds = %7
  tail call void @op0_rescale_O(ptr nonnull %spec.select, ptr nonnull %14, i32 64, ptr nonnull @flash_index_7_4)
  br label %19

19:                                               ; preds = %18, %7
  tail call void @llvm.aie2p.release(i32 4, i32 1)
  %20 = add i32 %8, 1
  %21 = icmp sgt i32 %20, 1
  %22 = select i1 %21, i32 0, i32 %20
  tail call void @llvm.aie2p.release(i32 52, i32 1)
  %23 = add i32 %9, 1
  %24 = icmp sgt i32 %23, 1
  %25 = select i1 %24, i32 0, i32 %23
  tail call void @llvm.aie2p.release(i32 50, i32 1)
  %26 = add i32 %10, 1
  %27 = icmp sgt i32 %26, 1
  %28 = select i1 %27, i32 0, i32 %26
  %29 = add nuw nsw i64 %11, 1
  %30 = icmp samesign ult i64 %11, 7
  br i1 %30, label %7, label %31

31:                                               ; preds = %19
  tail call void @llvm.aie2p.release(i32 49, i32 1)
  %32 = add i32 %5, 1
  %33 = icmp sgt i32 %32, 1
  %34 = select i1 %33, i32 0, i32 %32
  %35 = add nuw nsw i64 %6, 1
  %36 = icmp samesign ult i64 %6, 4294967294
  br i1 %36, label %1, label %37

37:                                               ; preds = %31
  ret void
}

attributes #0 = { mustprogress nocallback nofree nosync nounwind willreturn }

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
