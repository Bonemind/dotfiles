filetype off

" Set dein variables
let deinpath=expand('~/.config/nvim/nvimplugins/dein.vim/repos/github.com/Shougo/dein.vim')
let deinpluginpath=expand('~/.config/nvim/nvimplugins/deinplugins')

" Add dein to runtimepath
execute 'set runtimepath^=' . deinpath

function AddSpecificPlugins()
 call dein#add('Shougo/deoplete.nvim', { 'rev': 'c202045a12820ee3bda81889295651241289c967' })
endfunction

source ~/.config/vimcommon/common.vim

let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_ignore_case = 1
let g:deoplete#auto_complete_delay = 1
let g:deoplete#max_list = 20

