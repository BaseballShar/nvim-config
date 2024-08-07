" Set leader key to space
let maplocalleader = " "
let mapleader = " "

" System settings
filetype plugin on
filetype indent on
syntax on
" set mouse=
set history=1000
set termguicolors " Enable 24 bit colors
set timeoutlen=500 " Wait time for key combo
set updatetime=300 " Faster completion"
set signcolumn=yes " Show useful signs next to line numbers

" Display options
set number relativenumber
set showcmd
set cursorline
set linebreak " Avoid wrapping words
set splitbelow " Open split window below
set scrolloff=2 " Leave some lines above and below the cursor

" Tab and indentation
set autoindent
set expandtab
set tabstop=2
set shiftwidth=2
set smarttab

" Searching
set hlsearch
set incsearch
set showmatch
set ignorecase
set smartcase

" Use system clipboard when copying
set clipboard=unnamedplus
set clipboard+=unnamed

" Fuzzy file search & Auto completion
set path+=**
set wildmenu
set wildmode=list:full

" Folding
set foldmethod=indent
set nofoldenable

" Buffers
set autoread " Auto read changed files
