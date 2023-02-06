let mapleader = "\<Space>"
set shell=/bin/bash
set nocompatible
filetype off

call plug#begin('~/.config/nvim/plugged')
Plug 'itchyny/lightline.vim'
Plug 'machakann/vim-highlightedyank'
Plug 'airblade/vim-rooter'
Plug 'dense-analysis/ale'
Plug 'scrooloose/nerdtree'
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'rust-lang/rust.vim'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'stephpy/vim-yaml'
Plug 'cespare/vim-toml'
Plug 'chriskempson/base16-vim'
Plug 'antoyo/vim-licenses'
Plug 'maximbaz/lightline-ale'
Plug 'mustache/vim-mustache-handlebars'
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
Plug 'nickeb96/fish.vim'
Plug 'preservim/tagbar'
Plug 'mileszs/ack.vim'
" telescope
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.1' }
call plug#end()

filetype plugin indent on

syntax enable
set number relativenumber
set nu rnu
set ruler
set wrap
set tabstop=4
set softtabstop=4
set shiftwidth=4
set autoindent
set colorcolumn=80
set encoding=utf-8

noremap <C-,> :NERDTreeToggle<CR>
inoremap <C-,> <esc>:NERDTreeToggle<CR>

" base 16 theme
set t_Co=256
let base16colorspace=256
set termguicolors
colorscheme base16-atelier-dune


" vim licenses config
let g:licenses_copyright_holders_name = "Varun Tewari <vtewari26@gmail.com>"
let g:licenses_authors_name = "Varun Tewari <vtewari26@gmail.com>"
command! License call InsertLicense('licenseFile')

" Light Line
let g:lightline = {
\       'colorscheme': 'darcula',
\}
set laststatus=2


" Coc Config
set hidden
set nobackup
set nowritebackup
set shortmess+=c
set updatetime=300

" telescope config
" Find files using Telescope command-line sugar.
nnoremap <leader>f <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>


" Coc GoTo code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
" inoremap <silent><expr> <TAB>
"       \ pumvisible() ? "\<C-n>" :
"       \ <SID>check_back_space() ? "\<TAB>" :
"       \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"


" use enter to select the suggestion in coc
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"


function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" setup code folding
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
set nofoldenable


" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
" if exists('*complete_info')
"   inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
" else
"   inoremap <expr> <cr> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"
" endif

" Golang
autocmd BufWritePre *.go :call CocAction('organizeImport')
let g:go_fmt_command = "goimports"

" Rust Formatting
let g:rustfmt_autosave=1
let g:syntastic_cpp_compiler_options = ' --std=c++11'


" https://sheerun.net/2014/03/21/how-to-boost-your-vim-productivity/
" Stop that stupid window from popping up
map q: :q
nmap <C-q> :q
nmap <C-a> @a

" <leader><leader> toggles between buffers
nnoremap <leader><leader> <c-^>

" tagbar config
 let g:tagbar_type_rust = {
    \ 'ctagstype' : 'rust',
    \ 'kinds' : [
        \'T:types,type definitions',
        \'f:functions,function definitions',
        \'g:enum,enumeration names',
        \'s:structure names',
        \'m:modules,module names',
        \'c:consts,static constants',
        \'t:traits',
        \'i:impls,trait implementations',
    \]
    \}

" ale
" Linter
let g:ale_linters = {
\       'javascript': ['eslint'],
\		'rust': ['cargo', 'rls'],
\       'c': ['clangtidy']
\ }

" let g:ale_fixers = {
" \     'c': ['clang-format']
" \}
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
" let g:fzf_layout = { 'down': '~20%' }
map <C-p> :Files<CR>
" command! -bang -nargs=* Rg
"   \ call fzf#vim#grep(
"   \   'rg --column --line-number --no-heading --color=always '.shellescape(<q-args>), 1,
"   \   <bang>0 ? fzf#vim#with_preview('up:60%')
"   \           : fzf#vim#with_preview('right:50%:hidden', '?'),
"   \   <bang>0)

function! s:list_cmd()
  let base = fnamemodify(expand('%'), ':h:.:S')
  return base == '.' ? 'fd --type file --follow' : printf('fd --type file --follow | proximity-sort %s', expand('%'))
endfunction

if executable('rg')
        set grepprg=rg\ --no-heading\ --vimgrep
        set grepformat=%f:%l:%c:%m
endif

" Left and right can switch buffers
nnoremap <C-left> :bp<CR>
nnoremap <C-right> :bn<CR>

" Leader Mappings
nmap <Leader>; :Buffers<CR>
nmap <Leader>d <Plug>(ale_fix)


" Tab splitting config
set splitbelow splitright

" re-map split nav to ctrl + hjkl
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

noremap <Leader>h :vertical resize +3<CR>
noremap <Leader>Right :vertical resize -3<CR>
noremap <Leader>Up :resize +3<CR>
noremap <Leader>Down :resize -3<CR>
