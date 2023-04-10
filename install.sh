#!/bin/bash

sudo pacman -S git stow neovim xclip picom rofi polybar lazygit ranger alacritty nodejs npm feh maim ripgrep xdotool xcape
yay -S ttf-hack-nerd sct

git clone https://github.com/dalmamad/dotfiles.git ~/.dotfiles

sudo rm -r ~/.config/i3/ ~/.config/lazygit/ ~/.config/rofi/ ~/.bashrc
stow -d ~/.dotfiles -t ~/ alacritty i3 lazygit nvim picom polybar ranger rofi xprofile bash
