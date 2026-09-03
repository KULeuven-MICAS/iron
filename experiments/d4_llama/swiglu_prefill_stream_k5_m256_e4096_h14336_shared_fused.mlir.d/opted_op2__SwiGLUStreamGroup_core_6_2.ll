; ModuleID = '/home/micas/iron-stream-dse/experiments/d4_llama/swiglu_prefill_stream_k5_m256_e4096_h14336_shared_fused.mlir.d/peano-linked_op2__SwiGLUStreamGroup_core_6_2.ll'
source_filename = "LLVMDialectModule"
target datalayout = "e-m:e-p:20:32-i1:8:32-i8:8:32-i16:16:32-i32:32:32-f32:32:32-i64:32-f64:32-a:0:32-n32"
target triple = "aie2p"

@of_2_unicast_6_0_cons_buff_1 = external global [1 x [2048 x bfloat]]
@of_2_unicast_6_0_cons_buff_0 = external global [1 x [2048 x bfloat]]
@of_3_unicast_6_0_cons_buff_1 = external global [1 x [2048 x bfloat]]
@of_3_unicast_6_0_cons_buff_0 = external global [1 x [2048 x bfloat]]
@of_4_unicast_6_buff_1 = external global [1 x [2048 x bfloat]]
@of_4_unicast_6_buff_0 = external global [1 x [2048 x bfloat]]

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.aie2p.acquire(i32, i32) #0

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.aie2p.release(i32, i32) #0

declare void @op2_eltwise_mul_bf16_vector(ptr, ptr, ptr, i32) local_unnamed_addr

define void @core_6_2() local_unnamed_addr {
  br label %.preheader3

.preheader3:                                      ; preds = %0, %88
  %1 = phi i32 [ 0, %0 ], [ %79, %88 ]
  %2 = phi i32 [ 0, %0 ], [ %82, %88 ]
  %3 = phi i32 [ 0, %0 ], [ %85, %88 ]
  %4 = phi i64 [ 0, %0 ], [ %89, %88 ]
  br label %.preheader

.preheader:                                       ; preds = %.preheader3, %.preheader
  %5 = phi i32 [ %1, %.preheader3 ], [ %79, %.preheader ]
  %6 = phi i32 [ %2, %.preheader3 ], [ %82, %.preheader ]
  %7 = phi i32 [ %3, %.preheader3 ], [ %85, %.preheader ]
  %8 = phi i64 [ 0, %.preheader3 ], [ %86, %.preheader ]
  tail call void @llvm.aie2p.acquire(i32 48, i32 -1)
  %cond = icmp eq i32 %7, 1
  %spec.select = select i1 %cond, ptr @of_4_unicast_6_buff_1, ptr @of_4_unicast_6_buff_0
  tail call void @llvm.aie2p.acquire(i32 51, i32 -1)
  %cond1 = icmp eq i32 %6, 1
  %9 = select i1 %cond1, ptr @of_3_unicast_6_0_cons_buff_1, ptr @of_3_unicast_6_0_cons_buff_0
  tail call void @llvm.aie2p.acquire(i32 53, i32 -1)
  %cond2 = icmp eq i32 %5, 1
  %10 = select i1 %cond2, ptr @of_2_unicast_6_0_cons_buff_1, ptr @of_2_unicast_6_0_cons_buff_0
  tail call void @op2_eltwise_mul_bf16_vector(ptr nonnull %10, ptr nonnull %9, ptr nonnull %spec.select, i32 2048)
  tail call void @llvm.aie2p.release(i32 52, i32 1)
  %11 = add i32 %5, 1
  %12 = icmp sgt i32 %11, 1
  %13 = select i1 %12, i32 0, i32 %11
  tail call void @llvm.aie2p.release(i32 50, i32 1)
  %14 = add i32 %6, 1
  %15 = icmp sgt i32 %14, 1
  %16 = select i1 %15, i32 0, i32 %14
  tail call void @llvm.aie2p.release(i32 49, i32 1)
  %17 = add i32 %7, 1
  %18 = icmp sgt i32 %17, 1
  %19 = select i1 %18, i32 0, i32 %17
  tail call void @llvm.aie2p.acquire(i32 48, i32 -1)
  %cond.1 = icmp eq i32 %19, 1
  %spec.select.1 = select i1 %cond.1, ptr @of_4_unicast_6_buff_1, ptr @of_4_unicast_6_buff_0
  tail call void @llvm.aie2p.acquire(i32 51, i32 -1)
  %cond1.1 = icmp eq i32 %16, 1
  %20 = select i1 %cond1.1, ptr @of_3_unicast_6_0_cons_buff_1, ptr @of_3_unicast_6_0_cons_buff_0
  tail call void @llvm.aie2p.acquire(i32 53, i32 -1)
  %cond2.1 = icmp eq i32 %13, 1
  %21 = select i1 %cond2.1, ptr @of_2_unicast_6_0_cons_buff_1, ptr @of_2_unicast_6_0_cons_buff_0
  tail call void @op2_eltwise_mul_bf16_vector(ptr nonnull %21, ptr nonnull %20, ptr nonnull %spec.select.1, i32 2048)
  tail call void @llvm.aie2p.release(i32 52, i32 1)
  %22 = add i32 %13, 1
  %23 = icmp sgt i32 %22, 1
  %24 = select i1 %23, i32 0, i32 %22
  tail call void @llvm.aie2p.release(i32 50, i32 1)
  %25 = add i32 %16, 1
  %26 = icmp sgt i32 %25, 1
  %27 = select i1 %26, i32 0, i32 %25
  tail call void @llvm.aie2p.release(i32 49, i32 1)
  %28 = add i32 %19, 1
  %29 = icmp sgt i32 %28, 1
  %30 = select i1 %29, i32 0, i32 %28
  tail call void @llvm.aie2p.acquire(i32 48, i32 -1)
  %cond.2 = icmp eq i32 %30, 1
  %spec.select.2 = select i1 %cond.2, ptr @of_4_unicast_6_buff_1, ptr @of_4_unicast_6_buff_0
  tail call void @llvm.aie2p.acquire(i32 51, i32 -1)
  %cond1.2 = icmp eq i32 %27, 1
  %31 = select i1 %cond1.2, ptr @of_3_unicast_6_0_cons_buff_1, ptr @of_3_unicast_6_0_cons_buff_0
  tail call void @llvm.aie2p.acquire(i32 53, i32 -1)
  %cond2.2 = icmp eq i32 %24, 1
  %32 = select i1 %cond2.2, ptr @of_2_unicast_6_0_cons_buff_1, ptr @of_2_unicast_6_0_cons_buff_0
  tail call void @op2_eltwise_mul_bf16_vector(ptr nonnull %32, ptr nonnull %31, ptr nonnull %spec.select.2, i32 2048)
  tail call void @llvm.aie2p.release(i32 52, i32 1)
  %33 = add i32 %24, 1
  %34 = icmp sgt i32 %33, 1
  %35 = select i1 %34, i32 0, i32 %33
  tail call void @llvm.aie2p.release(i32 50, i32 1)
  %36 = add i32 %27, 1
  %37 = icmp sgt i32 %36, 1
  %38 = select i1 %37, i32 0, i32 %36
  tail call void @llvm.aie2p.release(i32 49, i32 1)
  %39 = add i32 %30, 1
  %40 = icmp sgt i32 %39, 1
  %41 = select i1 %40, i32 0, i32 %39
  tail call void @llvm.aie2p.acquire(i32 48, i32 -1)
  %cond.3 = icmp eq i32 %41, 1
  %spec.select.3 = select i1 %cond.3, ptr @of_4_unicast_6_buff_1, ptr @of_4_unicast_6_buff_0
  tail call void @llvm.aie2p.acquire(i32 51, i32 -1)
  %cond1.3 = icmp eq i32 %38, 1
  %42 = select i1 %cond1.3, ptr @of_3_unicast_6_0_cons_buff_1, ptr @of_3_unicast_6_0_cons_buff_0
  tail call void @llvm.aie2p.acquire(i32 53, i32 -1)
  %cond2.3 = icmp eq i32 %35, 1
  %43 = select i1 %cond2.3, ptr @of_2_unicast_6_0_cons_buff_1, ptr @of_2_unicast_6_0_cons_buff_0
  tail call void @op2_eltwise_mul_bf16_vector(ptr nonnull %43, ptr nonnull %42, ptr nonnull %spec.select.3, i32 2048)
  tail call void @llvm.aie2p.release(i32 52, i32 1)
  %44 = add i32 %35, 1
  %45 = icmp sgt i32 %44, 1
  %46 = select i1 %45, i32 0, i32 %44
  tail call void @llvm.aie2p.release(i32 50, i32 1)
  %47 = add i32 %38, 1
  %48 = icmp sgt i32 %47, 1
  %49 = select i1 %48, i32 0, i32 %47
  tail call void @llvm.aie2p.release(i32 49, i32 1)
  %50 = add i32 %41, 1
  %51 = icmp sgt i32 %50, 1
  %52 = select i1 %51, i32 0, i32 %50
  tail call void @llvm.aie2p.acquire(i32 48, i32 -1)
  %cond.4 = icmp eq i32 %52, 1
  %spec.select.4 = select i1 %cond.4, ptr @of_4_unicast_6_buff_1, ptr @of_4_unicast_6_buff_0
  tail call void @llvm.aie2p.acquire(i32 51, i32 -1)
  %cond1.4 = icmp eq i32 %49, 1
  %53 = select i1 %cond1.4, ptr @of_3_unicast_6_0_cons_buff_1, ptr @of_3_unicast_6_0_cons_buff_0
  tail call void @llvm.aie2p.acquire(i32 53, i32 -1)
  %cond2.4 = icmp eq i32 %46, 1
  %54 = select i1 %cond2.4, ptr @of_2_unicast_6_0_cons_buff_1, ptr @of_2_unicast_6_0_cons_buff_0
  tail call void @op2_eltwise_mul_bf16_vector(ptr nonnull %54, ptr nonnull %53, ptr nonnull %spec.select.4, i32 2048)
  tail call void @llvm.aie2p.release(i32 52, i32 1)
  %55 = add i32 %46, 1
  %56 = icmp sgt i32 %55, 1
  %57 = select i1 %56, i32 0, i32 %55
  tail call void @llvm.aie2p.release(i32 50, i32 1)
  %58 = add i32 %49, 1
  %59 = icmp sgt i32 %58, 1
  %60 = select i1 %59, i32 0, i32 %58
  tail call void @llvm.aie2p.release(i32 49, i32 1)
  %61 = add i32 %52, 1
  %62 = icmp sgt i32 %61, 1
  %63 = select i1 %62, i32 0, i32 %61
  tail call void @llvm.aie2p.acquire(i32 48, i32 -1)
  %cond.5 = icmp eq i32 %63, 1
  %spec.select.5 = select i1 %cond.5, ptr @of_4_unicast_6_buff_1, ptr @of_4_unicast_6_buff_0
  tail call void @llvm.aie2p.acquire(i32 51, i32 -1)
  %cond1.5 = icmp eq i32 %60, 1
  %64 = select i1 %cond1.5, ptr @of_3_unicast_6_0_cons_buff_1, ptr @of_3_unicast_6_0_cons_buff_0
  tail call void @llvm.aie2p.acquire(i32 53, i32 -1)
  %cond2.5 = icmp eq i32 %57, 1
  %65 = select i1 %cond2.5, ptr @of_2_unicast_6_0_cons_buff_1, ptr @of_2_unicast_6_0_cons_buff_0
  tail call void @op2_eltwise_mul_bf16_vector(ptr nonnull %65, ptr nonnull %64, ptr nonnull %spec.select.5, i32 2048)
  tail call void @llvm.aie2p.release(i32 52, i32 1)
  %66 = add i32 %57, 1
  %67 = icmp sgt i32 %66, 1
  %68 = select i1 %67, i32 0, i32 %66
  tail call void @llvm.aie2p.release(i32 50, i32 1)
  %69 = add i32 %60, 1
  %70 = icmp sgt i32 %69, 1
  %71 = select i1 %70, i32 0, i32 %69
  tail call void @llvm.aie2p.release(i32 49, i32 1)
  %72 = add i32 %63, 1
  %73 = icmp sgt i32 %72, 1
  %74 = select i1 %73, i32 0, i32 %72
  tail call void @llvm.aie2p.acquire(i32 48, i32 -1)
  %cond.6 = icmp eq i32 %74, 1
  %spec.select.6 = select i1 %cond.6, ptr @of_4_unicast_6_buff_1, ptr @of_4_unicast_6_buff_0
  tail call void @llvm.aie2p.acquire(i32 51, i32 -1)
  %cond1.6 = icmp eq i32 %71, 1
  %75 = select i1 %cond1.6, ptr @of_3_unicast_6_0_cons_buff_1, ptr @of_3_unicast_6_0_cons_buff_0
  tail call void @llvm.aie2p.acquire(i32 53, i32 -1)
  %cond2.6 = icmp eq i32 %68, 1
  %76 = select i1 %cond2.6, ptr @of_2_unicast_6_0_cons_buff_1, ptr @of_2_unicast_6_0_cons_buff_0
  tail call void @op2_eltwise_mul_bf16_vector(ptr nonnull %76, ptr nonnull %75, ptr nonnull %spec.select.6, i32 2048)
  tail call void @llvm.aie2p.release(i32 52, i32 1)
  %77 = add i32 %68, 1
  %78 = icmp sgt i32 %77, 1
  %79 = select i1 %78, i32 0, i32 %77
  tail call void @llvm.aie2p.release(i32 50, i32 1)
  %80 = add i32 %71, 1
  %81 = icmp sgt i32 %80, 1
  %82 = select i1 %81, i32 0, i32 %80
  tail call void @llvm.aie2p.release(i32 49, i32 1)
  %83 = add i32 %74, 1
  %84 = icmp sgt i32 %83, 1
  %85 = select i1 %84, i32 0, i32 %83
  %86 = add nuw nsw i64 %8, 1
  %87 = icmp samesign ult i64 %8, 31
  br i1 %87, label %.preheader, label %88

88:                                               ; preds = %.preheader
  %89 = add nuw nsw i64 %4, 1
  %90 = icmp samesign ult i64 %4, 4294967294
  br i1 %90, label %.preheader3, label %91

91:                                               ; preds = %88
  ret void
}

attributes #0 = { mustprogress nocallback nofree nosync nounwind willreturn }

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
