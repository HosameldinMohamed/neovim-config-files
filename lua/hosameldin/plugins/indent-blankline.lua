local setup, indent = pcall(require, "ibl")
if not setup then
    return
end

vim.opt.list = true
vim.opt.listchars:append "space:⋅"

indent.setup()

