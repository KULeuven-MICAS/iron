; ModuleID = '/home/micas/iron-stream-dse/experiments/sw_k5/stream_s256_e4096_h14336/swiglu_prefill_stream_k5_m256_e4096_h14336_shared_fused.mlir.d/peano-linked_op1__SwiGLUStreamGroup_core_4_2.ll'
source_filename = "LLVMDialectModule"
target datalayout = "e-m:e-p:20:32-i1:8:32-i8:8:32-i16:16:32-i32:32:32-f32:32:32-i64:32-f64:32-a:0:32-n32"
target triple = "aie2p"

@of_1_unicast_4_0_cons_buff_1 = external global [1 x [2048 x bfloat]]
@of_1_unicast_4_0_cons_buff_0 = external global [1 x [2048 x bfloat]]
@of_2_unicast_4_buff_1 = external global [1 x [2048 x bfloat]]
@of_2_unicast_4_buff_0 = external global [1 x [2048 x bfloat]]

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.aie2p.acquire(i32, i32) #0

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.aie2p.release(i32, i32) #0

declare void @op1_silu_bf16(ptr, ptr, i32) local_unnamed_addr

define void @core_4_2() local_unnamed_addr {
  br label %.preheader2

.preheader2:                                      ; preds = %0, %58
  %1 = phi i32 [ 0, %0 ], [ %52, %58 ]
  %2 = phi i32 [ 0, %0 ], [ %55, %58 ]
  %3 = phi i64 [ 0, %0 ], [ %59, %58 ]
  br label %.preheader

.preheader:                                       ; preds = %.preheader2, %.preheader
  %4 = phi i32 [ %1, %.preheader2 ], [ %52, %.preheader ]
  %5 = phi i32 [ %2, %.preheader2 ], [ %55, %.preheader ]
  %6 = phi i64 [ 0, %.preheader2 ], [ %56, %.preheader ]
  tail call void @llvm.aie2p.acquire(i32 48, i32 -1)
  %cond = icmp eq i32 %5, 1
  %spec.select = select i1 %cond, ptr @of_2_unicast_4_buff_1, ptr @of_2_unicast_4_buff_0
  tail call void @llvm.aie2p.acquire(i32 51, i32 -1)
  %cond1 = icmp eq i32 %4, 1
  %7 = select i1 %cond1, ptr @of_1_unicast_4_0_cons_buff_1, ptr @of_1_unicast_4_0_cons_buff_0
  tail call void @op1_silu_bf16(ptr nonnull %7, ptr nonnull %spec.select, i32 2048)
  tail call void @llvm.aie2p.release(i32 50, i32 1)
  %8 = add i32 %4, 1
  %9 = icmp sgt i32 %8, 1
  %10 = select i1 %9, i32 0, i32 %8
  tail call void @llvm.aie2p.release(i32 49, i32 1)
  %11 = add i32 %5, 1
  %12 = icmp sgt i32 %11, 1
  %13 = select i1 %12, i32 0, i32 %11
  tail call void @llvm.aie2p.acquire(i32 48, i32 -1)
  %cond.1 = icmp eq i32 %13, 1
  %spec.select.1 = select i1 %cond.1, ptr @of_2_unicast_4_buff_1, ptr @of_2_unicast_4_buff_0
  tail call void @llvm.aie2p.acquire(i32 51, i32 -1)
  %cond1.1 = icmp eq i32 %10, 1
  %14 = select i1 %cond1.1, ptr @of_1_unicast_4_0_cons_buff_1, ptr @of_1_unicast_4_0_cons_buff_0
  tail call void @op1_silu_bf16(ptr nonnull %14, ptr nonnull %spec.select.1, i32 2048)
  tail call void @llvm.aie2p.release(i32 50, i32 1)
  %15 = add i32 %10, 1
  %16 = icmp sgt i32 %15, 1
  %17 = select i1 %16, i32 0, i32 %15
  tail call void @llvm.aie2p.release(i32 49, i32 1)
  %18 = add i32 %13, 1
  %19 = icmp sgt i32 %18, 1
  %20 = select i1 %19, i32 0, i32 %18
  tail call void @llvm.aie2p.acquire(i32 48, i32 -1)
  %cond.2 = icmp eq i32 %20, 1
  %spec.select.2 = select i1 %cond.2, ptr @of_2_unicast_4_buff_1, ptr @of_2_unicast_4_buff_0
  tail call void @llvm.aie2p.acquire(i32 51, i32 -1)
  %cond1.2 = icmp eq i32 %17, 1
  %21 = select i1 %cond1.2, ptr @of_1_unicast_4_0_cons_buff_1, ptr @of_1_unicast_4_0_cons_buff_0
  tail call void @op1_silu_bf16(ptr nonnull %21, ptr nonnull %spec.select.2, i32 2048)
  tail call void @llvm.aie2p.release(i32 50, i32 1)
  %22 = add i32 %17, 1
  %23 = icmp sgt i32 %22, 1
  %24 = select i1 %23, i32 0, i32 %22
  tail call void @llvm.aie2p.release(i32 49, i32 1)
  %25 = add i32 %20, 1
  %26 = icmp sgt i32 %25, 1
  %27 = select i1 %26, i32 0, i32 %25
  tail call void @llvm.aie2p.acquire(i32 48, i32 -1)
  %cond.3 = icmp eq i32 %27, 1
  %spec.select.3 = select i1 %cond.3, ptr @of_2_unicast_4_buff_1, ptr @of_2_unicast_4_buff_0
  tail call void @llvm.aie2p.acquire(i32 51, i32 -1)
  %cond1.3 = icmp eq i32 %24, 1
  %28 = select i1 %cond1.3, ptr @of_1_unicast_4_0_cons_buff_1, ptr @of_1_unicast_4_0_cons_buff_0
  tail call void @op1_silu_bf16(ptr nonnull %28, ptr nonnull %spec.select.3, i32 2048)
  tail call void @llvm.aie2p.release(i32 50, i32 1)
  %29 = add i32 %24, 1
  %30 = icmp sgt i32 %29, 1
  %31 = select i1 %30, i32 0, i32 %29
  tail call void @llvm.aie2p.release(i32 49, i32 1)
  %32 = add i32 %27, 1
  %33 = icmp sgt i32 %32, 1
  %34 = select i1 %33, i32 0, i32 %32
  tail call void @llvm.aie2p.acquire(i32 48, i32 -1)
  %cond.4 = icmp eq i32 %34, 1
  %spec.select.4 = select i1 %cond.4, ptr @of_2_unicast_4_buff_1, ptr @of_2_unicast_4_buff_0
  tail call void @llvm.aie2p.acquire(i32 51, i32 -1)
  %cond1.4 = icmp eq i32 %31, 1
  %35 = select i1 %cond1.4, ptr @of_1_unicast_4_0_cons_buff_1, ptr @of_1_unicast_4_0_cons_buff_0
  tail call void @op1_silu_bf16(ptr nonnull %35, ptr nonnull %spec.select.4, i32 2048)
  tail call void @llvm.aie2p.release(i32 50, i32 1)
  %36 = add i32 %31, 1
  %37 = icmp sgt i32 %36, 1
  %38 = select i1 %37, i32 0, i32 %36
  tail call void @llvm.aie2p.release(i32 49, i32 1)
  %39 = add i32 %34, 1
  %40 = icmp sgt i32 %39, 1
  %41 = select i1 %40, i32 0, i32 %39
  tail call void @llvm.aie2p.acquire(i32 48, i32 -1)
  %cond.5 = icmp eq i32 %41, 1
  %spec.select.5 = select i1 %cond.5, ptr @of_2_unicast_4_buff_1, ptr @of_2_unicast_4_buff_0
  tail call void @llvm.aie2p.acquire(i32 51, i32 -1)
  %cond1.5 = icmp eq i32 %38, 1
  %42 = select i1 %cond1.5, ptr @of_1_unicast_4_0_cons_buff_1, ptr @of_1_unicast_4_0_cons_buff_0
  tail call void @op1_silu_bf16(ptr nonnull %42, ptr nonnull %spec.select.5, i32 2048)
  tail call void @llvm.aie2p.release(i32 50, i32 1)
  %43 = add i32 %38, 1
  %44 = icmp sgt i32 %43, 1
  %45 = select i1 %44, i32 0, i32 %43
  tail call void @llvm.aie2p.release(i32 49, i32 1)
  %46 = add i32 %41, 1
  %47 = icmp sgt i32 %46, 1
  %48 = select i1 %47, i32 0, i32 %46
  tail call void @llvm.aie2p.acquire(i32 48, i32 -1)
  %cond.6 = icmp eq i32 %48, 1
  %spec.select.6 = select i1 %cond.6, ptr @of_2_unicast_4_buff_1, ptr @of_2_unicast_4_buff_0
  tail call void @llvm.aie2p.acquire(i32 51, i32 -1)
  %cond1.6 = icmp eq i32 %45, 1
  %49 = select i1 %cond1.6, ptr @of_1_unicast_4_0_cons_buff_1, ptr @of_1_unicast_4_0_cons_buff_0
  tail call void @op1_silu_bf16(ptr nonnull %49, ptr nonnull %spec.select.6, i32 2048)
  tail call void @llvm.aie2p.release(i32 50, i32 1)
  %50 = add i32 %45, 1
  %51 = icmp sgt i32 %50, 1
  %52 = select i1 %51, i32 0, i32 %50
  tail call void @llvm.aie2p.release(i32 49, i32 1)
  %53 = add i32 %48, 1
  %54 = icmp sgt i32 %53, 1
  %55 = select i1 %54, i32 0, i32 %53
  %56 = add nuw nsw i64 %6, 1
  %57 = icmp samesign ult i64 %6, 31
  br i1 %57, label %.preheader, label %58

58:                                               ; preds = %.preheader
  %59 = add nuw nsw i64 %3, 1
  %60 = icmp samesign ult i64 %3, 4294967294
  br i1 %60, label %.preheader2, label %61

61:                                               ; preds = %58
  ret void
}

attributes #0 = { mustprogress nocallback nofree nosync nounwind willreturn }

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
