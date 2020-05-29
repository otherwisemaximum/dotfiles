let mapleader = "\<Space>"
set shell=/bin/bash
set nocompatible
filetype off

call plug#begin()
Plug 'itchyny/lightline.vim'
Plug 'machakann/vim-highlightedyank'
Plug 'airblade/vim-rooter'
Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-tmux'
Plug 'ncm2/ncm2-path'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'dense-analysis/ale'
Plug 'scrooloose/nerdtree'
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
Plug 'rust-lang/rust.vim'
Plug 'stephpy/vim-yaml'
Plug 'cespare/vim-toml'
Plug 'chriskempson/base16-vim'
Plug 'maximbaz/lightline-ale'
Plug 'mustache/vim-mustache-handlebars'
call plug#end()

filetype plugin indent on

syntax on
set number
set ruler
set wrap
set tabstop=4
set softtabstop=4
set shiftwidth=4
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
let g:lightline = {
\	'colorscheme': 'darcula',
\}
set laststatus=2

" Rust Formatting
let g:rustfmt_autosave=1
let g:syntastic_cpp_compiler_options = ' --std=c++11'

" https://sheerun.net/2014/03/21/how-to-boost-your-vim-productivity/
" Stop that stupid window from popping up
map q: :q
nmap <C-q> :q
nmap <C-a> @a

" ale
" Linter
let g:ale_linters = {
\	'javascript': ['eslint'],
\   'rust': ['rustc'],
\	'c': ['clangtidy']
\ }

let g:ale_fixers = {
\	'c': ['clang-format']
\}
let g:ale_sign_column_always = 1
" only lint on save
let g:ale_lint_on_text_changed = 'always'
let g:ale_lint_on_save = 1
let g:ale_lint_on_enter = 1
let g:ale_rust_cargo_use_check = 1
let g:ale_rust_cargo_check_all_targets = 1
let g:ale_virtualtext_cursor = 1
let g:ale_sign_error = '>>'
let g:ale_sign_warning = '--'
let g:ale_fix_on_save = 1
" FZF
" <leader>s for Rg search
let g:fzf_layout = { 'down': '~20%' }
map <C-p> :Files<CR>
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)

function! s:list_cmd()
  let base = fnamemodify(expand('%'), ':h:.:S')
  return base == '.' ? 'fd --type file --follow' : printf('fd --type file --follow | proximity-sort %s', expand('%'))
endfunction

" Auto Complete
" autocmd BufEnter * call ncm2#enable_for_buffer()
" set completeopt=noinsert,menuone,noselect

" Left and right can switch buffers
nnoremap <C-left> :bp<CR>
nnoremap <C-right> :bn<CR>

" Split movements
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

" Leader Mappings
nmap <Leader>; :Buffers<CR>
nmap <Leader>d <Plug>(ale_fix)
