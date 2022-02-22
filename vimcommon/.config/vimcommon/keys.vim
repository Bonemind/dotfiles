"key remaps
nnoremap <silent> <leader>q :TagbarToggle<CR>
nnoremap <silent> <leader><leader>q :CtrlPTag<CR>
nnoremap <silent> <leader>e :NERDTreeToggle<CR>
nnoremap <silent> <leader>g :GundoToggle<CR>
nnoremap <silent> <leader>f :CtrlP<CR>
nnoremap <leader>t :call VimuxPromptCommand()<CR>

" Window management
let g:tmux_navigator_no_mappings = 1
nnoremap <silent> <C-w>k :TmuxNavigateUp<cr>
nnoremap <silent> <C-w>j :TmuxNavigateDown<cr>
nnoremap <silent> <C-w>l :TmuxNavigateRight<cr>
nnoremap <silent> <C-w>h :TmuxNavigateLeft<cr>

"Buffers
nnoremap <silent> <leader>bn :bn<cr>
nnoremap <silent> <leader>bp :bp<cr>
nnoremap <silent> <leader>bd :bd<cr>
nnoremap <silent> <leader>bf :CtrlPBuffer<cr>

"Tab indents
nnoremap <silent> <Tab> >>
vnoremap <silent> <Tab> >gv
nnoremap <silent> <S-Tab> <<
vnoremap <silent> <S-Tab> <gv


"binds to make HL behave like a stronger h and l
nnoremap <silent> H ^
nnoremap <silent> L $
vnoremap <silent> H ^
vnoremap <silent> L $

" Visual split
vnoremap <silent> <leader>vs :VSSplit<CR>

"Open vimrc in
nnoremap <silent> <leader>ev :edit $MYVIMRC<cr>

"NOP arrow keys
nnoremap <Up> <NOP>
nnoremap <Down> <NOP>
nnoremap <Left> <NOP>
nnoremap <Right> <NOP>

inoremap <Up> <NOP>
inoremap <Down> <NOP>
inoremap <Left> <NOP>
inoremap <Right> <NOP>

"NOP S-k
nnoremap <s-k> <NOP>

"Use jj instead of escape
imap jj <c-c>


"Some command remaps for common typos
cnoreabbrev W w
cnoreabbrev Wa wa
cnoreabbrev WA wa
cnoreabbrev Q q
cnoreabbrev Qa qa
cnoreabbrev QA qa

" Neosnippet
imap <leader>r     <Plug>(neosnippet_expand_or_jump)
smap <leader>r     <Plug>(neosnippet_expand_or_jump)
xmap <leader>r     <Plug>(neosnippet_expand_target)

map <leader>vr :VimuxPromptCommand<CR>
map <leader>vq :VimuxCloseRunner<CR>
map <leader>vx :VimuxInterruptRunner<CR>
map <leader>vl :VimuxRunLastCommand<CR>

" Vim LSP
" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

nnoremap <silent> <leader>cd  :<C-u>CocList diagnostics<cr>
nnoremap <silent> <leader>cc  :<C-u>CocList commands<cr>
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Terminal binds
tnoremap jj <C-\><C-n>
