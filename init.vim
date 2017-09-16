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
nnoremap <silent><c-l> :bn<CR>
nnoremap <silent><c-h> :bp<CR>
nnoremap <silent>L :bn<CR>
nnoremap <silent>H :bp<CR>
" scrolling
nnoremap J 4<C-e>
nnoremap K 4<C-y>
vnoremap J 4<C-e>
vnoremap K 4<C-y>
nnoremap <c-j> 4<C-e>
nnoremap <c-k> 4<C-y>
vnoremap <c-j> 4<C-e>
vnoremap <c-k> 4<C-y>

" NerdCommenter
map <leader>, <plug>NERDCommenterToggle

" Color scheme
set termguicolors

" Source file with theme setting
if filereadable(expand("~/.vimrc_background"))
  source ~/.vimrc_background
endif

hi EndOfBuffer guifg=bg ctermbg=bg
hi SignColumn guibg=bg ctermbg=bg
hi VertSplit guibg=bg guifg=#383838
hi LineNr guibg=bg ctermbg=bg

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

" Nerdtree settings
nnoremap <leader>a :NERDTreeToggle<CR>
let NERDTreeShowHidden=1

" Tagbar
nnoremap <leader>; :TagbarToggle<CR>
let g:tagbar_sort = 0
let g:tagbar_autofocus = 1
let g:tagbar_compact = 1
"let g:tagbar_left = 1

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
  \ 'TextChanged': {},
  \ 'InsertLeave': {},
  \ 'BufWritePost': {'delay': 0},
  \ 'BufWinEnter': {},
  \ }, 500)

let g:neomake_elixir_enabled_makers = ['credo']

" Deoplete
let g:deoplete#enable_at_startup = 1

" fzf
let g:fzf_buffers_jump = 1
nnoremap <leader>f :FZF<CR>
nnoremap <leader>d :Buffers<CR>

" Vim Sleuth
let g:sleuth_automatic = 1

" Alchemist
let g:alchemist_mappings_disable = 1
