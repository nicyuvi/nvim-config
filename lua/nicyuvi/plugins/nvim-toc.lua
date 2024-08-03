-- import comment plugin safely
local setup = pcall(require, "nvim-toc")
if not setup then
	return
end

require("nvim-toc").setup({
	toc_header = "Table of Contents",
})
