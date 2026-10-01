" Minimal vimrc: bundled vim 9.x packages + vim-surround (submodule in ~/.vim/pack)

" Bundled packages
packadd! comment       " gc / gcc to toggle comments
packadd! editorconfig  " respect .editorconfig files
packadd! matchit       " % jumps between if/else, tags, etc.
packadd! hlyank        " briefly highlight yanked text

filetype plugin indent on
syntax on

" Appearance
set background=light
colorscheme lunaperche
set number
set relativenumber
set cursorline
set cursorcolumn
set laststatus=2
set showcmd
set list
set listchars=tab:░\ ,trail:·,extends:»,precedes:«,nbsp:⣿

" Behaviour
set hidden
set backspace=indent,eol,start
set scrolloff=8
set wildmenu
set wildoptions=pum,fuzzy

" Indentation
set autoindent
set copyindent
set tabstop=3
set shiftwidth=3

" Search
set ignorecase
set smartcase
set incsearch
set hlsearch
set showmatch

" No swap/backup clutter, but keep persistent undo
set noswapfile
set nobackup
set nowritebackup
set undodir=~/.vim/undodir
set undofile
set undolevels=1000
set undoreload=10000

" Folding: indent-based, open by default
set foldmethod=indent
set foldnestmax=10
set nofoldenable
set foldlevel=1

augroup vimrc
  autocmd!
  " Set working directory to current file
  autocmd BufEnter * silent! lcd %:p:h
  autocmd FileType markdown setlocal shiftwidth=2 softtabstop=2 tabstop=2 expandtab
augroup END

" Keys
nnoremap <silent> <leader>bn :bn<CR>
nnoremap <silent> <leader>bp :bp<CR>
nnoremap <silent> <leader>bd :bd<CR>
nnoremap <silent> <leader>ev :edit $MYVIMRC<CR>

" Tab indents
nnoremap <silent> <Tab> >>
vnoremap <silent> <Tab> >gv
nnoremap <silent> <S-Tab> <<
vnoremap <silent> <S-Tab> <gv

" H and L as stronger h and l
nnoremap H ^
nnoremap L $
vnoremap H ^
vnoremap L $

" No arrow keys
nnoremap <Up> <Nop>
nnoremap <Down> <Nop>
nnoremap <Left> <Nop>
nnoremap <Right> <Nop>
inoremap <Up> <Nop>
inoremap <Down> <Nop>
inoremap <Left> <Nop>
inoremap <Right> <Nop>

inoremap jj <Esc>
tnoremap jj <C-\><C-n>

" Common typos
cnoreabbrev W w
cnoreabbrev Wa wa
cnoreabbrev WA wa
cnoreabbrev Q q
cnoreabbrev Qa qa
cnoreabbrev QA qa

command! Wsudo w !sudo tee > /dev/null %
