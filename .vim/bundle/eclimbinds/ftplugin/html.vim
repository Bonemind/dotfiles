"Make sure this all only happens once
let b:undo_ftplugin = "<NOP>"
if exists("b:css_eclim")
  finish
endif
let b:css_eclim = 1

"KeyBinds
nnoremap <silent> <F5> :BrowserOpen<cr>
nnoremap <silent> <F6> :Validate<cr>

"Make neocomplcache use css
let g:EclimCompletionMethod = "omnifunc"
if !exists('g:neocomplcache_force_omni_patterns')
  let g:neocomplcache_force_omni_patterns = {}
endif
let g:neocomplcache_force_omni_patterns.css = '\k\.\k*'
