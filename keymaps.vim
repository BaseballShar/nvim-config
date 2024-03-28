" Center after moving pages
nnoremap <silent> <C-u> <C-u>zz
nnoremap <silent> <C-d> <C-d>zz
nnoremap <silent> <C-f> <C-f>zz
nnoremap <silent> <C-b> <C-b>zz

" Switch between buffers
nnoremap <silent> <S-h> :bp<CR>
nnoremap <silent> <S-l> :bn<CR>

" Open file explorer in a split screen
nnoremap <silent> <Space>e :NERDTreeToggle<CR>

" Move lines up and down
" ESC maps to ALT in mac
nnoremap <silent> <M-j> :m+1<CR>
nnoremap <silent> <M-k> :m-2<CR>
vnoremap <silent> <M-j> :m'>+1<CR>gv
vnoremap <silent> <M-k> :m'<-2<CR>gv

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
nnoremap <silent> <Space>q :qa!<CR>
nnoremap <silent> <Space>s :w<CR>

" No search highlighting
" nnoremap <silent> <Space>h :noh<CR>
