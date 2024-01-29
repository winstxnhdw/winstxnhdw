local nnoremap = require("keymap").nnoremap
local telescope = require("telescope.builtin")

nnoremap("<leader>pv", "<cmd>Ex<CR>")
nnoremap("<C-a>", "gg<S-v>G")

nnoremap("<leader>ff", telescope.find_files)
nnoremap("<leader>fg", telescope.live_grep)
nnoremap("<leader>fb", telescope.buffers)
nnoremap("<leader>fh", telescope.help_tags)
