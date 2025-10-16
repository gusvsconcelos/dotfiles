set -g fish_greeting

if status is-interactive
    starship init fish | source
end

# Alias
alias home='cd ~'
alias up='fastfetch; echo ""; echo "ATUALIZAR SISTEMA"; yay -Syu --noconfirm'
alias clean='yay -Sc --noconfirm; yay -Qtdq | yay -Rns -'
alias ls='lsd'
alias py='python'
alias dev='cd $HOME/Documentos/Dev/'
alias nvc='cd $HOME/.config/nvim/;nvim'
alias nvp='cd $HOME/.config/nvim/'
alias fetch='clear;fastfetch'
alias m='cat /sys/class/drm/card1-HDMI-A-1/status'

fish_add_path /home/gus/.spicetify
