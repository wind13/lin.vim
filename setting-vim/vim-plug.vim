"" ---- vim-plug.vim ----

if has('win32') || has('win64')
    " Make windows use ~/.vim too, I don't want to use _vimfiles
    set runtimepath^=~/.vim
endif

source ~/.vim/autoload/plug.vim
call plug#begin('~/.vim/plugged')


" UI Manager
Plug 'godlygeek/tabular'
Plug 'Yggdroot/indentLine'
Plug 'scrooloose/nerdtree'
Plug 'itchyny/lightline.vim'

" Color Theme
Plug 'altercation/vim-colors-solarized'
Plug 'tomasr/molokai'
Plug 'crusoexia/vim-monokai'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'KeitaNakamura/neodark.vim'
Plug 'lifepillar/vim-solarized8'
Plug 'srcery-colors/srcery-vim'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'rakr/vim-one'
Plug 'joshdick/onedark.vim'
Plug 'tomasiser/vim-code-dark'
Plug 'morhetz/gruvbox'
Plug 'Rigellute/rigel'

" Lint
Plug 'dense-analysis/ale'
" Auto Format
Plug 'Chiel92/vim-autoformat'
Plug 'junegunn/vim-easy-align'

" Ctags
Plug 'ludovicchabant/vim-gutentags'

" Complete Engine
Plug 'ycm-core/YouCompleteMe'
" Snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
" Comment
Plug 'scrooloose/nerdcommenter'
" Git
Plug 'tpope/vim-fugitive'
Plug 'mhinz/vim-signify'
" Searching
Plug 'rking/ag.vim'
Plug 'ctrlpvim/ctrlp.vim'

" Keyboard Operation
Plug 'tpope/vim-repeat'
Plug 'easymotion/vim-easymotion'
Plug 'vim-scripts/Mark--Karkat'
Plug 'tpope/vim-surround'

" C/C++
Plug 'vim-scripts/a.vim', { 'for': ['c', 'cc', 'cxx', 'cpp', 'h', 'hpp', 'hxx', 'hh'] }
Plug 'octol/vim-cpp-enhanced-highlight', { 'for': ['c', 'cc', 'cxx', 'cpp', 'h', 'hpp', 'hxx', 'hh'] }
" Python
Plug 'hdima/python-syntax', { 'for': ['py'] }
" Json
Plug 'elzr/vim-json'
" Html
Plug 'othree/html5.vim'
Plug 'othree/html5-syntax.vim'
Plug 'mattn/emmet-vim'
" Haml/Sass/Scss
"Plug 'cakebaker/scss-syntax.vim'
"Plug 'tpope/vim-haml'
" Css
Plug 'ap/vim-css-color'
Plug 'hail2u/vim-css3-syntax'
" Less
"Plug 'groenewege/vim-less'
" Javascript
Plug 'pangloss/vim-javascript'
Plug 'jelera/vim-javascript-syntax'
Plug 'mxw/vim-jsx'
" TypeScript
Plug 'leafgarland/typescript-vim'
" Thrift
"Plug 'solarnz/thrift.vim', { 'for': ['thrift'] }
"Haskell
Plug 'neovimhaskell/haskell-vim', { 'for': ['hs'] }
" Rust
Plug 'rust-lang/rust.vim', { 'for': ['rs'] }
" Toml
Plug 'cespare/vim-toml', { 'for': ['toml'] }
" Golang
Plug 'fatih/vim-go', { 'for': ['go'], 'do': ':GoUpdateBinaries' }


call plug#end()