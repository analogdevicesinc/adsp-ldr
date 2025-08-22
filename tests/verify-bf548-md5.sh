#!/bin/sh

set -ex

md5sum -c - <<EOF
d2e98f6ad70477c30ac8f32ab2745364  tests/data/bf548.ldr-0.dxe
d41d8cd98f00b204e9800998ecf8427e  tests/data/bf548.ldr-0.dxe-1.block
d2b116e385231c0a3fa476a5900e4874  tests/data/bf548.ldr-0.dxe-21.block
00804a16f0bf0f5bd8b1cabe8f1f290e  tests/data/bf548.ldr-0.dxe-2.block
d41d8cd98f00b204e9800998ecf8427e  tests/data/bf548.ldr-0.dxe-30.block
EOF
