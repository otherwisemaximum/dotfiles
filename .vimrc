set nocompatible
filetype off

call plug#begin()
Plug 'itchyny/lightline.vim'
Plug 'airblade/vim-rooter'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdtree'
Plug 'rust-lang/rust.vim'
Plug 'stephpy/vim-yaml'
Plug 'cespare/vim-toml'
Plug 'chriskempson/base16-vim'
call plug#end()

filetype plugin indent on

syntax on
set number
set ruler
set wrap
set tabstop=2
set softtabstop=4
set autoindent
set colorcolumn=80
set encoding=utf-8

noremap <C-f> :NERDTreeToggle<CR>
inoremap <C-f> <esc>:NERDTreeToggle<CR>

" base 16 theme
set t_Co=256
let base16colorspace=256
set termguicolors
colorscheme base16-default-dark

" Light Line
let g:lightline = { 'colorscheme': 'darcula' }
set laststatus=2

" Rust Formatting
let g:rustfmt_autosave=1
