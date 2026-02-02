local nnoremap = require("keymap").nnoremap
local telescope = require("telescope.builtin")

nnoremap("<C-a>", "gg<S-v>G")
nnoremap("<leader>pv", "<cmd>Ex<CR>")
nnoremap("<F2>", vim.lsp.buf.rename)
nnoremap("<leader>.", vim.lsp.buf.code_action)
nnoremap("<leader>e", vim.diagnostic.open_float)
nnoremap("gd", vim.lsp.buf.definition)
nnoremap("gD", vim.lsp.buf.declaration)
