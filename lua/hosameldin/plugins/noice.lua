local setup, noice = pcall(require, "noice")
if not setup then
    return
end

noice.setup({
    lsp = {
        -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
        override = {
            ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
            ["vim.lsp.util.stylize_markdown"] = true,
            ["cmp.entry.get_documentation"] = true,
        },
        signature = {
            enabled = false;
        },
    },
    -- you can enable a preset for easier configuration
    presets = {
        bottom_search = true, -- use a classic bottom cmdline for search
        command_palette = true, -- position the cmdline and popupmenu together
        long_message_to_split = true, -- long messages will be sent to a split
        inc_rename = false, -- enables an input dialog for inc-rename.nvim
        lsp_doc_border = false, -- add a border to hover docs and signature help
    },
    cmdline = {
        view = "cmdline_popup",
    },
    messages = {
        view_search = false,
    },
    views = {
        cmdline_popup = {
            position = {
                row = 10,
                col = "50%",
            },
            size = {
                min_width = 60,
                width = "auto",
                height = "auto",
            },
        },
        cmdline_popupmenu = {
            relative = "editor",
            position = {
                row = 13,
                col = "50%",
            },
            size = {
                width = 60,
                height = "auto",
                max_height = 15,
            },
            border = {
                style = "rounded",
                padding = { 0, 1 },
            },
            win_options = {
                winhighlight = { Normal = "Normal", FloatBorder = "NoiceCmdlinePopupBorder" },
            },
        },
    },
})

-- change color for some highlight groups
-- see https://github.com/folke/noice.nvim#-highlight-groups
vim.cmd([[ highlight NoiceCmdlinePopupBorder guifg=#E9AE1A ]])
vim.cmd([[ highlight NoiceCmdlinePopupTitle guifg=#E9AE1A ]])

