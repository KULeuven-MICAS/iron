# fast/ — optimised kernel bodies

Drop-in replacements for hot kernels in `aie_kernels/aie2p/`, kept separate so what is
tuned is obvious and so the original stays readable as the reference implementation.

Each file here replaces exactly one function and keeps its numerics. `mha.cc` includes
what it uses from here, so no build wiring or stream-dse registration changes: the same
entry point (`partial_softmax_mode`) is what stream calls either way.

`IRON_SOFTMAX_REFERENCE=1` selects the original body at compile time, so an A/B is one
environment variable and both paths stay tested.

## softmax_fast.cc

`partial_softmax_alias_bf16` is called once per row of a 64x64 block. With `SM_VEC_LEN`
64 and a 64-wide row, each of its two passes is a *single* vector iteration, so there is
no loop to pipeline and the per-row cost is dominated by things that are not arithmetic.
Measured on device at seq 2048 it is 355 cycles per row while issuing about 12 vector
instructions -- roughly 28 cycles per vector instruction.

The disassembly says where they go:

- a full non-leaf call frame per row: a 320-byte stack frame and about a dozen register
  spills and reloads, plus `event #0` / `event #1`;
- `aie::reduce_max` over 64 lanes compiles to a six-step tree, `vshift` and `vmax_lt.bf16`
  shifting by 32, 16, 8, 4, 2, then `vextract` -- thirteen strictly dependent instructions;
- the exponent pass cannot start until that tree finishes, and the final `reduce_add`
  gates the scale-buffer write, so the row is one dependency chain end to end;
- consequently most VLIW bundles are empty (`nopa ; nopb ; ... ; nops`).

This version processes four rows per call. The four reduction trees are independent, so
the scheduler can interleave them and fill the slots that were nops, and one call frame
and one pair of trace events are amortised over four rows instead of one.
