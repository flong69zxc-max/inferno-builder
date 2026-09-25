#!/usr/bin/env bash
set -euo pipefail

cd InfernoData
git clone --depth 1 https://github.com/ChefKissInc/Inferno
cd Inferno
git submodule update --init

mkdir -p build && cd build
LIBTOOL="glibtool" ../configure \
  --target-list=aarch64-softmmu,x86_64-softmmu \
  --disable-bsd-user --disable-guest-agent \
  --enable-lzfse --enable-slirp --enable-capstone \
  --enable-curses --enable-libssh --enable-virtfs \
  --enable-zstd --enable-cocoa --enable-nettle \
  --enable-gnutls --disable-sdl --disable-gtk \
  --disable-werror --disable-tests --disable-plugins
make -j$(sysctl -n hw.ncpu)
