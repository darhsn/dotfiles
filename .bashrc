#!/bin/bash

if [ "$(pwd)" == "/" ]; then
    cd
fi

dots="$HOME/dotfiles"

clear
# fortune | cowsay | lolcat -p 1
. ~/dotfiles/switch-theme.sh
source ~/.aliasrc

RED="\[\033[31m\]"
WHITE="\[\033[0m\]"
GREEN="\[\033[01;32m\]"
BLUE="\[\033[01;34m\]"
PINK="\[\033[01;35m\]"
YELLOW="\[\033[33;1m\]"

fetch() {
	# user is already defined
	host="$(hostname)"
	os="$(cat /etc/fedora-release)"
	kernel="$(uname -sr)"
	uptime="$(uptime -p | sed 's/up //')"
	#packages="$(dnf list installed | sed '1d' | wc -l)"
	shell="$(basename "${SHELL}")"

	# probably don't change these
	if [ -x "$(command -v tput)" ]; then
		bold="$(tput bold)"
		black="$(tput setaf 0)"
		red="$(tput setaf 1)"
		green="$(tput setaf 2)"
		yellow="$(tput setaf 3)"
		blue="$(tput setaf 4)"
		magenta="$(tput setaf 5)"
		cyan="$(tput setaf 6)"
		white="$(tput setaf 7)"
		reset="$(tput sgr0)"
	fi

	lc="${reset}${bold}${blue}"         # labels
	nc="${reset}${bold}${blue}"         # user and hostname
	ic="${reset}"                       # info
	c0="${reset}${white}"               # first color
	c1="${reset}${blue}"                # second color

	## OUTPUT
	cat <<EOF
${c0}        _____
${c0}       /   __)${c1}\\   ${nc}${USER}${ic}@${nc}${host}${reset}
${c0}       |  /  ${c1}\\ \\  ${lc}os:        ${ic}${os}${reset}
${c1}    __${c0}_|  |_${c1}_/ /  ${lc}kernel:    ${ic}${kernel}${reset}
${c1}   / ${c0}(_    _)${c1}_/   ${lc}uptime:    ${ic}${uptime}${reset}
${c1}  / /  ${c0}|  |       ${lc}shell:     ${ic}${shell}${reset} 
${c1}  \\ \\${c0}__/  |       
${c1}   \\${c0}(_____/       

EOF
}

fetch

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
