; ModuleID = '/home/micas/iron-stream-dse/experiments/trv3_swiglu_k5/swiglu_prefill_stream_k5_m256_e512_h2048_shared_traced65536_fused.mlir.d/peano-linked_op3__SwiGLUStreamGroup_core_0_2.ll'
source_filename = "LLVMDialectModule"
target datalayout = "e-m:e-p:20:32-i1:8:32-i8:8:32-i16:16:32-i32:32:32-f32:32:32-i64:32-f64:32-a:0:32-n32"
target triple = "aie2p"

@of_2_unicast_0_0_cons_buff_1 = external global [1 x [2048 x bfloat]]
@of_2_unicast_0_0_cons_buff_0 = external global [1 x [2048 x bfloat]]
@of_3_unicast_0_0_cons_buff_1 = external global [1 x [2048 x bfloat]]
@of_3_unicast_0_0_cons_buff_0 = external global [1 x [2048 x bfloat]]
@of_4_unicast_0_buff_1 = external global [1 x [2048 x bfloat]]
@of_4_unicast_0_buff_0 = external global [1 x [2048 x bfloat]]

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.aie2p.acquire(i32, i32) #0

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.aie2p.release(i32, i32) #0

declare void @op3_eltwise_mul_bf16_vector(ptr, ptr, ptr, i32) local_unnamed_addr

define void @core_0_2() local_unnamed_addr {
  br label %.preheader

.preheader:                                       ; preds = %0, %57
  %1 = phi i32 [ 0, %0 ], [ %48, %57 ]
  %2 = phi i32 [ 0, %0 ], [ %51, %57 ]
  %3 = phi i32 [ 0, %0 ], [ %54, %57 ]
  %4 = phi i64 [ 0, %0 ], [ %58, %57 ]
  br label %5

5:                                                ; preds = %5, %.preheader
  %6 = phi i32 [ %1, %.preheader ], [ %48, %5 ]
  %7 = phi i32 [ %2, %.preheader ], [ %51, %5 ]
  %8 = phi i32 [ %3, %.preheader ], [ %54, %5 ]
  %9 = phi i64 [ 0, %.preheader ], [ %55, %5 ]
  tail call void @llvm.aie2p.acquire(i32 51, i32 -1)
  %cond = icmp eq i32 %8, 1
  %spec.select = select i1 %cond, ptr @of_3_unicast_0_0_cons_buff_1, ptr @of_3_unicast_0_0_cons_buff_0
  tail call void @llvm.aie2p.acquire(i32 53, i32 -1)
  %cond1 = icmp eq i32 %7, 1
  %10 = select i1 %cond1, ptr @of_2_unicast_0_0_cons_buff_1, ptr @of_2_unicast_0_0_cons_buff_0
  tail call void @llvm.aie2p.acquire(i32 48, i32 -1)
  %cond2 = icmp eq i32 %6, 1
  %11 = select i1 %cond2, ptr @of_4_unicast_0_buff_1, ptr @of_4_unicast_0_buff_0
  tail call void @op3_eltwise_mul_bf16_vector(ptr nonnull %10, ptr nonnull %spec.select, ptr nonnull %11, i32 2048)
  tail call void @llvm.aie2p.release(i32 49, i32 1)
  %12 = add i32 %6, 1
  %13 = icmp sgt i32 %12, 1
  %14 = select i1 %13, i32 0, i32 %12
  tail call void @llvm.aie2p.release(i32 52, i32 1)
  %15 = add i32 %7, 1
  %16 = icmp sgt i32 %15, 1
  %17 = select i1 %16, i32 0, i32 %15
  tail call void @llvm.aie2p.release(i32 50, i32 1)
  %18 = add i32 %8, 1
  %19 = icmp sgt i32 %18, 1
  %20 = select i1 %19, i32 0, i32 %18
  tail call void @llvm.aie2p.acquire(i32 51, i32 -1)
  %cond.1 = icmp eq i32 %20, 1
  %spec.select.1 = select i1 %cond.1, ptr @of_3_unicast_0_0_cons_buff_1, ptr @of_3_unicast_0_0_cons_buff_0
  tail call void @llvm.aie2p.acquire(i32 53, i32 -1)
  %cond1.1 = icmp eq i32 %17, 1
  %21 = select i1 %cond1.1, ptr @of_2_unicast_0_0_cons_buff_1, ptr @of_2_unicast_0_0_cons_buff_0
  tail call void @llvm.aie2p.acquire(i32 48, i32 -1)
  %cond2.1 = icmp eq i32 %14, 1
  %22 = select i1 %cond2.1, ptr @of_4_unicast_0_buff_1, ptr @of_4_unicast_0_buff_0
  tail call void @op3_eltwise_mul_bf16_vector(ptr nonnull %21, ptr nonnull %spec.select.1, ptr nonnull %22, i32 2048)
  tail call void @llvm.aie2p.release(i32 49, i32 1)
  %23 = add i32 %14, 1
  %24 = icmp sgt i32 %23, 1
  %25 = select i1 %24, i32 0, i32 %23
  tail call void @llvm.aie2p.release(i32 52, i32 1)
  %26 = add i32 %17, 1
  %27 = icmp sgt i32 %26, 1
  %28 = select i1 %27, i32 0, i32 %26
  tail call void @llvm.aie2p.release(i32 50, i32 1)
  %29 = add i32 %20, 1
  %30 = icmp sgt i32 %29, 1
  %31 = select i1 %30, i32 0, i32 %29
  tail call void @llvm.aie2p.acquire(i32 51, i32 -1)
  %cond.2 = icmp eq i32 %31, 1
  %spec.select.2 = select i1 %cond.2, ptr @of_3_unicast_0_0_cons_buff_1, ptr @of_3_unicast_0_0_cons_buff_0
  tail call void @llvm.aie2p.acquire(i32 53, i32 -1)
  %cond1.2 = icmp eq i32 %28, 1
  %32 = select i1 %cond1.2, ptr @of_2_unicast_0_0_cons_buff_1, ptr @of_2_unicast_0_0_cons_buff_0
  tail call void @llvm.aie2p.acquire(i32 48, i32 -1)
  %cond2.2 = icmp eq i32 %25, 1
  %33 = select i1 %cond2.2, ptr @of_4_unicast_0_buff_1, ptr @of_4_unicast_0_buff_0
  tail call void @op3_eltwise_mul_bf16_vector(ptr nonnull %32, ptr nonnull %spec.select.2, ptr nonnull %33, i32 2048)
  tail call void @llvm.aie2p.release(i32 49, i32 1)
  %34 = add i32 %25, 1
  %35 = icmp sgt i32 %34, 1
  %36 = select i1 %35, i32 0, i32 %34
  tail call void @llvm.aie2p.release(i32 52, i32 1)
  %37 = add i32 %28, 1
  %38 = icmp sgt i32 %37, 1
  %39 = select i1 %38, i32 0, i32 %37
  tail call void @llvm.aie2p.release(i32 50, i32 1)
  %40 = add i32 %31, 1
  %41 = icmp sgt i32 %40, 1
  %42 = select i1 %41, i32 0, i32 %40
  %43 = or disjoint i64 %9, 3
  tail call void @llvm.aie2p.acquire(i32 51, i32 -1)
  %cond.3 = icmp eq i32 %42, 1
  %spec.select.3 = select i1 %cond.3, ptr @of_3_unicast_0_0_cons_buff_1, ptr @of_3_unicast_0_0_cons_buff_0
  tail call void @llvm.aie2p.acquire(i32 53, i32 -1)
  %cond1.3 = icmp eq i32 %39, 1
  %44 = select i1 %cond1.3, ptr @of_2_unicast_0_0_cons_buff_1, ptr @of_2_unicast_0_0_cons_buff_0
  tail call void @llvm.aie2p.acquire(i32 48, i32 -1)
  %cond2.3 = icmp eq i32 %36, 1
  %45 = select i1 %cond2.3, ptr @of_4_unicast_0_buff_1, ptr @of_4_unicast_0_buff_0
  tail call void @op3_eltwise_mul_bf16_vector(ptr nonnull %44, ptr nonnull %spec.select.3, ptr nonnull %45, i32 2048)
  tail call void @llvm.aie2p.release(i32 49, i32 1)
  %46 = add i32 %36, 1
  %47 = icmp sgt i32 %46, 1
  %48 = select i1 %47, i32 0, i32 %46
  tail call void @llvm.aie2p.release(i32 52, i32 1)
  %49 = add i32 %39, 1
  %50 = icmp sgt i32 %49, 1
  %51 = select i1 %50, i32 0, i32 %49
  tail call void @llvm.aie2p.release(i32 50, i32 1)
  %52 = add i32 %42, 1
  %53 = icmp sgt i32 %52, 1
  %54 = select i1 %53, i32 0, i32 %52
  %55 = add nuw nsw i64 %9, 4
  %56 = icmp samesign ult i64 %43, 31
  br i1 %56, label %5, label %57

57:                                               ; preds = %5
  %58 = add nuw nsw i64 %4, 1
  %59 = icmp samesign ult i64 %4, 4294967294
  br i1 %59, label %.preheader, label %60

60:                                               ; preds = %57
  ret void
}

attributes #0 = { mustprogress nocallback nofree nosync nounwind willreturn }

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
