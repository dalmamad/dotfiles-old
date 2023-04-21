#!/bin/bash

sudo pacman -S git stow neovim xclip picom rofi polybar lazygit ranger alacritty nodejs npm feh maim ripgrep xdotool xcape blueberry flameshot conky xss-lock 
sudo pacman -S redis docker docker-compose
yay -S ttf-hack-nerd sct

sudo pacman -S postgresql
sudo -u postgres initdb -D /var/lib/postgres/data

sudo pacman -S mpv 
yay -S librewolf-bin

sudo systemctl enable mongodb.service
sudo systemctl start mongodb.service
sudo systemctl enable postgresql.service 
sudo systemctl start postgresql.service 
sudo systemctl enable redis.service 
sudo systemctl start redis.service 
sudo systemctl enable docker.service 
sudo systemctl start docker.service 

# sudo rm -r ~/.config/i3/ ~/.config/lazygit/ ~/.config/rofi/ ~/.bashrc
# git clone https://github.com/dalmamad/dotfiles.git ~/.dotfiles

stow alacritty i3 lazygit nvim picom polybar ranger rofi xprofile bash mpv
