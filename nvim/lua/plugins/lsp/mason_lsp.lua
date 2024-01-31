return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"neovim/nvim-lspconfig",
		"folke/neodev.nvim",
		"nvimdev/lspsaga.nvim",
	},
	config = function()
		local lspconfig = require("lspconfig")
		require("mason").setup()
		require("mason-lspconfig").setup({
			ensure_installed = { "lua_ls", "pyright", "bashls"},
			automatic_installation = true,
		})
		require("neodev").setup({})
		require("lspsaga").setup({
			finder = {
				keys = {
					vsplit = "<leader>sl",
					split = "<leader>sj",
					shuttle = "[w", -- default
					toggle_or_open = "l",
				},
			},
			rename = {
				keys = {
					quit = "<C-j>",
					select = "v",
					exec = "<CR>",
				},
			},
			outline = {
				keys = {
					jump = "<CR>",
					toggle_or_jump = "l",
				},
			},
			-- use enter to open file with definition preview
			definition = {
				keys = {
					edit = "<CR>",
				},
			},
			-- keybinds for navigation in lspsaga window
			scroll_preview = {
				scroll_down = "<C-d>",
				scroll_up = "<C-u>",
			},
			ui = {
				border = "rounded",
				devicons = true,
				actionfix = "<CR>",
			},
			Beacon = {
				enable = true,
				frequency = 7,
			},
		})

		require("lspconfig.ui.windows").default_options = {
			border = "rounded",
		}

		-- enable keybinds only for when lsp server available
		local on_attach = function(client, bufnr)
			local nmap = function(keys, func, desc)
				if desc then
					desc = "LSP: " .. desc
				end

				vim.keymap.set("n", keys, func, { buffer = bufnr, desc = desc })
			end

			-- nmap('<C-y>', vim.lsp.buf.signature_help, 'Signature Documentation')
			-- -- Lesser used LSP functionality
			-- nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
			-- nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
			-- nmap('<leader>wl', function()
			--   print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
			-- end, '[W]orkspace [L]ist Folders')

			-- keybind options
			local opts = { noremap = true, silent = true, buffer = bufnr }
			local keymap = vim.keymap

			-- keys of telescope-lsp
			nmap("gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")
			nmap("<leader>ds", require("telescope.builtin").lsp_document_symbols, "[D]ocument [S]ymbols")
			nmap("<leader>ws", require("telescope.builtin").lsp_dynamic_workspace_symbols, "[W]orkspace [S]ymbols")

			-- set keybinds
			keymap.set("n", "gf", "<cmd>Lspsaga finder<CR>", opts) -- show definition, references
			keymap.set("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts) -- jump to previous diagnostic in buffer
			keymap.set("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts) -- jump to next diagnostic in buffer
			keymap.set("n", "gd", "<cmd>Lspsaga peek_definition<CR>", opts) -- see definition and make edits in window
			keymap.set("n", "gs", vim.lsp.buf.signature_help, opts)
			keymap.set("n", "gD", "<cmd>Lspsaga peek_type_definition<CR>", opts) -- see definition and make edits in window
			keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts) -- show documentation for what is under cursor
			keymap.set("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opts) -- show documentation for what is under cursor
			keymap.set("n", "<leader>D", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts) -- got to declaration, many server do not support
			keymap.set("n", "gI", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts) -- go to implementation
			keymap.set("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts) -- see available code actions
			keymap.set("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opts) -- smart rename
			keymap.set(
				"n",
				"<leader>ld",
				"<cmd>Lspsaga show_line_diagnostics<CR>",
				{ noremap = true, silent = true, buffer = bufnr, desc = "[L]ine [D]aignostic" }
			) -- show  diagnostics for line
			keymap.set(
				"n",
				"<leader>cd",
				"<cmd>Lspsaga show_cursor_diagnostics<CR>",
				{ noremap = true, silent = true, buffer = bufnr, desc = "[C]ursor [D]aignostic" }
			) -- show diagnostics for cursor
			keymap.set("n", "<leader>o", "<cmd>Lspsaga outline<CR>", opts) -- see outline on right hand side
		end

		local capabilities = require("cmp_nvim_lsp").default_capabilities() -- cmp capabilities

		-- not working, do not know why
		local handlers = {
			["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded"}),
			["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded"}),
		}

		lspconfig.pyright.setup({
			capabilities = capabilities,
			on_attach = on_attach,
			handlers = handlers,
		})

		lspconfig.lua_ls.setup({
			handlers = handlers,
			on_attach = on_attach,
			capabilities = capabilities,
			setting = {
				Lua = {
					workspace = {
						library = {
							[vim.fn.expand("$VIMRUNTIME/lua")] = true,
							[vim.fn.stdpath("config") .. "/lua"] = true,
						},
						checkThirdParty = false,
					},
					telemetry = { enable = false },
					diagnostics = {
						globals = { "vim" }, -- Get the language server to recognize the `vim` global
					},
					completion = {
						callSnippet = "Replace", --from neodev manual
					},
				},
			},
		})
		lspconfig.bashls.setup({
			handlers = handlers,
			on_attach = on_attach,
			-- capabilities = capabilities,
		})

		-- diagnostic settings
		vim.lsp.set_log_level('debug')
		vim.diagnostic.config({
			virtual_text = true,
			underline = false,
			severity_sort = true,
			update_in_insert = false,
			float = {
				focusable = false,
				style = "minimal",
				border = "rounded",
				source = true,
				header = "",
				prefix = "",
			},
		})
	end,
}
