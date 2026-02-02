return {
	"f3fora/nvim-texlabconfig",
	dependencies = { "neovim/nvim-lspconfig" },
	config = function()
		require("texlabconfig").setup()
		vim.lsp.config("texlab", {
			settings = {
				texlab = {
					bibtexFormatter = "latexindent",
					build = {
						executable = "tectonic",
						args = { "-X", "compile", "%f", "--synctex", "--keep-logs", "--keep-intermediates" },
						onSave = true,
						forwardSearchAfter = true,
					},
					chktex = {
						onEdit = true,
						onOpenAndSave = true,
					},
					forwardSearch = {
						executable = "okular",
						args = { "--noraise", "--unique", "%p#src:%l%f" },
					},
				},
			},
		})
	end,
}
