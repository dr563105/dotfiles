#!/usr/bin/zsh

formula_list=(
    antibody
    bat
    coreutils
    fd
    git
    pyright
    tmux
    tree
    tree-sitter
    ripgrep
    stow
)

cask_list=(
    rectangle
    visual-studio-code
    spotify
    kid3
)
for i in ${formula_list[@]}; do
    brew install "$i"
done

for i in ${cask_list[@]}; do
    brew install --cask "$i"
done

brew install --HEAD luajit neovim
