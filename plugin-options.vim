" ------ Plugin Manager Config ------
nnoremap <silent> <Space>pi :PlugInstall<CR>
nnoremap <silent> <Space>pu :PlugUpdate<CR>
nnoremap <silent> <Space>pc :PlugClean<CR>
" ------ End Plugin Manager ------

" ------ Appearance Config ------
colorscheme kanagawa

" Render CSS colours on text
let g:Hexokinase_highlighters = ['foregroundfull']
" ------ End Appearance ------

" ------ Utility Config ------
" Vim-wiki settings
let g:vimwiki_list = [{'syntax': 'markdown', 'ext': 'md'}]
nnoremap <M-Space> <Plug>VimwikiToggleListItem
vnoremap <M-Space> <Plug>VimwikiToggleListItem

" vimTeX settings
" Disable auto popup of quickfix window
let g:vimtex_quickfix_mode = 0
let g:tex_flavor='latex'
let g:vimtex_view_method='skim'
" Value 1 allows forward search after every successful compilation
let g:vimtex_view_skim_sync=1
" Value 1 allows change focus to skim after command `:VimtexView` is given
let g:vimtex_view_skim_activate=1
autocmd FileType tex nnoremap <silent> <buffer> <Space>lt :VimtexTocToggle<CR>

" Autopairs settings
" Define new pairs in filetypes
autocmd FileType tex let b:AutoPairs = AutoPairsDefine({'$':'$'})
" ------ End Utility ------

" ------ Search Config ------
" Telescope toolbelts
nnoremap <Space>b :Telescope buffers<CR>
nnoremap <Space>f :Telescope find_files<CR>
" Search current buffer
nnoremap <Space>gb :Telescope current_buffer_fuzzy_find<CR>
" Search opened files
nnoremap <Space>gf :Lines<CR>
" Search under current directory
nnoremap <Space>gg :Rg<CR>
nnoremap <Space>gc :Telescope commands<CR>
nnoremap <Space>gd :Telescope zoxide list<CR>
nnoremap <Space>gm :Telescope marks<CR>
nnoremap <Space>gh :Telescope oldfiles<CR>
nnoremap <Space>gr :Telescope registers<CR>
nnoremap <Space>gk :Telescope keymaps<CR>

" NerdTree settings
let g:nerdtree_vis_confirm_open = 0
" ------ End Search ------

" ------ Code Formatting Configs ------
call glaive#Install()

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

" codefmt settings
nnoremap <silent> <Space>cf :FormatCode<CR>
nnoremap <silent> <Space>i gg=G

" ormolu flags
let g:ormolu_options=["--no-cabal"]
let g:ormolu_disable=1
" ------ End Code Formatting ------

" ------ Code Completion and Linting Config ------
" Copilot settings
let g:copilot_assume_mapped = v:true
let g:copilot_no_tab_map = v:true
inoremap <silent><script><expr> <C-CR> copilot#Accept("")
inoremap <silent> <C-L> <Plug>(copilot-accept-line)
inoremap <silent> <C-W> <Plug>(copilot-accept-word)

let g:copilot_filetypes = {
      \ '*': v:false,
      \ 'fish': v:true,
      \ }

" ALE settings
let g:ale_completion_enabled = 0

" Default to disable linting in tex files
autocmd BufRead *.tex ALEDisable

" Coc settings
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
" ------ End Code Completion ------
