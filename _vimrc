
" ========== Remove Gui ============

set guioptions-=T
set guioptions-=m
set guioptions-=L
set guioptions-=r
set guioptions-=b

" ========= Font options ===========
:set guifont=Consolas:h11

"========== Paths ==================
" set shell=C:/Program\ Files/Git/bin/bash.exe
" set start directory
:cd C:\Users\trygv\Documents\GitHub

" ========= Plugins ==================
autocmd VimEnter * NERDTree
let g:airline_theme = 'deus'
inoremap <silent><expr> <c-space> coc#refresh()

" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('C:\Users\trygv\Vim\vim82\pack\vendor')

" Make sure you use single quotes

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'preservim/nerdtree'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc-eslint'

Plug 'pangloss/vim-javascript'    " JavaScript support
Plug 'leafgarland/typescript-vim' " TypeScript syntax
Plug 'maxmellon/vim-jsx-pretty'   " JS and JSX synta

Plug 'rafi/awesome-vim-colorschemes'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'tomasiser/vim-code-dark'

" Initialize plugin system
call plug#end()

let g:coc_global_extensions = ['coc-tsserver']

" ============== Set <K> hover options ========
nnoremap <silent> K :call CocAction('doHover')<CR>
function! ShowDocIfNoDiagnostic(timer_id)
  if (coc#float#has_float() == 0 && CocHasProvider('hover') == 1)
    silent call CocActionAsync('doHover')
  endif
endfunction

function! s:show_hover_doc()
  call timer_start(500, 'ShowDocIfNoDiagnostic')
endfunction

autocmd CursorHoldI * :call <SID>show_hover_doc()
autocmd CursorHold * :call <SID>show_hover_doc()

" =========== Misc options =========
" Activate eslint if exists in node_modules
if isdirectory('./node_modules') && isdirectory('./node_modules/eslint')
  let g:coc_global_extensions += ['coc-eslint']
endif

set splitbelow

" remove c-z
nnoremap <c-z> <nop>

" set the backspace to delete normally
set backspace=indent,eol,start

" store backup, undo, and swap files in temp directory
set nobackup

"Use built-in tab style instead of GUI
set guioptions-=e
set nolist

" show NerdTree
let NERDTreeShowHidden=1

:set guioptions+=a

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

" set encoding
:set nolist
:set encoding=utf-8
:set termencoding=utf-8

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
