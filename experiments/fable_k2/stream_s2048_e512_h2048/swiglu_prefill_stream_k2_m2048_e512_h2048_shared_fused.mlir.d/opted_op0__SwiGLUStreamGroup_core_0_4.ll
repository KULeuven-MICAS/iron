; ModuleID = '/home/micas/iron-stream-dse/experiments/fable_k2/stream_s2048_e512_h2048/swiglu_prefill_stream_k2_m2048_e512_h2048_shared_fused.mlir.d/peano-linked_op0__SwiGLUStreamGroup_core_0_4.ll'
source_filename = "LLVMDialectModule"
target datalayout = "e-m:e-p:20:32-i1:8:32-i8:8:32-i16:16:32-i32:32:32-f32:32:32-i64:32-f64:32-a:0:32-n32"
target triple = "aie2p"

@of_3_distribute_0_2_0_cons_buff_3 = external global [32 x [32 x bfloat]]
@of_3_distribute_0_2_0_cons_buff_2 = external global [32 x [32 x bfloat]]
@of_3_distribute_0_2_0_cons_buff_1 = external global [32 x [32 x bfloat]]
@of_3_distribute_0_2_0_cons_buff_0 = external global [32 x [32 x bfloat]]
@of_4_broadcast_0_0_2_cons_buff_3 = external global [32 x [64 x bfloat]]
@of_4_broadcast_0_0_2_cons_buff_2 = external global [32 x [64 x bfloat]]
@of_4_broadcast_0_0_2_cons_buff_1 = external global [32 x [64 x bfloat]]
@of_4_broadcast_0_0_2_cons_buff_0 = external global [32 x [64 x bfloat]]
@of_6_switch_join_2_0_buff_1 = external global [32 x [64 x bfloat]]
@of_6_switch_join_2_0_buff_0 = external global [32 x [64 x bfloat]]
@switch.table.core_0_4 = private unnamed_addr constant [3 x ptr] [ptr @of_4_broadcast_0_0_2_cons_buff_1, ptr @of_4_broadcast_0_0_2_cons_buff_2, ptr @of_4_broadcast_0_0_2_cons_buff_3], align 4
@switch.table.core_0_4.1 = private unnamed_addr constant [3 x ptr] [ptr @of_3_distribute_0_2_0_cons_buff_1, ptr @of_3_distribute_0_2_0_cons_buff_2, ptr @of_3_distribute_0_2_0_cons_buff_3], align 4

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.aie2p.acquire(i32, i32) #0

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.aie2p.release(i32, i32) #0

declare void @op0_zero_bf16_32_32_64(ptr) local_unnamed_addr

declare void @op0_matmul_bf16_bf16_32_32_64(ptr, ptr, ptr) local_unnamed_addr

define void @core_0_4() local_unnamed_addr {
  br label %.preheader2

.preheader2:                                      ; preds = %0, %43
  %1 = phi i32 [ 0, %0 ], [ %28, %43 ]
  %2 = phi i32 [ 0, %0 ], [ %31, %43 ]
  %3 = phi i32 [ 0, %0 ], [ %37, %43 ]
  %4 = phi i64 [ 0, %0 ], [ %44, %43 ]
  br label %.preheader

.preheader:                                       ; preds = %.preheader2, %40
  %5 = phi i32 [ %1, %.preheader2 ], [ %28, %40 ]
  %6 = phi i32 [ %2, %.preheader2 ], [ %31, %40 ]
  %7 = phi i32 [ %3, %.preheader2 ], [ %37, %40 ]
  %8 = phi i64 [ 0, %.preheader2 ], [ %41, %40 ]
  br label %9

9:                                                ; preds = %.preheader, %34
  %10 = phi i32 [ %5, %.preheader ], [ %28, %34 ]
  %11 = phi i32 [ %6, %.preheader ], [ %31, %34 ]
  %12 = phi i32 [ %7, %.preheader ], [ %37, %34 ]
  %13 = phi i64 [ 0, %.preheader ], [ %38, %34 ]
  tail call void @llvm.aie2p.acquire(i32 48, i32 -1)
  %cond = icmp eq i32 %12, 1
  %spec.select = select i1 %cond, ptr @of_6_switch_join_2_0_buff_1, ptr @of_6_switch_join_2_0_buff_0
  tail call void @op0_zero_bf16_32_32_64(ptr nonnull %spec.select)
  br label %14

14:                                               ; preds = %9, %24
  %15 = phi i32 [ %10, %9 ], [ %28, %24 ]
  %16 = phi i32 [ %11, %9 ], [ %31, %24 ]
  %17 = phi i64 [ 0, %9 ], [ %32, %24 ]
  tail call void @llvm.aie2p.acquire(i32 51, i32 -1)
  %switch.tableidx = add i32 %16, -1
  %18 = icmp ult i32 %switch.tableidx, 3
  br i1 %18, label %switch.lookup, label %20

switch.lookup:                                    ; preds = %14
  %19 = trunc nuw i32 %switch.tableidx to i20
  %switch.gep = getelementptr inbounds nuw [3 x ptr], ptr @switch.table.core_0_4, i20 0, i20 %19
  %switch.load = load ptr, ptr %switch.gep, align 4
  br label %20

20:                                               ; preds = %switch.lookup, %14
  %21 = phi ptr [ @of_4_broadcast_0_0_2_cons_buff_0, %14 ], [ %switch.load, %switch.lookup ]
  tail call void @llvm.aie2p.acquire(i32 53, i32 -1)
  %switch.tableidx15 = add i32 %15, -1
  %22 = icmp ult i32 %switch.tableidx15, 3
  br i1 %22, label %switch.lookup14, label %24

switch.lookup14:                                  ; preds = %20
  %23 = trunc nuw i32 %switch.tableidx15 to i20
  %switch.gep16 = getelementptr inbounds nuw [3 x ptr], ptr @switch.table.core_0_4.1, i20 0, i20 %23
  %switch.load17 = load ptr, ptr %switch.gep16, align 4
  br label %24

24:                                               ; preds = %switch.lookup14, %20
  %25 = phi ptr [ @of_3_distribute_0_2_0_cons_buff_0, %20 ], [ %switch.load17, %switch.lookup14 ]
  tail call void @op0_matmul_bf16_bf16_32_32_64(ptr nonnull %25, ptr nonnull %21, ptr nonnull %spec.select)
  tail call void @llvm.aie2p.release(i32 52, i32 1)
  %26 = add i32 %15, 1
  %27 = icmp sgt i32 %26, 3
  %28 = select i1 %27, i32 0, i32 %26
  tail call void @llvm.aie2p.release(i32 50, i32 1)
  %29 = add i32 %16, 1
  %30 = icmp sgt i32 %29, 3
  %31 = select i1 %30, i32 0, i32 %29
  %32 = add nuw nsw i64 %17, 1
  %33 = icmp samesign ult i64 %17, 15
  br i1 %33, label %14, label %34

34:                                               ; preds = %24
  tail call void @llvm.aie2p.release(i32 49, i32 1)
  %35 = add i32 %12, 1
  %36 = icmp sgt i32 %35, 1
  %37 = select i1 %36, i32 0, i32 %35
  %38 = add nuw nsw i64 %13, 1
  %39 = icmp samesign ult i64 %13, 15
  br i1 %39, label %9, label %40

40:                                               ; preds = %34
  %41 = add nuw nsw i64 %8, 1
  %42 = icmp samesign ult i64 %8, 15
  br i1 %42, label %.preheader, label %43

43:                                               ; preds = %40
  %44 = add nuw nsw i64 %4, 1
  %45 = icmp samesign ult i64 %4, 4294967294
  br i1 %45, label %.preheader2, label %46

46:                                               ; preds = %43
  ret void
}

attributes #0 = { mustprogress nocallback nofree nosync nounwind willreturn }

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
