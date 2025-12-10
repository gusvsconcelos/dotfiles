set -g fish_greeting

if status is-interactive
    starship init fish | source
end

# ──[ Aliases ]─────────────────────────────────────────────────
alias up='clear;fetch;echo "SYSTEM UPDATE:";paru -Syu --noconfirm'
alias clean='paru -Scc --noconfirm; paru -Rns $(paru -Qtdq) --noconfirm'
alias clean-full='paru -Scc --noconfirm; paru -Rns $(paru -Qtdq) --noconfirm; sudo journalctl --vacuum-size=50M --vacuum-time=2weeks; sudo rm -rf /var/tmp/* /tmp/*'
alias ls='lsd'
alias py='python'
alias vim='nvim'
alias fetch='clear;fastfetch'
alias dev='cd $HOME/Documentos/dev/'
alias nv='cd $HOME/.config/nvim/;nvim'
# alias moviestar='clear;py $HOME/Documentos/dev/moviestar/moviestar.py'
