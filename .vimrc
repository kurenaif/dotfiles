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

NeoBundle 'AndrewRadev/switch.vim'
NeoBundle 'troydm/easybuffer.vim'
NeoBundle 'plasticboy/vim-markdown'
NeoBundle 'kannokanno/previm'
"NeoBundle 'git://git.code.sf.net/p/vim-latex/vim-latex'
NeoBundle 'AndrewRadev/switch.vim'
NeoBundle 'The-NERD-tree'
NeoBundle 'tyru/open-browser.vim'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimproc'
NeoBundle 'mbbill/undotree'
NeoBundle 'YankRing.vim'
NeoBundle 'osyo-manga/vim-over'
NeoBundle 'Shougo/neocomplete.vim'
NeoBundle "osyo-manga/vim-stargate"
NeoBundle "mhinz/vim-startify"
NeoBundle "tyru/caw.vim.git"
NeoBundle "mhinz/vim-signify"
NeoBundle 'vim-scripts/DoxygenToolkit.vim'
NeoBundle 'tpope/vim-surround'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'Rip-Rip/clang_complete'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'nathanaelkane/vim-indent-guides'

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

" set list
" set listchars=tab:▸\ 

set tabstop=3
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
set wildmode=list:longest
set backspace=indent,eol,start
set splitbelow
set splitright

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
"ESC二回でハイライト削除
nnoremap <ESC><ESC> :nohlsearch<CR>
"F5でQuickrun
nmap <F5> <ESC>:QuickRun<CR>


"-------------------------------------------------------
" 操作関連
"-------------------------------------------------------

"-------------------------------------------------------
" easybuffer
"-------------------------------------------------------

"-------------------------------------------------------
" quickrun
"-------------------------------------------------------
let g:quickrun_config={'*': {'split': 'vertical'}}

"-------------------------------------------------------
" markdown関係
"-------------------------------------------------------

au BufRead,BufNewFile *.md set filetype=markdown
"-------------------------------------------------------
"vim-latex設定 (備考)原因不明のエラーにより動作不能、原因解明急ぐ
"-------------------------------------------------------

"-------------------------------------------------------
"switch設定
"-------------------------------------------------------
nnoremap + :call switch#Switch(g:variable_style_switch_definitions)<cr>
nnoremap - :Switch<cr>


"-------------------------------------------------------
"vim-quickrun設定 (備考)原因不明のエラーにより動作不能、原因解明急ぐ 香り屋vimで動かないという報告あり
"-------------------------------------------------------

"-------------------------------------------------------
"The-NERD-tree設定
"-------------------------------------------------------
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
" カーソル下のURLを「gx」で開く
" http://vim-users.jp/2011/08/hack225/
let g:netrw_nogx = 1 " disable netrw's gx mapping.
nmap gx <Plug>(openbrowser-smart-search)
vmap gx <Plug>(openbrowser-smart-search)

"-------------------------------------------------------
"open-browser設定
"-------------------------------------------------------

"-------------------------------------------------------
"undotree.vim設定
"-------------------------------------------------------
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
"ヤンク履歴表示
nmap <Space>y :YRShow<CR>
" クリップボード共有
" http://vim-users.jp/2010/02/hack126/
set clipboard+=unnamedplus,unnamed

"-------------------------------------------------------
"vim-over設定
"-------------------------------------------------------
" over.vimの起動
nnoremap <Space>m :OverCommandLine<CR>

" カーソル下の単語をハイライト付きで置換
nnoremap sub :OverCommandLine<CR>%s/<C-r><C-w>//g<Left><Left>

" コピーした文字列をハイライト付きで置換
nnoremap subp y:OverCommandLine<CR>%s!<C-r>=substitute(@0, '!', '\\!', 'g')<CR>!!gI<Left><Left><Left>

"-------------------------------------------------------
"neocomplete設定
"-------------------------------------------------------
"Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 1
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplete#close_popup() . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? neocomplete#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplete#close_popup()
inoremap <expr><C-e>  neocomplete#cancel_popup()
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? neocomplete#close_popup() : "\<Space>"

" For cursor moving in insert mode(Not recommended)
"inoremap <expr><Left>  neocomplete#close_popup() . "\<Left>"
"inoremap <expr><Right> neocomplete#close_popup() . "\<Right>"
"inoremap <expr><Up>    neocomplete#close_popup() . "\<Up>"
"inoremap <expr><Down>  neocomplete#close_popup() . "\<Down>"
" Or set this.
"let g:neocomplete#enable_cursor_hold_i = 1
" Or set this.
"let g:neocomplete#enable_insert_char_pre = 1

" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
"let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
"-------------------------------------------------------
"clang_complete設定
"-------------------------------------------------------
" neocomplcacheとの競合を避けるため、自動呼び出しはOff
let g:clang_complete_auto=1
let g:clang_auto_select=0
"libclangを使う
let g:clang_use_library=1
let g:clang_debug=1
let g:clang_library_path="/usr/lib/clang/3.6.2/lib"
let g:clang_user_options = '-std=c++11'

"-------------------------------------------------------
"stargateInclude設定
"-------------------------------------------------------
" インクルードディレクトリのパスを filetype ごとに設定
let g:stargate#include_paths = {
			\   "cpp" : [
			\   "/usr/lib/gcc/x86_64-linux-gnu/4.9.2/"
			\   ]
			\}

"-------------------------------------------------------
"vim-startify 最近開いたファイルの履歴
"-------------------------------------------------------
" startifyのヘッダー部分に表示する文字列を設定する(dateコマンドを実行して日付を設定している)
let g:startify_custom_header =
			\ map(split(system('date'), '\n'), '"   ". v:val') + ['','']
" デフォルトだと、最近使ったファイルの先頭は数字なので、使用するアルファベットを指定
let g:startify_custom_indices = ['f', 'g', 'h', 'r', 'i', 'o', 'b']
" よく使うファイルをブックマークとして登録しておく
let g:startify_bookmarks = [
			\ '~/.vimrc',
			\ ]

"-------------------------------------------------------
"caw.vim コメントアウト関連
"-------------------------------------------------------
" ,cで行の先頭にコメントをつけたり外したりできる
nmap <Leader>c <Plug>(caw:i:toggle)
vmap <Leader>c <Plug>(caw:i:toggle)

"-------------------------------------------------------
"Vim差分表示 http://deris.hatenablog.jp/entry/2013/12/15/235606
"-------------------------------------------------------
":SignifyToggleで差分表示
" 次の差分箇所に移動
nmap <Leader>gj <Plug>(signify-next-hunk)zz
" 前の差分箇所に移動
nmap <Leader>gk <Plug>(signify-prev-hunk)zz
" 差分箇所をハイライト
nmap <Leader>gh <Plug>(signify-toggle-highlight)
" 差分表示をトグルする(:SignifyToggleコマンドと同じ)
nmap <Leader>gt <Plug>(signify-toggle)

"-------------------------------------------------------
"Doxygen関係
"-------------------------------------------------------

"-------------------------------------------------------
"Mario関係
"-------------------------------------------------------
"-------------------------------------------------------
"Srround関係
"-------------------------------------------------------
"
"-------------------------------------------------------
" vim-indent-guides
"-------------------------------------------------------
"" Vim 起動時 vim-indent-guides をnot自動起動
let g:indent_guides_enable_on_vim_startup=0
" ガイドをスタートするインデントの量
let g:indent_guides_start_level=2
" 自動カラー無効
let g:indent_guides_auto_colors=0
" 奇数番目のインデントの色
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=#444433 ctermbg=black
" 偶数番目のインデントの色
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#333344 ctermbg=darkgray
" ガイドの幅
let g:indent_guides_guide_size = 1
