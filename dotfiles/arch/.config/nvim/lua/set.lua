vim.opt.guicursor = ""
vim.opt.wrap = false
vim.opt.shell = "fish"
vim.opt.mouse = "v"

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.scrolloff = 8

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

vim.g.mapleader = " "

vim.api.nvim_create_autocmd("BufEnter", {
	pattern = { "*.md", "*.tex" },
	group = vim.api.nvim_create_augroup("Wrap Settings", { clear = true }),
	command = "setlocal wrap",
})

vim.api.nvim_create_autocmd("BufEnter", {
	pattern = { "*.md", "*.tex" },
	group = vim.api.nvim_create_augroup("Linebreak Settings", { clear = true }),
	command = "setlocal linebreak",
})
