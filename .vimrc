"--------------------------------------------------------------------------
" neobundle
set nocompatible               " Be iMproved
filetype off                   " Required!

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.vim/bundle/'))

filetype plugin indent on     " Required!

" Installation check.
if neobundle#exists_not_installed_bundles()
  echomsg 'Not installed bundles : ' .
        \ string(neobundle#get_not_installed_bundle_names())
  echomsg 'Please execute ":NeoBundleInstall" command.'
  "finish
endif

call neobundle#end()

colorscheme desert
set cursorline

"-------------------------------------------------------
"オプション設定, 基本設定
"-------------------------------------------------------

" <Leader>キーを「,」に変更
let mapleader = ","
" 一行に長い文章を書いていても自動折り返しをしない
set textwidth=0
" 一行に長い文章を書いていても自動折り返しをしない
set textwidth=0
"見えない文字の可視化を行う
" スワップファイル作らない
set noswapfile

set list
set listchars=tab:>\ 

set shiftwidth=3
set hidden
set number
set title
set laststatus=2
set showcmd
set ruler
set clipboard+=unnamed
set display=lastline
set ambiwidth=double
set shellslash
set ignorecase
set smartcase
set incsearch
set wildmenu
set whichwrap=b,s,[,],<,>
set backspace=indent,eol,start
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

set printoptions=number:y
"新しい行のインデントを現在行と同じにする
set autoindent
"新しい行を作ったときに高度な自動インデントを行う
set smartindent
"行頭の余白内でTabを打ち込むと'shiftwidth'の数だけインデントする
set smarttab
"カーソルと行頭、行末でとまらないようにする
set whichwrap=b,s,h,l,<,>,[,]

"--- <F6>  タイムスタンプを挿入してinsertモードへ移行 ----
nmap <F6> <ESC>i<C-R>=strftime("%Y/%m/%d (%a) %H:%M")<CR><CR>


"-------------------------------------------------------
" 操作関連
"-------------------------------------------------------

"-------------------------------------------------------
" easybuffer
"-------------------------------------------------------
NeoBundle 'troydm/easybuffer.vim'

"-------------------------------------------------------
" markdown関係
"-------------------------------------------------------
NeoBundle 'plasticboy/vim-markdown'
NeoBundle 'kannokanno/previm'

au BufRead,BufNewFile *.md set filetype=markdown
"-------------------------------------------------------
"vim-latex設定 (備考)原因不明のエラーにより動作不能、原因解明急ぐ
"-------------------------------------------------------
"NeoBundle 'git://git.code.sf.net/p/vim-latex/vim-latex'

"-------------------------------------------------------
"switch設定
"-------------------------------------------------------
"NeoBundle 'AndrewRadev/switch.vim'

"-------------------------------------------------------
"vim-quickrun設定 (備考)原因不明のエラーにより動作不能、原因解明急ぐ 香り屋vimで動かないという報告あり
"-------------------------------------------------------
NeoBundle 'thinca/vim-quickrun'

"-------------------------------------------------------
"The-NERD-tree設定
"-------------------------------------------------------
NeoBundle 'The-NERD-tree'
" http://kokukuma.blogspot.jp/2012/03/vim-nerdtree.html
 
" カーソルが外れているときは自動的にnerdtreeを隠す
function! ExecuteNERDTree()
"b:nerdstatus = 1 : NERDTree 表示中
"b:nerdstatus = 2 : NERDTree 非表示中
 
if !exists('g:nerdstatus')
execute 'NERDTree ./'
let g:windowWidth = winwidth(winnr())
let g:nerdtreebuf = bufnr('')
let g:nerdstatus = 1
 
elseif g:nerdstatus == 1
execute 'wincmd t'
execute 'vertical resize' 0
execute 'wincmd p'
let g:nerdstatus = 2
elseif g:nerdstatus == 2
execute 'wincmd t'
execute 'vertical resize' g:windowWidth
let g:nerdstatus = 1
 
endif
endfunction
noremap <c-e> :<c-u>:call ExecuteNERDTree()<cr>
""最後に残ったウィンドウがNERDTREEのみのときはvimを閉じる
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
let g:NERDTreeDirArrows=0
let g:NERDTreeMouseMode=0

"-------------------------------------------------------
"open-browser設定
"-------------------------------------------------------
NeoBundle 'tyru/open-browser.vim'
" カーソル下のURLを「gx」で開く
" http://vim-users.jp/2011/08/hack225/
let g:netrw_nogx = 1 " disable netrw's gx mapping.
nmap gx <Plug>(openbrowser-smart-search)
vmap gx <Plug>(openbrowser-smart-search)

"-------------------------------------------------------
"open-browser設定
"-------------------------------------------------------
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimproc'

"-------------------------------------------------------
"undotree.vim設定
"-------------------------------------------------------
NeoBundle 'mbbill/undotree'
nmap <Space>u :UndotreeToggle<CR>
let g:undotree_SetFocusWhenToggle = 1
let g:undotree_WindowLayout = 'topleft'
let g:undotree_SplitWidth = 35
let g:undotree_diffAutoOpen = 1
let g:undotree_diffpanelHeight = 25
let g:undotree_RelativeTimestamp = 1
let g:undotree_TreeNodeShape = '*'
let g:undotree_HighlightChangedText = 1
let g:undotree_HighlightSyntax = "UnderLined"

"-------------------------------------------------------
"YankRing.vim設定
"-------------------------------------------------------
NeoBundle 'YankRing.vim'
"ヤンク履歴表示
nmap <Space>y :YRShow<CR>
" クリップボード共有
" http://vim-users.jp/2010/02/hack126/
set clipboard+=unnamedplus,unnamed

"-------------------------------------------------------
"vim-over設定
"-------------------------------------------------------
NeoBundle 'osyo-manga/vim-over'
" over.vimの起動
nnoremap <Space>m :OverCommandLine<CR>

" カーソル下の単語をハイライト付きで置換
nnoremap sub :OverCommandLine<CR>%s/<C-r><C-w>//g<Left><Left>

" コピーした文字列をハイライト付きで置換
nnoremap subp y:OverCommandLine<CR>%s!<C-r>=substitute(@0, '!', '\\!', 'g')<CR>!!gI<Left><Left><Left>

"-------------------------------------------------------
"neocomplache設定
"-------------------------------------------------------
NeoBundle 'Shougo/neocomplcache.git'
"Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" Enable heavy features.
" Use camel case completion.
"let g:neocomplcache_enable_camel_case_completion = 1
" Use underbar completion.
"let g:neocomplcache_enable_underbar_completion = 1

" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplcache_keyword_patterns')
    let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplcache#smart_close_popup() . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? neocomplcache#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? neocomplcache#close_popup() : "\<Space>"

" For cursor moving in insert mode(Not recommended)
"inoremap <expr><Left>  neocomplcache#close_popup() . "\<Left>"
"inoremap <expr><Right> neocomplcache#close_popup() . "\<Right>"
"inoremap <expr><Up>    neocomplcache#close_popup() . "\<Up>"
"inoremap <expr><Down>  neocomplcache#close_popup() . "\<Down>"
" Or set this.
"let g:neocomplcache_enable_cursor_hold_i = 1
" Or set this.
"let g:neocomplcache_enable_insert_char_pre = 1

" AutoComplPop like behavior.
"let g:neocomplcache_enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplcache_enable_auto_select = 1
"let g:neocomplcache_disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplcache_omni_patterns')
  let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplcache_omni_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
let g:neocomplcache_omni_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplcache_omni_patterns.perl = '\h\w*->\h\w*\|\h\w*::a'

let g:neocomplcache_max_list=1000


"-------------------------------------------------------
"C++入力補完 http://d.hatena.ne.jp/osyo-manga/20131012/1381589852
"-------------------------------------------------------
NeoBundle "osyo-manga/vim-reunions"
NeoBundle "osyo-manga/vim-marching"
"clang コマンドの設定
let g:marching_clang_command = "/usr/bin/clang++"

" オプションを追加する場合
"let g:marching_clang_command_option="-std=c++1y"

" インクルードディレクトリのパスを設定
let g:marching_include_paths = [
\   "/usr/include/c++/4.8",
\   "/opt/ros/indigo/include/"
\]

" neocomplete.vim と併用して使用する場合
let g:marching_enable_neocomplete = 1


" 処理のタイミングを制御する
" 環境に合わせて間隔を短くする
set updatetime=2

" オムニ補完時に補完ワードを挿入したくない場合
"imap <buffer> <C-x><C-o> <Plug>(marching_start_omni_complete)
"
" コード補完を行う
" 2回目以降はキャッシュしたデータを使用する
imap <C-x><C-o> <Plug>(marching_start_omni_complete)

" 補完情報の再取得を行ってからコード補完を行う
imap <C-x><C-o> <Plug>(marching_force_start_omni_complete)

"-------------------------------------------------------
"stargateInclude設定
"-------------------------------------------------------
NeoBundle "osyo-manga/vim-stargate"
" インクルードディレクトリのパスを filetype ごとに設定
let g:stargate#include_paths = {
\   "cpp" : [
\	"/usr/include/c++/4.8",
\	"/opt/ros/indigo/include/"
\   ]
\}
