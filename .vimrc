set visualbell
set tabstop=4
set expandtab
set shiftwidth=4
set softtabstop=4
syntax on
filetype indent plugin on
set background=dark

" for bash scripts
autocmd Filetype sh setlocal sts=2 ts=2 sw=2 expandtab

" for html
autocmd Filetype html setlocal ts=2 sts=2 sw=2 expandtab

" for css
autocmd Filetype css setlocal ts=2 sts=2 sw=2 expandtab

" for js
autocmd Filetype js setlocal ts=2 sts=2 sw=2 expandtab

" swapfiles
set swapfile
set dir=~/tmp/swapfiles

" disable arrows
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
