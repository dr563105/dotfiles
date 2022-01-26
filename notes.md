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


## VS CODE 
**Install**
`brew install --cask visual-studio-code`

**Uninstall**
use this link to uninstall the app in vs code -- https://stackoverflow.com/a/42603699, https://stackoverflow.com/a/53839847

`brew uninstall visual-studio-code`

## Conda

### Install Conda

**Miniconda3** [https://docs.conda.io/en/latest/miniconda.html](https://docs.conda.io/en/latest/miniconda.html)
Also [the archive](https://repo.anaconda.com/miniconda/). Look for Miniconda3-latest.

```shell
wget -q https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
bash Miniconda3-latest-Linux-x86_64.sh
```

```shell
wget -q https://repo.anaconda.com/miniconda/Miniconda3-latest-MacOSX-arm64.sh
bash Miniconda3-latest-MacOSX-arm64.sh
```

**Miniforge3**[https://github.com/conda-forge/miniforge#miniforge3](https://github.com/conda-forge/miniforge#miniforge3)

```shell
wget -q https://github.com/conda-forge/miniforge/releases/latest/download/Miniforge3-Linux-x86_64.sh
bash Miniforge3-Linux-x86_64.sh
```
or 

```shell
wget -q https://github.com/conda-forge/miniforge/releases/latest/download/Miniforge3-MacOSX-arm64.sh
bash Miniforge3-MacOSX-arm64.sh
```

**Install Mamba package manager**

`conda install -n base mamba -c conda-forge` or `conda install -n base mamba -c fastchan`

After installing Mamba, every command starting with `conda` can be replaced with `mamba`.

### Create an environment

`conda create -n <env-name>`

`conda env create -f environment.yml` # With an environment.yml file 

`conda create --name myclone --clone myenv` # Clone an existing environment 

`conda list --explicit > spec-file.txt` # Save installed packages for later use in same OS.

`conda create --name myenv --file spec-file.txt` # create an identical clone env with packages.

`conda install --name myenv --file spec-file.txt` # install packages in an existing env.

### Delete an environment

`conda info --envs`  or `conda env list` # check environments available

`conda env remove -n <env-name>` # To delete

### Sharing an environment

1. Activate the environment that is to be shared.

2. `conda env export > environment.yml` export to a `yml` file.

### Update packages

`conda update -n <env-name> <package name> -c <channel-name>` # updates only mentioned package

or 

`conda update -n <env-name> --all -c <channel-name>` # updates all installed packages

### Clear cache

`conda clean --all` # Remove index cache, lock files, unused cache packages, and tarballs.
