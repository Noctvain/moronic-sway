#!/bin/bash

ORIGINAL_DIR=$(pwd)
REPO_URL="https://github.com/Noctvain/moronic-sway"
REPO_NAME="moronic-sway"

cd ~

is_paru_installed() {
  sudo pacman -Qi "paru" &> /dev/null
}

if ! is_paru_installed; then
  echo "Installing paru..."
  sudo pacman -S --needed base-devel
  git clone https://aur.archlinux.org/paru.git
  cd paru
  makepkg -si
fi

cd ~

#Install needed packages
echo "Installing packages..."
paru -S --noconfirm --needed swayfx blesh blueman bluez bluez-deprecated-tools bluez-utils brightnessctl btop cava cmake discord firefox gamemode gamescope gimp github-cli gucharmap inxi kitty mako mangohud musescore-bin nautilus noto-fonts noto-fonts-cjk noto-fonts-emoji neovim pavucontrol playerctl protonup-qt qbittorrent smartmontools starship steam stow ttf-dejavu ttf-iosevka-nerd ttf-jetbrains-mono ttf-meslo-nerd ttf-ms-win11-auto unzip vlc  yazi wl-clipboard wl-color-picker waybar wofi fastfetch swaync android-tools android-udev

# Check if the repository already exists
if [ -d "$REPO_NAME" ]; then
  echo "Repository '$REPO_NAME' already exists. Skipping clone"
else
  git clone "$REPO_URL"
fi

# Check if the clone was successful
if [ $? -eq 0 ]; then
  echo "removing old configs"
  rm -rf ~/.bashrc ~/.config/sway/ ~/.config/swaync/ ~/.config/kitty/

  cd "$REPO_NAME"
  stow bashrc
  stow sway
  stow swaync
  stow kitty
  stow waybar
  stow wofi
  stow yazi
  stow fastfetch
  stow nvim
  stow starship
  stow pics
  stow themes
else
  echo "Failed to clone the repository."
  exit 1
fi

