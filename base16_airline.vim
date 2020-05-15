let g:airline#themes#base16_airline#palette = {}
let s:gui00 = "#" . g:base16_gui00
let s:gui01 = "#" . g:base16_gui01
let s:gui02 = "#" . g:base16_gui02
let s:gui03 = "#" . g:base16_gui03
let s:gui04 = "#" . g:base16_gui04
let s:gui05 = "#" . g:base16_gui05
let s:gui06 = "#" . g:base16_gui06
let s:gui07 = "#" . g:base16_gui07
let s:gui08 = "#" . g:base16_gui08
let s:gui09 = "#" . g:base16_gui09
let s:gui0A = "#" . g:base16_gui0A
let s:gui0B = "#" . g:base16_gui0B
let s:gui0C = "#" . g:base16_gui0C
let s:gui0D = "#" . g:base16_gui0D
let s:gui0E = "#" . g:base16_gui0E
let s:gui0F = "#" . g:base16_gui0F

let s:cterm00 = g:base16_cterm00
let s:cterm01 = g:base16_cterm01
let s:cterm02 = g:base16_cterm02
let s:cterm03 = g:base16_cterm03
let s:cterm04 = g:base16_cterm04
let s:cterm05 = g:base16_cterm05
let s:cterm06 = g:base16_cterm06
let s:cterm07 = g:base16_cterm07
let s:cterm08 = g:base16_cterm08
let s:cterm09 = g:base16_cterm09
let s:cterm0A = g:base16_cterm0A
let s:cterm0B = g:base16_cterm0B
let s:cterm0C = g:base16_cterm0C
let s:cterm0D = g:base16_cterm0D
let s:cterm0E = g:base16_cterm0E
let s:cterm0F = g:base16_cterm0F

" Common colors
let s:Default  = [s:gui04, s:gui01, s:cterm04, s:cterm01]
let s:Error    = [s:gui08, s:gui01, s:cterm08, s:cterm01]
let s:Warning  = [s:gui0A, s:gui01, s:cterm0A, s:cterm01]
let s:Standard = [s:gui07, s:gui01, s:cterm07, s:cterm01]
let s:Inactive = [s:gui00, s:gui01, s:cterm00, s:cterm01]

" Modes
let s:N1   = s:Standard
let s:N2   = s:Default
let s:N3   = s:Default
let s:N4   = s:Default
let s:N5   = s:Default
let s:N6   = s:Default
let g:airline#themes#base16_airline#palette.normal = airline#themes#generate_color_map(s:N1, s:N2, s:N3, s:N4, s:N5, s:N6)

let s:I1   = s:Standard
let s:I2   = s:Default
let s:I3   = s:Default
let s:I4   = s:Default
let s:I5   = s:Default
let s:I6   = s:Default
let g:airline#themes#base16_airline#palette.insert = airline#themes#generate_color_map(s:I1, s:I2, s:I3, s:I4, s:I5, s:I6)

let s:R1   = s:Standard
let s:R2   = s:Default
let s:R3   = s:Default
let s:R4   = s:Default
let s:R5   = s:Default
let s:R6   = s:Default
let g:airline#themes#base16_airline#palette.replace = airline#themes#generate_color_map(s:R1, s:R2, s:R3, s:R4, s:R5, s:R6)

let s:V1   = s:Standard
let s:V2   = s:Default
let s:V3   = s:Default
let s:V4   = s:Default
let s:V5   = s:Default
let s:V6   = s:Default
let g:airline#themes#base16_airline#palette.visual = airline#themes#generate_color_map(s:V1, s:V2, s:V3, s:V4, s:V5, s:V6)

let s:IA1   = s:Inactive
let s:IA2   = s:Inactive
let s:IA3   = s:Inactive
let g:airline#themes#base16_airline#palette.inactive = airline#themes#generate_color_map(s:IA1, s:IA2, s:IA3)

" Airline
let g:airline#themes#base16_airline#palette.normal.airline_error = s:Error
let g:airline#themes#base16_airline#palette.normal.airline_warning = s:Warning

let g:airline#themes#base16_airline#palette.visual.airline_error = s:Error
let g:airline#themes#base16_airline#palette.visual.airline_warning = s:Warning

let g:airline#themes#base16_airline#palette.insert.airline_error = s:Error
let g:airline#themes#base16_airline#palette.insert.airline_warning = s:Warning

let g:airline#themes#base16_airline#palette.replace.airline_error = s:Error
let g:airline#themes#base16_airline#palette.replace.airline_warning = s:Warning
