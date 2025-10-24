set -g fish_greeting

if status is-interactive
    starship init fish | source
end

# Alias
alias home='cd ~'
alias up='clear;fetch;echo "SYSTEM UPDATE:";yay -Syu --noconfirm'
alias clean='yay -Scc --noconfirm; yay -Rns $(yay -Qtdq) --noconfirm'
alias clean-full='yay -Scc --noconfirm; yay -Rns $(yay -Qtdq) --noconfirm; sudo journalctl --vacuum-size=50M --vacuum-time=2weeks; sudo rm -rf /var/tmp/* /tmp/*'
alias ls='lsd'
alias py='python'
alias dev='cd $HOME/Documentos/Dev/'
alias nvc='cd $HOME/.config/nvim/;nvim'
alias nvp='cd $HOME/.config/nvim/'
alias fetch='clear;fastfetch'
