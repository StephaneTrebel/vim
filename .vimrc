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

" Best status bar ever
Plugin 'vim-airline/vim-airline'

" Syntax (Highlighting)
Plugin 'pangloss/vim-javascript'
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'digitaltoad/vim-pug'
Plugin 'posva/vim-vue'
Plugin 'wavded/vim-stylus'

call vundle#end()
filetype plugin indent on

" Security concerns and useless anyway
set modelines=0

" LEADER SHORTCUTS
let mapleader = " "
" Quit
nnoremap <LEADER>q :q<CR>
" Select everything
nnoremap <LEADER>v V`]
" Clear search highlight
nnoremap <LEADER>, :noh<CR>
" Save current buffer
nnoremap <LEADER>w :w<CR>
" Toggle NERDTree panel
nnoremap <LEADER>n :NERDTreeToggle<CR>
" Call JsBeautify
autocmd FileType javascript nnoremap <LEADER>f :call JsBeautify()<CR>
autocmd FileType json nnoremap <LEADER>f :call JsBeautify()<CR>
autocmd FileType html noremap <buffer> <LEADER>f :call HtmlBeautify()<cr>
autocmd FileType css noremap <buffer> <LEADER>f :call CSSBeautify()<cr>
autocmd FileType scss noremap <buffer> <LEADER>f :call CSSBeautify()<cr>
" Refresh vim config from ~/.vimrc
nnoremap <LEADER>rc :so ~/.vimrc<CR>
" Append a semicolon and the end of current line
nnoremap <LEADER>a A;<ESC>
" Keep default register when pasting (send erased selection in black hole
" register)
vnoremap <LEADER>p "_dP

" Move around windows
nnoremap <LEADER>h <C-w>h
nnoremap <LEADER>j <C-w>j
nnoremap <LEADER>k <C-w>k
nnoremap <LEADER>l <C-w>l

" If no file required at CLI invoke, open with NERDTree
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Tab movement
nnoremap <F2> :tabp<CR>
nnoremap <F3> :tabn<CR>

" Toggle for system paste
nnoremap <F4> :set paste!<CR>

" Move lines up or down
noremap <S-k> :m -2<CR>
noremap <S-j> :m +1<CR>
vnoremap <S-k> xkP`[V`]
vnoremap <S-j> xp`[V`]

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

" Disable F1 for help
nnoremap <F1> <nop>
inoremap <F1> <nop>
vnoremap <F1> <nop>

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

" Switch back from Insert mode to Normal mode easily
inoremap jj <ESC>
inoremap hh <ESC>
inoremap kk <ESC>
" Special case to avoid exiting normal mode while inputing some words
" that contains 'll'
inoremap lll <ESC>

" Treat *.md files as markdown syntax (default is modula2)
au BufNewFile,BufFilePre,BufRead *.md set filetype=markdown

" Centralize all vim temp files in home folder
set backup
set backupdir=~/.vim/backup
set directory=~/.vim/swap
set undodir=~/.vim/undo
set writebackup

" YouCompleteMe Fix
let g:ycm_server_python_interpreter="/usr/bin/python2"

"let g:editorconfig_Beautifier = "~/.editorconfig"

" Automatically refresh buffer on external changes
set autoread
