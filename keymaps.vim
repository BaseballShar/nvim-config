" Inspired by helix
" Better intraline movement
nnoremap <silent> gh _
vnoremap <silent> gh _
nnoremap <silent> gl $
vnoremap <silent> gl $

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

" Switch between buffers
nnoremap <silent> <S-h> :bp<CR>
nnoremap <silent> <S-l> :bn<CR>

" Move lines up and down
" ESC maps to ALT in mac
nnoremap <silent> <A-j> :m+1<CR>
nnoremap <silent> <A-k> :m-2<CR>
vnoremap <silent> <A-j> :m'>+1<CR>gv
vnoremap <silent> <A-k> :m'<-2<CR>gv

" Change split sizes
nnoremap <silent> <S-Right> :vertical resize +2<CR>
nnoremap <silent> <S-Left> :vertical resize -2<CR>
nnoremap <silent> <S-Up> :resize -2<CR>
nnoremap <silent> <S-Down> :resize +2<CR>
nnoremap <silent> + <C-w>=

" Inserting a line of space ,ignoring comments
nnoremap <silent> <Space>o o<Esc>S<Esc>k
nnoremap <silent> <Space>O O<Esc>S<Esc>j

" Exit to normal mode quickly
inoremap jk <ESC>
inoremap kj <ESC>

" Buffer management
nnoremap <silent> <Space>d :bd<CR>

" Change windows easily
nnoremap <silent> <C-h> <C-w>h
nnoremap <silent> <C-l> <C-w>l
nnoremap <silent> <C-j> <C-w>j
nnoremap <silent> <C-k> <C-w>k

" Quit and save easily
nnoremap <silent> <Space>q :q<CR>
nnoremap <silent> <Space>s :w<CR>

" Quick move bindings
nnoremap <silent> ]q :cnext<CR>
nnoremap <silent> [q :cprev<CR>
nnoremap <silent> ]Q :clast<CR>
nnoremap <silent> [Q :cfirst<CR>

" Terminal keymaps
tnoremap jk <Esc>
