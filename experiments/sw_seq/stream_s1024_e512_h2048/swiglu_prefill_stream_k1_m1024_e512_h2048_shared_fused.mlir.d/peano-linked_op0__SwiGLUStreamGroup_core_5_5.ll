; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"
target triple = "aie2p"

@of_13_mem_0_buff_1 = external global [8 x [4 x [32 x [32 x bfloat]]]]
@of_13_mem_0_buff_0 = external global [8 x [4 x [32 x [32 x bfloat]]]]
@of_13_mem_1_buff_1 = external global [8 x [4 x [32 x [32 x bfloat]]]]
@of_13_mem_1_buff_0 = external global [8 x [4 x [32 x [32 x bfloat]]]]
@of_0_mem_0_cons_buff_1 = external global [4 x [32 x [32 x bfloat]]]
@of_0_mem_0_cons_buff_0 = external global [4 x [32 x [32 x bfloat]]]
@of_0_mem_1_cons_buff_1 = external global [4 x [32 x [32 x bfloat]]]
@of_0_mem_1_cons_buff_0 = external global [4 x [32 x [32 x bfloat]]]
@of_1_mem_0_cons_buff_1 = external global [32 x [64 x bfloat]]
@of_1_mem_0_cons_buff_0 = external global [32 x [64 x bfloat]]
@of_1_mem_1_cons_buff_1 = external global [32 x [64 x bfloat]]
@of_1_mem_1_cons_buff_0 = external global [32 x [64 x bfloat]]
@of_2_mem_0_cons_buff_1 = external global [32 x [64 x bfloat]]
@of_2_mem_0_cons_buff_0 = external global [32 x [64 x bfloat]]
@of_2_mem_1_cons_buff_1 = external global [32 x [64 x bfloat]]
@of_2_mem_1_cons_buff_0 = external global [32 x [64 x bfloat]]
@of_3_mem_0_cons_buff_1 = external global [64 x [32 x bfloat]]
@of_3_mem_0_cons_buff_0 = external global [64 x [32 x bfloat]]
@of_4_distribute_0_0_1_cons_buff_1 = external global [32 x [32 x bfloat]]
@of_4_distribute_0_0_1_cons_buff_0 = external global [32 x [32 x bfloat]]
@of_4_distribute_0_0_0_cons_buff_1 = external global [32 x [32 x bfloat]]
@of_4_distribute_0_0_0_cons_buff_0 = external global [32 x [32 x bfloat]]
@of_3_mem_1_cons_buff_1 = external global [64 x [32 x bfloat]]
@of_3_mem_1_cons_buff_0 = external global [64 x [32 x bfloat]]
@of_4_distribute_0_1_1_cons_buff_1 = external global [32 x [32 x bfloat]]
@of_4_distribute_0_1_1_cons_buff_0 = external global [32 x [32 x bfloat]]
@of_4_distribute_0_1_0_cons_buff_1 = external global [32 x [32 x bfloat]]
@of_4_distribute_0_1_0_cons_buff_0 = external global [32 x [32 x bfloat]]
@of_4_distribute_0_2_1_cons_buff_1 = external global [32 x [32 x bfloat]]
@of_4_distribute_0_2_1_cons_buff_0 = external global [32 x [32 x bfloat]]
@of_4_distribute_0_2_0_cons_buff_1 = external global [32 x [32 x bfloat]]
@of_4_distribute_0_2_0_cons_buff_0 = external global [32 x [32 x bfloat]]
@of_4_distribute_0_3_1_cons_buff_1 = external global [32 x [32 x bfloat]]
@of_4_distribute_0_3_1_cons_buff_0 = external global [32 x [32 x bfloat]]
@of_4_distribute_0_3_0_cons_buff_1 = external global [32 x [32 x bfloat]]
@of_4_distribute_0_3_0_cons_buff_0 = external global [32 x [32 x bfloat]]
@of_4_distribute_1_0_1_cons_buff_1 = external global [32 x [32 x bfloat]]
@of_4_distribute_1_0_1_cons_buff_0 = external global [32 x [32 x bfloat]]
@of_4_distribute_1_0_0_cons_buff_1 = external global [32 x [32 x bfloat]]
@of_4_distribute_1_0_0_cons_buff_0 = external global [32 x [32 x bfloat]]
@of_4_distribute_1_1_1_cons_buff_1 = external global [32 x [32 x bfloat]]
@of_4_distribute_1_1_1_cons_buff_0 = external global [32 x [32 x bfloat]]
@of_4_distribute_1_1_0_cons_buff_1 = external global [32 x [32 x bfloat]]
@of_4_distribute_1_1_0_cons_buff_0 = external global [32 x [32 x bfloat]]
@of_4_distribute_1_2_1_cons_buff_1 = external global [32 x [32 x bfloat]]
@of_4_distribute_1_2_1_cons_buff_0 = external global [32 x [32 x bfloat]]
@of_4_distribute_1_2_0_cons_buff_1 = external global [32 x [32 x bfloat]]
@of_4_distribute_1_2_0_cons_buff_0 = external global [32 x [32 x bfloat]]
@of_4_distribute_1_3_1_cons_buff_1 = external global [32 x [32 x bfloat]]
@of_4_distribute_1_3_1_cons_buff_0 = external global [32 x [32 x bfloat]]
@of_4_distribute_1_3_0_cons_buff_1 = external global [32 x [32 x bfloat]]
@of_4_distribute_1_3_0_cons_buff_0 = external global [32 x [32 x bfloat]]
@of_5_broadcast_0_0_3_cons_buff_1 = external global [32 x [64 x bfloat]]
@of_5_broadcast_0_0_3_cons_buff_0 = external global [32 x [64 x bfloat]]
@of_5_broadcast_0_0_2_cons_buff_1 = external global [32 x [64 x bfloat]]
@of_5_broadcast_0_0_2_cons_buff_0 = external global [32 x [64 x bfloat]]
@of_5_broadcast_0_0_1_cons_buff_1 = external global [32 x [64 x bfloat]]
@of_5_broadcast_0_0_1_cons_buff_0 = external global [32 x [64 x bfloat]]
@of_5_broadcast_0_0_0_cons_buff_1 = external global [32 x [64 x bfloat]]
@of_5_broadcast_0_0_0_cons_buff_0 = external global [32 x [64 x bfloat]]
@of_5_broadcast_1_0_3_cons_buff_1 = external global [32 x [64 x bfloat]]
@of_5_broadcast_1_0_3_cons_buff_0 = external global [32 x [64 x bfloat]]
@of_5_broadcast_1_0_2_cons_buff_1 = external global [32 x [64 x bfloat]]
@of_5_broadcast_1_0_2_cons_buff_0 = external global [32 x [64 x bfloat]]
@of_5_broadcast_1_0_1_cons_buff_1 = external global [32 x [64 x bfloat]]
@of_5_broadcast_1_0_1_cons_buff_0 = external global [32 x [64 x bfloat]]
@of_5_broadcast_1_0_0_cons_buff_1 = external global [32 x [64 x bfloat]]
@of_5_broadcast_1_0_0_cons_buff_0 = external global [32 x [64 x bfloat]]
@of_6_broadcast_0_0_3_cons_buff_1 = external global [32 x [64 x bfloat]]
@of_6_broadcast_0_0_3_cons_buff_0 = external global [32 x [64 x bfloat]]
@of_6_broadcast_0_0_2_cons_buff_1 = external global [32 x [64 x bfloat]]
@of_6_broadcast_0_0_2_cons_buff_0 = external global [32 x [64 x bfloat]]
@of_6_broadcast_0_0_1_cons_buff_1 = external global [32 x [64 x bfloat]]
@of_6_broadcast_0_0_1_cons_buff_0 = external global [32 x [64 x bfloat]]
@of_6_broadcast_0_0_0_cons_buff_1 = external global [32 x [64 x bfloat]]
@of_6_broadcast_0_0_0_cons_buff_0 = external global [32 x [64 x bfloat]]
@of_6_broadcast_1_0_3_cons_buff_1 = external global [32 x [64 x bfloat]]
@of_6_broadcast_1_0_3_cons_buff_0 = external global [32 x [64 x bfloat]]
@of_6_broadcast_1_0_2_cons_buff_1 = external global [32 x [64 x bfloat]]
@of_6_broadcast_1_0_2_cons_buff_0 = external global [32 x [64 x bfloat]]
@of_6_broadcast_1_0_1_cons_buff_1 = external global [32 x [64 x bfloat]]
@of_6_broadcast_1_0_1_cons_buff_0 = external global [32 x [64 x bfloat]]
@of_6_broadcast_1_0_0_cons_buff_1 = external global [32 x [64 x bfloat]]
@of_6_broadcast_1_0_0_cons_buff_0 = external global [32 x [64 x bfloat]]
@of_7_broadcast_0_0_3_cons_buff_1 = external global [64 x [32 x bfloat]]
@of_7_broadcast_0_0_3_cons_buff_0 = external global [64 x [32 x bfloat]]
@of_7_broadcast_0_0_2_cons_buff_1 = external global [64 x [32 x bfloat]]
@of_7_broadcast_0_0_2_cons_buff_0 = external global [64 x [32 x bfloat]]
@of_7_broadcast_0_0_1_cons_buff_1 = external global [64 x [32 x bfloat]]
@of_7_broadcast_0_0_1_cons_buff_0 = external global [64 x [32 x bfloat]]
@of_7_broadcast_0_0_0_cons_buff_1 = external global [64 x [32 x bfloat]]
@of_7_broadcast_0_0_0_cons_buff_0 = external global [64 x [32 x bfloat]]
@of_7_broadcast_1_0_3_cons_buff_1 = external global [64 x [32 x bfloat]]
@of_7_broadcast_1_0_3_cons_buff_0 = external global [64 x [32 x bfloat]]
@of_7_broadcast_1_0_2_cons_buff_1 = external global [64 x [32 x bfloat]]
@of_7_broadcast_1_0_2_cons_buff_0 = external global [64 x [32 x bfloat]]
@of_7_broadcast_1_0_1_cons_buff_1 = external global [64 x [32 x bfloat]]
@of_7_broadcast_1_0_1_cons_buff_0 = external global [64 x [32 x bfloat]]
@of_7_broadcast_1_0_0_cons_buff_1 = external global [64 x [32 x bfloat]]
@of_7_broadcast_1_0_0_cons_buff_0 = external global [64 x [32 x bfloat]]
@of_8_switch_join_0_0_buff_1 = external global [32 x [64 x bfloat]]
@of_8_switch_join_0_0_buff_0 = external global [32 x [64 x bfloat]]
@of_8_switch_join_0_0_cons_buff_1 = external global [32 x [64 x bfloat]]
@of_8_switch_join_0_0_cons_buff_0 = external global [32 x [64 x bfloat]]
@of_8_switch_join_0_1_buff_1 = external global [32 x [64 x bfloat]]
@of_8_switch_join_0_1_buff_0 = external global [32 x [64 x bfloat]]
@of_8_switch_join_0_1_cons_buff_1 = external global [32 x [64 x bfloat]]
@of_8_switch_join_0_1_cons_buff_0 = external global [32 x [64 x bfloat]]
@of_8_switch_join_1_0_buff_1 = external global [32 x [64 x bfloat]]
@of_8_switch_join_1_0_buff_0 = external global [32 x [64 x bfloat]]
@of_8_switch_join_1_0_cons_buff_1 = external global [32 x [64 x bfloat]]
@of_8_switch_join_1_0_cons_buff_0 = external global [32 x [64 x bfloat]]
@of_8_switch_join_1_1_buff_1 = external global [32 x [64 x bfloat]]
@of_8_switch_join_1_1_buff_0 = external global [32 x [64 x bfloat]]
@of_8_switch_join_1_1_cons_buff_1 = external global [32 x [64 x bfloat]]
@of_8_switch_join_1_1_cons_buff_0 = external global [32 x [64 x bfloat]]
@of_8_switch_join_2_0_buff_1 = external global [32 x [64 x bfloat]]
@of_8_switch_join_2_0_buff_0 = external global [32 x [64 x bfloat]]
@of_8_switch_join_2_0_cons_buff_1 = external global [32 x [64 x bfloat]]
@of_8_switch_join_2_0_cons_buff_0 = external global [32 x [64 x bfloat]]
@of_8_switch_join_2_1_buff_1 = external global [32 x [64 x bfloat]]
@of_8_switch_join_2_1_buff_0 = external global [32 x [64 x bfloat]]
@of_8_switch_join_2_1_cons_buff_1 = external global [32 x [64 x bfloat]]
@of_8_switch_join_2_1_cons_buff_0 = external global [32 x [64 x bfloat]]
@of_8_switch_join_3_0_buff_1 = external global [32 x [64 x bfloat]]
@of_8_switch_join_3_0_buff_0 = external global [32 x [64 x bfloat]]
@of_8_switch_join_3_0_cons_buff_1 = external global [32 x [64 x bfloat]]
@of_8_switch_join_3_0_cons_buff_0 = external global [32 x [64 x bfloat]]
@of_8_switch_join_3_1_buff_1 = external global [32 x [64 x bfloat]]
@of_8_switch_join_3_1_buff_0 = external global [32 x [64 x bfloat]]
@of_8_switch_join_3_1_cons_buff_1 = external global [32 x [64 x bfloat]]
@of_8_switch_join_3_1_cons_buff_0 = external global [32 x [64 x bfloat]]
@of_9_switch_join_0_0_buff_1 = external global [32 x [64 x bfloat]]
@of_9_switch_join_0_0_buff_0 = external global [32 x [64 x bfloat]]
@of_9_switch_join_0_0_cons_buff_1 = external global [32 x [64 x bfloat]]
@of_9_switch_join_0_0_cons_buff_0 = external global [32 x [64 x bfloat]]
@of_9_switch_join_0_1_buff_1 = external global [32 x [64 x bfloat]]
@of_9_switch_join_0_1_buff_0 = external global [32 x [64 x bfloat]]
@of_9_switch_join_0_1_cons_buff_1 = external global [32 x [64 x bfloat]]
@of_9_switch_join_0_1_cons_buff_0 = external global [32 x [64 x bfloat]]
@of_9_switch_join_1_0_buff_1 = external global [32 x [64 x bfloat]]
@of_9_switch_join_1_0_buff_0 = external global [32 x [64 x bfloat]]
@of_9_switch_join_1_0_cons_buff_1 = external global [32 x [64 x bfloat]]
@of_9_switch_join_1_0_cons_buff_0 = external global [32 x [64 x bfloat]]
@of_9_switch_join_1_1_buff_1 = external global [32 x [64 x bfloat]]
@of_9_switch_join_1_1_buff_0 = external global [32 x [64 x bfloat]]
@of_9_switch_join_1_1_cons_buff_1 = external global [32 x [64 x bfloat]]
@of_9_switch_join_1_1_cons_buff_0 = external global [32 x [64 x bfloat]]
@of_9_switch_join_2_0_buff_1 = external global [32 x [64 x bfloat]]
@of_9_switch_join_2_0_buff_0 = external global [32 x [64 x bfloat]]
@of_9_switch_join_2_0_cons_buff_1 = external global [32 x [64 x bfloat]]
@of_9_switch_join_2_0_cons_buff_0 = external global [32 x [64 x bfloat]]
@of_9_switch_join_2_1_buff_1 = external global [32 x [64 x bfloat]]
@of_9_switch_join_2_1_buff_0 = external global [32 x [64 x bfloat]]
@of_9_switch_join_2_1_cons_buff_1 = external global [32 x [64 x bfloat]]
@of_9_switch_join_2_1_cons_buff_0 = external global [32 x [64 x bfloat]]
@of_9_switch_join_3_0_buff_1 = external global [32 x [64 x bfloat]]
@of_9_switch_join_3_0_buff_0 = external global [32 x [64 x bfloat]]
@of_9_switch_join_3_0_cons_buff_1 = external global [32 x [64 x bfloat]]
@of_9_switch_join_3_0_cons_buff_0 = external global [32 x [64 x bfloat]]
@of_9_switch_join_3_1_buff_1 = external global [32 x [64 x bfloat]]
@of_9_switch_join_3_1_buff_0 = external global [32 x [64 x bfloat]]
@of_9_switch_join_3_1_cons_buff_1 = external global [32 x [64 x bfloat]]
@of_9_switch_join_3_1_cons_buff_0 = external global [32 x [64 x bfloat]]
@of_10_unicast_0_buff_1 = external global [32 x [64 x bfloat]]
@of_10_unicast_0_buff_0 = external global [32 x [64 x bfloat]]
@of_10_unicast_1_buff_1 = external global [32 x [64 x bfloat]]
@of_10_unicast_1_buff_0 = external global [32 x [64 x bfloat]]
@of_10_unicast_2_buff_1 = external global [32 x [64 x bfloat]]
@of_10_unicast_2_buff_0 = external global [32 x [64 x bfloat]]
@of_10_unicast_3_buff_1 = external global [32 x [64 x bfloat]]
@of_10_unicast_3_buff_0 = external global [32 x [64 x bfloat]]
@of_11_broadcast_0_buff_1 = external global [32 x [64 x bfloat]]
@of_11_broadcast_0_buff_0 = external global [32 x [64 x bfloat]]
@of_11_broadcast_0_1_cons_buff_1 = external global [32 x [64 x bfloat]]
@of_11_broadcast_0_1_cons_buff_0 = external global [32 x [64 x bfloat]]
@of_11_broadcast_0_0_cons_buff_1 = external global [32 x [64 x bfloat]]
@of_11_broadcast_0_0_cons_buff_0 = external global [32 x [64 x bfloat]]
@of_11_broadcast_1_buff_1 = external global [32 x [64 x bfloat]]
@of_11_broadcast_1_buff_0 = external global [32 x [64 x bfloat]]
@of_11_broadcast_1_1_cons_buff_1 = external global [32 x [64 x bfloat]]
@of_11_broadcast_1_1_cons_buff_0 = external global [32 x [64 x bfloat]]
@of_11_broadcast_1_0_cons_buff_1 = external global [32 x [64 x bfloat]]
@of_11_broadcast_1_0_cons_buff_0 = external global [32 x [64 x bfloat]]
@of_11_broadcast_2_buff_1 = external global [32 x [64 x bfloat]]
@of_11_broadcast_2_buff_0 = external global [32 x [64 x bfloat]]
@of_11_broadcast_2_1_cons_buff_1 = external global [32 x [64 x bfloat]]
@of_11_broadcast_2_1_cons_buff_0 = external global [32 x [64 x bfloat]]
@of_11_broadcast_2_0_cons_buff_1 = external global [32 x [64 x bfloat]]
@of_11_broadcast_2_0_cons_buff_0 = external global [32 x [64 x bfloat]]
@of_11_broadcast_3_buff_1 = external global [32 x [64 x bfloat]]
@of_11_broadcast_3_buff_0 = external global [32 x [64 x bfloat]]
@of_11_broadcast_3_1_cons_buff_1 = external global [32 x [64 x bfloat]]
@of_11_broadcast_3_1_cons_buff_0 = external global [32 x [64 x bfloat]]
@of_11_broadcast_3_0_cons_buff_1 = external global [32 x [64 x bfloat]]
@of_11_broadcast_3_0_cons_buff_0 = external global [32 x [64 x bfloat]]
@of_12_join_0_0_buff_7 = external global [32 x [32 x bfloat]]
@of_12_join_0_0_buff_6 = external global [32 x [32 x bfloat]]
@of_12_join_0_0_buff_5 = external global [32 x [32 x bfloat]]
@of_12_join_0_0_buff_4 = external global [32 x [32 x bfloat]]
@of_12_join_0_0_buff_3 = external global [32 x [32 x bfloat]]
@of_12_join_0_0_buff_2 = external global [32 x [32 x bfloat]]
@of_12_join_0_0_buff_1 = external global [32 x [32 x bfloat]]
@of_12_join_0_0_buff_0 = external global [32 x [32 x bfloat]]
@of_12_join_0_1_buff_7 = external global [32 x [32 x bfloat]]
@of_12_join_0_1_buff_6 = external global [32 x [32 x bfloat]]
@of_12_join_0_1_buff_5 = external global [32 x [32 x bfloat]]
@of_12_join_0_1_buff_4 = external global [32 x [32 x bfloat]]
@of_12_join_0_1_buff_3 = external global [32 x [32 x bfloat]]
@of_12_join_0_1_buff_2 = external global [32 x [32 x bfloat]]
@of_12_join_0_1_buff_1 = external global [32 x [32 x bfloat]]
@of_12_join_0_1_buff_0 = external global [32 x [32 x bfloat]]
@of_12_join_0_2_buff_7 = external global [32 x [32 x bfloat]]
@of_12_join_0_2_buff_6 = external global [32 x [32 x bfloat]]
@of_12_join_0_2_buff_5 = external global [32 x [32 x bfloat]]
@of_12_join_0_2_buff_4 = external global [32 x [32 x bfloat]]
@of_12_join_0_2_buff_3 = external global [32 x [32 x bfloat]]
@of_12_join_0_2_buff_2 = external global [32 x [32 x bfloat]]
@of_12_join_0_2_buff_1 = external global [32 x [32 x bfloat]]
@of_12_join_0_2_buff_0 = external global [32 x [32 x bfloat]]
@of_12_join_0_3_buff_7 = external global [32 x [32 x bfloat]]
@of_12_join_0_3_buff_6 = external global [32 x [32 x bfloat]]
@of_12_join_0_3_buff_5 = external global [32 x [32 x bfloat]]
@of_12_join_0_3_buff_4 = external global [32 x [32 x bfloat]]
@of_12_join_0_3_buff_3 = external global [32 x [32 x bfloat]]
@of_12_join_0_3_buff_2 = external global [32 x [32 x bfloat]]
@of_12_join_0_3_buff_1 = external global [32 x [32 x bfloat]]
@of_12_join_0_3_buff_0 = external global [32 x [32 x bfloat]]
@of_12_join_1_0_buff_7 = external global [32 x [32 x bfloat]]
@of_12_join_1_0_buff_6 = external global [32 x [32 x bfloat]]
@of_12_join_1_0_buff_5 = external global [32 x [32 x bfloat]]
@of_12_join_1_0_buff_4 = external global [32 x [32 x bfloat]]
@of_12_join_1_0_buff_3 = external global [32 x [32 x bfloat]]
@of_12_join_1_0_buff_2 = external global [32 x [32 x bfloat]]
@of_12_join_1_0_buff_1 = external global [32 x [32 x bfloat]]
@of_12_join_1_0_buff_0 = external global [32 x [32 x bfloat]]
@of_12_join_1_1_buff_7 = external global [32 x [32 x bfloat]]
@of_12_join_1_1_buff_6 = external global [32 x [32 x bfloat]]
@of_12_join_1_1_buff_5 = external global [32 x [32 x bfloat]]
@of_12_join_1_1_buff_4 = external global [32 x [32 x bfloat]]
@of_12_join_1_1_buff_3 = external global [32 x [32 x bfloat]]
@of_12_join_1_1_buff_2 = external global [32 x [32 x bfloat]]
@of_12_join_1_1_buff_1 = external global [32 x [32 x bfloat]]
@of_12_join_1_1_buff_0 = external global [32 x [32 x bfloat]]
@of_12_join_1_2_buff_7 = external global [32 x [32 x bfloat]]
@of_12_join_1_2_buff_6 = external global [32 x [32 x bfloat]]
@of_12_join_1_2_buff_5 = external global [32 x [32 x bfloat]]
@of_12_join_1_2_buff_4 = external global [32 x [32 x bfloat]]
@of_12_join_1_2_buff_3 = external global [32 x [32 x bfloat]]
@of_12_join_1_2_buff_2 = external global [32 x [32 x bfloat]]
@of_12_join_1_2_buff_1 = external global [32 x [32 x bfloat]]
@of_12_join_1_2_buff_0 = external global [32 x [32 x bfloat]]
@of_12_join_1_3_buff_7 = external global [32 x [32 x bfloat]]
@of_12_join_1_3_buff_6 = external global [32 x [32 x bfloat]]
@of_12_join_1_3_buff_5 = external global [32 x [32 x bfloat]]
@of_12_join_1_3_buff_4 = external global [32 x [32 x bfloat]]
@of_12_join_1_3_buff_3 = external global [32 x [32 x bfloat]]
@of_12_join_1_3_buff_2 = external global [32 x [32 x bfloat]]
@of_12_join_1_3_buff_1 = external global [32 x [32 x bfloat]]
@of_12_join_1_3_buff_0 = external global [32 x [32 x bfloat]]

declare void @debug_i32(i32)

; Unknown intrinsic
declare void @llvm.aie2p.event(i32)

; Unknown intrinsic
declare void @llvm.aie2p.put.ms(i32, i32)

; Unknown intrinsic
declare { i32, i32 } @llvm.aie2p.get.ss()

; Unknown intrinsic
declare void @llvm.aie2p.mcd.write.vec(<16 x i32>, i32)

; Unknown intrinsic
declare <16 x i32> @llvm.aie2p.scd.read.vec(i32)

; Unknown intrinsic
declare void @llvm.aie2p.acquire(i32, i32)

; Unknown intrinsic
declare void @llvm.aie2p.release(i32, i32)

; Unknown intrinsic
declare void @llvm.aie2p.set.ctrl.reg(i32, i32)

declare void @op0_zero_bf16_32_32_64(ptr)

declare void @op0_matmul_bf16_bf16_32_32_64(ptr, ptr, ptr)

declare void @op0_zero_bf16_32_64_32(ptr)

declare void @op0_matmul_bf16_bf16_32_64_32(ptr, ptr, ptr)

declare void @op0_silu_bf16(ptr, ptr, i32)

declare void @op0_eltwise_mul_bf16_vector(ptr, ptr, ptr, i32)

define void @core_5_5() {
  br label %1

1:                                                ; preds = %81, %0
  %2 = phi i64 [ %82, %81 ], [ 0, %0 ]
  %3 = phi i32 [ %10, %81 ], [ 0, %0 ]
  %4 = phi i32 [ %11, %81 ], [ 0, %0 ]
  %5 = phi i32 [ %12, %81 ], [ 0, %0 ]
  %6 = phi i32 [ %13, %81 ], [ 0, %0 ]
  %7 = icmp slt i64 %2, 4294967295
  br i1 %7, label %8, label %83

8:                                                ; preds = %79, %1
  %9 = phi i64 [ %80, %79 ], [ 0, %1 ]
  %10 = phi i32 [ %17, %79 ], [ %3, %1 ]
  %11 = phi i32 [ %18, %79 ], [ %4, %1 ]
  %12 = phi i32 [ %19, %79 ], [ %5, %1 ]
  %13 = phi i32 [ %20, %79 ], [ %6, %1 ]
  %14 = icmp slt i64 %9, 8
  br i1 %14, label %15, label %81

15:                                               ; preds = %71, %8
  %16 = phi i64 [ %78, %71 ], [ 0, %8 ]
  %17 = phi i32 [ %74, %71 ], [ %10, %8 ]
  %18 = phi i32 [ %77, %71 ], [ %11, %8 ]
  %19 = phi i32 [ %47, %71 ], [ %12, %8 ]
  %20 = phi i32 [ %48, %71 ], [ %13, %8 ]
  %21 = icmp slt i64 %16, 16
  br i1 %21, label %22, label %79

22:                                               ; preds = %15
  call void @llvm.aie2p.acquire(i32 53, i32 -1)
  call void @llvm.aie2p.acquire(i32 51, i32 -1)
  %23 = sext i32 %17 to i64
  switch i64 %23, label %24 [
    i64 0, label %84
    i64 1, label %86
  ]

24:                                               ; preds = %84, %86, %22
  %25 = phi ptr [ %87, %86 ], [ %85, %84 ], [ @of_9_switch_join_3_0_cons_buff_0, %22 ]
  %26 = getelementptr [32 x [64 x bfloat]], ptr %25, i32 0, i32 0, i32 0
  %27 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } { ptr inttoptr (i64 3735928559 to ptr), ptr poison, i64 poison, [2 x i64] poison, [2 x i64] poison }, ptr %26, 1
  %28 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %27, i64 0, 2
  %29 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %28, i64 32, 3, 0
  %30 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %29, i64 64, 3, 1
  %31 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %30, i64 64, 4, 0
  %32 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %31, i64 1, 4, 1
  br label %33

33:                                               ; preds = %24
  %34 = sext i32 %18 to i64
  switch i64 %34, label %35 [
    i64 0, label %88
    i64 1, label %90
  ]

35:                                               ; preds = %88, %90, %33
  %36 = phi ptr [ %91, %90 ], [ %89, %88 ], [ @of_9_switch_join_3_1_cons_buff_0, %33 ]
  %37 = getelementptr [32 x [64 x bfloat]], ptr %36, i32 0, i32 0, i32 0
  %38 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } { ptr inttoptr (i64 3735928559 to ptr), ptr poison, i64 poison, [2 x i64] poison, [2 x i64] poison }, ptr %37, 1
  %39 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %38, i64 0, 2
  %40 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %39, i64 32, 3, 0
  %41 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %40, i64 64, 3, 1
  %42 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %41, i64 64, 4, 0
  %43 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %42, i64 1, 4, 1
  br label %44

44:                                               ; preds = %35
  br label %45

45:                                               ; preds = %61, %44
  %46 = phi i64 [ %70, %61 ], [ 0, %44 ]
  %47 = phi i32 [ %69, %61 ], [ %19, %44 ]
  %48 = phi i32 [ %66, %61 ], [ %20, %44 ]
  %49 = icmp slt i64 %46, 2
  br i1 %49, label %50, label %71

50:                                               ; preds = %45
  call void @llvm.aie2p.acquire(i32 48, i32 -1)
  %51 = sext i32 %47 to i64
  switch i64 %51, label %52 [
    i64 0, label %92
    i64 1, label %94
  ]

52:                                               ; preds = %92, %94, %50
  %53 = phi ptr [ %95, %94 ], [ %93, %92 ], [ @of_11_broadcast_3_buff_0, %50 ]
  %54 = getelementptr [32 x [64 x bfloat]], ptr %53, i32 0, i32 0, i32 0
  br label %55

55:                                               ; preds = %52
  call void @llvm.aie2p.acquire(i32 17, i32 -1)
  %56 = sext i32 %48 to i64
  switch i64 %56, label %57 [
    i64 0, label %96
    i64 1, label %98
  ]

57:                                               ; preds = %96, %98, %55
  %58 = phi ptr [ %99, %98 ], [ %97, %96 ], [ @of_10_unicast_3_buff_0, %55 ]
  %59 = getelementptr [32 x [64 x bfloat]], ptr %58, i32 0, i32 0, i32 0
  br label %60

60:                                               ; preds = %57
  switch i64 %46, label %61 [
    i64 1, label %100
  ]

61:                                               ; preds = %100, %60
  %62 = phi { ptr, ptr, i64, [2 x i64], [2 x i64] } [ %101, %100 ], [ %32, %60 ]
  %63 = extractvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %62, 1
  call void @op0_eltwise_mul_bf16_vector(ptr %59, ptr %63, ptr %54, i32 2048)
  call void @llvm.aie2p.release(i32 16, i32 1)
  %64 = add i32 %48, 1
  %65 = icmp sge i32 %64, 2
  %66 = select i1 %65, i32 0, i32 %64
  call void @llvm.aie2p.release(i32 49, i32 1)
  %67 = add i32 %47, 1
  %68 = icmp sge i32 %67, 2
  %69 = select i1 %68, i32 0, i32 %67
  %70 = add i64 %46, 1
  br label %45

71:                                               ; preds = %45
  call void @llvm.aie2p.release(i32 52, i32 1)
  %72 = add i32 %17, 1
  %73 = icmp sge i32 %72, 2
  %74 = select i1 %73, i32 0, i32 %72
  call void @llvm.aie2p.release(i32 50, i32 1)
  %75 = add i32 %18, 1
  %76 = icmp sge i32 %75, 2
  %77 = select i1 %76, i32 0, i32 %75
  %78 = add i64 %16, 1
  br label %15

79:                                               ; preds = %15
  %80 = add i64 %9, 1
  br label %8

81:                                               ; preds = %8
  %82 = add i64 %2, 1
  br label %1

83:                                               ; preds = %1
  ret void

84:                                               ; preds = %22
  %85 = phi ptr [ @of_9_switch_join_3_0_cons_buff_0, %22 ]
  br label %24

86:                                               ; preds = %22
  %87 = phi ptr [ @of_9_switch_join_3_0_cons_buff_1, %22 ]
  br label %24

88:                                               ; preds = %33
  %89 = phi ptr [ @of_9_switch_join_3_1_cons_buff_0, %33 ]
  br label %35

90:                                               ; preds = %33
  %91 = phi ptr [ @of_9_switch_join_3_1_cons_buff_1, %33 ]
  br label %35

92:                                               ; preds = %50
  %93 = phi ptr [ @of_11_broadcast_3_buff_0, %50 ]
  br label %52

94:                                               ; preds = %50
  %95 = phi ptr [ @of_11_broadcast_3_buff_1, %50 ]
  br label %52

96:                                               ; preds = %55
  %97 = phi ptr [ @of_10_unicast_3_buff_0, %55 ]
  br label %57

98:                                               ; preds = %55
  %99 = phi ptr [ @of_10_unicast_3_buff_1, %55 ]
  br label %57

100:                                              ; preds = %60
  %101 = phi { ptr, ptr, i64, [2 x i64], [2 x i64] } [ %43, %60 ]
  br label %61
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
