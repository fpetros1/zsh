open_neovim() {
    if [[ -z "$1" ]]; then
        "$EDITOR" .
        exit
    fi

    OLD_PWD=$(pwd)

    trap "cd ${OLD_PWD}; exit" SIGINT ERR EXIT

    if [[ -d "$1" ]]; then 
        cd "$1" 
        "$EDITOR" .
        exit
    fi

    REALPATH=$(readlink -f "$1")

    cd "$(dirname "$REALPATH")"
    "$EDITOR" "$REALPATH"
}

