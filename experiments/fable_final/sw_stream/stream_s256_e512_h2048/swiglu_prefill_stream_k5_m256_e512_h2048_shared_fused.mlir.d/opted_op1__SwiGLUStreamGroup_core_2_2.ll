; ModuleID = '/home/micas/iron-stream-dse/experiments/fable_final/sw_stream/stream_s256_e512_h2048/swiglu_prefill_stream_k5_m256_e512_h2048_shared_fused.mlir.d/peano-linked_op1__SwiGLUStreamGroup_core_2_2.ll'
source_filename = "LLVMDialectModule"
target datalayout = "e-m:e-p:20:32-i1:8:32-i8:8:32-i16:16:32-i32:32:32-f32:32:32-i64:32-f64:32-a:0:32-n32"
target triple = "aie2p"

@of_1_unicast_2_0_cons_buff_3 = external global [1 x [2048 x bfloat]]
@of_1_unicast_2_0_cons_buff_2 = external global [1 x [2048 x bfloat]]
@of_1_unicast_2_0_cons_buff_1 = external global [1 x [2048 x bfloat]]
@of_1_unicast_2_0_cons_buff_0 = external global [1 x [2048 x bfloat]]
@of_2_unicast_2_buff_1 = external global [1 x [2048 x bfloat]]
@of_2_unicast_2_buff_0 = external global [1 x [2048 x bfloat]]
@switch.table.core_2_2 = private unnamed_addr constant [3 x ptr] [ptr @of_1_unicast_2_0_cons_buff_1, ptr @of_1_unicast_2_0_cons_buff_2, ptr @of_1_unicast_2_0_cons_buff_3], align 4

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.aie2p.acquire(i32, i32) #0

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.aie2p.release(i32, i32) #0

declare void @op1_silu_bf16(ptr, ptr, i32) local_unnamed_addr

define void @core_2_2() local_unnamed_addr {
  br label %.preheader

.preheader:                                       ; preds = %0, %20
  %1 = phi i32 [ 0, %0 ], [ %14, %20 ]
  %2 = phi i32 [ 0, %0 ], [ %17, %20 ]
  %3 = phi i64 [ 0, %0 ], [ %21, %20 ]
  br label %4

4:                                                ; preds = %.preheader, %10
  %5 = phi i32 [ %1, %.preheader ], [ %14, %10 ]
  %6 = phi i32 [ %2, %.preheader ], [ %17, %10 ]
  %7 = phi i64 [ 0, %.preheader ], [ %18, %10 ]
  tail call void @llvm.aie2p.acquire(i32 51, i32 -1)
  %switch.tableidx = add i32 %6, -1
  %8 = icmp ult i32 %switch.tableidx, 3
  br i1 %8, label %switch.lookup, label %10

switch.lookup:                                    ; preds = %4
  %9 = trunc nuw i32 %switch.tableidx to i20
  %switch.gep = getelementptr inbounds nuw [3 x ptr], ptr @switch.table.core_2_2, i20 0, i20 %9
  %switch.load = load ptr, ptr %switch.gep, align 4
  br label %10

10:                                               ; preds = %switch.lookup, %4
  %11 = phi ptr [ @of_1_unicast_2_0_cons_buff_0, %4 ], [ %switch.load, %switch.lookup ]
  tail call void @llvm.aie2p.acquire(i32 48, i32 -1)
  %cond = icmp eq i32 %5, 1
  %spec.select = select i1 %cond, ptr @of_2_unicast_2_buff_1, ptr @of_2_unicast_2_buff_0
  tail call void @op1_silu_bf16(ptr nonnull %11, ptr nonnull %spec.select, i32 2048)
  tail call void @llvm.aie2p.release(i32 49, i32 1)
  %12 = add i32 %5, 1
  %13 = icmp sgt i32 %12, 1
  %14 = select i1 %13, i32 0, i32 %12
  tail call void @llvm.aie2p.release(i32 50, i32 1)
  %15 = add i32 %6, 1
  %16 = icmp sgt i32 %15, 3
  %17 = select i1 %16, i32 0, i32 %15
  %18 = add nuw nsw i64 %7, 1
  %19 = icmp samesign ult i64 %7, 31
  br i1 %19, label %4, label %20

20:                                               ; preds = %10
  %21 = add nuw nsw i64 %3, 1
  %22 = icmp samesign ult i64 %3, 4294967294
  br i1 %22, label %.preheader, label %23

23:                                               ; preds = %20
  ret void
}

attributes #0 = { mustprogress nocallback nofree nosync nounwind willreturn }

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
