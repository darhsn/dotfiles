#!/bin/bash

# Variables
export DOTS_DIR="$HOME/dotfiles"
export EDITOR="nvim"

# Aliases
source ~/.aliasrc

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
            PS1="${PINK}\w${WHITE} ${SHELL_COLOR}->${WHITE} "
        else
            PS1="${PINK}\w${GREEN} ${GIT_BRANCH} ${SHELL_COLOR}->${WHITE} "
        fi
    }

    PROMPT_COMMAND="precmd"
}

# Startup commands
clear
setps1
fetch
