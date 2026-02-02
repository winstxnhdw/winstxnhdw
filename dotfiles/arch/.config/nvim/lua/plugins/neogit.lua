local function open_floating_neogit()
	require("neogit").open({ kind = "floating" })
end

return {
	"NeogitOrg/neogit",
	dependencies = { "nvim-lua/plenary.nvim" },
	keys = {
		{ "<leader>gg", open_floating_neogit, mode = "n", desc = "Open Neogit (floating)" },
	},
}