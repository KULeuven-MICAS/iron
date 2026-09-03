; ModuleID = '/home/micas/iron-stream-dse/experiments/d4_mha/mha_prefill_stream_k1_h1_s512_d64_flash_shared_fused.mlir.d/peano-linked_op0__MHAStreamGroup_core_2_3.ll'
source_filename = "LLVMDialectModule"
target datalayout = "e-m:e-p:20:32-i1:8:32-i8:8:32-i16:16:32-i32:32:32-f32:32:32-i64:32-f64:32-a:0:32-n32"
target triple = "aie2p"

@flash_index_2_3 = external global [2 x i32]
@flash_state_2_3 = external global [256 x bfloat]
@flash_scale_2_3_2_4_buff_1 = external global [256 x bfloat]
@flash_scale_2_3_2_4_buff_0 = external global [256 x bfloat]
@of_7_distribute_2_0_cons_buff_1 = external global [64 x [64 x bfloat]]
@of_7_distribute_2_0_cons_buff_0 = external global [64 x [64 x bfloat]]
@of_8_switch_join_2_0_buff_3 = external global [64 x [64 x bfloat]]
@of_8_switch_join_2_0_buff_2 = external global [64 x [64 x bfloat]]
@of_8_switch_join_2_0_buff_1 = external global [64 x [64 x bfloat]]
@of_8_switch_join_2_0_buff_0 = external global [64 x [64 x bfloat]]
@switch.table.core_2_3 = private unnamed_addr constant [3 x ptr] [ptr @of_8_switch_join_2_0_buff_1, ptr @of_8_switch_join_2_0_buff_2, ptr @of_8_switch_join_2_0_buff_3], align 4

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.aie2p.acquire(i32, i32) #0

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.aie2p.release(i32, i32) #0

declare void @op0_init_scale_buffer(ptr, i32) local_unnamed_addr

declare void @op0_passThroughLine(ptr, ptr, i32) local_unnamed_addr

declare void @op0_partial_softmax_mode(ptr, ptr, ptr, ptr, bfloat, i32, i32, i32, i32, i32) local_unnamed_addr

define void @core_2_3() local_unnamed_addr {
  br label %.preheader

.preheader:                                       ; preds = %0, %29
  %1 = phi i32 [ 0, %0 ], [ %20, %29 ]
  %2 = phi i32 [ 0, %0 ], [ %23, %29 ]
  %3 = phi i32 [ 0, %0 ], [ %26, %29 ]
  %4 = phi i64 [ 0, %0 ], [ %30, %29 ]
  br label %5

5:                                                ; preds = %.preheader, %17
  %6 = phi i32 [ %1, %.preheader ], [ %20, %17 ]
  %7 = phi i32 [ %2, %.preheader ], [ %23, %17 ]
  %8 = phi i32 [ %3, %.preheader ], [ %26, %17 ]
  %9 = phi i64 [ 0, %.preheader ], [ %27, %17 ]
  tail call void @llvm.aie2p.acquire(i32 48, i32 -1)
  %switch.tableidx = add i32 %8, -1
  %10 = icmp ult i32 %switch.tableidx, 3
  br i1 %10, label %switch.lookup, label %12

switch.lookup:                                    ; preds = %5
  %11 = trunc nuw i32 %switch.tableidx to i20
  %switch.gep = getelementptr inbounds nuw [3 x ptr], ptr @switch.table.core_2_3, i20 0, i20 %11
  %switch.load = load ptr, ptr %switch.gep, align 4
  br label %12

12:                                               ; preds = %switch.lookup, %5
  %13 = phi ptr [ @of_8_switch_join_2_0_buff_0, %5 ], [ %switch.load, %switch.lookup ]
  tail call void @llvm.aie2p.acquire(i32 51, i32 -1)
  %cond = icmp eq i32 %7, 1
  %spec.select = select i1 %cond, ptr @of_7_distribute_2_0_cons_buff_1, ptr @of_7_distribute_2_0_cons_buff_0
  %14 = trunc nuw nsw i64 %9 to i32
  store i32 %14, ptr @flash_index_2_3, align 4
  store i32 2, ptr getelementptr inbounds nuw (i8, ptr @flash_index_2_3, i20 4), align 4
  %15 = icmp eq i32 %14, 0
  br i1 %15, label %16, label %17

16:                                               ; preds = %12
  tail call void @op0_init_scale_buffer(ptr nonnull @flash_state_2_3, i32 64)
  br label %17

17:                                               ; preds = %16, %12
  tail call void @op0_partial_softmax_mode(ptr nonnull %spec.select, ptr nonnull %13, ptr nonnull @flash_state_2_3, ptr nonnull @flash_index_2_3, bfloat 0xR3FB9, i32 64, i32 64, i32 512, i32 512, i32 2)
  tail call void @llvm.aie2p.acquire(i32 52, i32 -1)
  %cond1 = icmp eq i32 %6, 1
  %spec.select2 = select i1 %cond1, ptr @flash_scale_2_3_2_4_buff_1, ptr @flash_scale_2_3_2_4_buff_0
  tail call void @op0_passThroughLine(ptr nonnull @flash_state_2_3, ptr nonnull %spec.select2, i32 256)
  tail call void @llvm.aie2p.release(i32 53, i32 1)
  %18 = add i32 %6, 1
  %19 = icmp sgt i32 %18, 1
  %20 = select i1 %19, i32 0, i32 %18
  tail call void @llvm.aie2p.release(i32 50, i32 1)
  %21 = add i32 %7, 1
  %22 = icmp sgt i32 %21, 1
  %23 = select i1 %22, i32 0, i32 %21
  tail call void @llvm.aie2p.release(i32 49, i32 1)
  %24 = add i32 %8, 1
  %25 = icmp sgt i32 %24, 3
  %26 = select i1 %25, i32 0, i32 %24
  %27 = add nuw nsw i64 %9, 1
  %28 = icmp samesign ult i64 %9, 7
  br i1 %28, label %5, label %29

29:                                               ; preds = %17
  %30 = add nuw nsw i64 %4, 1
  %31 = icmp samesign ult i64 %4, 4294967294
  br i1 %31, label %.preheader, label %32

32:                                               ; preds = %29
  ret void
}

attributes #0 = { mustprogress nocallback nofree nosync nounwind willreturn }

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
