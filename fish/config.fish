set -g fish_greeting

if status is-interactive
    starship init fish | source
end

# Alias
alias home='cd ~'
alias up='fetch; echo ""; echo "ATUALIZAR SISTEMA"; yay -Syu --noconfirm'
alias clean='yay -Sc --noconfirm; yay -Qtdq | yay -Rns -'
alias ls='lsd'
alias py='python'
alias vim='nvim'
alias nvc='nvim ~/.config/nvim/'
alias nvp='cd ~/.config/nvim/'
alias dev='cd ~/Documentos/Dev/'
alias fetch='clear;rxfetch'
alias vencord='sh -c "$(curl -sS https://raw.githubusercontent.com/Vendicated/VencordInstaller/main/install.sh)"'
alias tray='sudo -E hardcode-tray'

# Handy change dir shortcuts
abbr .. 'cd ..'
abbr ... 'cd ../..'
abbr .3 'cd ../../..'
abbr .4 'cd ../../../..'
abbr .5 'cd ../../../../..'

# Always mkdir a path (this doesn't inhibit functionality to make a single dir)
abbr mkdir 'mkdir -p'

pokemon-colorscripts -r --no-title
