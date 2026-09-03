; ModuleID = '/home/micas/iron-stream-dse/experiments/swsw/stream_s256_e2048_h8192/swiglu_prefill_stream_k5_m256_e2048_h8192_shared_fused.mlir.d/peano-linked_op2__SwiGLUStreamGroup_core_6_2.ll'
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

.preheader3:                                      ; preds = %0, %6
  %1 = phi i64 [ 0, %0 ], [ %7, %6 ]
  br label %.preheader

.preheader:                                       ; preds = %.preheader, %.preheader3
  %2 = phi i64 [ 0, %.preheader3 ], [ %4, %.preheader ]
  tail call void @llvm.aie2p.acquire(i32 48, i32 -1)
  tail call void @llvm.aie2p.acquire(i32 51, i32 -1)
  tail call void @llvm.aie2p.acquire(i32 53, i32 -1)
  tail call void @op2_eltwise_mul_bf16_vector(ptr nonnull @of_2_unicast_6_0_cons_buff_0, ptr nonnull @of_3_unicast_6_0_cons_buff_0, ptr nonnull @of_4_unicast_6_buff_0, i32 2048)
  tail call void @llvm.aie2p.release(i32 52, i32 1)
  tail call void @llvm.aie2p.release(i32 50, i32 1)
  tail call void @llvm.aie2p.release(i32 49, i32 1)
  tail call void @llvm.aie2p.acquire(i32 48, i32 -1)
  tail call void @llvm.aie2p.acquire(i32 51, i32 -1)
  tail call void @llvm.aie2p.acquire(i32 53, i32 -1)
  tail call void @op2_eltwise_mul_bf16_vector(ptr nonnull @of_2_unicast_6_0_cons_buff_1, ptr nonnull @of_3_unicast_6_0_cons_buff_1, ptr nonnull @of_4_unicast_6_buff_1, i32 2048)
  tail call void @llvm.aie2p.release(i32 52, i32 1)
  tail call void @llvm.aie2p.release(i32 50, i32 1)
  tail call void @llvm.aie2p.release(i32 49, i32 1)
  tail call void @llvm.aie2p.acquire(i32 48, i32 -1)
  tail call void @llvm.aie2p.acquire(i32 51, i32 -1)
  tail call void @llvm.aie2p.acquire(i32 53, i32 -1)
  tail call void @op2_eltwise_mul_bf16_vector(ptr nonnull @of_2_unicast_6_0_cons_buff_0, ptr nonnull @of_3_unicast_6_0_cons_buff_0, ptr nonnull @of_4_unicast_6_buff_0, i32 2048)
  tail call void @llvm.aie2p.release(i32 52, i32 1)
  tail call void @llvm.aie2p.release(i32 50, i32 1)
  tail call void @llvm.aie2p.release(i32 49, i32 1)
  tail call void @llvm.aie2p.acquire(i32 48, i32 -1)
  tail call void @llvm.aie2p.acquire(i32 51, i32 -1)
  tail call void @llvm.aie2p.acquire(i32 53, i32 -1)
  tail call void @op2_eltwise_mul_bf16_vector(ptr nonnull @of_2_unicast_6_0_cons_buff_1, ptr nonnull @of_3_unicast_6_0_cons_buff_1, ptr nonnull @of_4_unicast_6_buff_1, i32 2048)
  tail call void @llvm.aie2p.release(i32 52, i32 1)
  tail call void @llvm.aie2p.release(i32 50, i32 1)
  tail call void @llvm.aie2p.release(i32 49, i32 1)
  %3 = or disjoint i64 %2, 1
  tail call void @llvm.aie2p.acquire(i32 48, i32 -1)
  tail call void @llvm.aie2p.acquire(i32 51, i32 -1)
  tail call void @llvm.aie2p.acquire(i32 53, i32 -1)
  tail call void @op2_eltwise_mul_bf16_vector(ptr nonnull @of_2_unicast_6_0_cons_buff_0, ptr nonnull @of_3_unicast_6_0_cons_buff_0, ptr nonnull @of_4_unicast_6_buff_0, i32 2048)
  tail call void @llvm.aie2p.release(i32 52, i32 1)
  tail call void @llvm.aie2p.release(i32 50, i32 1)
  tail call void @llvm.aie2p.release(i32 49, i32 1)
  tail call void @llvm.aie2p.acquire(i32 48, i32 -1)
  tail call void @llvm.aie2p.acquire(i32 51, i32 -1)
  tail call void @llvm.aie2p.acquire(i32 53, i32 -1)
  tail call void @op2_eltwise_mul_bf16_vector(ptr nonnull @of_2_unicast_6_0_cons_buff_1, ptr nonnull @of_3_unicast_6_0_cons_buff_1, ptr nonnull @of_4_unicast_6_buff_1, i32 2048)
  tail call void @llvm.aie2p.release(i32 52, i32 1)
  tail call void @llvm.aie2p.release(i32 50, i32 1)
  tail call void @llvm.aie2p.release(i32 49, i32 1)
  tail call void @llvm.aie2p.acquire(i32 48, i32 -1)
  tail call void @llvm.aie2p.acquire(i32 51, i32 -1)
  tail call void @llvm.aie2p.acquire(i32 53, i32 -1)
  tail call void @op2_eltwise_mul_bf16_vector(ptr nonnull @of_2_unicast_6_0_cons_buff_0, ptr nonnull @of_3_unicast_6_0_cons_buff_0, ptr nonnull @of_4_unicast_6_buff_0, i32 2048)
  tail call void @llvm.aie2p.release(i32 52, i32 1)
  tail call void @llvm.aie2p.release(i32 50, i32 1)
  tail call void @llvm.aie2p.release(i32 49, i32 1)
  tail call void @llvm.aie2p.acquire(i32 48, i32 -1)
  tail call void @llvm.aie2p.acquire(i32 51, i32 -1)
  tail call void @llvm.aie2p.acquire(i32 53, i32 -1)
  tail call void @op2_eltwise_mul_bf16_vector(ptr nonnull @of_2_unicast_6_0_cons_buff_1, ptr nonnull @of_3_unicast_6_0_cons_buff_1, ptr nonnull @of_4_unicast_6_buff_1, i32 2048)
  tail call void @llvm.aie2p.release(i32 52, i32 1)
  tail call void @llvm.aie2p.release(i32 50, i32 1)
  tail call void @llvm.aie2p.release(i32 49, i32 1)
  %4 = add nuw nsw i64 %2, 2
  %5 = icmp samesign ult i64 %3, 31
  br i1 %5, label %.preheader, label %6

6:                                                ; preds = %.preheader
  %7 = add nuw nsw i64 %1, 1
  %8 = icmp samesign ult i64 %1, 4294967294
  br i1 %8, label %.preheader3, label %9

9:                                                ; preds = %6
  ret void
}

attributes #0 = { mustprogress nocallback nofree nosync nounwind willreturn }

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
