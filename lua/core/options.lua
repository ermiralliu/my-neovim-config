local M = {}
function M.setup()
	vim.o.number = true
	vim.o.relativenumber = true
	vim.o.wrap = false
	vim.o.tabstop = 2
	vim.o.shiftwidth = 2
	vim.o.swapfile = false
	vim.o.winborder = "rounded"
	vim.o.startofline = true

	vim.g.mapleader = "\\"
	-- Per te puna, comment out the line above and enable the two below
	-- vim.g.mapleader = " "
	-- vim.g.maplocalleader = "\\"
end
return M
