-- import nvim-treesitter plugin safely
local status, treesitter = pcall(require, "nvim-treesitter.configs")
if not status then
	return
end

-- configure treesitter
treesitter.setup({
	-- enable syntax highlighting
	highlight = {
		enable = true,
		disable = { "markdown" }, -- it doesn't seem to highlight right!
	},
	-- enable indentation
	indent = { enable = false },
	-- enable autotagging (w/ nvim-ts-autotag plugin)
	autotag = { enable = true },
    -- rainbow parentheses
    rainbow = {
        enable = true,
        -- disable = { "cpp" },
        extended_mode = true,
        max_file_lines = nil,
    },
	-- ensure these language parsers are installed
	ensure_installed = {
		"json",
		"javascript",
		"typescript",
		"tsx",
		"yaml",
		"html",
		"css",
		"markdown",
		"markdown_inline",
		"svelte",
		"graphql",
		"bash",
		"lua",
		"vim",
		"dockerfile",
		"gitignore",
		"c",
		"cpp",
		"cmake",
		"make",
		"python",
		"latex",
		"bibtex",
	},
	-- auto install above language parsers
	auto_install = true,
})
