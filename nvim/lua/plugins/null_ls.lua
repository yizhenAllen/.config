return {
	"jose-elias-alvarez/null-ls.nvim",
	config = function()
		local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
		local null_ls = require("null-ls")
		null_ls.setup({
			-- format on save
			on_attach = function(client, bufnr)
				if client.supports_method("textDocument/formatting") then
					vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
					vim.api.nvim_create_autocmd({ "BufWritePre" }, {
						group = augroup,
						buffer = bufnr,

						callback = function()
							vim.cmd("silent! lua vim.lsp.buf.format({ async = false })")
							-- vim.lsp.buf.format({ async = false })
						end,
					})
				end
			end,
			debug = false,
			sources = {
				null_ls.builtins.formatting.stylua,
				null_ls.builtins.formatting.black.with({ extra_args = { "--fast" } }),
				-- null_ls.builtins.diagnostics.flake8,
			},
		})
		vim.keymap.set("n", "<leader>f", "<cmd>lua vim.lsp.buf.format({ async = false })<CR>")
	end,
}
