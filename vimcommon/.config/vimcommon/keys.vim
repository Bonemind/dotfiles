"key remaps
nnoremap <silent> <leader>q :TagbarToggle<CR>
nnoremap <silent> <leader><leader>q :CtrlPTag<CR>
nnoremap <silent> <leader>e :NERDTreeToggle<CR>
nnoremap <silent> <leader>g :GundoToggle<CR>
nnoremap <silent> <leader>f :CtrlP<CR>
nnoremap <silent> <leader>v :vsplit<cr>
nnoremap <leader>t :call VimuxPromptCommand()<CR>

" Window management
let g:tmux_navigator_no_mappings = 1
nnoremap <silent> <C-k> :TmuxNavigateUp<cr>
nnoremap <silent> <C-j> :TmuxNavigateDown<cr>
nnoremap <silent> <C-l> :TmuxNavigateRight<cr>
nnoremap <silent> <C-h> :TmuxNavigateLeft<cr>

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
inoremap <esc> <NOP>

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
map <leader>rc :VroomRunTestFile<CR>
map <leader>rn :VroomRunNearestTest<CR>
map <leader>rl :VroomRunLastTest<CR>
