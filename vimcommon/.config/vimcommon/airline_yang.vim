let s:palette = {}
let g:airline#themes#yang#palette = {}

let s:palette.white = [254, '#f7f7f7']
let s:palette.gray15 = [253, '#dadada']
let s:palette.gray14 = [250, '#bcbcbc']
let s:palette.gray13 = [249, '#b2b2b2']
let s:palette.gray12 = [248, '#a8a8a8']
let s:palette.gray11 = [247, '#9e9e9e']
let s:palette.gray10 = [246, '#949494']
let s:palette.gray09 = [245, '#8a8a8a']
let s:palette.gray08 = [244, '#808080']
let s:palette.gray07 = [243, '#767676']
let s:palette.gray06 = [242, '#666666']
let s:palette.gray05 = [241, '#606060']
let s:palette.gray04 = [240, '#585858']
let s:palette.gray03 = [239, '#4e4e4e']
let s:palette.gray02 = [238, '#444444']
let s:palette.gray01 = [235, '#262626']
let s:palette.black = [233, '#121212']

" Colors
let s:palette.purple = [98, '#875fd7']
let s:palette.brown = [130, '#af5f00']
let s:palette.blue = [67, '#5f87af']
let s:palette.darkblue = [27, '#005fff']
let s:palette.green = [65, '#5f875f']
let s:palette.red = [88, '#870000']
let s:palette.magenta = [125, '#af005f']

" Normal mode
let s:palette.N1   = [ s:palette.gray01[1], s:palette.gray11[1], s:palette.gray01[0], s:palette.gray11[0] ]
let s:palette.N2   = [ s:palette.gray09[1], s:palette.gray02[1], s:palette.gray09[0], s:palette.gray02[0] ]
let s:palette.N3   = [ s:palette.gray13[1], s:palette.gray04[1], s:palette.gray13[0], s:palette.gray04[0] ]
let g:airline#themes#yang#palette.normal = airline#themes#generate_color_map(s:palette.N1, s:palette.N2, s:palette.N3)

let g:airline#themes#yang#palette.normal['airline_warning'] = [s:palette.gray14[1], s:palette.blue[1], s:palette.gray14[0], s:palette.blue[0]]
let g:airline#themes#yang#palette.normal['airline_error'] = [s:palette.gray14[1], s:palette.darkblue[1], s:palette.gray14[0], s:palette.darkblue[0]]

" Insert mode
let s:palette.I1   = [ s:palette.gray01[1], s:palette.gray13[1], s:palette.gray01[0], s:palette.gray13[0] ]
let s:palette.I2   = [ s:palette.gray08[1], s:palette.gray02[1], s:palette.gray08[0], s:palette.gray02[0] ]
let s:palette.I3   = [ s:palette.gray09[1], s:palette.gray01[1], s:palette.gray09[0], s:palette.gray01[0] ]
let g:airline#themes#yang#palette.insert = airline#themes#generate_color_map(s:palette.I1, s:palette.I2, s:palette.I3)

let g:airline#themes#yang#palette.insert['airline_warning'] = [s:palette.gray14[1], s:palette.blue[1], s:palette.gray14[0], s:palette.blue[0]]
let g:airline#themes#yang#palette.insert['airline_error'] = [s:palette.gray14[1], s:palette.darkblue[1], s:palette.gray14[0], s:palette.darkblue[0]]

" Replace mode
let s:palette.R1   = [ s:palette.gray01[1], s:palette.gray08[1], s:palette.gray01[0], s:palette.gray08[0] ]
let s:palette.R2   = [ s:palette.gray10[1], s:palette.gray02[1], s:palette.gray10[0], s:palette.gray02[0] ]
let s:palette.R3   = [ s:palette.gray09[1], s:palette.gray01[1], s:palette.gray09[0], s:palette.gray01[0] ]
let g:airline#themes#yang#palette.replace = airline#themes#generate_color_map(s:palette.R1, s:palette.R2, s:palette.R3)

let g:airline#themes#yang#palette.replace['airline_warning'] = [s:palette.gray14[1], s:palette.blue[1], s:palette.gray14[0], s:palette.blue[0]]
let g:airline#themes#yang#palette.replace['airline_error'] = [s:palette.gray14[1], s:palette.darkblue[1], s:palette.gray14[0], s:palette.darkblue[0]]

" Visual mode
let s:palette.V1   = [ s:palette.gray01[1], s:palette.gray14[1], s:palette.gray01[0], s:palette.gray14[0] ]
let s:palette.V2   = [ s:palette.gray10[1], s:palette.gray02[1], s:palette.gray10[0], s:palette.gray02[0] ]
let s:palette.V3   = [ s:palette.gray09[1], s:palette.gray01[1], s:palette.gray09[0], s:palette.gray01[0] ]
let g:airline#themes#yang#palette.visual = airline#themes#generate_color_map(s:palette.V1, s:palette.V2, s:palette.V3)

let g:airline#themes#yang#palette.visual['airline_warning'] = [s:palette.gray14[1], s:palette.blue[1], s:palette.gray14[0], s:palette.blue[0]]
let g:airline#themes#yang#palette.visual['airline_error'] = [s:palette.gray14[1], s:palette.darkblue[1], s:palette.gray14[0], s:palette.darkblue[0]]

" Inactive
let s:palette.IA1   = [ s:palette.gray04[1], s:palette.gray09[1], s:palette.gray04[0], s:palette.gray10[0] ]
let s:palette.IA2   = [ s:palette.gray04[1], s:palette.gray09[1], s:palette.gray04[0], s:palette.gray10[0] ]
let s:palette.IA3   = [ s:palette.gray04[1], s:palette.gray09[1], s:palette.gray04[0], s:palette.gray10[0] ]
let g:airline#themes#yang#palette.inactive = airline#themes#generate_color_map(s:palette.IA1, s:palette.IA2, s:palette.IA3)

let g:airline#themes#yang#palette.inactive['airline_warning'] = [s:palette.gray14[1], s:palette.blue[1], s:palette.gray14[0], s:palette.blue[0]]
let g:airline#themes#yang#palette.inactive['airline_error'] = [s:palette.gray14[1], s:palette.darkblue[1], s:palette.gray14[0], s:palette.darkblue[0]]

" Here we define the color map for ctrlp.  We check for the g:loaded_ctrlp
" " variable so that related functionality is loaded iff the user is using
" " ctrlp. Note that this is optional, and if you do not define ctrlp colors
" " they will be chosen automatically from the existing palette.
if !get(g:, 'loaded_ctrlp', 0)
	finish
endif

let g:airline#themes#yang#palette.ctrlp = airline#extensions#ctrlp#generate_color_map(
			\ [ s:palette.gray15[1], s:palette.gray02[1], s:palette.gray10[0], s:palette.gray02[0], '' ],
			\ [ s:palette.gray15[1], s:palette.gray04[1], s:palette.gray10[0], s:palette.gray04[0], '' ],
			\ [ s:palette.gray15[1], s:palette.gray01[1], s:palette.gray11[0], s:palette.gray01[0], 'bold' ])

