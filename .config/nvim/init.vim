" Plugins
" ------
call plug#begin('~/.vim/plugged')
Plug 'preservim/nerdtree'
Plug 'chriskempson/base16-vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-obsession'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-dadbod'
Plug 'tpope/vim-commentary'
Plug 'kristijanhusak/vim-dadbod-ui'
Plug 'airblade/vim-gitgutter'
Plug 'jiangmiao/auto-pairs'
Plug 'majutsushi/tagbar'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'ludovicchabant/vim-gutentags'
Plug 'christoomey/vim-tmux-navigator'
Plug 'dense-analysis/ale'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'alok/notational-fzf-vim'
Plug 'hashivim/vim-terraform'
Plug 'jamessan/vim-gnupg'
" Markdown
Plug 'junegunn/goyo.vim'
Plug 'preservim/vim-pencil'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
" Clojure
Plug 'guns/vim-clojure-static'
Plug 'tpope/vim-fireplace'
" Add plugins to &runtimepath
call plug#end()


" NeoVim settings
" ---------------
syntax enable
set termguicolors      " Color scheme
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
set cursorline
set noshowmode         " Hide default mode indicaator
set hidden             " Allows hidden modified buffers
set autoread           " Reload file if changed outside vim
set fillchars=vert:\│  " Vertical split character
set nosol
set path+=**
set mouse=a
set signcolumn=yes     " Always show sign column
set shm+=Ia            " Don't show intro message see h: shm
filetype plugin indent on

" Autoload config on save
autocmd! bufwritepost init.vim source %


" Status Line
" -----------
" see :h statusline
function! GitStatus()
    let l:branch = fugitive#Head()
    return strlen(l:branch)>0 ? l:branch.' • ' : ''
endfunction

set stl=
set stl+=%{'\ '}                                     " margin space at the left
set stl+=%{GitStatus()}                              " git branch
set stl+=%f                                          " file path
set stl+=%(\ [%M%R]%)                                " flags
set stl+=%=                                          " right align
set stl+=%{&filetype}                                " file type
set stl+=\ %{&fileencoding?&fileencoding:&encoding}  " file encoding
set stl+=\ %{&fileformat}                            " file format
set stl+=\ \ \ %l,%c%V\ %P                           " ruler
set stl+=%{'\ '}                                     " margin space at the right


" Abbreviation shortcuts
" ----------------------
" insert current date
inoreabbrev idate <C-R>=strftime("%Y-%m-%d %H:%M")<CR>
inoreabbrev idateh <C-R>=strftime("%a, %b %d, %Y at %H:%M")<CR>


" Python support
" --------------
let home=$HOME
let g:python3_host_prog = home . '/.pyenv/versions/nvim/bin/python'


" Keymaps
" -------
" leader
nmap <space> <leader>
" close window
nnoremap Q <C-w>q
" delete buffer
nnoremap X :bd<CR>
" move tabs
nnoremap L gt
nnoremap H gT
" clear hilight
nnoremap <silent><esc> :noh<CR>
" write buffer
nnoremap s :w<CR>
" scroll steps
nnoremap <C-e> 4<C-e>
nnoremap <C-y> 4<C-y>
vnoremap <C-e> 4<C-e>
vnoremap <C-y> 4<C-y>
" tags
nnoremap t <C-]>
nnoremap T <C-t>


" Cursorline
" ----------
"
augroup CursorLineOnlyInActiveWindow
  " shows cursorline only in active window
  autocmd!
  autocmd VimEnter,WinEnter,BufWinEnter * setlocal cursorline
  autocmd WinLeave * setlocal nocursorline
augroup END


" Plugin settings
" ---------------

" Gitgutter
" ---------
set updatetime=100
let g:gitgutter_override_sign_column_highlight = 0


" Nerdtree
" --------
nnoremap <silent><leader>a :NERDTreeToggle<CR>
let NERDTreeShowHidden=1
let NERDTreeMinimalUI=1
let NERDTreeShowLineNumbers=0
let g:NERDTreeMapJumpPrevSibling=""
let g:NERDTreeMapJumpNextSibling=""
let g:NERDTreeIgnore = ['^__pycache__$']


" Tagbar
" ------
nnoremap <silent><leader>; :TagbarToggle<CR>
let g:tagbar_left = 0
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
" ---------
let g:gutentags_cache_dir = '~/dev/.tags/'


" FZF
" ---
"let $FZF_DEFAULT_COMMAND = 'ag -g'
let g:fzf_buffers_jump = 1
nnoremap <leader>f :FZF<CR>
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>t :Tags<CR>
nnoremap <leader>/ :Ag<CR>


" Goyo
" ----
let g:goyo_width = 60         " (default: 80)
let g:goyo_height = 100       " (default: 85%)
let g:goyo_linenr = 0         " (default: 0)
nnoremap <leader>g :Goyo<CR>


" Pencil
" ------
augroup pencil
  autocmd!
  autocmd FileType md,markdown call pencil#init({'wrap': 'soft'})
  autocmd FileType text,txt    call pencil#init()
augroup END


" Vim Sleuth
" ----------
let g:sleuth_automatic = 1


" DBUI
" ----
nnoremap <leader>d :DBUIToggle<CR>
map <leader>r <Plug>(DBUI_ExecuteQuery)


" ALE
" ---
let g:ale_completion_enabled = 0
let g:ale_linters = {
    \ 'python': ['pyflakes'],
    \ 'clojure': ['clj-kondo']
\ }
let g:ale_fixers = {
    \ '*': ['remove_trailing_lines', 'trim_whitespace'],
    \'python': ['isort', 'black'],
    \'terraform': []
\ }
let g:ale_fix_on_save = 1
let g:ale_sign_error = '✖'
let g:ale_sign_warning = '▲'


" COC
" ---
" extensions
let g:coc_global_extensions = ['coc-json', 'coc-git']
" GoTo code navigation.
" --------------------
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)


" Notational Velocity
" ------------------
let g:nv_search_paths = ['~/notes/']
nnoremap <leader>n :NV<CR>


" Markdown preview
" ----------------
nmap <leader>p <Plug>MarkdownPreviewToggle

" Vim colors customizations
" -------------------------
" Source base16 file with theme setting
if filereadable(expand("~/.vimrc_background"))
  source ~/.vimrc_background
endif

function! s:base16_customize() abort
  call Base16hi("EndOfBuffer", g:base16_gui00, g:base16_gui00, g:base16_cterm00, g:base16_cterm00)
  call Base16hi("SignColumn", g:base16_gui03, g:base16_gui00, g:base16_cterm03, g:base16_cterm00)
  call Base16hi("VertSplit", g:base16_gui01, g:base16_gui01, g:base16_cterm01, g:base16_cterm01)
  call Base16hi("LineNr", g:base16_gui03, g:base16_gui00, g:base16_cterm03, g:base16_cterm00)
  call Base16hi("CursorLineNr", g:base16_gui03, g:base16_gui00, g:base16_cterm03, g:base16_cterm00)
  " Statusline and Tabline
  call Base16hi("StatusLine", g:base16_gui04, g:base16_gui01, g:base16_cterm04, g:base16_cterm01)
  call Base16hi("StatusLineNC", g:base16_gui02, g:base16_gui01, g:base16_cterm02, g:base16_cterm01)
  call Base16hi("TabLine", g:base16_gui02, g:base16_gui01, g:base16_cterm02, g:base16_cterm01)
  call Base16hi("TabLineSel", g:base16_gui04, g:base16_gui01, g:base16_cterm04, g:base16_cterm01)
  " Gitgutter
  call Base16hi("GitGutterAdd", "", g:base16_gui00, "", g:base16_cterm00)
  call Base16hi("GitGutterChange", "", g:base16_gui00, "", g:base16_cterm00)
  call Base16hi("GitGutterDelete", "", g:base16_gui00, "", g:base16_cterm00)
  call Base16hi("GitGutterChangeDelete", "", g:base16_gui00, "", g:base16_cterm00)
  call Base16hi("DiffAdd", "", g:base16_gui00, "", g:base16_cterm00)
  call Base16hi("DiffChange", "", g:base16_gui00, "", g:base16_cterm00)
  call Base16hi("DiffDelete", "", g:base16_gui00, "", g:base16_cterm00)
  " ALE
  call Base16hi("ALEErrorSign", g:base16_gui08, g:base16_gui00, g:base16_cterm08, g:base16_cterm00)
  call Base16hi("ALEWarningSign", g:base16_gui0A, g:base16_gui00, g:base16_cterm0A, g:base16_cterm00)
endfunction

augroup on_change_colorschema
  autocmd!
  autocmd ColorScheme * call s:base16_customize()
augroup END

call s:base16_customize()
