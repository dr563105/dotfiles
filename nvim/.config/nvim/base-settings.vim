"These settings are for neovim. For vim you may need to add a few more.
"use :h nvim-defaults to look for neovim default settings and :h vim-differences for
"differences.

let mapleader = ' '
let maplocalleader = ' '

set hidden                              " Required to keep multiple buffers open multiple buffers
set nowrap                              " Display long lines as just one line
set noswapfile                          " Doesn't create swapfiles
set termguicolors
set background=dark

set pumheight=10                        " Makes popup menu smaller

if has('persistent_undo')
    set undodir=~/.config/nvim/undodir       " Set directory for undo files.
    set undofile                    " Automatically save undo history.
endif
set cmdheight=2                         " More space for displaying messages
set textwidth=90
set mouse=a                             " Enable your mouse
set splitbelow                          " Horizontal splits will automatically be below
set splitright                          " Vertical splits will automatically be to the right
set tabstop=4                           " Insert 4 spaces for a tab
set shiftwidth=4                        " Change the number of space characters inserted for indentation
set expandtab                           " Converts tabs to spaces
set smartindent                         " Makes indenting smart

set laststatus=4                        " Always display the status line
set number                              " Line numbers
set relativenumber 						" Relative line numbers for easy navigation
"set cursorline                          " Enable highlighting of the current line
"set showtabline=2                       " Always show tabs
set nobackup                            " 
set nowritebackup                       " 
set updatetime=300                      " Faster completion
set timeoutlen=500                      " By default timeoutlen is 1000 ms

"pbcopy is auto installed in mac. For ubuntu install xsel or xclip through apt package.
set clipboard+=unnamedplus               " Copy paste between vim and everything else

"Search
set hlsearch incsearch                  " Enable incremental search 
set ignorecase         
set smartcase
set ignorecase " Ignore case when searching

" Don't redraw while executing macros (good performance config)
" set lazyredraw

" Disables automatic commenting on newline:
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
autocmd FileType tex,latex,markdown setlocal spell spelllang=en_gb

" au BufRead,BufNewFile *.md setlocal textwidth=80

" Delete trailing white space on save, useful for some filetypes ;)
fun! CleanExtraSpaces()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    silent! %s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfun

if has("autocmd")
    autocmd BufWritePre *.txt,*.js,*.py,*.wiki,*.sh,*.coffee,*.tex,*.bib :call CleanExtraSpaces()
endif

" --- Returns true if paste mode is enabled
" function! HasPaste()
"     if &paste
"         return 'PASTE MODE  '
"     endif
"     return ''
" endfunction

" highlight Visual cterm=NONE ctermbg=236 ctermfg=NONE guibg=Grey40

" --- status bar colors
" au InsertEnter * hi statusline guifg=black guibg=#d7afff ctermfg=black ctermbg=magenta
" au InsertLeave * hi statusline guifg=black guibg=#8fbfdc ctermfg=black ctermbg=cyan
" hi statusline guifg=black guibg=#8fbfdc ctermfg=black ctermbg=cyan

" " --- Statusline customisation
" set statusline=\ %{HasPaste()}%f%m%r%h\ %w\ Line:\ %l/%L[\%p%%]\ \ Column:\ %c
"\ CWD:\ %r%{getcwd()}%h\ \ \
" set statusline=
" set statusline+=%#DiffAdd#%{(mode()=='n')?'\ \ NORMAL\ ':''}
" set statusline+=%#DiffChange#%{(mode()=='i')?'\ \ INSERT\ ':''}
" set statusline+=%#DiffDelete#%{(mode()=='r')?'\ \ RPLACE\ ':''}
" set statusline+=%#Cursor#%{(mode()=='v')?'\ \ VISUAL\ ':''}
" set statusline+=\ %n\           " buffer number
" set statusline+=%#Visual#       " colour
" set statusline+=%{&paste?'\ PASTE\ ':''}
" set statusline+=%{&spell?'\ SPELL\ ':''}
" set statusline+=%#CursorIM#     " colour
" set statusline+=%{FugitiveStatusline()}
" set statusline+=%R                        " readonly flag
" set statusline+=%M                        " modified [+] flag
" set statusline+=%#Cursor#               " colour
" set statusline+=%#CursorLine#     " colour
" set statusline+=\ %t\                   " short file name
" set statusline+=%=                          " right align
" set statusline+=%#CursorLine#   " colour
" set statusline+=\ %Y\                   " file type
" set statusline+=%#CursorIM#     " colour
" set statusline+=\ ln:%02l/%L\ col:%-2c\         " line/total lines
" set statusline+=%#Cursor#       " colour
" set statusline+=\ %3p%%\                " percentage


