; ModuleID = '/home/micas/iron-stream-dse/experiments/fable_p2sw2/stream_s512_e512_h2048/swiglu_prefill_stream_k5_m512_e512_h2048_shared_fused.mlir.d/peano-linked_op2__SwiGLUStreamGroup_core_5_2.ll'
source_filename = "LLVMDialectModule"
target datalayout = "e-m:e-p:20:32-i1:8:32-i8:8:32-i16:16:32-i32:32:32-f32:32:32-i64:32-f64:32-a:0:32-n32"
target triple = "aie2p"

@of_2_unicast_5_0_cons_buff_3 = external global [1 x [2048 x bfloat]]
@of_2_unicast_5_0_cons_buff_2 = external global [1 x [2048 x bfloat]]
@of_2_unicast_5_0_cons_buff_1 = external global [1 x [2048 x bfloat]]
@of_2_unicast_5_0_cons_buff_0 = external global [1 x [2048 x bfloat]]
@of_3_unicast_5_0_cons_buff_3 = external global [1 x [2048 x bfloat]]
@of_3_unicast_5_0_cons_buff_2 = external global [1 x [2048 x bfloat]]
@of_3_unicast_5_0_cons_buff_1 = external global [1 x [2048 x bfloat]]
@of_3_unicast_5_0_cons_buff_0 = external global [1 x [2048 x bfloat]]
@of_4_unicast_5_buff_1 = external global [1 x [2048 x bfloat]]
@of_4_unicast_5_buff_0 = external global [1 x [2048 x bfloat]]
@switch.table.core_5_2 = private unnamed_addr constant [3 x ptr] [ptr @of_3_unicast_5_0_cons_buff_1, ptr @of_3_unicast_5_0_cons_buff_2, ptr @of_3_unicast_5_0_cons_buff_3], align 4
@switch.table.core_5_2.1 = private unnamed_addr constant [3 x ptr] [ptr @of_2_unicast_5_0_cons_buff_1, ptr @of_2_unicast_5_0_cons_buff_2, ptr @of_2_unicast_5_0_cons_buff_3], align 4

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.aie2p.acquire(i32, i32) #0

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.aie2p.release(i32, i32) #0

declare void @op2_eltwise_mul_bf16_vector(ptr, ptr, ptr, i32) local_unnamed_addr

define void @core_5_2() local_unnamed_addr {
  br label %.preheader

.preheader:                                       ; preds = %0, %29
  %1 = phi i32 [ 0, %0 ], [ %20, %29 ]
  %2 = phi i32 [ 0, %0 ], [ %23, %29 ]
  %3 = phi i32 [ 0, %0 ], [ %26, %29 ]
  %4 = phi i64 [ 0, %0 ], [ %30, %29 ]
  br label %5

5:                                                ; preds = %.preheader, %16
  %6 = phi i32 [ %1, %.preheader ], [ %20, %16 ]
  %7 = phi i32 [ %2, %.preheader ], [ %23, %16 ]
  %8 = phi i32 [ %3, %.preheader ], [ %26, %16 ]
  %9 = phi i64 [ 0, %.preheader ], [ %27, %16 ]
  tail call void @llvm.aie2p.acquire(i32 51, i32 -1)
  %switch.tableidx = add i32 %8, -1
  %10 = icmp ult i32 %switch.tableidx, 3
  br i1 %10, label %switch.lookup, label %12

switch.lookup:                                    ; preds = %5
  %11 = trunc nuw i32 %switch.tableidx to i20
  %switch.gep = getelementptr inbounds nuw [3 x ptr], ptr @switch.table.core_5_2, i20 0, i20 %11
  %switch.load = load ptr, ptr %switch.gep, align 4
  br label %12

12:                                               ; preds = %switch.lookup, %5
  %13 = phi ptr [ @of_3_unicast_5_0_cons_buff_0, %5 ], [ %switch.load, %switch.lookup ]
  tail call void @llvm.aie2p.acquire(i32 53, i32 -1)
  %switch.tableidx8 = add i32 %7, -1
  %14 = icmp ult i32 %switch.tableidx8, 3
  br i1 %14, label %switch.lookup7, label %16

switch.lookup7:                                   ; preds = %12
  %15 = trunc nuw i32 %switch.tableidx8 to i20
  %switch.gep9 = getelementptr inbounds nuw [3 x ptr], ptr @switch.table.core_5_2.1, i20 0, i20 %15
  %switch.load10 = load ptr, ptr %switch.gep9, align 4
  br label %16

16:                                               ; preds = %switch.lookup7, %12
  %17 = phi ptr [ @of_2_unicast_5_0_cons_buff_0, %12 ], [ %switch.load10, %switch.lookup7 ]
  tail call void @llvm.aie2p.acquire(i32 48, i32 -1)
  %cond = icmp eq i32 %6, 1
  %spec.select = select i1 %cond, ptr @of_4_unicast_5_buff_1, ptr @of_4_unicast_5_buff_0
  tail call void @op2_eltwise_mul_bf16_vector(ptr nonnull %17, ptr nonnull %13, ptr nonnull %spec.select, i32 2048)
  tail call void @llvm.aie2p.release(i32 49, i32 1)
  %18 = add i32 %6, 1
  %19 = icmp sgt i32 %18, 1
  %20 = select i1 %19, i32 0, i32 %18
  tail call void @llvm.aie2p.release(i32 52, i32 1)
  %21 = add i32 %7, 1
  %22 = icmp sgt i32 %21, 3
  %23 = select i1 %22, i32 0, i32 %21
  tail call void @llvm.aie2p.release(i32 50, i32 1)
  %24 = add i32 %8, 1
  %25 = icmp sgt i32 %24, 3
  %26 = select i1 %25, i32 0, i32 %24
  %27 = add nuw nsw i64 %9, 1
  %28 = icmp samesign ult i64 %9, 63
  br i1 %28, label %5, label %29

29:                                               ; preds = %16
  %30 = add nuw nsw i64 %4, 1
  %31 = icmp samesign ult i64 %4, 4294967294
  br i1 %31, label %.preheader, label %32

32:                                               ; preds = %29
  ret void
}

attributes #0 = { mustprogress nocallback nofree nosync nounwind willreturn }

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
