" Plugins
call plug#begin('~/.vim/plugged')
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdtree'
Plug 'airblade/vim-gitgutter'
Plug 'chriskempson/base16-vim'
Plug 'altercation/vim-colors-solarized'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-obsession'
Plug 'tpope/vim-sleuth'
Plug 'Shougo/deoplete.nvim'
Plug 'jiangmiao/auto-pairs'
Plug 'majutsushi/tagbar'
Plug 'scrooloose/nerdcommenter'
Plug 'neomake/neomake'
Plug 'mattn/emmet-vim'
Plug 'easymotion/vim-easymotion'
Plug 'junegunn/fzf', { 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'aklt/plantuml-syntax'
" Add plugins to &runtimepath
call plug#end()

" Autosource this file when changed
autocmd! bufwritepost init.vim source %

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

" Remove trailing white spaces on :w (save)
autocmd BufWritePre * :%s/\s\+$//e

" Change cursor to pipe when in insert mode
"let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1

" remap leader key
let mapleader = "\<Space>"

" Use <leader> s to clear the highlighting of :set hlsearch.
nnoremap <silent><esc> :noh<CR>

" Save current buffer
nnoremap <leader>w :w<CR>

" Quit
nnoremap <leader>q :q<CR>

" Delete current buffer
nnoremap X :bd<CR>

" Map buffer switching
nnoremap <leader>n :bn<CR>
nnoremap <leader>p :bp<CR>

" scrolling
nnoremap J 4<C-e>
nnoremap K 4<C-y>
vnoremap J 4<C-e>
vnoremap K 4<C-y>


" NerdCommenter
map <leader>, <plug>NERDCommenterToggle

" Color scheme
set termguicolors
colorscheme base16-tomorrow-night

" Airline settings
let g:airline_powerline_fonts = 0
let g:airline_left_sep = ''
let g:airline_right_sep = ''
" if setting airline theme manually
let g:airline#extensions#tmuxline#enabled = 0
" no separators
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''
" bufferline show open buffers and their number
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline#extensions#tabline#fnamemod = ':t'
" quickly jump to buffer
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9

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
        \ 'texthl': 'DiffDelete',
        \ }
let g:neomake_warning_sign = {
        \ 'text': '•',
        \ 'texthl': 'DiffChange',
        \ }
" Run Neomake on write and on entering a buffer
autocmd! BufWritePost,BufEnter * Neomake

" Emmet-vim
let g:user_emmet_leader_key='<C-p>'
let g:user_emmet_mode='n'

" Deoplete
let g:deoplete#enable_at_startup = 1

" fzf
let g:fzf_buffers_jump = 1
nnoremap <leader>f :FZF<CR>
nnoremap <leader>d :Buffers<CR>

" EasyMotion
map m <Plug>(easymotion-prefix)
map f <Plug>(easymotion-s)
