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
            vsplit = 'v',
            split = 's',
        },
        layout = 'normal',
        max_height = 0.3,
        left_width = 0.5,
    },
    symbol_in_winbar = {
        enable = false,
        show_file = false,
        folder_level = 2,
    },
    outline = {
        win_width = 50,
    },
})
