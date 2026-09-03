; ModuleID = '/home/micas/iron-stream-dse/experiments/sweep_260902/ours/eq_ours_s512_c0_h48/mha_prefill_stream_k1_h48_s512_d64_flash_shared_fused.mlir.d/peano-linked_op0__MHAStreamGroup_core_3_2.ll'
source_filename = "LLVMDialectModule"
target datalayout = "e-m:e-p:20:32-i1:8:32-i8:8:32-i16:16:32-i32:32:32-f32:32:32-i64:32-f64:32-a:0:32-n32"
target triple = "aie2p"

@of_3_unicast_3_0_cons_buff_0 = external global [64 x [64 x bfloat]]
@of_4_broadcast_0_0_3_cons_buff_1 = external global [64 x [64 x bfloat]]
@of_4_broadcast_0_0_3_cons_buff_0 = external global [64 x [64 x bfloat]]
@of_6_unicast_3_buff_1 = external global [64 x [64 x bfloat]]
@of_6_unicast_3_buff_0 = external global [64 x [64 x bfloat]]

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.aie2p.acquire(i32, i32) #0

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.aie2p.release(i32, i32) #0

declare void @op0_zero_bf16_64_64_64(ptr) local_unnamed_addr

declare void @op0_matmul_bf16_bf16_64_64_64(ptr, ptr, ptr) local_unnamed_addr

define void @core_3_2() local_unnamed_addr {
  br label %1

1:                                                ; preds = %0, %21
  %2 = phi i32 [ 0, %0 ], [ %15, %21 ]
  %3 = phi i32 [ 0, %0 ], [ %18, %21 ]
  %4 = phi i64 [ 0, %0 ], [ %22, %21 ]
  tail call void @llvm.aie2p.acquire(i32 53, i32 -1)
  br label %5

5:                                                ; preds = %1, %12
  %6 = phi i32 [ %2, %1 ], [ %15, %12 ]
  %7 = phi i32 [ %3, %1 ], [ %18, %12 ]
  %8 = phi i64 [ 0, %1 ], [ %19, %12 ]
  tail call void @llvm.aie2p.acquire(i32 48, i32 -1)
  %cond = icmp eq i32 %7, 1
  %spec.select = select i1 %cond, ptr @of_6_unicast_3_buff_1, ptr @of_6_unicast_3_buff_0
  tail call void @op0_zero_bf16_64_64_64(ptr nonnull %spec.select)
  tail call void @llvm.aie2p.acquire(i32 51, i32 -1)
  %9 = icmp samesign ult i64 %8, 4
  br i1 %9, label %10, label %12

10:                                               ; preds = %5
  %cond1 = icmp eq i32 %6, 1
  %11 = select i1 %cond1, ptr @of_4_broadcast_0_0_3_cons_buff_1, ptr @of_4_broadcast_0_0_3_cons_buff_0
  tail call void @op0_matmul_bf16_bf16_64_64_64(ptr nonnull @of_3_unicast_3_0_cons_buff_0, ptr nonnull %11, ptr nonnull %spec.select)
  br label %12

12:                                               ; preds = %10, %5
  tail call void @llvm.aie2p.release(i32 50, i32 1)
  %13 = add i32 %6, 1
  %14 = icmp sgt i32 %13, 1
  %15 = select i1 %14, i32 0, i32 %13
  tail call void @llvm.aie2p.release(i32 49, i32 1)
  %16 = add i32 %7, 1
  %17 = icmp sgt i32 %16, 1
  %18 = select i1 %17, i32 0, i32 %16
  %19 = add nuw nsw i64 %8, 1
  %20 = icmp samesign ult i64 %8, 7
  br i1 %20, label %5, label %21

21:                                               ; preds = %12
  tail call void @llvm.aie2p.release(i32 52, i32 1)
  %22 = add nuw nsw i64 %4, 1
  %23 = icmp samesign ult i64 %4, 4294967294
  br i1 %23, label %1, label %24

24:                                               ; preds = %21
  ret void
}

attributes #0 = { mustprogress nocallback nofree nosync nounwind willreturn }

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
