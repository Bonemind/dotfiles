"Make sure this all only happens once
let b:undo_ftplugin = "<NOP>"
if exists("b:php_eclim")
  finish
endif
let b:php_eclim = 1

"KeyBinds
nnoremap <silent> <F2> :PhpSearch<cr>
nnoremap <silent> <F3> :PhpSearchContext<cr>
nnoremap <silent> <F5> :Validate<cr>

let g:EclimPhpHtmlValidate = 1

"Make neocomplcache use php
let g:EclimCompletionMethod = "omnifunc"
if !exists('g:neocomplcache_force_omni_patterns')
  let g:neocomplcache_force_omni_patterns = {}
endif
let g:neocomplcache_force_omni_patterns.php = '\k\.\k*'
