packloadall
set rnu nu
syntax on
set tabstop=4 softtabstop=4
set shiftwidth=4
set mouse=a
set autoindent
set smartindent
set smartcase
set autoread
set spelllang=en_gb
set nospell
filetype plugin indent on
syntax on
set backspace=indent,eol,start
"set paste
set nohlsearch
set hidden
set bg=dark
set termguicolors

call plug#begin('~/.vim/plugged')

" Admin
Plug 'tpope/vim-fugitive'

" Layout
Plug 'arcticicestudio/nord-vim'
Plug 'nathanaelkane/vim-indent-guides'

" Navigating
Plug 'bling/vim-bufferline'
Plug 'junegunn/fzf.vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'scrooloose/nerdtree'

" General Editing
Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdcommenter'
Plug 'kamykn/spelunker.vim'
Plug 'norcalli/nvim-colorizer.lua'
Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}

" Language Specific Editing
Plug 'dart-lang/dart-vim-plugin'
Plug 'heavenshell/vim-pydocstring', { 'do': 'make install' }

" Writing
Plug 'lervag/vimtex'

call plug#end()

lua require'colorizer'.setup()
colorscheme nord

" CoC autocomplete, linting, fixing and navigating
source ~/.dotfiles/cocrc.vim
let g:coc_disable_startup_warning = 1
let g:coc_global_extensions = [
	\ 'coc-python',
	\ 'coc-clangd',
	\ 'coc-sh',
	\ 'coc-vimtex',
	\ 'coc-docker',
	\ 'coc-json',
	\ 'coc-yaml',
	\ 'coc-html',
	\ 'coc-css',
	\ 'coc-tsserver',
	\ 'coc-flutter'
\]
autocmd BufWritePre *.py,*.cpp,*.h,*.dart,*.sh,*.yaml Format

" Indentation guide lines
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_guide_size = 1
" Faster scrolling
nnoremap <C-e> 2<C-e>
nnoremap <C-y> 2<C-y>
" File structure visual
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

" Refactor word
"let g:coc_disable_startup_warning = 1
nnoremap <leader>rw :CocSearch <C-R>=expand("<cword>")<CR><CR>

" Status bar and buffers
set laststatus=2
nnoremap <Leader>l :ls<CR>
nnoremap <Leader>[ :bp<CR>
nnoremap <Leader>] :bn<CR>
nnoremap <Leader>g :e#<CR>
nnoremap <Leader>1 :1b<CR>
nnoremap <Leader>2 :2b<CR>
nnoremap <Leader>3 :3b<CR>
nnoremap <Leader>4 :4b<CR>
nnoremap <Leader>5 :5b<CR>
nnoremap <Leader>6 :6b<CR>
nnoremap <Leader>7 :7b<CR>
nnoremap <Leader>8 :8b<CR>
nnoremap <Leader>9 :9b<CR>
nnoremap <Leader>0 :10b<CR>
nnoremap <Leader>- :bd<CR>

" Fast file lookup
nnoremap <silent><C-p> :GFiles<CR>
nnoremap <C-g> :Ag<Cr>
let FZF_DEFAULT_COMMAND='fg --hidden --ignore -l ""'

" Autoclose brackets in insert mode
inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O

" Pane switching
let g:tmux_navigator_no_mappings = 1
nnoremap <silent> <c-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <c-j> :TmuxNavigateDown<cr>
nnoremap <silent> <c-k> :TmuxNavigateUp<cr>
nnoremap <silent> <c-l> :TmuxNavigateRight<cr>

" Latex editing
let g:vimtex_view_method = 'zathura'
let g:vimtex_quickfix_mode=0
let g:vimtex_mappings_enabled = 0
let g:vimtex_log_ignore = [
        \ 'Underfull',
        \ 'Overfull',
        \ 'specifier changed to',
        \ 'Token not allowed in a PDF string',
      \ ]
let g:vimtex_context_pdf_viewer=1
let g:vimtex_context_pdf_viewer= 'okular'
nnoremap <Leader>w :VimtexCountWords<CR> 
nnoremap <Leader>c :VimtexCompile<CR>
nnoremap <Leader>i :VimtexTocToggle<CR> \| <C-h>
nnoremap <Leader>p :VimtexView<CR> 
nnoremap <Leader>x :VimtexClean<CR>
"nnoremap <Leader>l :VimtexLabelsToggle<CR> 

" Python docstring format
"let g:pydocstring_formatter = 'sphinx'
