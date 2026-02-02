return {
	"nvim-mini/mini.nvim",
	config = function()
		local pick = require("mini.pick")
		vim.keymap.set("n", "<leader>ff", pick.builtin.files)
		vim.keymap.set("n", "<leader>fg", pick.builtin.grep_live)
		pick.setup()
	end,
}
