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
Plug 'edkolev/tmuxline.vim'
Plug 'neomake/neomake'
Plug 'mattn/emmet-vim'
Plug 'easymotion/vim-easymotion'
Plug 'junegunn/fzf', { 'do': './install --all' }
Plug 'junegunn/fzf.vim'

"function! DoRemote(arg)
  "UpdateRemotePlugins
"endfunction
"Plug 'Shougo/deoplete.nvim', { 'do': function('DoRemote') }

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
  let g:python3_host_prog = '/usr/bin/python3'
endif

" NeoVim settings
syntax enable
set number
set showmatch
set visualbell
set hlsearch
set smartcase
set ignorecase
set incsearch
"set shiftwidth=4
set expandtab
set autoindent
set smartindent
set smarttab
" set softtabstop=4
set ruler
set lazyredraw
set cursorline
set noshowmode "hide default mode indicaator
set hidden "allows hidden modified buffers

" Remove trailing white spaces on :w (save)
autocmd BufWritePre * :%s/\s\+$//e

" Change cursor to pipe when in insert mode
let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1

" Map leader from / to ,
let mapleader = "\<Space>"

" Use <leader> s to clear the highlighting of :set hlsearch.
nnoremap <silent> <leader>s :nohlsearch<CR>

" Map J and K for scrolling
nnoremap J <C-e>
nnoremap K <C-y>

" Map save and quit
nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>Q :q!<CR>
nnoremap <leader>W :wq<CR>

nnoremap <leader>x :bd<CR>  " buffer delete

" Map buffer switching
nnoremap <leader>n :bn<CR>
nnoremap <leader>p :bp<CR>

" Color scheme
set termguicolors
colorscheme base16-tomorrow-night

" Airline settings
let g:airline_powerline_fonts = 0
let g:airline_left_sep = ''
let g:airline_right_sep = ''
" if setting airline theme manually
let g:airline#extensions#tmuxline#enabled = 0
" no arrows
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''
" bufferline show open buffers and their number
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1
"let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#fnamemod = ':t'

nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9


" Tmuxline settings
let g:tmuxline_powerline_separators = 0
let g:tmuxline_preset = {
        \ 'a': '#S',
        \ 'b': '',
        \ 'c': '',
        \ 'x': '',
        \ 'y': '%d-%b-%y %H:%M',
        \ 'z': '',
        \ 'win': '#I›#W',
        \ 'cwin': '#I›#W',
        \}

let g:tmuxline_theme = {
    \   'a'    : [ 243, 0 ],
    \   'b'    : [ 243, 0 ],
    \   'c'    : [ 243, 0 ],
    \   'x'    : [ 243, 0 ],
    \   'y'    : [ 243, 0 ],
    \   'z'    : [ 243, 0 ],
    \   'win'  : [ 243, 0 ],
    \   'cwin' : [ 253, 0 ],
    \   'bg'   : [ 243, 0 ],
    \ }


" Nerdtree settings
nnoremap <leader>a :NERDTreeToggle<CR>
let NERDTreeShowHidden=1
" start with nerdtree open
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" close all if nerdtree is last window open
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif


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


" EasyMotion
let g:EasyMotion_do_mapping = 0 " Disable default mappings
" Jump to anywhere you want with minimal keystrokes, with just one key binding.
" `s{char}{label}`
"nmap f <Plug>(easymotion-overwin-f)
vmap f <Plug>(easymotion-bd-f)
nmap f <Plug>(easymotion-overwin-f2)

" Turn on case insensitive feature
let g:EasyMotion_smartcase = 1

" JK motions: Line motions
let g:EasyMotion_startofline = 1 " keep cursor column when JK motion
" Normal mode
nmap <leader>j <Plug>(easymotion-j)
nmap <leader>k <Plug>(easymotion-k)


" FZF
let g:fzf_buffers_jump = 1
nnoremap <leader>f :FZF<CR>
nnoremap <leader>d :Buffers<CR>

