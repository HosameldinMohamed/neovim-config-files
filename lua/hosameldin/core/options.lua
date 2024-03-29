local opt = vim.opt -- for conciseness
local g = vim.g -- for conciseness
local api = vim.api -- for conciseness
local o = vim.o -- for conciseness

-- line numbers
opt.relativenumber = true
opt.number = true

-- tabs & indentation
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.autoindent = true

-- line wrapping
opt.wrap = true

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
g.mkdp_auto_start = false
g.mkdp_echo_preview_url = true
g.mkdp_theme = 'dark'

-- Nightfly
g.nightflyTransparent = false -- default value
g.nightflyTerminalColors = false

-- Nightfly override highlight with vim-Illuminate
local nightfly_hl = "#1d3b53"
local custom_highlight = vim.api.nvim_create_augroup("CustomHighlight", {})
vim.api.nvim_create_autocmd("ColorScheme", {
    pattern = {"nightfly"},
    callback = function()
        api.nvim_set_hl(0, "IlluminatedWordText", { bg = nightfly_hl })
        api.nvim_set_hl(0, "IlluminatedWordRead", { bg = nightfly_hl })
        api.nvim_set_hl(0, "IlluminatedWordWrite", { bg = nightfly_hl })
        -- Remove separator highlight
        vim.cmd([[hi WinSeparator guibg=NONE]])
    end,
    group = custom_highlight,
})

local kanagawa_hl = "#404052"
vim.api.nvim_create_autocmd("ColorScheme", {
    pattern = {"kanagawa"},
    callback = function()
        api.nvim_set_hl(0, "IlluminatedWordText", { bg = kanagawa_hl })
        api.nvim_set_hl(0, "IlluminatedWordRead", { bg = kanagawa_hl })
        api.nvim_set_hl(0, "IlluminatedWordWrite", { bg = kanagawa_hl })
        -- Remove separator highlight
        vim.cmd([[hi WinSeparator guibg=NONE]])
    end,
    group = custom_highlight,
})

local catppuccin_hl = "#31314C"
vim.api.nvim_create_autocmd("ColorScheme", {
    pattern = {"catppuccin"},
    callback = function()
        api.nvim_set_hl(0, "IlluminatedWordText", { bg = catppuccin_hl })
        api.nvim_set_hl(0, "IlluminatedWordRead", { bg = catppuccin_hl })
        api.nvim_set_hl(0, "IlluminatedWordWrite", { bg = catppuccin_hl })
        -- Remove separator highlight
        vim.cmd([[hi WinSeparator guibg=NONE]])
    end,
    group = custom_highlight,
})

local moonfly_hl = "#2B2B2B"
vim.api.nvim_create_autocmd("ColorScheme", {
    pattern = {"moonfly"},
    callback = function()
        api.nvim_set_hl(0, "IlluminatedWordText", { bg = moonfly_hl })
        api.nvim_set_hl(0, "IlluminatedWordRead", { bg = moonfly_hl })
        api.nvim_set_hl(0, "IlluminatedWordWrite", { bg = moonfly_hl })
        -- Remove separator highlight
        vim.cmd([[hi WinSeparator guibg=NONE]])
    end,
    group = custom_highlight,
})

-- VimTex
g.vimtex_view_method = 'zathura_simple'
g.Tex_FoldedSections     = ""
g.Tex_FoldedEnvironments = ""
g.Tex_FoldedMisc         = ""
g.vimtex_quickfix_mode   = 0
g.vimtex_syntax_enabled  = 0
-- g.vimtex_view_general_viewer = 'okular'

-- For folding using nvim-ufo
o.foldcolumn = '0' -- '0' is not bad
o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
o.foldlevelstart = 99
o.foldenable = true

