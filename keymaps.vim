" Inspired by helix
" Better intraline movement
nnoremap <silent> H _
vnoremap <silent> H _
nnoremap <silent> L $
vnoremap <silent> L $

" U for redo, <C-r> for line restore
nnoremap <silent> U <C-r>
nnoremap <silent> <C-r> U

" Allow small jumps in insert mode
inoremap <C-e> <Esc>wa
inoremap <C-b> <Esc>bi

" Center after moving pages
nnoremap <silent> <C-u> <C-u>zz
nnoremap <silent> <C-d> <C-d>zz
nnoremap <silent> <C-f> <C-f>zz
nnoremap <silent> <C-b> <C-b>zz

" Change split sizes
nnoremap <silent> <S-Right> :vertical resize +2<CR>
nnoremap <silent> <S-Left> :vertical resize -2<CR>
nnoremap <silent> <S-Up> :resize -2<CR>
nnoremap <silent> <S-Down> :resize +2<CR>
nnoremap <silent> + <C-w>=

" Exit to normal mode quickly
inoremap jk <ESC>
tnoremap jk <C-\><C-n>

" Change windows easily
nnoremap <silent> <C-h> <C-w>h
nnoremap <silent> <C-l> <C-w>l
nnoremap <silent> <C-j> <C-w>j
nnoremap <silent> <C-k> <C-w>k

" Quit and save easily
nnoremap <silent> <Space>q :q<CR>
nnoremap <silent> <Space>s :w<CR>

" Open nvim builtin terminal
nnoremap <silent> <C-t> :terminal<CR>
