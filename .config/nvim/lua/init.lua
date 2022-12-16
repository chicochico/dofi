require('packer').startup(function(use)
  use "wbthomason/packer.nvim"
  use "gioele/vim-autoswap"
  use "chriskempson/base16-vim"
  use "tpope/vim-fugitive"
  use "tpope/vim-surround"
  use "tpope/vim-obsession"
  use "tpope/vim-sleuth"
  use "tpope/vim-repeat"
  use "tpope/vim-dadbod"
  use "tpope/vim-commentary"
  use "kristijanhusak/vim-dadbod-ui"
  use "airblade/vim-gitgutter"
  use "jiangmiao/auto-pairs"
  use "majutsushi/tagbar"
  use { "junegunn/fzf", run = ":call fzf#install()" }
  use "junegunn/fzf.vim"
  use "junegunn/gv.vim"
  use "ludovicchabant/vim-gutentags"
  use "christoomey/vim-tmux-navigator"
  use "dense-analysis/ale"
  use { "neoclide/coc.nvim", branch = "release" }
  use "alok/notational-fzf-vim"
  use "hashivim/vim-terraform"
  use "jamessan/vim-gnupg"
  use "junegunn/goyo.vim"
  use "preservim/vim-pencil"
  use "guns/vim-clojure-static"
  use "tpope/vim-fireplace"
  use {
    "iamcco/markdown-preview.nvim",
    run = function() vim.fn["mkdp#util#install"]() end
  }
  use {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v2.x",
    requires = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
    },
  }
end)


-- Neovim Settings
------------------
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
vim.o.hidden = true             -- Allows hidden modified buffers
vim.o.autoread = true           -- Reload file if changed outside vim
vim.o.fillchars = 'vert:┃'      -- Vertical split character
vim.o.mouse = 'a'
vim.o.signcolumn = 'yes'        -- Always show sign column
vim.o.shm = 'Ia'                -- Don't show intro message see h: shm
vim.cmd([[filetype plugin indent on]])


-- Abbreviation shortcuts
-- ----------------------
-- insert current date
vim.cmd([[inoreabbrev idate <C-R>=strftime("%Y-%m-%d %H:%M")<CR>]])
vim.cmd([[inoreabbrev idateh <C-R>=strftime("%a, %b %d, %Y at %H:%M")<CR>]])


-- statusline
-- ----------
-- local function git_status()
--   local branch = vim.fn['fugitive#Head']()
--   local status = branch .. ' • '
--   return branch:len() > 0 and status or ''
-- end


-- local stl = {
--   "%{' '}",
--   git_status(),
--   "%f",
--   "%( [%M%R]%)",
--   "%=",
--   "%{&filetype}",
--   " %{&fileencoding?&fileencoding:&encoding}",
--   " %{&fileformat}",
--   "   %l,%c%V %P",
--   "%{' '}",
-- }

-- vim.o.statusline = table.concat(stl)


-- Python support
-- --------------
local home = os.getenv('HOME')
vim.g.python3_host_prog = home .. '/.pyenv/versions/nvim/bin/python'



-- Keymaps
-- -------
-- leader
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
-- close window
vim.keymap.set('n', 'Q', '<C-w>q', {noremap = true})
-- delete buffer
vim.keymap.set('n', 'X', ':bd<CR>', {noremap = true})
-- move buffers
vim.keymap.set('n', 'L', ':bn<CR>', {noremap = true})
vim.keymap.set('n', 'H', ':bp<CR>', {noremap = true})
-- clear hilight
vim.keymap.set('n', '<silent><esc>', ':noh<CR>', {noremap = true})
-- write buffer
vim.keymap.set('n', 's', ':w<CR>', {noremap = true})
-- scroll steps
vim.keymap.set('n', '<C-e>', '4<C-e>', {noremap = true})
vim.keymap.set('n', '<C-y>', '4<C-y>', {noremap = true})
vim.keymap.set('v', '<C-e>', '4<C-e>', {noremap = true})
vim.keymap.set('v', '<C-y>', '4<C-y>', {noremap = true})
-- tags
vim.keymap.set('n', 't', '<C-]>', {noremap = true})
vim.keymap.set('n', 'T', '<C-t>', {noremap = true})



-- Cursorline
-- ----------
vim.cmd [[
  " shows cursorline only in the active window
  augroup CursorLineOnlyInActiveWindow
    autocmd!
    autocmd VimEnter,WinEnter,BufWinEnter * setlocal cursorline
    autocmd WinLeave * setlocal nocursorline
  augroup END
]]


require("neo-tree").setup {
  enable_git_status = false,
  enable_diagnostics = false,
  enable_modified_markers = true, -- Show markers for files with unsaved changes.
  enable_refresh_on_write = true, -- Refresh the tree when a file is written. Only used if `use_libuv_file_watcher` is false.
  default_component_configs = {
    icon = {
      folder_closed = "▸",
      folder_open = "▾",
      folder_empty = " ",
      default = "*",
    }
  }
}
