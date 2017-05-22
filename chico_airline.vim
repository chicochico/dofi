" vim airline theme based on 'dark.vim' and 'hybrid' by chico
" The array is in the format:
" [ guifg, guibg, ctermfg, ctermbg, opts ]. See "help attr-list" for valid
" values for the "opt" value.

let g:airline#themes#chico_airline#palette = {}

" g:terminal_color_0 to 15 defined by base16
let s:SbDefault = [g:terminal_color_12, g:terminal_color_0, 12, 10]
let s:TabActive = [g:terminal_color_15, g:terminal_color_0, 15, 10]
let s:SbError = [g:terminal_color_1, g:terminal_color_0, 01, 10]
let s:SbWarning = [g:terminal_color_3, g:terminal_color_0, 03, 10]
let s:SbInactive = [g:terminal_color_8, g:terminal_color_0, 08, 10]
let s:SbNormal = [g:terminal_color_6, g:terminal_color_0, 6, 10]
let s:SbInsert = [g:terminal_color_2, g:terminal_color_0, 02, 10]
let s:SbVisual = [g:terminal_color_5, g:terminal_color_0, 05, 10]

let s:N1 = s:SbNormal
let s:N2 = s:SbDefault
let s:N3 = s:SbDefault
let g:airline#themes#chico_airline#palette.normal = airline#themes#generate_color_map(s:N1, s:N2, s:N3)

let s:I1 = s:SbInsert
let s:I2 = s:SbDefault
let s:I3 = s:SbDefault
let g:airline#themes#chico_airline#palette.insert = airline#themes#generate_color_map(s:I1, s:I2, s:I3)

let s:R1 = s:SbDefault
let s:R2 = s:SbDefault
let s:R3 = s:SbDefault
let g:airline#themes#chico_airline#palette.replace = airline#themes#generate_color_map(s:R1, s:R2, s:R3)

let s:V1 = s:SbVisual
let s:V2 = s:SbDefault
let s:V3 = s:SbDefault
let g:airline#themes#chico_airline#palette.visual = airline#themes#generate_color_map(s:V1, s:V2, s:V3)

let s:IA1 = s:SbInactive
let s:IA2 = s:SbInactive
let s:IA3 = s:SbInactive
let g:airline#themes#chico_airline#palette.inactive = airline#themes#generate_color_map(s:IA1, s:IA2, s:IA3)

let g:airline#themes#chico_airline#palette.normal.airline_z = s:SbDefault
let g:airline#themes#chico_airline#palette.normal.airline_error = s:SbError
let g:airline#themes#chico_airline#palette.normal.airline_warning = s:SbWarning
let g:airline#themes#chico_airline#palette.normal.airline_tabtype = s:SbInactive
let g:airline#themes#chico_airline#palette.normal.airline_tab= s:SbInactive
let g:airline#themes#chico_airline#palette.normal.airline_tabhid = s:SbInactive
let g:airline#themes#chico_airline#palette.normal.airline_tabsel = s:TabActive
let g:airline#themes#chico_airline#palette.normal.airline_tabmod_unsel = s:SbInactive

let g:airline#themes#chico_airline#palette.insert.airline_error = s:SbError
let g:airline#themes#chico_airline#palette.insert.airline_warning = s:SbWarning

let g:airline#themes#chico_airline#palette.visual.airline_error = s:SbError
let g:airline#themes#chico_airline#palette.visual.airline_warning = s:SbWarning
