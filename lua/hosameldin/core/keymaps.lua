vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness

-- general keymaps
--
keymap.set("i", "kj", "<ESC>")

keymap.set("n", "<leader>nh", ":nohl<CR>")

keymap.set("n", "x", '"_x')

keymap.set("n", "<leader>+", "<C-a>")
keymap.set("n", "<leader>-", "<C-x>")

-- Save file shortcut
keymap.set("n", "<C-s>", ":w<CR>")

-- Center cursor when moving half page
keymap.set("n", "<C-u>", "<C-u>zz")
keymap.set("n", "<C-d>", "<C-d>zz")

-- Manage splits
keymap.set("n", "<leader>sv", "<C-w>v") -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s") -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=") -- make split windows equal width
keymap.set("n", "<leader>sx", ":close<CR>") -- close current split window

keymap.set("n", "<C-Left>", ":vertical resize +3<CR>")
keymap.set("n", "<C-Right>", ":vertical resize -3<CR>")
keymap.set("n", "<C-Up>", ":resize +3<CR>")
keymap.set("n", "<C-Down>", ":resize -3<CR>")

-- Splits with terminal
keymap.set("n", "<leader>tv", ":vs|:terminal<CR>") -- Open terminal with vertical split
keymap.set("n", "<leader>th", ":sp|:terminal<CR>") -- Open terminal with horizontal split

-- Go from terminal mode to normal mode
-- Only if you are inside "bash" termianl
-- otherwise do nothing..
keymap.set("t", "kj", function ()
    return vim.fs.basename(vim.api.nvim_buf_get_name(0)) == "bash" and "<C-\\><C-n>" or ""
end, { expr = true })

-- Manage tabs
keymap.set("n", "<leader>to", ":tabnew<CR>") -- open new tab
keymap.set("n", "<leader>tx", ":tabclose<CR>") -- close current tab
keymap.set("n", "<leader>tn", ":tabn<CR>") -- go to next tab
keymap.set("n", "<leader>tp", ":tabp<CR>") -- go to previous tab

-- The paste remap (Cool!)
keymap.set("v", "p", "\"_dP")

-- Delete without saving in register
keymap.set("v", "<leader>d", "\"_d")

-- Indent, staying in Visual Mode
keymap.set("v", "<", "<gv")
keymap.set("v", ">", ">gv")

-- Move selection up and down
keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- plugin keymaps

-- vim-maximizer
keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>")

-- nvim-tree
keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>")

-- telescope
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>")
keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>")
keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>")
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>")
keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>")

-- LazyGit
keymap.set("n", "<leader>gg", ":LazyGit<CR>") -- Open LazyGit

-- spellcheck
keymap.set("n", "<leader>sp", ":set spell!<CR>")

-- Harpoon
-- toggle menu
keymap.set("n", "<leader>hh", ":lua require('harpoon.ui').toggle_quick_menu()<CR>")
-- add file
keymap.set("n", "<leader>ha", ":lua require('harpoon.mark').add_file()<CR>")
-- Navigate to file 1
keymap.set("n", "<leader>h1", ":lua require('harpoon.ui').nav_file(1)<CR>")
-- Navigate to file 2
keymap.set("n", "<leader>h2", ":lua require('harpoon.ui').nav_file(2)<CR>")
-- Navigate to file 3
keymap.set("n", "<leader>h3", ":lua require('harpoon.ui').nav_file(3)<CR>")
-- Navigate to file 4
keymap.set("n", "<leader>h4", ":lua require('harpoon.ui').nav_file(4)<CR>")
-- Navigate to next file
keymap.set("n", "<leader>hn", ":lua require('harpoon.ui').nav_next()<CR>")
-- Navigate to previous file
keymap.set("n", "<leader>hp", ":lua require('harpoon.ui').nav_prev()<CR>")
-- Navigate to terminal 1
keymap.set("n", "<leader>ht", ":lua require('harpoon.term').gotoTerminal(1)<CR>")

-- Auto-save
keymap.set("n", "<leader>a", ":ASToggle<CR>")

-- vim-illuminate
keymap.set("n", "<leader>hl", ":IlluminateToggle<CR>")

-- Git blame - blamer
keymap.set("n", "<leader>b", ":BlamerToggle<CR>")
