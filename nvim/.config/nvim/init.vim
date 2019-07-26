filetype off

" Set dein variables
let deinpath=expand('~/.config/nvim/nvimplugins/dein.vim/repos/github.com/Shougo/dein.vim')
let deinpluginpath=expand('~/.config/nvim/nvimplugins/deinplugins')

" Add dein to runtimepath
execute 'set runtimepath^=' . deinpath

autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')

function AddSpecificPlugins()
endfunction

source ~/.config/vimcommon/common.vim

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
	if (index(['vim','help'], &filetype) >= 0)
		execute 'h '.expand('<cword>')
	else
		call CocAction('doHover')
	endif
endfunction

command! ProjectFiles execute 'Files' FindRootDirectory()
nnoremap <leader>f :ProjectFiles<cr>
