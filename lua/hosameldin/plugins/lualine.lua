local status, lualine = pcall(require, "lualine")
if not status then
    return
end

local winbar = require("hosameldin.plugins.winbar")
local icons = require("hosameldin.config.icons")
local colors = require("hosameldin.config.colors")

lualine.setup {
    options = {
        disabled_filetypes =
        {
            statusline = {},
            winbar =
            {
                "help",
                "startify",
                "dashboard",
                "packer",
                "neogitstatus",
                "NvimTree",
                "Trouble",
                "alpha",
                "lir",
                "Outline",
                "spectre_panel",
                "toggleterm",
            },
        },
        theme = 'auto',
        component_separators = { left = '', right = ''},
        section_separators = { left = '', right = ''},
    },
    sections =
    {
        lualine_a =
        {
            {
                'mode',
                icons_enabled = true,
                icon = { '' },
            },
        },
        lualine_b =
        {
            { 'branch', icon = '' },
            {
                'diff' ,
                symbols =
                { added = '󰐖 ', modified = '󰦓 ', removed = '󰍵 ' },
            },
            {
                'diagnostics' ,
                symbols =
                { error = ' ', warn = ' ', hint = ' ', info = ' ', },
            },
        },
        lualine_c =
        {
            {
                'filename',
                path = 1,
                symbols =
                {
                    modified = icons.ui.Pencil,
                    readonly = icons.ui.Lock,
                    newfile = icons.ui.NewFile,
                    unnamed = icons.ui.Question,
                },
            },
        },
        lualine_x =
        {
            {
                require("noice").api.status.mode.get,
                cond = require("noice").api.status.mode.has,
                color = { fg = "#ff9e64" },
            },
            {
                require("noice").api.status.search.get,
                cond = require("noice").api.status.search.has,
                color = { fg = "#ff9e64" },
            },
            'encoding', 'fileformat', 'filetype'
        },
    },
    winbar = {
        lualine_a = { "mode" },
        lualine_b = { { "filetype" , icon_only = true } },
        lualine_c = { winbar.get_lspsaga_winbar },
        lualine_x = {},
        lualine_y = {},
        lualine_z = {},
    },
    inactive_winbar = {
        lualine_a = {},
        lualine_b = { { "filetype" , icon_only = true , colored = false } },
        lualine_c = { winbar.get_lspsaga_winbar },
        lualine_x = {},
        lualine_y = {},
        lualine_z = {},
    },
}

