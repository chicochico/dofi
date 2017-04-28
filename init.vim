" Plugins
call plug#begin('~/.vim/plugged')
" Themes and addons
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdtree'
Plug 'airblade/vim-gitgutter'
Plug 'chriskempson/base16-vim'
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
Plug 'nathanaelkane/vim-indent-guides'
Plug 'junegunn/fzf', { 'do': './install --all' }
Plug 'junegunn/fzf.vim'
" Language specific
Plug 'aklt/plantuml-syntax'
Plug 'keith/swift.vim'
Plug 'mitsuse/autocomplete-swift'
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
"set number
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
nnoremap <silent><c-l> :bn<CR>
nnoremap <silent><c-h> :bp<CR>

" scrolling
nnoremap J 5<C-e>
nnoremap K 5<C-y>
vnoremap J 5<C-e>
vnoremap K 5<C-y>
nnoremap <c-j> 5<C-e>
nnoremap <c-k> 5<C-y>
vnoremap <c-j> 5<C-e>
vnoremap <c-k> 5<C-y>

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

" GitGutter
let g:gitgutter_override_sign_column_highlight = 0
let g:gitgutter_sign_column_always = 1
hi GitGutterAdd guibg=bg ctermbg=bg
hi GitGutterChange guibg=bg ctermbg=bg
hi GitGutterDelete guibg=bg ctermbg=bg
hi GitGutterChangeDelete guibg=bg ctermbg=bg

" Airline settings
let g:airline_theme='chico_airline'
let g:airline_powerline_fonts = 0
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
" format the z section
let g:airline_section_z = '%3p%% %l:%c'
let g:airline#extensions#tmuxline#enabled = 0
" remove separators
let g:airline_left_sep = ''
let g:airline_right_sep = ''
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
        \ 'texthl': 'WarningMsg',
        \ }
let g:neomake_warning_sign = {
        \ 'text': '•',
        \ 'texthl': 'Tag',
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
let g:EasyMotion_do_mapping = 0
map f <Plug>(easymotion-s)
map <leader>j <Plug>(easymotion-j)
map <leader>k <Plug>(easymotion-k)

" Vim indent guides
let g:indent_guides_guide_size = 1
let g:indent_guides_start_level = 2
"let g:indent_guides_enable_on_vim_startup = 1
