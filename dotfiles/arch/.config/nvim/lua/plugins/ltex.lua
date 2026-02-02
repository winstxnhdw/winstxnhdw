return {
	"neovim/nvim-lspconfig",
	config = function()
		vim.lsp.config("ltex", {
			settings = {
				ltex = {
					language = "en-GB",
				},
			},
		})
	end,
}
