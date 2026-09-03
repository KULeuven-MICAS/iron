; ModuleID = '/home/micas/iron-stream-dse/experiments/tr_mha/mha_prefill_stream_k1_h1_s512_d64_flash_shared_traced65536_fused.mlir.d/peano-linked_op0__MHAStreamGroup_core_3_2.ll'
source_filename = "LLVMDialectModule"
target datalayout = "e-m:e-p:20:32-i1:8:32-i8:8:32-i16:16:32-i32:32:32-f32:32:32-i64:32-f64:32-a:0:32-n32"
target triple = "aie2p"

@of_3_unicast_3_0_cons_buff_1 = external global [64 x [64 x bfloat]]
@of_3_unicast_3_0_cons_buff_0 = external global [64 x [64 x bfloat]]
@of_4_broadcast_0_0_3_cons_buff_1 = external global [64 x [64 x bfloat]]
@of_4_broadcast_0_0_3_cons_buff_0 = external global [64 x [64 x bfloat]]
@of_6_unicast_3_buff_0 = external global [64 x [64 x bfloat]]
@of_6_unicast_3_relay_1_buff_0 = external global [64 x [64 x bfloat]]

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.aie2p.acquire(i32, i32) #0

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.aie2p.release(i32, i32) #0

declare void @op0_zero_bf16_64_64_64(ptr) local_unnamed_addr

declare void @op0_matmul_bf16_bf16_64_64_64(ptr, ptr, ptr) local_unnamed_addr

define void @core_3_2() local_unnamed_addr {
  br label %1

1:                                                ; preds = %0, %24
  %2 = phi i32 [ 0, %0 ], [ %21, %24 ]
  %3 = phi i64 [ 0, %0 ], [ %25, %24 ]
  tail call void @llvm.aie2p.acquire(i32 55, i32 -2)
  br label %4

4:                                                ; preds = %1, %18
  %5 = phi i32 [ %2, %1 ], [ %21, %18 ]
  %6 = phi i64 [ 0, %1 ], [ %22, %18 ]
  tail call void @llvm.aie2p.acquire(i32 53, i32 -1)
  %cond = icmp eq i32 %5, 1
  %spec.select = select i1 %cond, ptr @of_4_broadcast_0_0_3_cons_buff_1, ptr @of_4_broadcast_0_0_3_cons_buff_0
  tail call void @llvm.aie2p.acquire(i32 50, i32 -1)
  tail call void @llvm.aie2p.acquire(i32 48, i32 -1)
  tail call void @op0_zero_bf16_64_64_64(ptr nonnull @of_6_unicast_3_buff_0)
  tail call void @op0_zero_bf16_64_64_64(ptr nonnull @of_6_unicast_3_relay_1_buff_0)
  %7 = trunc nuw nsw i64 %6 to i32
  br label %8

8:                                                ; preds = %4, %15
  %9 = phi i64 [ 0, %4 ], [ %16, %15 ]
  %10 = trunc nuw nsw i64 %9 to i32
  %11 = shl nuw nsw i32 %10, 2
  %12 = or disjoint i32 %11, 3
  %.not = icmp slt i32 %12, %7
  br i1 %.not, label %15, label %13

13:                                               ; preds = %8
  %cond1 = icmp eq i64 %9, 1
  %14 = select i1 %cond1, ptr @of_3_unicast_3_0_cons_buff_1, ptr @of_3_unicast_3_0_cons_buff_0
  %spec.select5 = select i1 %cond1, ptr @of_6_unicast_3_relay_1_buff_0, ptr @of_6_unicast_3_buff_0
  tail call void @op0_matmul_bf16_bf16_64_64_64(ptr nonnull %14, ptr nonnull %spec.select, ptr nonnull %spec.select5)
  br label %15

15:                                               ; preds = %13, %8
  %16 = add nuw nsw i64 %9, 1
  %17 = icmp eq i64 %9, 0
  br i1 %17, label %8, label %18

18:                                               ; preds = %15
  tail call void @llvm.aie2p.release(i32 51, i32 1)
  tail call void @llvm.aie2p.release(i32 49, i32 1)
  tail call void @llvm.aie2p.release(i32 52, i32 1)
  %19 = add i32 %5, 1
  %20 = icmp sgt i32 %19, 1
  %21 = select i1 %20, i32 0, i32 %19
  %22 = add nuw nsw i64 %6, 1
  %23 = icmp samesign ult i64 %6, 7
  br i1 %23, label %4, label %24

24:                                               ; preds = %18
  tail call void @llvm.aie2p.release(i32 54, i32 2)
  %25 = add nuw nsw i64 %3, 1
  %26 = icmp samesign ult i64 %3, 4294967294
  br i1 %26, label %1, label %27

27:                                               ; preds = %24
  ret void
}

attributes #0 = { mustprogress nocallback nofree nosync nounwind willreturn }

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
