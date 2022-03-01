"All plugin related go here

"========= Auto install vim-plug if absent ========================="
if empty(glob('$HOME/.config/nvim/autoload/plug.vim'))
    echom "Downloading junegunn/vim-plug to manage plugins..."
    silent !curl -fLo $HOME/.config/nvim/autoload/plug.vim --create-dirs 
                \https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim   
endif

" Run PlugInstall if there are missing plugins, 
" https://github.com/junegunn/vim-plug/wiki/tips#automatic-installation-of-missing-plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)')) 
            \| PlugInstall --sync | q 
            \| source $MYVIMRC | endif

"====================== Plugins ====================================="
call plug#begin('~/.config/nvim/autoload/plugged')
   
    " Auto pairs for '(' '[' '{'
    " Plug 'jiangmiao/auto-pairs'
    Plug 'LunarWatcher/auto-pairs' 
    " need to update to nvim
    
    "NVIM surround
    Plug 'tpope/vim-surround'
    " Plug 'blackcauldron7/surround.nvim'

    "Vim Latex plugin
    Plug 'lervag/vimtex'
   
    "For commentary
    Plug 'numToStr/Comment.nvim'
    " Plug 'tpope/vim-commentary'

    "To git
    Plug 'tpope/vim-fugitive' 
    "Plug 'mhinz/vim-signify'
    Plug 'lewis6991/gitsigns.nvim'
    " Retro color scheme plug
    Plug 'rafi/awesome-vim-colorschemes'
    Plug 'morhetz/gruvbox'
    Plug 'EdenEast/nightfox.nvim'
    " Plug 'phanviet/vim-monokai-pro'
    
    " Nvim Playground for color scheme testing
    Plug 'nvim-treesitter/playground' 
    "
    "" Install telescope
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim'
    Plug 'nvim-telescope/telescope-fzf-native.nvim', {'do': 'make'}
    
    " Devicons
    Plug 'kyazdani42/nvim-web-devicons'                
    " Tree file browser
    Plug 'kyazdani42/nvim-tree.lua'
    "Status line
    Plug 'nvim-lualine/lualine.nvim'    
    " Syntax highlighting. Recommended updating the parsers on update
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  
    " LSP
    Plug 'neovim/nvim-lspconfig'
    "Autocomplete   
    Plug 'hrsh7th/nvim-cmp' " -- Autocompletion core engine plugin
    Plug 'hrsh7th/cmp-nvim-lsp' " -- LSP source for nvim-cmp
    Plug 'hrsh7th/cmp-buffer' " -- buffer completion
    Plug 'hrsh7th/cmp-path' " -- path completion
    Plug 'saadparwaiz1/cmp_luasnip' " -- snippet compeletion

    "snippets
    Plug 'L3MON4D3/LuaSnip'
    Plug 'rafamadriz/friendly-snippets' " --more snippets
    " Plug 'onsails/lspkind-nvim' " -- vscode-like pictograms 

call plug#end()

"=================================================================="

" let g:gruvbox_contrast_dark = 'hard'
" https://superuser.com/a/552333, http://vimdoc.sourceforge.net/htmldoc/eval.html#exists()
colorscheme nightfox "OceanicNext "afterglow

"==================================================================="
" --- Require plugin configs specially written for nvim. Format - namespace.dir-name.plugin-name
lua require('deepak.telescope')
lua require('deepak.lualine')
lua require('deepak.lsp_config')
lua require('deepak.nvim-tree')
lua require('deepak.treesitter')
lua require('deepak.gitsigns')
lua require('deepak.comment')
" lua require('deepak.surround')

"==================================================================="
"settings for vimtex
let g:tex_flavor='latex'
set conceallevel=1
let g:tex_conceal='abdgms'
let g:vimtex_compiler_latexmk = {'build_dir' : 'build'}

if has('macunix')
    echom "setting Skim as vimtex pdf viewer"
    " ------ For Mac OS -------"
    let g:vimtex_view_method = 'skim'
    let g:vimtex_view_skim_activate = 1
    let g:vimtex_view_skim_sync = 1
    " -------------------------"
else
    echom "setting Zathura as vimtex pdf viewer"
    let g:vimtex_view_method='zathura'
endif

"
" " let g:python3_host_prog = '/opt/homebrew/Caskroom/miniforge/base/envs/fornvim/bin/python'
" "let g:vimtex_viewer_zathura_options = '-x \"nvr --remote +%{line} %{input}"'
" "let g:vimtex_compiler_progname = 'nvr'
" "
let g:vimtex_quickfix_ignore_filters = [
  \'Underfull \\hbox (badness [0-9]*) in paragraph at lines',
  \'Overfull \\hbox ([0-9]*.[0-9]*pt too wide) in paragraph at lines',
  \'Package hyperref Warning: Token not allowed in a PDF string',
  \'Package typearea Warning: Bad type area settings!',
  \]
"===================================================================="
