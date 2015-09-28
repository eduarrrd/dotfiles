set nocompatible

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'scrooloose/nerdcommenter'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'mileszs/ack.vim'
Plugin 'tpope/vim-sleuth'

call vundle#end()

filetype plugin indent on    " also required for Vundle
syntax on

set hidden                   " hide buffers instead of closing them
set ttyfast
set cursorline
set splitbelow
set showmatch
set encoding=utf-8
set scrolloff=10
set wildmenu
set wildmode=list:longest,full

" Latexsuite
"set grepprg=grep\ -nH\ $*
"let g:tex_flavor = "latex"

"set background=dark

" Remember last cursor position
augroup resCur
	autocmd!
	autocmd BufReadPost * call setpos(".", getpos("'\""))
augroup END

set incsearch
set hlsearch
set ignorecase
set smartcase

set whichwrap=b,s,h,l,>,<,[,]

" listchars
set list
"set listchars=trail:·,precedes:«,extends:»,eol:↲,tab:▸\ 
set listchars=trail:·,precedes:«,extends:»,tab:▸\ 

"set statusline=\ \%f%m%r%h%w\ ::\ %y\ [%{&ff}]\%=\ [%p%%:\ %l/%L]\ 
"let g:airline_theme = "murmur"
"set laststatus=2

set number
set rnu
set ruler

nnoremap <F8> :set wrap!<CR>

" don't pollute directories with swap files, keep them in one place
silent !mkdir -p ~/.vim/{backup,swp}/
set backupdir=~/.vim/backup//
set directory=~/.vim/swp//

"set mouse=a

" Unmap arrow keys to force hjkl
map <Left>  <Nop>
map <Right> <Nop>
map <Up>    <Nop>
map <Down>  <Nop>

set colorcolumn=81

" I hold shift a lot, make :W work like :w and :Q like :q
cabbr W w
cabbr Q q

set autochdir

set modeline

" control+p to toggle pasting
set pastetoggle=<C-p>
set nopaste
