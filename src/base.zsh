#!/usr/bin/env ksh
# -*- coding: utf-8 -*-

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
    curl --compressed -o- -L https://yarnpkg.com/install.sh | bash
}


if [ "$(nvm::exist)" -eq 0 ]; then nvm::install; fi
if [ "$(node::exist)" -eq 0 ]; then node::install; fi
if [ "$(yarn::exist)" -eq 0 ]; then yarn::install; fi
