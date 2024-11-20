eval "$(starship init zsh)"

arrow_color() {
    case "$ZVM_MODE"; in
        "i") echo "${C_GREEN}" ;;
        "n") echo "${C_RED}" ;;
        *) echo "${C_GREEN}" ;;
    esac
}

cmd_symbol() {
    echo "$(arrow_color)󰘧 ${C_FG}"
}

precmd() {
    LAST_CMD=$(history | tail -n 1 | awk '{print $2}')

    [[ "$SHELL_FIRST_EXEC" == "0" ]] && [[ ! "$LAST_CMD" == "clear" ]] &&\
        echo ""

    if [[ ! -z "$TMUX" ]] && [[ "$LAST_CMD" =~ cd.* ]] || [[ "$LAST_CMD" =~ git.* ]]; then
       tmux refresh
    fi

    SHELL_FIRST_EXEC="0"
}

PS1="$PS1"'$(cmd_symbol)'
