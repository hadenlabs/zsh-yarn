#!/usr/bin/env ksh
# -*- coding: utf-8 -*-

#
# Defines install zsh-yarn for osx or linux.
#
# Authors:
#   Luis Mayta <slovacus@gmail.com>
#
export yarn_package_name="yarn"

YARN_PLUGIN_DIR="$(dirname "${0}":A)"
YARN_SOURCE_PATH="${YARN_PLUGIN_DIR}"/src

export YARN_PATH="${HOME}"/.yarn

# shellcheck source=/dev/null
source "${YARN_SOURCE_PATH}"/base.zsh

# shellcheck source=/dev/null
source "${YARN_SOURCE_PATH}"/yarn.zsh

function yarn::run {
    local command
    command=$(yarn::search::scripts)
    if [ -n "${command}" ]; then
        yarn "${command}"
        zle accept-line
    fi
}

zle -N yarn::run
bindkey '^Xr' yarn::run
