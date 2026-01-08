set -g fish_greeting
set -g fish_color_command purple

if status is-interactive
    starship init fish | source
end

# ──[ Aliases ]─────────────────────────────────────────────────
alias up='clear;fetch;echo "SYSTEM UPDATE:";yay -Syu --noconfirm'
alias clean='$HOME/.config/fish/scripts/clean.sh'
alias ls='lsd'
alias vim='nvim'
alias py='python'
alias ventoy='sudo $HOME/Documentos/Ventoy/VentoyWeb.sh'
alias dev='cd $HOME/Documentos/dev/'
alias nv='cd $HOME/.config/nvim/;nvim'
alias moviestar='clear;py $HOME/Documentos/dev/moviestar/moviestar.py'
