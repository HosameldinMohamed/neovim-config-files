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

-- Quick close (no save)
keymap.set("n", "qq", ":q!<CR>")

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

-- Grapple
-- toggle menu
keymap.set("n", "<leader>hh", require("grapple").toggle_tags)
-- add file
keymap.set("n", "<leader>ha", require("grapple").toggle)
-- Navigate to file 1
keymap.set("n", "<leader>1", "<cmd>Grapple select index=1<CR>")
-- Navigate to file 2
keymap.set("n", "<leader>2", "<cmd>Grapple select index=2<CR>")
-- Navigate to file 3
keymap.set("n", "<leader>3", "<cmd>Grapple select index=3<CR>")
-- Navigate to file 4
keymap.set("n", "<leader>4", "<cmd>Grapple select index=4<CR>")
-- Navigate to file 5
keymap.set("n", "<leader>5", "<cmd>Grapple select index=5<CR>")
-- Navigate to file 6
keymap.set("n", "<leader>6", "<cmd>Grapple select index=6<CR>")
-- Navigate to file 7
keymap.set("n", "<leader>7", "<cmd>Grapple select index=7<CR>")
-- Navigate to file 8
keymap.set("n", "<leader>8", "<cmd>Grapple select index=8<CR>")
-- Navigate to file 9
keymap.set("n", "<leader>9", "<cmd>Grapple select index=9<CR>")
-- Navigate to next file
keymap.set("n", "<leader>hn", "<cmd>Grapple cycle_tags next<CR>")
-- Navigate to previous file
keymap.set("n", "<leader>hp", "<cmd>Grapple cycle_tags prev<CR>")

-- Auto-save
keymap.set("n", "<leader>a", ":ASToggle<CR>")

-- vim-illuminate
keymap.set("n", "<leader>hl", ":IlluminateToggle<CR>")

-- Git blame - blamer
keymap.set("n", "<leader>b", ":BlamerToggle<CR>")

-- DiffView
keymap.set("n", "<leader>d", ":DiffviewOpen<CR>")

-- folding using nvim-ufo
keymap.set('n', 'zR', require('ufo').openAllFolds)
keymap.set('n', 'zM', require('ufo').closeAllFolds)

-- Noice
local noice = require('noice')
keymap.set("n", "<leader>nl", function()
    noice.cmd("last")
end)
keymap.set("n", "<leader>nd", function()
    noice.cmd("dismiss")
end)

-- DAP and DAP-UI
keymap.set('n', '<leader>dt', ":DapToggleBreakpoint<CR>", {noremap=true})
keymap.set('n', '<leader>dc', ":DapContinue<CR>", {noremap=true})
keymap.set('n', '<leader>di', ":DapStepInto<CR>", {noremap=true})
keymap.set('n', '<leader>do', ":DapStepOver<CR>", {noremap=true})
keymap.set('n', '<leader>dl', ":DapShowLog<CR>", {noremap=true})
keymap.set('n', '<leader>dr', ":lua require('dapui').open{reset = true}CR>", {noremap=true})
keymap.set('n', '<leader>du', ":lua require('dapui').toggle()<CR>", {noremap=true})

