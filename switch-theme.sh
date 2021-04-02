#!/bin/bash

DOTFILES_DIR="$HOME/Code/dotfiles"

switch-theme() {
    if [ "${1}" == "" ]; then
        echo "switch-theme: invalid empty args"
        echo "switch-theme: usage: switch-theme THEME_NAME"
        echo "Themes: gruvbox, onedark, nord, base16"
    elif [ "${1}" == "gruvbox" ]; then
        cd $DOTFILES_DIR
        cp polybar/gruvbox-config polybar/config
        cp rofi/gruvbox.rasi rofi/theme.rasi
        cp dunst/gruvbox-dunstrc dunst/dunstrc
        cp kitty/gruvbox-kitty.conf kitty/kitty.conf
        cd ..
        echo "switch-theme: changed theme to gruvbox, wallpaper and vim theme should be changed manually"
    elif [ "${1}" == "onedark" ]; then
        cd $DOTFILES_DIR
        cp polybar/onedark-config polybar/config
        cp rofi/onedark.rasi rofi/theme.rasi
        cp dunst/onedark-dunstrc dunst/dunstrc
        cp kitty/onedark-kitty.conf kitty/kitty.conf
        cd ..
        echo "switch-theme: changed theme to onedark, wallpaper and vim theme should be changed manually"
    elif [ "${1}" == "nord" ]; then
        cd $DOTFILES_DIR
        cp polybar/nord-config polybar/config
        cp rofi/nord.rasi rofi/theme.rasi
        cp dunst/nord-dunstrc dunst/dunstrc
        cp kitty/nord-kitty.conf kitty/kitty.conf
        cd ..
        echo "switch-theme: changed theme to nord, wallpaper and vim theme should be changed manually"
    elif [ "${1}" == "base16" ]; then
        cd $DOTFILES_DIR
        cp polybar/base16-config polybar/config
        cp rofi/base16.rasi rofi/theme.rasi
        cp dunst/base16-dunstrc dunst/dunstrc
        cp kitty/base16-kitty.conf kitty/kitty.conf
        cd ..
        echo "switch-theme: changed theme to base16, wallpaper and vim theme should be changed manually"
    fi
}
