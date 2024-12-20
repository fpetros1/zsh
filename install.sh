#!/usr/bin/env sh

CONFIG_DIR=$(realpath $(dirname $0))

[ -f "$HOME/.zshrc" ] &&\
    mv "$HOME/.zshrc" "$HOME/.zshrc.old"

ln -s "$CONFIG_DIR/rc.zsh" "$HOME/.zshrc"

if [ $(uname) = "Darwin" ] && [ $(which brew) ]; then
    HOMEBREW_NO_AUTO_UPDATE=1 brew install gawk grep gnu-sed coreutils
fi

if [ $(which bat) ]; then
    THEMES_FOLDER="$HOME/.config/bat/themes"
    mkdir -p "$THEMES_FOLDER"
    curl "https://raw.githubusercontent.com/rebelot/kanagawa.nvim/refs/heads/master/extras/kanagawa.tmTheme" \
        -o "$THEMES_FOLDER/kanagawa.tmTheme"
    bat cache --build
fi

if [ $(which wezterm) ]; then
    #install wezterm terminfo
    tempfile=$(mktemp)
    curl -o $tempfile "https://raw.githubusercontent.com/wez/wezterm/main/termwiz/data/wezterm.terminfo"
    tic -x -o "$HOME/.terminfo" $tempfile
    rm $tempfile
fi
