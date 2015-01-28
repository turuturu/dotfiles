set encoding=utf-8
set termencoding=utf-8
set fileencodings=utf-8,ucs-bom,iso-2011-jp,euc-jp,cp932
set fileformats=unix,dos,mac
set ambiwidth=double
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab



imap <C-z> <C-y>
syntax enable
set clipboard=unnamed,autoselect
set notitle

set nocompatible               " be iMproved
filetype off

"if has('mac')
  "" let g:vimproc_dll_path = $VIMRUNTIME . '/autoload/proc.so'
  "let g:vimproc_dll_path = $VIMRUNTIME . '/autoload/vimproc_mac.so'
"endif

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
  call neobundle#rc(expand('~/.vim/bundle/'))
endif
" originalrepos on github
NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle 'Shougo/vimproc', {
  \ 'build' : {
    \ 'windows' : 'make -f make_mingw32.mak',
    \ 'cygwin' : 'make -f make_cygwin.mak',
    \ 'mac' : 'make -f make_mac.mak',
    \ 'unix' : 'make -f make_unix.mak',
  \ },
  \ }
NeoBundle 'Shougo/neocomplete'
NeoBundle 'VimClojure'
NeoBundle 'Shougo/vimshell'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'jpalardy/vim-slime'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'nerdtree'
NeoBundle 'rking/ag.vim'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'Townk/vim-autoclose'
"NeoBundle 'm2mdas/phpcomplete-extended'
"NeoBundle 'm2mdas/phpcomplete-extended-laravel'
""NeoBundle 'https://bitbucket.org/kovisoft/slimv'

filetype plugin indent on     " required!
filetype indent on
syntax on

" tell vim to keep a backup file
set backup

" tell vim where to put its backup files
set backupdir=/tmp

" tell vim where to put swap files
set dir=/tmp


" 隠しファイルをデフォルトで表示させる
let NERDTreeShowHidden = 1
 
" <C-e>でNERDTreeをオンオフ いつでもどこでも
nmap <silent> <C-e>      :NERDTreeToggle<CR>
vmap <silent> <C-e> <Esc>:NERDTreeToggle<CR>
omap <silent> <C-e>      :NERDTreeToggle<CR>
imap <silent> <C-e> <Esc>:NERDTreeToggle<CR>
cmap <silent> <C-e> <C-u>:NERDTreeToggle<CR>

" デフォルトでツリーを表示させる
autocmd VimEnter * execute 'NERDTree'

" 他のバッファをすべて閉じた時にNERDTreeが開いていたらNERDTreeも一緒に閉じる
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

nmap <silent> <Space>no :NERDTree %<CR>
nmap <silent> <Space>nt :NERDTreeToggle %<CR>
let g:NERDTreeChDirMode = 0
let g:NERDTreeShowHidden = 1

" syntaastic設定
" let g:syntastic_javascript_checker = ['jshint'] "JavaScriptのSyntaxチェックはjshintで
let g:syntastic_check_on_open = 0 "ファイルオープン時にはチェックをしない
let g:syntastic_check_on_save = 1 "ファイル保存時にはチェックを実施
let g:syntastic_auto_loc_list=2
let g:syntastic_enable_signs = 1
let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '⚠'

"タブ、空白、改行の可視化
set list
set listchars=tab:>.,trail:_,eol:↲,extends:>,precedes:<,nbsp:%
highlight JpSpace cterm=underline ctermfg=Blue guifg=Blue
au BufRead,BufNew * match JpSpace /　/


"neo complete
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_ignore_case = 1
let g:neocomplete#enable_smart_case = 1
if !exists('g:neocomplete#keyword_patterns')
  let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns._ = '\h\w*'
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<S-TAB>"

