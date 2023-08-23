-- import scrollbar plugin safely
local setup, scrollbar = pcall(require, "scrollbar")
if not setup then
    return
end

-- configure/enable scrollbar
scrollbar.setup({
    handle = {
        blend = 30,
    },
    handlers = {
        gitsigns = true, -- Requires gitsigns
        search = true, -- Requires hlslens
    },
})

