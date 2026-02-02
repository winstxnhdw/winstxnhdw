return {
	"nvim-mini/mini.nvim",
	config = function()
		local pick = require("mini.pick")

		pick.setup()

		vim.keymap.set("n", "<leader>ff", function()
			pick.builtin.files()
		end, { desc = "Find files (mini.pick)" })

		vim.keymap.set("n", "<leader>fg", function()
			pick.builtin.grep_live()
		end, { desc = "Live grep (mini.pick)" })
	end,
}