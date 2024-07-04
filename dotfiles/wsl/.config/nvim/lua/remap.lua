local nnoremap = require("keymap").nnoremap
local telescope = require("telescope.builtin")

nnoremap("<C-a>", "gg<S-v>G")
nnoremap("<C-.>", "<cmd>lua vim.lsp.buf.code_action()<CR>")

nnoremap("<leader>pv", "<cmd>Ex<CR>")
nnoremap("<leader>ff", telescope.find_files)
nnoremap("<leader>fg", telescope.live_grep)
nnoremap("<leader>fb", telescope.buffers)
nnoremap("<leader>fh", telescope.help_tags)
