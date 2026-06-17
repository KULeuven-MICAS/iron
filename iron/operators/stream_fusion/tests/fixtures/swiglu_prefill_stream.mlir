builtin.module {
  aie.device(npu2) {
    %0 = aie.tile(0, 0)
    %1 = aie.tile(1, 0)
    %2 = aie.tile(2, 0)
    %3 = aie.tile(3, 0)
    %4 = aie.tile(4, 0)
    %5 = aie.tile(5, 0)
    %6 = aie.tile(6, 0)
    %7 = aie.tile(7, 0)
    %8 = aie.tile(1, 1)
    %9 = aie.tile(2, 1)
    %10 = aie.tile(4, 1)
    %11 = aie.tile(5, 1)
    %12 = aie.tile(7, 1)
    %13 = aie.tile(3, 1)
    %14 = aie.tile(0, 1)
    %15 = aie.tile(6, 1)
    %16 = aie.tile(0, 2)
    %17 = aie.tile(0, 3)
    %18 = aie.tile(0, 4)
    %19 = aie.tile(0, 5)
    %20 = aie.tile(1, 2)
    %21 = aie.tile(1, 3)
    %22 = aie.tile(1, 4)
    %23 = aie.tile(1, 5)
    %24 = aie.tile(2, 2)
    %25 = aie.tile(2, 3)
    %26 = aie.tile(2, 4)
    %27 = aie.tile(2, 5)
    %28 = aie.tile(3, 2)
    %29 = aie.tile(3, 3)
    %30 = aie.tile(3, 4)
    %31 = aie.tile(3, 5)
    %32 = aie.tile(6, 2)
    %33 = aie.tile(6, 3)
    %34 = aie.tile(6, 4)
    %35 = aie.tile(6, 5)
    %36 = aie.tile(7, 2)
    %37 = aie.tile(7, 3)
    %38 = aie.tile(7, 4)
    %39 = aie.tile(7, 5)
    %40 = aie.tile(4, 2)
    %41 = aie.tile(4, 3)
    %42 = aie.tile(4, 4)
    %43 = aie.tile(4, 5)
    %44 = aie.tile(5, 2)
    %45 = aie.tile(5, 3)
    %46 = aie.tile(5, 4)
    %47 = aie.tile(5, 5)
    aie.runtime_sequence(%48 : memref<256x512xbf16>, %49 : memref<512x2048xbf16>, %50 : memref<512x2048xbf16>, %51 : memref<2048x512xbf16>, %52 : memref<256x512xbf16>) {
      %53 = "aiex.dma_configure_task_for"() <{alloc = @of_0_mem_0, issue_token = false, repeat_count = 15 : i32}> ({
        "aie.dma_bd"(%48) <{offset = 0 : i32, len = 16384 : i32, dimensions = #aie<bd_dim_layout_array[<size = 16, stride = 0>, <size = 16, stride = 32>, <size = 32, stride = 512>, <size = 32, stride = 1>]>}> : (memref<256x512xbf16>) -> ()
        aie.end
      }) {iteration_t = 0 : index} : () -> index
      "aiex.dma_start_task"(%53) : (index) -> ()
      %54 = "aiex.dma_configure_task_for"() <{alloc = @of_0_mem_1, issue_token = false, repeat_count = 15 : i32}> ({
        "aie.dma_bd"(%48) <{offset = 16384 : i32, len = 16384 : i32, dimensions = #aie<bd_dim_layout_array[<size = 16, stride = 0>, <size = 16, stride = 32>, <size = 32, stride = 512>, <size = 32, stride = 1>]>}> : (memref<256x512xbf16>) -> ()
        aie.end
      }) {iteration_t = 0 : index} : () -> index
      "aiex.dma_start_task"(%54) : (index) -> ()
      %55 = "aiex.dma_configure_task_for"() <{alloc = @of_0_mem_2, issue_token = false, repeat_count = 15 : i32}> ({
        "aie.dma_bd"(%48) <{offset = 32768 : i32, len = 16384 : i32, dimensions = #aie<bd_dim_layout_array[<size = 16, stride = 0>, <size = 16, stride = 32>, <size = 32, stride = 512>, <size = 32, stride = 1>]>}> : (memref<256x512xbf16>) -> ()
        aie.end
      }) {iteration_t = 0 : index} : () -> index
      "aiex.dma_start_task"(%55) : (index) -> ()
      %56 = "aiex.dma_configure_task_for"() <{alloc = @of_0_mem_3, issue_token = false, repeat_count = 15 : i32}> ({
        "aie.dma_bd"(%48) <{offset = 49152 : i32, len = 16384 : i32, dimensions = #aie<bd_dim_layout_array[<size = 16, stride = 0>, <size = 16, stride = 32>, <size = 32, stride = 512>, <size = 32, stride = 1>]>}> : (memref<256x512xbf16>) -> ()
        aie.end
      }) {iteration_t = 0 : index} : () -> index
      "aiex.dma_start_task"(%56) : (index) -> ()
      %57 = "aiex.dma_configure_task_for"() <{alloc = @of_1_mem_0, issue_token = true, repeat_count = 1 : i32}> ({
        "aie.dma_bd"(%49) <{offset = 0 : i32, len = 524288 : i32, dimensions = #aie<bd_dim_layout_array[<size = 2, stride = 0>, <size = 16, stride = 128>, <size = 512, stride = 2048>, <size = 64, stride = 1>]>}> : (memref<512x2048xbf16>) -> ()
        aie.end
      }) {iteration_t = 0 : index} : () -> index
      "aiex.dma_start_task"(%57) : (index) -> ()
      %58 = "aiex.dma_configure_task_for"() <{alloc = @of_1_mem_1, issue_token = true, repeat_count = 1 : i32}> ({
        "aie.dma_bd"(%49) <{offset = 64 : i32, len = 524288 : i32, dimensions = #aie<bd_dim_layout_array[<size = 2, stride = 0>, <size = 16, stride = 128>, <size = 512, stride = 2048>, <size = 64, stride = 1>]>}> : (memref<512x2048xbf16>) -> ()
        aie.end
      }) {iteration_t = 0 : index} : () -> index
      "aiex.dma_start_task"(%58) : (index) -> ()
      %59 = "aiex.dma_configure_task_for"() <{alloc = @of_2_mem_0, issue_token = true, repeat_count = 1 : i32}> ({
        "aie.dma_bd"(%50) <{offset = 0 : i32, len = 524288 : i32, dimensions = #aie<bd_dim_layout_array[<size = 2, stride = 0>, <size = 16, stride = 128>, <size = 512, stride = 2048>, <size = 64, stride = 1>]>}> : (memref<512x2048xbf16>) -> ()
        aie.end
      }) {iteration_t = 0 : index} : () -> index
      "aiex.dma_start_task"(%59) : (index) -> ()
      %60 = "aiex.dma_configure_task_for"() <{alloc = @of_2_mem_1, issue_token = true, repeat_count = 1 : i32}> ({
        "aie.dma_bd"(%50) <{offset = 64 : i32, len = 524288 : i32, dimensions = #aie<bd_dim_layout_array[<size = 2, stride = 0>, <size = 16, stride = 128>, <size = 512, stride = 2048>, <size = 64, stride = 1>]>}> : (memref<512x2048xbf16>) -> ()
        aie.end
      }) {iteration_t = 0 : index} : () -> index
      "aiex.dma_start_task"(%60) : (index) -> ()
      %61 = "aiex.dma_configure_task_for"() <{alloc = @of_3_mem_0, issue_token = false, repeat_count = 15 : i32}> ({
        "aie.dma_bd"(%51) <{offset = 0 : i32, len = 32768 : i32, dimensions = #aie<bd_dim_layout_array[<size = 16, stride = 65536>, <size = 8, stride = 64>, <size = 128, stride = 512>, <size = 32, stride = 1>]>}> : (memref<2048x512xbf16>) -> ()
        aie.end
      }) {iteration_t = 0 : index} : () -> index
      "aiex.dma_start_task"(%61) : (index) -> ()
      %62 = "aiex.dma_configure_task_for"() <{alloc = @of_3_mem_1, issue_token = false, repeat_count = 15 : i32}> ({
        "aie.dma_bd"(%51) <{offset = 32 : i32, len = 32768 : i32, dimensions = #aie<bd_dim_layout_array[<size = 16, stride = 65536>, <size = 8, stride = 64>, <size = 128, stride = 512>, <size = 32, stride = 1>]>}> : (memref<2048x512xbf16>) -> ()
        aie.end
      }) {iteration_t = 0 : index} : () -> index
      "aiex.dma_start_task"(%62) : (index) -> ()
      %63 = "aiex.dma_configure_task_for"() <{alloc = @of_13_mem_0, issue_token = true, repeat_count = 7 : i32}> ({
        "aie.dma_bd"(%52) <{offset = 0 : i32, len = 8192 : i32, dimensions = #aie<bd_dim_layout_array[<size = 8, stride = 16384>, <size = 8, stride = 64>, <size = 32, stride = 512>, <size = 32, stride = 1>]>}> : (memref<256x512xbf16>) -> ()
        aie.end
      }) {iteration_t = 0 : index} : () -> index
      "aiex.dma_start_task"(%63) : (index) -> ()
      %64 = "aiex.dma_configure_task_for"() <{alloc = @of_13_mem_1, issue_token = true, repeat_count = 7 : i32}> ({
        "aie.dma_bd"(%52) <{offset = 32 : i32, len = 8192 : i32, dimensions = #aie<bd_dim_layout_array[<size = 8, stride = 16384>, <size = 8, stride = 64>, <size = 32, stride = 512>, <size = 32, stride = 1>]>}> : (memref<256x512xbf16>) -> ()
        aie.end
      }) {iteration_t = 0 : index} : () -> index
      "aiex.dma_start_task"(%64) : (index) -> ()
      %65 = "aiex.dma_configure_task_for"() <{alloc = @of_0_mem_0, issue_token = true, repeat_count = 15 : i32}> ({
        "aie.dma_bd"(%48) <{offset = 65536 : i32, len = 16384 : i32, dimensions = #aie<bd_dim_layout_array[<size = 16, stride = 0>, <size = 16, stride = 32>, <size = 32, stride = 512>, <size = 32, stride = 1>]>}> : (memref<256x512xbf16>) -> ()
        aie.end
      }) {iteration_t = 32768 : index} : () -> index
      "aiex.dma_start_task"(%65) : (index) -> ()
      %66 = "aiex.dma_configure_task_for"() <{alloc = @of_0_mem_1, issue_token = true, repeat_count = 15 : i32}> ({
        "aie.dma_bd"(%48) <{offset = 81920 : i32, len = 16384 : i32, dimensions = #aie<bd_dim_layout_array[<size = 16, stride = 0>, <size = 16, stride = 32>, <size = 32, stride = 512>, <size = 32, stride = 1>]>}> : (memref<256x512xbf16>) -> ()
        aie.end
      }) {iteration_t = 32768 : index} : () -> index
      "aiex.dma_start_task"(%66) : (index) -> ()
      %67 = "aiex.dma_configure_task_for"() <{alloc = @of_0_mem_2, issue_token = true, repeat_count = 15 : i32}> ({
        "aie.dma_bd"(%48) <{offset = 98304 : i32, len = 16384 : i32, dimensions = #aie<bd_dim_layout_array[<size = 16, stride = 0>, <size = 16, stride = 32>, <size = 32, stride = 512>, <size = 32, stride = 1>]>}> : (memref<256x512xbf16>) -> ()
        aie.end
      }) {iteration_t = 32768 : index} : () -> index
      "aiex.dma_start_task"(%67) : (index) -> ()
      %68 = "aiex.dma_configure_task_for"() <{alloc = @of_0_mem_3, issue_token = true, repeat_count = 15 : i32}> ({
        "aie.dma_bd"(%48) <{offset = 114688 : i32, len = 16384 : i32, dimensions = #aie<bd_dim_layout_array[<size = 16, stride = 0>, <size = 16, stride = 32>, <size = 32, stride = 512>, <size = 32, stride = 1>]>}> : (memref<256x512xbf16>) -> ()
        aie.end
      }) {iteration_t = 32768 : index} : () -> index
      "aiex.dma_start_task"(%68) : (index) -> ()
      %69 = "aiex.dma_configure_task_for"() <{alloc = @of_3_mem_0, issue_token = true, repeat_count = 15 : i32}> ({
        "aie.dma_bd"(%51) <{offset = 0 : i32, len = 32768 : i32, dimensions = #aie<bd_dim_layout_array[<size = 16, stride = 65536>, <size = 8, stride = 64>, <size = 128, stride = 512>, <size = 32, stride = 1>]>}> : (memref<2048x512xbf16>) -> ()
        aie.end
      }) {iteration_t = 32768 : index} : () -> index
      "aiex.dma_start_task"(%69) : (index) -> ()
      %70 = "aiex.dma_configure_task_for"() <{alloc = @of_3_mem_1, issue_token = true, repeat_count = 15 : i32}> ({
        "aie.dma_bd"(%51) <{offset = 32 : i32, len = 32768 : i32, dimensions = #aie<bd_dim_layout_array[<size = 16, stride = 65536>, <size = 8, stride = 64>, <size = 128, stride = 512>, <size = 32, stride = 1>]>}> : (memref<2048x512xbf16>) -> ()
        aie.end
      }) {iteration_t = 32768 : index} : () -> index
      "aiex.dma_start_task"(%70) : (index) -> ()
      "aiex.dma_await_task"(%65) : (index) -> ()
      "aiex.dma_await_task"(%66) : (index) -> ()
      "aiex.dma_await_task"(%67) : (index) -> ()
      "aiex.dma_await_task"(%68) : (index) -> ()
      "aiex.dma_await_task"(%57) : (index) -> ()
      "aiex.dma_await_task"(%58) : (index) -> ()
      "aiex.dma_await_task"(%59) : (index) -> ()
      "aiex.dma_await_task"(%60) : (index) -> ()
      "aiex.dma_await_task"(%69) : (index) -> ()
      "aiex.dma_await_task"(%70) : (index) -> ()
      "aiex.dma_await_task"(%63) : (index) -> ()
      "aiex.dma_await_task"(%64) : (index) -> ()
    }
    %71 = aie.core(%16) {
      %72 = arith.constant 0 : index
      %73 = arith.constant 1 : index
      %74 = arith.constant 4294967295 : index
      scf.for %75 = %72 to %74 step %73 {
        %76 = arith.constant 0 : index
        %77 = arith.constant 1 : index
        %78 = arith.constant 2 : index
        scf.for %79 = %76 to %78 step %77 {
          %80 = arith.constant 16 : index
          scf.for %81 = %76 to %80 step %77 {
            %82 = aie.objectfifo.acquire @of_8_switch_join_0_0(Produce, 1) : !aie.objectfifosubview<memref<32x64xbf16>>
            %83 = aie.objectfifo.subview.access %82[0] : !aie.objectfifosubview<memref<32x64xbf16>> -> memref<32x64xbf16>
            func.call @zero_bf16_32_32_64(%83) : (memref<32x64xbf16>) -> ()
            %84 = arith.constant 16 : index
            scf.for %85 = %76 to %84 step %77 {
              %86 = aie.objectfifo.acquire @of_5_broadcast_0_0(Consume, 1) : !aie.objectfifosubview<memref<32x64xbf16>>
              %87 = aie.objectfifo.subview.access %86[0] : !aie.objectfifosubview<memref<32x64xbf16>> -> memref<32x64xbf16>
              %88 = aie.objectfifo.acquire @of_4_broadcast_0_0(Consume, 1) : !aie.objectfifosubview<memref<32x32xbf16>>
              %89 = aie.objectfifo.subview.access %88[0] : !aie.objectfifosubview<memref<32x32xbf16>> -> memref<32x32xbf16>
              %90 = arith.constant 1 : index
              %91 = arith.constant 0 : index
              %92 = scf.index_switch %91 -> memref<32x32xbf16>
              case 0 {
                scf.yield %89 : memref<32x32xbf16>
              }
              default {
                scf.yield %89 : memref<32x32xbf16>
              }
              %93 = arith.constant 1 : index
              %94 = arith.constant 0 : index
              %95 = scf.index_switch %94 -> memref<32x64xbf16>
              case 0 {
                scf.yield %87 : memref<32x64xbf16>
              }
              default {
                scf.yield %87 : memref<32x64xbf16>
              }
              %96 = arith.constant 1 : index
              %97 = arith.constant 0 : index
              %98 = scf.index_switch %97 -> memref<32x64xbf16>
              case 0 {
                scf.yield %83 : memref<32x64xbf16>
              }
              default {
                scf.yield %83 : memref<32x64xbf16>
              }
              func.call @matmul_bf16_bf16_32_32_64(%92, %95, %98) : (memref<32x32xbf16>, memref<32x64xbf16>, memref<32x64xbf16>) -> ()
              aie.objectfifo.release @of_4_broadcast_0_0(Consume, 1)
              aie.objectfifo.release @of_5_broadcast_0_0(Consume, 1)
            }
            aie.objectfifo.release @of_8_switch_join_0_0(Produce, 1)
          }
        }
      }
      aie.end
    } { link_with="mm_32_32_64.o" }
    %99 = aie.core(%17) {
      %100 = arith.constant 0 : index
      %101 = arith.constant 1 : index
      %102 = arith.constant 4294967295 : index
      scf.for %103 = %100 to %102 step %101 {
        %104 = arith.constant 0 : index
        %105 = arith.constant 1 : index
        %106 = arith.constant 2 : index
        scf.for %107 = %104 to %106 step %105 {
          %108 = arith.constant 16 : index
          scf.for %109 = %104 to %108 step %105 {
            %110 = aie.objectfifo.acquire @of_8_switch_join_1_0(Produce, 1) : !aie.objectfifosubview<memref<32x64xbf16>>
            %111 = aie.objectfifo.subview.access %110[0] : !aie.objectfifosubview<memref<32x64xbf16>> -> memref<32x64xbf16>
            func.call @zero_bf16_32_32_64(%111) : (memref<32x64xbf16>) -> ()
            %112 = arith.constant 16 : index
            scf.for %113 = %104 to %112 step %105 {
              %114 = aie.objectfifo.acquire @of_5_broadcast_0_0(Consume, 1) : !aie.objectfifosubview<memref<32x64xbf16>>
              %115 = aie.objectfifo.subview.access %114[0] : !aie.objectfifosubview<memref<32x64xbf16>> -> memref<32x64xbf16>
              %116 = aie.objectfifo.acquire @of_4_broadcast_1_0(Consume, 1) : !aie.objectfifosubview<memref<32x32xbf16>>
              %117 = aie.objectfifo.subview.access %116[0] : !aie.objectfifosubview<memref<32x32xbf16>> -> memref<32x32xbf16>
              %118 = arith.constant 1 : index
              %119 = arith.constant 0 : index
              %120 = scf.index_switch %119 -> memref<32x32xbf16>
              case 0 {
                scf.yield %117 : memref<32x32xbf16>
              }
              default {
                scf.yield %117 : memref<32x32xbf16>
              }
              %121 = arith.constant 1 : index
              %122 = arith.constant 0 : index
              %123 = scf.index_switch %122 -> memref<32x64xbf16>
              case 0 {
                scf.yield %115 : memref<32x64xbf16>
              }
              default {
                scf.yield %115 : memref<32x64xbf16>
              }
              %124 = arith.constant 1 : index
              %125 = arith.constant 0 : index
              %126 = scf.index_switch %125 -> memref<32x64xbf16>
              case 0 {
                scf.yield %111 : memref<32x64xbf16>
              }
              default {
                scf.yield %111 : memref<32x64xbf16>
              }
              func.call @matmul_bf16_bf16_32_32_64(%120, %123, %126) : (memref<32x32xbf16>, memref<32x64xbf16>, memref<32x64xbf16>) -> ()
              aie.objectfifo.release @of_4_broadcast_1_0(Consume, 1)
              aie.objectfifo.release @of_5_broadcast_0_0(Consume, 1)
            }
            aie.objectfifo.release @of_8_switch_join_1_0(Produce, 1)
          }
        }
      }
      aie.end
    } { link_with="mm_32_32_64.o" }
    %127 = aie.core(%18) {
      %128 = arith.constant 0 : index
      %129 = arith.constant 1 : index
      %130 = arith.constant 4294967295 : index
      scf.for %131 = %128 to %130 step %129 {
        %132 = arith.constant 0 : index
        %133 = arith.constant 1 : index
        %134 = arith.constant 2 : index
        scf.for %135 = %132 to %134 step %133 {
          %136 = arith.constant 16 : index
          scf.for %137 = %132 to %136 step %133 {
            %138 = aie.objectfifo.acquire @of_8_switch_join_2_0(Produce, 1) : !aie.objectfifosubview<memref<32x64xbf16>>
            %139 = aie.objectfifo.subview.access %138[0] : !aie.objectfifosubview<memref<32x64xbf16>> -> memref<32x64xbf16>
            func.call @zero_bf16_32_32_64(%139) : (memref<32x64xbf16>) -> ()
            %140 = arith.constant 16 : index
            scf.for %141 = %132 to %140 step %133 {
              %142 = aie.objectfifo.acquire @of_5_broadcast_0_0(Consume, 1) : !aie.objectfifosubview<memref<32x64xbf16>>
              %143 = aie.objectfifo.subview.access %142[0] : !aie.objectfifosubview<memref<32x64xbf16>> -> memref<32x64xbf16>
              %144 = aie.objectfifo.acquire @of_4_broadcast_2_0(Consume, 1) : !aie.objectfifosubview<memref<32x32xbf16>>
              %145 = aie.objectfifo.subview.access %144[0] : !aie.objectfifosubview<memref<32x32xbf16>> -> memref<32x32xbf16>
              %146 = arith.constant 1 : index
              %147 = arith.constant 0 : index
              %148 = scf.index_switch %147 -> memref<32x32xbf16>
              case 0 {
                scf.yield %145 : memref<32x32xbf16>
              }
              default {
                scf.yield %145 : memref<32x32xbf16>
              }
              %149 = arith.constant 1 : index
              %150 = arith.constant 0 : index
              %151 = scf.index_switch %150 -> memref<32x64xbf16>
              case 0 {
                scf.yield %143 : memref<32x64xbf16>
              }
              default {
                scf.yield %143 : memref<32x64xbf16>
              }
              %152 = arith.constant 1 : index
              %153 = arith.constant 0 : index
              %154 = scf.index_switch %153 -> memref<32x64xbf16>
              case 0 {
                scf.yield %139 : memref<32x64xbf16>
              }
              default {
                scf.yield %139 : memref<32x64xbf16>
              }
              func.call @matmul_bf16_bf16_32_32_64(%148, %151, %154) : (memref<32x32xbf16>, memref<32x64xbf16>, memref<32x64xbf16>) -> ()
              aie.objectfifo.release @of_4_broadcast_2_0(Consume, 1)
              aie.objectfifo.release @of_5_broadcast_0_0(Consume, 1)
            }
            aie.objectfifo.release @of_8_switch_join_2_0(Produce, 1)
          }
        }
      }
      aie.end
    } { link_with="mm_32_32_64.o" }
    %155 = aie.core(%19) {
      %156 = arith.constant 0 : index
      %157 = arith.constant 1 : index
      %158 = arith.constant 4294967295 : index
      scf.for %159 = %156 to %158 step %157 {
        %160 = arith.constant 0 : index
        %161 = arith.constant 1 : index
        %162 = arith.constant 2 : index
        scf.for %163 = %160 to %162 step %161 {
          %164 = arith.constant 16 : index
          scf.for %165 = %160 to %164 step %161 {
            %166 = aie.objectfifo.acquire @of_8_switch_join_3_0(Produce, 1) : !aie.objectfifosubview<memref<32x64xbf16>>
            %167 = aie.objectfifo.subview.access %166[0] : !aie.objectfifosubview<memref<32x64xbf16>> -> memref<32x64xbf16>
            func.call @zero_bf16_32_32_64(%167) : (memref<32x64xbf16>) -> ()
            %168 = arith.constant 16 : index
            scf.for %169 = %160 to %168 step %161 {
              %170 = aie.objectfifo.acquire @of_5_broadcast_0_0(Consume, 1) : !aie.objectfifosubview<memref<32x64xbf16>>
              %171 = aie.objectfifo.subview.access %170[0] : !aie.objectfifosubview<memref<32x64xbf16>> -> memref<32x64xbf16>
              %172 = aie.objectfifo.acquire @of_4_broadcast_3_0(Consume, 1) : !aie.objectfifosubview<memref<32x32xbf16>>
              %173 = aie.objectfifo.subview.access %172[0] : !aie.objectfifosubview<memref<32x32xbf16>> -> memref<32x32xbf16>
              %174 = arith.constant 1 : index
              %175 = arith.constant 0 : index
              %176 = scf.index_switch %175 -> memref<32x32xbf16>
              case 0 {
                scf.yield %173 : memref<32x32xbf16>
              }
              default {
                scf.yield %173 : memref<32x32xbf16>
              }
              %177 = arith.constant 1 : index
              %178 = arith.constant 0 : index
              %179 = scf.index_switch %178 -> memref<32x64xbf16>
              case 0 {
                scf.yield %171 : memref<32x64xbf16>
              }
              default {
                scf.yield %171 : memref<32x64xbf16>
              }
              %180 = arith.constant 1 : index
              %181 = arith.constant 0 : index
              %182 = scf.index_switch %181 -> memref<32x64xbf16>
              case 0 {
                scf.yield %167 : memref<32x64xbf16>
              }
              default {
                scf.yield %167 : memref<32x64xbf16>
              }
              func.call @matmul_bf16_bf16_32_32_64(%176, %179, %182) : (memref<32x32xbf16>, memref<32x64xbf16>, memref<32x64xbf16>) -> ()
              aie.objectfifo.release @of_4_broadcast_3_0(Consume, 1)
              aie.objectfifo.release @of_5_broadcast_0_0(Consume, 1)
            }
            aie.objectfifo.release @of_8_switch_join_3_0(Produce, 1)
          }
        }
      }
      aie.end
    } { link_with="mm_32_32_64.o" }
    %183 = aie.core(%20) {
      %184 = arith.constant 0 : index
      %185 = arith.constant 1 : index
      %186 = arith.constant 4294967295 : index
      scf.for %187 = %184 to %186 step %185 {
        %188 = arith.constant 0 : index
        %189 = arith.constant 1 : index
        %190 = arith.constant 2 : index
        scf.for %191 = %188 to %190 step %189 {
          %192 = arith.constant 16 : index
          scf.for %193 = %188 to %192 step %189 {
            %194 = aie.objectfifo.acquire @of_8_switch_join_0_1(Produce, 1) : !aie.objectfifosubview<memref<32x64xbf16>>
            %195 = aie.objectfifo.subview.access %194[0] : !aie.objectfifosubview<memref<32x64xbf16>> -> memref<32x64xbf16>
            func.call @zero_bf16_32_32_64(%195) : (memref<32x64xbf16>) -> ()
            %196 = arith.constant 16 : index
            scf.for %197 = %188 to %196 step %189 {
              %198 = aie.objectfifo.acquire @of_5_broadcast_1_0(Consume, 1) : !aie.objectfifosubview<memref<32x64xbf16>>
              %199 = aie.objectfifo.subview.access %198[0] : !aie.objectfifosubview<memref<32x64xbf16>> -> memref<32x64xbf16>
              %200 = aie.objectfifo.acquire @of_4_broadcast_0_0(Consume, 1) : !aie.objectfifosubview<memref<32x32xbf16>>
              %201 = aie.objectfifo.subview.access %200[0] : !aie.objectfifosubview<memref<32x32xbf16>> -> memref<32x32xbf16>
              %202 = arith.constant 1 : index
              %203 = arith.constant 0 : index
              %204 = scf.index_switch %203 -> memref<32x32xbf16>
              case 0 {
                scf.yield %201 : memref<32x32xbf16>
              }
              default {
                scf.yield %201 : memref<32x32xbf16>
              }
              %205 = arith.constant 1 : index
              %206 = arith.constant 0 : index
              %207 = scf.index_switch %206 -> memref<32x64xbf16>
              case 0 {
                scf.yield %199 : memref<32x64xbf16>
              }
              default {
                scf.yield %199 : memref<32x64xbf16>
              }
              %208 = arith.constant 1 : index
              %209 = arith.constant 0 : index
              %210 = scf.index_switch %209 -> memref<32x64xbf16>
              case 0 {
                scf.yield %195 : memref<32x64xbf16>
              }
              default {
                scf.yield %195 : memref<32x64xbf16>
              }
              func.call @matmul_bf16_bf16_32_32_64(%204, %207, %210) : (memref<32x32xbf16>, memref<32x64xbf16>, memref<32x64xbf16>) -> ()
              aie.objectfifo.release @of_4_broadcast_0_0(Consume, 1)
              aie.objectfifo.release @of_5_broadcast_1_0(Consume, 1)
            }
            aie.objectfifo.release @of_8_switch_join_0_1(Produce, 1)
          }
        }
      }
      aie.end
    } { link_with="mm_32_32_64.o" }
    %211 = aie.core(%21) {
      %212 = arith.constant 0 : index
      %213 = arith.constant 1 : index
      %214 = arith.constant 4294967295 : index
      scf.for %215 = %212 to %214 step %213 {
        %216 = arith.constant 0 : index
        %217 = arith.constant 1 : index
        %218 = arith.constant 2 : index
        scf.for %219 = %216 to %218 step %217 {
          %220 = arith.constant 16 : index
          scf.for %221 = %216 to %220 step %217 {
            %222 = aie.objectfifo.acquire @of_8_switch_join_1_1(Produce, 1) : !aie.objectfifosubview<memref<32x64xbf16>>
            %223 = aie.objectfifo.subview.access %222[0] : !aie.objectfifosubview<memref<32x64xbf16>> -> memref<32x64xbf16>
            func.call @zero_bf16_32_32_64(%223) : (memref<32x64xbf16>) -> ()
            %224 = arith.constant 16 : index
            scf.for %225 = %216 to %224 step %217 {
              %226 = aie.objectfifo.acquire @of_5_broadcast_1_0(Consume, 1) : !aie.objectfifosubview<memref<32x64xbf16>>
              %227 = aie.objectfifo.subview.access %226[0] : !aie.objectfifosubview<memref<32x64xbf16>> -> memref<32x64xbf16>
              %228 = aie.objectfifo.acquire @of_4_broadcast_1_0(Consume, 1) : !aie.objectfifosubview<memref<32x32xbf16>>
              %229 = aie.objectfifo.subview.access %228[0] : !aie.objectfifosubview<memref<32x32xbf16>> -> memref<32x32xbf16>
              %230 = arith.constant 1 : index
              %231 = arith.constant 0 : index
              %232 = scf.index_switch %231 -> memref<32x32xbf16>
              case 0 {
                scf.yield %229 : memref<32x32xbf16>
              }
              default {
                scf.yield %229 : memref<32x32xbf16>
              }
              %233 = arith.constant 1 : index
              %234 = arith.constant 0 : index
              %235 = scf.index_switch %234 -> memref<32x64xbf16>
              case 0 {
                scf.yield %227 : memref<32x64xbf16>
              }
              default {
                scf.yield %227 : memref<32x64xbf16>
              }
              %236 = arith.constant 1 : index
              %237 = arith.constant 0 : index
              %238 = scf.index_switch %237 -> memref<32x64xbf16>
              case 0 {
                scf.yield %223 : memref<32x64xbf16>
              }
              default {
                scf.yield %223 : memref<32x64xbf16>
              }
              func.call @matmul_bf16_bf16_32_32_64(%232, %235, %238) : (memref<32x32xbf16>, memref<32x64xbf16>, memref<32x64xbf16>) -> ()
              aie.objectfifo.release @of_4_broadcast_1_0(Consume, 1)
              aie.objectfifo.release @of_5_broadcast_1_0(Consume, 1)
            }
            aie.objectfifo.release @of_8_switch_join_1_1(Produce, 1)
          }
        }
      }
      aie.end
    } { link_with="mm_32_32_64.o" }
    %239 = aie.core(%22) {
      %240 = arith.constant 0 : index
      %241 = arith.constant 1 : index
      %242 = arith.constant 4294967295 : index
      scf.for %243 = %240 to %242 step %241 {
        %244 = arith.constant 0 : index
        %245 = arith.constant 1 : index
        %246 = arith.constant 2 : index
        scf.for %247 = %244 to %246 step %245 {
          %248 = arith.constant 16 : index
          scf.for %249 = %244 to %248 step %245 {
            %250 = aie.objectfifo.acquire @of_8_switch_join_2_1(Produce, 1) : !aie.objectfifosubview<memref<32x64xbf16>>
            %251 = aie.objectfifo.subview.access %250[0] : !aie.objectfifosubview<memref<32x64xbf16>> -> memref<32x64xbf16>
            func.call @zero_bf16_32_32_64(%251) : (memref<32x64xbf16>) -> ()
            %252 = arith.constant 16 : index
            scf.for %253 = %244 to %252 step %245 {
              %254 = aie.objectfifo.acquire @of_5_broadcast_1_0(Consume, 1) : !aie.objectfifosubview<memref<32x64xbf16>>
              %255 = aie.objectfifo.subview.access %254[0] : !aie.objectfifosubview<memref<32x64xbf16>> -> memref<32x64xbf16>
              %256 = aie.objectfifo.acquire @of_4_broadcast_2_0(Consume, 1) : !aie.objectfifosubview<memref<32x32xbf16>>
              %257 = aie.objectfifo.subview.access %256[0] : !aie.objectfifosubview<memref<32x32xbf16>> -> memref<32x32xbf16>
              %258 = arith.constant 1 : index
              %259 = arith.constant 0 : index
              %260 = scf.index_switch %259 -> memref<32x32xbf16>
              case 0 {
                scf.yield %257 : memref<32x32xbf16>
              }
              default {
                scf.yield %257 : memref<32x32xbf16>
              }
              %261 = arith.constant 1 : index
              %262 = arith.constant 0 : index
              %263 = scf.index_switch %262 -> memref<32x64xbf16>
              case 0 {
                scf.yield %255 : memref<32x64xbf16>
              }
              default {
                scf.yield %255 : memref<32x64xbf16>
              }
              %264 = arith.constant 1 : index
              %265 = arith.constant 0 : index
              %266 = scf.index_switch %265 -> memref<32x64xbf16>
              case 0 {
                scf.yield %251 : memref<32x64xbf16>
              }
              default {
                scf.yield %251 : memref<32x64xbf16>
              }
              func.call @matmul_bf16_bf16_32_32_64(%260, %263, %266) : (memref<32x32xbf16>, memref<32x64xbf16>, memref<32x64xbf16>) -> ()
              aie.objectfifo.release @of_4_broadcast_2_0(Consume, 1)
              aie.objectfifo.release @of_5_broadcast_1_0(Consume, 1)
            }
            aie.objectfifo.release @of_8_switch_join_2_1(Produce, 1)
          }
        }
      }
      aie.end
    } { link_with="mm_32_32_64.o" }
    %267 = aie.core(%23) {
      %268 = arith.constant 0 : index
      %269 = arith.constant 1 : index
      %270 = arith.constant 4294967295 : index
      scf.for %271 = %268 to %270 step %269 {
        %272 = arith.constant 0 : index
        %273 = arith.constant 1 : index
        %274 = arith.constant 2 : index
        scf.for %275 = %272 to %274 step %273 {
          %276 = arith.constant 16 : index
          scf.for %277 = %272 to %276 step %273 {
            %278 = aie.objectfifo.acquire @of_8_switch_join_3_1(Produce, 1) : !aie.objectfifosubview<memref<32x64xbf16>>
            %279 = aie.objectfifo.subview.access %278[0] : !aie.objectfifosubview<memref<32x64xbf16>> -> memref<32x64xbf16>
            func.call @zero_bf16_32_32_64(%279) : (memref<32x64xbf16>) -> ()
            %280 = arith.constant 16 : index
            scf.for %281 = %272 to %280 step %273 {
              %282 = aie.objectfifo.acquire @of_5_broadcast_1_0(Consume, 1) : !aie.objectfifosubview<memref<32x64xbf16>>
              %283 = aie.objectfifo.subview.access %282[0] : !aie.objectfifosubview<memref<32x64xbf16>> -> memref<32x64xbf16>
              %284 = aie.objectfifo.acquire @of_4_broadcast_3_0(Consume, 1) : !aie.objectfifosubview<memref<32x32xbf16>>
              %285 = aie.objectfifo.subview.access %284[0] : !aie.objectfifosubview<memref<32x32xbf16>> -> memref<32x32xbf16>
              %286 = arith.constant 1 : index
              %287 = arith.constant 0 : index
              %288 = scf.index_switch %287 -> memref<32x32xbf16>
              case 0 {
                scf.yield %285 : memref<32x32xbf16>
              }
              default {
                scf.yield %285 : memref<32x32xbf16>
              }
              %289 = arith.constant 1 : index
              %290 = arith.constant 0 : index
              %291 = scf.index_switch %290 -> memref<32x64xbf16>
              case 0 {
                scf.yield %283 : memref<32x64xbf16>
              }
              default {
                scf.yield %283 : memref<32x64xbf16>
              }
              %292 = arith.constant 1 : index
              %293 = arith.constant 0 : index
              %294 = scf.index_switch %293 -> memref<32x64xbf16>
              case 0 {
                scf.yield %279 : memref<32x64xbf16>
              }
              default {
                scf.yield %279 : memref<32x64xbf16>
              }
              func.call @matmul_bf16_bf16_32_32_64(%288, %291, %294) : (memref<32x32xbf16>, memref<32x64xbf16>, memref<32x64xbf16>) -> ()
              aie.objectfifo.release @of_4_broadcast_3_0(Consume, 1)
              aie.objectfifo.release @of_5_broadcast_1_0(Consume, 1)
            }
            aie.objectfifo.release @of_8_switch_join_3_1(Produce, 1)
          }
        }
      }
      aie.end
    } { link_with="mm_32_32_64.o" }
    %295 = aie.core(%24) {
      %296 = arith.constant 0 : index
      %297 = arith.constant 1 : index
      %298 = arith.constant 4294967295 : index
      scf.for %299 = %296 to %298 step %297 {
        %300 = arith.constant 0 : index
        %301 = arith.constant 1 : index
        %302 = arith.constant 2 : index
        scf.for %303 = %300 to %302 step %301 {
          %304 = arith.constant 16 : index
          scf.for %305 = %300 to %304 step %301 {
            %306 = aie.objectfifo.acquire @of_9_switch_join_0_0(Produce, 1) : !aie.objectfifosubview<memref<32x64xbf16>>
            %307 = aie.objectfifo.subview.access %306[0] : !aie.objectfifosubview<memref<32x64xbf16>> -> memref<32x64xbf16>
            func.call @zero_bf16_32_32_64(%307) : (memref<32x64xbf16>) -> ()
            %308 = arith.constant 16 : index
            scf.for %309 = %300 to %308 step %301 {
              %310 = aie.objectfifo.acquire @of_6_broadcast_0_0(Consume, 1) : !aie.objectfifosubview<memref<32x64xbf16>>
              %311 = aie.objectfifo.subview.access %310[0] : !aie.objectfifosubview<memref<32x64xbf16>> -> memref<32x64xbf16>
              %312 = aie.objectfifo.acquire @of_4_broadcast_0_0(Consume, 1) : !aie.objectfifosubview<memref<32x32xbf16>>
              %313 = aie.objectfifo.subview.access %312[0] : !aie.objectfifosubview<memref<32x32xbf16>> -> memref<32x32xbf16>
              %314 = arith.constant 1 : index
              %315 = arith.constant 0 : index
              %316 = scf.index_switch %315 -> memref<32x32xbf16>
              case 0 {
                scf.yield %313 : memref<32x32xbf16>
              }
              default {
                scf.yield %313 : memref<32x32xbf16>
              }
              %317 = arith.constant 1 : index
              %318 = arith.constant 0 : index
              %319 = scf.index_switch %318 -> memref<32x64xbf16>
              case 0 {
                scf.yield %311 : memref<32x64xbf16>
              }
              default {
                scf.yield %311 : memref<32x64xbf16>
              }
              %320 = arith.constant 1 : index
              %321 = arith.constant 0 : index
              %322 = scf.index_switch %321 -> memref<32x64xbf16>
              case 0 {
                scf.yield %307 : memref<32x64xbf16>
              }
              default {
                scf.yield %307 : memref<32x64xbf16>
              }
              func.call @matmul_bf16_bf16_32_32_64(%316, %319, %322) : (memref<32x32xbf16>, memref<32x64xbf16>, memref<32x64xbf16>) -> ()
              aie.objectfifo.release @of_4_broadcast_0_0(Consume, 1)
              aie.objectfifo.release @of_6_broadcast_0_0(Consume, 1)
            }
            aie.objectfifo.release @of_9_switch_join_0_0(Produce, 1)
          }
        }
      }
      aie.end
    } { link_with="mm_32_32_64.o" }
    %323 = aie.core(%25) {
      %324 = arith.constant 0 : index
      %325 = arith.constant 1 : index
      %326 = arith.constant 4294967295 : index
      scf.for %327 = %324 to %326 step %325 {
        %328 = arith.constant 0 : index
        %329 = arith.constant 1 : index
        %330 = arith.constant 2 : index
        scf.for %331 = %328 to %330 step %329 {
          %332 = arith.constant 16 : index
          scf.for %333 = %328 to %332 step %329 {
            %334 = aie.objectfifo.acquire @of_9_switch_join_1_0(Produce, 1) : !aie.objectfifosubview<memref<32x64xbf16>>
            %335 = aie.objectfifo.subview.access %334[0] : !aie.objectfifosubview<memref<32x64xbf16>> -> memref<32x64xbf16>
            func.call @zero_bf16_32_32_64(%335) : (memref<32x64xbf16>) -> ()
            %336 = arith.constant 16 : index
            scf.for %337 = %328 to %336 step %329 {
              %338 = aie.objectfifo.acquire @of_6_broadcast_0_0(Consume, 1) : !aie.objectfifosubview<memref<32x64xbf16>>
              %339 = aie.objectfifo.subview.access %338[0] : !aie.objectfifosubview<memref<32x64xbf16>> -> memref<32x64xbf16>
              %340 = aie.objectfifo.acquire @of_4_broadcast_1_0(Consume, 1) : !aie.objectfifosubview<memref<32x32xbf16>>
              %341 = aie.objectfifo.subview.access %340[0] : !aie.objectfifosubview<memref<32x32xbf16>> -> memref<32x32xbf16>
              %342 = arith.constant 1 : index
              %343 = arith.constant 0 : index
              %344 = scf.index_switch %343 -> memref<32x32xbf16>
              case 0 {
                scf.yield %341 : memref<32x32xbf16>
              }
              default {
                scf.yield %341 : memref<32x32xbf16>
              }
              %345 = arith.constant 1 : index
              %346 = arith.constant 0 : index
              %347 = scf.index_switch %346 -> memref<32x64xbf16>
              case 0 {
                scf.yield %339 : memref<32x64xbf16>
              }
              default {
                scf.yield %339 : memref<32x64xbf16>
              }
              %348 = arith.constant 1 : index
              %349 = arith.constant 0 : index
              %350 = scf.index_switch %349 -> memref<32x64xbf16>
              case 0 {
                scf.yield %335 : memref<32x64xbf16>
              }
              default {
                scf.yield %335 : memref<32x64xbf16>
              }
              func.call @matmul_bf16_bf16_32_32_64(%344, %347, %350) : (memref<32x32xbf16>, memref<32x64xbf16>, memref<32x64xbf16>) -> ()
              aie.objectfifo.release @of_4_broadcast_1_0(Consume, 1)
              aie.objectfifo.release @of_6_broadcast_0_0(Consume, 1)
            }
            aie.objectfifo.release @of_9_switch_join_1_0(Produce, 1)
          }
        }
      }
      aie.end
    } { link_with="mm_32_32_64.o" }
    %351 = aie.core(%26) {
      %352 = arith.constant 0 : index
      %353 = arith.constant 1 : index
      %354 = arith.constant 4294967295 : index
      scf.for %355 = %352 to %354 step %353 {
        %356 = arith.constant 0 : index
        %357 = arith.constant 1 : index
        %358 = arith.constant 2 : index
        scf.for %359 = %356 to %358 step %357 {
          %360 = arith.constant 16 : index
          scf.for %361 = %356 to %360 step %357 {
            %362 = aie.objectfifo.acquire @of_9_switch_join_2_0(Produce, 1) : !aie.objectfifosubview<memref<32x64xbf16>>
            %363 = aie.objectfifo.subview.access %362[0] : !aie.objectfifosubview<memref<32x64xbf16>> -> memref<32x64xbf16>
            func.call @zero_bf16_32_32_64(%363) : (memref<32x64xbf16>) -> ()
            %364 = arith.constant 16 : index
            scf.for %365 = %356 to %364 step %357 {
              %366 = aie.objectfifo.acquire @of_6_broadcast_0_0(Consume, 1) : !aie.objectfifosubview<memref<32x64xbf16>>
              %367 = aie.objectfifo.subview.access %366[0] : !aie.objectfifosubview<memref<32x64xbf16>> -> memref<32x64xbf16>
              %368 = aie.objectfifo.acquire @of_4_broadcast_2_0(Consume, 1) : !aie.objectfifosubview<memref<32x32xbf16>>
              %369 = aie.objectfifo.subview.access %368[0] : !aie.objectfifosubview<memref<32x32xbf16>> -> memref<32x32xbf16>
              %370 = arith.constant 1 : index
              %371 = arith.constant 0 : index
              %372 = scf.index_switch %371 -> memref<32x32xbf16>
              case 0 {
                scf.yield %369 : memref<32x32xbf16>
              }
              default {
                scf.yield %369 : memref<32x32xbf16>
              }
              %373 = arith.constant 1 : index
              %374 = arith.constant 0 : index
              %375 = scf.index_switch %374 -> memref<32x64xbf16>
              case 0 {
                scf.yield %367 : memref<32x64xbf16>
              }
              default {
                scf.yield %367 : memref<32x64xbf16>
              }
              %376 = arith.constant 1 : index
              %377 = arith.constant 0 : index
              %378 = scf.index_switch %377 -> memref<32x64xbf16>
              case 0 {
                scf.yield %363 : memref<32x64xbf16>
              }
              default {
                scf.yield %363 : memref<32x64xbf16>
              }
              func.call @matmul_bf16_bf16_32_32_64(%372, %375, %378) : (memref<32x32xbf16>, memref<32x64xbf16>, memref<32x64xbf16>) -> ()
              aie.objectfifo.release @of_4_broadcast_2_0(Consume, 1)
              aie.objectfifo.release @of_6_broadcast_0_0(Consume, 1)
            }
            aie.objectfifo.release @of_9_switch_join_2_0(Produce, 1)
          }
        }
      }
      aie.end
    } { link_with="mm_32_32_64.o" }
    %379 = aie.core(%27) {
      %380 = arith.constant 0 : index
      %381 = arith.constant 1 : index
      %382 = arith.constant 4294967295 : index
      scf.for %383 = %380 to %382 step %381 {
        %384 = arith.constant 0 : index
        %385 = arith.constant 1 : index
        %386 = arith.constant 2 : index
        scf.for %387 = %384 to %386 step %385 {
          %388 = arith.constant 16 : index
          scf.for %389 = %384 to %388 step %385 {
            %390 = aie.objectfifo.acquire @of_9_switch_join_3_0(Produce, 1) : !aie.objectfifosubview<memref<32x64xbf16>>
            %391 = aie.objectfifo.subview.access %390[0] : !aie.objectfifosubview<memref<32x64xbf16>> -> memref<32x64xbf16>
            func.call @zero_bf16_32_32_64(%391) : (memref<32x64xbf16>) -> ()
            %392 = arith.constant 16 : index
            scf.for %393 = %384 to %392 step %385 {
              %394 = aie.objectfifo.acquire @of_6_broadcast_0_0(Consume, 1) : !aie.objectfifosubview<memref<32x64xbf16>>
              %395 = aie.objectfifo.subview.access %394[0] : !aie.objectfifosubview<memref<32x64xbf16>> -> memref<32x64xbf16>
              %396 = aie.objectfifo.acquire @of_4_broadcast_3_0(Consume, 1) : !aie.objectfifosubview<memref<32x32xbf16>>
              %397 = aie.objectfifo.subview.access %396[0] : !aie.objectfifosubview<memref<32x32xbf16>> -> memref<32x32xbf16>
              %398 = arith.constant 1 : index
              %399 = arith.constant 0 : index
              %400 = scf.index_switch %399 -> memref<32x32xbf16>
              case 0 {
                scf.yield %397 : memref<32x32xbf16>
              }
              default {
                scf.yield %397 : memref<32x32xbf16>
              }
              %401 = arith.constant 1 : index
              %402 = arith.constant 0 : index
              %403 = scf.index_switch %402 -> memref<32x64xbf16>
              case 0 {
                scf.yield %395 : memref<32x64xbf16>
              }
              default {
                scf.yield %395 : memref<32x64xbf16>
              }
              %404 = arith.constant 1 : index
              %405 = arith.constant 0 : index
              %406 = scf.index_switch %405 -> memref<32x64xbf16>
              case 0 {
                scf.yield %391 : memref<32x64xbf16>
              }
              default {
                scf.yield %391 : memref<32x64xbf16>
              }
              func.call @matmul_bf16_bf16_32_32_64(%400, %403, %406) : (memref<32x32xbf16>, memref<32x64xbf16>, memref<32x64xbf16>) -> ()
              aie.objectfifo.release @of_4_broadcast_3_0(Consume, 1)
              aie.objectfifo.release @of_6_broadcast_0_0(Consume, 1)
            }
            aie.objectfifo.release @of_9_switch_join_3_0(Produce, 1)
          }
        }
      }
      aie.end
    } { link_with="mm_32_32_64.o" }
    %407 = aie.core(%28) {
      %408 = arith.constant 0 : index
      %409 = arith.constant 1 : index
      %410 = arith.constant 4294967295 : index
      scf.for %411 = %408 to %410 step %409 {
        %412 = arith.constant 0 : index
        %413 = arith.constant 1 : index
        %414 = arith.constant 2 : index
        scf.for %415 = %412 to %414 step %413 {
          %416 = arith.constant 16 : index
          scf.for %417 = %412 to %416 step %413 {
            %418 = aie.objectfifo.acquire @of_9_switch_join_0_1(Produce, 1) : !aie.objectfifosubview<memref<32x64xbf16>>
            %419 = aie.objectfifo.subview.access %418[0] : !aie.objectfifosubview<memref<32x64xbf16>> -> memref<32x64xbf16>
            func.call @zero_bf16_32_32_64(%419) : (memref<32x64xbf16>) -> ()
            %420 = arith.constant 16 : index
            scf.for %421 = %412 to %420 step %413 {
              %422 = aie.objectfifo.acquire @of_6_broadcast_1_0(Consume, 1) : !aie.objectfifosubview<memref<32x64xbf16>>
              %423 = aie.objectfifo.subview.access %422[0] : !aie.objectfifosubview<memref<32x64xbf16>> -> memref<32x64xbf16>
              %424 = aie.objectfifo.acquire @of_4_broadcast_0_0(Consume, 1) : !aie.objectfifosubview<memref<32x32xbf16>>
              %425 = aie.objectfifo.subview.access %424[0] : !aie.objectfifosubview<memref<32x32xbf16>> -> memref<32x32xbf16>
              %426 = arith.constant 1 : index
              %427 = arith.constant 0 : index
              %428 = scf.index_switch %427 -> memref<32x32xbf16>
              case 0 {
                scf.yield %425 : memref<32x32xbf16>
              }
              default {
                scf.yield %425 : memref<32x32xbf16>
              }
              %429 = arith.constant 1 : index
              %430 = arith.constant 0 : index
              %431 = scf.index_switch %430 -> memref<32x64xbf16>
              case 0 {
                scf.yield %423 : memref<32x64xbf16>
              }
              default {
                scf.yield %423 : memref<32x64xbf16>
              }
              %432 = arith.constant 1 : index
              %433 = arith.constant 0 : index
              %434 = scf.index_switch %433 -> memref<32x64xbf16>
              case 0 {
                scf.yield %419 : memref<32x64xbf16>
              }
              default {
                scf.yield %419 : memref<32x64xbf16>
              }
              func.call @matmul_bf16_bf16_32_32_64(%428, %431, %434) : (memref<32x32xbf16>, memref<32x64xbf16>, memref<32x64xbf16>) -> ()
              aie.objectfifo.release @of_4_broadcast_0_0(Consume, 1)
              aie.objectfifo.release @of_6_broadcast_1_0(Consume, 1)
            }
            aie.objectfifo.release @of_9_switch_join_0_1(Produce, 1)
          }
        }
      }
      aie.end
    } { link_with="mm_32_32_64.o" }
    %435 = aie.core(%29) {
      %436 = arith.constant 0 : index
      %437 = arith.constant 1 : index
      %438 = arith.constant 4294967295 : index
      scf.for %439 = %436 to %438 step %437 {
        %440 = arith.constant 0 : index
        %441 = arith.constant 1 : index
        %442 = arith.constant 2 : index
        scf.for %443 = %440 to %442 step %441 {
          %444 = arith.constant 16 : index
          scf.for %445 = %440 to %444 step %441 {
            %446 = aie.objectfifo.acquire @of_9_switch_join_1_1(Produce, 1) : !aie.objectfifosubview<memref<32x64xbf16>>
            %447 = aie.objectfifo.subview.access %446[0] : !aie.objectfifosubview<memref<32x64xbf16>> -> memref<32x64xbf16>
            func.call @zero_bf16_32_32_64(%447) : (memref<32x64xbf16>) -> ()
            %448 = arith.constant 16 : index
            scf.for %449 = %440 to %448 step %441 {
              %450 = aie.objectfifo.acquire @of_6_broadcast_1_0(Consume, 1) : !aie.objectfifosubview<memref<32x64xbf16>>
              %451 = aie.objectfifo.subview.access %450[0] : !aie.objectfifosubview<memref<32x64xbf16>> -> memref<32x64xbf16>
              %452 = aie.objectfifo.acquire @of_4_broadcast_1_0(Consume, 1) : !aie.objectfifosubview<memref<32x32xbf16>>
              %453 = aie.objectfifo.subview.access %452[0] : !aie.objectfifosubview<memref<32x32xbf16>> -> memref<32x32xbf16>
              %454 = arith.constant 1 : index
              %455 = arith.constant 0 : index
              %456 = scf.index_switch %455 -> memref<32x32xbf16>
              case 0 {
                scf.yield %453 : memref<32x32xbf16>
              }
              default {
                scf.yield %453 : memref<32x32xbf16>
              }
              %457 = arith.constant 1 : index
              %458 = arith.constant 0 : index
              %459 = scf.index_switch %458 -> memref<32x64xbf16>
              case 0 {
                scf.yield %451 : memref<32x64xbf16>
              }
              default {
                scf.yield %451 : memref<32x64xbf16>
              }
              %460 = arith.constant 1 : index
              %461 = arith.constant 0 : index
              %462 = scf.index_switch %461 -> memref<32x64xbf16>
              case 0 {
                scf.yield %447 : memref<32x64xbf16>
              }
              default {
                scf.yield %447 : memref<32x64xbf16>
              }
              func.call @matmul_bf16_bf16_32_32_64(%456, %459, %462) : (memref<32x32xbf16>, memref<32x64xbf16>, memref<32x64xbf16>) -> ()
              aie.objectfifo.release @of_4_broadcast_1_0(Consume, 1)
              aie.objectfifo.release @of_6_broadcast_1_0(Consume, 1)
            }
            aie.objectfifo.release @of_9_switch_join_1_1(Produce, 1)
          }
        }
      }
      aie.end
    } { link_with="mm_32_32_64.o" }
    %463 = aie.core(%30) {
      %464 = arith.constant 0 : index
      %465 = arith.constant 1 : index
      %466 = arith.constant 4294967295 : index
      scf.for %467 = %464 to %466 step %465 {
        %468 = arith.constant 0 : index
        %469 = arith.constant 1 : index
        %470 = arith.constant 2 : index
        scf.for %471 = %468 to %470 step %469 {
          %472 = arith.constant 16 : index
          scf.for %473 = %468 to %472 step %469 {
            %474 = aie.objectfifo.acquire @of_9_switch_join_2_1(Produce, 1) : !aie.objectfifosubview<memref<32x64xbf16>>
            %475 = aie.objectfifo.subview.access %474[0] : !aie.objectfifosubview<memref<32x64xbf16>> -> memref<32x64xbf16>
            func.call @zero_bf16_32_32_64(%475) : (memref<32x64xbf16>) -> ()
            %476 = arith.constant 16 : index
            scf.for %477 = %468 to %476 step %469 {
              %478 = aie.objectfifo.acquire @of_6_broadcast_1_0(Consume, 1) : !aie.objectfifosubview<memref<32x64xbf16>>
              %479 = aie.objectfifo.subview.access %478[0] : !aie.objectfifosubview<memref<32x64xbf16>> -> memref<32x64xbf16>
              %480 = aie.objectfifo.acquire @of_4_broadcast_2_0(Consume, 1) : !aie.objectfifosubview<memref<32x32xbf16>>
              %481 = aie.objectfifo.subview.access %480[0] : !aie.objectfifosubview<memref<32x32xbf16>> -> memref<32x32xbf16>
              %482 = arith.constant 1 : index
              %483 = arith.constant 0 : index
              %484 = scf.index_switch %483 -> memref<32x32xbf16>
              case 0 {
                scf.yield %481 : memref<32x32xbf16>
              }
              default {
                scf.yield %481 : memref<32x32xbf16>
              }
              %485 = arith.constant 1 : index
              %486 = arith.constant 0 : index
              %487 = scf.index_switch %486 -> memref<32x64xbf16>
              case 0 {
                scf.yield %479 : memref<32x64xbf16>
              }
              default {
                scf.yield %479 : memref<32x64xbf16>
              }
              %488 = arith.constant 1 : index
              %489 = arith.constant 0 : index
              %490 = scf.index_switch %489 -> memref<32x64xbf16>
              case 0 {
                scf.yield %475 : memref<32x64xbf16>
              }
              default {
                scf.yield %475 : memref<32x64xbf16>
              }
              func.call @matmul_bf16_bf16_32_32_64(%484, %487, %490) : (memref<32x32xbf16>, memref<32x64xbf16>, memref<32x64xbf16>) -> ()
              aie.objectfifo.release @of_4_broadcast_2_0(Consume, 1)
              aie.objectfifo.release @of_6_broadcast_1_0(Consume, 1)
            }
            aie.objectfifo.release @of_9_switch_join_2_1(Produce, 1)
          }
        }
      }
      aie.end
    } { link_with="mm_32_32_64.o" }
    %491 = aie.core(%31) {
      %492 = arith.constant 0 : index
      %493 = arith.constant 1 : index
      %494 = arith.constant 4294967295 : index
      scf.for %495 = %492 to %494 step %493 {
        %496 = arith.constant 0 : index
        %497 = arith.constant 1 : index
        %498 = arith.constant 2 : index
        scf.for %499 = %496 to %498 step %497 {
          %500 = arith.constant 16 : index
          scf.for %501 = %496 to %500 step %497 {
            %502 = aie.objectfifo.acquire @of_9_switch_join_3_1(Produce, 1) : !aie.objectfifosubview<memref<32x64xbf16>>
            %503 = aie.objectfifo.subview.access %502[0] : !aie.objectfifosubview<memref<32x64xbf16>> -> memref<32x64xbf16>
            func.call @zero_bf16_32_32_64(%503) : (memref<32x64xbf16>) -> ()
            %504 = arith.constant 16 : index
            scf.for %505 = %496 to %504 step %497 {
              %506 = aie.objectfifo.acquire @of_6_broadcast_1_0(Consume, 1) : !aie.objectfifosubview<memref<32x64xbf16>>
              %507 = aie.objectfifo.subview.access %506[0] : !aie.objectfifosubview<memref<32x64xbf16>> -> memref<32x64xbf16>
              %508 = aie.objectfifo.acquire @of_4_broadcast_3_0(Consume, 1) : !aie.objectfifosubview<memref<32x32xbf16>>
              %509 = aie.objectfifo.subview.access %508[0] : !aie.objectfifosubview<memref<32x32xbf16>> -> memref<32x32xbf16>
              %510 = arith.constant 1 : index
              %511 = arith.constant 0 : index
              %512 = scf.index_switch %511 -> memref<32x32xbf16>
              case 0 {
                scf.yield %509 : memref<32x32xbf16>
              }
              default {
                scf.yield %509 : memref<32x32xbf16>
              }
              %513 = arith.constant 1 : index
              %514 = arith.constant 0 : index
              %515 = scf.index_switch %514 -> memref<32x64xbf16>
              case 0 {
                scf.yield %507 : memref<32x64xbf16>
              }
              default {
                scf.yield %507 : memref<32x64xbf16>
              }
              %516 = arith.constant 1 : index
              %517 = arith.constant 0 : index
              %518 = scf.index_switch %517 -> memref<32x64xbf16>
              case 0 {
                scf.yield %503 : memref<32x64xbf16>
              }
              default {
                scf.yield %503 : memref<32x64xbf16>
              }
              func.call @matmul_bf16_bf16_32_32_64(%512, %515, %518) : (memref<32x32xbf16>, memref<32x64xbf16>, memref<32x64xbf16>) -> ()
              aie.objectfifo.release @of_4_broadcast_3_0(Consume, 1)
              aie.objectfifo.release @of_6_broadcast_1_0(Consume, 1)
            }
            aie.objectfifo.release @of_9_switch_join_3_1(Produce, 1)
          }
        }
      }
      aie.end
    } { link_with="mm_32_32_64.o" }
    %519 = aie.core(%40) {
      %520 = arith.constant 0 : index
      %521 = arith.constant 1 : index
      %522 = arith.constant 4294967295 : index
      scf.for %523 = %520 to %522 step %521 {
        %524 = arith.constant 0 : index
        %525 = arith.constant 1 : index
        %526 = arith.constant 2 : index
        scf.for %527 = %524 to %526 step %525 {
          %528 = arith.constant 16 : index
          scf.for %529 = %524 to %528 step %525 {
            %530 = arith.constant 2 : index
            %531 = aie.objectfifo.acquire @of_8_switch_join_0_0(Consume, 1) : !aie.objectfifosubview<memref<32x64xbf16>>
            %532 = aie.objectfifo.acquire @of_8_switch_join_0_1(Consume, 1) : !aie.objectfifosubview<memref<32x64xbf16>>
            %533 = aie.objectfifo.subview.access %531[0] : !aie.objectfifosubview<memref<32x64xbf16>> -> memref<32x64xbf16>
            %534 = aie.objectfifo.subview.access %532[0] : !aie.objectfifosubview<memref<32x64xbf16>> -> memref<32x64xbf16>
            scf.for %535 = %524 to %530 step %525 {
              %536 = aie.objectfifo.acquire @of_10_unicast_0(Produce, 1) : !aie.objectfifosubview<memref<32x64xbf16>>
              %537 = aie.objectfifo.subview.access %536[0] : !aie.objectfifosubview<memref<32x64xbf16>> -> memref<32x64xbf16>
              %538 = scf.index_switch %535 -> memref<32x64xbf16>
              case 0 {
                scf.yield %533 : memref<32x64xbf16>
              }
              case 1 {
                scf.yield %534 : memref<32x64xbf16>
              }
              default {
                scf.yield %533 : memref<32x64xbf16>
              }
              %539 = arith.constant 1 : index
              %540 = arith.constant 0 : index
              %541 = scf.index_switch %540 -> memref<32x64xbf16>
              case 0 {
                scf.yield %537 : memref<32x64xbf16>
              }
              default {
                scf.yield %537 : memref<32x64xbf16>
              }
              %542 = arith.constant 2048 : i32
              func.call @silu_bf16(%538, %541, %542) : (memref<32x64xbf16>, memref<32x64xbf16>, i32) -> ()
              aie.objectfifo.release @of_10_unicast_0(Produce, 1)
            }
            aie.objectfifo.release @of_8_switch_join_0_0(Consume, 1)
            aie.objectfifo.release @of_8_switch_join_0_1(Consume, 1)
          }
        }
      }
      aie.end
    } { link_with="silu.o" }
    %543 = aie.core(%41) {
      %544 = arith.constant 0 : index
      %545 = arith.constant 1 : index
      %546 = arith.constant 4294967295 : index
      scf.for %547 = %544 to %546 step %545 {
        %548 = arith.constant 0 : index
        %549 = arith.constant 1 : index
        %550 = arith.constant 2 : index
        scf.for %551 = %548 to %550 step %549 {
          %552 = arith.constant 16 : index
          scf.for %553 = %548 to %552 step %549 {
            %554 = arith.constant 2 : index
            %555 = aie.objectfifo.acquire @of_8_switch_join_1_0(Consume, 1) : !aie.objectfifosubview<memref<32x64xbf16>>
            %556 = aie.objectfifo.acquire @of_8_switch_join_1_1(Consume, 1) : !aie.objectfifosubview<memref<32x64xbf16>>
            %557 = aie.objectfifo.subview.access %555[0] : !aie.objectfifosubview<memref<32x64xbf16>> -> memref<32x64xbf16>
            %558 = aie.objectfifo.subview.access %556[0] : !aie.objectfifosubview<memref<32x64xbf16>> -> memref<32x64xbf16>
            scf.for %559 = %548 to %554 step %549 {
              %560 = aie.objectfifo.acquire @of_10_unicast_1(Produce, 1) : !aie.objectfifosubview<memref<32x64xbf16>>
              %561 = aie.objectfifo.subview.access %560[0] : !aie.objectfifosubview<memref<32x64xbf16>> -> memref<32x64xbf16>
              %562 = scf.index_switch %559 -> memref<32x64xbf16>
              case 0 {
                scf.yield %557 : memref<32x64xbf16>
              }
              case 1 {
                scf.yield %558 : memref<32x64xbf16>
              }
              default {
                scf.yield %557 : memref<32x64xbf16>
              }
              %563 = arith.constant 1 : index
              %564 = arith.constant 0 : index
              %565 = scf.index_switch %564 -> memref<32x64xbf16>
              case 0 {
                scf.yield %561 : memref<32x64xbf16>
              }
              default {
                scf.yield %561 : memref<32x64xbf16>
              }
              %566 = arith.constant 2048 : i32
              func.call @silu_bf16(%562, %565, %566) : (memref<32x64xbf16>, memref<32x64xbf16>, i32) -> ()
              aie.objectfifo.release @of_10_unicast_1(Produce, 1)
            }
            aie.objectfifo.release @of_8_switch_join_1_0(Consume, 1)
            aie.objectfifo.release @of_8_switch_join_1_1(Consume, 1)
          }
        }
      }
      aie.end
    } { link_with="silu.o" }
    %567 = aie.core(%42) {
      %568 = arith.constant 0 : index
      %569 = arith.constant 1 : index
      %570 = arith.constant 4294967295 : index
      scf.for %571 = %568 to %570 step %569 {
        %572 = arith.constant 0 : index
        %573 = arith.constant 1 : index
        %574 = arith.constant 2 : index
        scf.for %575 = %572 to %574 step %573 {
          %576 = arith.constant 16 : index
          scf.for %577 = %572 to %576 step %573 {
            %578 = arith.constant 2 : index
            %579 = aie.objectfifo.acquire @of_8_switch_join_2_0(Consume, 1) : !aie.objectfifosubview<memref<32x64xbf16>>
            %580 = aie.objectfifo.acquire @of_8_switch_join_2_1(Consume, 1) : !aie.objectfifosubview<memref<32x64xbf16>>
            %581 = aie.objectfifo.subview.access %579[0] : !aie.objectfifosubview<memref<32x64xbf16>> -> memref<32x64xbf16>
            %582 = aie.objectfifo.subview.access %580[0] : !aie.objectfifosubview<memref<32x64xbf16>> -> memref<32x64xbf16>
            scf.for %583 = %572 to %578 step %573 {
              %584 = aie.objectfifo.acquire @of_10_unicast_2(Produce, 1) : !aie.objectfifosubview<memref<32x64xbf16>>
              %585 = aie.objectfifo.subview.access %584[0] : !aie.objectfifosubview<memref<32x64xbf16>> -> memref<32x64xbf16>
              %586 = scf.index_switch %583 -> memref<32x64xbf16>
              case 0 {
                scf.yield %581 : memref<32x64xbf16>
              }
              case 1 {
                scf.yield %582 : memref<32x64xbf16>
              }
              default {
                scf.yield %581 : memref<32x64xbf16>
              }
              %587 = arith.constant 1 : index
              %588 = arith.constant 0 : index
              %589 = scf.index_switch %588 -> memref<32x64xbf16>
              case 0 {
                scf.yield %585 : memref<32x64xbf16>
              }
              default {
                scf.yield %585 : memref<32x64xbf16>
              }
              %590 = arith.constant 2048 : i32
              func.call @silu_bf16(%586, %589, %590) : (memref<32x64xbf16>, memref<32x64xbf16>, i32) -> ()
              aie.objectfifo.release @of_10_unicast_2(Produce, 1)
            }
            aie.objectfifo.release @of_8_switch_join_2_0(Consume, 1)
            aie.objectfifo.release @of_8_switch_join_2_1(Consume, 1)
          }
        }
      }
      aie.end
    } { link_with="silu.o" }
    %591 = aie.core(%43) {
      %592 = arith.constant 0 : index
      %593 = arith.constant 1 : index
      %594 = arith.constant 4294967295 : index
      scf.for %595 = %592 to %594 step %593 {
        %596 = arith.constant 0 : index
        %597 = arith.constant 1 : index
        %598 = arith.constant 2 : index
        scf.for %599 = %596 to %598 step %597 {
          %600 = arith.constant 16 : index
          scf.for %601 = %596 to %600 step %597 {
            %602 = arith.constant 2 : index
            %603 = aie.objectfifo.acquire @of_8_switch_join_3_0(Consume, 1) : !aie.objectfifosubview<memref<32x64xbf16>>
            %604 = aie.objectfifo.acquire @of_8_switch_join_3_1(Consume, 1) : !aie.objectfifosubview<memref<32x64xbf16>>
            %605 = aie.objectfifo.subview.access %603[0] : !aie.objectfifosubview<memref<32x64xbf16>> -> memref<32x64xbf16>
            %606 = aie.objectfifo.subview.access %604[0] : !aie.objectfifosubview<memref<32x64xbf16>> -> memref<32x64xbf16>
            scf.for %607 = %596 to %602 step %597 {
              %608 = aie.objectfifo.acquire @of_10_unicast_3(Produce, 1) : !aie.objectfifosubview<memref<32x64xbf16>>
              %609 = aie.objectfifo.subview.access %608[0] : !aie.objectfifosubview<memref<32x64xbf16>> -> memref<32x64xbf16>
              %610 = scf.index_switch %607 -> memref<32x64xbf16>
              case 0 {
                scf.yield %605 : memref<32x64xbf16>
              }
              case 1 {
                scf.yield %606 : memref<32x64xbf16>
              }
              default {
                scf.yield %605 : memref<32x64xbf16>
              }
              %611 = arith.constant 1 : index
              %612 = arith.constant 0 : index
              %613 = scf.index_switch %612 -> memref<32x64xbf16>
              case 0 {
                scf.yield %609 : memref<32x64xbf16>
              }
              default {
                scf.yield %609 : memref<32x64xbf16>
              }
              %614 = arith.constant 2048 : i32
              func.call @silu_bf16(%610, %613, %614) : (memref<32x64xbf16>, memref<32x64xbf16>, i32) -> ()
              aie.objectfifo.release @of_10_unicast_3(Produce, 1)
            }
            aie.objectfifo.release @of_8_switch_join_3_0(Consume, 1)
            aie.objectfifo.release @of_8_switch_join_3_1(Consume, 1)
          }
        }
      }
      aie.end
    } { link_with="silu.o" }
    %615 = aie.core(%44) {
      %616 = arith.constant 0 : index
      %617 = arith.constant 1 : index
      %618 = arith.constant 4294967295 : index
      scf.for %619 = %616 to %618 step %617 {
        %620 = arith.constant 0 : index
        %621 = arith.constant 1 : index
        %622 = arith.constant 2 : index
        scf.for %623 = %620 to %622 step %621 {
          %624 = arith.constant 16 : index
          scf.for %625 = %620 to %624 step %621 {
            %626 = arith.constant 2 : index
            %627 = aie.objectfifo.acquire @of_9_switch_join_0_0(Consume, 1) : !aie.objectfifosubview<memref<32x64xbf16>>
            %628 = aie.objectfifo.acquire @of_9_switch_join_0_1(Consume, 1) : !aie.objectfifosubview<memref<32x64xbf16>>
            %629 = aie.objectfifo.subview.access %627[0] : !aie.objectfifosubview<memref<32x64xbf16>> -> memref<32x64xbf16>
            %630 = aie.objectfifo.subview.access %628[0] : !aie.objectfifosubview<memref<32x64xbf16>> -> memref<32x64xbf16>
            scf.for %631 = %620 to %626 step %621 {
              %632 = aie.objectfifo.acquire @of_11_broadcast_0(Produce, 1) : !aie.objectfifosubview<memref<32x64xbf16>>
              %633 = aie.objectfifo.subview.access %632[0] : !aie.objectfifosubview<memref<32x64xbf16>> -> memref<32x64xbf16>
              %634 = aie.objectfifo.acquire @of_10_unicast_0(Consume, 1) : !aie.objectfifosubview<memref<32x64xbf16>>
              %635 = aie.objectfifo.subview.access %634[0] : !aie.objectfifosubview<memref<32x64xbf16>> -> memref<32x64xbf16>
              %636 = scf.index_switch %631 -> memref<32x64xbf16>
              case 0 {
                scf.yield %629 : memref<32x64xbf16>
              }
              case 1 {
                scf.yield %630 : memref<32x64xbf16>
              }
              default {
                scf.yield %629 : memref<32x64xbf16>
              }
              %637 = arith.constant 1 : index
              %638 = arith.constant 0 : index
              %639 = scf.index_switch %638 -> memref<32x64xbf16>
              case 0 {
                scf.yield %635 : memref<32x64xbf16>
              }
              default {
                scf.yield %635 : memref<32x64xbf16>
              }
              %640 = arith.constant 1 : index
              %641 = arith.constant 0 : index
              %642 = scf.index_switch %641 -> memref<32x64xbf16>
              case 0 {
                scf.yield %633 : memref<32x64xbf16>
              }
              default {
                scf.yield %633 : memref<32x64xbf16>
              }
              %643 = arith.constant 2048 : i32
              func.call @eltwise_mul_bf16_scalar(%639, %636, %642, %643) : (memref<32x64xbf16>, memref<32x64xbf16>, memref<32x64xbf16>, i32) -> ()
              aie.objectfifo.release @of_10_unicast_0(Consume, 1)
              aie.objectfifo.release @of_11_broadcast_0(Produce, 1)
            }
            aie.objectfifo.release @of_9_switch_join_0_0(Consume, 1)
            aie.objectfifo.release @of_9_switch_join_0_1(Consume, 1)
          }
        }
      }
      aie.end
    } { link_with="mul.o" }
    %644 = aie.core(%45) {
      %645 = arith.constant 0 : index
      %646 = arith.constant 1 : index
      %647 = arith.constant 4294967295 : index
      scf.for %648 = %645 to %647 step %646 {
        %649 = arith.constant 0 : index
        %650 = arith.constant 1 : index
        %651 = arith.constant 2 : index
        scf.for %652 = %649 to %651 step %650 {
          %653 = arith.constant 16 : index
          scf.for %654 = %649 to %653 step %650 {
            %655 = arith.constant 2 : index
            %656 = aie.objectfifo.acquire @of_9_switch_join_1_0(Consume, 1) : !aie.objectfifosubview<memref<32x64xbf16>>
            %657 = aie.objectfifo.acquire @of_9_switch_join_1_1(Consume, 1) : !aie.objectfifosubview<memref<32x64xbf16>>
            %658 = aie.objectfifo.subview.access %656[0] : !aie.objectfifosubview<memref<32x64xbf16>> -> memref<32x64xbf16>
            %659 = aie.objectfifo.subview.access %657[0] : !aie.objectfifosubview<memref<32x64xbf16>> -> memref<32x64xbf16>
            scf.for %660 = %649 to %655 step %650 {
              %661 = aie.objectfifo.acquire @of_11_broadcast_1(Produce, 1) : !aie.objectfifosubview<memref<32x64xbf16>>
              %662 = aie.objectfifo.subview.access %661[0] : !aie.objectfifosubview<memref<32x64xbf16>> -> memref<32x64xbf16>
              %663 = aie.objectfifo.acquire @of_10_unicast_1(Consume, 1) : !aie.objectfifosubview<memref<32x64xbf16>>
              %664 = aie.objectfifo.subview.access %663[0] : !aie.objectfifosubview<memref<32x64xbf16>> -> memref<32x64xbf16>
              %665 = scf.index_switch %660 -> memref<32x64xbf16>
              case 0 {
                scf.yield %658 : memref<32x64xbf16>
              }
              case 1 {
                scf.yield %659 : memref<32x64xbf16>
              }
              default {
                scf.yield %658 : memref<32x64xbf16>
              }
              %666 = arith.constant 1 : index
              %667 = arith.constant 0 : index
              %668 = scf.index_switch %667 -> memref<32x64xbf16>
              case 0 {
                scf.yield %664 : memref<32x64xbf16>
              }
              default {
                scf.yield %664 : memref<32x64xbf16>
              }
              %669 = arith.constant 1 : index
              %670 = arith.constant 0 : index
              %671 = scf.index_switch %670 -> memref<32x64xbf16>
              case 0 {
                scf.yield %662 : memref<32x64xbf16>
              }
              default {
                scf.yield %662 : memref<32x64xbf16>
              }
              %672 = arith.constant 2048 : i32
              func.call @eltwise_mul_bf16_scalar(%668, %665, %671, %672) : (memref<32x64xbf16>, memref<32x64xbf16>, memref<32x64xbf16>, i32) -> ()
              aie.objectfifo.release @of_10_unicast_1(Consume, 1)
              aie.objectfifo.release @of_11_broadcast_1(Produce, 1)
            }
            aie.objectfifo.release @of_9_switch_join_1_0(Consume, 1)
            aie.objectfifo.release @of_9_switch_join_1_1(Consume, 1)
          }
        }
      }
      aie.end
    } { link_with="mul.o" }
    %673 = aie.core(%46) {
      %674 = arith.constant 0 : index
      %675 = arith.constant 1 : index
      %676 = arith.constant 4294967295 : index
      scf.for %677 = %674 to %676 step %675 {
        %678 = arith.constant 0 : index
        %679 = arith.constant 1 : index
        %680 = arith.constant 2 : index
        scf.for %681 = %678 to %680 step %679 {
          %682 = arith.constant 16 : index
          scf.for %683 = %678 to %682 step %679 {
            %684 = arith.constant 2 : index
            %685 = aie.objectfifo.acquire @of_9_switch_join_2_0(Consume, 1) : !aie.objectfifosubview<memref<32x64xbf16>>
            %686 = aie.objectfifo.acquire @of_9_switch_join_2_1(Consume, 1) : !aie.objectfifosubview<memref<32x64xbf16>>
            %687 = aie.objectfifo.subview.access %685[0] : !aie.objectfifosubview<memref<32x64xbf16>> -> memref<32x64xbf16>
            %688 = aie.objectfifo.subview.access %686[0] : !aie.objectfifosubview<memref<32x64xbf16>> -> memref<32x64xbf16>
            scf.for %689 = %678 to %684 step %679 {
              %690 = aie.objectfifo.acquire @of_11_broadcast_2(Produce, 1) : !aie.objectfifosubview<memref<32x64xbf16>>
              %691 = aie.objectfifo.subview.access %690[0] : !aie.objectfifosubview<memref<32x64xbf16>> -> memref<32x64xbf16>
              %692 = aie.objectfifo.acquire @of_10_unicast_2(Consume, 1) : !aie.objectfifosubview<memref<32x64xbf16>>
              %693 = aie.objectfifo.subview.access %692[0] : !aie.objectfifosubview<memref<32x64xbf16>> -> memref<32x64xbf16>
              %694 = scf.index_switch %689 -> memref<32x64xbf16>
              case 0 {
                scf.yield %687 : memref<32x64xbf16>
              }
              case 1 {
                scf.yield %688 : memref<32x64xbf16>
              }
              default {
                scf.yield %687 : memref<32x64xbf16>
              }
              %695 = arith.constant 1 : index
              %696 = arith.constant 0 : index
              %697 = scf.index_switch %696 -> memref<32x64xbf16>
              case 0 {
                scf.yield %693 : memref<32x64xbf16>
              }
              default {
                scf.yield %693 : memref<32x64xbf16>
              }
              %698 = arith.constant 1 : index
              %699 = arith.constant 0 : index
              %700 = scf.index_switch %699 -> memref<32x64xbf16>
              case 0 {
                scf.yield %691 : memref<32x64xbf16>
              }
              default {
                scf.yield %691 : memref<32x64xbf16>
              }
              %701 = arith.constant 2048 : i32
              func.call @eltwise_mul_bf16_scalar(%697, %694, %700, %701) : (memref<32x64xbf16>, memref<32x64xbf16>, memref<32x64xbf16>, i32) -> ()
              aie.objectfifo.release @of_10_unicast_2(Consume, 1)
              aie.objectfifo.release @of_11_broadcast_2(Produce, 1)
            }
            aie.objectfifo.release @of_9_switch_join_2_0(Consume, 1)
            aie.objectfifo.release @of_9_switch_join_2_1(Consume, 1)
          }
        }
      }
      aie.end
    } { link_with="mul.o" }
    %702 = aie.core(%47) {
      %703 = arith.constant 0 : index
      %704 = arith.constant 1 : index
      %705 = arith.constant 4294967295 : index
      scf.for %706 = %703 to %705 step %704 {
        %707 = arith.constant 0 : index
        %708 = arith.constant 1 : index
        %709 = arith.constant 2 : index
        scf.for %710 = %707 to %709 step %708 {
          %711 = arith.constant 16 : index
          scf.for %712 = %707 to %711 step %708 {
            %713 = arith.constant 2 : index
            %714 = aie.objectfifo.acquire @of_9_switch_join_3_0(Consume, 1) : !aie.objectfifosubview<memref<32x64xbf16>>
            %715 = aie.objectfifo.acquire @of_9_switch_join_3_1(Consume, 1) : !aie.objectfifosubview<memref<32x64xbf16>>
            %716 = aie.objectfifo.subview.access %714[0] : !aie.objectfifosubview<memref<32x64xbf16>> -> memref<32x64xbf16>
            %717 = aie.objectfifo.subview.access %715[0] : !aie.objectfifosubview<memref<32x64xbf16>> -> memref<32x64xbf16>
            scf.for %718 = %707 to %713 step %708 {
              %719 = aie.objectfifo.acquire @of_11_broadcast_3(Produce, 1) : !aie.objectfifosubview<memref<32x64xbf16>>
              %720 = aie.objectfifo.subview.access %719[0] : !aie.objectfifosubview<memref<32x64xbf16>> -> memref<32x64xbf16>
              %721 = aie.objectfifo.acquire @of_10_unicast_3(Consume, 1) : !aie.objectfifosubview<memref<32x64xbf16>>
              %722 = aie.objectfifo.subview.access %721[0] : !aie.objectfifosubview<memref<32x64xbf16>> -> memref<32x64xbf16>
              %723 = scf.index_switch %718 -> memref<32x64xbf16>
              case 0 {
                scf.yield %716 : memref<32x64xbf16>
              }
              case 1 {
                scf.yield %717 : memref<32x64xbf16>
              }
              default {
                scf.yield %716 : memref<32x64xbf16>
              }
              %724 = arith.constant 1 : index
              %725 = arith.constant 0 : index
              %726 = scf.index_switch %725 -> memref<32x64xbf16>
              case 0 {
                scf.yield %722 : memref<32x64xbf16>
              }
              default {
                scf.yield %722 : memref<32x64xbf16>
              }
              %727 = arith.constant 1 : index
              %728 = arith.constant 0 : index
              %729 = scf.index_switch %728 -> memref<32x64xbf16>
              case 0 {
                scf.yield %720 : memref<32x64xbf16>
              }
              default {
                scf.yield %720 : memref<32x64xbf16>
              }
              %730 = arith.constant 2048 : i32
              func.call @eltwise_mul_bf16_scalar(%726, %723, %729, %730) : (memref<32x64xbf16>, memref<32x64xbf16>, memref<32x64xbf16>, i32) -> ()
              aie.objectfifo.release @of_10_unicast_3(Consume, 1)
              aie.objectfifo.release @of_11_broadcast_3(Produce, 1)
            }
            aie.objectfifo.release @of_9_switch_join_3_0(Consume, 1)
            aie.objectfifo.release @of_9_switch_join_3_1(Consume, 1)
          }
        }
      }
      aie.end
    } { link_with="mul.o" }
    %731 = aie.core(%32) {
      %732 = arith.constant 0 : index
      %733 = arith.constant 1 : index
      %734 = arith.constant 4294967295 : index
      scf.for %735 = %732 to %734 step %733 {
        %736 = arith.constant 0 : index
        %737 = arith.constant 1 : index
        %738 = arith.constant 2 : index
        scf.for %739 = %736 to %738 step %737 {
          %740 = aie.objectfifo.acquire @of_12_join_0_0(Produce, 8) : !aie.objectfifosubview<memref<32x32xbf16>>
          %741 = aie.objectfifo.subview.access %740[0] : !aie.objectfifosubview<memref<32x32xbf16>> -> memref<32x32xbf16>
          func.call @zero_bf16_32_64_32(%741) : (memref<32x32xbf16>) -> ()
          %742 = aie.objectfifo.subview.access %740[1] : !aie.objectfifosubview<memref<32x32xbf16>> -> memref<32x32xbf16>
          func.call @zero_bf16_32_64_32(%742) : (memref<32x32xbf16>) -> ()
          %743 = aie.objectfifo.subview.access %740[2] : !aie.objectfifosubview<memref<32x32xbf16>> -> memref<32x32xbf16>
          func.call @zero_bf16_32_64_32(%743) : (memref<32x32xbf16>) -> ()
          %744 = aie.objectfifo.subview.access %740[3] : !aie.objectfifosubview<memref<32x32xbf16>> -> memref<32x32xbf16>
          func.call @zero_bf16_32_64_32(%744) : (memref<32x32xbf16>) -> ()
          %745 = aie.objectfifo.subview.access %740[4] : !aie.objectfifosubview<memref<32x32xbf16>> -> memref<32x32xbf16>
          func.call @zero_bf16_32_64_32(%745) : (memref<32x32xbf16>) -> ()
          %746 = aie.objectfifo.subview.access %740[5] : !aie.objectfifosubview<memref<32x32xbf16>> -> memref<32x32xbf16>
          func.call @zero_bf16_32_64_32(%746) : (memref<32x32xbf16>) -> ()
          %747 = aie.objectfifo.subview.access %740[6] : !aie.objectfifosubview<memref<32x32xbf16>> -> memref<32x32xbf16>
          func.call @zero_bf16_32_64_32(%747) : (memref<32x32xbf16>) -> ()
          %748 = aie.objectfifo.subview.access %740[7] : !aie.objectfifosubview<memref<32x32xbf16>> -> memref<32x32xbf16>
          func.call @zero_bf16_32_64_32(%748) : (memref<32x32xbf16>) -> ()
          %749 = arith.constant 16 : index
          scf.for %750 = %736 to %749 step %737 {
            %751 = aie.objectfifo.acquire @of_11_broadcast_0(Consume, 2) : !aie.objectfifosubview<memref<32x64xbf16>>
            %752 = aie.objectfifo.subview.access %751[0] : !aie.objectfifosubview<memref<32x64xbf16>> -> memref<32x64xbf16>
            %753 = aie.objectfifo.subview.access %751[1] : !aie.objectfifosubview<memref<32x64xbf16>> -> memref<32x64xbf16>
            %754 = arith.constant 8 : index
            scf.for %755 = %736 to %754 step %737 {
              %756 = arith.constant 1 : index
              %757 = arith.constant 0 : index
              %758 = arith.muli %756, %755 : index
              %759 = arith.addi %757, %758 : index
              %760 = arith.muli %756, %754 : index
              %761 = scf.index_switch %759 -> memref<32x32xbf16>
              case 0 {
                scf.yield %741 : memref<32x32xbf16>
              }
              case 1 {
                scf.yield %742 : memref<32x32xbf16>
              }
              case 2 {
                scf.yield %743 : memref<32x32xbf16>
              }
              case 3 {
                scf.yield %744 : memref<32x32xbf16>
              }
              case 4 {
                scf.yield %745 : memref<32x32xbf16>
              }
              case 5 {
                scf.yield %746 : memref<32x32xbf16>
              }
              case 6 {
                scf.yield %747 : memref<32x32xbf16>
              }
              case 7 {
                scf.yield %748 : memref<32x32xbf16>
              }
              default {
                scf.yield %741 : memref<32x32xbf16>
              }
              %762 = arith.constant 2 : index
              scf.for %763 = %736 to %762 step %737 {
                %764 = arith.constant 1 : index
                %765 = arith.constant 0 : index
                %766 = arith.muli %764, %763 : index
                %767 = arith.addi %765, %766 : index
                %768 = arith.muli %764, %762 : index
                %769 = scf.index_switch %767 -> memref<32x64xbf16>
                case 0 {
                  scf.yield %752 : memref<32x64xbf16>
                }
                case 1 {
                  scf.yield %753 : memref<32x64xbf16>
                }
                default {
                  scf.yield %752 : memref<32x64xbf16>
                }
                %770 = aie.objectfifo.acquire @of_7_broadcast_0_0(Consume, 1) : !aie.objectfifosubview<memref<64x32xbf16>>
                %771 = aie.objectfifo.subview.access %770[0] : !aie.objectfifosubview<memref<64x32xbf16>> -> memref<64x32xbf16>
                %772 = arith.constant 1 : index
                %773 = arith.constant 0 : index
                %774 = scf.index_switch %773 -> memref<64x32xbf16>
                case 0 {
                  scf.yield %771 : memref<64x32xbf16>
                }
                default {
                  scf.yield %771 : memref<64x32xbf16>
                }
                func.call @matmul_bf16_bf16_32_64_32(%769, %774, %761) : (memref<32x64xbf16>, memref<64x32xbf16>, memref<32x32xbf16>) -> ()
                aie.objectfifo.release @of_7_broadcast_0_0(Consume, 1)
              }
            }
            aie.objectfifo.release @of_11_broadcast_0(Consume, 2)
          }
          aie.objectfifo.release @of_12_join_0_0(Produce, 8)
        }
      }
      aie.end
    } { link_with="mm_32_64_32.o" }
    %775 = aie.core(%33) {
      %776 = arith.constant 0 : index
      %777 = arith.constant 1 : index
      %778 = arith.constant 4294967295 : index
      scf.for %779 = %776 to %778 step %777 {
        %780 = arith.constant 0 : index
        %781 = arith.constant 1 : index
        %782 = arith.constant 2 : index
        scf.for %783 = %780 to %782 step %781 {
          %784 = aie.objectfifo.acquire @of_12_join_0_1(Produce, 8) : !aie.objectfifosubview<memref<32x32xbf16>>
          %785 = aie.objectfifo.subview.access %784[0] : !aie.objectfifosubview<memref<32x32xbf16>> -> memref<32x32xbf16>
          func.call @zero_bf16_32_64_32(%785) : (memref<32x32xbf16>) -> ()
          %786 = aie.objectfifo.subview.access %784[1] : !aie.objectfifosubview<memref<32x32xbf16>> -> memref<32x32xbf16>
          func.call @zero_bf16_32_64_32(%786) : (memref<32x32xbf16>) -> ()
          %787 = aie.objectfifo.subview.access %784[2] : !aie.objectfifosubview<memref<32x32xbf16>> -> memref<32x32xbf16>
          func.call @zero_bf16_32_64_32(%787) : (memref<32x32xbf16>) -> ()
          %788 = aie.objectfifo.subview.access %784[3] : !aie.objectfifosubview<memref<32x32xbf16>> -> memref<32x32xbf16>
          func.call @zero_bf16_32_64_32(%788) : (memref<32x32xbf16>) -> ()
          %789 = aie.objectfifo.subview.access %784[4] : !aie.objectfifosubview<memref<32x32xbf16>> -> memref<32x32xbf16>
          func.call @zero_bf16_32_64_32(%789) : (memref<32x32xbf16>) -> ()
          %790 = aie.objectfifo.subview.access %784[5] : !aie.objectfifosubview<memref<32x32xbf16>> -> memref<32x32xbf16>
          func.call @zero_bf16_32_64_32(%790) : (memref<32x32xbf16>) -> ()
          %791 = aie.objectfifo.subview.access %784[6] : !aie.objectfifosubview<memref<32x32xbf16>> -> memref<32x32xbf16>
          func.call @zero_bf16_32_64_32(%791) : (memref<32x32xbf16>) -> ()
          %792 = aie.objectfifo.subview.access %784[7] : !aie.objectfifosubview<memref<32x32xbf16>> -> memref<32x32xbf16>
          func.call @zero_bf16_32_64_32(%792) : (memref<32x32xbf16>) -> ()
          %793 = arith.constant 16 : index
          scf.for %794 = %780 to %793 step %781 {
            %795 = aie.objectfifo.acquire @of_11_broadcast_1(Consume, 2) : !aie.objectfifosubview<memref<32x64xbf16>>
            %796 = aie.objectfifo.subview.access %795[0] : !aie.objectfifosubview<memref<32x64xbf16>> -> memref<32x64xbf16>
            %797 = aie.objectfifo.subview.access %795[1] : !aie.objectfifosubview<memref<32x64xbf16>> -> memref<32x64xbf16>
            %798 = arith.constant 8 : index
            scf.for %799 = %780 to %798 step %781 {
              %800 = arith.constant 1 : index
              %801 = arith.constant 0 : index
              %802 = arith.muli %800, %799 : index
              %803 = arith.addi %801, %802 : index
              %804 = arith.muli %800, %798 : index
              %805 = scf.index_switch %803 -> memref<32x32xbf16>
              case 0 {
                scf.yield %785 : memref<32x32xbf16>
              }
              case 1 {
                scf.yield %786 : memref<32x32xbf16>
              }
              case 2 {
                scf.yield %787 : memref<32x32xbf16>
              }
              case 3 {
                scf.yield %788 : memref<32x32xbf16>
              }
              case 4 {
                scf.yield %789 : memref<32x32xbf16>
              }
              case 5 {
                scf.yield %790 : memref<32x32xbf16>
              }
              case 6 {
                scf.yield %791 : memref<32x32xbf16>
              }
              case 7 {
                scf.yield %792 : memref<32x32xbf16>
              }
              default {
                scf.yield %785 : memref<32x32xbf16>
              }
              %806 = arith.constant 2 : index
              scf.for %807 = %780 to %806 step %781 {
                %808 = arith.constant 1 : index
                %809 = arith.constant 0 : index
                %810 = arith.muli %808, %807 : index
                %811 = arith.addi %809, %810 : index
                %812 = arith.muli %808, %806 : index
                %813 = scf.index_switch %811 -> memref<32x64xbf16>
                case 0 {
                  scf.yield %796 : memref<32x64xbf16>
                }
                case 1 {
                  scf.yield %797 : memref<32x64xbf16>
                }
                default {
                  scf.yield %796 : memref<32x64xbf16>
                }
                %814 = aie.objectfifo.acquire @of_7_broadcast_0_0(Consume, 1) : !aie.objectfifosubview<memref<64x32xbf16>>
                %815 = aie.objectfifo.subview.access %814[0] : !aie.objectfifosubview<memref<64x32xbf16>> -> memref<64x32xbf16>
                %816 = arith.constant 1 : index
                %817 = arith.constant 0 : index
                %818 = scf.index_switch %817 -> memref<64x32xbf16>
                case 0 {
                  scf.yield %815 : memref<64x32xbf16>
                }
                default {
                  scf.yield %815 : memref<64x32xbf16>
                }
                func.call @matmul_bf16_bf16_32_64_32(%813, %818, %805) : (memref<32x64xbf16>, memref<64x32xbf16>, memref<32x32xbf16>) -> ()
                aie.objectfifo.release @of_7_broadcast_0_0(Consume, 1)
              }
            }
            aie.objectfifo.release @of_11_broadcast_1(Consume, 2)
          }
          aie.objectfifo.release @of_12_join_0_1(Produce, 8)
        }
      }
      aie.end
    } { link_with="mm_32_64_32.o" }
    %819 = aie.core(%34) {
      %820 = arith.constant 0 : index
      %821 = arith.constant 1 : index
      %822 = arith.constant 4294967295 : index
      scf.for %823 = %820 to %822 step %821 {
        %824 = arith.constant 0 : index
        %825 = arith.constant 1 : index
        %826 = arith.constant 2 : index
        scf.for %827 = %824 to %826 step %825 {
          %828 = aie.objectfifo.acquire @of_12_join_0_2(Produce, 8) : !aie.objectfifosubview<memref<32x32xbf16>>
          %829 = aie.objectfifo.subview.access %828[0] : !aie.objectfifosubview<memref<32x32xbf16>> -> memref<32x32xbf16>
          func.call @zero_bf16_32_64_32(%829) : (memref<32x32xbf16>) -> ()
          %830 = aie.objectfifo.subview.access %828[1] : !aie.objectfifosubview<memref<32x32xbf16>> -> memref<32x32xbf16>
          func.call @zero_bf16_32_64_32(%830) : (memref<32x32xbf16>) -> ()
          %831 = aie.objectfifo.subview.access %828[2] : !aie.objectfifosubview<memref<32x32xbf16>> -> memref<32x32xbf16>
          func.call @zero_bf16_32_64_32(%831) : (memref<32x32xbf16>) -> ()
          %832 = aie.objectfifo.subview.access %828[3] : !aie.objectfifosubview<memref<32x32xbf16>> -> memref<32x32xbf16>
          func.call @zero_bf16_32_64_32(%832) : (memref<32x32xbf16>) -> ()
          %833 = aie.objectfifo.subview.access %828[4] : !aie.objectfifosubview<memref<32x32xbf16>> -> memref<32x32xbf16>
          func.call @zero_bf16_32_64_32(%833) : (memref<32x32xbf16>) -> ()
          %834 = aie.objectfifo.subview.access %828[5] : !aie.objectfifosubview<memref<32x32xbf16>> -> memref<32x32xbf16>
          func.call @zero_bf16_32_64_32(%834) : (memref<32x32xbf16>) -> ()
          %835 = aie.objectfifo.subview.access %828[6] : !aie.objectfifosubview<memref<32x32xbf16>> -> memref<32x32xbf16>
          func.call @zero_bf16_32_64_32(%835) : (memref<32x32xbf16>) -> ()
          %836 = aie.objectfifo.subview.access %828[7] : !aie.objectfifosubview<memref<32x32xbf16>> -> memref<32x32xbf16>
          func.call @zero_bf16_32_64_32(%836) : (memref<32x32xbf16>) -> ()
          %837 = arith.constant 16 : index
          scf.for %838 = %824 to %837 step %825 {
            %839 = aie.objectfifo.acquire @of_11_broadcast_2(Consume, 2) : !aie.objectfifosubview<memref<32x64xbf16>>
            %840 = aie.objectfifo.subview.access %839[0] : !aie.objectfifosubview<memref<32x64xbf16>> -> memref<32x64xbf16>
            %841 = aie.objectfifo.subview.access %839[1] : !aie.objectfifosubview<memref<32x64xbf16>> -> memref<32x64xbf16>
            %842 = arith.constant 8 : index
            scf.for %843 = %824 to %842 step %825 {
              %844 = arith.constant 1 : index
              %845 = arith.constant 0 : index
              %846 = arith.muli %844, %843 : index
              %847 = arith.addi %845, %846 : index
              %848 = arith.muli %844, %842 : index
              %849 = scf.index_switch %847 -> memref<32x32xbf16>
              case 0 {
                scf.yield %829 : memref<32x32xbf16>
              }
              case 1 {
                scf.yield %830 : memref<32x32xbf16>
              }
              case 2 {
                scf.yield %831 : memref<32x32xbf16>
              }
              case 3 {
                scf.yield %832 : memref<32x32xbf16>
              }
              case 4 {
                scf.yield %833 : memref<32x32xbf16>
              }
              case 5 {
                scf.yield %834 : memref<32x32xbf16>
              }
              case 6 {
                scf.yield %835 : memref<32x32xbf16>
              }
              case 7 {
                scf.yield %836 : memref<32x32xbf16>
              }
              default {
                scf.yield %829 : memref<32x32xbf16>
              }
              %850 = arith.constant 2 : index
              scf.for %851 = %824 to %850 step %825 {
                %852 = arith.constant 1 : index
                %853 = arith.constant 0 : index
                %854 = arith.muli %852, %851 : index
                %855 = arith.addi %853, %854 : index
                %856 = arith.muli %852, %850 : index
                %857 = scf.index_switch %855 -> memref<32x64xbf16>
                case 0 {
                  scf.yield %840 : memref<32x64xbf16>
                }
                case 1 {
                  scf.yield %841 : memref<32x64xbf16>
                }
                default {
                  scf.yield %840 : memref<32x64xbf16>
                }
                %858 = aie.objectfifo.acquire @of_7_broadcast_0_0(Consume, 1) : !aie.objectfifosubview<memref<64x32xbf16>>
                %859 = aie.objectfifo.subview.access %858[0] : !aie.objectfifosubview<memref<64x32xbf16>> -> memref<64x32xbf16>
                %860 = arith.constant 1 : index
                %861 = arith.constant 0 : index
                %862 = scf.index_switch %861 -> memref<64x32xbf16>
                case 0 {
                  scf.yield %859 : memref<64x32xbf16>
                }
                default {
                  scf.yield %859 : memref<64x32xbf16>
                }
                func.call @matmul_bf16_bf16_32_64_32(%857, %862, %849) : (memref<32x64xbf16>, memref<64x32xbf16>, memref<32x32xbf16>) -> ()
                aie.objectfifo.release @of_7_broadcast_0_0(Consume, 1)
              }
            }
            aie.objectfifo.release @of_11_broadcast_2(Consume, 2)
          }
          aie.objectfifo.release @of_12_join_0_2(Produce, 8)
        }
      }
      aie.end
    } { link_with="mm_32_64_32.o" }
    %863 = aie.core(%35) {
      %864 = arith.constant 0 : index
      %865 = arith.constant 1 : index
      %866 = arith.constant 4294967295 : index
      scf.for %867 = %864 to %866 step %865 {
        %868 = arith.constant 0 : index
        %869 = arith.constant 1 : index
        %870 = arith.constant 2 : index
        scf.for %871 = %868 to %870 step %869 {
          %872 = aie.objectfifo.acquire @of_12_join_0_3(Produce, 8) : !aie.objectfifosubview<memref<32x32xbf16>>
          %873 = aie.objectfifo.subview.access %872[0] : !aie.objectfifosubview<memref<32x32xbf16>> -> memref<32x32xbf16>
          func.call @zero_bf16_32_64_32(%873) : (memref<32x32xbf16>) -> ()
          %874 = aie.objectfifo.subview.access %872[1] : !aie.objectfifosubview<memref<32x32xbf16>> -> memref<32x32xbf16>
          func.call @zero_bf16_32_64_32(%874) : (memref<32x32xbf16>) -> ()
          %875 = aie.objectfifo.subview.access %872[2] : !aie.objectfifosubview<memref<32x32xbf16>> -> memref<32x32xbf16>
          func.call @zero_bf16_32_64_32(%875) : (memref<32x32xbf16>) -> ()
          %876 = aie.objectfifo.subview.access %872[3] : !aie.objectfifosubview<memref<32x32xbf16>> -> memref<32x32xbf16>
          func.call @zero_bf16_32_64_32(%876) : (memref<32x32xbf16>) -> ()
          %877 = aie.objectfifo.subview.access %872[4] : !aie.objectfifosubview<memref<32x32xbf16>> -> memref<32x32xbf16>
          func.call @zero_bf16_32_64_32(%877) : (memref<32x32xbf16>) -> ()
          %878 = aie.objectfifo.subview.access %872[5] : !aie.objectfifosubview<memref<32x32xbf16>> -> memref<32x32xbf16>
          func.call @zero_bf16_32_64_32(%878) : (memref<32x32xbf16>) -> ()
          %879 = aie.objectfifo.subview.access %872[6] : !aie.objectfifosubview<memref<32x32xbf16>> -> memref<32x32xbf16>
          func.call @zero_bf16_32_64_32(%879) : (memref<32x32xbf16>) -> ()
          %880 = aie.objectfifo.subview.access %872[7] : !aie.objectfifosubview<memref<32x32xbf16>> -> memref<32x32xbf16>
          func.call @zero_bf16_32_64_32(%880) : (memref<32x32xbf16>) -> ()
          %881 = arith.constant 16 : index
          scf.for %882 = %868 to %881 step %869 {
            %883 = aie.objectfifo.acquire @of_11_broadcast_3(Consume, 2) : !aie.objectfifosubview<memref<32x64xbf16>>
            %884 = aie.objectfifo.subview.access %883[0] : !aie.objectfifosubview<memref<32x64xbf16>> -> memref<32x64xbf16>
            %885 = aie.objectfifo.subview.access %883[1] : !aie.objectfifosubview<memref<32x64xbf16>> -> memref<32x64xbf16>
            %886 = arith.constant 8 : index
            scf.for %887 = %868 to %886 step %869 {
              %888 = arith.constant 1 : index
              %889 = arith.constant 0 : index
              %890 = arith.muli %888, %887 : index
              %891 = arith.addi %889, %890 : index
              %892 = arith.muli %888, %886 : index
              %893 = scf.index_switch %891 -> memref<32x32xbf16>
              case 0 {
                scf.yield %873 : memref<32x32xbf16>
              }
              case 1 {
                scf.yield %874 : memref<32x32xbf16>
              }
              case 2 {
                scf.yield %875 : memref<32x32xbf16>
              }
              case 3 {
                scf.yield %876 : memref<32x32xbf16>
              }
              case 4 {
                scf.yield %877 : memref<32x32xbf16>
              }
              case 5 {
                scf.yield %878 : memref<32x32xbf16>
              }
              case 6 {
                scf.yield %879 : memref<32x32xbf16>
              }
              case 7 {
                scf.yield %880 : memref<32x32xbf16>
              }
              default {
                scf.yield %873 : memref<32x32xbf16>
              }
              %894 = arith.constant 2 : index
              scf.for %895 = %868 to %894 step %869 {
                %896 = arith.constant 1 : index
                %897 = arith.constant 0 : index
                %898 = arith.muli %896, %895 : index
                %899 = arith.addi %897, %898 : index
                %900 = arith.muli %896, %894 : index
                %901 = scf.index_switch %899 -> memref<32x64xbf16>
                case 0 {
                  scf.yield %884 : memref<32x64xbf16>
                }
                case 1 {
                  scf.yield %885 : memref<32x64xbf16>
                }
                default {
                  scf.yield %884 : memref<32x64xbf16>
                }
                %902 = aie.objectfifo.acquire @of_7_broadcast_0_0(Consume, 1) : !aie.objectfifosubview<memref<64x32xbf16>>
                %903 = aie.objectfifo.subview.access %902[0] : !aie.objectfifosubview<memref<64x32xbf16>> -> memref<64x32xbf16>
                %904 = arith.constant 1 : index
                %905 = arith.constant 0 : index
                %906 = scf.index_switch %905 -> memref<64x32xbf16>
                case 0 {
                  scf.yield %903 : memref<64x32xbf16>
                }
                default {
                  scf.yield %903 : memref<64x32xbf16>
                }
                func.call @matmul_bf16_bf16_32_64_32(%901, %906, %893) : (memref<32x64xbf16>, memref<64x32xbf16>, memref<32x32xbf16>) -> ()
                aie.objectfifo.release @of_7_broadcast_0_0(Consume, 1)
              }
            }
            aie.objectfifo.release @of_11_broadcast_3(Consume, 2)
          }
          aie.objectfifo.release @of_12_join_0_3(Produce, 8)
        }
      }
      aie.end
    } { link_with="mm_32_64_32.o" }
    %907 = aie.core(%36) {
      %908 = arith.constant 0 : index
      %909 = arith.constant 1 : index
      %910 = arith.constant 4294967295 : index
      scf.for %911 = %908 to %910 step %909 {
        %912 = arith.constant 0 : index
        %913 = arith.constant 1 : index
        %914 = arith.constant 2 : index
        scf.for %915 = %912 to %914 step %913 {
          %916 = aie.objectfifo.acquire @of_12_join_1_0(Produce, 8) : !aie.objectfifosubview<memref<32x32xbf16>>
          %917 = aie.objectfifo.subview.access %916[0] : !aie.objectfifosubview<memref<32x32xbf16>> -> memref<32x32xbf16>
          func.call @zero_bf16_32_64_32(%917) : (memref<32x32xbf16>) -> ()
          %918 = aie.objectfifo.subview.access %916[1] : !aie.objectfifosubview<memref<32x32xbf16>> -> memref<32x32xbf16>
          func.call @zero_bf16_32_64_32(%918) : (memref<32x32xbf16>) -> ()
          %919 = aie.objectfifo.subview.access %916[2] : !aie.objectfifosubview<memref<32x32xbf16>> -> memref<32x32xbf16>
          func.call @zero_bf16_32_64_32(%919) : (memref<32x32xbf16>) -> ()
          %920 = aie.objectfifo.subview.access %916[3] : !aie.objectfifosubview<memref<32x32xbf16>> -> memref<32x32xbf16>
          func.call @zero_bf16_32_64_32(%920) : (memref<32x32xbf16>) -> ()
          %921 = aie.objectfifo.subview.access %916[4] : !aie.objectfifosubview<memref<32x32xbf16>> -> memref<32x32xbf16>
          func.call @zero_bf16_32_64_32(%921) : (memref<32x32xbf16>) -> ()
          %922 = aie.objectfifo.subview.access %916[5] : !aie.objectfifosubview<memref<32x32xbf16>> -> memref<32x32xbf16>
          func.call @zero_bf16_32_64_32(%922) : (memref<32x32xbf16>) -> ()
          %923 = aie.objectfifo.subview.access %916[6] : !aie.objectfifosubview<memref<32x32xbf16>> -> memref<32x32xbf16>
          func.call @zero_bf16_32_64_32(%923) : (memref<32x32xbf16>) -> ()
          %924 = aie.objectfifo.subview.access %916[7] : !aie.objectfifosubview<memref<32x32xbf16>> -> memref<32x32xbf16>
          func.call @zero_bf16_32_64_32(%924) : (memref<32x32xbf16>) -> ()
          %925 = arith.constant 16 : index
          scf.for %926 = %912 to %925 step %913 {
            %927 = aie.objectfifo.acquire @of_11_broadcast_0(Consume, 2) : !aie.objectfifosubview<memref<32x64xbf16>>
            %928 = aie.objectfifo.subview.access %927[0] : !aie.objectfifosubview<memref<32x64xbf16>> -> memref<32x64xbf16>
            %929 = aie.objectfifo.subview.access %927[1] : !aie.objectfifosubview<memref<32x64xbf16>> -> memref<32x64xbf16>
            %930 = arith.constant 8 : index
            scf.for %931 = %912 to %930 step %913 {
              %932 = arith.constant 1 : index
              %933 = arith.constant 0 : index
              %934 = arith.muli %932, %931 : index
              %935 = arith.addi %933, %934 : index
              %936 = arith.muli %932, %930 : index
              %937 = scf.index_switch %935 -> memref<32x32xbf16>
              case 0 {
                scf.yield %917 : memref<32x32xbf16>
              }
              case 1 {
                scf.yield %918 : memref<32x32xbf16>
              }
              case 2 {
                scf.yield %919 : memref<32x32xbf16>
              }
              case 3 {
                scf.yield %920 : memref<32x32xbf16>
              }
              case 4 {
                scf.yield %921 : memref<32x32xbf16>
              }
              case 5 {
                scf.yield %922 : memref<32x32xbf16>
              }
              case 6 {
                scf.yield %923 : memref<32x32xbf16>
              }
              case 7 {
                scf.yield %924 : memref<32x32xbf16>
              }
              default {
                scf.yield %917 : memref<32x32xbf16>
              }
              %938 = arith.constant 2 : index
              scf.for %939 = %912 to %938 step %913 {
                %940 = arith.constant 1 : index
                %941 = arith.constant 0 : index
                %942 = arith.muli %940, %939 : index
                %943 = arith.addi %941, %942 : index
                %944 = arith.muli %940, %938 : index
                %945 = scf.index_switch %943 -> memref<32x64xbf16>
                case 0 {
                  scf.yield %928 : memref<32x64xbf16>
                }
                case 1 {
                  scf.yield %929 : memref<32x64xbf16>
                }
                default {
                  scf.yield %928 : memref<32x64xbf16>
                }
                %946 = aie.objectfifo.acquire @of_7_broadcast_1_0(Consume, 1) : !aie.objectfifosubview<memref<64x32xbf16>>
                %947 = aie.objectfifo.subview.access %946[0] : !aie.objectfifosubview<memref<64x32xbf16>> -> memref<64x32xbf16>
                %948 = arith.constant 1 : index
                %949 = arith.constant 0 : index
                %950 = scf.index_switch %949 -> memref<64x32xbf16>
                case 0 {
                  scf.yield %947 : memref<64x32xbf16>
                }
                default {
                  scf.yield %947 : memref<64x32xbf16>
                }
                func.call @matmul_bf16_bf16_32_64_32(%945, %950, %937) : (memref<32x64xbf16>, memref<64x32xbf16>, memref<32x32xbf16>) -> ()
                aie.objectfifo.release @of_7_broadcast_1_0(Consume, 1)
              }
            }
            aie.objectfifo.release @of_11_broadcast_0(Consume, 2)
          }
          aie.objectfifo.release @of_12_join_1_0(Produce, 8)
        }
      }
      aie.end
    } { link_with="mm_32_64_32.o" }
    %951 = aie.core(%37) {
      %952 = arith.constant 0 : index
      %953 = arith.constant 1 : index
      %954 = arith.constant 4294967295 : index
      scf.for %955 = %952 to %954 step %953 {
        %956 = arith.constant 0 : index
        %957 = arith.constant 1 : index
        %958 = arith.constant 2 : index
        scf.for %959 = %956 to %958 step %957 {
          %960 = aie.objectfifo.acquire @of_12_join_1_1(Produce, 8) : !aie.objectfifosubview<memref<32x32xbf16>>
          %961 = aie.objectfifo.subview.access %960[0] : !aie.objectfifosubview<memref<32x32xbf16>> -> memref<32x32xbf16>
          func.call @zero_bf16_32_64_32(%961) : (memref<32x32xbf16>) -> ()
          %962 = aie.objectfifo.subview.access %960[1] : !aie.objectfifosubview<memref<32x32xbf16>> -> memref<32x32xbf16>
          func.call @zero_bf16_32_64_32(%962) : (memref<32x32xbf16>) -> ()
          %963 = aie.objectfifo.subview.access %960[2] : !aie.objectfifosubview<memref<32x32xbf16>> -> memref<32x32xbf16>
          func.call @zero_bf16_32_64_32(%963) : (memref<32x32xbf16>) -> ()
          %964 = aie.objectfifo.subview.access %960[3] : !aie.objectfifosubview<memref<32x32xbf16>> -> memref<32x32xbf16>
          func.call @zero_bf16_32_64_32(%964) : (memref<32x32xbf16>) -> ()
          %965 = aie.objectfifo.subview.access %960[4] : !aie.objectfifosubview<memref<32x32xbf16>> -> memref<32x32xbf16>
          func.call @zero_bf16_32_64_32(%965) : (memref<32x32xbf16>) -> ()
          %966 = aie.objectfifo.subview.access %960[5] : !aie.objectfifosubview<memref<32x32xbf16>> -> memref<32x32xbf16>
          func.call @zero_bf16_32_64_32(%966) : (memref<32x32xbf16>) -> ()
          %967 = aie.objectfifo.subview.access %960[6] : !aie.objectfifosubview<memref<32x32xbf16>> -> memref<32x32xbf16>
          func.call @zero_bf16_32_64_32(%967) : (memref<32x32xbf16>) -> ()
          %968 = aie.objectfifo.subview.access %960[7] : !aie.objectfifosubview<memref<32x32xbf16>> -> memref<32x32xbf16>
          func.call @zero_bf16_32_64_32(%968) : (memref<32x32xbf16>) -> ()
          %969 = arith.constant 16 : index
          scf.for %970 = %956 to %969 step %957 {
            %971 = aie.objectfifo.acquire @of_11_broadcast_1(Consume, 2) : !aie.objectfifosubview<memref<32x64xbf16>>
            %972 = aie.objectfifo.subview.access %971[0] : !aie.objectfifosubview<memref<32x64xbf16>> -> memref<32x64xbf16>
            %973 = aie.objectfifo.subview.access %971[1] : !aie.objectfifosubview<memref<32x64xbf16>> -> memref<32x64xbf16>
            %974 = arith.constant 8 : index
            scf.for %975 = %956 to %974 step %957 {
              %976 = arith.constant 1 : index
              %977 = arith.constant 0 : index
              %978 = arith.muli %976, %975 : index
              %979 = arith.addi %977, %978 : index
              %980 = arith.muli %976, %974 : index
              %981 = scf.index_switch %979 -> memref<32x32xbf16>
              case 0 {
                scf.yield %961 : memref<32x32xbf16>
              }
              case 1 {
                scf.yield %962 : memref<32x32xbf16>
              }
              case 2 {
                scf.yield %963 : memref<32x32xbf16>
              }
              case 3 {
                scf.yield %964 : memref<32x32xbf16>
              }
              case 4 {
                scf.yield %965 : memref<32x32xbf16>
              }
              case 5 {
                scf.yield %966 : memref<32x32xbf16>
              }
              case 6 {
                scf.yield %967 : memref<32x32xbf16>
              }
              case 7 {
                scf.yield %968 : memref<32x32xbf16>
              }
              default {
                scf.yield %961 : memref<32x32xbf16>
              }
              %982 = arith.constant 2 : index
              scf.for %983 = %956 to %982 step %957 {
                %984 = arith.constant 1 : index
                %985 = arith.constant 0 : index
                %986 = arith.muli %984, %983 : index
                %987 = arith.addi %985, %986 : index
                %988 = arith.muli %984, %982 : index
                %989 = scf.index_switch %987 -> memref<32x64xbf16>
                case 0 {
                  scf.yield %972 : memref<32x64xbf16>
                }
                case 1 {
                  scf.yield %973 : memref<32x64xbf16>
                }
                default {
                  scf.yield %972 : memref<32x64xbf16>
                }
                %990 = aie.objectfifo.acquire @of_7_broadcast_1_0(Consume, 1) : !aie.objectfifosubview<memref<64x32xbf16>>
                %991 = aie.objectfifo.subview.access %990[0] : !aie.objectfifosubview<memref<64x32xbf16>> -> memref<64x32xbf16>
                %992 = arith.constant 1 : index
                %993 = arith.constant 0 : index
                %994 = scf.index_switch %993 -> memref<64x32xbf16>
                case 0 {
                  scf.yield %991 : memref<64x32xbf16>
                }
                default {
                  scf.yield %991 : memref<64x32xbf16>
                }
                func.call @matmul_bf16_bf16_32_64_32(%989, %994, %981) : (memref<32x64xbf16>, memref<64x32xbf16>, memref<32x32xbf16>) -> ()
                aie.objectfifo.release @of_7_broadcast_1_0(Consume, 1)
              }
            }
            aie.objectfifo.release @of_11_broadcast_1(Consume, 2)
          }
          aie.objectfifo.release @of_12_join_1_1(Produce, 8)
        }
      }
      aie.end
    } { link_with="mm_32_64_32.o" }
    %995 = aie.core(%38) {
      %996 = arith.constant 0 : index
      %997 = arith.constant 1 : index
      %998 = arith.constant 4294967295 : index
      scf.for %999 = %996 to %998 step %997 {
        %1000 = arith.constant 0 : index
        %1001 = arith.constant 1 : index
        %1002 = arith.constant 2 : index
        scf.for %1003 = %1000 to %1002 step %1001 {
          %1004 = aie.objectfifo.acquire @of_12_join_1_2(Produce, 8) : !aie.objectfifosubview<memref<32x32xbf16>>
          %1005 = aie.objectfifo.subview.access %1004[0] : !aie.objectfifosubview<memref<32x32xbf16>> -> memref<32x32xbf16>
          func.call @zero_bf16_32_64_32(%1005) : (memref<32x32xbf16>) -> ()
          %1006 = aie.objectfifo.subview.access %1004[1] : !aie.objectfifosubview<memref<32x32xbf16>> -> memref<32x32xbf16>
          func.call @zero_bf16_32_64_32(%1006) : (memref<32x32xbf16>) -> ()
          %1007 = aie.objectfifo.subview.access %1004[2] : !aie.objectfifosubview<memref<32x32xbf16>> -> memref<32x32xbf16>
          func.call @zero_bf16_32_64_32(%1007) : (memref<32x32xbf16>) -> ()
          %1008 = aie.objectfifo.subview.access %1004[3] : !aie.objectfifosubview<memref<32x32xbf16>> -> memref<32x32xbf16>
          func.call @zero_bf16_32_64_32(%1008) : (memref<32x32xbf16>) -> ()
          %1009 = aie.objectfifo.subview.access %1004[4] : !aie.objectfifosubview<memref<32x32xbf16>> -> memref<32x32xbf16>
          func.call @zero_bf16_32_64_32(%1009) : (memref<32x32xbf16>) -> ()
          %1010 = aie.objectfifo.subview.access %1004[5] : !aie.objectfifosubview<memref<32x32xbf16>> -> memref<32x32xbf16>
          func.call @zero_bf16_32_64_32(%1010) : (memref<32x32xbf16>) -> ()
          %1011 = aie.objectfifo.subview.access %1004[6] : !aie.objectfifosubview<memref<32x32xbf16>> -> memref<32x32xbf16>
          func.call @zero_bf16_32_64_32(%1011) : (memref<32x32xbf16>) -> ()
          %1012 = aie.objectfifo.subview.access %1004[7] : !aie.objectfifosubview<memref<32x32xbf16>> -> memref<32x32xbf16>
          func.call @zero_bf16_32_64_32(%1012) : (memref<32x32xbf16>) -> ()
          %1013 = arith.constant 16 : index
          scf.for %1014 = %1000 to %1013 step %1001 {
            %1015 = aie.objectfifo.acquire @of_11_broadcast_2(Consume, 2) : !aie.objectfifosubview<memref<32x64xbf16>>
            %1016 = aie.objectfifo.subview.access %1015[0] : !aie.objectfifosubview<memref<32x64xbf16>> -> memref<32x64xbf16>
            %1017 = aie.objectfifo.subview.access %1015[1] : !aie.objectfifosubview<memref<32x64xbf16>> -> memref<32x64xbf16>
            %1018 = arith.constant 8 : index
            scf.for %1019 = %1000 to %1018 step %1001 {
              %1020 = arith.constant 1 : index
              %1021 = arith.constant 0 : index
              %1022 = arith.muli %1020, %1019 : index
              %1023 = arith.addi %1021, %1022 : index
              %1024 = arith.muli %1020, %1018 : index
              %1025 = scf.index_switch %1023 -> memref<32x32xbf16>
              case 0 {
                scf.yield %1005 : memref<32x32xbf16>
              }
              case 1 {
                scf.yield %1006 : memref<32x32xbf16>
              }
              case 2 {
                scf.yield %1007 : memref<32x32xbf16>
              }
              case 3 {
                scf.yield %1008 : memref<32x32xbf16>
              }
              case 4 {
                scf.yield %1009 : memref<32x32xbf16>
              }
              case 5 {
                scf.yield %1010 : memref<32x32xbf16>
              }
              case 6 {
                scf.yield %1011 : memref<32x32xbf16>
              }
              case 7 {
                scf.yield %1012 : memref<32x32xbf16>
              }
              default {
                scf.yield %1005 : memref<32x32xbf16>
              }
              %1026 = arith.constant 2 : index
              scf.for %1027 = %1000 to %1026 step %1001 {
                %1028 = arith.constant 1 : index
                %1029 = arith.constant 0 : index
                %1030 = arith.muli %1028, %1027 : index
                %1031 = arith.addi %1029, %1030 : index
                %1032 = arith.muli %1028, %1026 : index
                %1033 = scf.index_switch %1031 -> memref<32x64xbf16>
                case 0 {
                  scf.yield %1016 : memref<32x64xbf16>
                }
                case 1 {
                  scf.yield %1017 : memref<32x64xbf16>
                }
                default {
                  scf.yield %1016 : memref<32x64xbf16>
                }
                %1034 = aie.objectfifo.acquire @of_7_broadcast_1_0(Consume, 1) : !aie.objectfifosubview<memref<64x32xbf16>>
                %1035 = aie.objectfifo.subview.access %1034[0] : !aie.objectfifosubview<memref<64x32xbf16>> -> memref<64x32xbf16>
                %1036 = arith.constant 1 : index
                %1037 = arith.constant 0 : index
                %1038 = scf.index_switch %1037 -> memref<64x32xbf16>
                case 0 {
                  scf.yield %1035 : memref<64x32xbf16>
                }
                default {
                  scf.yield %1035 : memref<64x32xbf16>
                }
                func.call @matmul_bf16_bf16_32_64_32(%1033, %1038, %1025) : (memref<32x64xbf16>, memref<64x32xbf16>, memref<32x32xbf16>) -> ()
                aie.objectfifo.release @of_7_broadcast_1_0(Consume, 1)
              }
            }
            aie.objectfifo.release @of_11_broadcast_2(Consume, 2)
          }
          aie.objectfifo.release @of_12_join_1_2(Produce, 8)
        }
      }
      aie.end
    } { link_with="mm_32_64_32.o" }
    %1039 = aie.core(%39) {
      %1040 = arith.constant 0 : index
      %1041 = arith.constant 1 : index
      %1042 = arith.constant 4294967295 : index
      scf.for %1043 = %1040 to %1042 step %1041 {
        %1044 = arith.constant 0 : index
        %1045 = arith.constant 1 : index
        %1046 = arith.constant 2 : index
        scf.for %1047 = %1044 to %1046 step %1045 {
          %1048 = aie.objectfifo.acquire @of_12_join_1_3(Produce, 8) : !aie.objectfifosubview<memref<32x32xbf16>>
          %1049 = aie.objectfifo.subview.access %1048[0] : !aie.objectfifosubview<memref<32x32xbf16>> -> memref<32x32xbf16>
          func.call @zero_bf16_32_64_32(%1049) : (memref<32x32xbf16>) -> ()
          %1050 = aie.objectfifo.subview.access %1048[1] : !aie.objectfifosubview<memref<32x32xbf16>> -> memref<32x32xbf16>
          func.call @zero_bf16_32_64_32(%1050) : (memref<32x32xbf16>) -> ()
          %1051 = aie.objectfifo.subview.access %1048[2] : !aie.objectfifosubview<memref<32x32xbf16>> -> memref<32x32xbf16>
          func.call @zero_bf16_32_64_32(%1051) : (memref<32x32xbf16>) -> ()
          %1052 = aie.objectfifo.subview.access %1048[3] : !aie.objectfifosubview<memref<32x32xbf16>> -> memref<32x32xbf16>
          func.call @zero_bf16_32_64_32(%1052) : (memref<32x32xbf16>) -> ()
          %1053 = aie.objectfifo.subview.access %1048[4] : !aie.objectfifosubview<memref<32x32xbf16>> -> memref<32x32xbf16>
          func.call @zero_bf16_32_64_32(%1053) : (memref<32x32xbf16>) -> ()
          %1054 = aie.objectfifo.subview.access %1048[5] : !aie.objectfifosubview<memref<32x32xbf16>> -> memref<32x32xbf16>
          func.call @zero_bf16_32_64_32(%1054) : (memref<32x32xbf16>) -> ()
          %1055 = aie.objectfifo.subview.access %1048[6] : !aie.objectfifosubview<memref<32x32xbf16>> -> memref<32x32xbf16>
          func.call @zero_bf16_32_64_32(%1055) : (memref<32x32xbf16>) -> ()
          %1056 = aie.objectfifo.subview.access %1048[7] : !aie.objectfifosubview<memref<32x32xbf16>> -> memref<32x32xbf16>
          func.call @zero_bf16_32_64_32(%1056) : (memref<32x32xbf16>) -> ()
          %1057 = arith.constant 16 : index
          scf.for %1058 = %1044 to %1057 step %1045 {
            %1059 = aie.objectfifo.acquire @of_11_broadcast_3(Consume, 2) : !aie.objectfifosubview<memref<32x64xbf16>>
            %1060 = aie.objectfifo.subview.access %1059[0] : !aie.objectfifosubview<memref<32x64xbf16>> -> memref<32x64xbf16>
            %1061 = aie.objectfifo.subview.access %1059[1] : !aie.objectfifosubview<memref<32x64xbf16>> -> memref<32x64xbf16>
            %1062 = arith.constant 8 : index
            scf.for %1063 = %1044 to %1062 step %1045 {
              %1064 = arith.constant 1 : index
              %1065 = arith.constant 0 : index
              %1066 = arith.muli %1064, %1063 : index
              %1067 = arith.addi %1065, %1066 : index
              %1068 = arith.muli %1064, %1062 : index
              %1069 = scf.index_switch %1067 -> memref<32x32xbf16>
              case 0 {
                scf.yield %1049 : memref<32x32xbf16>
              }
              case 1 {
                scf.yield %1050 : memref<32x32xbf16>
              }
              case 2 {
                scf.yield %1051 : memref<32x32xbf16>
              }
              case 3 {
                scf.yield %1052 : memref<32x32xbf16>
              }
              case 4 {
                scf.yield %1053 : memref<32x32xbf16>
              }
              case 5 {
                scf.yield %1054 : memref<32x32xbf16>
              }
              case 6 {
                scf.yield %1055 : memref<32x32xbf16>
              }
              case 7 {
                scf.yield %1056 : memref<32x32xbf16>
              }
              default {
                scf.yield %1049 : memref<32x32xbf16>
              }
              %1070 = arith.constant 2 : index
              scf.for %1071 = %1044 to %1070 step %1045 {
                %1072 = arith.constant 1 : index
                %1073 = arith.constant 0 : index
                %1074 = arith.muli %1072, %1071 : index
                %1075 = arith.addi %1073, %1074 : index
                %1076 = arith.muli %1072, %1070 : index
                %1077 = scf.index_switch %1075 -> memref<32x64xbf16>
                case 0 {
                  scf.yield %1060 : memref<32x64xbf16>
                }
                case 1 {
                  scf.yield %1061 : memref<32x64xbf16>
                }
                default {
                  scf.yield %1060 : memref<32x64xbf16>
                }
                %1078 = aie.objectfifo.acquire @of_7_broadcast_1_0(Consume, 1) : !aie.objectfifosubview<memref<64x32xbf16>>
                %1079 = aie.objectfifo.subview.access %1078[0] : !aie.objectfifosubview<memref<64x32xbf16>> -> memref<64x32xbf16>
                %1080 = arith.constant 1 : index
                %1081 = arith.constant 0 : index
                %1082 = scf.index_switch %1081 -> memref<64x32xbf16>
                case 0 {
                  scf.yield %1079 : memref<64x32xbf16>
                }
                default {
                  scf.yield %1079 : memref<64x32xbf16>
                }
                func.call @matmul_bf16_bf16_32_64_32(%1077, %1082, %1069) : (memref<32x64xbf16>, memref<64x32xbf16>, memref<32x32xbf16>) -> ()
                aie.objectfifo.release @of_7_broadcast_1_0(Consume, 1)
              }
            }
            aie.objectfifo.release @of_11_broadcast_3(Consume, 2)
          }
          aie.objectfifo.release @of_12_join_1_3(Produce, 8)
        }
      }
      aie.end
    } { link_with="mm_32_64_32.o" }
    aie.objectfifo @of_0_mem_0(%1, {%8}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<32x32xbf16>>
    aie.objectfifo @of_0_mem_1(%2, {%9}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<32x32xbf16>>
    aie.objectfifo @of_0_mem_2(%4, {%10}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<32x32xbf16>>
    aie.objectfifo @of_0_mem_3(%5, {%11}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<32x32xbf16>>
    aie.objectfifo @of_1_mem_0(%7, {%12}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<32x64xbf16>>
    aie.objectfifo @of_1_mem_1(%3, {%13}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<32x64xbf16>>
    aie.objectfifo @of_2_mem_0(%0, {%14}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<32x64xbf16>>
    aie.objectfifo @of_2_mem_1(%6, {%15}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<32x64xbf16>>
    aie.objectfifo @of_3_mem_0(%4, {%10}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x32xbf16>>
    aie.objectfifo @of_3_mem_1(%5, {%11}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x32xbf16>>
    aie.objectfifo @of_4_broadcast_0_0(%8 dimensionsToStream [<size = 8, stride = 128>, <size = 4, stride = 8>, <size = 4, stride = 32>, <size = 8, stride = 1>], {%24, %16, %20, %28}, [2 : i32, 2 : i32, 2 : i32, 2 : i32, 2 : i32]) : !aie.objectfifo<memref<32x32xbf16>>
    aie.objectfifo.link [@of_0_mem_0] -> [@of_4_broadcast_0_0]([] [0])
    aie.objectfifo @of_4_broadcast_1_0(%9 dimensionsToStream [<size = 8, stride = 128>, <size = 4, stride = 8>, <size = 4, stride = 32>, <size = 8, stride = 1>], {%17, %25, %21, %29}, [2 : i32, 2 : i32, 2 : i32, 2 : i32, 2 : i32]) : !aie.objectfifo<memref<32x32xbf16>>
    aie.objectfifo.link [@of_0_mem_1] -> [@of_4_broadcast_1_0]([] [0])
    aie.objectfifo @of_4_broadcast_2_0(%10 dimensionsToStream [<size = 8, stride = 128>, <size = 4, stride = 8>, <size = 4, stride = 32>, <size = 8, stride = 1>], {%26, %18, %30, %22}, [2 : i32, 2 : i32, 2 : i32, 2 : i32, 2 : i32]) : !aie.objectfifo<memref<32x32xbf16>>
    aie.objectfifo.link [@of_0_mem_2] -> [@of_4_broadcast_2_0]([] [0])
    aie.objectfifo @of_4_broadcast_3_0(%11 dimensionsToStream [<size = 8, stride = 128>, <size = 4, stride = 8>, <size = 4, stride = 32>, <size = 8, stride = 1>], {%19, %27, %31, %23}, [2 : i32, 2 : i32, 2 : i32, 2 : i32, 2 : i32]) : !aie.objectfifo<memref<32x32xbf16>>
    aie.objectfifo.link [@of_0_mem_3] -> [@of_4_broadcast_3_0]([] [0])
    aie.objectfifo @of_5_broadcast_0_0(%12 dimensionsToStream [<size = 4, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%16, %17, %18, %19}, [2 : i32, 2 : i32, 2 : i32, 2 : i32, 2 : i32]) : !aie.objectfifo<memref<32x64xbf16>>
    aie.objectfifo.link [@of_1_mem_0] -> [@of_5_broadcast_0_0]([] [0])
    aie.objectfifo @of_5_broadcast_1_0(%13 dimensionsToStream [<size = 4, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%20, %21, %22, %23}, [2 : i32, 2 : i32, 2 : i32, 2 : i32, 2 : i32]) : !aie.objectfifo<memref<32x64xbf16>>
    aie.objectfifo.link [@of_1_mem_1] -> [@of_5_broadcast_1_0]([] [0])
    aie.objectfifo @of_6_broadcast_0_0(%14 dimensionsToStream [<size = 4, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%24, %25, %26, %27}, [2 : i32, 2 : i32, 2 : i32, 2 : i32, 2 : i32]) : !aie.objectfifo<memref<32x64xbf16>>
    aie.objectfifo.link [@of_2_mem_0] -> [@of_6_broadcast_0_0]([] [0])
    aie.objectfifo @of_6_broadcast_1_0(%15 dimensionsToStream [<size = 4, stride = 512>, <size = 8, stride = 8>, <size = 8, stride = 64>, <size = 8, stride = 1>], {%28, %29, %30, %31}, [2 : i32, 2 : i32, 2 : i32, 2 : i32, 2 : i32]) : !aie.objectfifo<memref<32x64xbf16>>
    aie.objectfifo.link [@of_2_mem_1] -> [@of_6_broadcast_1_0]([] [0])
    aie.objectfifo @of_7_broadcast_0_0(%10 dimensionsToStream [<size = 8, stride = 256>, <size = 4, stride = 8>, <size = 8, stride = 32>, <size = 8, stride = 1>], {%32, %33, %34, %35}, [2 : i32, 2 : i32, 2 : i32, 2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x32xbf16>>
    aie.objectfifo.link [@of_3_mem_0] -> [@of_7_broadcast_0_0]([] [0])
    aie.objectfifo @of_7_broadcast_1_0(%11 dimensionsToStream [<size = 8, stride = 256>, <size = 4, stride = 8>, <size = 8, stride = 32>, <size = 8, stride = 1>], {%36, %37, %38, %39}, [2 : i32, 2 : i32, 2 : i32, 2 : i32, 2 : i32]) : !aie.objectfifo<memref<64x32xbf16>>
    aie.objectfifo.link [@of_3_mem_1] -> [@of_7_broadcast_1_0]([] [0])
    aie.objectfifo @of_8_switch_join_0_0(%16, {%40}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<32x64xbf16>>
    aie.objectfifo @of_8_switch_join_0_1(%20, {%40}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<32x64xbf16>>
    aie.objectfifo @of_8_switch_join_1_0(%17, {%41}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<32x64xbf16>>
    aie.objectfifo @of_8_switch_join_1_1(%21, {%41}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<32x64xbf16>>
    aie.objectfifo @of_8_switch_join_2_0(%18, {%42}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<32x64xbf16>>
    aie.objectfifo @of_8_switch_join_2_1(%22, {%42}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<32x64xbf16>>
    aie.objectfifo @of_8_switch_join_3_0(%19, {%43}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<32x64xbf16>>
    aie.objectfifo @of_8_switch_join_3_1(%23, {%43}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<32x64xbf16>>
    aie.objectfifo @of_9_switch_join_0_0(%24, {%44}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<32x64xbf16>>
    aie.objectfifo @of_9_switch_join_0_1(%28, {%44}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<32x64xbf16>>
    aie.objectfifo @of_9_switch_join_1_0(%25, {%45}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<32x64xbf16>>
    aie.objectfifo @of_9_switch_join_1_1(%29, {%45}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<32x64xbf16>>
    aie.objectfifo @of_9_switch_join_2_0(%26, {%46}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<32x64xbf16>>
    aie.objectfifo @of_9_switch_join_2_1(%30, {%46}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<32x64xbf16>>
    aie.objectfifo @of_9_switch_join_3_0(%27, {%47}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<32x64xbf16>>
    aie.objectfifo @of_9_switch_join_3_1(%31, {%47}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<32x64xbf16>>
    aie.objectfifo @of_10_unicast_0(%40, {%44}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<32x64xbf16>>
    aie.objectfifo @of_10_unicast_1(%41, {%45}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<32x64xbf16>>
    aie.objectfifo @of_10_unicast_2(%42, {%46}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<32x64xbf16>>
    aie.objectfifo @of_10_unicast_3(%43, {%47}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<32x64xbf16>>
    aie.objectfifo @of_11_broadcast_0(%44, {%36, %32}, [2 : i32, 2 : i32, 2 : i32]) : !aie.objectfifo<memref<32x64xbf16>>
    aie.objectfifo @of_11_broadcast_1(%45, {%37, %33}, [2 : i32, 2 : i32, 2 : i32]) : !aie.objectfifo<memref<32x64xbf16>>
    aie.objectfifo @of_11_broadcast_2(%46, {%38, %34}, [2 : i32, 2 : i32, 2 : i32]) : !aie.objectfifo<memref<32x64xbf16>>
    aie.objectfifo @of_11_broadcast_3(%47, {%35, %39}, [2 : i32, 2 : i32, 2 : i32]) : !aie.objectfifo<memref<32x64xbf16>>
    aie.objectfifo @of_12_join_0_0(%32, {%15}, [8 : i32, 2 : i32]) : !aie.objectfifo<memref<32x32xbf16>>
    aie.objectfifo @of_12_join_0_1(%33, {%15}, [8 : i32, 2 : i32]) : !aie.objectfifo<memref<32x32xbf16>>
    aie.objectfifo @of_12_join_0_2(%34, {%15}, [8 : i32, 2 : i32]) : !aie.objectfifo<memref<32x32xbf16>>
    aie.objectfifo @of_12_join_0_3(%35, {%15}, [8 : i32, 2 : i32]) : !aie.objectfifo<memref<32x32xbf16>>
    aie.objectfifo @of_12_join_1_0(%36, {%12}, [8 : i32, 2 : i32]) : !aie.objectfifo<memref<32x32xbf16>>
    aie.objectfifo @of_12_join_1_1(%37, {%12}, [8 : i32, 2 : i32]) : !aie.objectfifo<memref<32x32xbf16>>
    aie.objectfifo @of_12_join_1_2(%38, {%12}, [8 : i32, 2 : i32]) : !aie.objectfifo<memref<32x32xbf16>>
    aie.objectfifo @of_12_join_1_3(%39, {%12}, [8 : i32, 2 : i32]) : !aie.objectfifo<memref<32x32xbf16>>
    aie.objectfifo @of_13_mem_0(%15 dimensionsToStream [<size = 8, stride = 128>, <size = 4, stride = 8>, <size = 4, stride = 32>, <size = 8, stride = 1>], {%6}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<8x4x32x32xbf16>>
    aie.objectfifo.link [@of_12_join_0_0, @of_12_join_0_1, @of_12_join_0_2, @of_12_join_0_3] -> [@of_13_mem_0]([0, 8192, 16384, 24576] [])
    aie.objectfifo @of_13_mem_1(%12 dimensionsToStream [<size = 8, stride = 128>, <size = 4, stride = 8>, <size = 4, stride = 32>, <size = 8, stride = 1>], {%7}, [2 : i32, 2 : i32]) : !aie.objectfifo<memref<8x4x32x32xbf16>>
    aie.objectfifo.link [@of_12_join_1_0, @of_12_join_1_1, @of_12_join_1_2, @of_12_join_1_3] -> [@of_13_mem_1]([0, 8192, 16384, 24576] [])
    func.func private @zero_bf16_32_32_64(memref<32x64xbf16>) -> ()
    func.func private @matmul_bf16_bf16_32_32_64(memref<32x32xbf16>, memref<32x64xbf16>, memref<32x64xbf16>) -> ()
    func.func private @zero_bf16_32_64_32(memref<32x32xbf16>) -> ()
    func.func private @matmul_bf16_bf16_32_64_32(memref<32x64xbf16>, memref<64x32xbf16>, memref<32x32xbf16>) -> ()
    func.func private @silu_bf16(memref<32x64xbf16>, memref<32x64xbf16>, i32) -> ()
    func.func private @eltwise_mul_bf16_scalar(memref<32x64xbf16>, memref<32x64xbf16>, memref<32x64xbf16>, i32) -> ()
  }
}