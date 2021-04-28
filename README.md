# dotfiles
My personal dotfiles

## Installation
Packages to install:
```sh
git clone http://github.com/darioisthebest/dotfiles
# recommended programs
sudo dnf install alacritty polybar i3-gaps herbstluftwm rofi nitrogen picom dunst maim sxiv firefox
```
## Recommended font
Download [here](https://github.com/ryanoasis/nerd-fonts/releases) (nerd fonts)
```sh
# Install UbuntuMono
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/UbuntuMono.zip
unzip UbuntuMono.zip
rm -rf *.zip
sudo mv *.ttf /usr/share/fonts
sudo fc-cache -fv
```
![font](https://imgs3.fontbrain.com/imgs/93/83/f4b0bc1d264a5a7e094eb1ed0c0b/pt-720x360-5f5562.png)

## How to change theme
To change theme run the `switch-theme.sh` script and then run the function `switch-theme` with the
theme name, for example:
```sh
switch-theme THEME_NAME
```
The `THEME_NAME` could be:
 - Nord
 - Onedark
 - Gruvbox
 - Base16
 - Dark

## Screenshots
There are several screenshots available in the `screenshots` folder

### Nord
![nord](./screenshots/nord.png)
### Onedark
![onedark](./screenshots/onedark.png)
### Gruvbox
![gruvbox](./screenshots/gruvbox.png)
### Base16
![base16](./screenshots/base16.png)
### Dark

## Gtk theme
You need to install lxappearance and the gruvbox-gtk and arc-gtk themes

## Set up firefox
Extensions that I use:
 - uBlock Origin
 - Gruvbox hard/onedark theme
 - Dark reader
