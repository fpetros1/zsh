source "$ZSH_PLUGINS_FOLDER/zsh-tmux/tmux.plugin.zsh"
source "$ZSH_PLUGINS_FOLDER/zsh-autocomplete/zsh-autocomplete.plugin.zsh"
source "$ZSH_PLUGINS_FOLDER/zsh-autosuggestions/zsh-autosuggestions.zsh"
source "$ZSH_PLUGINS_FOLDER/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"

bindkey '^I' menu-complete
bindkey "$terminfo[kcbt]" reverse-menu-complete
bindkey "^R" history-incremental-search-backward
zstyle ':autocomplete:*' min-input 3
zstyle ':autocomplete:*' delay 0.3

function zle-keymap-select {
  case $KEYMAP in
    *) RPS1="" ;;
  esac
  zle reset-prompt
}

zle -N zle-keymap-select

eval "$(zoxide init --cmd cd zsh)"
eval "$(fzf --zsh)"
