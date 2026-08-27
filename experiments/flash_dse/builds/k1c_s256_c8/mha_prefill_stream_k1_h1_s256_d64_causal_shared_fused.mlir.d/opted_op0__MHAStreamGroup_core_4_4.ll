; ModuleID = '/home/micas/iron-stream-dse/experiments/flash_dse/builds/k1c_s256_c8/mha_prefill_stream_k1_h1_s256_d64_causal_shared_fused.mlir.d/peano-linked_op0__MHAStreamGroup_core_4_4.ll'
source_filename = "LLVMDialectModule"
target datalayout = "e-m:e-p:20:32-i1:8:32-i8:8:32-i16:16:32-i32:32:32-f32:32:32-i64:32-f64:32-a:0:32-n32"
target triple = "aie2p"

@of_5_broadcast_0_0_4_cons_buff_0 = external global [256 x [64 x bfloat]]
@of_9_unicast_4_0_cons_buff_1 = external global [16 x [256 x bfloat]]
@of_9_unicast_4_0_cons_buff_0 = external global [16 x [256 x bfloat]]
@of_10_unicast_4_buff_1 = external global [16 x [64 x bfloat]]
@of_10_unicast_4_buff_0 = external global [16 x [64 x bfloat]]

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.aie2p.acquire(i32, i32) #0

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.aie2p.release(i32, i32) #0

declare void @op0_zero_bf16_16_256_64(ptr) local_unnamed_addr

declare void @op0_matmul_bf16_bf16_16_256_64(ptr, ptr, ptr) local_unnamed_addr

define void @core_4_4() local_unnamed_addr {
  br label %1

1:                                                ; preds = %1, %0
  %2 = phi i64 [ 0, %0 ], [ %3, %1 ]
  tail call void @llvm.aie2p.acquire(i32 53, i32 -1)
  tail call void @llvm.aie2p.acquire(i32 48, i32 -1)
  tail call void @op0_zero_bf16_16_256_64(ptr nonnull @of_10_unicast_4_buff_0)
  tail call void @llvm.aie2p.acquire(i32 51, i32 -1)
  tail call void @op0_matmul_bf16_bf16_16_256_64(ptr nonnull @of_9_unicast_4_0_cons_buff_0, ptr nonnull @of_5_broadcast_0_0_4_cons_buff_0, ptr nonnull @of_10_unicast_4_buff_0)
  tail call void @llvm.aie2p.release(i32 50, i32 1)
  tail call void @llvm.aie2p.release(i32 49, i32 1)
  tail call void @llvm.aie2p.acquire(i32 48, i32 -1)
  tail call void @op0_zero_bf16_16_256_64(ptr nonnull @of_10_unicast_4_buff_1)
  tail call void @llvm.aie2p.acquire(i32 51, i32 -1)
  tail call void @op0_matmul_bf16_bf16_16_256_64(ptr nonnull @of_9_unicast_4_0_cons_buff_1, ptr nonnull @of_5_broadcast_0_0_4_cons_buff_0, ptr nonnull @of_10_unicast_4_buff_1)
  tail call void @llvm.aie2p.release(i32 50, i32 1)
  tail call void @llvm.aie2p.release(i32 49, i32 1)
  tail call void @llvm.aie2p.release(i32 52, i32 1)
  tail call void @llvm.aie2p.acquire(i32 53, i32 -1)
  tail call void @llvm.aie2p.acquire(i32 48, i32 -1)
  tail call void @op0_zero_bf16_16_256_64(ptr nonnull @of_10_unicast_4_buff_0)
  tail call void @llvm.aie2p.acquire(i32 51, i32 -1)
  tail call void @op0_matmul_bf16_bf16_16_256_64(ptr nonnull @of_9_unicast_4_0_cons_buff_0, ptr nonnull @of_5_broadcast_0_0_4_cons_buff_0, ptr nonnull @of_10_unicast_4_buff_0)
  tail call void @llvm.aie2p.release(i32 50, i32 1)
  tail call void @llvm.aie2p.release(i32 49, i32 1)
  tail call void @llvm.aie2p.acquire(i32 48, i32 -1)
  tail call void @op0_zero_bf16_16_256_64(ptr nonnull @of_10_unicast_4_buff_1)
  tail call void @llvm.aie2p.acquire(i32 51, i32 -1)
  tail call void @op0_matmul_bf16_bf16_16_256_64(ptr nonnull @of_9_unicast_4_0_cons_buff_1, ptr nonnull @of_5_broadcast_0_0_4_cons_buff_0, ptr nonnull @of_10_unicast_4_buff_1)
  tail call void @llvm.aie2p.release(i32 50, i32 1)
  tail call void @llvm.aie2p.release(i32 49, i32 1)
  tail call void @llvm.aie2p.release(i32 52, i32 1)
  tail call void @llvm.aie2p.acquire(i32 53, i32 -1)
  tail call void @llvm.aie2p.acquire(i32 48, i32 -1)
  tail call void @op0_zero_bf16_16_256_64(ptr nonnull @of_10_unicast_4_buff_0)
  tail call void @llvm.aie2p.acquire(i32 51, i32 -1)
  tail call void @op0_matmul_bf16_bf16_16_256_64(ptr nonnull @of_9_unicast_4_0_cons_buff_0, ptr nonnull @of_5_broadcast_0_0_4_cons_buff_0, ptr nonnull @of_10_unicast_4_buff_0)
  tail call void @llvm.aie2p.release(i32 50, i32 1)
  tail call void @llvm.aie2p.release(i32 49, i32 1)
  tail call void @llvm.aie2p.acquire(i32 48, i32 -1)
  tail call void @op0_zero_bf16_16_256_64(ptr nonnull @of_10_unicast_4_buff_1)
  tail call void @llvm.aie2p.acquire(i32 51, i32 -1)
  tail call void @op0_matmul_bf16_bf16_16_256_64(ptr nonnull @of_9_unicast_4_0_cons_buff_1, ptr nonnull @of_5_broadcast_0_0_4_cons_buff_0, ptr nonnull @of_10_unicast_4_buff_1)
  tail call void @llvm.aie2p.release(i32 50, i32 1)
  tail call void @llvm.aie2p.release(i32 49, i32 1)
  tail call void @llvm.aie2p.release(i32 52, i32 1)
  %3 = add nuw nsw i64 %2, 3
  %4 = icmp samesign ult i64 %2, 4294967292
  br i1 %4, label %1, label %5

5:                                                ; preds = %1
  ret void
}

attributes #0 = { mustprogress nocallback nofree nosync nounwind willreturn }

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
