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

" highlight SpecialKey cterm=NONE ctermfg=7 guifg=7
" let g:solarized_termcolors=256
" let g:solarized_termtrans=1
" function! ActivateInvisibleIndicator()
"   hi SpecialKey cterm=NONE ctermfg=darkgray guifg=darkgray
"   hi ZenkakuSpace cterm=underline ctermfg=red gui=underline guifg=#FF0000
"   match ZenkakuSpace /　/
" endfunction
" augroup InvisibleIndicator
"   autocmd!
"   autocmd BufEnter * call ActivateInvisibleIndicator()
" augroup END


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
