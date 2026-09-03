; ModuleID = '/home/micas/iron-stream-dse/experiments/alloc512/eq_ours_s512_c4_h24/mha_prefill_stream_k1_h24_s512_d64_flash_shared_fused.mlir.d/peano-linked_op0__MHAStreamGroup_core_2_4.ll'
source_filename = "LLVMDialectModule"
target datalayout = "e-m:e-p:20:32-i1:8:32-i8:8:32-i16:16:32-i32:32:32-f32:32:32-i64:32-f64:32-a:0:32-n32"
target triple = "aie2p"

@flash_index_2_4 = external global [2 x i32]
@flash_scale_2_3_2_4_buff_1 = external global [256 x bfloat]
@flash_scale_2_3_2_4_buff_0 = external global [256 x bfloat]
@flash_scale_2_5_2_4_buff_1 = external global [256 x bfloat]
@flash_scale_2_5_2_4_buff_0 = external global [256 x bfloat]
@of_5_broadcast_0_0_2_cons_buff_1 = external global [64 x [64 x bfloat]]
@of_5_broadcast_0_0_2_cons_buff_0 = external global [64 x [64 x bfloat]]
@of_8_switch_join_2_0_buff_1 = external global [64 x [64 x bfloat]]
@of_8_switch_join_2_0_buff_0 = external global [64 x [64 x bfloat]]
@of_8_switch_join_2_1_buff_1 = external global [64 x [64 x bfloat]]
@of_8_switch_join_2_1_buff_0 = external global [64 x [64 x bfloat]]
@of_9_unicast_2_buff_1 = external global [64 x [64 x bfloat]]
@of_9_unicast_2_buff_0 = external global [64 x [64 x bfloat]]

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.aie2p.acquire(i32, i32) #0

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.aie2p.release(i32, i32) #0

declare void @op0_rescale_O(ptr, ptr, i32, ptr) local_unnamed_addr

declare void @op0_zero_bf16(ptr) local_unnamed_addr

declare void @op0_matmul_PV(ptr, ptr, ptr, ptr, i32, i32, ptr) local_unnamed_addr

define void @core_2_4() local_unnamed_addr {
  br label %1

1:                                                ; preds = %0, %60
  %2 = phi i32 [ 0, %0 ], [ %45, %60 ]
  %3 = phi i32 [ 0, %0 ], [ %44, %60 ]
  %4 = phi i32 [ 0, %0 ], [ %54, %60 ]
  %5 = phi i32 [ 0, %0 ], [ %51, %60 ]
  %6 = phi i32 [ 0, %0 ], [ %57, %60 ]
  %7 = phi i64 [ 0, %0 ], [ %61, %60 ]
  tail call void @llvm.aie2p.acquire(i32 48, i32 -2)
  tail call void @op0_zero_bf16(ptr nonnull @of_9_unicast_2_buff_0)
  tail call void @op0_zero_bf16(ptr nonnull @of_9_unicast_2_buff_1)
  br label %8

8:                                                ; preds = %1, %48
  %9 = phi i32 [ %2, %1 ], [ %45, %48 ]
  %10 = phi i32 [ %3, %1 ], [ %44, %48 ]
  %11 = phi i32 [ %4, %1 ], [ %54, %48 ]
  %12 = phi i32 [ %5, %1 ], [ %51, %48 ]
  %13 = phi i32 [ %6, %1 ], [ %57, %48 ]
  %14 = phi i64 [ 0, %1 ], [ %58, %48 ]
  tail call void @llvm.aie2p.acquire(i32 51, i32 -1)
  %cond2 = icmp eq i32 %13, 1
  %spec.select = select i1 %cond2, ptr @of_5_broadcast_0_0_2_cons_buff_1, ptr @of_5_broadcast_0_0_2_cons_buff_0
  tail call void @llvm.aie2p.acquire(i32 1, i32 -1)
  tail call void @llvm.aie2p.acquire(i32 33, i32 -1)
  %cond3 = icmp eq i32 %12, 1
  %15 = select i1 %cond3, ptr @of_8_switch_join_2_0_buff_1, ptr @of_8_switch_join_2_0_buff_0
  %cond4 = icmp eq i32 %11, 1
  %16 = select i1 %cond4, ptr @of_8_switch_join_2_1_buff_1, ptr @of_8_switch_join_2_1_buff_0
  %17 = trunc nuw nsw i64 %14 to i32
  %18 = icmp ne i32 %17, 0
  %19 = zext i1 %18 to i32
  %20 = icmp eq i32 %17, 7
  %21 = icmp ne i32 %17, 0
  %22 = zext i1 %21 to i32
  %23 = icmp eq i32 %17, 7
  br label %24

24:                                               ; preds = %8, %43
  %25 = phi i32 [ %9, %8 ], [ %45, %43 ]
  %26 = phi i32 [ %10, %8 ], [ %44, %43 ]
  %27 = phi i64 [ 0, %8 ], [ %46, %43 ]
  %cond5 = icmp eq i64 %27, 1
  %spec.select21 = select i1 %cond5, ptr @of_9_unicast_2_buff_1, ptr @of_9_unicast_2_buff_0
  %.pn20 = select i1 %cond5, ptr %16, ptr %15
  %28 = trunc nuw nsw i64 %27 to i32
  %29 = shl nuw nsw i32 %28, 2
  %30 = or disjoint i32 %29, 2
  store i32 %17, ptr @flash_index_2_4, align 4
  store i32 %30, ptr getelementptr inbounds nuw (i8, ptr @flash_index_2_4, i20 4), align 4
  br i1 %cond5, label %37, label %31

31:                                               ; preds = %24
  tail call void @llvm.aie2p.acquire(i32 5, i32 -1)
  %cond6 = icmp eq i32 %26, 1
  %spec.select22 = select i1 %cond6, ptr @flash_scale_2_3_2_4_buff_1, ptr @flash_scale_2_3_2_4_buff_0
  tail call void @op0_matmul_PV(ptr nonnull %.pn20, ptr nonnull %spec.select, ptr nonnull %spec.select21, ptr nonnull %spec.select22, i32 64, i32 %19, ptr nonnull @flash_index_2_4)
  br i1 %20, label %32, label %33

32:                                               ; preds = %31
  tail call void @op0_rescale_O(ptr nonnull %spec.select21, ptr nonnull %spec.select22, i32 64, ptr nonnull @flash_index_2_4)
  br label %33

33:                                               ; preds = %32, %31
  tail call void @llvm.aie2p.release(i32 4, i32 1)
  %34 = add i32 %26, 1
  %35 = icmp sgt i32 %34, 1
  %36 = select i1 %35, i32 0, i32 %34
  br label %43

37:                                               ; preds = %24
  tail call void @llvm.aie2p.acquire(i32 37, i32 -1)
  %cond7 = icmp eq i32 %25, 1
  %spec.select23 = select i1 %cond7, ptr @flash_scale_2_5_2_4_buff_1, ptr @flash_scale_2_5_2_4_buff_0
  tail call void @op0_matmul_PV(ptr nonnull %.pn20, ptr nonnull %spec.select, ptr nonnull %spec.select21, ptr nonnull %spec.select23, i32 64, i32 %22, ptr nonnull @flash_index_2_4)
  br i1 %23, label %38, label %39

38:                                               ; preds = %37
  tail call void @op0_rescale_O(ptr nonnull %spec.select21, ptr nonnull %spec.select23, i32 64, ptr nonnull @flash_index_2_4)
  br label %39

39:                                               ; preds = %38, %37
  tail call void @llvm.aie2p.release(i32 36, i32 1)
  %40 = add i32 %25, 1
  %41 = icmp sgt i32 %40, 1
  %42 = select i1 %41, i32 0, i32 %40
  br label %43

43:                                               ; preds = %39, %33
  %44 = phi i32 [ %26, %39 ], [ %36, %33 ]
  %45 = phi i32 [ %42, %39 ], [ %25, %33 ]
  %46 = add nuw nsw i64 %27, 1
  %47 = icmp eq i64 %27, 0
  br i1 %47, label %24, label %48

48:                                               ; preds = %43
  tail call void @llvm.aie2p.release(i32 0, i32 1)
  %49 = add i32 %12, 1
  %50 = icmp sgt i32 %49, 1
  %51 = select i1 %50, i32 0, i32 %49
  tail call void @llvm.aie2p.release(i32 32, i32 1)
  %52 = add i32 %11, 1
  %53 = icmp sgt i32 %52, 1
  %54 = select i1 %53, i32 0, i32 %52
  tail call void @llvm.aie2p.release(i32 50, i32 1)
  %55 = add i32 %13, 1
  %56 = icmp sgt i32 %55, 1
  %57 = select i1 %56, i32 0, i32 %55
  %58 = add nuw nsw i64 %14, 1
  %59 = icmp samesign ult i64 %14, 7
  br i1 %59, label %8, label %60

60:                                               ; preds = %48
  tail call void @llvm.aie2p.release(i32 49, i32 2)
  %61 = add nuw nsw i64 %7, 1
  %62 = icmp samesign ult i64 %7, 4294967294
  br i1 %62, label %1, label %63

63:                                               ; preds = %60
  ret void
}

attributes #0 = { mustprogress nocallback nofree nosync nounwind willreturn }

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
