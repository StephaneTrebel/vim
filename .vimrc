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
autocmd FileType typescript nmap <buffer> <LEADER>t : <C-u>echo tsuquyomi#hint()<CR>
autocmd FileType typescript nmap <buffer> <LEADER>i :TsuImport<CR>
autocmd FileType typescript nmap <buffer> <LEADER>r :TsuRenameSymbol<CR>
autocmd FileType typescript nmap <buffer> <LEADER>d :TsuDefinition<CR>
autocmd FileType typescript nmap <buffer> <LEADER>g :TsuGoBack<CR>

" Ack support
" Beware ! git.fsck might not like this plugin. Use manual install if needed:
" git clone --config transfer.fsckobjects=false https://github.com/mileszs/ack.vim.git ~/.vim/bundle/ack.vim
Plugin 'mileszs/ack.vim'

" Better substitution: use S instead of s and never look back !
Plugin 'tpope/vim-abolish'

" Easy motion
Plugin 'easymotion/vim-easymotion'

" Code formatting
Plugin 'sbdchd/neoformat'

call vundle#end()
filetype plugin indent on

" Formatter conf
" Don't forget to install prettier globally (npm install -g prettier)
" Use BufWritePre,TextChanged,InsertLeave if you want to format on all text
" modifications/insertions instead of just on file write
autocmd BufWritePre *.js Neoformat
autocmd FileType javascript setlocal formatprg=prettier\ --stdin\ --parser\ babylon\ --single-quote\ --trailing-comma\ all
autocmd BufWritePre *.json Neoformat
autocmd FileType json setlocal formatprg=prettier\ --stdin\ --parser\ babylon\ --single-quote\ --trailing-comma\ all
autocmd BufWritePre *.ts Neoformat
autocmd FileType typescript setlocal formatprg=prettier\ --stdin\ --parser\ typescript\ --single-quote\ --trailing-comma\ all
autocmd BufWritePre *.scss Neoformat
autocmd FileType scss setlocal formatprg=prettier\ --stdin\ --parser\ postcss
let g:neoformat_try_formatprg = 1

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

" Beautify vue SFC files:
" * Beautify ts for the <script></script> region
" * Beautify [s]css for the <style></style> region
" I have not included HTML because I prefer Jade/Pug and since it's whitespace
" based there's not much sense in having to beautify it I guess
function! BeautifyVue()
    setlocal formatprg=prettier\ --stdin\ --parser\ typescript\ --single-quote\ --trailing-comma\ all
    /<script.*>/+1,/<\/script>/-1:Neoformat
    setlocal formatprg=prettier\ --stdin\ --parser\ postcss
    /<style.*>/+1,/<\/style>/-1:Neoformat
    noh
endfunction
autocmd FileType vue nnoremap <LEADER>f :call BeautifyVue()<CR>
autocmd BufWritePre *.vue call BeautifyVue()

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
" Not needed on GNU/Linux
" nnoremap <F4> :set paste!<CR>

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

" File search
set wildmenu
set wildmode=list:longest
set wildignore+=node_modules/*,bower_components/*

" Misc
set encoding=utf-8
set scrolloff=3
set autoindent
set showmode
set showcmd
set hidden
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
" You shouldn't use 'tsc' checker.
let g:syntastic_typescript_checkers = ['tsuquyomi', 'tslint']
let g:syntastic_typescript_tslint_args = "--project tslint.json"
let g:syntastic_aggregate_errors = 1
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1

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
" Désactiver l'alimentation de la Location list par YCM (fait par syntastic)
let g:ycm_always_populate_location_list=0

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

" Easymotion configuration
let g:EasyMotion_do_mapping = 0 " Disable default mappings
" Jump to anywhere you want with minimal keystrokes, with just one key binding.
" `s{char}{label}`
nmap s <Plug>(easymotion-overwin-f)
" or
" `s{char}{char}{label}`
" Need one more keystroke, but on average, it may be more comfortable.
nmap s <Plug>(easymotion-overwin-f2)
" Turn on case insensitive feature
let g:EasyMotion_smartcase = 1
" JK motions: Line motions

let g:NERDSpaceDelims = 1
