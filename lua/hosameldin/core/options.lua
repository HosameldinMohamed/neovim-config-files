local opt = vim.opt -- for conciseness
local g = vim.g -- for conciseness
local api = vim.api -- for conciseness

-- line numbers
opt.relativenumber = true
opt.number = true

-- tabs & indentation
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.autoindent = true

-- line wrapping
opt.wrap = false

-- search settings
opt.ignorecase = true
opt.smartcase = true

-- cursor line
opt.cursorline = true
opt.cursorcolumn = true

-- appearance
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"

-- backspace
opt.backspace = "indent,eol,start"

-- clipboard
opt.clipboard:append("unnamedplus")

-- split windows
opt.splitright = true
opt.splitbelow = true

opt.iskeyword:append("-")

-- iamcco/markdown-preview.nvim
g.mkdp_auto_start = true
g.mkdp_echo_preview_url = true
g.mkdp_theme = 'dark'

-- Nightfly
g.nightflyTransparent = false -- default value
g.nightflyTerminalColors = false

-- VimTex
g.vimtex_view_method = 'zathura'
-- g.vimtex_view_general_viewer = 'okular'

