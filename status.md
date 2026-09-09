<!--
SPDX-FileCopyrightText: Copyright (C) 2026 KU Leuven (MICAS). All rights reserved.
SPDX-License-Identifier: Apache-2.0
-->

# swiglu_prefill_stream_front_fused — optimisation status

**914 µs → ~305 µs (3.0x)** NPU time at seq 256 / embedding 512 / hidden 2048 on npu2, whole
array, one fused group, front and down active at the same time. Accuracy 6.91% of elements
outside the test tolerance (was 7.01%; the bf16-vs-fp32 floor). The pytest harness, which
includes the output sync and takes the best of three, reports 320–345 µs. Run-to-run spread is
±5%, occasionally a 30% outlier.

Comparator: `swiglu_prefill_stream` k=1 measures 1246 µs on the same shape (unchanged).

Measured with `NPU-ONLY` = the run handle's own timing, 20 dispatches, median.

## What changed, in order of effect

| # | change | NPU time |
| --- | --- | --- |
| 0 | start of this round (16 cores per layer, sequence tile 16) | 914 µs |
| 1 | `w_front` blocked in DDR: `[hidden/64][embedding][2][64]`; one 4 MB contiguous read | ~750 µs |
| 2 | single-group operator dispatched as a plain xclbin (`dispatch="separate"`) with pre-loaded kernel handles, instead of the full-ELF sequence | ~420 µs |
| 3 | front split over hidden-block groups (D0 8 × D3 2, sequence tile 32), intermediate joined in a memory tile, down split D0 8 × output 2 | 444 µs (no gain: input re-fetched per block) |
| 4 | input held in the memory tiles for the whole run and replayed to the cores (`repeat_count`) | 318 µs |
| 5 | `w_down` blocked in DDR: `[out group][out tile][hidden group][block][64][64]`, 8 KB contiguous per kernel tile | **~305 µs** |

**1. Weight layout.** The parser gives the front a 6-D iteration space `(m, k, t, n_h, n_l,
n_i)` and every operand is a plain projection of it (`w_front[n_h][n_l][k][2][n_i]`, result
`[m][n_h][n_l][n_i]`), so stream-dse derives the DMAs without any floordiv/mod. The DDR read of
the weights became one contiguous run per group. This alone was worth less than expected: the
old design was bound by its single memtile→core stream, not by DDR granularity (a two-shim join
into the same memtile, tested by rewriting the MLIR, changed nothing).

**2. Dispatch.** The full-ELF sequence (`aiex.configure @op … ; aiex.configure @reset_device`)
reconfigures and resets all 48 tiles on *every* run: ~370 µs against ~340 µs of array time. A
single group is one design, so `SwiGLUPrefillStreamFrontFused` now uses the sequence's
`"separate"` (xclbin) dispatch unless tracing is on (trace buffers are sequence arguments).
`SequenceXclbinCallable` also keeps the loaded kernel handle instead of re-resolving it per
call (33 µs). The remaining fixed cost is ~45 µs of XRT dispatch.

**3. Hidden split.** With every front core needing all 4 MB of weights through one broadcast
stream (8 B per cycle at the 1.81 GHz array clock: 290 µs), the only lever was fewer bytes per
stream. The front is split D0 8 × hidden-group 2, each group's 2 MB broadcast from its own
memory tile, sequence tile 32 (`front_fused.cc` at `DIM_M=32`). Each down core takes both
groups' blocks of its rows through a **memory-tile join** whose output is broadcast to the two
down cores of its output half; the joined element holds both blocks and `mm_join.cc` offsets
`A` by the block index the generated code passes as an extra `i32`. See *stream-dse changes*.

**4. Input residency.** Once the front's core held 32 rows, the input (32 KB) no longer fit
next to the weights in core memory, and stream-dse's model tied a memory tile's reuse to its
reader's, so the allocator re-fetched the input from DDR for every hidden block: 4 MB of extra
traffic. The NPU's aggregate DDR read bandwidth (~30–38 GB/s over all shims) is what bounds the
design at that point — with both kernels stubbed out the run still took 400 µs. The memory tile
now holds the input once and replays it (`STREAM_MEMTILE_REPLAY`, object fifo `repeat_count`).

**5. `w_down`.** Its tiles were 128-byte runs at 1 KB stride; blocked, each tile is one 8 KB
run. The output-column split is now explicit dims (`[m][tile][group][64]`) rather than a
convention of the codegen.

## Where the time goes now

Bound by data movement. With both kernels stubbed out the run takes ~300 µs; the kernels add
~10 µs. NPU time scales ~110 µs per 1024 of hidden (2 MB `w_front` + 1 MB `w_down`) with a
~100 µs intercept (~45 µs XRT dispatch, the rest pipeline fill/drain, input load and output
drain). At hidden 2048 that is 6 MB of weights in ~200 µs: ~30 GB/s aggregate, near what the
NPU gets from DDR. The per-stream limit (2 MB per group at 14.5 GB/s = 145 µs) is no longer
the wall.

Traces do not route for this design (the memory-tile joins take the horizontal stream channels
the trace packet flow needs; every traced tile fails "Unable to find a legal routing"), so the
figures above come from stubbing kernels / rewriting DMA descriptors in the generated MLIR and
from scaling experiments, not from the trace unit.

## stream-dse changes (local fork, uncommitted)

* `aie_convert_ofs.py`
  * `compute_to_compute`: a join that is also a broadcast is staged in a memory tile
    (`compute_to_compute_memtile_join`): one fifo per producer into the tile, a join link into
    one element holding every block, broadcast to the consumers. The memory tile is picked by
    free input DMA channels (six per tile), nearest to the endpoints.
  * `generate_memtile_join`: the consumer acquires the joined element at the reuse scope and
    passes the join loop's index to the kernel as an extra `i32` operand.
  * `compute_to_mem`: joins over several dimensions at once (the down's row group × output
    half).
  * `shim_to_mem`: the memory tile's element includes the loops its consumers take spatially
    (`distributed_shape`); a tensor fetched once has depth 1 (each buffer costs a descriptor
    per block handed on; a memory tile has 48).
  * `mem_to_compute`: `repeat_count` = product of the loops the tile holds a tensor across
    that the core re-reads (`replay_count`).
  * `RealizeLinks`: link offsets divide the fifo that holds the memory-tile element.
  * `TransferToRuntimeSequence`: join/distribute variables take their DDR stride like spatial
    ones, right above the kernel tile, so every transfer of a tensor divides a dimension over
    the cores the same way (the output write disagreed with the weights' read before).
* `convert_stream_to_aie.py`: layout realization of a core-consumed memory-tile join (the
  producers' layout extended by the join dimension; the inputs' casts fold into their types).
* `aie_kernel.py`: zeroing finds the output as the last shaped operand.
* `context.py`: `STREAM_MEMTILE_REPLAY=1` relaxes "memory tile reuse == reader reuse" to `>=`.
  Opt-in because the replay's descriptors are not modelled: the unfused k=1 design then
  exceeds 48 memory-tile descriptors.
* `transfer_and_tensor_allocation.py`: `STREAM_FORCE_RESIDENT=name[:level]` pins a tensor's
  reuse level; `STREAM_DEBUG_IIS=1` prints the infeasible constraint set; the per-level tables
  exist for every tensor.
* `aie_code_generation.py`: `STREAM_TRACE_TILES="c,r;c,r"` picks the traced tiles.
* `inputs/aie/hardware/whole_array_strix_512.yaml`: 512 KB memory tiles (the hardware's size).

Known limit found on the way: stream-dse's dispatch assumes a layer's core allocation is sorted
by (column, row); listing columns out of order (to shorten join routes) makes a computation
node reference another core's pulls.

## Regressions checked

`swiglu_prefill_stream` k=1/2/5 regenerated with the modified stream-dse and pass (1246 / 1954 /
1357 µs). The earlier blocked-but-unsplit fused design regenerates identically apart from the
intended depth-1 input fifos and a different (allocator-chosen) weight memtile.

## Open paths

1. **Fixed ~55 µs of fill/drain**: the output is written only after every block, and the
   input must land before the first; overlapping the output drain with the last blocks (a
   deeper output join or streaming the output per hidden block) is the next structural lever.
2. **Aggregate DDR bandwidth** bounds the rest: fewer weight bytes (a narrower weight type) is
   the only lever left for the steady state.
3. **Tracing**: needs either fewer cross-column streams (a join memory tile in the consumer's
   column, blocked today by the output joins' channel use) or the trace routed to another shim.
4. Model the replay's memory-tile descriptors in the allocator so `STREAM_MEMTILE_REPLAY` can be
   the default.

## Measurement notes

- `run.last_elapsed` / the `npu_time` of the run result isolates the NPU dispatch from host
  syncs. The pytest number includes a 256 KB output sync.
- The array clock is 1.81 GHz (581k extra trace cycles for 321 µs when doubling seq_len).
- A memtile→core stream moves 8 bytes per cycle: a 16 KB weight tile every 2048 cycles.
- Byte accounting per shim channel is read out of the runtime sequence in
  `outputs/<experiment>/codegen/final.mlir`; the sum over all channels against ~30 GB/s is
  the check that matters now.
