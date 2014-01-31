"Make sure this all only happens once
let b:undo_ftplugin = "<NOP>"
if exists("b:java_eclim")
  finish
endif
let b:java_eclim = 1

"KeyBinds
nnoremap <silent> <F2> :JavaGetSet<cr>
nnoremap <silent> <F3> :JavaSearchContext<cr>
nnoremap <silent> <F4> :JavaImportOrganize<cr>
nnoremap <silent> <F5> :Java<cr>
nnoremap <silent> <F6> :JavaDocComment<cr>
nnoremap <silent> <F7> :JavaFormat<cr>

"Make neocomplcache use java
let g:EclimCompletionMethod = "omnifunc"
if !exists('g:neocomplcache_force_omni_patterns')
  let g:neocomplcache_force_omni_patterns = {}
endif
let g:neocomplcache_force_omni_patterns.java = '\k\.\k*'
