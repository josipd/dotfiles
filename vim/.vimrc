" Syntax hilighting.
syntax enable

" Per-filetype indentation.
filetype plugin indent on
filetype plugin on

" Indent settings.
set expandtab " convert tabs to spaces
set tabstop=4 " how many spaces does a tab produces
set softtabstop=4
set number
set shiftwidth=4

" Disable tab expansion for makefiles.
autocmd FileType make setlocal noexpandtab

" Unobtrusively highlight trailing whitespace.
highlight ExtraWhitespace ctermbg=red guibg=red
au ColorScheme * highlight ExtraWhitespace guibg=red
au BufEnter * match ExtraWhitespace /\s\+$/
au InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
au InsertLeave * match ExtraWhiteSpace /\s\+$/

" Smart autocompletition.
set ofu=syntaxcomplete#Complete

" Edit files that need sudo permission with w!!.
cmap w!! %!sudo tee > /dev/null %

" Set up Vundle.
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Vundle should update itself.
Plugin 'gmarik/Vundle.vim'

" Plugins together with configuration for them.
Plugin 'kien/ctrlp.vim'
let g:ctrlp_working_path_mode = 'ra'
Plugin 'Lokaltog/vim-distinguished'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'bling/vim-airline'
set laststatus=2
Plugin 'bling/vim-bufferline'
Plugin 'airblade/vim-gitgutter'
Plugin 'flazz/vim-colorschemes'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-dispatch'
Plugin 'reedes/vim-colors-pencil'
Plugin 'ervandew/supertab'

Plugin 'junegunn/goyo.vim'
Plugin 'reedes/vim-pencil'
let g:pencil#conceallevel = 0

Plugin 'scrooloose/nerdtree'
map <C-n> :NERDTreeToggle<CR>
" Autostart it if no files were provided.
autocmd vimenter * if !argc() | NERDTree | endif
let NERDTreeIgnore = ['\.pyc$', '\.pyo$', '\.swp$']

Plugin 'scrooloose/syntastic'
Plugin 'sjl/gundo.vim'
nnoremap <F6> :GundoToggle<CR>
Plugin 'Valloric/YouCompleteMe'
Plugin 'altercation/vim-colors-solarized'

" Required to load the plugins.
call vundle#end()

" Paste that works nicely.
set pastetoggle=<F3>

" Don't go over 80 characters.
set cc=81

if has("gui_running")
    colorscheme sift
    set background=dark
    set guioptions-=T
    set guioptions-=r
    set guioptions-=l
    set guifont=Ubuntu\ Mono\ 12
    let g:airline_powerline_fonts = 1
else
    colorscheme distinguished
endif

" Show relative line numbers, easier to move around.
set relativenumber

" Ignore certain extensions.
set wildignore+=*.aux,*.pdf,*.log,*.pyc,*.out,*.bbl,*.blg,*pyo

set hlsearch
" Use ctlr +l to remove the highlights after searching.
nnoremap <silent> <C-l> :nohl<CR><C-l>

noremap <C-c> :!bash<CR>
