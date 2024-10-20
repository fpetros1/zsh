source "$ZSH_PLUGINS_FOLDER/zsh-tmux/tmux.plugin.zsh"
source "$ZSH_PLUGINS_FOLDER/zsh-autosuggestions/zsh-autosuggestions.zsh"
source "$ZSH_PLUGINS_FOLDER/zsh-completions/zsh-completions.plugin.zsh"
source "$ZSH_PLUGINS_FOLDER/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
source "$ZSH_PLUGINS_FOLDER/fzf-tab-completion/zsh/fzf-zsh-completion.sh"
source "$ZSH_PLUGINS_FOLDER/zsh-vi-mode/zsh-vi-mode.zsh"

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

function zvm_after_init() {
  zvm_bindkey viins "^R" fzf-history-widget
}

zle -N zle-keymap-select

eval "$(zoxide init --cmd cd zsh)"
eval "$(fzf --zsh)"

# Completions
fpath=("$ZSH_PLUGINS_FOLDER/zsh-completions/src" $fpath)
autoload -U compinit; compinit

