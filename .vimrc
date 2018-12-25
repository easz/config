""
"" Plug-Ins
""

"" vim-plug
call plug#begin('~/.vim/plugged')

" theme
Plug 'itchyny/lightline.vim'
Plug 'rafi/awesome-vim-colorschemes'

" file
Plug 'scrooloose/nerdtree'

" search
Plug 'mileszs/ack.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" language
Plug 'sheerun/vim-polyglot'
Plug 'Valloric/YouCompleteMe'
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable'}

" Perforce
Plug 'easz/perforce.vim'

" misc.
Plug 'nestorsalceda/vim-strip-trailing-whitespaces'
Plug 'djoshea/vim-autoread'

call plug#end()


""
"" Themes
""

"" light-line
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ }

"" colorscheme
" Recommended: dracula, wombat256mod, tender, gruvbox
set background=dark
color gruvbox

""
"" Config
""

"" general
set encoding=utf-8
set fileencoding=utf-8
scriptencoding utf-8

filetype plugin indent on  " Load plugins according to detected filetype.
syntax on                  " Enable syntax highlighting.
set number                 " Enable line number

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

"" cursor in cygwin
if has("win32unix")
  let &t_ti.="\e[1 q"
  let &t_SI.="\e[5 q"
  let &t_EI.="\e[1 q"
  let &t_te.="\e[0 q"
endif

""
"" Add-On
""

"" ag / ack
let g:ackprg = 'ag --vimgrep'

"" YCM
let g:ycm_confirm_extra_conf = 0

""
"" Key Mapping
""

"" <Space>   -- Leader key
let mapleader="\<Space>"

"" file browser (NERDTree)
" <C-b>      -- to toggle file browser
" <Tab>      -- to open file from file browser
" <Enter>    -- to reveal opened file in file browser
nnoremap <silent> <Leader>b    :NERDTreeToggle<CR>
nnoremap <silent> <CR>         :NERDTreeFind<CR>
let g:NERDTreeMapActivateNode = "<Tab>"
let g:NERDTreeMinimalUI       = 1
let g:NERDTreeChDirMode       = 2
let g:NERDTreeShowHidden      = 1
let g:NERDTreeIgnore          = ['\.DS_Store$', '\~$', '\..*ignore']

"" Buffer, Window, File, Command
" <Leader>w  -- close current buffer
" <Leader>q  -- close current window
nnoremap <silent> <Leader>w  :bp\|bd #<CR>
nnoremap <silent> <Leader>q  :close<CR>
" <Leader>,  -- show all buffers (fzf)
" <Leader>;  -- search file by name in current working directory (fzf)
" <Leader>p  -- show command history (fzf)
nnoremap <silent> <Leader>,  :Buffers<CR>
nnoremap <silent> <Leader>;  :Files<CR>
nnoremap <silent> <Leader>p  :History:<CR>
" <C-s>      -- save file
" note: 'stty -ixon' prevents terminal intercept C-s
silent !stty -ixon
autocmd VimLeave * silent !stty ixon
nnoremap <C-s>  :update<CR>
vnoremap <C-s>  <C-C>:update<CR>
inoremap <C-s>  <C-O>:update<CR>
" <Tab>         -- switch buffers
" <S-Tab>       -- reverse switch buffers
nnoremap <silent> <Tab>  :bnext<CR>
nnoremap <silent> <S-Tab>        :bprevious<CR>

"" YCM
nnoremap <Leader>g  :YcmCompleter GoTo<CR>
nnoremap <C-x>r  :YcmCompleter GoToReferences<CR>
nnoremap <C-x>t  :YcmCompleter GetType<CR>
nnoremap <C-x>p  :YcmCompleter GetParent<CR>
nnoremap <C-x>d  :YcmCompleter GetDoc<CR>
