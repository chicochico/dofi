" vim airline theme based on 'dark.vim' and 'hybrid' by chico
" The array is in the format:
" [ guifg, guibg, ctermfg, ctermbg, opts ]. See "help attr-list" for valid
" values for the "opt" value.

let g:airline#themes#chico_airline#palette = {}

let s:Error = airline#themes#get_highlight('WarningMsg')
let s:Warning = airline#themes#get_highlight('PreProc')
let s:Comment = airline#themes#get_highlight('Comment')

let s:N1   = airline#themes#get_highlight('Directory')
let s:N2   = airline#themes#get_highlight('TermCursorNC')
let s:N3   = s:N2
let g:airline#themes#chico_airline#palette.normal = airline#themes#generate_color_map(s:N1, s:N2, s:N3)

let g:airline#themes#chico_airline#palette.normal.airline_z = s:N2
let g:airline#themes#chico_airline#palette.normal.airline_error = s:Error
let g:airline#themes#chico_airline#palette.normal.airline_warning = s:Warning
let g:airline#themes#chico_airline#palette.normal.airline_tabtype = s:Comment
let g:airline#themes#chico_airline#palette.normal.airline_tab= s:Comment
let g:airline#themes#chico_airline#palette.normal.airline_tabhid = s:Comment
"let g:airline#themes#chico_airline#palette.normal.airline_tabsel = s:N2
"let g:airline#themes#chico_airline#palette.normal.airline_tabmod = s:Error
let g:airline#themes#chico_airline#palette.normal.airline_tabmod_unsel = s:Comment

"let g:airline#themes#chico_airline#palette.normal_modified = {
      "\ 'airline_c': s:N2 ,
      "\ }


let s:I1 = airline#themes#get_highlight('String')
let s:I2 = s:N2
let s:I3 = s:N2
let g:airline#themes#chico_airline#palette.insert = airline#themes#generate_color_map(s:I1, s:I2, s:I3)

let g:airline#themes#chico_airline#palette.insert.airline_z = s:N2
let g:airline#themes#chico_airline#palette.insert.airline_error = s:Error
let g:airline#themes#chico_airline#palette.insert.airline_warning = s:Warning

"let g:airline#themes#chico_airline#palette.insert_modified = {
      "\ 'airline_c': s:N2 ,
      "\ }
let g:airline#themes#chico_airline#palette.insert_paste = {
      \ 'airline_a': [ s:I1[0]   , '#d78700' , s:I1[2] , 172     , ''     ] ,
      \ }


let g:airline#themes#chico_airline#palette.replace = copy(g:airline#themes#chico_airline#palette.insert)
let g:airline#themes#chico_airline#palette.replace.airline_a = [ s:I2[0]   , '#af0000' , s:I2[2] , 124     , ''     ]
"let g:airline#themes#chico_airline#palette.replace_modified = g:airline#themes#chico_airline#palette.insert_modified


let s:V1 = airline#themes#get_highlight('Conditional')
let s:V2 = s:N2
let s:V3 = s:N2
let g:airline#themes#chico_airline#palette.visual = airline#themes#generate_color_map(s:V1, s:V2, s:V3)

let g:airline#themes#chico_airline#palette.visual.airline_z = s:N2
let g:airline#themes#chico_airline#palette.visual.airline_error = s:Error
let g:airline#themes#chico_airline#palette.visual.airline_warning = s:Warning

"let g:airline#themes#chico_airline#palette.visual_modified = {
      "\ 'airline_c': s:N2 ,
      "\ }


let s:IA1 = s:N2
let s:IA2 = s:N2
let s:IA3 = s:N2
let g:airline#themes#chico_airline#palette.inactive = airline#themes#generate_color_map(s:IA1, s:IA2, s:IA3)
let g:airline#themes#chico_airline#palette.inactive_modified = {
      \ 'airline_c': s:N2 ,
      \ }


let g:airline#themes#chico_airline#palette.accents = {
      \ 'red': [ '#ffffff' , '' , 160 , ''  ]
      \ }

