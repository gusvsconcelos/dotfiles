set -g fish_greeting

if status is-interactive
    starship init fish | source
end

# ──[ Aliases ]─────────────────────────────────────────────────
alias up='clear;fetch;echo "SYSTEM UPDATE:";yay -Syu --noconfirm'
alias clean='$HOME/.config/fish/scripts/clean.sh'
alias ls='lsd'
alias py='python'
alias vim='nvim'
alias dev='cd $HOME/Documentos/dev/'
alias fetch='clear;fastfetch'
alias nv='cd $HOME/.config/nvim/;nvim'
alias moviestar='clear;py $HOME/Documentos/dev/moviestar/moviestar.py'
