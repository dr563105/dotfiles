" Use alt + hjkl to resize windows
nnoremap <M-j>    :resize -2<CR>
nnoremap <M-k>    :resize +2<CR>
nnoremap <M-h>    :vertical resize -2<CR>
nnoremap <M-l>    :vertical resize +2<CR>

" Split window horizontally or vertically
nnoremap ,h <C-w>s
nnoremap ,v <C-w>v

" Better window navigation(move between windows)
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Buffer between buffers
noremap <leader>j :bnext<cr>
noremap <leader>h :bprevious<cr>

" A quick way to escape to normal mode. 
inoremap jk <Esc>

" Alternate way to save
inoremap <C-s> <Esc>:w<CR>
nnoremap <C-s> :w<CR>
" Alternate way to quit
nnoremap <C-Q> :wq!<CR>

"Mapping copy and paste
map <C-a> ggVG

"Copying to both clipboard and primary selection. Great for linux users.
vnoremap <C-c> "*y :let @+=@*<CR>
map <C-v> "+P
" map <C-v> "_P
"To swap two line use 'ddp'

" Better tabbing
vnoremap < <gv
vnoremap > >gv

"Spell checker
inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u

" Assign f9 for exe python script on the current buffer
autocmd FileType python map <buffer> <F9> :w<CR>:exec '!python3' shellescape(@%, 1)<CR>
autocmd FileType python imap <buffer> <F9> <esc>:w<CR>:exec '!python3' shellescape(@%, 1)<CR>

"vimtex bindings
nmap <localleader>li <plug>(vimtex-info)
nmap <localleader>lI <plug>(vimtex-info-full)
nmap <localleader>lt <plug>(vimtex-toc-open)
nmap <localleader>lT <plug>(vimtex-toc-toggle)
nmap <localleader>lv <plug>(vimtex-view)
nmap <localleader>ll <plug>(vimtex-compile)
nmap <localleader>lL <plug>(vimtex-compile-output)
nmap <localleader>lr <plug>(vimtex-reverse-search)
nmap <localleader>lg <plug>(vimtex-status)

"Folding with nvim-treesitter
"Use keys 'zc' to close folds, 'zo' to open one fold, 
"and 'zO' to recursively open all.
