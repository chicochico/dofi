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
Plug 'airblade/vim-gitgutter'
Plug 'Shougo/deoplete.nvim'
Plug 'zchee/deoplete-jedi'
Plug 'davidhalter/jedi-vim'
Plug 'jiangmiao/auto-pairs'
Plug 'majutsushi/tagbar'
Plug 'neomake/neomake'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/goyo.vim'
Plug 'ludovicchabant/vim-gutentags'
Plug 'christoomey/vim-tmux-navigator'
Plug 'tmhedberg/SimpylFold'
Plug 'Konfekt/FastFold'
" Add plugins to &runtimepath
call plug#end()


" Python support
let home=$HOME
let g:python3_host_prog = home . '/.pyenv/versions/nvim/bin/python'


" NeoVim settings
syntax enable
set termguicolors  " Color scheme
set clipboard+=unnamedplus
set number
set lazyredraw
set relativenumber
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
"set cursorline
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
set foldmethod=syntax


" Remove trailing white spaces on :w (save)
autocmd BufWritePre * :%s/\s\+$//e


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

" Buffer switching
nnoremap <silent>L :silent :bn<CR>
nnoremap <silent>H :silent :bp<CR>

" Clear search highlights when ecaping in normal mode
nnoremap <silent><esc> :noh<CR>

" Writing buffer
nnoremap s :w <CR>

" Open marks
nnoremap <silent><leader>m :marks<CR>


" Scroll in higher steps
nnoremap <C-e> 4<C-e>
nnoremap <C-y> 4<C-y>
vnoremap <C-e> 4<C-e>
vnoremap <C-y> 4<C-y>


" Go to tag definition
nnoremap t <C-]>
nnoremap T <C-t>


" Auto source config file on save
autocmd! bufwritepost init.vim source %


" NerdCommenter
map <leader>, <plug>NERDCommenterToggle


" Source base16 file with theme setting
if filereadable(expand("~/.vimrc_background"))
  source ~/.vimrc_background
endif


" Change some hilight colors
hi EndOfBuffer guifg=bg
hi SignColumn guibg=bg
hi VertSplit guibg=bg
exec 'hi LineNr guibg=bg guifg=#' . g:base16_gui03
exec 'hi CursorLineNr gui=none guibg=bg guifg=#' . g:base16_gui03


" Gitgutter
set updatetime=100
let g:gitgutter_override_sign_column_highlight = 0
highlight GitGutterAdd guibg=bg
highlight GitGutterChange guibg=bg
highlight GitGutterDelete guibg=bg
highlight GitGutterChangeDelete guibg=bg


" Airline settings
let g:airline_theme='base16_chico'
let g:airline_powerline_fonts = 1
let g:airline_mode_map = {
      \ '__' : '-',
      \ 'c'  : 'C',
      \ 'i'  : 'I',
      \ 'ic' : 'I',
      \ 'ix' : 'I',
      \ 'n'  : 'N',
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
let g:airline#extensions#hunks#enabled = 0
let g:airline#extensions#whitespace#enabled = 0
" Vemove separators
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
" Tabline
let g:airline#extensions#tabline#enabled = 0
let g:airline#extensions#tabline#show_tab_type = 0
let g:airline#extensions#tabline#show_buffers = 1
let g:airline#extensions#tabline#buffer_min_count = 2
let g:airline#extensions#tabline#fnamemod = ':t'
"let g:airline#extensions#tabline#buffer_idx_format = {
        "\ '0': '',
        "\ '1': '',
        "\ '2': '',
        "\ '3': '',
        "\ '4': '',
        "\ '5': '',
        "\ '6': '',
        "\ '7': '',
        "\ '8': '',
        "\ '9': ''
        "\}
" Switch buffers maps
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
"let NERDTreeShowLineNumbers=1
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
let g:gutentags_project_root = ['mix.exs']


" Neomake
nnoremap <silent>M :silent :Neomake<CR>
let g:neomake_error_sign = {
        \ 'text': '•',
        \ 'texthl': 'WarningMsg',
        \ }
let g:neomake_warning_sign = {
        \ 'text': '•',
        \ 'texthl': 'Tag',
        \ }
call neomake#configure#automake({
  \ 'BufWritePost': {'delay': 0},
  \ }, 500)
"let g:neomake_elixir_enabled_makers = ['credo']


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

let g:fzf_colors =
    \ { 'fg':      ['fg', 'Normal'],
      \ 'bg':      ['bg', 'Normal'],
      \ 'hl':      ['fg', 'Comment'],
      \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
      \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
      \ 'hl+':     ['fg', 'Statement'],
      \ 'info':    ['fg', 'PreProc'],
      \ 'border':  ['fg', 'Ignore'],
      \ 'prompt':  ['fg', 'Conditional'],
      \ 'pointer': ['fg', 'Exception'],
      \ 'marker':  ['fg', 'Keyword'],
      \ 'spinner': ['fg', 'Label'],
      \ 'header':  ['fg', 'Comment'] }


" Vim Sleuth
let g:sleuth_automatic = 1


" Easymotion
"let g:EasyMotion_use_upper = 1
"let g:EasyMotion_keys = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ;'
"let g:EasyMotion_verbose = 0
"let g:EasyMotion_do_mapping = 0
"map f <Plug>(easymotion-f)
"map F <Plug>(easymotion-F)
"map L <Plug>(easymotion-bd-jk)


" SimpylFold
let g:SimpylFold_docstring_preview = 1
let g:SimpylFold_fold_docstring = 0
let g:SimpylFold_fold_import = 0
