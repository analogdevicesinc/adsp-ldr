#!/bin/bash

set -eu

check_deps() {
  for cmd in fpm meson ninja jq gcc rpmbuild; do
    if ! command -v "$cmd" &> /dev/null; then
      echo "ERROR: Missing dependency: ${cmd}"
      exit 1
    fi
  done
}

fpm_wrapper() {
  fpm \
    -s dir \
    -t "${1}" \
    -n "$PROJ_NAME" \
    -v "${PROJ_VERSION#v}" \
    -m "$PROJ_MAINTAINER" \
    --license "BSD-3-Clause" \
    --url "https://github.com/analogdevicesinc/adsp-ldr" \
    --description "Generate boot streams for ADI ADSP processors" \
    --vendor "Analog Devices, Inc." \
    --force \
    -C "$STAGING_DIR" \
    .
}

main() {
  meson setup builddir --prefix=/usr

  local PROJ_NAME
  PROJ_NAME=$(meson introspect --projectinfo builddir | jq -r '.descriptive_name')
  local PROJ_VERSION
  PROJ_VERSION=$(meson introspect --projectinfo builddir | jq -r '.version')
  local PROJ_MAINTAINER="Philip Molloy <philip.molloy@analog.com>"

  meson install -C builddir --destdir "$STAGING_DIR"

  fpm_wrapper deb
  fpm_wrapper rpm
}

check_deps

TARGET_DIR="${1:-.}"

if [[ ! -d "$TARGET_DIR" ]] || [[ ! -f "$TARGET_DIR/meson.build" ]]; then
  exit 1
fi

STAGING_DIR=$(mktemp -d)
trap 'rm -rf "$STAGING_DIR" "$TARGET_DIR/builddir"' EXIT

(
  cd "$TARGET_DIR"
  main
)
