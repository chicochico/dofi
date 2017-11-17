" Plugins
call plug#begin('~/.vim/plugged')
" Themes and addons
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'chriskempson/base16-vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-obsession'
Plug 'tpope/vim-sleuth'
Plug 'Shougo/deoplete.nvim'
Plug 'jiangmiao/auto-pairs'
Plug 'majutsushi/tagbar'
Plug 'neomake/neomake'
Plug 'junegunn/fzf', { 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'ludovicchabant/vim-gutentags'
Plug 'christoomey/vim-tmux-navigator'
Plug 'rhysd/devdocs.vim'
" Language specific
Plug 'aklt/plantuml-syntax'
Plug 'keith/swift.vim'
Plug 'mitsuse/autocomplete-swift'
Plug 'bfredl/nvim-ipy'
Plug 'elixir-lang/vim-elixir'
Plug 'slashmili/alchemist.vim'
" Add plugins to &runtimepath
call plug#end()

let os= substitute(system('uname'), "\n", "", "")
" osx specific settings
if os == "Darwin"
  " Python3 support
  let g:python3_host_prog = '/usr/local/bin/python3'
" linux specific settings
elseif os == "Linux"
  " Python3 support
  let g:python3_host_prog = '/home/chico/.pyenv/shims/python'
endif

" NeoVim settings
syntax enable
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
set cursorline
set noshowmode " hide default mode indicaator
set hidden " allows hidden modified buffers
set autoread " reload file if changed outside vim
set fillchars=vert:\│ " vertical split character
set nosol
set path+=**

" Remove trailing white spaces on :w (save)
autocmd BufWritePre * :%s/\s\+$//e

" Change cursor to pipe when in insert mode
let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1

" remap leader key
let mapleader = "\<Space>"

" remap command mode
"nnoremap ; :
"nnoremap : ;

" clear search hi when ecaping in normal mode
nnoremap <silent><esc> :noh<CR>

" Quit
nnoremap Q :q<CR>

" Save buffer
nnoremap S :w<CR>

" Delete current buffer
nnoremap X :bd<CR>

" Map buffer switching
nnoremap <silent>L :bn<CR>
nnoremap <silent>H :bp<CR>

" scrolling
nnoremap J 5<C-e>
nnoremap K 5<C-y>
vnoremap J 5<C-e>
vnoremap K 5<C-y>
nnoremap <C-e> 5<C-e>
nnoremap <C-y> 5<C-y>
vnoremap <C-e> 5<C-e>
vnoremap <C-y> 5<C-y>

" go to tag definition
nnoremap t <C-]>
nnoremap T <C-t>

" escape terminal mode
autocmd BufEnter term://* startinsert

" NerdCommenter
map <leader>, <plug>NERDCommenterToggle

" Color scheme
set termguicolors

" Source file with theme setting
if filereadable(expand("~/.vimrc_background"))
  source ~/.vimrc_background
endif

" Change some hilight colors
hi EndOfBuffer guifg=bg ctermbg=bg
hi SignColumn guibg=bg ctermbg=bg
hi VertSplit guibg=bg
exec 'hi LineNr guibg=bg ctermbg=bg guifg=' . g:terminal_color_11
exec 'hi CursorLine guibg=' . g:terminal_color_10
exec 'hi CursorLineNr gui=none guibg=' . g:terminal_color_10 . ' guifg=' . g:terminal_color_11


" Airline settings
let g:airline_theme='chico_airline'
let g:airline_powerline_fonts = 1
let g:airline_mode_map = {
      \ '__' : '-',
      \ 'n'  : 'N',
      \ 'i'  : 'I',
      \ 'R'  : 'R',
      \ 'c'  : 'C',
      \ 'v'  : 'V',
      \ 'V'  : 'V',
      \ '' : 'V',
      \ 's'  : 'S',
      \ 'S'  : 'S',
      \ '' : 'S',
      \ }
let g:airline#extensions#default#layout = [
      \ [ 'a', 'b', 'c' ],
      \ ['error', 'warning', 'x', 'y', 'z']
      \ ]
let g:airline_section_y = '%{ObsessionStatus()}'
let g:airline_section_z = '%3p%% %l,%c'
" disable some airline extensions
let g:airline#extensions#tmuxline#enabled = 0
let g:airline#extensions#hunks#enabled = 0
let g:airline#extensions#whitespace#enabled = 0
" remove separators
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
" tabline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_tab_type = 0
let g:airline#extensions#tabline#show_buffers = 1
let g:airline#extensions#tabline#buffer_min_count = 2
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#buffer_idx_format = {
        \ '0': '',
        \ '1': '',
        \ '2': '',
        \ '3': '',
        \ '4': '',
        \ '5': '',
        \ '6': '',
        \ '7': '',
        \ '8': '',
        \ '9': ''
        \}
" switch buffers maps
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
let NERDTreeShowLineNumbers=1


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
  \ 'BufWinEnter': {},
  \ }, 500)

let g:neomake_elixir_enabled_makers = ['credo']


" Deoplete
let g:deoplete#enable_at_startup = 1


" fzf
let $FZF_DEFAULT_COMMAND = 'ag -g ""'
let g:fzf_buffers_jump = 1
nnoremap <leader>f :FZF<CR>
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>t :Tags<CR>


" Vim Sleuth
let g:sleuth_automatic = 1


" Alchemist
let g:alchemist_mappings_disable = 1
