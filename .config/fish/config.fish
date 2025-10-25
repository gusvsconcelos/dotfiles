set -g fish_greeting

if status is-interactive
    starship init fish | source
end

# Alias
alias up='clear;fetch;echo "SYSTEM UPDATE:";yay -Syu --noconfirm'
alias clean='yay -Scc --noconfirm; yay -Rns $(yay -Qtdq) --noconfirm'
alias clean-full='yay -Scc --noconfirm; yay -Rns $(yay -Qtdq) --noconfirm; sudo journalctl --vacuum-size=50M --vacuum-time=2weeks; sudo rm -rf /var/tmp/* /tmp/*'
alias ls='lsd'
alias py='python'
alias fetch='clear;fastfetch'
alias dev='cd $HOME/Documentos/Dev/'
alias vim='nvim'
alias nv='cd $HOME/.config/nvim/;nvim'

alias moviestar='clear;py $HOME/Documentos/Dev/moviestar/moviestar.py'
