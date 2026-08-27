; ModuleID = '/home/micas/iron-stream-dse/experiments/rows_fast/equal/eq_ours_s2048_c8_h32/mha_prefill_stream_k1_h32_s2048_d64_flash_shared_fused.mlir.d/peano-linked_op0__MHAStreamGroup_core_2_2.ll'
source_filename = "LLVMDialectModule"
target datalayout = "e-m:e-p:20:32-i1:8:32-i8:8:32-i16:16:32-i32:32:32-f32:32:32-i64:32-f64:32-a:0:32-n32"
target triple = "aie2p"

@of_3_unicast_2_0_cons_buff_1 = external global [64 x [64 x bfloat]]
@of_3_unicast_2_0_cons_buff_0 = external global [64 x [64 x bfloat]]
@of_4_broadcast_0_0_2_cons_buff_1 = external global [64 x [64 x bfloat]]
@of_4_broadcast_0_0_2_cons_buff_0 = external global [64 x [64 x bfloat]]
@of_6_unicast_2_buff_1 = external global [64 x [64 x bfloat]]
@of_6_unicast_2_buff_0 = external global [64 x [64 x bfloat]]

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.aie2p.acquire(i32, i32) #0

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.aie2p.release(i32, i32) #0

declare void @op0_zero_bf16_64_64_64(ptr) local_unnamed_addr

declare void @op0_matmul_bf16_bf16_64_64_64(ptr, ptr, ptr) local_unnamed_addr

define void @core_2_2() local_unnamed_addr {
  br label %.preheader

.preheader:                                       ; preds = %0, %35
  %1 = phi i32 [ 0, %0 ], [ %23, %35 ]
  %2 = phi i32 [ 0, %0 ], [ %26, %35 ]
  %3 = phi i32 [ 0, %0 ], [ %32, %35 ]
  %4 = phi i64 [ 0, %0 ], [ %36, %35 ]
  br label %5

5:                                                ; preds = %.preheader, %29
  %6 = phi i32 [ %1, %.preheader ], [ %23, %29 ]
  %7 = phi i32 [ %2, %.preheader ], [ %26, %29 ]
  %8 = phi i32 [ %3, %.preheader ], [ %32, %29 ]
  %9 = phi i64 [ 0, %.preheader ], [ %33, %29 ]
  tail call void @llvm.aie2p.acquire(i32 53, i32 -1)
  %cond = icmp eq i32 %8, 1
  %spec.select = select i1 %cond, ptr @of_3_unicast_2_0_cons_buff_1, ptr @of_3_unicast_2_0_cons_buff_0
  %10 = trunc nuw nsw i64 %9 to i32
  %11 = shl nuw nsw i32 %10, 3
  %12 = or disjoint i32 %11, 2
  %zext = zext nneg i32 %12 to i64
  br label %13

13:                                               ; preds = %5, %20
  %14 = phi i32 [ %6, %5 ], [ %23, %20 ]
  %15 = phi i32 [ %7, %5 ], [ %26, %20 ]
  %16 = phi i64 [ 0, %5 ], [ %27, %20 ]
  tail call void @llvm.aie2p.acquire(i32 48, i32 -1)
  %cond1 = icmp eq i32 %15, 1
  %spec.select4 = select i1 %cond1, ptr @of_6_unicast_2_buff_1, ptr @of_6_unicast_2_buff_0
  tail call void @op0_zero_bf16_64_64_64(ptr nonnull %spec.select4)
  tail call void @llvm.aie2p.acquire(i32 51, i32 -1)
  %17 = icmp samesign ugt i64 %16, %zext
  br i1 %17, label %20, label %18

18:                                               ; preds = %13
  %cond2 = icmp eq i32 %14, 1
  %19 = select i1 %cond2, ptr @of_4_broadcast_0_0_2_cons_buff_1, ptr @of_4_broadcast_0_0_2_cons_buff_0
  tail call void @op0_matmul_bf16_bf16_64_64_64(ptr nonnull %spec.select, ptr nonnull %19, ptr nonnull %spec.select4)
  br label %20

20:                                               ; preds = %18, %13
  tail call void @llvm.aie2p.release(i32 50, i32 1)
  %21 = add i32 %14, 1
  %22 = icmp sgt i32 %21, 1
  %23 = select i1 %22, i32 0, i32 %21
  tail call void @llvm.aie2p.release(i32 49, i32 1)
  %24 = add i32 %15, 1
  %25 = icmp sgt i32 %24, 1
  %26 = select i1 %25, i32 0, i32 %24
  %27 = add nuw nsw i64 %16, 1
  %28 = icmp samesign ult i64 %16, 31
  br i1 %28, label %13, label %29

29:                                               ; preds = %20
  tail call void @llvm.aie2p.release(i32 52, i32 1)
  %30 = add i32 %8, 1
  %31 = icmp sgt i32 %30, 1
  %32 = select i1 %31, i32 0, i32 %30
  %33 = add nuw nsw i64 %9, 1
  %34 = icmp samesign ult i64 %9, 3
  br i1 %34, label %5, label %35

35:                                               ; preds = %29
  %36 = add nuw nsw i64 %4, 1
  %37 = icmp samesign ult i64 %4, 4294967294
  br i1 %37, label %.preheader, label %38

38:                                               ; preds = %35
  ret void
}

attributes #0 = { mustprogress nocallback nofree nosync nounwind willreturn }

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
