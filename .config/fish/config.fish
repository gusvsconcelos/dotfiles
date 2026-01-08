set -g fish_greeting
set -g fish_color_command purple

if status is-interactive
    starship init fish | source
end

# ──[ Aliases ]─────────────────────────────────────────────────
alias up='clear;fetch;echo "SYSTEM UPDATE:";yay -Syu --noconfirm'
alias clean='$HOME/.config/fish/scripts/clean.sh'
alias dev='cd $HOME/Documentos/dev/'
alias nv='cd $HOME/.config/nvim/;nvim'

# CLI Toolkit
alias ls='eza'
alias cat='bat'
alias ex='yazi'
alias zel='zellij'
alias lgit='lazygit'
alias ldocker='lazydocker'
alias vim='nvim'

# Misc
alias py='python'
alias ventoy='sudo $HOME/Documentos/Ventoy/VentoyWeb.sh'
alias moviestar='clear;py $HOME/Documentos/dev/moviestar/moviestar.py'
