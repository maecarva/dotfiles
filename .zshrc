eval "$(starship init zsh)"
eval "$(zoxide init zsh)"

# history
HISTFILE="$HOME/.zsh_history"
HISTSIZE=10000
SAVEHIST=10000

setopt EXTENDED_HISTORY
setopt APPEND_HISTORY
setopt SHARE_HISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE

autoload -U history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^[[A" history-beginning-search-backward-end
bindkey "^[[B" history-beginning-search-forward-end

# bindings
bindkey "^[[1;5C" forward-word   # CTRL + Right
bindkey "^[[1;5D" backward-word  # CTRL + Left

# plugins
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# alias
alias ls='eza --icons'
alias cat='bat'

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

alias ct="codecrafters test"
alias cs="codecrafters submit"

# PATH
# pipx
export PATH="/home/mael/.local/bin:$PATH"
# golang
export PATH="/home/mael/go/bin/:$PATH"
