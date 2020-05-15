" Plugins
call plug#begin('~/.vim/plugged')
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'chriskempson/base16-vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-obsession'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-dadbod'
Plug 'airblade/vim-gitgutter'
Plug 'Shougo/deoplete.nvim'
Plug 'zchee/deoplete-jedi'
Plug 'davidhalter/jedi-vim'
Plug 'jiangmiao/auto-pairs'
Plug 'majutsushi/tagbar'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/gv.vim'
Plug 'ludovicchabant/vim-gutentags'
Plug 'christoomey/vim-tmux-navigator'
Plug 'gioele/vim-autoswap'
Plug 'dense-analysis/ale'
" Clojure specific
Plug 'guns/vim-clojure-static'
Plug 'tpope/vim-fireplace'
" Add plugins to &runtimepath
call plug#end()


" NeoVim settings
syntax enable
set termguicolors  " Color scheme
set clipboard+=unnamedplus
set number
set relativenumber
set lazyredraw
set showmatch
set ignorecase
set smartcase
set incsearch
set shiftwidth=4
set expandtab
set autoindent
set smartindent
set smarttab
set ruler
set cursorline
set noshowmode  " Hide default mode indicaator
set hidden  " Allows hidden modified buffers
set autoread  " Reload file if changed outside vim
set fillchars=vert:\│  " Vertical split character
set nosol
set path+=**
set completeopt-=preview
set mouse=a
set signcolumn=yes  " Always show sign column
"set guicursor=
"set foldmethod=syntax
filetype plugin indent on


" Python support
let home=$HOME
let g:python3_host_prog = home . '/.pyenv/versions/nvim/bin/python'


" Remap leader key
let mapleader = "\<Space>"


" Buffers, panes and widows keymaps
"
" Zoom
nnoremap <leader>o <C-w>o

" Quit
nnoremap Q <C-w>q

" Delete current buffer
nnoremap <silent>X :bd<CR>

" Tab switching
nnoremap L gt<CR>
nnoremap H gT<CR>

" Clear search highlights when ecaping in normal mode
nnoremap <silent><esc> :noh<CR>

" Writing buffer
nnoremap s :w <CR>

" Open marks
nnoremap <silent><leader>m :marks<CR>


" Scroll in bigger steps
nnoremap <C-e> 4<C-e>
nnoremap <C-y> 4<C-y>
vnoremap <C-e> 4<C-e>
vnoremap <C-y> 4<C-y>


" Go to tag definition
nnoremap t <C-]>
nnoremap T <C-t>


" Auto source config file on save
autocmd! bufwritepost init.vim source % | AirlineRefresh


" NerdCommenter
map <leader>, <plug>NERDCommenterToggle


" Gitgutter
set updatetime=100
let g:gitgutter_override_sign_column_highlight = 0


" Airline settings
let g:airline_theme='base16_airline'
let g:airline_powerline_fonts = 1
let g:airline_mode_map = {
     \ '__' : '-',
     \ 'c'  : 'C',
     \ 'i'  : 'I',
     \ 'ic' : 'I',
     \ 'ix' : 'I',
     \ 'n'  : ' ',
     \ 'ni' : 'N',
     \ 'no' : 'N',
     \ 'R'  : 'R',
     \ 'Rv' : 'R',
     \ 's'  : 'S',
     \ 'S'  : 'S',
     \ '' : 'S',
     \ 't'  : 'T',
     \ 'v'  : 'V',
     \ 'V'  : 'V',
     \ '' : 'V',
\ }
let g:airline#extensions#default#layout = [
      \ [ 'a', 'b', 'c' ],
      \ ['error', 'warning', 'x', 'y', 'z']
      \ ]
let g:airline_section_y = '%{ObsessionStatus()}'
let g:airline_section_z = '%l:%c %3p%%'
" Disable some airline extensions
let g:airline#extensions#tmuxline#enabled = 0
let g:airline#extensions#hunks#enabled = 1
let g:airline#extensions#whitespace#enabled = 0
" Vemove separators
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
" Tabline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_splits = 0
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#show_tab_type = 0
let g:airline#extensions#tabline#show_tabs = 1
let g:airline#extensions#tabline#show_tab_count = 0
let g:airline#extensions#tabline#tab_nr_type = 1
let g:airline#extensions#tabline#show_tab_nr = 0
 "let g:airline#extensions#tabline#fnamemod = ':t'
"Formatters
"default
"jsformatter
"short_path
"tabnr
"unique_tail
"unique_tail_improved
let g:airline#extensions#tabline#tabnr_formatter = 'tabnr'
let g:airline#extensions#tabline#tab_min_count = 0
let g:airline#extensions#tabline#show_close_button = 0
" Switch tabs maps
let g:airline#extensions#tabline#buffer_idx_mode = 1
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9
nmap <leader>- <Plug>AirlineSelectPrevTab
nmap <leader>+ <Plug>AirlineSelectNextTab


" Nerdtree settings
nnoremap <silent><leader>a :NERDTreeToggle<CR>
let NERDTreeShowHidden=1
let NERDTreeMinimalUI=1
let NERDTreeShowLineNumbers=0
let g:NERDTreeMapJumpPrevSibling=""
let g:NERDTreeMapJumpNextSibling=""


" Tagbar
nnoremap <silent><leader>; :TagbarToggle<CR>
let g:tagbar_sort = 0
let g:tagbar_autofocus = 1
let g:tagbar_compact = 1
let g:tagbar_type_elixir = {
    \ 'ctagstype' : 'elixir',
    \ 'kinds' : [
        \ 'f:functions',
        \ 'functions:functions',
        \ 'c:callbacks',
        \ 'd:delegates',
        \ 'e:exceptions',
        \ 'i:implementations',
        \ 'a:macros',
        \ 'o:operators',
        \ 'm:modules',
        \ 'p:protocols',
        \ 'r:records',
        \ 't:tests'
    \ ]
\ }


" GutenTags
let g:gutentags_cache_dir = '~/dev/.tags/'
"let g:gutentags_project_root = ['mix.exs']


" Deoplete
let g:deoplete#enable_at_startup = 1
let g:deoplete#sources#jedi#show_docstring = 1


" Jedi vim
let g:jedi#auto_vim_configuration = 0
let g:jedi#completions_enabled = 0
let g:jedi#documentation_command = ""


" FZF
"let $FZF_DEFAULT_COMMAND = 'ag -g ""'
let g:fzf_buffers_jump = 1
nnoremap <leader>f :FZF<CR>
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>t :Tags<CR>
nnoremap <leader>/ :Ag<CR>


" Vim Sleuth
let g:sleuth_automatic = 1


" Dadbod
nnoremap <leader>r :DB<CR>
vnoremap <leader>r :'<,'>DB<CR>


" ALE
let g:ale_linters = {
    \ 'python': ['flake8'],
\ }

let g:ale_fixers = {
    \ '*': ['remove_trailing_lines', 'trim_whitespace'],
    \'python': ['isort', 'black'],
\ }

let g:ale_fix_on_save = 1
let g:ale_sign_error = '✖'
let g:ale_sign_warning = '▲'

" Python
let g:ale_python_flake8_options = '--ignore=E501,E303'


" Colors
" Source base16 file with theme setting
if filereadable(expand("~/.vimrc_background"))
  source ~/.vimrc_background
endif

function! s:base16_customize() abort
  "g:Base16hi(group, guifg, guibg, ctermfg, ctermbg, ...)
  call Base16hi("EndOfBuffer", g:base16_gui00, g:base16_gui00, g:base16_cterm00, g:base16_cterm00)
  call Base16hi("SignColumn", g:base16_gui03, g:base16_gui00, g:base16_cterm03, g:base16_cterm00)
  call Base16hi("VertSplit", g:base16_gui01, g:base16_gui01, g:base16_cterm01, g:base16_cterm01)
  call Base16hi("LineNr", g:base16_gui03, g:base16_gui00, g:base16_cterm03, g:base16_cterm00)
  call Base16hi("CursorLineNr", g:base16_gui03, g:base16_gui01, g:base16_cterm03, g:base16_cterm01)
  " Gitgutter
  call Base16hi("GitGutterAdd", "", g:base16_gui00, "", g:base16_cterm00)
  call Base16hi("GitGutterChange", "", g:base16_gui00, "", g:base16_cterm00)
  call Base16hi("GitGutterDelete", "", g:base16_gui00, "", g:base16_cterm00)
  call Base16hi("GitGutterChangeDelete", "", g:base16_gui00, "", g:base16_cterm00)
  " ALE
  call Base16hi("ALEErrorSign", g:base16_gui08, g:base16_gui00, g:base16_cterm08, g:base16_cterm00)
  call Base16hi("ALEWarningSign", g:base16_gui0A, g:base16_gui00, g:base16_cterm0A, g:base16_cterm00)
endfunction
augroup on_change_colorschema
  autocmd!
  autocmd ColorScheme * call s:base16_customize()
augroup END

call s:base16_customize()
