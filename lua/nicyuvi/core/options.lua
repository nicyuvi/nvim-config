local opt = vim.opt

-- line numbers
opt.relativenumber = true
opt.number = true

-- tabs and indentation
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true

-- line wrapping
opt.wrap = false

-- search settings
opt.ignorecase = true
opt.smartcase = true

-- cursor line
opt.cursorline = true

-- appearance
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"

-- backspace
opt.backspace = "indent,eol,start"

-- yank uses system clipboard **in WSL 2**
vim.opt.clipboard = "unnamedplus"
if vim.fn.has("wsl") == 1 then
	vim.api.nvim_create_autocmd("TextYankPost", {

		group = vim.api.nvim_create_augroup("Yank", { clear = true }),

		callback = function()
			vim.fn.system("clip.exe", vim.fn.getreg('"'))
		end,
	})
end

-- split windows
opt.splitright = true
opt.splitbelow = true

-- considers dash a part of the string
opt.iskeyword:append("-")

-- turn off swapfile
opt.swapfile = false
