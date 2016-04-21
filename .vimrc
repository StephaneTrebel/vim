set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

" Git Integration
Plugin 'tpope/vim-fugitive'

" NERDTree
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'scrooloose/nerdcommenter'

" .editorconfig support
Plugin 'editorconfig/editorconfig-vim'

Plugin 'maksimr/vim-jsbeautify'

" Autocomplete
Plugin 'Valloric/YouCompleteMe'

" Indent guide
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'Raimondi/delimitMate'

" Syntax checker
" Plugin 'scrooloose/syntastic'

" Region Expansion
Plugin 'terryma/vim-expand-region'

" Javascript syntax
Plugin 'jelera/vim-javascript-syntax'

Plugin 'vim-airline/vim-airline'

call vundle#end()
filetype plugin indent on

" Security concerns and useless anyway
set modelines=0

" LEADER
let mapleader = " "
nnoremap <leader>v V`]
nnoremap <leader>, :noh<cr>
nnoremap <leader>w <C-w>v<C-w>l

autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
nnoremap <leader>n :NERDTreeToggle<CR>
nnoremap <leader>f :call JsBeautify()<CR>
nnoremap <leader>c :xa<CR>
nnoremap <leader>rc :so ~/.vimrc<CR>
nnoremap <F2> :tabNext<CR>
nnoremap <F3> :tabnext<CR>

" Move a line up or down
noremap <S-k> :m -2<CR>
noremap <S-j> :m +1<CR>
vnoremap <S-k> xp`[V`]
vnoremap <S-j> xkP`[V`]

" Duplicate a line or block
noremap <C-S-d> yyp

" Default selection to region expansion
"noremap <r> <Plug>(expand_region_expand)

" Indent setup
set tabstop=4
set softtabstop=0
set expandtab
set shiftwidth=4
set smarttab
let delimitMate_expand_cr = 1

set encoding=utf-8
set scrolloff=3
set autoindent
set showmode
set showcmd
set hidden
set wildmenu
set wildmode=list:longest
set visualbell
set cursorline
set ttyfast
set ruler
set backspace=indent,eol,start

" Display line number relative to the current one
set relativenumber

" Undo info available across vim instances
set undofile

" Always display status line
set laststatus=2

" Sane search
nnoremap / /\v
vnoremap / /\v
set ignorecase
set smartcase
set gdefault
set incsearch
set showmatch
set hlsearch

nnoremap <tab> %
vnoremap <tab> %

" Long lines handling
set wrap
set textwidth=79
set formatoptions=qrn1
set colorcolumn=85

" Syntastic options
" Waiting for a working version of JSLint to reactivate
" Customize status line with syntastic errors
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*
" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 0
" let g:syntastic_check_on_wq = 0
" let g:syntastic_javascript_jslint_args = "--edition=latest --es6 --indent=4 --node --nomen"

" Colorscheme
set t_Co=256
colorscheme inkpot

" Display trailing spaces and other stuff
set listchars=tab:>-,trail:~,extends:>,precedes:<
set list

" Force learn ^^'
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
nnoremap j gj
nnoremap k gk
nnoremap <leader>h <C-w>h
nnoremap <leader>j <C-w>j
nnoremap <leader>k <C-w>k
nnoremap <leader>l <C-w>l

" Swictch back from Insert mode to Normal mode easily
inoremap jj <ESC>


