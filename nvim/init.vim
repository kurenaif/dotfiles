set number
set autoindent
set tabstop=4
set shiftwidth=4
set noexpandtab
set splitright
set clipboard+=unnamedplus
set hls
set nowrap
set whichwrap=b,s,[,],<,>
set wildmode=list:longest
set backspace=indent,eol,start
set title
" set list
set listchars=tab:>-,trail:-,extends:>,precedes:<,nbsp:%
set number relativenumber
set splitbelow
let mapleader = ","

" Change popup menu color for non selected items
highlight Pmenu ctermfg=lightred ctermbg=black
" Change popup menu color for selected item
highlight PmenuSel ctermfg=white ctermbg=gray

augroup auto_comment_off
    autocmd!
    autocmd BufEnter * setlocal formatoptions-=r
    autocmd BufEnter * setlocal formatoptions-=o
augroup END

imap <c-f> <esc>
nnoremap <F12> :<C-u>setlocal relativenumber!<CR>
nnoremap <ESC><ESC> :nohlsearch<CR>

"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('~/.cache/dein')
  call dein#begin('~/.cache/dein')

  " Let dein manage dein
  " Required:
  call dein#add('~/.cache/dein/repos/github.com/Shougo/dein.vim')

  call dein#load_toml('~/.config/nvim/dein.toml', {'lazy' : 0})
  call dein#load_toml('~/.config/nvim/deinlazy.toml', {'lazy' : 1})

  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
"if dein#check_install()
"  call dein#install()
"endif

"End dein Scripts-------------------------

let g:LanguageClient_serverCommands = {
    \ 'rust': ['rustup', 'run', 'stable', 'rls'],
    \ 'go': ['/home/kurenaif/Desktop/tools/gopls/gopls', '-logfile', '/home/kurenaif/Desktop/tools/gopls/rpc.log', '-rpc.trace', '-debug', 'localhost:9090'],
    \ }

let g:LanguageClient_loggingLevel = "DEBUG"
let g:LanguageClient_loggingFile = '/home/kurenaif/LanguageClient.log'
