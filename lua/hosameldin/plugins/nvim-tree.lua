-- import nvim-tree plugin safely
local setup, nvimtree = pcall(require, "nvim-tree")
if not setup then
    return
end

-- recommended settings from nvim-tree documentation
vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1

-- change color for arrows in tree to light blue
vim.cmd([[ highlight NvimTreeIndentMarker guifg=#3FC5FF ]])
vim.cmd([[ highlight NvimTreeFolderIcon guifg=#E9AE1A ]])
vim.cmd([[ highlight NvimTreeGitNew guifg=#00F000 ]])

-- configure nvim-tree
nvimtree.setup({
    -- change folder arrow icons
    view = {
        -- width = 50,
        adaptive_size = true,
    },
    renderer = {
        icons = {
            glyphs = {
                folder = {
                    arrow_closed = "", -- arrow when folder is closed
                    arrow_open = "", -- arrow when folder is open
                },
                git = {
                    unstaged = "",
                    deleted = "",
                    untracked = "★",
                    unmerged = "",
                    staged = "✓",
                    renamed = "➜",
                    ignored = "",
                },
            },
        },
        highlight_git = false,
        highlight_opened_files = "all",
    },
    update_focused_file = {
        enable = true,
        update_root = false,
        ignore_list = {},
    },
    diagnostics = {
        enable = true,
    },
    git = {
        ignore = true,
    },
    -- disable window_picker for
    -- explorer to work well with
    -- window splits
    actions = {
        open_file = {
            window_picker = {
                enable = false,
            },
            resize_window = true;
        },
    },
})

-- for [No Name] buffers
local function open_nvim_tree(data)

    -- buffer is a [No Name]
    local no_name = data.file == "" and vim.bo[data.buf].buftype == ""

    if not no_name then
        return
    end

    -- open the tree, find the file and focus the tree
    require("nvim-tree.api").tree.toggle({ focus = false, find_file = true, })
end

vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })

