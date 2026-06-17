<!--
SPDX-FileCopyrightText: Copyright (C) 2026 Advanced Micro Devices, Inc. All rights reserved.
SPDX-License-Identifier: Apache-2.0
-->

# StreamFusedRegion — design

## Overview

`StreamFusedRegion` is a **generic, self-describing** IRON operator for
stream-dse-generated fused designs. Where the hardcoded
`SwiGLUPrefillStream(MLIROperator)` carries SwiGLU-specific Python that *declares*
its runtime arguments and its kernel objects (sources, flags, symbol renames),
`StreamFusedRegion` **discovers all of that from the generated MLIR itself** and a
single thin per-region hint.

This realizes the milestone's first design decision — *"MLIR self-describing +
thin manifest"*: derive the runtime arg-spec from the `aie.runtime_sequence(...)`
signature, and the kernels from the `link_with` objects plus the symbols the cores
call; use configuration only for what the MLIR cannot express. For a single region
that residual configuration is just `out_count` (how many trailing runtime args
are outputs). The richer manifest (inter-region dataflow, workload I/O bindings)
is the subject of later stages and is sketched below as a placeholder.

Today's fully-fused SwiGLU is the **k = 1 proof**: fed the SwiGLU stream MLIR,
`StreamFusedRegion` reproduces the exact same arg-spec and the same four kernel
recipes as `SwiGLUPrefillStream`, config-free, and `compile()` plans/builds the
same xclbin. The upstream composite SwiGLU (k = N, fully unfused) is the other
extreme; the multi-region general case lives between them and is built on this
foundation in Phase 2 (`StreamWorkload`).

## Architecture

Three small, independently testable modules, each with a narrow contract:

| Module               | Provides                                                        |
| -------------------- | --------------------------------------------------------------- |
| `mlir_introspect.py` | `parse_runtime_args(text, out_count)`, `collect_kernel_links(text)` |
| `kernel_resolver.py` | `KernelFamily`, `register_family(...)`, `resolve_kernels(...)`  |
| `region.py`          | `StreamFusedRegion(MLIROperator)` — ties the two together       |

`mlir_introspect` is pure MLIR-text analysis (regex), with **no stream-dse import
and no NPU**. `kernel_resolver` maps the introspected links to concrete
`KernelObjectArtifact`s through an extensible registry. `region.py` wires them
into an `MLIROperator` and adds the build-flag parity with the baseline.

### Data flow

```
  MLIR text  (fixture .mlir file  OR  DesignGenerator() -> str)
      |
      |-- parse_runtime_args(text, out_count) ------> list[AIERuntimeArgSpec]
      |       (shapes + dtypes from runtime_sequence;          |
      |        direction from out_count)                       |
      |                                                        v
      |                                              StreamFusedRegion
      |                                                .get_arg_spec()
      |
      `-- collect_kernel_links(text) --> list[KernelLink] --> resolve_kernels(
              (link_with object + the                            links, base_dir,
               func.call symbols its                             kernel_dir)
               cores invoke)                                       |
                                                                   v
                                                       list[KernelObjectArtifact]
                                                                   |
                                                                   v
   StreamFusedRegion.get_artifacts(dynamic_obj_fifos=True)  +  "--no-unified"
                                                                   |
                                                                   v
                                       XclbinArtifact + InstsBinArtifact -> compile()
```

The region holds its MLIR source as either a pre-generated `.mlir` file path
(used for hermetic verification — no stream-dse, no NPU) or a `DesignGenerator`
(lazy stream-dse codegen, the same mechanism the baseline uses). The MLIR text is
loaded once and cached.

## Arg-spec discovery

`parse_runtime_args` reads each runtime argument from the
`aie.runtime_sequence(...)` memref signature: the leading integer dims are the
shape and the trailing element token (`bf16`, `f32`, ...) is the dtype (mapped via
a `_DTYPE_MAP` that raises loudly on an unknown token).

**Direction comes from the `out_count` hint, not from the lowered DMA ops.** With
`n` arguments, the last `out_count` are `"out"` and the rest are `"in"`. By the
time stream-dse has lowered the design, the DMA-level direction is ambiguous (a
buffer is moved in both directions across the runtime sequence), so it cannot be
recovered reliably from the IR; the *number of outputs* is the one fact the MLIR
does not carry. This is the entire residual configuration for a single region.

## Kernel resolution

`collect_kernel_links` finds, for every `link_with="X.o"` object, the set of
`func.call @symbol`s invoked inside the enclosing `aie.core(...)` block, unioning
across all cores that link the same object and preserving first-seen order.

`resolve_kernels` then maps each `(object_filename, symbols)` pair to a concrete
`KernelObjectArtifact` (C source, compile flags, symbol renames) through a
**registry of per-kernel-family handlers**. A `KernelFamily` is a `(matcher,
builder)` pair; families are tried in registration order and the first match wins.

Seed families (reproduce today's SwiGLU artifacts exactly):

| Family | Object             | Source                          | Flags / renames                                                                 |
| ------ | ------------------ | ------------------------------- | ------------------------------------------------------------------------------- |
| `mm`   | `mm_<M>_<K>_<N>.o` | `aie_kernels/<kernel_dir>/mm.cc`| `-DDIM_M -DDIM_K -DDIM_N -Dbf16_bf16_ONLY`; rename `matmul_bf16_bf16`/`zero_bf16` to `_<M>_<K>_<N>` |
| `silu` | `silu.o`           | `aie_kernels/<kernel_dir>/silu.cc` | none                                                                          |
| `mul`  | `mul.o`            | `aie_kernels/generic/mul.cc`    | none                                                                            |

`<kernel_dir>` is the **device-derived** value from
`iron.common.device_utils.get_kernel_dir()` (`aie2p` on NPU2, `aie2` on NPU1) —
the same call the baseline op uses — so the resolved sources match the real
hardware target rather than a hardcoded default.

**Extensibility contract (the point of the registry):** adding support for a new
kernel family is *one declarative step* — write a matcher and a builder and call
`register_family(...)`. Nothing in `resolve_kernels` (which only scans the
registry) or in `StreamFusedRegion` changes. **Variable hyper-parameters are the
family's concern**: the `mm` family extracts `(M, K, N)` from its object name in
the matcher/builder; another family can extract however many parameters it needs.
There is deliberately no global, matmul-shaped `<M>_<K>_<N>` assumption.

## Manifest schema (PLACEHOLDER — Phase 3 / S4)

> **NOT IMPLEMENTED in this phase.** Today the only "manifest" is the per-region
> `out_count` hint passed to `StreamFusedRegion`. The schema below records the
> *intended* shape for the multi-region executor (S3 `StreamWorkload`) and the
> stream→IRON emitter (S4); it is documented here so the region's API is designed
> against it, not to be consumed yet.

The MLIR is self-describing for a single region; the manifest exists only for what
the MLIR cannot express across regions. Intended shape (illustrative):

```yaml
# stream-fusion manifest (placeholder; finalized in S4)
regions:
  - id: region_0            # stable region identifier
    mlir: region_0.mlir     # one MLIR per fused region (k=1 today -> a single region)
    out_count: 1            # the per-region hint StreamFusedRegion already takes
    layers: [gate, up, down]  # which workload layers fused into this region (see note)
edges:
  # producer -> consumer tensor dataflow between regions, so the executor can
  # allocate resident intermediate tensors and topo-order dispatch.
  - producer: { region: region_0, out: 0 }
    consumer: { region: region_1, in: 0 }
io:
  # workload I/O <-> region tensor bindings (and layout convention), so an ONNX /
  # torch front-end (S5) can bind real inputs/weights and a golden reference.
  inputs:  [{ name: x,  region: region_0, in: 0, layout: row_major }]
  weights: [{ name: w_gate, region: region_0, in: 1, layout: "K,N" }]
  outputs: [{ name: y,  region: region_last, out: 0 }]
```

- **`regions[]`** — each: the region's MLIR, its `out_count`, and (for the
  deferred study) its **layer membership**. `StreamFusedRegion` already consumes a
  region entry's `mlir` + `out_count`; the rest is for the workload layer.
- **`edges[]`** — producer→consumer tensor dataflow between regions. The
  `StreamWorkload` executor (S3) uses this to allocate resident intermediate
  `XRTTensor`s and to topologically order region dispatch.
- **`io`** — workload-level input/weight/output bindings to region tensor slots,
  plus the layout convention (the current SwiGLU numerics are sensitive to a
  weight-layout/transpose convention, so layout must be explicit here).

**Layer ↔ region ↔ config membership must be retained** in the manifest even
though the reconfiguration-cost study is deferred (milestone decision 4): do not
collapse away which layers live in which region/config, or that study becomes
impossible to run later.

## Verification

This phase is **build/parse-only** — no NPU required, matching the milestone's
no-NPU verification bar:

- `StreamFusedRegion.compile(dry_run=True)` plans the full build graph and emits
  the `aiecc` command line with `--dynamic-objFifos` and `--no-unified` (baseline
  flag parity) without executing the toolchain.
- `aie-opt <fixture>.mlir -o /dev/null` confirms the generated MLIR parses under
  the AIE dialect (exit code 0).
- The unit tests (`tests/test_region.py`) prove arg-spec and kernel-recipe parity
  with the `SwiGLUPrefillStream` baseline driven by the copied fixture, with no
  stream-dse import and no NPU.

On a host with an NPU, `compile()` (no `dry_run`) builds the xclbin and the
functional bar is "doesn't stall/timeout" (numerical correctness is out of scope
for this milestone).
