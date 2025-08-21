#!/bin/sh
#
# See https://mesonbuild.com/Creating-releases.html

set -ex

if [ "$1" = "get-vcs" ]; then
    git -C "$MESON_SOURCE_ROOT" describe --tags --always
elif [ "$1" = "set-dist" ]; then
    $MESONREWRITE --sourcedir="$MESON_PROJECT_DIST_ROOT" kwargs set project / version "$2"
else
    exit 1
fi
