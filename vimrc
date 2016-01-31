set nocompatible

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

" Better color scheme (for gvim)
Plugin 'altercation/vim-colors-solarized'
" Alternate color scheme
Plugin 'croaker/mustang-vim'
" Pretty status bar
Plugin 'bling/vim-airline'

" filesystem explorer
Plugin 'scrooloose/nerdtree'
" fuzzy file search
Plugin 'kien/ctrlp.vim'
" better C++ syntax highlighting
Plugin 'octol/vim-cpp-enhanced-highlight'
" autocomplete for braces etc.
Plugin 'Raimondi/delimitMate'
" syntax checking
Plugin 'scrooloose/syntastic'
" commenting command (gc)
Plugin 'tpope/vim-commentary'
" surround commands (ys, ds, cs)
Plugin 'tpope/vim-surround'
" extend . to repeat custom commands
Plugin 'tpope/vim-repeat'
" work with LaTeX
Plugin 'vim-scripts/TeX-9'

call vundle#end()

" Enable file type detection and do language-dependent indenting
filetype plugin indent on

set autoindent
set smartindent
set smarttab
" make tab 4 spaces wide
set softtabstop=4
set tabstop=4
set shiftwidth=4
" insert spaces for indent
set expandtab
" don't wrap lines
set nowrap
" Make backspace behave in a sane manner.
set backspace=indent,eol,start
set autoread
set re=1
" Show line numbers
set number
" Allow hidden buffers, don't limit to 1 file per window/split
set hidden
"show incomplete commands
set showcmd
" turn off cursor blink
set gcr=a:blinkon0
" Switch syntax highlighting on
syntax enable

if has('gui_running')
    " visual customization for gvim
    " hide menu bar and toolbar
    set guioptions-=m
    set guioptions-=T
    if has('win32')
        " use Consolas on Windows
        set guifont=Consolas:h10:b
        let g:airline_powerline_fonts=0
    else
        set guifont=Inconsolata\ for\ Powerline\ 11
        let g:airline_powerline_fonts = 1
    endif
else
    " visuals for Putty
    " get airline and solarized to look right
    let &t_Co = 16
    let g:solarized_termtrans = 1
    let g:airline_powerline_fonts=0
endif

set background=dark
colorscheme solarized

augroup configgroup
    autocmd!
    " Makefiles require proper <tab> characters
    autocmd FileType Makefile setlocal noexpandtab
    " use // for comments in C++, because one line /* */ comments look weird
    autocmd FileType cpp setl commentstring=//%s
augroup END

" center screen on cursor with space
nnoremap <space> zz

" shortcut for turning off highlighting
nnoremap <leader>nh :nohl<CR>

" shortcut for <esc> in insert mode, so i don't have to reach so far
inoremap jk <esc>
" shortcut to get out of braces
inoremap }} <esc>jA

" search settings
set incsearch
set hlsearch

" open  splits on the right and the bottom
set splitright
set splitbelow

" window switching
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" easier-to-reach keys for beginning and end of line
" (note that these override some functionality)
nnoremap B ^
nnoremap E $
onoremap B ^
onoremap E $
vnoremap B ^
vnoremap E $

" shortcuts for working with .vimrc
nnoremap <leader>ev :vsplit $MYVIMRC<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>

" fold settings
set foldmethod=indent
set foldnestmax=3
set nofoldenable

" Airline settings
set laststatus=2
set noshowmode
let g:airline_theme='solarized'

" DelimitMate settings
let delimitMate_expand_cr = 1

" Syntastic settings
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_loc_list_height = 4
" compiler flags UM uses for C++
let g:syntastic_cpp_compiler_options = '-Wall -Werror --std=c++11 -pedantic'

" NERDTree settings
nnoremap <leader>nt :NERDTreeToggle<CR>
nnoremap <leader>nf :NERDTreeFind<CR>
let NERDTreeHijackNetrw=1
let NERDTreeQuitOnOpen=1
" let NERDTreeWinPos="right"

" TeX-9 settings
let g:tex_nine_config = {
            \'compiler': 'pdflatex',
    \}

