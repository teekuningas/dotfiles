set visualbell
syntax on
filetype indent plugin on
set background=dark

" Set whitespace managing for every filetype, overriding standard
autocmd FileType xml,htmldjango,python,python.django setlocal ts=4 sts=4 sw=4 expandtab
autocmd FileType javascript,js,jsx,ts setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType makefile setlocal ts=4 sts=4 sw=4 noexpandtab
autocmd FileType tex setlocal wm=3
autocmd FileType pt set sw=4 ts=4 expandtab
autocmd FileType xml set sw=4 ts=4 expandtab
autocmd FileType html set sw=4 ts=4 expandtab

" for bash scripts
autocmd Filetype sh setlocal sts=2 ts=2 sw=2 expandtab

" for html
autocmd Filetype html setlocal ts=2 sts=2 sw=2 expandtab

" for css
autocmd Filetype css setlocal ts=2 sts=2 sw=2 expandtab

" for js
autocmd Filetype js setlocal ts=2 sts=2 sw=2 expandtab

" for .overrides and .variables (less)
autocmd BufNewFile,BufRead *.overrides set ft=less
autocmd BufNewFile,BufRead *.variables set ft=less

" for zcml and pt
autocmd BufNewFile,BufRead *.zcml set ft=xml
autocmd BufNewFile,BufRead *.pt set ft=html syntax=xml

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

" nix syntax highlighting
au BufRead,BufNewFile *.nix set filetype=nix
"
" nix syntax highlighting
au BufRead,BufNewFile *.hcl set filetype=hcl
