"syntax enable           " enable syntax processing
"if has('termguicolors')
"  set termguicolors     " use guifg/guibg instead of ctermfg/ctermbg in terminal
"endif

"if (&term =~ '^xterm' && &t_Co == 256)     " https://github.com/microsoft/terminal/issues/832
"  set t_ut= | set ttyscroll=1
"endif

set nocompatible

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

autocmd FileType yaml setlocal ai ts=2 sts=2 sw=2 expandtab number cursorcolumn

" ============================ theme and status line ============================

" theme
colorscheme elflord
set background=dark

" set mark column color
" hi! link SignColumn   LineNr
" hi! link ShowMarksHLl DiffAdd
" hi! link ShowMarksHLu DiffChange

" status line
" set statusline=%<%f\ %h%m%r%=%k[%{(&fenc==\"\")?&enc:&fenc}%{(&bomb?\",BOM\":\"\")}]\ %-14.(%l,%c%V%)\ %P
" set laststatus=2   " Always show the status line - use 2 lines for the status bar
