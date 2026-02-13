set -g fish_greeting
set -g fish_color_command blue

if status is-interactive
    starship init fish | source
end

# ──[ Aliases ]─────────────────────────────────────────────────
alias up='clear;fetch;echo "SYSTEM UPDATE:";yay -Syu --noconfirm;clean packages'
alias clean='$HOME/.config/fish/scripts/clean.sh'
alias dev='cd $HOME/Documentos/dev/'
alias nv='cd $HOME/.config/nvim/;nvim'

# CLI Toolkit
alias ls='eza'
alias cat='bat'
alias ex='yazi'
alias zel='zellij'
alias lg='lazygit'
alias ld='lazydocker'
alias py='python'
alias vim='nvim'
alias zed='zeditor'

# Misc
alias ventoy='sudo $HOME/.ventoy/VentoyWeb.sh'
alias moviestar='clear;py $HOME/Documentos/dev/moviestar/moviestar.py'
