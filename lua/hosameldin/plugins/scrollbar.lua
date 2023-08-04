-- import scrollbar plugin safely
local setup, scrollbar = pcall(require, "scrollbar")
if not setup then
    return
end

-- configure/enable scrollbar
scrollbar.setup()

require("scrollbar.handlers.search").setup({
    override_lens = function() end,
})

require("scrollbar.handlers.gitsigns").setup()
