# Notes
## ZSH and related

```shell
brew install zsh
```

To use zsh ability to use plugins to bring in features and also be aware of performance,
**antibody**, a framework is used to install plugins. 

```shell
brew install antibody
```
All plugins necessary go inside a text file and that file is bundled to a shell script. 

```bash
antibody bundle < ~/.zsh_plugins.txt > ~/.zsh_plugins.sh
echo -n 'source ~/.zsh_plugins.sh' >> ~/.zshrc
```

## Neovim

In Mac, neovim is installed via homebrew. [Link](https://github.com/neovim/neovim/wiki/Installing-Neovim#homebrew-on-macos-or-linux).

### Stable Version

```bash
brew install neovim
```

### Development version

```bash
brew install --HEAD luajit neovim

To update dev version,
brew reinstall neovim
or
brew upgrade neovim
```

For Ubuntu, use this [link](https://github.com/neovim/neovim/wiki/Installing-Neovim#ubuntu).

### vim-plug
[link](https://github.com/junegunn/vim-plug).

To install

```shell
sh -c curl -fLo $HOME/.config/nvim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

### Dependent packages for nvim
Plugin/packages/language servers such as `pyright`, `ripgrep`, `fd` are installed using `brew install ...`

## GNU Stow

GNU Stow is installed through homebrew `brew install stow`

Helpful resource - https://www.jakewiesler.com/blog/managing-dotfiles

## Tree command for directory tree
A pretty awesome tool to display a directory's tree structure. See [here](http://mama.indstate.edu/users/ice/tree/index.html)  

```bash
brew install tree #for mac
sudo apt install tree #for ubuntu
```
## Kitty Terminal

### Themes
Easiest way to preview and download themes is `kitty +kitten themes`.


