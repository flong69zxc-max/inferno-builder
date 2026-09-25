#!/usr/bin/env bash
set -euo pipefail

IPSW_URL="${IPSW_URL:-https://updates.cdn-apple.com/2020SummerSeed/fullrestores/001-35886/5FE9BE2E-17F8-41C8-96BB-B76E2B225888/iPhone11,8,iPhone12,1_14.0_18A5351d_Restore.ipsw}"
IPSW_NAME=$(basename "$IPSW_URL")

cd InfernoData
wget -O "$IPSW_NAME" "$IPSW_URL"
mkdir -p Restore
unzip -o "$IPSW_NAME" -d Restore
rm "$IPSW_NAME"
