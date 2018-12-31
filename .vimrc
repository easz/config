""
"" Plug-Ins
""

""  Note: Manual Installation Steps
""
""  YCM -- ~/.vim/plugged/YouCompleteMe/install.py

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
"Plug 'w0rp/ale'

" Perforce
Plug 'easz/perforce.vim'

" misc.
Plug 'nestorsalceda/vim-strip-trailing-whitespaces'
Plug 'djoshea/vim-autoread'

call plug#end()


""
"" Themes
""

"" disable bg color to work properly in tmux
" (this autocmd must be defined before any colorscheme definition)
au ColorScheme * highlight Normal ctermbg=NONE guibg=NONE

"" light-line
let g:lightline = {
      \ 'colorscheme': 'seoul256',
      \ }

"" colorscheme
" Recommended: dracula, wombat256mod, tender, gruvbox
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
set t_Co=256               " 256 color term
set background=dark        " dark

set nowrap                 " no wrap
set fillchars+=vert:\      " windows separator w/o '|'

set clipboard=unnamed      " clipboard sharing


"" open file at the last visited line
au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif

"" language
au BufRead * if search('\M-*- C++ -*-', 'n', 1) | setlocal ft=cpp | endif


""
"" Add-On
""

"" ag / ack
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

"" YCM
let g:ycm_confirm_extra_conf = 0
let g:ycm_global_ycm_extra_conf = '~/.global_extra_conf.py'

"" ALE
"let g:ale_lint_on_text_changed = 'never'
"let g:ale_lint_on_enter = 0
"let $PATH = '/usr/local/opt/llvm/bin:'.$PATH
"let g:ale_linters = {'cpp': []}
"let g:ale_fixers = {'cpp': ['clang-format']}

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
let g:NERDTreeIgnore          = ['\.DS_Store$', '\~$', '\..*ignore', '\.swp$']

"" Buffer, Window, File, Command
" <Leader>w  -- close current buffer
" <Leader>q  -- close current window
nnoremap <silent> <Leader>w  :bp\|bd #<CR>
nnoremap <silent> <Leader>q  :close<CR>
" <Leader>,  -- show all buffers (fzf)
" <Leader>.  -- show recent files (fzf)
" <Leader>;  -- search file by name in current working directory (fzf)
" <Leader>p  -- show command history (fzf)
nnoremap <silent> <Leader>,  :Buffers<CR>
nnoremap <silent> <Leader>.  :History<CR>
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
nnoremap <C-x>r     :YcmCompleter GoToReferences<CR>
nnoremap <C-x>t     :YcmCompleter GetType<CR>
nnoremap <C-x>p     :YcmCompleter GetParent<CR>
nnoremap <C-x>d     :YcmCompleter GetDoc<CR>

"" Visual / Search / Highlight / Replace
" { Credit: https://github.com/nelstrom/vim-visual-star-search/blob/master/plugin/visual-star-search.vim
"           https://stackoverflow.com/questions/676600/vim-search-and-replace-selected-text
function! s:VSetSearch(cmdtype)
  let temp = @s
  norm! gv"sy
  let selected = '\V' . substitute(escape(@s, a:cmdtype.'\'), '\n', '\\n', 'g')
  let @/ = selected
  let @s = temp
  return selected " escaped selected text pattern
endfunction
" *, #           -- search selected text in VISUAL mode
xnoremap * :<C-u>call <SID>VSetSearch('/')<CR>/<C-R>=@/<CR><CR>
xnoremap # :<C-u>call <SID>VSetSearch('?')<CR>?<C-R>=@/<CR><CR>
" <C-r>          -- replace selected text in VISUAL mode.
vnoremap <C-r> "hy:%s/<c-r>=<SID>VSetSearch('/')<CR>//gc<left><left><left>
" <Leader><ESC>  -- clear search result highlight
nnoremap <silent> <Leader><ESC>  :noh<CR>
" }

