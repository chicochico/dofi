-- Customize highlight colors
-- Source base16 file from env var
function color_customize()
    local hl = vim.api.nvim_set_hl
    hl(0, "Active", { ctermfg = 21, ctermbg = nil })
    hl(0, "CurSearch", { ctermfg = 0, ctermbg = 16 })
    hl(0, "CursorLine", { ctermbg = nil })
    hl(0, "CursorLineNr", { link = "LineNrActive" })
    hl(0, "DiffAdd", { ctermfg = 2, ctermbg = nil })
    hl(0, "DiffAdded", { ctermfg = 2, ctermbg = nil })
    hl(0, "DiffChange", { ctermfg = 8, ctermbg = nil })
    hl(0, "DiffDelete", { ctermfg = 1, ctermbg = nil })
    hl(0, "DiffFile", { ctermfg = 1, ctermbg = nil })
    hl(0, "DiffLine", { ctermfg = 4, ctermbg = nil })
    hl(0, "DiffNewFile", { ctermfg = 2, ctermbg = nil })
    hl(0, "DiffRemoved", { ctermfg = 1, ctermbg = nil })
    hl(0, "DiffText", { bold = true, ctermfg = 4, ctermbg = nil })
    hl(0, "FoldColumn", { ctermfg = 6, ctermbg = nil })
    hl(0, "Folded", { ctermfg = 8, ctermbg = nil })
    hl(0, "GitSignsAdd", { ctermfg = 2, ctermbg = nil })
    hl(0, "GitSignsChange", { ctermfg = 4, ctermbg = nil })
    hl(0, "GitSignsDelete", { ctermfg = 1, ctermbg = nil })
    hl(0, "HorizontalSplit", { ctermfg = 18, ctermbg = nil })
    hl(0, "Inactive", { ctermfg = 8, ctermbg = nil })
    hl(0, "LineNr", { link = "LineNrDefault" })
    hl(0, "LineNrAbove", { ctermfg = 8, ctermbg = nil })
    hl(0, "LineNrActive", { ctermfg = 21, ctermbg = nil, bold = true })
    hl(0, "LineNrBelow", { ctermfg = 8, ctermbg = nil })
    hl(0, "LineNrDefault", { ctermfg = 8, ctermbg = nil, bold = true })
    hl(0, "NeoTreeCursorLine", { ctermbg = 18 })
    hl(0, "NeoTreeDirectoryIcon", { ctermfg = 8 })
    hl(0, "NeoTreeDirectoryName", { ctermfg = 4 })
    hl(0, "NeoTreeDotfile", { ctermfg = 17 })
    hl(0, "NeoTreeFileName", { ctermfg = 20 })
    hl(0, "NeoTreeIndentMarker", { ctermfg = 8 })
    hl(0, "NonText", { ctermbg = nil })
    hl(0, "Normal", { ctermbg = nil })
    hl(0, "Search", { ctermfg = 0, ctermbg = 11 })
    hl(0, "SignColumn", { ctermbg = nil })
    hl(0, "SignColumn", { ctermfg = 8, ctermbg = nil })
    hl(0, "StatusLine", { link = "Active" })
    hl(0, "StatusLineNC", { link = "StatusLineNoFocus" })
    hl(0, "StatusLineNoFocus", { ctermfg = 8, ctermbg = nil, nocombine = true })
    hl(0, "StatusLineSeparator", { ctermfg = 8, ctermbg = nil })
    hl(0, "TabLine", { link = "Inactive" })
    hl(0, "TabLineFill", { ctermfg = 20, ctermbg = nil })
    hl(0, "TabLineSel", { link = "Active" })
    hl(0, "VertSplit", { ctermfg = 18, ctermbg = nil })
end

local theme = os.getenv("BASE16_THEME")
if theme then
    vim.cmd([[
    let base16colorspace=256
    autocmd ColorScheme * lua color_customize()
    colorscheme base16-$BASE16_THEME
  ]])
end

-- Neovim SettingS
------------------
vim.o.clipboard = "unnamedplus"
vim.o.number = true
vim.o.relativenumber = true
vim.o.lazyredraw = false
vim.o.showmatch = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.incsearch = true
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.o.autoindent = true
vim.o.smartindent = true
vim.o.smarttab = true
vim.o.cursorline = true -- Set to be invisible except the line number, see hilight customization below
vim.o.hidden = true -- Allows hidden modified buffers
vim.o.autoread = true -- Reload file if changed outside vim
vim.o.fillchars = "vert:┃,stl:━,stlnc:━,eob: " -- vert: vertical split character
                                               -- stl: statusline character
                                               -- stlnc: statusline character when no focus
                                               -- eob: end of buffer character
vim.o.mouse = "a"
vim.o.signcolumn = "yes" -- Always show sign column
vim.o.shm = "Ia" -- Don't show intro message see h: shm
vim.cmd([[
  filetype plugin indent on
  set noshowmode
  set nosol
]])

-- statusline
-- ----------
local function separator(str)
    return "%#StatusLineSeparator#" .. str .. "%*"
end

local function horizontal_separator(str)
    return "%#HorizontalSplit#" .. "  " .. str .. "  " .. "%*"
end

local stl = {
    " ",
    "%{fugitive#Head()}",
    separator("%{fugitive#Head() != '' ? '  ' : ''}"), -- non-breaking space ` ` is used around the separator
    "%f",
    "%([%M%R]%)",
    horizontal_separator("%="),
    "%{&filetype}",
    separator("%{&filetype != '' ? ' • ' : ''}"),
    "%l:%c",
    " ",
}
vim.o.statusline = table.concat(stl)

--- Customize hilights based on where the active cursor is
--- ----------
vim.cmd([[
  " Shows cursorline only in the active window
  if !exists('#CursorLineFocus#FocusGained')
    augroup CursorLineFocus
      autocmd!
      autocmd VimEnter,WinEnter,BufWinEnter,FocusGained * setlocal cursorline
      autocmd WinLeave,FocusLost * setlocal nocursorline
    augroup END
  endif

  " Dim when focus is lost
  if !exists('#StatusLineFocus#FocusGained')
    augroup StatusLineFocus
      autocmd!
      autocmd FocusGained * lua vim.api.nvim_set_hl(0, 'StatusLine', {link = 'Active'})
      autocmd FocusLost   * lua vim.api.nvim_set_hl(0, 'StatusLine', {link = 'Inactive'})
    augroup END
  endif
]])

-- Abbreviation shortcuts
-- ----------------------
-- insert current date
vim.cmd([[inoreabbrev idate <C-R>=strftime("%Y-%m-%d %H:%M")<CR>]])
vim.cmd([[inoreabbrev idateh <C-R>=strftime("%a, %b %d, %Y at %H:%M")<CR>]])

-- Providers support
-- --------------
vim.g.loaded_python3_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_node_provider = 0
vim.g.loaded_perl_provider = 0

-- Copilot
vim.g.copilot_assume_mapped = true
vim.g.copilot_filetypes = {
    ["yaml"] = true,
}

-- Keymaps
-- -------
vim.g.mapleader = " " -- leader
vim.g.maplocalleader = " "
vim.keymap.set("n", "Q", "<C-w>q", { noremap = true }) -- close window
vim.keymap.set("n", "X", ":bd<CR>", { noremap = true }) -- delete buffer
vim.keymap.set("n", "L", "gt", { noremap = true }) -- move tabs
vim.keymap.set("n", "H", "gT", { noremap = true })
vim.keymap.set("n", "<esc>", ":noh<CR>", { noremap = true, silent = true }) -- clear highlighting
vim.keymap.set("n", "s", ":w<CR>", { noremap = true }) -- write buffer
vim.keymap.set("n", "<C-e>", "7<C-e>", { noremap = true }) -- scroll steps
vim.keymap.set("n", "<C-y>", "7<C-y>", { noremap = true })
vim.keymap.set("v", "<C-e>", "7<C-e>", { noremap = true })
vim.keymap.set("v", "<C-y>", "7<C-y>", { noremap = true })
vim.keymap.set("n", "t", "<C-]>", { noremap = true }) -- tags
vim.keymap.set("n", "T", "<C-t>", { noremap = true })
vim.keymap.set("n", "gb", ":GBrowse<CR>", { noremap = true })

-- Plugin settings
-- ---------------

-- Netrw
-- built-in file explorer
-- -----
vim.api.nvim_set_var("netrw_banner", 0)
vim.api.nvim_set_var("netrw_keepdir", 1)
vim.api.nvim_set_var("netrw_liststyle", 3)
vim.api.nvim_set_var("netrw_altfile", 1)
vim.api.nvim_set_var("netrw_browse_split", 0)
vim.keymap.set("n", "<leader>e", ":Ex<CR>", { noremap = true })
vim.cmd([[
    augroup netrw_mapping
        autocmd!
        autocmd filetype netrw call NetrwMapping()
    augroup END

    function! NetrwMapping()
        nmap <buffer> . gn
        nmap <buffer> <backspace> -
        nmap <buffer> <c-l> <c-w>l
    endfunction
]])

-- Gitsigns
-- See `:help gitsigns.txt`
require("gitsigns").setup({
    signs = {
        add = { text = "+" },
        change = { text = "~" },
        delete = { text = "_" },
        topdelete = { text = "‾" },
        changedelete = { text = "~" },
    },
})

-- Tagbar
-- ------
vim.keymap.set("n", "<leader>;", ":TagbarToggle<CR>", { noremap = true, silent = true })
vim.api.nvim_set_var("tagbar_left", 0)
vim.api.nvim_set_var("tagbar_sort", 0)
vim.api.nvim_set_var("tagbar_autofocus", 1)
vim.api.nvim_set_var("tagbar_compact", 1)
vim.api.nvim_set_var("tagbar_type_elixir", {
    ctagstype = "elixir",
    kinds = {
        "f:functions",
        "functions:functions",
        "c:callbacks",
        "d:delegates",
        "e:exceptions",
        "i:implementations",
        "a:macros",
        "o:operators",
        "m:modules",
        "p:protocols",
        "r:records",
        "t:tests",
    },
})

-- GutenTags
-- ---------
vim.api.nvim_set_var("gutentags_cache_dir", "~/dev/.tags/")

-- FZF
-- ---
vim.api.nvim_set_var("fzf_buffers_jump", 1)
vim.api.nvim_set_keymap("n", "<leader>f", ":FZF<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>b", ":Buffers<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>t", ":Tags<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>/", ":Ag<CR>", { noremap = true })

-- Goyo
-- ----
vim.api.nvim_set_var("goyo_width", 100) -- (default: 80)
vim.api.nvim_set_var("goyo_height", 85) -- (default: 85%)
vim.api.nvim_set_var("goyo_linenr", 1) -- (default: 0)
vim.api.nvim_set_keymap("n", "<leader>G", ":Goyo<CR>", { noremap = true })

--- This ensures that status bar is not visible within Goyo
vim.cmd([[
  autocmd! User GoyoEnter lua vim.api.nvim_set_hl(0, 'StatusLine', {link = 'Inactive'})
]])

-- Fugitive
-- --------
vim.api.nvim_set_keymap("n", "<leader>g", ":Git<CR>", { noremap = true })

-- Pencil
-- ------
vim.cmd([[
  augroup Pencil
    autocmd!
    autocmd FileType md,markdown call pencil#init({'wrap': 'soft'})
  augroup END
]])

-- Vim Sleuth
-- ----------
vim.api.nvim_set_var("sleuth_automatic", 1)

-- Notational Velocity
-- ------------------
vim.api.nvim_set_var("nv_search_paths", { "~/notes/" })
vim.api.nvim_set_keymap("n", "<leader>n", ":NV<CR>", { noremap = true })

-- Autoswap
-- --------
vim.api.nvim_set_var("autoswap_detect_tmux", 1)

-- Markdown preview
-- ----------------
vim.api.nvim_set_keymap("n", "<leader>p", "<Plug>MarkdownPreviewToggle", { noremap = true })

-- Treesitter
-- See `:help nvim-treesitter`
require("nvim-treesitter.configs").setup({
    -- install new syntaxes with home.nix
    highlight = { enable = true, disable = { "sql", "vimdoc" } },
    indent = { enable = true, disable = { "python" } },
})

-- Gitsigns
vim.api.nvim_set_keymap("n", "<leader>hu", ":Gitsigns reset_hunk<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>hs", ":Gitsigns stage_hunk<CR>", { noremap = true })

-- Nvim Autopairs
require("nvim-autopairs").setup({})

-- LSP
------
local lspconfig = require("lspconfig")
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

lspconfig.terraformls.setup({ capabilities = capabilities })
lspconfig.rnix.setup({ capabilities = capabilities })
lspconfig.pylsp.setup({ capabilities = capabilities })
lspconfig.yamlls.setup({
    capabilities = capabilities,
    settings = { yaml = { validate = { enable = false } } },
})

-- Null-ls
local null_ls = require("null-ls")
local sources = {
    null_ls.builtins.diagnostics.actionlint,
    null_ls.builtins.diagnostics.shellcheck.with({ filetypes = { "sh", "zsh" } }),
    null_ls.builtins.formatting.black,
    null_ls.builtins.formatting.isort,
    null_ls.builtins.formatting.jq,
    null_ls.builtins.formatting.shfmt.with({ extra_args = { "-i", "4" } }),
    null_ls.builtins.formatting.sqlfluff.with({ extra_args = { "--dialect", "snowflake" } }),
    null_ls.builtins.formatting.stylua.with({ extra_args = { "--indent-type", "Spaces", "--indent-width", "4" } }),
}
null_ls.setup({ sources = sources })

-- Turn on lsp status information
require("fidget").setup()

-- Autocompletion
local cmp = require("cmp")
cmp.setup({
    mapping = cmp.mapping.preset.insert({
        ["<C-d>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<CR>"] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
        }),
        ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            else
                fallback()
            end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            else
                fallback()
            end
        end, { "i", "s" }),
    }),
    sources = {
        { name = "nvim_lsp" },
    },
})

-- Global mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float)
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist)

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("UserLspConfig", {}),
    callback = function(ev)
        -- Enable completion triggered by <c-x><c-o>
        vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"
        -- Buffer local mappings.
        -- See `:help vim.lsp.*` for documentation on any of the below functions
        local opts = { buffer = ev.buf }
        vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
        vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
        vim.keymap.set("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, opts)
        vim.keymap.set("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, opts)
        vim.keymap.set("n", "<leader>wl", function()
            print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        end, opts)
        vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, opts)
        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
        vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
        vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
        vim.keymap.set("n", "<leader>F", function()
            vim.lsp.buf.format({ async = true })
        end, opts)

        -- Custom capability override
        local client = vim.lsp.get_client_by_id(ev.data.client_id)
        if client.name == "yamlls" then
            -- bug in yammlls
            client.server_capabilities.documentFormattingProvider = true
        end
    end,
})
