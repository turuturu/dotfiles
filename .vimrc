set encoding=utf-8
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


if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
  call neobundle#rc(expand('~/.vim/bundle/'))
endif
" originalrepos on github
NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle 'Shougo/vimproc'
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

"タブ、空白、改行の可視化
set list
set listchars=tab:>.,trail:_,eol:↲,extends:>,precedes:<,nbsp:%
highlight JpSpace cterm=underline ctermfg=Blue guifg=Blue
au BufRead,BufNew * match JpSpace /　/
