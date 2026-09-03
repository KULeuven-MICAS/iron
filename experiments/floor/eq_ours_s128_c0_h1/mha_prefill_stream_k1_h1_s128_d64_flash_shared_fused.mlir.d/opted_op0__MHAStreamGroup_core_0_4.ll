; ModuleID = '/home/micas/iron-stream-dse/experiments/floor/eq_ours_s128_c0_h1/mha_prefill_stream_k1_h1_s128_d64_flash_shared_fused.mlir.d/peano-linked_op0__MHAStreamGroup_core_0_4.ll'
source_filename = "LLVMDialectModule"
target datalayout = "e-m:e-p:20:32-i1:8:32-i8:8:32-i16:16:32-i32:32:32-f32:32:32-i64:32-f64:32-a:0:32-n32"
target triple = "aie2p"

@flash_index_0_4 = external global [2 x i32]
@flash_scale_0_3_0_4_buff_1 = external global [256 x bfloat]
@flash_scale_0_3_0_4_buff_0 = external global [256 x bfloat]
@of_5_broadcast_0_0_0_cons_buff_1 = external global [64 x [64 x bfloat]]
@of_5_broadcast_0_0_0_cons_buff_0 = external global [64 x [64 x bfloat]]
@of_9_unicast_0_0_cons_buff_1 = external global [64 x [64 x bfloat]]
@of_9_unicast_0_0_cons_buff_0 = external global [64 x [64 x bfloat]]
@of_10_unicast_0_buff_1 = external global [64 x [64 x bfloat]]
@of_10_unicast_0_buff_0 = external global [64 x [64 x bfloat]]

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.aie2p.acquire(i32, i32) #0

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.aie2p.release(i32, i32) #0

declare void @op0_rescale_O(ptr, ptr, i32, ptr) local_unnamed_addr

declare void @op0_zero_bf16(ptr) local_unnamed_addr

declare void @op0_matmul_PV(ptr, ptr, ptr, ptr, i32, i32, ptr) local_unnamed_addr

define void @core_0_4() local_unnamed_addr {
  br label %1

1:                                                ; preds = %0, %19
  %2 = phi i32 [ 0, %0 ], [ %16, %19 ]
  %3 = phi i32 [ 0, %0 ], [ %22, %19 ]
  %4 = phi i64 [ 0, %0 ], [ %23, %19 ]
  tail call void @llvm.aie2p.acquire(i32 48, i32 -1)
  %cond = icmp eq i32 %3, 1
  %spec.select = select i1 %cond, ptr @of_10_unicast_0_buff_1, ptr @of_10_unicast_0_buff_0
  tail call void @op0_zero_bf16(ptr nonnull %spec.select)
  tail call void @llvm.aie2p.acquire(i32 51, i32 -2)
  tail call void @llvm.aie2p.acquire(i32 53, i32 -2)
  br label %5

5:                                                ; preds = %1, %13
  %6 = phi i32 [ %2, %1 ], [ %16, %13 ]
  %7 = phi i64 [ 0, %1 ], [ %17, %13 ]
  %cond1 = icmp eq i64 %7, 1
  %spec.select5 = select i1 %cond1, ptr @of_9_unicast_0_0_cons_buff_1, ptr @of_9_unicast_0_0_cons_buff_0
  %8 = select i1 %cond1, ptr @of_5_broadcast_0_0_0_cons_buff_1, ptr @of_5_broadcast_0_0_0_cons_buff_0
  %9 = trunc nuw nsw i64 %7 to i32
  store i32 %9, ptr @flash_index_0_4, align 4
  store i32 0, ptr getelementptr inbounds nuw (i8, ptr @flash_index_0_4, i20 4), align 4
  tail call void @llvm.aie2p.acquire(i32 5, i32 -1)
  %cond3 = icmp eq i32 %6, 1
  %10 = select i1 %cond3, ptr @flash_scale_0_3_0_4_buff_1, ptr @flash_scale_0_3_0_4_buff_0
  tail call void @op0_matmul_PV(ptr nonnull %spec.select5, ptr nonnull %8, ptr nonnull %spec.select, ptr nonnull %10, i32 64, i32 %9, ptr nonnull @flash_index_0_4)
  %11 = icmp eq i32 %9, 1
  br i1 %11, label %12, label %13

12:                                               ; preds = %5
  tail call void @op0_rescale_O(ptr nonnull %spec.select, ptr nonnull %10, i32 64, ptr nonnull @flash_index_0_4)
  br label %13

13:                                               ; preds = %12, %5
  tail call void @llvm.aie2p.release(i32 4, i32 1)
  %14 = add i32 %6, 1
  %15 = icmp sgt i32 %14, 1
  %16 = select i1 %15, i32 0, i32 %14
  %17 = add nuw nsw i64 %7, 1
  %18 = icmp eq i64 %7, 0
  br i1 %18, label %5, label %19

19:                                               ; preds = %13
  tail call void @llvm.aie2p.release(i32 52, i32 2)
  tail call void @llvm.aie2p.release(i32 50, i32 2)
  tail call void @llvm.aie2p.release(i32 49, i32 1)
  %20 = add i32 %3, 1
  %21 = icmp sgt i32 %20, 1
  %22 = select i1 %21, i32 0, i32 %20
  %23 = add nuw nsw i64 %4, 1
  %24 = icmp samesign ult i64 %4, 4294967294
  br i1 %24, label %1, label %25

25:                                               ; preds = %19
  ret void
}

attributes #0 = { mustprogress nocallback nofree nosync nounwind willreturn }

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
