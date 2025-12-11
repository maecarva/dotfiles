eval "$(starship init zsh)"
eval "$(zoxide init zsh)"
alias ls='eza --icons'
alias cat='bat'

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

# 
bindkey "^[[1;5C" forward-word   # CTRL + Right
bindkey "^[[1;5D" backward-word  # CTRL + Left
bindkey "^[[3~" delete-char
bindkey "^?" backward-delete-char

source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
