" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
   autocmd VimEnter * PlugInstall
   autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/autoload/plugged')
   
    " Auto pairs for '(' '[' '{'
    Plug 'jiangmiao/auto-pairs'
    
    " Vim Latex plugin
    Plug 'lervag/vimtex'
    
    "For tags
    "Plug 'ludovicchabant/vim-gutentags' 

    "To git
    Plug 'tpope/vim-fugitive' | Plug 'mhinz/vim-signify'

    " Autocomplete 
    " Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
    " Plug 'deoplete-plugins/deoplete-clang'
    " Ultisnpis
    " Plug 'sirver/ultisnips'
    
    " Retro color scheme plug
    " Plug 'rafi/awesome-vim-colorschemes'
    Plug 'morhetz/gruvbox'
    " Plug 'phanviet/vim-monokai-pro'
    
call plug#end()


let g:gruvbox_contrast_dark = 'hard'
colorscheme gruvbox
set background=dark

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