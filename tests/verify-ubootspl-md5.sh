#!/bin/sh

set -ex

# Generated using LDR v1.0.0
md5sum -c - <<EOF
d502ee8ffb1ae8137ba875446221d2a3  tests/data/u-boot.ldr
0341b674bc6fcb8b7036d14cbaac5fe1  tests/data/u-boot-spl.ldr
EOF
