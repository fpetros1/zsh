setopt prompt_subst
setopt auto_cd
setopt share_history
setopt append_history
setopt extended_history
setopt hist_expire_dups_first
setopt hist_find_no_dups
setopt hist_ignore_all_dups
setopt hist_no_store
setopt hist_verify

SHELL_FIRST_EXEC="1"
HISTFILE="$HOME/.zsh_history"
ENV_FILE="$HOME/.environment"
ZSH_PLUGINS_FOLDER="$(dirname $(readlink -f $HOME/.zshrc))/plugins"

[[ -f "$ENV_FILE" ]] &&\
	source "$ENV_FILE"

eval "$(zoxide init --cmd cd zsh)"

source "$ZSH_PLUGINS_FOLDER/zsh-autosuggestions/zsh-autosuggestions.zsh"
source "$ZSH_PLUGINS_FOLDER/zsh-vi-mode/zsh-vi-mode.zsh"
source "$ZSH_PLUGINS_FOLDER/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
source "$ZSH_PLUGINS_FOLDER/zsh-autocomplete/zsh-autocomplete.plugin.zsh"

bindkey '^I' menu-complete
bindkey "$terminfo[kcbt]" reverse-menu-complete

C_FG="%F{#DCD7BA}"
C_GREEN="%F{#99BB6C}"
C_BLUE="%F{#7E9CD8}"
C_RED="%F{#E46876}"

arrow_color() {
    case "$ZVM_MODE"; in
        "i") echo "${C_GREEN}" ;;
        "n") echo "${C_RED}" ;;
        *) echo "${C_GREEN}" ;;
    esac
}

cmd_arrow() {
    echo "$(arrow_color)󰒊 ${C_FG}"
}

get_pwd() {
    echo $(pwd | sed -e "s|$HOME|~|g")
}

cmd_pwd() {
    echo "${C_BLUE} $(get_pwd)"$'\n'"${C_FG}" 
}

prmpt() {
    if [[ -z "$TMUX" ]] || [[ ! -z "$NVIM" ]]; then
        echo -n "$(cmd_pwd)"
    fi

    echo "$(cmd_arrow)"
}

PS1='$(prmpt)'

precmd() {
    LAST_CMD=$(history | tail -n 1 | awk '{print $2}')

    [[ "$SHELL_FIRST_EXEC" == "0" ]] && [[ ! "$LAST_CMD" == "clear" ]] &&\
        echo ""

   if [[ ! -z "$TMUX" ]] && [[ "$LAST_CMD" =~ cd.* ]]; then
       tmux refresh
   fi

    SHELL_FIRST_EXEC="0"
}

