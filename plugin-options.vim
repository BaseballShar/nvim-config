" ------ Plugin Manager Config ------
nnoremap <silent> <Space>p :Lazy<CR>
" ------ End Plugin Manager ------

" ------ Appearance Config ------
colorscheme everforest
" ------ End Appearance ------

" ------ Utility Config ------
" Vim-wiki settings
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
nnoremap <Space>gm :Telescope marks<CR>
nnoremap <Space>gh :Telescope oldfiles<CR>
nnoremap <Space>gr :Telescope registers<CR>
nnoremap <Space>gk :Telescope keymaps<CR>
" ------ End Search ------

" ------ Code Completion and Linting Config ------
" Copilot settings
let g:copilot_assume_mapped = v:true
let g:copilot_no_tab_map = v:true
inoremap <silent><script><expr> <C-CR> copilot#Accept("")
inoremap <silent> <C-l> <Plug>(copilot-accept-line)
inoremap <silent> <C-w> <Plug>(copilot-accept-word)

" Only enable copilot in these filetypes
let g:copilot_filetypes = {
      \ '*': v:false,
      \ 'fish': v:true,
      \ }

" Mason and LSP settings
nnoremap <Space>ms :Mason<CR>
nnoremap <Space>ml :LspInfo<CR>
" ------ End Code Completion ------
