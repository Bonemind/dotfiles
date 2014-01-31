"Make sure this all only happens once
let b:undo_ftplugin = "<NOP>"
if exists("b:html_eclim")
  finish
endif
let b:html_eclim = 1

"KeyBinds
nnoremap <silent> <F5> :Validate<cr>

"Make neocomplcache use html
let g:EclimCompletionMethod = "omnifunc"
if !exists('g:neocomplcache_force_omni_patterns')
  let g:neocomplcache_force_omni_patterns = {}
endif
let g:neocomplcache_force_omni_patterns.html = '\k\.\k*'
