"Syntax highlighting on
syntax on

"Background color/style
set background=dark

"Setting the default colorscheme
colorscheme desert

"Set .rb as ruby file 
au BufNewFile,BufRead *.rb set filetype=ruby

"buffers can now exist in background
set hidden

"turn on plugins and stuff
filetype on
filetype plugin on
filetype indent on 

"Set omnifunc libraries
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete

"turn off vi compatibility
set nocompatible

"turn on line numbers
set number

"key remaps
:map <silent> <C-a> :if &number <Bar> set relativenumber <Bar> else <Bar> set number <Return> <Esc>
nnoremap ; :


"make pathogen work
call pathogen#infect()

"turn on line and column markers
set cursorline
set cursorcolumn

"automatic and smart indent
set autoindent
set copyindent
set smartindent

"search related settings
set showcmd
set showmatch
set ignorecase
set smartcase
set incsearch
set hlsearch

"turn off useless clutter files
set noswapfile
set nobackup
set nowb
