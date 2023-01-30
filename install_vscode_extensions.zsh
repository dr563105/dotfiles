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
    hashicorp.terraform
    ms-kubernetes-tools.vscode-kubernetes-tools
    ms-toolsai.jupyter-keymap
    ms-vscode.remote-explorer
    ms-vscode-remote.remote-containers
    ms-vscode-remote.remote-ssh
    ms-vscode-remote.remote-ssh-edit
    rangav.vscode-thunder-client
    redhat.vscode-yaml
    quarto.quarto
)
cpp_extension=(
    cschlosser.doxdocgen
    jeff-hykin.better-cpp-syntax
    ms-vscode.cmake-tools
    ms-vscode.cpptools
    ms-vscode.cpptools-extension-pack
    twxs.cmake
)

for i in ${extension_list[@]}; do
    code --install-extension "$i"
done

for i in $(cpp_extension[@])}; do 
    code --install-extension "$i"
done
