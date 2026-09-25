#!/usr/bin/env bash
set -euo pipefail

cd InfernoData

hdiutil attach -imagekey diskimage-class=CRawDiskImage \
  -blocksize 4096 -noverify -noautofsck root

sudo diskutil enableownership /Volumes/System
sudo mount -urw /Volumes/System

git clone --depth 1 https://git.chefkiss.dev/AppleHax/InfernoFSPatcher
cd InfernoFSPatcher
cmake -S . -B build -DCMAKE_EXPORT_COMPILE_COMMANDS=YES \
  -DCMAKE_BUILD_TYPE=Release
cmake --build build

sudo build/inferno_fs_patcher \
  /Volumes/System/System/Library/Caches/com.apple.dyld/dyld_shared_cache_arm64e

cd ..
diskutil eject /Volumes/System
