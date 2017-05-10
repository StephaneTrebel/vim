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
Plugin 'scrooloose/syntastic'

" Region Expansion
Plugin 'terryma/vim-expand-region'

" Surrounding plugin (to add quotes/parens/brackets around stuff)
Plugin 'tpope/vim-surround'

" Best status bar ever
Plugin 'vim-airline/vim-airline'

" Syntax (Highlighting)
Plugin 'pangloss/vim-javascript'
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'digitaltoad/vim-pug'
Plugin 'posva/vim-vue'
Plugin 'wavded/vim-stylus'
Plugin 'mustache/vim-mustache-handlebars'

" Typescript support
Plugin 'Quramy/tsuquyomi'
Plugin 'Shougo/vimproc.vim'
let g:tsuquyomi_completion_detail = 1
Plugin 'leafgarland/typescript-vim'
let g:tsuquyomi_disable_quickfix = 1
" You shouldn't use 'tsc' checker.
let g:syntastic_typescript_checkers = ['tsuquyomi']
autocmd FileType typescript nmap <buffer> <LEADER>t : <C-u>echo tsuquyomi#hint()<CR>
autocmd FileType typescript nmap <buffer> <LEADER>i :TsuImport<CR>

" Prettier conf
" Don't forger to install prettier globally (npm install -g prettier)
autocmd FileType javascript set formatprg=prettier\ --stdin
autocmd BufWritePre *.js :normal gggqG

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
autocmd FileType json nnoremap <LEADER>f :call JsBeautify()<CR>
autocmd FileType html noremap <buffer> <LEADER>f :call HtmlBeautify()<CR>
autocmd FileType css noremap <buffer> <LEADER>f :call CSSBeautify()<CR>
autocmd FileType scss noremap <buffer> <LEADER>f :call CSSBeautify()<CR>

" Call JsBeautify for vue components:
" * Beautify js for the <script></script> region
" * Beautify [s]css for the <style></style> region
" I have not included HTML because I prefer Jade/Pug and since it's whitespace
" based there's not much sense in having to beautify it I guess
function! BeautifyVue()
    /<script.*>/+1,/<\/script>/-1:call RangeJsBeautify()
    /<style.*>/+1,/<\/style>/-1:call RangeCSSBeautify()
    noh
endfunction
autocmd FileType vue.html.javascript.css nnoremap <LEADER>f :call BeautifyVue()<CR>
" Edit vimrc in a vertical split
nnoremap <leader>ev :vsplit ~/.vim/.vimrc<CR>
" Refresh vim config from ~/.vimrc
nnoremap <LEADER>sv :source $MYVIMRC<CR>

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
" Customize status line with syntastic errors
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0

" Colorscheme
set t_Co=256
colorscheme inkpot

" Display trailing spaces and other stuff
set listchars=tab:>-,trail:~,extends:>,precedes:<
set list

" Switch back from Insert mode to Normal mode easily
inoremap jk <ESC>

" Force learn ^^'
noremap <F1> <nop>
inoremap <ESC> <nop>
noremap <up> <nop>
noremap <down> <nop>
noremap <left> <nop>
noremap <right> <nop>
nnoremap j gj
nnoremap k gk

" Treat *.md files as markdown syntax (default is modula2)
au BufNewFile,BufFilePre,BufRead *.md set filetype=markdown
" Treat *.tag files as jsp syntax (default is mason)
au BufNewFile,BufFilePre,BufRead *.tag set filetype=jsp

" Centralize all vim temp files in home folder
set backup
set backupdir=~/.vim/backup
set directory=~/.vim/swap
set undodir=~/.vim/undo
set writebackup
set backupcopy=yes

" YouCompleteMe Fix
let g:ycm_server_python_interpreter="/usr/bin/python2"

let g:editorconfig_Beautifier = "~/.vim/.editorconfig"

" Automatically refresh buffer on external changes
set autoread

" Default the unnamed (default) register to the '+' one which is the default
" X one. Other systems (Windows for sure) should not care if it's '+' or '*'
" anyway.
" But for this to work you might need vim-gtk or vim-gnome installed
" (see http://vim.wikia.com/wiki/Accessing_the_system_clipboard for more info)
set clipboard=unnamedplus

" Abbreviations for common typos I make, feel free to extend this !
iabbrev adn and
iabbrev dnas dans
iabbrev udpate update

" Abbreviations for javascript snippets I use all the time
autocmd FileType javascript iabbrev FUNC function () {<CR>
