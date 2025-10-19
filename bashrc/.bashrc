#
# ~/.bashrc
#

[[ $- != *i* ]] && return

export PATH="$HOME/.local/bin:$PATH"
export TERMINAL=kitty
export SUDO_EDITOR=nvim

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias svim='sudoedit'
alias pac='sudo pacman'
alias pacs='sudo pacman -S --needed --noconfirm'
alias grubupd='sudo grub-mkconfig -o /boot/grub/grub.cfg'
alias colors='nvim .config/waybar/colors.css'

eval "$(starship init bash)"
source ~/.local/share/blesh/ble.sh
