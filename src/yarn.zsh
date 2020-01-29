#!/usr/bin/env ksh
# -*- coding: utf-8 -*-

function yarn::package::exist {
    if [ -f package.json ]; then
        echo 1
        return
    fi
    echo 0
}

function yarn::script::list {
    if [ "$(yarn::package::exist)" -eq 0 ]; then
        message_info "Not found package.json"
        return
    fi
    less package.json | jq -r ".scripts" | jq -r 'to_entries[] | [.key, .value] | @tsv'
}

function yarn::dependencies::list {
    if [ "$(yarn::package::exist)" -eq 0 ]; then
        message_info "Not found package.json"
        return
    fi
    less package.json | jq -r ".dependencies" | jq -r 'to_entries[] | [.key, .value] | @tsv'
}

function yarn::search::scripts {
    local command
    command=$(yarn::script::list \
                  | fzf \
                  | awk '{print $1}' \
                  | perl -pe 'chomp'
           )
    if [ -n "${command}" ]; then
        yarn run "${command}"
    fi
}
