-- import scrollbar plugin safely
local setup, scrollbar = pcall(require, "scrollbar")
if not setup then
	return
end

-- configure/enable scrollbar
scrollbar.setup()
