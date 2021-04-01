echo "+== Dotfiles install script ==+"

echo "==> Installation scripts requires pacman and yay"

cd
rm -rf $HOME/dotfiles
mkdir $HOME/dotfiles

git clone http://github.com/darioisthebest/dotfiles $HOME/dotfiles

# install dependencies
${SUDO} pacman -S kitty polybar i3-gaps rofi nitrogen picom pfetch lf dunst doas base-devel

# install aur helper (yay)
git clone https://aur.archlinux.org/yay.git $HOME/yay
${SUDO} chown -R  $(whoami):users $HOME/yay
cd $HOME/yay
makepkg -si

# install aur packages
yay -S neovim-git
