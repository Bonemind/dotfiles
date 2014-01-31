"Make sure this all only happens once
let b:undo_ftplugin = "<NOP>"
if exists("b:python_eclim")
  finish
endif
let b:python_eclim = 1

"KeyBinds
nnoremap <silent> <F2> :PythonSearchContext<cr>
nnoremap <silent> <F3> :PythonFindDefinition<cr>
nnoremap <silent> <F5> :Validate<cr>
nnoremap <silent> <F6> :PyLint<cr>

"Make neocomplcache use python
let g:EclimCompletionMethod = "omnifunc"
if !exists('g:neocomplcache_force_omni_patterns')
  let g:neocomplcache_force_omni_patterns = {}
endif
let g:neocomplcache_force_omni_patterns.python = '\k\.\k*'
