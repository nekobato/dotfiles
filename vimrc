if filereadable("/etc/vim/vimrc")
  source /etc/vim/vimrc
endif


"
" Coloring
"
syntax enable
set background=dark


"
" Indentation
"
set tabstop=2
set shiftwidth=2
set expandtab
set autoindent


" 不可視文字の可視化
set list
set lcs=tab:>\s,trail:_,extends:\
highlight SpecialKey cterm=NONE ctermfg=7 guifg=skyblue2
let g:solarized_termcolors=256
let g:solarized_termtrans=1
function! ActivateInvisibleIndicator()
  hi SpecialKey cterm=NONE ctermfg=darkgray guifg=darkgray
  hi ZenkakuSpace cterm=underline ctermfg=red gui=underline guifg=#FF0000
  match ZenkakuSpace /　/
endfunction
augroup InvisibleIndicator
  autocmd!
  autocmd BufEnter * call ActivateInvisibleIndicator()
augroup END


" Mouse
set mouse=a
set ttymouse=xterm2


"
" File & Backups
"
set nowritebackup
set nobackup
set noswapfile


"
" Global configuration
"
set ambiwidth=double
set autoread
set autowrite
set backspace=indent,eol,start
set complete+=k
set cursorline
set hidden
set history=1000
set hlsearch
set ignorecase
set incsearch
set laststatus=2
set lazyredraw
set matchtime=1
set notitle
set nowrap
set number
set ruler
set scrolloff=5
set showcmd
set showmatch
set smartcase
set t_Co=256
set ttyfast
set ttyscroll=3
set undodir=~/.vim/undo
set undofile
set wildchar=<tab>
" set wildignorecase
set wildmenu
set wildmode=list:full

" no beep
set visualbell t_vb=
set noerrorbells


"
" neobundle initilize
"
if has('vim_starting')
  set nocompatible
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.vim/bundle/'))

NeoBundleFetch 'Shougo/neobundle.vim'

" add plugins

" Program
NeoBundle 'thinca/vim-quickrun'
autocmd FileType quickrun AnsiEsc

" Utility
NeoBundle 'AnsiEsc.vim'
NeoBundle 'banyan/recognize_charcode.vim'
NeoBundle 'airblade/vim-gitgutter'
NeoBundle 'grep.vim'

" Syntax
NeoBundle 'scrooloose/syntastic'
NeoBundle 'sheerun/vim-polyglot'

" Tree
NeoBundle 'scrooloose/nerdtree'
" 起動時にオン
" autocmd vimenter * NERDTree
autocmd VimEnter * wincmd p
" 表示がNerdTreeのみだったら自動でclose
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
" NerdTree Size
let g:NERDTreeWinSize=20

NeoBundle 'https://github.com/nathanaelkane/vim-indent-guides.git'
" 起動時にオン
let g:indent_guides_enable_on_vim_startup = 1
" ガイドの開始位置
let g:indent_guides_start_level = 1
" ガイドの表示幅
let g:indent_guides_guide_size = 1
" ガイドの色設定
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=black   ctermbg=black
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=gray ctermbg=gray

NeoBundle 'Shougo/neocomplcache'
" 補完ウィンドウの設定
set completeopt=menuone
" 起動時に有効化
let g:neocomplcache_enable_at_startup = 1
" 大文字が入力されるまで大文字小文字の区別を無視する
let g:neocomplcache_enable_smart_case = 1
" _(アンダースコア)区切りの補完を有効化
let g:neocomplcache_enable_underbar_completion = 1
let g:neocomplcache_enable_camel_case_completion  =  1
" ポップアップメニューで表示される候補の数
let g:neocomplcache_max_list = 20
" シンタックスをキャッシュするときの最小文字長
let g:neocomplcache_min_syntax_length = 3

NeoBundle 'terryma/vim-multiple-cursors'

" neobundle end
call neobundle#end()
filetype plugin indent on
NeoBundleCheck
