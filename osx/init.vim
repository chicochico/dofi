" Plugins
call plug#begin('~/.vim/plugged')

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdtree'
Plug 'airblade/vim-gitgutter'
Plug 'flazz/vim-colorschemes'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'tpope/vim-sleuth'
Plug 'jiangmiao/auto-pairs'
Plug 'majutsushi/tagbar'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/syntastic'
Plug 'edkolev/tmuxline.vim'
Plug 'mattn/emmet-vim'
Plug 'easymotion/vim-easymotion'
Plug 'junegunn/fzf', { 'do': './install --all' }
Plug 'junegunn/fzf.vim'

function! DoRemote(arg)
  UpdateRemotePlugins
endfunction
Plug 'Shougo/deoplete.nvim', { 'do': function('DoRemote') }

" Add plugins to &runtimepath
call plug#end()

" Autosource this file when changed
autocmd! bufwritepost init.vim source %

" Python3 support
let g:python3_host_prog = '/usr/local/Cellar/python3/3.5.0/bin/python3'

" NeoVim settings
syntax enable
set number
set showmatch
set visualbell
set hlsearch
set smartcase
set ignorecase
set incsearch
" set autoindent
set shiftwidth=4
" set smartindent
" set smarttab
set expandtab
" set softtabstop=4
set ruler
set clipboard=unnamed
set mouse=a
set lazyredraw
set cursorline
set ttyfast
"set list lcs=space:·,tab:▸·
set noshowmode "hide default mode indicaator

" Remove trailing white spaces on :w (save)
autocmd BufWritePre * :%s/\s\+$//e

" Use ctrl-[hjkl] to navigate splits
nnoremap <BS> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Map : to ;
nnoremap ; :

" Map leader from / to ,
let mapleader = "\<Space>"

" Use <C-L> to clear the highlighting of :set hlsearch.
if maparg('<C-L>', 'n') ==# ''
  nnoremap <silent> <C-L> :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>
endif

" Map <C-q> to quit :q
nnoremap <C-q> :q<CR>

" Map J and K for scrolling
nnoremap J <C-e>
nnoremap K <C-y>

" Map save and quit
nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>

" Color scheme
" colorscheme Tomorrow-Night-Eighties
set background=dark
colorscheme solarized

" Allow color schemes to do bright colors without forcing bold.
if &t_Co == 8 && $TERM !~# '^linux\|^Eterm'
  set t_Co=16
endif


" Airline setting
let g:airline_powerline_fonts = 1
let g:airline_theme='solarized'
let g:airline_left_sep = ''
let g:airline_right_sep = ''
" let g:airline#extensions#tabline#enabled = 1
" no arrows
let g:airline_powerline_fonts = 0
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''


" Tmuxline settings
let g:tmuxline_powerline_separators = 0
let g:tmuxline_preset = {
        \ 'a': '#S',
        \ 'win': '#I:#W',
        \ 'cwin': '#I:#W',
        \ 'x': '%H:%M %d-%b-%y',
        \ 'z': '#h',
        \ 'options': {
        \'status-justify': 'left'}
        \}


" Nerdtree settings
map <C-i> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1
" start with nerdtree open
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" close all if nerdtree is last window open
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif


" Tagbar
nmap <C-o> :TagbarToggle<CR>
let g:tagbar_left = 1


" Nerdtree-tabs
" let g:nerdtree_tabs_open_on_console_startup=1


" Emmet-vim
let g:user_emmet_leader_key='<C-p>'
let g:user_emmet_mode='n'


" ctrlp
" let g:ctrlp_map = '<c-p>'


" Deoplete
let g:deoplete#enable_at_startup = 1


" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ['eslint']


" EasyMotion
let g:EasyMotion_do_mapping = 0 " Disable default mappings

" Jump to anywhere you want with minimal keystrokes, with just one key binding.
" `s{char}{label}`
nmap f <Plug>(easymotion-overwin-f)
vmap f <Plug>(easymotion-overwin-f)
" or
" `s{char}{char}{label}`
" Need one more keystroke, but on average, it may be more comfortable.
" nmap f <Plug>(easymotion-overwin-f2)

" Turn on case insensitive feature
let g:EasyMotion_smartcase = 1

" JK motions: Line motions
let g:EasyMotion_startofline = 0 " keep cursor column when JK motion
" Normal mode
nmap <Leader>h <Plug>(easymotion-linebackward)
nmap <Leader>j <Plug>(easymotion-j)
nmap <Leader>k <Plug>(easymotion-k)
nmap <Leader>l <Plug>(easymotion-lineforward)
" Visual mode
vmap <Leader>h <Plug>(easymotion-linebackward)
vmap <Leader>j <Plug>(easymotion-j)
vmap <Leader>k <Plug>(easymotion-k)
vmap <Leader>l <Plug>(easymotion-lineforward)


" FZF
nnoremap <leader>f :FZF<CR>
nnoremap <leader>d :Buffers<CR>
