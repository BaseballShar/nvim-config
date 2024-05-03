" Plugins
call plug#begin()

" Tmux loves vim
Plug 'christoomey/vim-tmux-navigator'

" Kitty scrollback in nvim
Plug 'mikesmithgh/kitty-scrollback.nvim'

" Minimal plugins
Plug 'echasnovski/mini.nvim', { 'branch': 'stable' }

" A nice organic theme
Plug 'sainnhe/everforest'
Plug 'rebelot/kanagawa.nvim'

" A nice terminal
Plug 'akinsho/toggleterm.nvim', {'tag' : 'v2.9.0'}

" Stare into the stars
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', {'do': 'make'}
Plug 'jvgrootveld/telescope-zoxide'

" Git integrations
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" latexify vim
Plug 'lervag/vimtex', {'tag': 'v2.13'}
" Plug 'KeitaNakamura/tex-conceal.vim', {'for': 'tex'}

" Code completion
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Snippets!
" Plug 'honza/vim-snippets'

" Wine Linter
Plug 'w0rp/ale'

" Autoformatters!
Plug 'google/vim-maktaba'
Plug 'google/vim-codefmt'
Plug 'google/vim-glaive'

" Handle haskell formatting
Plug 'sdiehl/vim-ormolu'

" Ask copilot to work for me
Plug 'github/copilot.vim'

" A fabulous syntax highlighter, autoindenter for all languages
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" A nice status bar and buffer line for vim
Plug 'akinsho/bufferline.nvim'
Plug 'nvim-lualine/lualine.nvim'
Plug 'nvim-tree/nvim-web-devicons'

" A nerdy file explorer
Plug 'preservim/nerdtree', {'tag': '7.1.1'}
Plug 'PhilRunninger/nerdtree-visual-selection'
Plug 'ryanoasis/vim-devicons'

" A nice code commenter
Plug 'numToStr/Comment.nvim'

" Bringing fzf to vim
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" You are surrounded!
Plug 'tpope/vim-surround'

" Autopairs
Plug 'jiangmiao/auto-pairs'

" It is cool
Plug 'romainl/vim-cool'

" Notion is a useless and severely bloated markdown wrapper
Plug 'vimwiki/vimwiki'

" Bring colours into my eyes
Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }

" Now you know how deep you are
Plug 'lukas-reineke/indent-blankline.nvim'

call plug#end()
