set splitbelow
set guioptions-=T
set guioptions-=m
set guioptions-=L
set guioptions-=r
set guioptions-=b

nnoremap <c-z> <nop>

:set guifont=Consolas:h11

set shell=C:\Users\trlk\AppData\Local\Programs\Git\bin\bash.exe
set splitbelow

"windows like stuff
:smap <Del> <C-g>"_d
:smap <C-c> <C-g>y
:smap <C-x> <C-g>x
:imap <C-v> <Esc>pi
:smap <C-v> <C-g>p
:smap <Tab> <C-g>1> 
:smap <S-Tab> <C-g>1<

" set the backspace to delete normally
set backspace=indent,eol,start

" store backup, undo, and swap files in temp directory
set directory=$HOME/temp//
set backupdir=$HOME/temp//
set undodir=$HOME/temp//

" set start directory
:cd C:\Users\trlk\GitHub

let g:minimap_highlight='Visual'

"Use built-in tab style instead of GUI
set guioptions-=e
set nolist

"Plugins
autocmd VimEnter * NERDTree
let g:airline_theme = 'deus'
inoremap <silent><expr> <c-space> coc#refresh()

" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('C:/Program\ Files\ (x86)/Vim/vim82/pack/vendor/start')

" Make sure you use single quotes

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'preservim/nerdtree'
Plug 'preservim/nerdtree'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'severin-lemaignan/vim-minimap'

Plug 'pangloss/vim-javascript'    " JavaScript support
Plug 'leafgarland/typescript-vim' " TypeScript syntax
Plug 'maxmellon/vim-jsx-pretty'   " JS and JSX synta

Plug 'rafi/awesome-vim-colorschemes'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'tomasiser/vim-code-dark'

" Initialize plugin system
call plug#end()

let g:coc_global_extensions = ['coc-tsserver']

" set listchars=tab:?\ ,eol:?,trail:·,extends:>,precedes:<

let NERDTreeShowHidden=1

"Turn on grammar"
syntax on

"At the bottom, display whether you are in command mode or insert mode
set showmode

colorscheme onedark

set showcmd

"Mouse is supported
set mouse=a

"Enable 256 colors
set t_Co=256

"When you press enter, the indent of the next line will automatically keep up with the indent of the next line
set autoindent

"This setting automatically turns tab to a space because the tab key indents differently in different editors
set expandtab

"Display line number"
set number

"The current line of the cursor is highlighted"
set cul

"Auto fold", that is, the line that is too long is divided into several lines
set wrap

"Display the current position of the cursor in the status bar (in which row and which column)
set ruler

"When the cursor encounters parentheses, square brackets, and braces, it will automatically highlight another corresponding parenthesis, square bracket, and brace
set showmatch

"When searching, highlight the matching results
set hlsearch

"When you enter a search pattern, each character will automatically jump to the first matching result
set incsearch

"Ignore case when searching
set ignorecase

"The width of the tab key
set tabstop=2

"relative line number
set relativenumber
set rnu

"Uniform indent to 2
set softtabstop=2
set shiftwidth=2

filetype plugin on
filetype indent on

" So we don't have to press shift when we want to get into command mode.
nnoremap ; :
vnoremap ; :

" bindings for easy split nav
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
