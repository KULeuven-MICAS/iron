; ModuleID = '/home/micas/iron-stream-dse/experiments/trace_mha_final/mha_prefill_stream_k1_h1_s2048_d64_flash_shared_traced65536_fused.mlir.d/peano-linked_op0__MHAStreamGroup_core_4_4.ll'
source_filename = "LLVMDialectModule"
target datalayout = "e-m:e-p:20:32-i1:8:32-i8:8:32-i16:16:32-i32:32:32-f32:32:32-i64:32-f64:32-a:0:32-n32"
target triple = "aie2p"

@flash_index_4_4 = external global [2 x i32]
@flash_scale_4_3_4_4_buff_1 = external global [256 x bfloat]
@flash_scale_4_3_4_4_buff_0 = external global [256 x bfloat]
@of_5_broadcast_0_0_4_cons_buff_1 = external global [64 x [64 x bfloat]]
@of_5_broadcast_0_0_4_cons_buff_0 = external global [64 x [64 x bfloat]]
@of_9_unicast_4_0_cons_buff_1 = external global [64 x [64 x bfloat]]
@of_9_unicast_4_0_cons_buff_0 = external global [64 x [64 x bfloat]]
@of_10_unicast_4_buff_1 = external global [64 x [64 x bfloat]]
@of_10_unicast_4_buff_0 = external global [64 x [64 x bfloat]]

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.aie2p.acquire(i32, i32) #0

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.aie2p.release(i32, i32) #0

declare void @op0_rescale_O(ptr, ptr, i32, ptr) local_unnamed_addr

declare void @op0_zero_bf16(ptr) local_unnamed_addr

declare void @op0_matmul_PV(ptr, ptr, ptr, ptr, i32, i32, ptr) local_unnamed_addr

define void @core_4_4() local_unnamed_addr {
  br label %.preheader

.preheader:                                       ; preds = %0, %45
  %1 = phi i32 [ 0, %0 ], [ %30, %45 ]
  %2 = phi i32 [ 0, %0 ], [ %33, %45 ]
  %3 = phi i32 [ 0, %0 ], [ %36, %45 ]
  %4 = phi i32 [ 0, %0 ], [ %42, %45 ]
  %5 = phi i64 [ 0, %0 ], [ %46, %45 ]
  br label %6

6:                                                ; preds = %.preheader, %39
  %7 = phi i32 [ %1, %.preheader ], [ %30, %39 ]
  %8 = phi i32 [ %2, %.preheader ], [ %33, %39 ]
  %9 = phi i32 [ %3, %.preheader ], [ %36, %39 ]
  %10 = phi i32 [ %4, %.preheader ], [ %42, %39 ]
  %11 = phi i64 [ 0, %.preheader ], [ %43, %39 ]
  tail call void @llvm.aie2p.acquire(i32 48, i32 -1)
  %cond = icmp eq i32 %10, 1
  %spec.select = select i1 %cond, ptr @of_10_unicast_4_buff_1, ptr @of_10_unicast_4_buff_0
  tail call void @op0_zero_bf16(ptr nonnull %spec.select)
  %12 = trunc nuw nsw i64 %11 to i32
  %13 = shl nuw nsw i32 %12, 3
  %14 = or disjoint i32 %13, 4
  br label %15

15:                                               ; preds = %6, %27
  %16 = phi i32 [ %7, %6 ], [ %30, %27 ]
  %17 = phi i32 [ %8, %6 ], [ %33, %27 ]
  %18 = phi i32 [ %9, %6 ], [ %36, %27 ]
  %19 = phi i64 [ 0, %6 ], [ %37, %27 ]
  tail call void @llvm.aie2p.acquire(i32 51, i32 -1)
  %cond1 = icmp eq i32 %18, 1
  %spec.select5 = select i1 %cond1, ptr @of_9_unicast_4_0_cons_buff_1, ptr @of_9_unicast_4_0_cons_buff_0
  tail call void @llvm.aie2p.acquire(i32 53, i32 -1)
  %cond2 = icmp eq i32 %17, 1
  %20 = select i1 %cond2, ptr @of_5_broadcast_0_0_4_cons_buff_1, ptr @of_5_broadcast_0_0_4_cons_buff_0
  %21 = trunc nuw nsw i64 %19 to i32
  store i32 %21, ptr @flash_index_4_4, align 4
  store i32 %14, ptr getelementptr inbounds nuw (i8, ptr @flash_index_4_4, i20 4), align 4
  tail call void @llvm.aie2p.acquire(i32 5, i32 -1)
  %cond3 = icmp eq i32 %16, 1
  %22 = select i1 %cond3, ptr @flash_scale_4_3_4_4_buff_1, ptr @flash_scale_4_3_4_4_buff_0
  %23 = icmp ne i32 %21, 0
  %24 = zext i1 %23 to i32
  tail call void @op0_matmul_PV(ptr nonnull %spec.select5, ptr nonnull %20, ptr nonnull %spec.select, ptr nonnull %22, i32 64, i32 %24, ptr nonnull @flash_index_4_4)
  %25 = icmp eq i32 %21, 31
  br i1 %25, label %26, label %27

26:                                               ; preds = %15
  tail call void @op0_rescale_O(ptr nonnull %spec.select, ptr nonnull %22, i32 64, ptr nonnull @flash_index_4_4)
  br label %27

27:                                               ; preds = %26, %15
  tail call void @llvm.aie2p.release(i32 4, i32 1)
  %28 = add i32 %16, 1
  %29 = icmp sgt i32 %28, 1
  %30 = select i1 %29, i32 0, i32 %28
  tail call void @llvm.aie2p.release(i32 52, i32 1)
  %31 = add i32 %17, 1
  %32 = icmp sgt i32 %31, 1
  %33 = select i1 %32, i32 0, i32 %31
  tail call void @llvm.aie2p.release(i32 50, i32 1)
  %34 = add i32 %18, 1
  %35 = icmp sgt i32 %34, 1
  %36 = select i1 %35, i32 0, i32 %34
  %37 = add nuw nsw i64 %19, 1
  %38 = icmp samesign ult i64 %19, 31
  br i1 %38, label %15, label %39

39:                                               ; preds = %27
  tail call void @llvm.aie2p.release(i32 49, i32 1)
  %40 = add i32 %10, 1
  %41 = icmp sgt i32 %40, 1
  %42 = select i1 %41, i32 0, i32 %40
  %43 = add nuw nsw i64 %11, 1
  %44 = icmp samesign ult i64 %11, 3
  br i1 %44, label %6, label %45

45:                                               ; preds = %39
  %46 = add nuw nsw i64 %5, 1
  %47 = icmp samesign ult i64 %5, 4294967294
  br i1 %47, label %.preheader, label %48

48:                                               ; preds = %45
  ret void
}

attributes #0 = { mustprogress nocallback nofree nosync nounwind willreturn }

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
