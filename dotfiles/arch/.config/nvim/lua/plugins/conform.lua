return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local conform = require("conform")

		conform.setup({
			formatters_by_ft = {
				lua = { "stylua" },
				python = { "ruff_format" },
			},

			format_on_save = function(bufnr)
				local ignore_filetypes = { "sql", "java" }
				local bufname = vim.api.nvim_buf_get_name(bufnr)

				if vim.tbl_contains(ignore_filetypes, vim.bo[bufnr].filetype) then
					return
				end

				if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
					return
				end

				if bufname:match("/node_modules/") then
					return
				end

				return { timeout_ms = 500, lsp_format = "fallback" }
			end,

			format_after_save = function(bufnr)
				if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
					return
				end

				return { lsp_format = "fallback" }
			end,
		})

		vim.api.nvim_create_user_command("Format", function(args)
			local range = nil

			if args.count ~= -1 then
				local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]

				range = {
					start = { args.line1, 0 },
					["end"] = { args.line2, end_line:len() },
				}
			end

			conform.format({
				async = true,
				lsp_format = "fallback",
				range = range,
			})
		end, { range = true })
	end,
}
