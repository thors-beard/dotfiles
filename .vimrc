if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

" Plug section
call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-surround'                             " Surrond sentence word with mark
Plug 'tpope/vim-fugitive'                             " Git tools and information
Plug 'flazz/vim-colorschemes'                         " Easy color scheme selection
Plug 'ctrlpvim/ctrlp.vim'                             " Ctrl-p search file in sub-dirs
Plug 'rking/ag.vim'                                   " Ag search for vim
Plug 'mileszs/ack.vim'                                " Ack search in vim
Plug 'scrooloose/nerdtree'                            " File tree: <leader>t
Plug 'scrooloose/nerdcommenter'                       " Easy code comment: <leader>cc
Plug 'Xuyuanp/nerdtree-git-plugin'                    " Git information in NERDTree
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'        " Colorize file icons in NERDTree
Plug 'bkad/CamelCaseMotion'
Plug 'tmhedberg/matchit', { 'for': ['html', 'xml'] }
Plug 'vim-scripts/vim-auto-save'
Plug 'terryma/vim-expand-region'
Plug 'nelstrom/vim-visual-star-search'
Plug 'tmhedberg/matchit'
Plug 'sheerun/vim-polyglot'                           " Syntax highlight
Plug 'othree/yajs.vim', { 'for': 'javascript' }       " Javscript syntax including ES spec
Plug 'vim-airline/vim-airline'                        " Decorate status/tabline
Plug 'vim-airline/vim-airline-themes'                 " Airline themes
Plug 'airblade/vim-gitgutter'                         " Show git diff in gutter
Plug 'joshdick/onedark.vim'                           " Atom one dark theme
Plug 'rakr/vim-one'                                   " Atom one dark theme
Plug 'chrisbra/Colorizer'                             " Detect and colorize HTML colors
Plug 'vim-syntastic/syntastic'                        " Syntax checking
Plug 'kana/vim-textobj-user'                          " Add additional text objects
Plug 'kana/vim-textobj-function'                      " Add function based text objects
Plug 'thinca/vim-textobj-function-javascript'         " Add JS function object
Plug 'ryanoasis/vim-devicons'                         " File icons for Plugins

filetype plugin indent on
call plug#end()

" Basic Settings

filetype on
syntax on
set nocompatible
set modelines=0
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set encoding=UTF-8
set scrolloff=3
set autoindent
set showmode
set showcmd
set hidden
set wildmenu
set wildmode=list:longest
set visualbell
set ttyfast
set ruler
set backspace=indent,eol,start
set laststatus=2
set number
set cursorline
set noundofile
set ignorecase
set smartcase
set gdefault
set incsearch
set showmatch
set hlsearch
nnoremap <tab> %
vnoremap <tab> %
set nolist
set spell spelllang=en_us
set nospell
set clipboard=unnamed
set backupdir=~/.vim/tmp
set directory=~/.vim/tmp
:runtime macros/matchit.vim
:set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:␣
" :set list

" create needed directories if they don't exist
if !isdirectory(&backupdir)
    call mkdir(&backupdir, "p")
endif
if !isdirectory(&directory)
    call mkdir(&directory, "p")
endif

" Java Settings

let java_highlight_all=1

let java_highlight_functions="style"

let java_allow_cpp_keywords=1
au FileType java,javascript setlocal smartindent
au FileType javascript setlocal ts=2 sw=2 sts=2
au FileType javascript setlocal omnifunc=javscriptcomplete#CompleteJS

" Javascript settings
au FileType javascript :let g:auto_save=0
let g:jsx_ext_required=0 " JSX syntax higlightning and identation in '.js'-files
let g:syntastic_javascript_checkers = ['eslint']


" Aesthetics
" set macligatures
set guifont:FiraCode\ Nerd\ Font\ Mono:h12
colorscheme one
let g:airline_theme='one'
set background=dark
let g:one_allow_italics=1
let g:airline_powerline_fonts=1
let g:DevIconsDefaultFolderOpenSymbol=''
let g:DevIconsDefaultFolderClosedSymbol=''
let g:WebDevIconsUnicodeDecorateFolderNodes=1
let g:WebDevIconsUnicodeDecorateFileNodesExactSymbols={}
let g:WebDevIconsUnicodeDecorateFileNodesExactSymbols['package.json']=''
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
"set ambiwidth=double "used for nice NERDTree icons in mvim
let g:jsx_ext_required = 0

" Mappings and shortcuts
let mapleader = ","

inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>
au FocusLost * :wa
" Exit visual mode
vnoremap . :norm.<CR>
" Copy search for selected text
vnoremap // y/<C-R>"<CR>
"move to beginning/end of line
nnoremap B ^
nnoremap E $
" $/^ doesn't do anything
nnoremap $ <nop>
nnoremap ^ <nop>

"Bubble single lines (kicks butt)
""http://vimcasts.org/episodes/bubbling-text/
nmap <C-Up> ddkP
nmap <C-Down> ddp

"Bubble multiple lines
vmap <C-Up> xkP`[V`]
vmap <C-Down> xp`[V`]

" Basics
inoremap jj <ESC>

" Alternate buffer
nnoremap <C-Tab> :e#<CR>

" paste without overwriting
xnoremap p "_dP
" paste from replacement buffer
xnoremap <leader>p "0p
nnoremap <leader>p "0p
nnoremap <leader><space> :noh<cr>
" Use The Silver Searcher with ack
if executable('ag')
    let g:ackprg = 'ag --vimgrep'
endif

" open NERDTreeToggle
nnoremap <leader>t :NERDTreeToggle<CR>

" easy move in camel case words
call camelcasemotion#CreateMotionMappings('<leader>')

" CtrlP ignores
let g:ctrlp_custom_ignore = '\v[\/](node_modules|target)|(\.(swp|git))$'

" Auto save enable at startup
let g:auto_save=1
let g:auto_save_in_insert_mode=0  " do not save while in insert mode

"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more "information.)
if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif
