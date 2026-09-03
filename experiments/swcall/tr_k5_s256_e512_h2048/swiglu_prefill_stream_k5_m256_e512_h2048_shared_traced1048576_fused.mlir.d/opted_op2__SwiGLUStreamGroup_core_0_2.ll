; ModuleID = '/home/micas/iron-stream-dse/experiments/swcall/tr_k5_s256_e512_h2048/swiglu_prefill_stream_k5_m256_e512_h2048_shared_traced1048576_fused.mlir.d/peano-linked_op2__SwiGLUStreamGroup_core_0_2.ll'
source_filename = "LLVMDialectModule"
target datalayout = "e-m:e-p:20:32-i1:8:32-i8:8:32-i16:16:32-i32:32:32-f32:32:32-i64:32-f64:32-a:0:32-n32"
target triple = "aie2p"

@of_1_unicast_0_0_cons_buff_1 = external global [1 x [2048 x bfloat]]
@of_1_unicast_0_0_cons_buff_0 = external global [1 x [2048 x bfloat]]
@of_2_unicast_0_buff_1 = external global [1 x [2048 x bfloat]]
@of_2_unicast_0_buff_0 = external global [1 x [2048 x bfloat]]

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.aie2p.acquire(i32, i32) #0

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.aie2p.release(i32, i32) #0

declare void @op2_silu_bf16(ptr, ptr, i32) local_unnamed_addr

define void @core_0_2() local_unnamed_addr {
  br label %.preheader

.preheader:                                       ; preds = %0, %39
  %1 = phi i32 [ 0, %0 ], [ %33, %39 ]
  %2 = phi i32 [ 0, %0 ], [ %36, %39 ]
  %3 = phi i64 [ 0, %0 ], [ %40, %39 ]
  br label %4

4:                                                ; preds = %4, %.preheader
  %5 = phi i32 [ %1, %.preheader ], [ %33, %4 ]
  %6 = phi i32 [ %2, %.preheader ], [ %36, %4 ]
  %7 = phi i64 [ 0, %.preheader ], [ %37, %4 ]
  tail call void @llvm.aie2p.acquire(i32 51, i32 -1)
  %cond = icmp eq i32 %6, 1
  %spec.select = select i1 %cond, ptr @of_1_unicast_0_0_cons_buff_1, ptr @of_1_unicast_0_0_cons_buff_0
  tail call void @llvm.aie2p.acquire(i32 48, i32 -1)
  %cond1 = icmp eq i32 %5, 1
  %8 = select i1 %cond1, ptr @of_2_unicast_0_buff_1, ptr @of_2_unicast_0_buff_0
  tail call void @op2_silu_bf16(ptr nonnull %spec.select, ptr nonnull %8, i32 2048)
  tail call void @llvm.aie2p.release(i32 49, i32 1)
  %9 = add i32 %5, 1
  %10 = icmp sgt i32 %9, 1
  %11 = select i1 %10, i32 0, i32 %9
  tail call void @llvm.aie2p.release(i32 50, i32 1)
  %12 = add i32 %6, 1
  %13 = icmp sgt i32 %12, 1
  %14 = select i1 %13, i32 0, i32 %12
  tail call void @llvm.aie2p.acquire(i32 51, i32 -1)
  %cond.1 = icmp eq i32 %14, 1
  %spec.select.1 = select i1 %cond.1, ptr @of_1_unicast_0_0_cons_buff_1, ptr @of_1_unicast_0_0_cons_buff_0
  tail call void @llvm.aie2p.acquire(i32 48, i32 -1)
  %cond1.1 = icmp eq i32 %11, 1
  %15 = select i1 %cond1.1, ptr @of_2_unicast_0_buff_1, ptr @of_2_unicast_0_buff_0
  tail call void @op2_silu_bf16(ptr nonnull %spec.select.1, ptr nonnull %15, i32 2048)
  tail call void @llvm.aie2p.release(i32 49, i32 1)
  %16 = add i32 %11, 1
  %17 = icmp sgt i32 %16, 1
  %18 = select i1 %17, i32 0, i32 %16
  tail call void @llvm.aie2p.release(i32 50, i32 1)
  %19 = add i32 %14, 1
  %20 = icmp sgt i32 %19, 1
  %21 = select i1 %20, i32 0, i32 %19
  tail call void @llvm.aie2p.acquire(i32 51, i32 -1)
  %cond.2 = icmp eq i32 %21, 1
  %spec.select.2 = select i1 %cond.2, ptr @of_1_unicast_0_0_cons_buff_1, ptr @of_1_unicast_0_0_cons_buff_0
  tail call void @llvm.aie2p.acquire(i32 48, i32 -1)
  %cond1.2 = icmp eq i32 %18, 1
  %22 = select i1 %cond1.2, ptr @of_2_unicast_0_buff_1, ptr @of_2_unicast_0_buff_0
  tail call void @op2_silu_bf16(ptr nonnull %spec.select.2, ptr nonnull %22, i32 2048)
  tail call void @llvm.aie2p.release(i32 49, i32 1)
  %23 = add i32 %18, 1
  %24 = icmp sgt i32 %23, 1
  %25 = select i1 %24, i32 0, i32 %23
  tail call void @llvm.aie2p.release(i32 50, i32 1)
  %26 = add i32 %21, 1
  %27 = icmp sgt i32 %26, 1
  %28 = select i1 %27, i32 0, i32 %26
  %29 = or disjoint i64 %7, 3
  tail call void @llvm.aie2p.acquire(i32 51, i32 -1)
  %cond.3 = icmp eq i32 %28, 1
  %spec.select.3 = select i1 %cond.3, ptr @of_1_unicast_0_0_cons_buff_1, ptr @of_1_unicast_0_0_cons_buff_0
  tail call void @llvm.aie2p.acquire(i32 48, i32 -1)
  %cond1.3 = icmp eq i32 %25, 1
  %30 = select i1 %cond1.3, ptr @of_2_unicast_0_buff_1, ptr @of_2_unicast_0_buff_0
  tail call void @op2_silu_bf16(ptr nonnull %spec.select.3, ptr nonnull %30, i32 2048)
  tail call void @llvm.aie2p.release(i32 49, i32 1)
  %31 = add i32 %25, 1
  %32 = icmp sgt i32 %31, 1
  %33 = select i1 %32, i32 0, i32 %31
  tail call void @llvm.aie2p.release(i32 50, i32 1)
  %34 = add i32 %28, 1
  %35 = icmp sgt i32 %34, 1
  %36 = select i1 %35, i32 0, i32 %34
  %37 = add nuw nsw i64 %7, 4
  %38 = icmp samesign ult i64 %29, 31
  br i1 %38, label %4, label %39

39:                                               ; preds = %4
  %40 = add nuw nsw i64 %3, 1
  %41 = icmp samesign ult i64 %3, 4294967294
  br i1 %41, label %.preheader, label %42

42:                                               ; preds = %39
  ret void
}

attributes #0 = { mustprogress nocallback nofree nosync nounwind willreturn }

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
