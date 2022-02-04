#!/usr/bin/zsh

extension_list=(
    aaron-bond.better-comments
    arcticicestudio.nord-visual-studio-code
    eamodio.gitlens
    enkia.tokyo-night
    esbenp.prettier-vscode
    GulajavaMinistudio.mayukaithemevsc
    ms-azuretools.vscode-docker
    ms-python.python
    ms-python.vscode-pylance
    ms-toolsai.jupyter
    PKief.material-icon-theme
    sainnhe.gruvbox-material
    vscodevim.vim
    wesbos.theme-cobalt2
)

for i in ${extension_list[@]}; do
    code --install-extension "$i"
done
