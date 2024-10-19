arrow_color() {
    case "$KEYMAP"; in
        "i") echo "${C_GREEN}" ;;
        "vicmd") echo "${C_RED}" ;;
        *) echo "${C_GREEN}" ;;
    esac
}

cmd_arrow() {
#    echo "$(arrow_color)󰒊 ${C_FG}"
    echo "$(arrow_color)󰘧 ${C_FG}"
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

    if [[ ! -z "$TMUX" ]] && [[ "$LAST_CMD" =~ cd.* ]] || [[ "$LAST_CMD" =~ git.* ]]; then
       tmux refresh
    fi

    SHELL_FIRST_EXEC="0"
}
