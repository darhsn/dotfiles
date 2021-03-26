#!/bin/bash

if [ "$(pwd)" == "/" ]; then
    cd
fi

clear
pfetch
source ~/.aliasrc

RED="\[\033[31m\]"
WHITE="\[\033[0m\]"
GREEN="\[\033[01;32m\]"
BLUE="\[\033[01;34m\]"
PINK="\[\033[01;35m\]"
YELLOW="\[\033[33;1m\]"

precmd() {
    if [ "$?" == "0" ]; then
        SHELL_COLOR="${WHITE}"
    else
        SHELL_COLOR="${RED}"
    fi

    GIT_BRANCH="$(git symbolic-ref --short HEAD 2>/dev/null)"

    if [ "${GIT_BRANCH}" == "" ]; then
        PS1="${PINK}\w${WHITE} ${SHELL_COLOR}->${WHITE} "
    else
        PS1="${PINK}\w${GREEN} ${GIT_BRANCH} ${SHELL_COLOR}->${WHITE} "
    fi
}

PROMPT_COMMAND="precmd"
export PATH=$HOME/.config/nvcode/utils/bin:$PATH
