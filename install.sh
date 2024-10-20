CONFIG_DIR=$(realpath $(dirname $0))

[[ -f "$HOME/.zshrc" ]] &&\
    mv "$HOME/.zshrc" "$HOME/.zshrc.old"

ln -s "$CONFIG_DIR/rc.zsh" "$HOME/.zshrc"

[[ $(uname) == "Darwin" ]] && [[ $(which brew) ]] &&\
    brew install gawk grep gnu-sed coreutils
