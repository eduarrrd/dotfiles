set nocompatible

filetype plugin indent on
syntax on

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

nnoremap <F8> :set wrap!<CR>

"set mouse=a

" Unmap arrow keys to force hjkl
map <Left> <Nop>
map <Right> <Nop>
map <Up> <Nop>
map <Down> <Nop>

set colorcolumn=80

set autochdir

set modeline

map <F9> :NERDTreeToggle<CR>
