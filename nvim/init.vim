set number
set autoindent
set tabstop=4
set shiftwidth=4
set noexpandtab
set splitright
set clipboard+=unnamedplus
set hls
set whichwrap=b,s,[,],<,>
set wildmode=list:longest
set backspace=indent,eol,start
set title
set list
set listchars=tab:>-,trail:-,extends:>,precedes:<,nbsp:%
set number relativenumber
set splitbelow
let mapleader = ","

augroup BinaryXXD
  autocmd!
  autocmd BufReadPost * if &binary | silent !xxd -g 1
  autocmd BufReadPost * set ft=xxd | endif
  autocmd BufWritePre * if &binary | !xxd -r
  autocmd BufWritePre * endif
  autocmd BufWritePost * if &binary | silent !xxd -g 1
  autocmd BufWritePost * set nomod | endif
augroup END

nnoremap <ESC><ESC> :nohlsearch<CR>
nnoremap <F12> :<C-u>setlocal relativenumber!<CR>
imap <c-f> <esc>

if &compatible
    set nocompatible
endif


augroup MyAutoCmd
	autocmd BufRead,BufNewFile *.rs setfiletype rust
    autocmd!
augroup END

if exists('g:nyaovim_version')
    let s:dein_cache_path = expand('~/.cache/nyaovim/dein')
elseif has('nvim')
    let s:dein_cache_path = expand('~/.cache/nvim/dein')
else
    let s:dein_cache_path = expand('~/.cache/vim/dein')
endif

let s:dein_dir = s:dein_cache_path
            \ .'/repos/github.com/Shougo/dein.vim'

if &runtimepath !~ '/dein.vim'
    if !isdirectory(s:dein_dir)
        execute '!git clone https://github.com/Shougo/dein.vim' s:dein_dir
    endif
    execute 'set runtimepath+=' . fnamemodify(s:dein_dir, ':p')
endif

if dein#load_state(s:dein_cache_path)
    call dein#begin(s:dein_cache_path)

    call dein#load_toml('~/.config/nvim/dein.toml', {'lazy' : 0})
    call dein#load_toml('~/.config/nvim/deinlazy.toml', {'lazy' : 1})

    if exists('g:nyaovim_version')
        call dein#add('rhysd/nyaovim-popup-tooltip')
        call dein#add('rhysd/nyaovim-markdown-preview')
        call dein#add('rhysd/nyaovim-mini-browser')
    endif

    call dein#end()
    call dein#save_state()
endif

if dein#check_install()
    call dein#install()
endif

filetype plugin indent on

runtime! options.rc.vim
runtime! keymap.rc.vim

call map(dein#check_clean(), "delete(v:val, 'rf')")
