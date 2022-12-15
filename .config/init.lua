-- Plugins
-- ------

local packer = require('packer')
-- local plugins = {
--   'wbthomason/packer.nvim'
--   'gioele/vim-autoswap'
--   'chriskempson/base16-vim'
--   'tpope/vim-fugitive'
--   'tpope/vim-surround'
--   'tpope/vim-obsession'
--   'tpope/vim-sleuth'
--   'tpope/vim-repeat'
--   'tpope/vim-dadbod'
--   'tpope/vim-commentary'
--   'kristijanhusak/vim-dadbod-ui'
--   'airblade/vim-gitgutter'
--   'jiangmiao/auto-pairs'
--   'majutsushi/tagbar'
--   'junegunn/fzf', { 'do': { -> fzf#install() } }
--   'junegunn/fzf.vim'
--   'junegunn/gv.vim'
--   'ludovicchabant/vim-gutentags'
--   'christoomey/vim-tmux-navigator'
--   'dense-analysis/ale'
--   'neoclide/coc.nvim', {'branch': 'release'}
--   'alok/notational-fzf-vim'
--   'hashivim/vim-terraform'
--   'jamessan/vim-gnupg'
--   'junegunn/goyo.vim'
--   'preservim/vim-pencil'
--   'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
--   'guns/vim-clojure-static'
--   'tpope/vim-fireplace'
-- }

-- packer.startup(plugins)

packer.startup(function(use)
  use 'wbthomason/packer.nvim'
  use 'gioele/vim-autoswap'
  use 'chriskempson/base16-vim'
  use 'tpope/vim-fugitive'
  use 'tpope/vim-surround'
  use 'tpope/vim-obsession'
  use 'tpope/vim-sleuth'
  use 'tpope/vim-repeat'
  use 'tpope/vim-dadbod'
  use 'tpope/vim-commentary'
  use 'kristijanhusak/vim-dadbod-ui'
  use 'airblade/vim-gitgutter'
  use 'jiangmiao/auto-pairs'
  use 'majutsushi/tagbar'
  use 'junegunn/fzf', { 'do': { -> fzf#install() } }
  use 'junegunn/fzf.vim'
  use 'junegunn/gv.vim'
  use 'ludovicchabant/vim-gutentags'
  use 'christoomey/vim-tmux-navigator'
  use 'dense-analysis/ale'
  use 'neoclide/coc.nvim', {'branch': 'release'}
  use 'alok/notational-fzf-vim'
  use 'hashivim/vim-terraform'
  use 'jamessan/vim-gnupg'
  use 'junegunn/goyo.vim'
  use 'preservim/vim-pencil'
  use 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
  use 'guns/vim-clojure-static'
  use 'tpope/vim-fireplace'
  use {
    'nvim-neo-tree/neo-tree.nvim',
    branch = 'v2.x',
    requires = {
      'nvim-lua/plenary.nvim',
      'MunifTanjim/nui.nvim',
    }
  }

  require('neo-tree').setup({
    enable_git_status = false,
    enable_diagnostics = false,
    enable_modified_markers = true,  -- Show markers for files with unsaved changes.
    enable_refresh_on_write = true,  -- Refresh the tree when a file is written. Only used if `use_libuv_file_watcher` is false.

    default_component_configs = {
      icon = {
        folder_closed = '▸',
        folder_open = '▾',
        folder_empty = 'ﰊ',
        -- The next two settings are only a fallback, if you use nvim-web-devicons and configure default icons there
        -- then these will never be used.
        default = '*',
        highlight = 'NeoTreeFileIcon'
      }
    }
  })
end)


-- NeoVim settings
-- ---------------

vim.cmd([[let g:neo_tree_remove_legacy_commands = 1]])

vim.g.neo_tree_enable_diagnostics = false
vim.g.neo_tree_enable_git_status = false
vim.g.neo_tree_enable_modified_markers = true
vim.g.neo_tree_enable_refresh_on_write = true

vim.o.syntax = 'enable'
vim.o.clipboard = 'unnamedplus'
vim.o.number = true
vim.o.relativenumber = true
vim.o.lazyredraw = true
vim.o.showmatch = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.incsearch = true
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.o.autoindent = true
vim.o.smartindent = true
vim.o.smarttab = true
vim.o.cursorline = true
vim.o.noshowmode = true         -- Hide default mode indicaator
vim.o.hidden = true             -- Allows hidden modified buffers
vim.o.autoread = true           -- Reload file if changed outside vim
vim.o.fillchars = 'vert:┃'      -- Vertical split character
vim.o.nosol = true
vim.o.path = '**'
vim.o.mouse = 'a'
vim.o.signcolumn = 'yes'        -- Always show sign column
vim.o.shm = 'Ia'                -- Don't show intro message see h: shm
vim.cmd([[filetype plugin indent on]])


-- Status Line
-- -----------

-- local function GitStatus()
--   local branch = vim.fn.fugitive#Head()
--   return #branch > 0 and (branch .. ' • ') or ''
-- end

-- vim.o.statusline = ''
-- vim.o.statusline = vim.o.statusline .. '%{'\ '}'                                         -- margin space at the left
-- vim.o.statusline = vim.o.statusline .. '%{GitStatus()}'                                  -- git branch
-- vim.o.statusline = vim.o.statusline .. '%f'                                              -- file path
-- vim.o.statusline = vim.o.statusline .. '%(\ [%M%R]%)'                                    -- flags
-- vim.o.statusline = vim.o.statusline .. '%='                                              -- right align
-- vim.o.statusline = vim.o.statusline .. '%{&filetype}'                                    -- file type
-- vim.o.statusline = vim.o.statusline .. '\ %{&fileencoding?&fileencoding:&encoding}'      -- file encoding
-- vim.o.statusline = vim.o.statusline .. '\ %{&fileformat}'                                -- file format
-- vim.o.statusline = vim.o.statusline .. '\ \ \ %l,%c%V\ %P'                               -- ruler
-- vim.o.statusline = vim.o.statusline .. '%{'\ '}'                                         -- margin space at the right


-- Abbreviation shortcuts
-- ----------------------

-- insert current date
vim.wo.inoreabbrev.idate = '<C-R>=strftime("%Y-%m-%d %H:%M")<CR>'
vim.wo.inoreabbrev.idateh = '<C-R>=strftime("%a, %b %d, %Y at %H:%M")<CR>'


-- Python support
-- --------------

local home = os.getenv('HOME')
vim.g.python3_host_prog = home .. '/.pyenv/versions/nvim/bin/python'


-- Keymaps
-- -------
-- leader
vim.api.nvim_set_keymap('n', '<space>', '<leader>', {noremap = true})
-- close window
vim.api.nvim_set_keymap('n', 'Q', '<C-w>q', {noremap = true})
-- delete buffer
vim.api.nvim_set_keymap('n', 'X', ':bd<CR>', {noremap = true})
-- move buffers
vim.api.nvim_set_keymap('n', 'L', ':bn<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', 'H', ':bp<CR>', {noremap = true})
-- clear hilight
vim.api.nvim_set_keymap('n', '<silent><esc>', ':noh<CR>', {noremap = true})
-- write buffer
vim.api.nvim_set_keymap('n', 's', ':w<CR>', {noremap = true})
-- scroll steps
vim.api.nvim_set_keymap('n', '<C-e>', '4<C-e>', {noremap = true})
vim.api.nvim_set_keymap('n', '<C-y>', '4<C-y>', {noremap = true})
vim.api.nvim_set_keymap('v', '<C-e>', '4<C-e>', {noremap = true})
vim.api.nvim_set_keymap('v', '<C-y>', '4<C-y>', {noremap = true})
-- tags
vim.api.nvim_set_keymap('n', 't', '<C-]>', {noremap = true})
vim.api.nvim_set_keymap('n', 'T', '<C-t>', {noremap = true})


-- Cursorline
-- ----------
--
local function set_cursorline()
  vim.api.nvim_set_option('cursorline', true)
end
local function unset_cursorline()
  vim.api.nvim_set_option('cursorline', false)
end

local function set_cursorline_only_in_active_window()
  vim.cmd [[augroup CursorLineOnlyInActiveWindow]]
  vim.cmd [[autocmd!]]
  vim.cmd [[autocmd VimEnter,WinEnter,BufWinEnter * setlocal cursorline]]
  vim.cmd [[autocmd WinLeave * setlocal nocursorline]]
  vim.cmd [[augroup END]]
end

set_cursorline_only_in_active_window()


-- Plugin settings
-- ---------------

-- Gitgutter
-- ---------
vim.api.nvim_set_option('updatetime', 100)
vim.api.nvim_set_var('g:gitgutter_override_sign_column_highlight', 0)


-- Neotree
vim.api.nvim_set_keymap('n', '<silent><leader>a', ':Neotree<CR>', {noremap = true})


-- Tagbar
-- ------
vim.api.nvim_set_keymap('n', '<silent><leader>;', ':TagbarToggle<CR>', {noremap = true})
vim.api.nvim_set_var('g:tagbar_left', 0)
vim.api.nvim_set_var('g:tagbar_sort', 0)
vim.api.nvim_set_var('g:tagbar_autofocus', 1)
vim.api.nvim_set_var('g:tagbar_compact', 1)
vim.api.nvim_set_var('g:tagbar_type_elixir', {
    ctagstype = 'elixir',
    kinds = {
        'f:functions',
        'functions:functions',
        'c:callbacks',
        'd:delegates',
        'e:exceptions',
        'i:implementations',
        'a:macros',
        'o:operators',
        'm:modules',
        'p:protocols',
        'r:records',
        't:tests'
    }
})


-- GutenTags
-- ---------
vim.api.nvim_set_var('g:gutentags_cache_dir', '~/dev/.tags/')


-- FZF
-- ---
--vim.api.nvim_set_var('$FZF_DEFAULT_COMMAND', 'ag -g')
vim.api.nvim_set_var('g:fzf_buffers_jump', 1)
vim.api.nvim_set_keymap('n', '<leader>f', ':FZF<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>b', ':Buffers<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>t', ':Tags<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>/', ':Ag<CR>', {noremap = true})


-- Goyo
-- ----
vim.api.nvim_set_var('g:goyo_width', 60)         -- (default: 80)
vim.api.nvim_set_var('g:goyo_height', 100)       -- (default: 85%)
vim.api.nvim_set_var('g:goyo_linenr', 0)         -- (default: 0)
vim.api.nvim_set_keymap('n', '<leader>g', ':Goyo<CR>', {noremap = true})


-- Pencil
-- ------
local function init_pencil()
  vim.cmd [[augroup pencil]]
  vim.cmd [[autocmd!]]
  vim.cmd [[autocmd FileType md,markdown call pencil#init({'wrap': 'soft'})]]
  vim.cmd [[autocmd FileType text,txt    call pencil#init()]]
  vim.cmd [[augroup END]]
end

init_pencil()


-- Vim Sleuth
-- ----------
vim.api.nvim_set_var('g:sleuth_automatic', 1)


-- DBUI
-- ----
vim.api.nvim_set_keymap('n', '<leader>d', ':DBUIToggle<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>r', '<Plug>(DBUI_ExecuteQuery)', {noremap = true})


-- ALE
-- ---
vim.api.nvim_set_var('g:ale_python_isort_options', '--profile black')
vim.api.nvim_set_var('g:ale_completion_enabled', 0)
vim.api.nvim_set_var('g:ale_linters', {
    python = {'pyflakes'},
    clojure = {'clj-kondo'},
    markdown = {'vale'},
    terraform = {'tflint'}
})
vim.api.nvim_set_var('g:ale_fixers', {
    ['*'] = {'remove_trailing_lines', 'trim_whitespace'},
    python = {'isort', 'black'},
    terraform = {'terraform'},
    json = {'jq'}
})
vim.api.nvim_set_var('g:ale_fix_on_save', 1)
vim.api.nvim_set_var('g:ale_sign_error', '✖')
vim.api.nvim_set_var('g:ale_sign_warning', '▲')


-- COC
-- ---
-- extensions
vim.api.nvim_set_var('g:coc_global_extensions', {'coc-json', 'coc-git'})
-- GoTo code navigation.
-- --------------------
vim.api.nvim_set_keymap('n', 'gd', '<Plug>(coc-definition)', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', 'gy', '<Plug>(coc-type-definition)', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', 'gi', '<Plug>(coc-implementation)', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', 'gr', '<Plug>(coc-references)', {noremap = true, silent = true})


-- Notational Velocity
-- ------------------
vim.api.nvim_set_var('g:nv_search_paths', {'~/notes/'})
vim.api.nvim_set_keymap('n', '<leader>n', ':NV<CR>', {noremap = true})


-- Autoswap
-- --------
vim.api.nvim_set_var('g:autoswap_detect_tmux', 1)


-- Markdown preview
-- ----------------
vim.api.nvim_set_keymap('n', '<leader>p', '<Plug>MarkdownPreviewToggle', {noremap = true})


-- Vim colors customizations
-- -------------------------
-- Source base16 file from env var
if vim.fn.exists('$BASE16_THEME')
    and (not vim.fn.exists('g:colors_name') or vim.g.colors_name ~= 'base16-$BASE16_THEME') then
  local base16colorspace = 256
  vim.api.nvim_command('colorscheme base16-$BASE16_THEME')
end


function s:base16_customize()
  call Base16hi("EndOfBuffer", g:base16_gui00, g:base16_gui00, g:base16_cterm00, g:base16_cterm00)
  call Base16hi("SignColumn", g:base16_gui03, g:base16_gui00, g:base16_cterm03, g:base16_cterm00)
  call Base16hi("VertSplit", g:base16_gui01, g:base16_gui00, g:base16_cterm01, g:base16_cterm00)
  call Base16hi("LineNr", g:base16_gui03, g:base16_gui00, g:base16_cterm03, g:base16_cterm00)
  call Base16hi("CursorLineNr", g:base16_gui03, g:base16_gui00, g:base16_cterm03, g:base16_cterm00)

  call hi CursorLineNr cterm=NONE
  -- Statusline and Tabline
  call Base16hi("StatusLine", g:base16_gui04, g:base16_gui00, g:base16_cterm04, g:base16_cterm00)
  call Base16hi("StatusLineNC", g:base16_gui02, g:base16_gui00, g:base16_cterm02, g:base16_cterm00)
  call Base16hi("TabLine", g:base16_gui02, g:base16_gui00, g:base16_cterm02, g:base16_cterm00)
  call Base16hi("TabLineSel", g:base16_gui04, g:base16_gui00, g:base16_cterm04, g:base16_cterm00)
  call Base16hi("TabLineFill", g:base16_gui04, g:base16_gui00, g:base16_cterm04, g:base16_cterm00)
  -- Gitgutter
  call Base16hi("GitGutterAdd", "", g:base16_gui00, "", g:base16_cterm00)
  call Base16hi("GitGutterChange", "", g:base16_gui00, "", g:base16_cterm00)
  call Base16hi("GitGutterDelete", "", g:base16_gui00, "", g:base16_cterm00)
  call Base16hi("GitGutterChangeDelete", "", g:base16_gui00, "", g:base16_cterm00)
  call Base16hi("DiffAdd", "", g:base16_gui00, "", g:base16_cterm00)
  call Base16hi("DiffChange", "", g:base16_gui00, "", g:base16_cterm00)
  call Base16hi("DiffDelete", "", g:base16_gui00, "", g:base16_cterm00)
  -- ALE
  call Base16hi("ALEErrorSign", g:base16_gui08, g:base16_gui00, g:base16_cterm08, g:base16_cterm00)
  call Base16hi("ALEWarningSign", g:base16_gui0A, g:base16_gui00, g:base16_cterm0A, g:base16_cterm00)
end

augroup on_change_colorschema
  autocmd!
  autocmd ColorScheme * call s:base16_customize()
augroup END

call s:base16_customize()
