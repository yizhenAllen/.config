return {
	"akinsho/toggleterm.nvim",
	version = "*",
	opts = {
		size = 13,
		open_mapping = [[<c-t>]],
		hide_numbers = true,
		shade_filetypes = {},
		shade_terminals = false,
		shading_factor = 20,
		highlights = {
			-- Normal = { guibg = "none" },
		},
		start_in_insert = true,
		insert_mappings = true,
		persist_size = true,
		direction = "horizontal",
		close_on_exit = true,
		shell = vim.o.shell,
		float_opts = {
			width = 135,
			height = 40,
			border = "curved",
			winblend = 0,
			highlights = {
				border = "Normal",
				background = "Normal",
			},
		},
	},
	init = function()
		local Terminal = require("toggleterm.terminal").Terminal
		local lazygit = Terminal:new({ cmd = "lazygit", size = 20, direction = "float", hidden = true })
		function _LAZYGIT_TOGGLE()
			lazygit:toggle()
		end

		local jo = Terminal:new({ cmd = "joshuto", direction = "float", hidden = true })
		function _JOSHUTO()
			jo:toggle()
		end

		local python = Terminal:new({ cmd = "python", direction = "vertical", size = "30", hidden = true })
		function _PYTHON()
			python:toggle()
		end

		vim.keymap.set("n", "<leader>tl", function()
			vim.cmd("lua _LAZYGIT_TOGGLE()")
		end, { desc = "open lazygit" })
		vim.keymap.set("n", "<leader>tj", function()
			vim.cmd("lua _JOSHUTO()")
		end, { desc = "open joshuto" })
		-- vim.keymap.set("n", "<leader>tp", function()
		-- 	vim.cmd("lua _PYTHON()")
		-- end, { desc = "open python" })
		vim.keymap.set("n", "<leader>rp", function()
			vim.cmd("TermExec cmd='python -u %'")
		end, { desc = "run python" })
		vim.keymap.set("n", "<leader>rj", function()
			vim.cmd("TermExec cmd='javac % && java -cp %:h %:t:r'")
		end, { desc = "run python" })
		vim.keymap.set("n", "<leader>dS", function()
			vim.cmd("TermExec cmd='find /Users/yizhen/.local/share/nvim/sessions -type f -delete'")
		end, { desc = "delete session" })

		vim.keymap.set("t", "ii", [[<C-\><C-n>]], { desc = "move out the terminal" })
		vim.keymap.set("t", "<C-k>", [[<C-\><C-n><C-W>k]], { desc = "move out the terminal" })
		vim.keymap.set("t", "<C-h>", [[<C-\><C-n><C-W>h]], { desc = "move out the terminal" })
		vim.keymap.set("n", "<leader>t", ":ToggleTerm direction=float<cr>", { desc = "toggle float terminal" })
		-- vim.keymap.set(
		-- 	"n",
		-- 	"<leader>tp",
		-- 	":ToggleTerm direction=vertical size=70<cr>",
		-- 	{ desc = "toggle float terminal" }
		-- )
		vim.keymap.set(
			"n",
			"<leader>tc",
			":ToggleTerm dir=%:p:h direction=float<cr>",
			{ desc = "float terminal of current dir" }
		)
		vim.cmd("hi ToggleTerm1Normal guibg=nil")

		-- vim.keymap.set("n", "<leader>pp", "yip:ToggleTerm<cr><C-\\><C-n>pa<cr><cr>", { desc = "paste to terminal" })
		-- vim.keymap.set("v", "<leader>pp", "y:ToggleTerm<cr><C-\\><C-n>pa<cr><cr>", { desc = "paste to terminal" })
		vim.keymap.set(
			"n",
			"<leader>p",
			"yy<C-W>lpa<cr><cr>#########################################<cr><cr><C-\\><C-n><C-W>h",
			{ desc = "paste to terminal" }
		)
		vim.keymap.set(
			"v",
			"<leader>p",
			"y<C-W>lpa<cr><cr>#########################################<cr><cr><C-\\><C-n><C-W>h",
			{ desc = "paste to terminal" }
		)
	end,
}
