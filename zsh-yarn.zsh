#!/usr/bin/env ksh
# -*- coding: utf-8 -*-

#
# Defines install zsh-yarn for osx or linux.
#
# Authors:
#   Luis Mayta <slovacus@gmail.com>
#
yarn_package_name="yarn"

YARN_PLUGIN_DIR="$(dirname "${0}":A)"
YARN_SOURCE_PATH="${YARN_PLUGIN_DIR}"/src

# shellcheck source=/dev/null
source "${YARN_SOURCE_PATH}"/base.zsh
