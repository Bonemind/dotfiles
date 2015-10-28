filetype off

if has('vim_starting')
set nocompatible               " Be iMproved

" Required:
set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundle 'Shougo/neobundle.vim'
NeoBundle 'tpope/vim-commentary'
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'ciaranm/detectindent'
NeoBundle 'rafiks/dfrank_util'
NeoBundle 'mattn/emmet-vim'
NeoBundle 'vim-scripts/Gundo'
NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'vim-scripts/indexer.tar.gz'
NeoBundle 'Shougo/neocomplcache.vim'
NeoBundle 'vexxor/phpdoc.vim'
NeoBundle 'tpope/vim-repeat'
NeoBundle 'tsaleh/vim-supertab'
NeoBundle 'tpope/vim-surround'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'godlygeek/tabular'
NeoBundle 'vim-scripts/taglist.vim'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'tpope/vim-abolish'
NeoBundle 'bling/vim-airline'
NeoBundle 'bling/vim-bufferline'
NeoBundle 't9md/vim-choosewin'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'justinmk/vim-sneak'
NeoBundle 'Shougo/vimfiler.vim'
NeoBundle 'vim-scripts/vimprj'
NeoBundle 'lervag/vimtex'
NeoBundle 'tpope/vim-rails'
NeoBundle 'tpope/vim-bundler'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'vim-scripts/Diablo3'
NeoBundle 'benmills/vimux'
NeoBundle 'skalnik/vim-vroom'
NeoBundle 'kana/vim-textobj-user'
NeoBundle 'rhysd/vim-textobj-ruby'
NeoBundle 'christoomey/vim-tmux-navigator'
NeoBundle 'dbakker/vim-projectroot'
NeoBundle 'james9909/stackanswers.vim'

call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

"syntax highlighting on
syntax on

"Background color/style
set background=dark

"Setting the default colorscheme
if has('gui_running')
 colorscheme diablo3
else
 colorscheme diablo3
endif

"Diablo3 longline warning
let g:diablo3_longline = 1

"buffers can now exist in background
set hidden

"turn on plugins and stuff
filetype on
filetype plugin on
filetype indent on

"Make backspace behave in a sane way
set backspace=indent,eol,start

"turn off vi compatibility
set nocompatible

"Statusbar
set laststatus=2

"Unite
let g:unite_enable_start_insert = 1
let g:unite_force_overwrite_statusline = 0
let g:unite_winheight = 10

call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#filters#sorter_default#use(['sorter_rank'])

"NeoComplCache
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_min_syntax_length = 1
let g:neocomplcache_max_list = 20

"Indent-guides
autocmd VimEnter * :IndentGuidesEnable

"turn on line numbers
set number
set relativenumber

"key remaps
function! NumberToggle()
 if(&relativenumber == 1)
  set number
 else
  set relativenumber
 endif
endfunc

nnoremap <silent> <leader>q :TlistToggle<CR>
nnoremap <silent> <leader>e :VimFilerExplorer<CR>
nnoremap <silent> - :VimFiler<CR>
nnoremap <silent> <leader>g :GundoToggle<CR>
nnoremap <silent> <leader>f :CtrlPMixed<CR>
nnoremap <silent> <leader>p :CtrlP<CR>
nnoremap <silent> <leader>v :vsplit<cr>
nnoremap <silent> <leader><leader>ur :Unite file_rec<cr>
nnoremap <silent> <leader><leader>uf :Unite file<cr>
nnoremap <silent> <leader><leader>uh :Unite file_mru<cr>
nnoremap <silent> <leader>u :Unite buffer<cr>

" Window management

" nnoremap <silent> <leader>h <C-w>h
" nnoremap <silent> <leader>l <C-w>l
" nnoremap <silent> <leader>j <C-w>j
" nnoremap <silent> <leader>k <C-w>k
let g:tmux_navigator_no_mappings = 1
nnoremap <silent> <C-k> :TmuxNavigateUp<cr>
nnoremap <silent> <C-j> :TmuxNavigateDown<cr>
nnoremap <silent> <C-l> :TmuxNavigateRight<cr>
nnoremap <silent> <C-h> :TmuxNavigateLeft<cr>

"Switch to previous and nex buffer
nnoremap <silent> <leader>bn :bn<cr>
nnoremap <silent> <leader>bp :bp<cr>
nnoremap <silent> <leader>bd :bd<cr>

"Tab indents
nnoremap <silent> <Tab> >>
vnoremap <silent> <Tab> >gv
nnoremap <silent> <S-Tab> <<
vnoremap <silent> <S-Tab> <gv


"Emmet
let g:user_emmet_install_global = 0
autocmd FileType html,css,php EmmetInstall
let g:user_emmet_leader_key='<leader><leader>e'

"binds to make HL behave like a stronger h and l
nnoremap <silent> H ^
nnoremap <silent> L $
vnoremap <silent> H ^
vnoremap <silent> L $


"Open vimrc in
nnoremap <silent> <leader>ev :edit $MYVIMRC<cr>

"Open hosts file
nnoremap <silent> <leader>eh :edit C:/Windows/System32/drivers/etc/hosts<cr>

"NOP arrow keys
nnoremap <Up> <NOP>
nnoremap <Down> <NOP>
nnoremap <Left> <NOP>
nnoremap <Right> <NOP>

inoremap <Up> <NOP>
inoremap <Down> <NOP>
inoremap <Left> <NOP>
inoremap <Right> <NOP>
inoremap <esc> <NOP>

"Comment current function
inoremap <C-P> <ESC>:call PhpDocSingle()<CR>i

"Use jj instead of escape
imap jj <c-c>

"Some command remaps to not have to pay attention
cnoreabbrev W w
cnoreabbrev Wa wa
cnoreabbrev WA wa
cnoreabbrev Q q
cnoreabbrev Qa qa
cnoreabbrev QA qa

"Set windows font
if has("gui_running")
 if has("gui_gtk2")
  set guifont=Inconsolata-g:h10:i:cANSI\ 12
 elseif has("gui_win32")
  set guifont=Consolas:h11:cANSI
 endif
endif

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
set scrolloff=8

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
set undolevels=1000 "maximum number of changes that can be undone
set undoreload=10000 "maximum number lines to save for undo on a buffer reload

"Code folding
set foldmethod=indent   "fold based on indent
set foldnestmax=10      "deepest fold is 10 levels
set nofoldenable        "dont fold by default
set foldlevel=1         "this is just what i use

"Modelines
set modeline
set modelines=5

"Set working directory to current file
autocmd BufEnter * silent! lcd %:p:h

"Certain filetypes shouldn't be processed by detectindent
fun! DetectIndentExlude()
 " Don't strip on these filetypes
 if &ft =~ 'php\|html\|js\|ruby'
  return
 endif
 :DetectIndent
endfun

"DetectIndent
autocmd BufReadPost * call DetectIndentExlude()

"Choosewin
nmap <leader><leader>s <Plug>(choosewin)
let g:choosewin_overlay_enable = 1
let g:choosewin_blink_on_land = 1

"VimFiler
let g:vimfiler_safe_mode_by_default = 0

" Neosnippet
imap <leader>r     <Plug>(neosnippet_expand_or_jump)
smap <leader>r     <Plug>(neosnippet_expand_or_jump)
xmap <leader>r     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
" imap <expr><TAB>
" \ pumvisible() ? "\<C-n>" :
" \ neosnippet#expandable_or_jumpable() ?
" \    "\<TAB>" : "\<Plug>(neosnippet_expand_or_jump)"
" smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
" \ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For conceal markers.
if has('conceal')
 set conceallevel=2 concealcursor=niv
endif

let g:neosnippet#snippets_directory='~/.vim/snippets'

set shell=/bin/bash

" List chars
set list lcs=tab:>-,trail:>

" Vimux vroom
let g:vroom_use_vimux=1
let g:vroom_use_binstubs=1

map <leader>vr :VimuxPromptCommand<CR>
map <leader>vq :VimuxCloseRunner<CR>
map <leader>vx :VimuxInterruptRunner<CR>
map <leader>rc :VroomRunTestFile<CR>
map <leader>rn :VroomRunNearestTest<CR>
map <leader>rl :VroomRunLastTest<CR>

" Syntastic
let g:syntastic_ruby_checkers = ['mri']

set conceallevel=0
