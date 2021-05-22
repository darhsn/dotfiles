#!/bin/bash

# Variables
export DOTS_DIR="$HOME/dotfiles"
export EDITOR="nvim"

# Aliases
source ~/.aliasrc

# Print a true color gradient
gradient() {
    awk 'BEGIN{
        s="/\\/\\/\\/\\/\\"; s=s s s s s s s s;
        for (colnum = 0; colnum<77; colnum++) {
            r = 255-(colnum*255/76);
            g = (colnum*510/76);
            b = (colnum*255/76);
            if (g>255) g = 510-g;
            printf "\033[48;2;%d;%d;%dm", r,g,b;
            printf "\033[38;2;%d;%d;%dm", 255-r,255-g,255-b;
            printf "%s\033[0m", substr(s,colnum+1,1);
        }
        printf "\n";
    }'
}

# Switch theme function
switch-theme() {
    DOTFILES_DIR="${DOTS_DIR}"

    if [ "${1}" == "" ]; then
        echo "switch-theme: invalid empty args"
        echo "switch-theme: usage: switch-theme THEME_NAME"
        echo "Themes: gruvbox, onedark, nord, base16"
    elif [ "${1}" == "gruvbox" ]; then
        cp $DOTFILES_DIR/polybar/gruvbox-config $DOTFILES_DIR/polybar/config
        cp $DOTFILES_DIR/rofi/gruvbox.rasi $DOTFILES_DIR/rofi/theme.rasi
        cp $DOTFILES_DIR/dunst/gruvbox-dunstrc $DOTFILES_DIR/dunst/dunstrc
        cp $DOTFILES_DIR/kitty/gruvbox-kitty.conf $DOTFILES_DIR/kitty/kitty.conf
        cp $DOTFILES_DIR/alacritty/gruvbox-alacritty.yml $DOTFILES_DIR/alacritty/alacritty.yml
        echo "switch-theme: changed theme to gruvbox, wallpaper and vim theme should be changed manually"
    elif [ "${1}" == "onedark" ]; then
        cp $DOTFILES_DIR/polybar/onedark-config $DOTFILES_DIR/polybar/config
        cp $DOTFILES_DIR/rofi/onedark.rasi $DOTFILES_DIR/rofi/theme.rasi
        cp $DOTFILES_DIR/dunst/onedark-dunstrc $DOTFILES_DIR/dunst/dunstrc
        cp $DOTFILES_DIR/kitty/onedark-kitty.conf $DOTFILES_DIR/kitty/kitty.conf
        cp $DOTFILES_DIR/alacritty/onedark-alacritty.yml $DOTFILES_DIR/alacritty/alacritty.yml
        echo "switch-theme: changed theme to onedark, wallpaper and vim theme should be changed manually"
    elif [ "${1}" == "nord" ]; then
        cp $DOTFILES_DIR/polybar/nord-config $DOTFILES_DIR/polybar/config
        cp $DOTFILES_DIR/rofi/nord.rasi $DOTFILES_DIR/rofi/theme.rasi
        cp $DOTFILES_DIR/dunst/nord-dunstrc $DOTFILES_DIR/dunst/dunstrc
        cp $DOTFILES_DIR/kitty/nord-kitty.conf $DOTFILES_DIR/kitty/kitty.conf
        cp $DOTFILES_DIR/alacritty/nord-alacritty.yml $DOTFILES_DIR/alacritty/alacritty.yml
        echo "switch-theme: changed theme to nord, wallpaper and vim theme should be changed manually"
    elif [ "${1}" == "base16" ]; then
        cp $DOTFILES_DIR/polybar/base16-config $DOTFILES_DIR/polybar/config
        cp $DOTFILES_DIR/rofi/base16.rasi $DOTFILES_DIR/rofi/theme.rasi
        cp $DOTFILES_DIR/dunst/base16-dunstrc $DOTFILES_DIR/dunst/dunstrc
        cp $DOTFILES_DIR/kitty/base16-kitty.conf $DOTFILES_DIR/kitty/kitty.conf
        cp $DOTFILES_DIR/alacritty/base16-alacritty.yml $DOTFILES_DIR/alacritty/alacritty.yml
        echo "switch-theme: changed theme to base16, wallpaper and vim theme should be changed manually"
    elif [ "${1}" == "solarized" ]; then
        cp $DOTFILES_DIR/polybar/solarized-config $DOTFILES_DIR/polybar/config
        cp $DOTFILES_DIR/rofi/solarized.rasi $DOTFILES_DIR/rofi/theme.rasi
        cp $DOTFILES_DIR/dunst/solarized-dunstrc $DOTFILES_DIR/dunst/dunstrc
        cp $DOTFILES_DIR/kitty/solarized-kitty.conf $DOTFILES_DIR/kitty/kitty.conf
        cp $DOTFILES_DIR/alacritty/solarized-alacritty.yml $DOTFILES_DIR/alacritty/alacritty.yml
        echo "switch-theme: changed theme to solarized, wallpaper and vim theme should be changed manually"
    elif [ "${1}" == "dark" ]; then
        cp $DOTFILES_DIR/polybar/dark-config $DOTFILES_DIR/polybar/config
        cp $DOTFILES_DIR/rofi/dark.rasi $DOTFILES_DIR/rofi/theme.rasi
        cp $DOTFILES_DIR/dunst/dark-dunstrc $DOTFILES_DIR/dunst/dunstrc
        cp $DOTFILES_DIR/kitty/dark-kitty.conf $DOTFILES_DIR/kitty/kitty.conf
        cp $DOTFILES_DIR/alacritty/dark-alacritty.yml $DOTFILES_DIR/alacritty/alacritty.yml
        echo "switch-theme: changed theme to dark, wallpaper and vim theme should be changed manually"
    else
        echo "switch-theme: invalid theme!"
        echo "switch-theme: usage: switch-theme THEME_NAME"
        echo "Themes: gruvbox, onedark, nord, base16, dark"
    fi

    killall polybar
    polybar primary &!

    killall dunst
    dunst &!

}

# Fetch function
fetch() {
    lolcat <<EOF
       _____
      /   __/  ${USER}@$(hostname)
     |  /      os:        $(cat /etc/fedora-release)
    _|  |_     kernel:    $(uname -sr)
   |_    _|    uptime:    $(uptime -p | sed 's/up //')
     |  |      shell:     $(basename ${SHELL})
   __/  |      editor:    $(basename ${EDITOR})
  /____/

EOF
}

# Code command
code() {
    if [ "${1}" == "" ]; then
        cd "${HOME}/Code"
    elif [ "${1}" == "web" ]; then
        cd "${HOME}/Code/WebServer"
    elif [ "${1}" == "go" ]; then
        cd "${HOME}/Code/Go"
    elif [ "${1}" == "python" ]; then
        cd "${HOME}/Code/Python"
    fi
}

# Function to manage tmux sessions
session() {
    if [ "${1}" == "" ]; then
        tmux list-sessions
    elif [ "${1}" == "new" ]; then
        if [ "${2}" == "" ]; then
            echo "session: invalid empty session"
        else
            tmux new -s ${2}
        fi
    elif [ "${1}" == "list" ]; then
        tmux list-sessions
    elif [ "${1}" == "killall" ]; then
        tmux kill-server
    elif [ "${1}" == "kill" ]; then
        if [ "${2}" == "" ]; then
            echo "session: invalid empty kill"
        else
            tmux kill-session -t ${2}
        fi
    elif [ "${1}" == "attach" ]; then
        if [ "${2}" == "" ]; then
            echo "session: invalid empty attach"
        else
            tmux attach-session -t ${2}
        fi
    elif [ "${1}" == "last" ]; then
        tmux attach-session
    elif [ "${1}" == "switch" ]; then
        if [ "${2}" == "" ]; then
            echo "session: invalid switch attach"
        else
            tmux switch-client -t ${2}
        fi
    fi
}

# FZF Finder
finder() {

    result="$(find . -maxdepth 1 -type d | grep -v './\.' | fzf)"

    if [ "${result}" == "" ]; then
        echo "Invalid empty!"
    else
        cd ${result} && tmux
    fi
}

# Prompt function
setps1() {

    # Colors
    RED="\[\033[31m\]"
    WHITE="\[\033[0m\]"
    GREEN="\[\033[01;32m\]"
    BLUE="\[\033[01;34m\]"
    PINK="\[\033[01;35m\]"
    YELLOW="\[\033[33;1m\]"

    # Define PS1 function
    precmd() {
        if [ "$?" == "0" ]; then
            SHELL_COLOR="${WHITE}"
        else
            SHELL_COLOR="${RED}"
        fi

        GIT_BRANCH="$(git symbolic-ref --short HEAD 2>/dev/null)"

        if [ "${GIT_BRANCH}" == "" ]; then
            PS1="${SHELL_COLOR}-> ${PINK}\W${WHITE} "
        else
            PS1="${SHELL_COLOR}-> ${PINK}\W${GREEN} ${GIT_BRANCH}${WHITE} "
        fi
    }

    PROMPT_COMMAND="precmd"
}

# Startup commands
clear
setps1
fetch
