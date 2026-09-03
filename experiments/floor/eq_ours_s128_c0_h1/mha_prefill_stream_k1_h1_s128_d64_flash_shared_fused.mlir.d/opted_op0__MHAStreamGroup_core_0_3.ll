; ModuleID = '/home/micas/iron-stream-dse/experiments/floor/eq_ours_s128_c0_h1/mha_prefill_stream_k1_h1_s128_d64_flash_shared_fused.mlir.d/peano-linked_op0__MHAStreamGroup_core_0_3.ll'
source_filename = "LLVMDialectModule"
target datalayout = "e-m:e-p:20:32-i1:8:32-i8:8:32-i16:16:32-i32:32:32-f32:32:32-i64:32-f64:32-a:0:32-n32"
target triple = "aie2p"

@flash_index_0_3 = external global [2 x i32]
@flash_state_0_3 = external global [256 x bfloat]
@flash_scale_0_3_0_4_buff_1 = external global [256 x bfloat]
@flash_scale_0_3_0_4_buff_0 = external global [256 x bfloat]
@of_7_unicast_0_0_cons_buff_1 = external global [64 x [64 x bfloat]]
@of_7_unicast_0_0_cons_buff_0 = external global [64 x [64 x bfloat]]
@of_8_unicast_0_buff_1 = external global [64 x [64 x bfloat]]
@of_8_unicast_0_buff_0 = external global [64 x [64 x bfloat]]

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.aie2p.acquire(i32, i32) #0

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.aie2p.release(i32, i32) #0

declare void @op0_init_scale_buffer(ptr, i32) local_unnamed_addr

declare void @op0_passThroughLine(ptr, ptr, i32) local_unnamed_addr

declare void @op0_partial_softmax(ptr, ptr, ptr, ptr, bfloat, i32, i32, i32, i32) local_unnamed_addr

define void @core_0_3() local_unnamed_addr {
  br label %1

1:                                                ; preds = %0, %22
  %2 = phi i32 [ 0, %0 ], [ %16, %22 ]
  %3 = phi i32 [ 0, %0 ], [ %19, %22 ]
  %4 = phi i64 [ 0, %0 ], [ %23, %22 ]
  tail call void @llvm.aie2p.acquire(i32 51, i32 -2)
  br label %5

5:                                                ; preds = %1, %13
  %6 = phi i32 [ %2, %1 ], [ %16, %13 ]
  %7 = phi i32 [ %3, %1 ], [ %19, %13 ]
  %8 = phi i64 [ 0, %1 ], [ %20, %13 ]
  tail call void @llvm.aie2p.acquire(i32 48, i32 -1)
  %cond = icmp eq i32 %7, 1
  %spec.select = select i1 %cond, ptr @of_8_unicast_0_buff_1, ptr @of_8_unicast_0_buff_0
  %cond1 = icmp eq i64 %8, 1
  %9 = select i1 %cond1, ptr @of_7_unicast_0_0_cons_buff_1, ptr @of_7_unicast_0_0_cons_buff_0
  %10 = trunc nuw nsw i64 %8 to i32
  store i32 %10, ptr @flash_index_0_3, align 4
  store i32 0, ptr getelementptr inbounds nuw (i8, ptr @flash_index_0_3, i20 4), align 4
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %12, label %13

12:                                               ; preds = %5
  tail call void @op0_init_scale_buffer(ptr nonnull @flash_state_0_3, i32 64)
  br label %13

13:                                               ; preds = %12, %5
  tail call void @op0_partial_softmax(ptr nonnull %9, ptr nonnull %spec.select, ptr nonnull @flash_state_0_3, ptr nonnull @flash_index_0_3, bfloat 0xR3FB9, i32 64, i32 64, i32 128, i32 128)
  tail call void @llvm.aie2p.acquire(i32 52, i32 -1)
  %cond2 = icmp eq i32 %6, 1
  %spec.select4 = select i1 %cond2, ptr @flash_scale_0_3_0_4_buff_1, ptr @flash_scale_0_3_0_4_buff_0
  tail call void @op0_passThroughLine(ptr nonnull @flash_state_0_3, ptr nonnull %spec.select4, i32 256)
  tail call void @llvm.aie2p.release(i32 53, i32 1)
  %14 = add i32 %6, 1
  %15 = icmp sgt i32 %14, 1
  %16 = select i1 %15, i32 0, i32 %14
  tail call void @llvm.aie2p.release(i32 49, i32 1)
  %17 = add i32 %7, 1
  %18 = icmp sgt i32 %17, 1
  %19 = select i1 %18, i32 0, i32 %17
  %20 = add nuw nsw i64 %8, 1
  %21 = icmp eq i64 %8, 0
  br i1 %21, label %5, label %22

22:                                               ; preds = %13
  tail call void @llvm.aie2p.release(i32 50, i32 2)
  %23 = add nuw nsw i64 %4, 1
  %24 = icmp samesign ult i64 %4, 4294967294
  br i1 %24, label %1, label %25

25:                                               ; preds = %22
  ret void
}

attributes #0 = { mustprogress nocallback nofree nosync nounwind willreturn }

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
