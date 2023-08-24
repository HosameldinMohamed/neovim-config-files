-- import lspsaga safely
local saga_status, saga = pcall(require, "lspsaga")
if not saga_status then
    return
end

saga.setup({
    -- finder configurations
    -- refer to https://dev.neovim.pro/lspsaga/finder/
    finder = {
        keys = {
            vsplit = 'v'
        }
    },
    symbol_in_winbar = {
        enable = false,
    },
    outline = {
        win_width = 50,
    },
})
