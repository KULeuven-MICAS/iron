# SPDX-FileCopyrightText: Copyright (C) 2026 KU Leuven (MICAS). All rights reserved.
# SPDX-License-Identifier: Apache-2.0

from dataclasses import dataclass, field
from typing import Any

import aie.utils as aie_utils
import torch

from iron.common import (
    AIERuntimeArgSpec,
    DesignGenerator,
    MLIROperator,
    PythonGeneratedMLIRArtifact,
)
from iron.common.device_utils import get_kernel_dir
from iron.common.sequence import OperatorSequence
from iron.common.stream.ops import FLASH, FUSED_SCORE_SOFTMAX, GEMM, SOFTMAX

BYTES_PER_ELEMENT = 2  # every buffer in a fused sequence is addressed as bfloat16


@dataclass
class _MHAStreamGroup(MLIROperator):
    """One stream-dse design, used as an ``OperatorSequence`` child.

    ``k`` is how many fused groups the attention core is split into and
    ``group_index`` which of them this is, in the order
    :func:`~iron.operators.mha_prefill_stream.stream_design.group_layers` lists them.
    ``cfg`` is the design the whole sequence was built for; unset it comes from the
    environment, which is what a sweep that sets no config gets.
    """

    seq_len: int
    d_head: int
    k: int
    group_index: int
    causal: bool = False
    flash: bool = False
    context: Any = field(default=None, repr=False, compare=False)
    # Out of the operator name, which is a filename: the generated design is already
    # named by design_key(), and a config's repr is not filesystem-safe.
    cfg: Any = field(default=None, repr=False)

    def __post_init__(self):
        self.cfg = self.cfg or self._design.DesignConfig.from_environment()
        MLIROperator.__init__(self, context=self.context)

    @property
    def _design(self):
        from iron.operators.mha_prefill_stream import stream_design

        return stream_design

    def _dims(self):
        return {
            "k": self.k,
            "seq_len": self.seq_len,
            "d_head": self.d_head,
            "causal": self.causal,
            "flash": self.flash,
            "npu": aie_utils.get_current_device().resolve().name,
            "cfg": self.cfg,
        }

    def get_mlir_artifact(self):
        return PythonGeneratedMLIRArtifact(
            f"{self.name}_{self.design_key()[:12]}.mlir",
            DesignGenerator(
                self.operator_dir / "stream_design.py",
                "load_group",
                (self.group_index,),
                self._dims(),
            ),
        )

    def get_kernel_artifacts(self):
        design = self._design
        tiles = design.kernel_tiles(
            self.seq_len, self.d_head, self.k, self.flash, self.cfg
        )
        # Both halves of an online-softmax step are entry points of the same object.
        score_layer = design.score_layers(self.cfg)[0]
        per_layer = {
            # Fused, the score side is one node against mha.o rather than a GEMM of its
            # own, and its tile shape is the object's compiled block.
            score_layer: (
                (FUSED_SCORE_SOFTMAX, None)
                if self.cfg.fused_kernel
                else (GEMM, tiles[score_layer])
            ),
            design.CONTEXT_NODE: (
                (FLASH, None) if self.flash else (GEMM, tiles[design.CONTEXT_NODE])
            ),
            design.SOFTMAX_NODE: (FLASH if self.flash else SOFTMAX, None),
        }
        layers = design.group_layers(self.k, self.cfg)[self.group_index]
        base_dir, kernel_dir = self.context.base_dir, get_kernel_dir()
        return [
            artifact
            for kernel, tile in dict.fromkeys(per_layer[layer] for layer in layers)
            for artifact in kernel.kernel_artifacts(
                base_dir, kernel_dir, **(dict(zip("mkn", tile)) if tile else {})
            )
        ]

    def reference(self, *inputs):
        """CPU result for this group, for the reference and compare dispatches.

        The group's layers run in order, each on what the one before produced; a GEMM takes
        the next of the group's inputs as its second operand, which is the order
        :func:`group_ports` hands them in.
        """
        from iron.operators.mha_prefill_stream.reference import causal_mask

        design = self._design
        value, operands = inputs[0], iter(inputs[1:])
        for layer in design.group_layers(self.k, self.cfg)[self.group_index]:
            if layer == design.SOFTMAX_NODE:
                scores = value.float()
                if self.causal:
                    scores = scores + causal_mask(*scores.shape[-2:], scores.dtype)
                value = torch.softmax(scores, dim=-1).to(value.dtype)
            else:
                value = value @ next(operands)
        return value

    def design_key(self):
        """Groups whose generated design is byte-identical share it."""
        return self._design.group_digest(self.group_index, **self._dims())

    def get_arg_spec(self):
        """The group's runtime arguments, shaped by the exported graph."""
        fused = self.flash and self.cfg.fused_kernel
        shapes = self._design.workload_for(
            self.seq_len, self.d_head, fused, fused
        ).shapes
        inputs, outputs = self._design.group_ports(
            self.seq_len, self.d_head, self.k, fused, self.cfg
        )[self.group_index]
        return [AIERuntimeArgSpec("in", shapes[name]) for name in inputs] + [
            AIERuntimeArgSpec("out", shapes[name]) for name in outputs
        ]


class MHAPrefillStream(OperatorSequence):
    """Prefill attention core generated by stream-dse and deployed as one full ELF.

    One head's ``softmax(q @ k_t) @ v``, replayed over ``heads`` by slicing the per-head
    buffers. ``causal`` masks every key at a later position than its query; ``flash``
    blocks the key instead of keeping it resident, and is always causal. ``README.md``
    has what each costs and what bounds them.

    The caller hands in a ``q`` already scaled by ``1/sqrt(d_head)`` and a ``k_t``
    already transposed. Runtime buffers are named by
    :mod:`~iron.operators.mha_prefill_stream.reference`: ``q``, ``k_t``, ``v``,
    ``output``. Building requires ``stream-dse`` (``pip install stream-dse`` +
    ``stream-setup-aie``); importing does not.

    ``design_config`` is an advanced, experimental hook: a
    :class:`~iron.operators.mha_prefill_stream.stream_design.DesignConfig` sweeping how
    a fused design spreads over the array, held by this operator alone so two of them
    may differ. Left out, it comes from the environment.
    """

    def __init__(
        self,
        seq_len,
        d_head,
        heads=1,
        k=None,
        causal=False,
        flash=False,
        context=None,
        share_designs=True,
        dispatch="auto",
        design_config=None,
    ):
        from iron.common.stream.design import trace_size
        from iron.operators.mha_prefill_stream.stream_design import (
            DesignConfig,
            LAYER_BY_LAYER,
            group_ports,
        )

        cfg = design_config or DesignConfig.from_environment()
        k = (1 if flash else LAYER_BY_LAYER) if k is None else k
        causal = causal or flash
        ports = [
            inputs + outputs
            for inputs, outputs in group_ports(
                seq_len, d_head, k, flash and cfg.fused_kernel, cfg
            )
        ]
        groups = [
            _MHAStreamGroup(
                seq_len=seq_len,
                d_head=d_head,
                k=k,
                group_index=index,
                causal=causal,
                flash=flash,
                context=context,
                cfg=cfg,
            )
            for index in range(len(ports))
        ]
        head_bytes = seq_len * d_head * BYTES_PER_ELEMENT
        per_head = ("q", "k_t", "v", "output")
        runlist = []
        for head in range(heads):
            window = f"[{head * head_bytes}:{(head + 1) * head_bytes}]"
            for group, names in zip(groups, ports):
                runlist.append(
                    (group, *(n + window if n in per_head else n for n in names))
                )
        super().__init__(
            name=(
                f"mha_prefill_stream_k{k}_h{heads}_s{seq_len}_d{d_head}"
                f"{'_flash' if flash else '_causal' if causal else ''}"
            ),
            runlist=runlist,
            input_args=["q", "k_t", "v"],
            output_args=["output"],
            buffer_sizes={name: heads * head_bytes for name in per_head},
            trace_size=trace_size(),
            share_designs=share_designs,
            dispatch=dispatch,
            context=context,
        )
