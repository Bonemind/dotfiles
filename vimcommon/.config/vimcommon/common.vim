filetype off
"
"turn off vi compatibility
set nocompatible

" Add dein to runtimepath
execute 'set runtimepath^=' . deinpath

" Dein plugins
if dein#load_state(deinpluginpath)
 call dein#begin(deinpluginpath)
 call dein#add(deinpath)

 call dein#add('Shougo/dein.vim')
 call dein#add('tpope/vim-commentary')
 call dein#add('ctrlpvim/ctrlp.vim')
 call dein#add('ciaranm/detectindent')
 call dein#add('rafiks/dfrank_util')
 call dein#add('mattn/emmet-vim')
 call dein#add('vim-scripts/Gundo')
 call dein#add('nathanaelkane/vim-indent-guides')
 call dein#add('tpope/vim-repeat')
 call dein#add('tsaleh/vim-supertab')
 call dein#add('tpope/vim-surround')
 call dein#add('scrooloose/syntastic')
 call dein#add('tpope/vim-abolish')
 call dein#add('bling/vim-airline')
 call dein#add('tpope/vim-fugitive')
 call dein#add('justinmk/vim-sneak')
 call dein#add('scrooloose/nerdtree')
 call dein#add('vim-scripts/vimprj')
 call dein#add('lervag/vimtex')
 call dein#add('tpope/vim-rails')
 call dein#add('tpope/vim-bundler')
 call dein#add('Shougo/neosnippet')
 call dein#add('danilo-augusto/vim-afterglow')
 call dein#add('benmills/vimux')
 call dein#add('skalnik/vim-vroom')
 call dein#add('kana/vim-textobj-user')
 call dein#add('rhysd/vim-textobj-ruby')
 call dein#add('christoomey/vim-tmux-navigator')
 call dein#add('dbakker/vim-projectroot')
 call dein#add('airblade/vim-gitgutter')
 call dein#add('majutsushi/tagbar')
 call dein#add('osyo-manga/vim-over')
 call dein#add('Shougo/neosnippet-snippets')
 call dein#add('othree/yajs.vim')
 call dein#add('sheerun/vim-polyglot')
 call dein#add('unblevable/quick-scope')
 call dein#add('roman/golden-ratio')
 call dein#add('junegunn/vim-easy-align')
 call dein#add('ryanoasis/vim-devicons')
 call dein#add('szw/vim-tags')
 call dein#add('wellle/targets.vim')
 call dein#add('chaoren/vim-wordmotion')

  call dein#end()
  call dein#save_state()

  " Calls AddSpecificPlugins that was defined in whatever vimrc we loaded
  " Either .vimrc or init.vim for neovim probably
  call AddSpecificPlugins()
endif

" Install any missing plugins
if dein#check_install()
 call dein#install()
end

"turn on plugins and stuff
filetype on
filetype plugin on
filetype indent on

" Devicons requires UTF-8
set encoding=utf8
let g:airline_powerline_fonts = 1

"syntax highlighting on
syntax on

"Background color/style
set background=dark

"Setting the default colorscheme
if has('gui_running')
 colorscheme afterglow
else
 colorscheme afterglow
endif

"buffers can now exist in background
set hidden

"Make backspace behave in a sane way
set backspace=indent,eol,start


"Statusbar
set laststatus=2

"Indent-guides
autocmd VimEnter * :IndentGuidesEnable

"turn on line numbers
set number
set relativenumber

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

source ~/.config/vimcommon/keys.vim

"Emmet
let g:user_emmet_install_global = 0
autocmd FileType html,css,php EmmetInstall
let g:user_emmet_leader_key='<leader><leader>e'


"automatic and smart indent
set autoindent
set copyindent
set smartindent
set tabstop=3
set shiftwidth=3

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
set undodir=~/.config/vimcommon/undodir
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
 if &ft =~ 'php\|html\|js\|ruby\|javascript'
  return
 endif
 :DetectIndent
endfun

"DetectIndent
autocmd BufReadPost * call DetectIndentExlude()

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

" Syntastic
let g:syntastic_ruby_checkers = ['mri']

"Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_section_c = '%t'
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tagbar#enabled = 1

"Add a sudo write command
command! Wsudo w !sudo tee > /dev/null %

"quickscope
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']

" Easy-align
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" Filetype mappings for unknown filetypes
augroup filetypedetect
    au BufRead,BufNewFile *.vimprj setfiletype vim
augroup END

"Bracketed paste mode
if &term =~ "screen.*"
    let &t_ti = &t_ti . "\e[?2004h"
    let &t_te = "\e[?2004l" . &t_te
    function XTermPasteBegin(ret)
        set pastetoggle=<Esc>[201~
        set paste
        return a:ret
    endfunction
    map <expr> <Esc>[200~ XTermPasteBegin("i")
    imap <expr> <Esc>[200~ XTermPasteBegin("")
    vmap <expr> <Esc>[200~ XTermPasteBegin("c")
    cmap <Esc>[200~ <nop>
    cmap <Esc>[201~ <nop>
endif
