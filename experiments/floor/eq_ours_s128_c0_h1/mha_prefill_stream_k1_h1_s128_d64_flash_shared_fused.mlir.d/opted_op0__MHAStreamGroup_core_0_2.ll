; ModuleID = '/home/micas/iron-stream-dse/experiments/floor/eq_ours_s128_c0_h1/mha_prefill_stream_k1_h1_s128_d64_flash_shared_fused.mlir.d/peano-linked_op0__MHAStreamGroup_core_0_2.ll'
source_filename = "LLVMDialectModule"
target datalayout = "e-m:e-p:20:32-i1:8:32-i8:8:32-i16:16:32-i32:32:32-f32:32:32-i64:32-f64:32-a:0:32-n32"
target triple = "aie2p"

@of_3_unicast_0_0_cons_buff_0 = external global [64 x [64 x bfloat]]
@of_4_broadcast_0_0_0_cons_buff_0 = external global [64 x [64 x bfloat]]
@of_6_unicast_0_buff_1 = external global [64 x [64 x bfloat]]
@of_6_unicast_0_buff_0 = external global [64 x [64 x bfloat]]

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.aie2p.acquire(i32, i32) #0

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.aie2p.release(i32, i32) #0

declare void @op0_zero_bf16_64_64_64(ptr) local_unnamed_addr

declare void @op0_matmul_bf16_bf16_64_64_64(ptr, ptr, ptr) local_unnamed_addr

define void @core_0_2() local_unnamed_addr {
  br label %1

1:                                                ; preds = %0, %15
  %2 = phi i32 [ 0, %0 ], [ %12, %15 ]
  %3 = phi i64 [ 0, %0 ], [ %16, %15 ]
  tail call void @llvm.aie2p.acquire(i32 51, i32 -2)
  tail call void @llvm.aie2p.acquire(i32 53, i32 -1)
  br label %4

4:                                                ; preds = %1, %9
  %5 = phi i32 [ %2, %1 ], [ %12, %9 ]
  %6 = phi i64 [ 0, %1 ], [ %13, %9 ]
  tail call void @llvm.aie2p.acquire(i32 48, i32 -1)
  %cond = icmp eq i32 %5, 1
  %spec.select = select i1 %cond, ptr @of_6_unicast_0_buff_1, ptr @of_6_unicast_0_buff_0
  tail call void @op0_zero_bf16_64_64_64(ptr nonnull %spec.select)
  %7 = icmp eq i64 %6, 0
  br i1 %7, label %8, label %9

8:                                                ; preds = %4
  tail call void @op0_matmul_bf16_bf16_64_64_64(ptr nonnull @of_3_unicast_0_0_cons_buff_0, ptr nonnull @of_4_broadcast_0_0_0_cons_buff_0, ptr nonnull %spec.select)
  br label %9

9:                                                ; preds = %8, %4
  tail call void @llvm.aie2p.release(i32 49, i32 1)
  %10 = add i32 %5, 1
  %11 = icmp sgt i32 %10, 1
  %12 = select i1 %11, i32 0, i32 %10
  %13 = add nuw nsw i64 %6, 1
  %14 = icmp eq i64 %6, 0
  br i1 %14, label %4, label %15

15:                                               ; preds = %9
  tail call void @llvm.aie2p.release(i32 52, i32 1)
  tail call void @llvm.aie2p.release(i32 50, i32 2)
  %16 = add nuw nsw i64 %3, 1
  %17 = icmp samesign ult i64 %3, 4294967294
  br i1 %17, label %1, label %18

18:                                               ; preds = %15
  ret void
}

attributes #0 = { mustprogress nocallback nofree nosync nounwind willreturn }

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
