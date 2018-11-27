""
"" vim-plug
""
call plug#begin('~/.vim/plugged')

Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'nestorsalceda/vim-strip-trailing-whitespaces'
Plug 'scrooloose/nerdtree'
Plug 'itchyny/lightline.vim'
Plug 'sheerun/vim-polyglot'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'mileszs/ack.vim'

call plug#end()

""
"" general config
""
filetype plugin indent on  " Load plugins according to detected filetype.
syntax on                  " Enable syntax highlighting.

set autoindent             " Indent according to previous line.
set expandtab              " Use spaces instead of tabs.
set softtabstop =2         " Tab key indents by 4 spaces.
set shiftwidth  =2         " >> indents by 4 spaces.
set shiftround             " >> indents to next multiple of 'shiftwidth'.

set backspace   =indent,eol,start  " Make backspace work as you would expect.
set hidden                 " Switch between buffers without having to save first.
set laststatus  =2         " Always show statusline.
set display     =lastline  " Show as much as possible of the last line.

set noshowmode             " Not show current mode in command-line.
set showcmd                " Show already typed keys when more are expected.

set incsearch              " Highlight while searching with / or ?.
set hlsearch               " Keep matches highlighted.

set ttyfast                " Faster redrawing.
set lazyredraw             " Only redraw when necessary.

set splitbelow             " Open new windows below the current window.
set splitright             " Open new windows right of the current window.

set cursorline             " Find the current line quickly.
set wrapscan               " Searches wrap around end-of-file.
set report      =0         " Always report changed lines.
set synmaxcol   =200       " Only highlight the first 200 columns.

set noerrorbells           " Disable audible and visual bells
set novisualbell           " -
set t_vb=                  " -

set nowrap                 " no wrap
set fillchars+=vert:\      " windows separator w/o '|'

""
"" light-line
""
let g:lightline = {
      \ 'colorscheme': 'Dracula',
      \ }

""
"" dracula theme
""
color dracula


""
"" ack / silver searcher
""
let g:ackprg = 'ag --vimgrep'


""
"" mapping
""
" use <SPACE> as Leader key
nnoremap <SPACE> <Nop>
let mapleader="\<SPACE>"

" <C-b>      to toggle file browser
" <SPACE>    to open file from file browser
" <Enter>    to reveal opened file in file browser
nnoremap <silent> <C-b>  :NERDTreeToggle<CR>
nnoremap <silent> <CR>   :NERDTreeFind<CR>
let g:NERDTreeMapActivateNode="<SPACE>"

" <Leader>w  close buffer
" ;          show buffers
" <:eader>;  search file by name
nnoremap <silent> <Leader>w :bp\|bd #<CR>
nnoremap <silent>         ; :Buffers<CR>
nnoremap <silent> <Leader>; :Files<CR>

" <C-s>       save file
noremap  <C-s>         :update<CR>
vnoremap <C-S>         <C-C>:update<CR>
inoremap <C-S>         <C-O>:update<CR>

" <Tab>       switch buffers
" <S-Tab>     erverse switch buffers
nnoremap <Tab>              :bnext<CR>
nnoremap <S-Tab>            :bprevious<CR>
