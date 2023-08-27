local status, lualine = pcall(require, "lualine")
if not status then
    return
end

local winbar = require("hosameldin.plugins.winbar")
local icons = require("hosameldin.config.icons")
local colors = require("hosameldin.config.colors")
local custom_auto_theme = require("lualine.themes.auto")

local theme_colors =
{
    normal        = '#58c3ff',
    normal_dark   = '#0e2029',
    insert        = '#bce77f',
    insert_dark   = '#232917',
    visual        = '#d84cff',
    visual_dark   = '#230c29',
    replace       = '#eb4d82',
    replace_dark  = '#290d18',
    command       = '#d1b983',
    command_dark  = '#29251b',
}

-- remove the backgroundi of lualine_c section for normal mode
custom_auto_theme.normal.c.bg = ''
-- remove the backgroundi of inactive sections
custom_auto_theme.inactive.c.bg = ''
-- make words in modes boldfaced
custom_auto_theme.normal.a.gui = 'bold'
custom_auto_theme.insert.a.gui = 'bold'
custom_auto_theme.visual.a.gui = 'bold'
custom_auto_theme.replace.a.gui = 'bold'
custom_auto_theme.command.a.gui = 'bold'
custom_auto_theme.inactive.a.gui = 'bold'
-- change the backgrounds of the modes
-- normal
custom_auto_theme.normal.a.bg = theme_colors.normal
custom_auto_theme.normal.b.fg = theme_colors.normal
custom_auto_theme.normal.b.bg = theme_colors.normal_dark
-- insert
custom_auto_theme.insert.a.bg = theme_colors.insert
custom_auto_theme.insert.b.fg = theme_colors.insert
custom_auto_theme.insert.b.bg = theme_colors.insert_dark
-- visual
custom_auto_theme.visual.a.bg = theme_colors.visual
custom_auto_theme.visual.b.fg = theme_colors.visual
custom_auto_theme.visual.b.bg = theme_colors.visual_dark
-- replace
custom_auto_theme.replace.a.bg = theme_colors.replace
custom_auto_theme.replace.b.fg = theme_colors.replace
custom_auto_theme.replace.b.bg = theme_colors.replace_dark
-- command
custom_auto_theme.command.a.bg = theme_colors.command
custom_auto_theme.command.b.fg = theme_colors.command
custom_auto_theme.command.b.bg = theme_colors.command_dark

lualine.setup {
    options = {
        disabled_filetypes =
        {
            statusline =
            {
                "NvimTree",
            },
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
        theme = custom_auto_theme,
        component_separators = { left = '', right = ''},
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
                newfile_status = false,
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
                color = { fg = colors.bright.green },
            },
            'encoding',
            { 'fileformat' , symbols = { unix = '󰌽', } },
            'filetype',
        },
    },
    inactive_sections = {
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
    },
    winbar = {
        lualine_a = { "mode" },
        lualine_b = { { "filetype" , icon_only = true } },
        lualine_c = { winbar.get_lspsaga_winbar },
        lualine_x = {},
        lualine_y = { { "buffers" , max_length = vim.o.columns / 3 , use_mode_colors = true } },
        lualine_z = { "mode" },
    },
    inactive_winbar = {
        lualine_a = { "mode" },
        lualine_b = { { "filetype" , icon_only = true , colored = false } },
        lualine_c = { winbar.get_lspsaga_winbar },
        lualine_x = {},
        lualine_y = { { "buffers" , max_length = vim.o.columns / 3 , use_mode_colors = true } },
        lualine_z = { "mode" },
    },
}

