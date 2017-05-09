filetype off

" Set dein variables
let deinpath=expand('~/.vim/vimplugins/dein.vim/repos/github.com/Shougo/dein.vim')
let deinpluginpath=expand('~/.vim/vimplugins/deinplugins')

" Add dein to runtimepath
execute 'set runtimepath^=' . deinpath

function AddSpecificPlugins()
 call dein#add('Shougo/neocomplete.vim')
endfunction

source ~/.config/vimcommon/common.vim

"NeoComplCache
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#sources#syntax#min_keyword_length = 1
let g:neocomplete#enable_fuzzy_completion = 1
let g:neocomplete#max_list = 10
