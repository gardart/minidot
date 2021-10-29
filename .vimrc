" Load plugins
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
call plug#begin('~/.vim/plugged')
Plug 'christoomey/vim-tmux-navigator'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdtree'
Plug 'editorconfig/editorconfig-vim'
call plug#end()

" Leader Shortcuts {{{
let mapleader = ','
let g:mapleader = ','
nnoremap <Leader>o :only<CR>
nnoremap <leader>ev :vsp $MYVIMRC<CR>         " Edit vimrc
nnoremap <leader>ez :vsp ~/.zshrc<CR>         " Edit zshrc
nnoremap <leader>sv :source $MYVIMRC<CR>      " Source vimrc
nnoremap <leader><space> :noh<CR>             " Turn off highlighting until the next search
nnoremap <leader>l :call ToggleNumber()<CR>   " Toggle line number
nnoremap <leader>d :NERDTreeToggle<CR>        " Open/Close Nerdtree file manager
" surround word
nnoremap <leader>" ciw"<C-r>""<esc>
nnoremap <leader>' ciw'<C-r>"'<esc>
nnoremap <leader>{ ciw{<C-r>"}<esc>
nnoremap <leader>( ciw(<C-r>")<esc>
nnoremap <leader>[ ciw[<C-r>"]<esc>
nnoremap <leader>< ciw<<C-r>"><esc>
" surround selection
vnoremap <leader>" c"<C-r>""<esc>
vnoremap <leader>' c'<C-r>"'<esc>
vnoremap <leader>{ c{<C-r>"}<esc>
vnoremap <leader>( c(<C-r>")<esc>
vnoremap <leader>[ c[<C-r>"]<esc>
vnoremap <leader>< c<<C-r>"><esc>
nnoremap <Leader><Leader> <C-^>         " <Leader><Leader> -- Open last buffer.
set pastetoggle=<Leader>t
" }}}
" Normal mode mappings {{{
nmap <S-tab> :bNext<cr>         " For fast moving through buffers
" Faster switching between splits
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <C-o> <C-w>o
" }}}
" Visual mode mappings {{{
" move selected block up/down in visual mode
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
" }}}

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

