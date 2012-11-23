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

set backspace=indent,eol,start

"turn off vi compatibility
set nocompatible

"turn on line numbers
set number

"key remaps
nnoremap ; :
function! NumberToggle()
  if(&relativenumber == 1)
    set number
  else
    set relativenumber
  endif
endfunc

nnoremap <C-a> :call NumberToggle()<cr>
nnoremap <C-q> :execute '!C:\arduinouploader\ArduinoUploader.exe "' . expand('%:p') . '" 1 COM' 

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

"Syntax defines
au BufRead,BufNewFile *.pde set filetype=arduino
au BufRead,BufNewFile *.ino set filetype=arduino

"Persistent undo
set undodir=~/.vim/undodir
set undofile
set undolevels = 1000 "maximum number of changes that can be undone
set undoreload = 10000 "maximum number lines to save for undo on a buffer reload
