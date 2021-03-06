" Key Operations

" open terminal
map <F2> :terminal ++rows=20<CR>
" next color
map <F3> :call NextColor()<CR>
" switch between C/C++ header source
map <F4> :CocCommand clangd.switchSourceHeader<CR>
" open/close nerdtree file explorer
map <F5> :NERDTreeToggle<CR>
" open/close tagbar
nmap <F6> :TagbarToggle<CR>

" Command Operations

" copy visual selection to disk cache
vnoremap <Leader>y :w! ~/.cache/.lin.vim.copypaste<CR>
" copy disk cache to cursor
nnoremap <Leader>p :r ~/.cache/.lin.vim.copypaste<CR>

" Buffer

" go to next buffer
map <Leader>bn :bn<cr>

" go to previous buffer
map <Leader>bp :bp<cr>

" close current buffer
map <Leader>bd :bd<cr>
