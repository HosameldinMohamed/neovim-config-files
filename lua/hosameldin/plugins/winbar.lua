local M = {}

local icons = require "hosameldin.config.icons"
local colors = require "hosameldin.config.colors"
local navic = require "nvim-navic"
local utils = require "hosameldin.utils.useful-functions"
local saga = require "lspsaga.symbol.winbar"
local options = {
  section_separators = { left = '', right = '' },
  component_separators = { left = '', right = '' }
}

vim.api.nvim_set_hl(0, "WinBarSeparator", { fg = colors.total_black })
vim.api.nvim_set_hl(0, "WinBarFilename", { fg = colors.red })
vim.api.nvim_set_hl(0, "WinBarContext", { fg = colors.white })

local excludes = function()
    if vim.tbl_contains(M.winbar_filetype_exclude, vim.bo.filetype) then
        vim.opt_local.winbar = nil
        return true
    end
    return false
end

local function get_modified()
    if utils.get_buf_option "mod" then
        local mod = icons.git.Mod
        return "%#WinBarFilename#" .. mod .. " " .. "%t" .. "%*"
    end
    return "%#WinBarFilename#" .. "%t" .. "%*"
end

local function get_location()
    local location = navic.get_location()
    if not utils.is_empty(location) then
        return "%#WinBarContext#" .. " " .. icons.ui.TriangleRight .. " " .. location .. "%*"
    end
    return ""
end

function M.get_winbar()
    -- Use lualine disable file types
    -- if excludes() then
    --   return ""
    -- end

    if navic.is_available() then
        return "%#WinBarSeparator#"
        .. options.section_separators.right
        .. "%*"
        .. get_modified()
        .. get_location()
        .. "%#WinBarSeparator#"
        .. options.section_separators.left
        -- .. "%="
        -- .. "%*"
    else
        return "%#WinBarSeparator#"
        .. options.section_separators.right
        .. "%*"
        .. get_modified()
        .. "%#WinBarSeparator#"
        .. options.section_separators.left
        .. "%="
        .. "%*"
    end
end

function M.get_lspsaga_winbar()

    local saga_bar = saga.get_bar()
    if not utils.is_empty(saga_bar) then
        return get_modified()
        .. "%#WinBarContext#"
        .. " "
        .. icons.ui.TriangleRight
        .. " "
        .. saga_bar
        .. "%*"
        .. "%#WinBarSeparator#"
    else
        return  get_modified()
        .. "%#WinBarSeparator#"
        .. "%="
        .. "%*"
    end
end

return M
