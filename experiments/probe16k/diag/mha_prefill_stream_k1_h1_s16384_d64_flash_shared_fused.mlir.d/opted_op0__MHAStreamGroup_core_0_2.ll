; ModuleID = '/home/micas/iron-stream-dse/experiments/probe16k/diag/mha_prefill_stream_k1_h1_s16384_d64_flash_shared_fused.mlir.d/peano-linked_op0__MHAStreamGroup_core_0_2.ll'
source_filename = "LLVMDialectModule"
target datalayout = "e-m:e-p:20:32-i1:8:32-i8:8:32-i16:16:32-i32:32:32-f32:32:32-i64:32-f64:32-a:0:32-n32"
target triple = "aie2p"

@of_3_unicast_0_0_cons_buff_1 = external global [64 x [64 x bfloat]]
@of_3_unicast_0_0_cons_buff_0 = external global [64 x [64 x bfloat]]
@of_4_broadcast_0_0_0_cons_buff_1 = external global [64 x [64 x bfloat]]
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
  br label %.preheader

.preheader:                                       ; preds = %0, %34
  %1 = phi i32 [ 0, %0 ], [ %22, %34 ]
  %2 = phi i32 [ 0, %0 ], [ %25, %34 ]
  %3 = phi i32 [ 0, %0 ], [ %31, %34 ]
  %4 = phi i64 [ 0, %0 ], [ %35, %34 ]
  br label %5

5:                                                ; preds = %.preheader, %28
  %6 = phi i32 [ %1, %.preheader ], [ %22, %28 ]
  %7 = phi i32 [ %2, %.preheader ], [ %25, %28 ]
  %8 = phi i32 [ %3, %.preheader ], [ %31, %28 ]
  %9 = phi i64 [ 0, %.preheader ], [ %32, %28 ]
  tail call void @llvm.aie2p.acquire(i32 53, i32 -1)
  %cond = icmp eq i32 %8, 1
  %spec.select = select i1 %cond, ptr @of_3_unicast_0_0_cons_buff_1, ptr @of_3_unicast_0_0_cons_buff_0
  %10 = trunc nuw nsw i64 %9 to i32
  %11 = shl nuw nsw i32 %10, 2
  %zext = zext nneg i32 %11 to i64
  br label %12

12:                                               ; preds = %5, %19
  %13 = phi i32 [ %6, %5 ], [ %22, %19 ]
  %14 = phi i32 [ %7, %5 ], [ %25, %19 ]
  %15 = phi i64 [ 0, %5 ], [ %26, %19 ]
  tail call void @llvm.aie2p.acquire(i32 48, i32 -1)
  %cond1 = icmp eq i32 %14, 1
  %spec.select4 = select i1 %cond1, ptr @of_6_unicast_0_buff_1, ptr @of_6_unicast_0_buff_0
  tail call void @op0_zero_bf16_64_64_64(ptr nonnull %spec.select4)
  tail call void @llvm.aie2p.acquire(i32 51, i32 -1)
  %16 = icmp samesign ugt i64 %15, %zext
  br i1 %16, label %19, label %17

17:                                               ; preds = %12
  %cond2 = icmp eq i32 %13, 1
  %18 = select i1 %cond2, ptr @of_4_broadcast_0_0_0_cons_buff_1, ptr @of_4_broadcast_0_0_0_cons_buff_0
  tail call void @op0_matmul_bf16_bf16_64_64_64(ptr nonnull %spec.select, ptr nonnull %18, ptr nonnull %spec.select4)
  br label %19

19:                                               ; preds = %17, %12
  tail call void @llvm.aie2p.release(i32 50, i32 1)
  %20 = add i32 %13, 1
  %21 = icmp sgt i32 %20, 1
  %22 = select i1 %21, i32 0, i32 %20
  tail call void @llvm.aie2p.release(i32 49, i32 1)
  %23 = add i32 %14, 1
  %24 = icmp sgt i32 %23, 1
  %25 = select i1 %24, i32 0, i32 %23
  %26 = add nuw nsw i64 %15, 1
  %27 = icmp samesign ult i64 %15, 255
  br i1 %27, label %12, label %28

28:                                               ; preds = %19
  tail call void @llvm.aie2p.release(i32 52, i32 1)
  %29 = add i32 %8, 1
  %30 = icmp sgt i32 %29, 1
  %31 = select i1 %30, i32 0, i32 %29
  %32 = add nuw nsw i64 %9, 1
  %33 = icmp samesign ult i64 %9, 63
  br i1 %33, label %5, label %34

34:                                               ; preds = %28
  %35 = add nuw nsw i64 %4, 1
  %36 = icmp samesign ult i64 %4, 4294967294
  br i1 %36, label %.preheader, label %37

37:                                               ; preds = %34
  ret void
}

attributes #0 = { mustprogress nocallback nofree nosync nounwind willreturn }

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
