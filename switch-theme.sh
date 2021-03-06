#!/bin/bash

DOTFILES_DIR="$HOME/dotfiles"

switch-theme "$(echo 'gruvbox
onedark
nord
dark' | rofi -dmenu show)"

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

    killall polybar
    polybar primary &!

    killall dunst
    dunst &!

}

