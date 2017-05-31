set nocompatible

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

" Color scheme (for gvim)
Plugin 'altercation/vim-colors-solarized'
" Pretty status bar
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" filesystem explorer
Plugin 'scrooloose/nerdtree'
" fuzzy file search
Plugin 'kien/ctrlp.vim'
" smart C++ syntax coloring
Plugin 'jeaye/color_coded'
" Generate ycm configs
Plugin 'rdnetto/ycm-generator'
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
" syntax highlighting for z80 asm
Plugin 'samsaga2/vim-z80'
" rust 
Plugin 'rust-lang/rust.vim'

call vundle#end()

" Enable file type detection and language-dependent indenting
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
set textwidth=0 wrapmargin=0
" make backspace act as expected
set backspace=indent,eol,start
set autoread
set re=1
" Show line numbers
set number
" Allow hidden buffers, don't limit to 1 file per window/split
set hidden
"show incomplete commands
set showcmd
" Switch syntax highlighting on
syntax enable

" this has to come before the terminal italics configuration
set background=dark
colorscheme solarized

if has('gui_running')
    " visual customization for gvim
    " hide the toolbar
    set guioptions-=T
    set guifont=Inconsolata\ for\ Powerline\ 11
else
    " visuals for terminal
    " get airline and solarized to look right
    let &t_Co = 16
    let g:solarized_termtrans = 1
    " escape codes for italics
    set t_ZH=[3m
    set t_ZR=[23m
    " italicize comments (not sure why this is necessary, but it is)
    highlight Comment cterm=italic
endif

augroup configgroup
    autocmd!
    " Makefiles require proper <tab> characters
    autocmd FileType Makefile setlocal noexpandtab
    " use // for comments in C++, because one line /* */ comments look weird
    autocmd FileType cpp setlocal commentstring=//%s
augroup END

" override some functionality, but easy to reach
let mapleader = ","
let maplocalleader = ";"

" center screen on cursor with space
nnoremap <space> zz

" shortcut for turning off highlighting
nnoremap <leader>nh :nohl<CR>

" shortcut for <esc>, so i don't have to reach so far
inoremap jk <esc>
" shortcut to get out of braces when editing code
inoremap }} <esc>jA

" paste last yanked text
nnoremap <leader>pp "0p

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

" shortcuts using YCM
nnoremap <leader>gt :YcmCompleter GoTo<CR>
nnoremap <leader>fx :YcmCompleter FixIt<CR>

" fold settings
set foldmethod=indent
set foldnestmax=3
set nofoldenable

" Airline settings
set laststatus=2
set noshowmode
let g:airline_powerline_fonts=1

" DelimitMate settings
let delimitMate_expand_cr = 1

" YCM settings
let g:ycm_always_populate_location_list = 1
let g:ycm_echo_current_diagnostic = 1
" I have a default c++ conf in ~
let g:ycm_global_ycm_extra_conf = "~/.ycm_extra_conf.py"
" get rid of annoying prompts
let g:ycm_confirm_extra_conf = 0

" Syntastic settings
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_loc_list_height = 4
" the compiler settings UM has us use for C++
" (Except -Werror, I want to be able to distinguish warnings from errors)
let g:syntastic_cpp_compiler_options = '-Wall --std=c++11 -pedantic'
let g:syntastic_tex_checkers = ['chktex']
let g:syntastic_python_checkers = ['python2']

" NERDTree settings
nnoremap <leader>nt :NERDTreeToggle<CR>
nnoremap <leader>nf :NERDTreeFind<CR>
let NERDTreeHijackNetrw=1
let NERDTreeQuitOnOpen=1
" let NERDTreeWinPos="right"

" TeX-9 settings
let g:tex_flavor = 'latex'
let g:tex_nine_config = {
            \'compiler': 'pdflatex',
    \}

