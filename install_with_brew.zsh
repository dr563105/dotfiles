#!/usr/bin/zsh

formula_list=(
    antidote
    bat
    coreutils
    curl
    fd
    git
    marksman
    tree
    tree-sitter
    ripgrep
    stow
    wget
)

cask_list=(
    adobe-acrobat-reader
    audacity
    authy
    brave-browser
    discord
    filebot
    firefox
    google-chrome
    keepassxc
    kid3
    mullvadvpn
    protonvpn
    rectangle
    scroll-reverser
    skim
    skype
    spotify
    sublime-text
    tableplus
    the-unarchiver
    visual-studio-code
    vlc
    zoom
)
for i in ${formula_list[@]}; do
    brew install "$i"
done

for i in ${cask_list[@]}; do
    brew install --cask "$i"
done

brew install --HEAD luajit neovim
brew tap hashicorp/tap
brew install hashicorp/tap/terraform
