local status, lualine = pcall(require, "lualine")
if not status then
    return
end

local winbar = require("hosameldin.plugins.winbar")
local colors = require("hosameldin.config.colors")

lualine.setup {
  options = {
    disabled_filetypes = {
      statusline = {},
      winbar = {
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
  },
  sections = {
      lualine_a = { {
          'mode',
          icons_enabled = true,
          icon = nil,
      } },
      lualine_c = { {
          'filename',
          path = 1,
          symbols = {
              modified = '[פֿ ]',
              readonly = '[]',
              newfile = '[ ]',
              unnamed = '[ ]',
          },
      }, },
  },
  winbar = {
    lualine_a = { "mode" },
    lualine_b = { { "filetype" , icon_only = true } },
    lualine_c = { winbar.get_winbar },
    lualine_x = {},
    lualine_y = {},
    lualine_z = { { "diagnostics" , diagnostics_color = {
        error = 'DiagnosticError', -- Changes diagnostics' error color.
        warn  = 'DiagnosticWarn',  -- Changes diagnostics' warn color.
        info  = 'DiagnosticInfo',  -- Changes diagnostics' info color.
        hint  = 'DiagnosticHint',  -- Changes diagnostics' hint color.
      } } },
  },
  inactive_winbar = {
    lualine_a = { "mode" },
    lualine_b = { { "filetype" , icon_only = true } },
    lualine_c = { winbar.get_winbar },
    lualine_x = {},
    lualine_y = {},
    lualine_z = { { "diagnostics" , diagnostics_color = {
        error = 'DiagnosticError', -- Changes diagnostics' error color.
        warn  = 'DiagnosticWarn',  -- Changes diagnostics' warn color.
        info  = 'DiagnosticInfo',  -- Changes diagnostics' info color.
        hint  = 'DiagnosticHint',  -- Changes diagnostics' hint color.
      } } },
  },
}

