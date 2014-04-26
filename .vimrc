set nocompatible                                " Turning off capability with vi

""" Vundle plugin manager {{{
    """ Automatically setting up Vundle, taken from
    """ http://www.erikzaadi.com/2012/03/19/auto-installing-vundle-from-your-vimrc/ {{{
    let has_vundle=1
    let vundle_readme=expand('~/.vim/bundle/vundle/README.md')
    if !filereadable(vundle_readme)
        echo "Installing Vundle.."
        echo ""
        silent !mkdir -p ~/.vim/bundle
        silent !git clone https://github.com/gmarik/vundle ~/.vim/bundle/vundle
        let has_vundle=0
    endif
    """ }}}

    """ Initialize Vundle {{{
    set runtimepath+=~/.vim/bundle/vundle/
    call vundle#rc()
    """ }}}

    """ Github repos {{{

    " Recursive vundle
    Bundle 'gmaric/vundle'

    " Fuzzy finder
    Bundle 'kien/ctrlp.vim'

    " Highlight matching html tag
    Bundle 'gregsexton/MatchTag'

    " Automatically close quotes, brackets etc.
    Bundle 'Raimondi/delimitMate'

    " Handle surround chars and tags like '', [], <>
    Bundle 'tpope/vim-surround'

    " Enable repeating for surround
    Bundle 'tpope/vim-repeat'

    " Git wrapper
    Bundle 'tpope/vim-fugitive'

    " Clojure REPL in vim
    Bundle 'tpope/vim-fireplace'

    " Set 'path' from the Java class path
    Bundle 'tpope/vim-classpath'

    " Comment stuff out
    Bundle 'tpope/vim-commentary'

    " Syntax, indent and filetype settings for Clojure and ClojureScript
    Bundle 'guns/vim-clojure-static'

    " Colorize parentheses
    Bundle 'rainbow_parentheses.vim'

    " Solarized colorsheme
    Bundle 'altercation/vim-colors-solarized'

    " Fancy status line
    Bundle 'Lokaltog/vim-powerline'

    " Visualize vim undo tree
    Bundle 'sjl/gundo.vim'

    " Using ack with vim
    Bundle 'mileszs/ack.vim'

    " Syntax checker
    Bundle 'scrooloose/syntastic'

    " Enable syntax for nginx configs
    Bundle 'littleq0903/vim-nginx'

    " Python mode for vim
    Bundle 'klen/python-mode'

    " A simple way of running your tests
    Bundle 'alfredodeza/pytest.vim'

    " More convenient ukrainian keymap instead of ukrainian-jcuken
    Bundle 'ukrainian-enhanced.vim'

    Bundle 'Shougo/vimproc'
    Bundle 'Shougo/vimshell.vim'

    Bundle 'Mustang2'
    Bundle 'go.vim'
    Bundle 'Blackrush/vim-gocode'
    """ }}}

    """ Installing bundles the first time {{{
    if has_vundle == 0
        echo "Installing Bundles, please ignore key map error messages"
        echo ""
        :BundleInstall
    endif
    """ }}}
""" }}}

filetype plugin indent on                       " Detect file plugin+indent
syntax on                                       " Turn on syntax highlighting
set t_Co=256                                    " More pretty colors
set background=dark
if has('gui_running')                           " Options for gvim
    set guifont=Ubuntu\ Mono\ 16
    "set guifont=Terminus
    set guioptions=agim
    set guioptions+=c
    "let g:Powerline_symbols = 'fancy'
    let g:Powerline_symbols = 'compatible'
    let g:solarized_italic=0
    let g:solarized_underline=0
    colorscheme solarized
else
    colorscheme Mustang
    let g:Powerline_symbols = 'compatible'
endif
let g:Powerline_mode_n = ' N '
let g:Powerline_mode_i = ' I '
let g:Powerline_mode_R = ' R '
let g:Powerline_mode_v = ' V '
let g:Powerline_mode_V = 'V·L'
let g:Powerline_mode_cv = 'V·B'
let g:Powerline_mode_s = ' S '
let g:Powerline_mode_S = 'S·L'
let g:Powerline_mode_cs = 'S·B'
set nocompatible                                " Turning off capability with vi
set cursorline                                  " Highlight current line
set hidden
set ttyfast
set keymap=ukrainian-enhanced
set iminsert=0
set imsearch=0
highlight lCursor guifg=NONE guibg=Cyan
highlight CursorLineNr guifg=#93a1a1

"indent settings
set smarttab
set smartindent
set expandtab
set shiftwidth=4

set autoread                                    " Reread changed files
set cin
set backspace=indent,eol,start                  " Allow backspacing over everything in insert mode

set showmatch
set hlsearch                                    " Hilight searches by default
set incsearch                                   " Find the next match as we type the search
set smartcase

set ruler
set relativenumber

" Silently create all needed folders
silent !mkdir -p ~/.vim/tmp/{swap,backup,undo} > /dev/null 2>&1
set directory=~/.vim/tmp/swap//,/tmp//,.
set backupdir=~/.vim/tmp/backup//,/tmp//,.
set undodir=~/.vim/tmp/undo//,/tmp//,.
set undofile
set backup

set cmdheight=2                                 " Make command line two lines high

set laststatus=2                                " Tell VIM to always put a status line in, even if there is only one window
set showcmd                                     " Show the current command in the lower right corner
set noshowmode                                  " Hide the current mode
set history=100                                 " Keep some stuff in the history
set scrolloff=4

" Make the command-line completion better
set wildmenu
set wildmode=list:longest,full

set wildignore+=.hg,.git,.svn
set wildignore+=*.jpg,*.jpeg,*.bmp,*.gif,*.png
set wildignore+=*.pyc

set foldmethod=indent
set foldlevel=10

"set colorcolumn=85

set listchars=tab:»\ ,eol:¬                     " Display tabs, endlines
set showbreak=↪
set list                                        " Displaing list chars

""" AutoCmd {{{
autocmd BufRead,BufNewFile Makefile* set noexpandtab
highlight BadWhitespace ctermbg=red guibg=red
autocmd BufRead,BufNewFile *.py,*.pyw match BadWhitespace /^\t\+/
autocmd BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/
autocmd BufNewFile *.py,*.pyw,*.c,*.h set fileformat=unix
autocmd BufRead,BufNewFile *.jst set filetype=html
autocmd BufRead,BufNewFile *.go set filetype=go 

" PEP8
autocmd FileType python set softtabstop=4 tabstop=4 shiftwidth=4 textwidth=79 colorcolumn=81

autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS

" Django
autocmd FileType python set ft=python.django
autocmd FileType html set ft=htmldjango.html
autocmd BufRead,BufNewFile ~/projects/*/*.html set ft=html
autocmd FileType html set nosmartindent
""" }}}

""" My keymaps {{{
noremap j gj
noremap k gk
noremap Y y$
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
map <leader><tab> :bp<CR>
map <tab><leader> :bn<CR>
inoremap <C-Space> <C-x><C-o>
nnoremap <leader><space> :noh<cr>
nnoremap <leader>p :CtrlP<cr>
nnoremap <leader>u :GundoToggle<CR>
map <leader>a "zyiw:Ack! <C-R>z<CR>
map <leader>d :call RopeGotoDefinition()<CR>
nnoremap <leader>tc :Pytest class<CR>
nnoremap <leader>tm :Pytest method<CR>
nnoremap <leader>tt :Pytest file<CR>
nnoremap <leader>tf :Pytest first<CR>
nnoremap <leader>tl :Pytest last<CR>
nnoremap <leader>tn :Pytest next<CR>
nnoremap <leader>tp :Pytest previous<CR>
nnoremap <leader>ts :Pytest session<CR>
cmap w!! w !sudo tee % >/dev/null
command! W :w
map + :tabnew<CR>
map <C-Tab> :tabnext<CR>
map <C-S-Tab> :tabprev<CR>
" emacs like bindings
cnoremap <C-A> <Home>
cnoremap <C-X><C-A> <C-A>
""" }}}

""" Plugin settings {{{
let g:syntastic_check_on_wq=0
let g:syntastic_quiet_messages = {'level': 'warnings'}
let g:pymode_lint = 0
let g:pymode_utils_whitespaces=0
let g:pymode_rope_goto_definition_cmd='e'
let g:pymode_rope_complete_on_dot = 0

runtime macros/matchit.vim
""" }}}
" vim: fdm=marker:fdl=0
