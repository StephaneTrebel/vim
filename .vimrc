set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

" Git Integration
Plugin 'tpope/vim-fugitive'

" Vim Session handling
Plugin 'tpope/vim-obsession'

" NERDTree
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'scrooloose/nerdcommenter'

" .editorconfig support
Plugin 'editorconfig/editorconfig-vim'

" Autocomplete
Plugin 'Valloric/YouCompleteMe'

" Indent guide
Plugin 'nathanaelkane/vim-indent-guides'

" Region Expansion
Plugin 'terryma/vim-expand-region'

" Surrounding plugin (to add quotes/parens/brackets around stuff)
Plugin 'tpope/vim-surround'

" Best status bar ever
Plugin 'vim-airline/vim-airline'

Plugin 'cakebaker/scss-syntax.vim'
Plugin 'digitaltoad/vim-pug'
Plugin 'posva/vim-vue'
Plugin 'wavded/vim-stylus'
Plugin 'mustache/vim-mustache-handlebars'

" Typescript support
Plugin 'Quramy/tsuquyomi'
let g:tsuquyomi_completion_detail = 1
Plugin 'leafgarland/typescript-vim'
let g:tsuquyomi_disable_quickfix = 1
autocmd FileType typescript nmap <buffer> <LEADER>d :TsuDefinition<CR>
autocmd FileType typescript nmap <buffer> <LEADER>f :TsuReferences<CR>
autocmd FileType typescript nmap <buffer> <LEADER>g :TsuGoBack<CR>
autocmd FileType typescript nmap <buffer> <LEADER>i :TsuImport<CR>
autocmd FileType typescript nmap <buffer> <LEADER>r :TsuRenameSymbol<CR>
autocmd FileType typescript nmap <buffer> <LEADER>t : <C-u>echo tsuquyomi#hint()<CR>
autocmd FileType typescript nmap <buffer> <LEADER>x :TsuQuickFix<CR>
autocmd FileType typescript setlocal completeopt-=preview

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

" Easy Align
Plugin 'junegunn/vim-easy-align'
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" Syntax checker
Plugin 'scrooloose/syntastic'

" RobotFramework syntax support
Plugin 'mfukar/robotframework-vim'

" Javascript syntax highlighting
Plugin 'pangloss/vim-javascript'
Plugin 'othree/jsdoc-syntax.vim'

" PlantUML support
Plugin 'aklt/plantuml-syntax'
let g:plantuml_set_makeprg = 0

" Notes plugin
Plugin 'xolox/vim-notes'
Plugin 'xolox/vim-misc'
let g:notes_directories = ['~/Notes']

" Markdown support
Plugin 'tpope/vim-markdown'

" Vimdeck support (see https://github.com/tybenz/vimdeck)
Plugin 'inkarkat/vim-SyntaxRange'
Plugin 'inkarkat/vim-ingo-library'

" Better swap file handling
Plugin 'gioele/vim-autoswap'

call vundle#end()
filetype plugin indent on

" Jenkinsfile support
" If you have Jenkinsfile support but also have to handle «*.jenkinsfile»
" files, this line is for you
au BufNewFile,BufFilePre,BufRead *.jenkinsfile set filetype=Jenkinsfile

" Markdown support
" Treat *.md files as markdown syntax (default is modula2)
" au BufNewFile,BufFilePre,BufRead *.md set filetype=markdown
let g:markdown_fenced_languages = ['html', 'javascript', 'bash=sh']

" Treat *.tag files as jsp syntax (default is mason)
au BufNewFile,BufFilePre,BufRead *.tag set filetype=jsp
" Treat *.dockerfile files as dockerfile syntax
au BufNewFile,BufFilePre,BufRead *.dockerfile set filetype=dockerfile


au BufNewFile,BufFilePre,BufRead *.bashrc set filetype=sh

" Formatter conf

" Default formatting = vim native indentation
autocmd FileType * nmap <buffer> <LEADER>b ggVG=<CR>

" Don't forget to install prettier globally (npm install -g prettier)
autocmd FileType javascript nmap <buffer> <LEADER>b :Neoformat<CR>
" autocmd BufWritePre *.js Neoformat
autocmd FileType javascript setlocal formatprg=prettier\ --stdin\ --parser\ babel\ --end-of-line\ lf

autocmd FileType json nmap <buffer> <LEADER>b :Neoformat<CR>
" autocmd BufWritePre *.json Neoformat
autocmd FileType json setlocal formatprg=prettier\ --stdin\ --parser\ json\ --end-of-line\ lf


autocmd FileType typescript nmap <buffer> <LEADER>b :Neoformat<CR>
" autocmd BufWritePre *.ts Neoformat " Disabled because I find it cumbersome
autocmd FileType typescript setlocal formatprg=prettier\ --stdin\ --parser\ typescript\ --end-of-line\ lf


autocmd FileType scss nmap <buffer> <LEADER>b :Neoformat<CR>
" autocmd BufWritePre *.scss Neoformat
autocmd FileType scss setlocal formatprg=prettier\ --stdin\ --parser\ css\ --end-of-line\ lf


autocmd FileType yaml,yml nmap <buffer> <LEADER>b :Neoformat<CR>
" autocmd BufWritePre *.yml Neoformat
" autocmd BufWritePre *.yaml Neoformat
autocmd FileType yaml,yml setlocal formatprg=prettier\ --stdin\ --parser\ yaml\ --end-of-line\ lf


let g:neoformat_try_formatprg = 1

" Remove wrapping for markdown (markdown interperters do it automatically for
" display anyway
autocmd FileType markdown setlocal tw=0


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
let NERDTreeShowHidden=1

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
autocmd FileType vue nnoremap <LEADER>b :call BeautifyVue()<CR>
" autocmd BufWritePre *.vue call BeautifyVue()

" Edit vimrc in a vertical split
nnoremap <leader>ev :vsplit ~/.vimrc<CR>
" Refresh vim config from ~/.vimrc
nnoremap <LEADER>sv :source ~/.vimrc<CR>

" Append a semicolon and the end of current line
nnoremap <LEADER>a A;<ESC>
" Keep default register when pasting (send erased selection in black hole
" register)
vnoremap <LEADER>p "_dP

" Move around windows
nnoremap <LEADER>h <C-w>h
nnoremap <LEADER><Left> <C-w>h
nnoremap <LEADER>j <C-w>j
nnoremap <LEADER><Down> <C-w>j
nnoremap <LEADER>k <C-w>k
nnoremap <LEADER><Up> <C-w>k
nnoremap <LEADER>l <C-w>l
nnoremap <LEADER><Right> <C-w>l

" If no file required at CLI invoke, open with NERDTree
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
let NERDTreeShowLineNumbers=1
let NERDTreeMinimalUI=1

" Tab movement
nnoremap <F2> :tabp<CR>
nnoremap <F3> :tabn<CR>

" Default selection to region expansion
"noremap <r> <Plug>(expand_region_expand)

" Indent setup
set tabstop=2
set softtabstop=0
set noexpandtab
set shiftwidth=2
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
" Display only the beginning of a branch
function! CustomBranchName(name)
    return fnamemodify(a:name, ':t')[0:7]
endfunction
let g:airline#extensions#branch#format = 'CustomBranchName'

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
let g:syntastic_mode_map = { "mode": "passive" }
" You shouldn't use 'tsc' checker.
let g:syntastic_typescript_checkers = ['tsuquyomi', 'tslint']
let g:syntastic_typescript_tslint_args = "--project tslint.json"
let g:syntastic_aggregate_errors = 1
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
autocmd FileType typescript nmap <buffer> <LEADER>c :SyntasticCheck<CR>
autocmd FileType javascript nmap <buffer> <LEADER>c :YcmDiags<CR>
" Navigate through errors
autocmd FileType typescript nmap <buffer> ! :lnext<CR>
autocmd FileType typescript nmap <buffer> <LEADER>! :lprevious<CR>

" Colorscheme
set t_Co=256
colorscheme inkpot

" Display trailing spaces and other stuff
set listchars=tab:\ \ ,trail:~,extends:>,precedes:<,nbsp:⎵
set list

" Force learn ^^'
noremap <F1> <nop>
inoremap «» <ESC>
inoremap »« <ESC>

" Centralize all vim temp files in home folder
set backup
set backupdir=~/.vim/backup
set directory=~/.vim/swap
set undodir=~/.vim/undo
set writebackup
set backupcopy=yes
" Ensure title and titlestring variables are set to default for autoswap
set title titlestring=
" Activate autoswap tmux feature so that opening an already open file will
" automatically switch to the already opened vim instance in the relevant
" tmux window/panel
let g:autoswap_detect_tmux = 1

" YouCompleteMe Fix
let g:ycm_server_python_interpreter="/usr/bin/python3"
" Disable location list population by YCM (already done by syntastic)
let g:ycm_always_populate_location_list=0

let g:editorconfig_Beautifier = "~/.vim/.editorconfig"

" Automatically refresh buffer on external changes
" For the CursorHold see
" [here](https://superuser.com/a/1090762)
set autoread
au CursorHold * checktime

" Wait x milliseconds of inactivity to write the current buffer into a swap
" file, and to trigger CursorHold a event.
set updatetime=2000

" Default the unnamed (default) register to the '+' one which is the default
" X one. Other systems (Windows for sure) should not care if it's '+' or '*'
" anyway.
" But for this to work you might need vim-gtk or vim-gnome installed
" (see http://vim.wikia.com/wiki/Accessing_the_system_clipboard for more info)
" Windows WSL user should look into this link for cross-clipboard handling:
" https://github.com/Microsoft/WSL/issues/892#issuecomment-275873108
set clipboard^=unnamedplus
" Prevent clipboard clearing on exit or suspend (Ctrl-Z)
if executable("xsel")
  function! PreserveClipboard()
    call system("xsel -ib", getreg('+'))
  endfunction
  function! PreserveClipboadAndSuspend()
    call PreserveClipboard()
    suspend
  endfunction
  autocmd VimLeave * call PreserveClipboard()
  nnoremap <silent> <c-z> :call PreserveClipboadAndSuspend()<cr>
  vnoremap <silent> <c-z> :<c-u>call PreserveClipboadAndSuspend()<cr>
endif

" Easymotion configuration
let g:EasyMotion_do_mapping = 0 " Disable default mappings
" Jump to anywhere you want with minimal keystrokes, with just one key binding.
" `s{char}{label}`
" nmap s <Plug>(easymotion-overwin-f)
" or
" `s{char}{char}{label}`
" Need one more keystroke, but on average, it may be more comfortable.
nmap s <Plug>(easymotion-overwin-f2)
" Turn on case insensitive feature
let g:EasyMotion_smartcase = 1
" JK motions: Line motions

let g:NERDSpaceDelims = 1

" Open files of location/quickfix lists in new tabs instead of in the current
" buffer
set switchbuf+=newtab

" Toggle paste mode. Useful when pasting in Windows environnements
set pastetoggle=<F4>

" Better autochdir: Automatically change the local pwd of a Buffer on file load.
" Except markdown files, though, because vimdeck does not play nicely with
" chdir commands like this :3
let blacklist = ['markdown']
autocmd BufEnter * if index(blacklist, &ft) < 0 | silent! lcd %:p:h

" Hide all statusline (Useful for Vimdeck presentations)
let s:hidden_all = 0
function! ToggleHiddenAll()
    if s:hidden_all  == 0
        let s:hidden_all = 1
        set noshowmode
        set noruler
        set laststatus=0
        set noshowcmd
		set shortmess+=F
    else
        let s:hidden_all = 0
        set showmode
        set ruler
        set laststatus=2
        set showcmd
		set shortmess-=F
    endif
endfunction

nnoremap <S-h> :call ToggleHiddenAll()<CR>

syntax enable

