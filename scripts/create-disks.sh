#!/usr/bin/env bash
set -euo pipefail

QEMU_IMG="${QEMU_IMG:-./Inferno/build/qemu-img}"

mkdir -p InfernoData
cd InfernoData

"$QEMU_IMG" create -f raw root 32G
"$QEMU_IMG" create -f raw firmware 8M
"$QEMU_IMG" create -f raw syscfg 128K
"$QEMU_IMG" create -f raw ctrl_bits 8K
"$QEMU_IMG" create -f raw nvram 8K
"$QEMU_IMG" create -f raw effaceable 4K
"$QEMU_IMG" create -f raw panic_log 1M
"$QEMU_IMG" create -f raw sep_nvram 64K
"$QEMU_IMG" create -f raw sep_ssc 128K
