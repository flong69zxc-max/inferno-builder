#!/usr/bin/env bash
set -euo pipefail

# Ищем qemu-img: сначала в сборке Inferno, потом в Homebrew, потом в PATH
QEMU_IMG=""
for candidate in "./Inferno/build/qemu-img" "$(brew --prefix qemu 2>/dev/null)/bin/qemu-img" "qemu-img"; do
  if command -v "$candidate" &>/dev/null || [ -x "$candidate" ]; then
    QEMU_IMG="$candidate"
    echo "✅ Используем qemu-img: $QEMU_IMG"
    break
  fi
done

if [ -z "$QEMU_IMG" ]; then
  echo "❌ qemu-img не найден. Установите qemu через brew или соберите Inferno."
  exit 1
fi

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

echo "✅ Диски успешно созданы в InfernoData/"
