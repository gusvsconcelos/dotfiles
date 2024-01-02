export ZSH="$HOME/.oh-my-zsh"
export PATH="${PATH}:${HOME}/.local/bin/"

(cat ~/.cache/wal/sequences &)

cat ~/.cache/wal/sequences

source ~/.cache/wal/colors-tty.sh

ZSH_THEME="robbyrussell"

plugins=( 
    git
    zsh-autosuggestions
    zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias hyprcfg="code ${HOME}/.config/hypr/hyprland.conf"
alias waycfg="code ${HOME}/.config/waybar"
alias cava="${HOME}/.config/cava/scripts/update-colors.sh"

neofetch --source ~/.config/neofetch/logos/great-wave.png
