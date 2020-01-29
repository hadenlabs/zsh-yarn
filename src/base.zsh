#!/usr/bin/env ksh
# -*- coding: utf-8 -*-

function fzf::exist {
    if ! type -p fzf > /dev/null; then
        echo 0
        return
    fi
    echo 1
}

function jq::exist {
    if ! type -p jq > /dev/null; then
        echo 0
        return
    fi
    echo 1
}

function brew::exist {
    if ! type -p brew > /dev/null; then
        echo 0
        return
    fi
    echo 1
}

function nvm::exist {
    if ! type nvm > /dev/null; then
        echo 0
        return
    fi
    echo 1
}

function node::exist {
    if ! type -p node > /dev/null; then
        echo 0
        return
    fi
    echo 1
}

function yarn::exist {
    if ! type -p yarn > /dev/null; then
        echo 0
        return
    fi
    echo 1
}

function jq::install {
    if [ "$(brew::exist)" -eq 0 ]; then
        message_warning "Please Install brew or use antibody bundle luismayta/zsh-brew branch:develop"
        return
    fi
    brew install jq
}

function fzf::install {
    if [ "$(brew::exist)" -eq 0 ]; then
        message_warning "Please Install brew or use antibody bundle luismayta/zsh-brew branch:develop"
        return
    fi
    brew install fzf
}

function nvm::install {
    if [ "$(nvm::exist)" -eq 0 ]; then
        message_warning "Please Install nvm or use antibody bundle luismayta/zsh-nvm branch:develop"
        return
    fi
}

function node::install {
    if [ "$(nvm::exist)" -eq 1 ]; then
        nvm install lts
        return
    fi

    message_warning "Please Install nvm or use antibody bundle luismayta/zsh-nvm branch:develop"
}

function yarn::install {
    if [ ! -e "${YARN_PATH}" ]; then
        curl --compressed -o- -L https://yarnpkg.com/install.sh | bash
    fi
    yarn::load
}

function yarn::load {
    [ -e "${YARN_PATH}/bin" ] && export PATH="${PATH}:${YARN_PATH}/bin"
}

yarn::load


if [ "$(fzf::exist)" -eq 0 ]; then fzf::install; fi
if [ "$(jq::exist)" -eq 0 ]; then jq::install; fi
if [ "$(nvm::exist)" -eq 0 ]; then nvm::install; fi
if [ "$(node::exist)" -eq 0 ]; then node::install; fi
if [ "$(yarn::exist)" -eq 0 ]; then yarn::install; fi
