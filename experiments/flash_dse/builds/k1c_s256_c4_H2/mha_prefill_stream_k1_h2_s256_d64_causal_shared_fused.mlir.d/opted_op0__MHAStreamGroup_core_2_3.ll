; ModuleID = '/home/micas/iron-stream-dse/experiments/flash_dse/builds/k1c_s256_c4_H2/mha_prefill_stream_k1_h2_s256_d64_causal_shared_fused.mlir.d/peano-linked_op0__MHAStreamGroup_core_2_3.ll'
source_filename = "LLVMDialectModule"
target datalayout = "e-m:e-p:20:32-i1:8:32-i8:8:32-i16:16:32-i32:32:32-f32:32:32-i64:32-f64:32-a:0:32-n32"
target triple = "aie2p"

@of_7_unicast_2_0_cons_buff_1 = external global [16 x [256 x bfloat]]
@of_7_unicast_2_0_cons_buff_0 = external global [16 x [256 x bfloat]]
@of_8_unicast_2_buff_1 = external global [16 x [256 x bfloat]]
@of_8_unicast_2_buff_0 = external global [16 x [256 x bfloat]]

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.aie2p.acquire(i32, i32) #0

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.aie2p.release(i32, i32) #0

declare void @op0_softmax_rows_causal_bf16(ptr, ptr, i32, i32, i32) local_unnamed_addr

define void @core_2_3() local_unnamed_addr {
  br label %.preheader

.preheader:                                       ; preds = %.preheader, %0
  %1 = phi i64 [ 0, %0 ], [ %2, %.preheader ]
  tail call void @llvm.aie2p.acquire(i32 48, i32 -1)
  tail call void @llvm.aie2p.acquire(i32 51, i32 -1)
  tail call void @op0_softmax_rows_causal_bf16(ptr nonnull @of_7_unicast_2_0_cons_buff_0, ptr nonnull @of_8_unicast_2_buff_0, i32 16, i32 256, i32 32)
  tail call void @llvm.aie2p.release(i32 50, i32 1)
  tail call void @llvm.aie2p.release(i32 49, i32 1)
  tail call void @llvm.aie2p.acquire(i32 48, i32 -1)
  tail call void @llvm.aie2p.acquire(i32 51, i32 -1)
  tail call void @op0_softmax_rows_causal_bf16(ptr nonnull @of_7_unicast_2_0_cons_buff_1, ptr nonnull @of_8_unicast_2_buff_1, i32 16, i32 256, i32 96)
  tail call void @llvm.aie2p.release(i32 50, i32 1)
  tail call void @llvm.aie2p.release(i32 49, i32 1)
  tail call void @llvm.aie2p.acquire(i32 48, i32 -1)
  tail call void @llvm.aie2p.acquire(i32 51, i32 -1)
  tail call void @op0_softmax_rows_causal_bf16(ptr nonnull @of_7_unicast_2_0_cons_buff_0, ptr nonnull @of_8_unicast_2_buff_0, i32 16, i32 256, i32 160)
  tail call void @llvm.aie2p.release(i32 50, i32 1)
  tail call void @llvm.aie2p.release(i32 49, i32 1)
  tail call void @llvm.aie2p.acquire(i32 48, i32 -1)
  tail call void @llvm.aie2p.acquire(i32 51, i32 -1)
  tail call void @op0_softmax_rows_causal_bf16(ptr nonnull @of_7_unicast_2_0_cons_buff_1, ptr nonnull @of_8_unicast_2_buff_1, i32 16, i32 256, i32 224)
  tail call void @llvm.aie2p.release(i32 50, i32 1)
  tail call void @llvm.aie2p.release(i32 49, i32 1)
  tail call void @llvm.aie2p.acquire(i32 48, i32 -1)
  tail call void @llvm.aie2p.acquire(i32 51, i32 -1)
  tail call void @op0_softmax_rows_causal_bf16(ptr nonnull @of_7_unicast_2_0_cons_buff_0, ptr nonnull @of_8_unicast_2_buff_0, i32 16, i32 256, i32 32)
  tail call void @llvm.aie2p.release(i32 50, i32 1)
  tail call void @llvm.aie2p.release(i32 49, i32 1)
  tail call void @llvm.aie2p.acquire(i32 48, i32 -1)
  tail call void @llvm.aie2p.acquire(i32 51, i32 -1)
  tail call void @op0_softmax_rows_causal_bf16(ptr nonnull @of_7_unicast_2_0_cons_buff_1, ptr nonnull @of_8_unicast_2_buff_1, i32 16, i32 256, i32 96)
  tail call void @llvm.aie2p.release(i32 50, i32 1)
  tail call void @llvm.aie2p.release(i32 49, i32 1)
  tail call void @llvm.aie2p.acquire(i32 48, i32 -1)
  tail call void @llvm.aie2p.acquire(i32 51, i32 -1)
  tail call void @op0_softmax_rows_causal_bf16(ptr nonnull @of_7_unicast_2_0_cons_buff_0, ptr nonnull @of_8_unicast_2_buff_0, i32 16, i32 256, i32 160)
  tail call void @llvm.aie2p.release(i32 50, i32 1)
  tail call void @llvm.aie2p.release(i32 49, i32 1)
  tail call void @llvm.aie2p.acquire(i32 48, i32 -1)
  tail call void @llvm.aie2p.acquire(i32 51, i32 -1)
  tail call void @op0_softmax_rows_causal_bf16(ptr nonnull @of_7_unicast_2_0_cons_buff_1, ptr nonnull @of_8_unicast_2_buff_1, i32 16, i32 256, i32 224)
  tail call void @llvm.aie2p.release(i32 50, i32 1)
  tail call void @llvm.aie2p.release(i32 49, i32 1)
  tail call void @llvm.aie2p.acquire(i32 48, i32 -1)
  tail call void @llvm.aie2p.acquire(i32 51, i32 -1)
  tail call void @op0_softmax_rows_causal_bf16(ptr nonnull @of_7_unicast_2_0_cons_buff_0, ptr nonnull @of_8_unicast_2_buff_0, i32 16, i32 256, i32 32)
  tail call void @llvm.aie2p.release(i32 50, i32 1)
  tail call void @llvm.aie2p.release(i32 49, i32 1)
  tail call void @llvm.aie2p.acquire(i32 48, i32 -1)
  tail call void @llvm.aie2p.acquire(i32 51, i32 -1)
  tail call void @op0_softmax_rows_causal_bf16(ptr nonnull @of_7_unicast_2_0_cons_buff_1, ptr nonnull @of_8_unicast_2_buff_1, i32 16, i32 256, i32 96)
  tail call void @llvm.aie2p.release(i32 50, i32 1)
  tail call void @llvm.aie2p.release(i32 49, i32 1)
  tail call void @llvm.aie2p.acquire(i32 48, i32 -1)
  tail call void @llvm.aie2p.acquire(i32 51, i32 -1)
  tail call void @op0_softmax_rows_causal_bf16(ptr nonnull @of_7_unicast_2_0_cons_buff_0, ptr nonnull @of_8_unicast_2_buff_0, i32 16, i32 256, i32 160)
  tail call void @llvm.aie2p.release(i32 50, i32 1)
  tail call void @llvm.aie2p.release(i32 49, i32 1)
  tail call void @llvm.aie2p.acquire(i32 48, i32 -1)
  tail call void @llvm.aie2p.acquire(i32 51, i32 -1)
  tail call void @op0_softmax_rows_causal_bf16(ptr nonnull @of_7_unicast_2_0_cons_buff_1, ptr nonnull @of_8_unicast_2_buff_1, i32 16, i32 256, i32 224)
  tail call void @llvm.aie2p.release(i32 50, i32 1)
  tail call void @llvm.aie2p.release(i32 49, i32 1)
  %2 = add nuw nsw i64 %1, 3
  %3 = icmp samesign ult i64 %1, 4294967292
  br i1 %3, label %.preheader, label %4

4:                                                ; preds = %.preheader
  ret void
}

attributes #0 = { mustprogress nocallback nofree nosync nounwind willreturn }

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
