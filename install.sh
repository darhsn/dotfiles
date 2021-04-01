echo "+== Dotfiles install script ==+"

if [ "$(whoami)" != "root" ]; then
    echo "ERR: Installation script requires root privileges"
    exit
fi
