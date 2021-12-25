"All plugin related go here

" --- Auto install vim-plug if absent
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif


" --- Plugins
call plug#begin('~/.config/nvim/plugged')
   
    " Auto pairs for '(' '[' '{'
    Plug 'jiangmiao/auto-pairs'
    
    " Vim Latex plugin
    Plug 'lervag/vimtex'
    
    "For tags
    "Plug 'ludovicchabant/vim-gutentags' 
    
    "For commentary
    Plug 'tpope/vim-commentary'

    "To git
    Plug 'tpope/vim-fugitive' | Plug 'mhinz/vim-signify'

    " Autocomplete 
    " Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
    " Plug 'deoplete-plugins/deoplete-clang'
    " Ultisnpis
    " Plug 'sirver/ultisnips'
    
    " Retro color scheme plug
    " Plug 'rafi/awesome-vim-colorschemes'
    "Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
    Plug 'morhetz/gruvbox'
    " Plug 'phanviet/vim-monokai-pro'

    " Install telescope
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim'
    Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
    " General
    Plug 'kyazdani42/nvim-web-devicons'                " Devicons
    Plug 'nvim-lualine/lualine.nvim'                   " Status line

    " LSP
    Plug 'neovim/nvim-lspconfig'
    "Autocomplete   
    Plug 'hrsh7th/nvim-cmp' " -- Autocompletion plugin
    Plug 'hrsh7th/cmp-nvim-lsp' " -- LSP source for nvim-cmp
    Plug 'saadparwaiz1/cmp_luasnip' " -- Snippets source for nvim-cmp
    Plug 'L3MON4D3/LuaSnip' " -- Snippets plugin
    Plug 'onsails/lspkind-nvim' " -- vscode-like pictograms 

call plug#end()


let g:gruvbox_contrast_dark = 'hard'
colorscheme gruvbox
"colorscheme tokyonight
set background=dark

" --- Require plugin configs specially written for nvim. Format - namespace.dir-name.plugin-name
lua require('deepak.nvim-plugins.telescope')
lua require('deepak.nvim-plugins.lualine')
lua require('deepak.nvim-plugins.lsp_config')

"settings for ultisnips
"let g:UltiSnipsSnippetDirectories=['UltiSnips']
"let g:UltiSnipsExpandTrigger = '<tab>'
"let g:UltiSnipsJumpForwardTrigger = '<tab>'
"let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'

"settings for vimtex
let g:tex_flavor='latex'
set conceallevel=1
let g:tex_conceal='abdgms'
let g:vimtex_compiler_latexmk = {
        \ 'build_dir' : 'build',
        \}
"let g:vimtex_viewer_zathura_options = '-x \"nvr --remote +%{line} %{input}"'
"let g:vimtex_compiler_progname = 'nvr'
"let g:vimtex_view_method='zathura'
"let g:vimtex_quickfix_ignore_filters = [
"  \'Underfull \\hbox (badness [0-9]*) in paragraph at lines',
"  \'Overfull \\hbox ([0-9]*.[0-9]*pt too wide) in paragraph at lines',
"  \'Package hyperref Warning: Token not allowed in a PDF string',
"  \'Package typearea Warning: Bad type area settings!',
"  \]

"deoplete settings
" let g:deoplete#enable_at_startup = 1

"deoplete setting for vimtex
"call deoplete#custom#var('omni', 'input_patterns', {
"      \ 'tex': g:vimtex#re#deoplete
"      \})
