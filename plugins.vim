" Plugins
call plug#begin()

" A nice organic theme
Plug 'sainnhe/everforest'

" A nice terminal
Plug 'akinsho/toggleterm.nvim', { 'tag' : 'v2.9.0'}

" Stare into the stars
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

" Git integrations
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
" Plug 'lewis6991/gitsigns.nvim', { 'tag': 'v0.7' }

" latexify vim
Plug 'lervag/vimtex', { 'tag': 'v2.13' }

" Code completion
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Snippets!
Plug 'honza/vim-snippets'

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
" Plug 'tpope/vim-commentary', { 'tag': 'v1.3'}
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

" todo LIST
Plug 'aserebryakov/vim-todo-lists'

call plug#end()

colorscheme everforest

call glaive#Install()

" vim-plug maps
nnoremap <silent> <Space>pi :PlugInstall<CR>
nnoremap <silent> <Space>pu :PlugUpdate<CR>
nnoremap <silent> <Space>pc :PlugClean<CR>

" Telescope toolbelts
nnoremap <Space>ff <cmd>Telescope find_files<cr>
nnoremap <Space>fg <cmd>Telescope live_grep<cr>
nnoremap <Space>fb <cmd>Telescope buffers<cr>
nnoremap <Space>fh <cmd>Telescope help_tags<cr>

augroup autoformat_settings
  autocmd BufRead * NoAutoFormatBuffer
  autocmd FileType c,cpp AutoFormatBuffer clang-format
  autocmd FileType fish AutoFormatBuffer fish_indent
  autocmd FileType haskell nnoremap <silent> <buffer> <Space>cf :call RunOrmolu()<CR>
  autocmd FileType java AutoFormatBuffer google-java-format
  autocmd FileType html,css,sass,scss,less,json,jsonc,javascript,typescript,markdown AutoFormatBuffer prettier
  autocmd FileType lua nnoremap <silent> <buffer> <Space>cf :%!lua-format<CR>
  autocmd FileType python AutoFormatBuffer autopep8
  autocmd FileType tex nnoremap <silent> <buffer> <Space>cf :%!latexindent-macos<CR>
augroup END

" Git maps
nnoremap <silent> <Space>ga :Git add --all<CR>
nnoremap <silent> <Space>gb :Git branch<CR>
nnoremap <silent> <Space>gc :Git commit<CR>
nnoremap <silent> <Space>gd :Git diff<CR>
nnoremap <silent> <Space>gdc :Git diff --cached<CR>
nnoremap <silent> <Space>gf :Git fetch<CR>
nnoremap <silent> <Space>gr :Git reset<CR>
nnoremap <silent> <Space>grh :Git reset --hard<CR>
nnoremap <silent> <Space>gs :Git status<CR>
nnoremap <silent> <Space>gp :Git push<CR>
nnoremap <silent> <Space>gl :Git pull<CR>

" vimtex options
" Disable auto popup of quickfix window
let g:vimtex_quickfix_mode = 0
let g:tex_flavor='latex'
let g:vimtex_view_method='skim'
" Value 1 allows forward search after every successful compilation
let g:vimtex_view_skim_sync=1
" Value 1 allows change focus to skim after command `:VimtexView` is given
let g:vimtex_view_skim_activate=1
autocmd FileType tex nnoremap <silent> <buffer> <Space>lt :VimtexTocToggle<CR>

" ormolu flags
let g:ormolu_options=["--no-cabal"]
let g:ormolu_disable=1

" copilot
let g:copilot_assume_mapped = v:true
let g:copilot_no_tab_map = v:true
inoremap <silent><script><expr> <C-CR> copilot#Accept("")
inoremap <silent> <C-L> <Plug>(copilot-accept-line)
inoremap <silent> <C-W> <Plug>(copilot-accept-word)

" NerdTree
let g:nerdtree_vis_confirm_open = 0

" codefmt
nnoremap <silent> <Space>cf :FormatCode<CR>
nnoremap <silent> <Space>i gg=G

" ale
let g:ale_completion_enabled = 1

" coc
" Use tab for trigger completion with characters ahead and navigate
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list
nnoremap <silent> [g <Plug>(coc-diagnostic-prev)
nnoremap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation
nnoremap <silent> gd <Plug>(coc-definition)
nnoremap <silent> gy <Plug>(coc-type-definition)
nnoremap <silent> gi <Plug>(coc-implementation)
nnoremap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Symbol renaming
nnoremap <leader>rn <Plug>(coc-rename)

" Remap keys for applying refactor code actions
nnoremap <silent> <leader>re <Plug>(coc-codeaction-refactor)
xnoremap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)
nnoremap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)

" Run the Code Lens action on the current line
nnoremap <leader>cl  <Plug>(coc-codelens-action)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server
xnoremap if <Plug>(coc-funcobj-i)
onoremap if <Plug>(coc-funcobj-i)
xnoremap af <Plug>(coc-funcobj-a)
onoremap af <Plug>(coc-funcobj-a)
xnoremap ic <Plug>(coc-classobj-i)
onoremap ic <Plug>(coc-classobj-i)
xnoremap ac <Plug>(coc-classobj-a)
onoremap ac <Plug>(coc-classobj-a)

" Add (Neo)Vim's native statusline support
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics
nnoremap <silent><nowait> <Space>ca  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent><nowait> <Space>ce  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent><nowait> <Space>cc  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent><nowait> <Space>co  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent><nowait> <Space>cs  :<C-u>CocList -I symbols<cr>
" Do default action for next item
nnoremap <silent><nowait> <Space>cj  :<C-u>CocNext<CR>
" Do default action for previous item
nnoremap <silent><nowait> <Space>ck  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent><nowait> <Space>cp  :<C-u>CocListResume<CR>
