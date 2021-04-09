# dotfiles
My personal dotfiles

## Installation
Packages to install:
```sh
git clone http://github.com/darioisthebest/dotfiles
# recommended programs
sudo pacman -S kitty polybar i3-gaps rofi nitrogen picom dunst scrot sxiv
yay -S neovim-git lf pfetch pulseaudio-ctl
# change theme
. ./switch-theme.sh
switch-theme gruvbox | base16 | nord | onedark
```
## Recommended font
Download [here](https://github.com/ryanoasis/nerd-fonts/releases) (nerd fonts)
```sh
# Install mononoki
wget https://github.com/ryanoasis/nerd-fonts/releases/Mononoki.zip
unzip Mononoki.zip
rm -rf *.zip
sudo mv *.ttf /usr/share/fonts
sudo fc-cache -fv
```
![font](https://localfonts.eu/wp-content/uploads/2019/07/Mononoki_950x475_11.png)

## Screenshots
There are several screenshots available in the `screenshots` folder
