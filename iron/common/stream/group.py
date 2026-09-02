# SPDX-FileCopyrightText: Copyright (C) 2026 KU Leuven (MICAS). All rights reserved.
# SPDX-License-Identifier: Apache-2.0

"""One stream-dse design as an ``OperatorSequence`` child, shared by every generated
operator.

A concrete group supplies five things -- its design module, the dimension payload that
names one design, the kernel per layer, the group's layers, and its runtime ports --
and inherits how a design is loaded, keyed, compiled against its kernels and given its
argument spec. Before this class the two operators carried the same four methods each,
differing only in those five inputs.
"""

from iron.common import (
    AIERuntimeArgSpec,
    DesignGenerator,
    MLIROperator,
    PythonGeneratedMLIRArtifact,
)
from iron.common.device_utils import get_kernel_dir


class StreamGroup(MLIROperator):
    group_index: int

    @property
    def _design(self):
        raise NotImplementedError

    def _dims(self) -> dict:
        """Everything that names one generated design, as ``load_group`` kwargs."""
        raise NotImplementedError

    def _per_layer(self) -> dict:
        """Layer name -> (StreamKernel, kernel tile or None)."""
        raise NotImplementedError

    def _layers(self) -> list:
        """This group's layers, in the order the design runs them."""
        raise NotImplementedError

    def _ports(self):
        """(tensor shapes by name, (input names, output names)) for this group."""
        raise NotImplementedError

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
        # The registry is the single place a kernel's source, compile flags and
        # symbol names are declared, so the object and the design agree.
        per_layer = self._per_layer()
        base_dir, kernel_dir = self.context.base_dir, get_kernel_dir()
        return [
            artifact
            for kernel, tiles in dict.fromkeys(
                per_layer[layer] for layer in self._layers()
            )
            for artifact in kernel.kernel_artifacts(
                base_dir, kernel_dir, **(dict(zip("mkn", tiles)) if tiles else {})
            )
        ]

    def design_key(self):
        """Groups whose generated design is byte-identical share it."""
        return self._design.group_digest(self.group_index, **self._dims())

    def get_arg_spec(self):
        """The group's runtime arguments, shaped by the exported graph.

        Both the names and their order come from the workload, which is also the
        order the generated design takes its arguments in.
        """
        shapes, (inputs, outputs) = self._ports()
        return [AIERuntimeArgSpec("in", shapes[name]) for name in inputs] + [
            AIERuntimeArgSpec("out", shapes[name]) for name in outputs
        ]
