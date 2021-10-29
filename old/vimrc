" leader
let mapleader = ','
let g:mapleader = ','

syntax enable           " enable syntax processing
set nocompatible        " Don't try to be vi compatible

scriptencoding utf-8
set encoding=utf-8
set backspace=indent,eol,start    " Fix backspace key

set tabstop=2           " 2 space tab
set expandtab           " use spaces for tabs
set softtabstop=2       " 2 space tab
set shiftwidth=2
set modelines=1
filetype indent on
filetype plugin on
set autoindent

set number              " show line numbers
set highlight+=N:DiffText             " make current line number stand out a little
set showcmd             " show command in bottom bar
set nocursorline        " highlight current line
set wildmenu
set lazyredraw
set showmatch           " higlight matching parenthesis

set ignorecase          " ignore case when searching
set incsearch           " search as characters are entered
set hlsearch            " highlight all matches

" Faster switching between splits
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <C-o> <C-w>o

" Filetype settings
autocmd FileType yaml setlocal ai ts=2 sts=2 sw=2 expandtab number cursorcolumn

" Status line
set laststatus=2   " Always show the status line - use 2 lines for the status bar
set statusline=
set statusline+=%#PmenuSel#
set statusline+=\ %f
set statusline+=%m
set statusline+=%=
set statusline+=\ %y
set statusline+=\ %{&fileencoding?&fileencoding:&encoding}
set statusline+=\[%{&fileformat}\]
set statusline+=\ %p%%
set statusline+=\ %l:%c

" Themes
" set t_Co=256
colorscheme elflord
set background=dark

" manually install solarized theme
" put https://raw.github.com/altercation/vim-colors-solarized/master/colors/solarized.vim in ~/.vim/colors/
" curl -fLo ~/.vim/colors/solarized.vim --create-dirs https://raw.github.com/altercation/vim-colors-solarized/master/colors/solarized.vim
let g:solarized_termcolors=256
let g:solarized_termtrans=1
silent! colorscheme solarized

