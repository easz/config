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

" p4 commands
command P4Edit             !p4 edit %
command P4Revert           !p4 revert %
command P4RevertUnchanged  !p4 revert -a
command P4Add              !p4 add %

""
"" general config
""
set encoding=utf-8
set fileencoding=utf-8
scriptencoding utf-8

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

set clipboard=unnamed      " clipboard sharing

""
"" light-line
""
let g:lightline = {
      \ 'colorscheme': 'Dracula',
      \ }

""
"" dracula theme
""
colorscheme dracula

""
"" ack / silver searcher
""
let g:ackprg = 'ag --vimgrep'

""
"" mapping
""
" as Leader key
let mapleader="\<Space>"

""
"" file browser
""
" <C-b>      to toggle file browser
" <Tab>      to open file from file browser
" <Enter>    to reveal opened file in file browser
nnoremap <silent> <C-b>  :NERDTreeToggle<CR>
nnoremap <silent> <CR>   :NERDTreeFind<CR>
let g:NERDTreeMapActivateNode = "<Tab>"
let g:NERDTreeMinimalUI       = 1
let g:NERDTreeChDirMode       = 2
let g:NERDTreeShowHidden      = 1
let g:NERDTreeIgnore          = ['\.DS_Store$', '\~$', '\..*ignore']

" <Leader>w  close current buffer
" <Leader>q  close current window
nnoremap <silent> <Leader>w :bp\|bd #<CR>
nnoremap <silent> <Leader>q :close<CR>

" ;          show all buffers
" <:eader>;  search file by name in current working directory
nnoremap <silent>         ; :Buffers<CR>
nnoremap <silent> <Leader>; :Files<CR>
nnoremap <silent> <Leader>p :History:<CR>

" <C-n>       new a unnamed buffe
nnoremap <silent> <C-n> :enew<CR>i
" <C-s>       save file
noremap  <C-s>          :update<CR>
vnoremap <C-S>          <C-C>:update<CR>
inoremap <C-S>          <C-O>:update<CR>

" <Tab>       switch buffers
" <S-Tab>     erverse switch buffers
nnoremap <silent> <Tab>     :bnext<CR>
nnoremap <silent> <S-Tab>   :bprevious<CR>




