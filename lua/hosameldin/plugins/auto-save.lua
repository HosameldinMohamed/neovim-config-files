-- import auto-save safely
local autosave_setup, autosave = pcall(require, "auto-save")
if not autosave_setup then
    return
end

-- configure auto-save
autosave.setup({
    enabled = true, -- enabled by default
})

