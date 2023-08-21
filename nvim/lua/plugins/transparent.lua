return {
	"xiyaowong/transparent.nvim",
	init = function()
		require("transparent").setup({
			groups = { -- table: default groups
				"Normal",
				"NormalNC",
				"Comment",
				"Constant",
				"Special",
				"Identifier",
				"Statement",
				"PreProc",
				"Type",
				"Underlined",
				"Todo",
				"String",
				"Function",
				"Conditional",
				"Repeat",
				"Operator",
				"Structure",
				"LineNr",
				"NonText",
				"SignColumn",
				-- "CursorLineNr",
				"EndOfBuffer",
				'UfoFoldedBg',
			},
			extra_groups = {
				"BufferLineTabClose",
				"BufferLineTabSeparatorSelected",
				"BufferLineTab",
				"BufferLineTabSeparator",
				"BufferLineModified",
				"BufferLineDevIconDefaultInactive",
				"BufferLineDevIconDefaultSelected",
				"BufferLineDevIconConfSelected",
				"BufferLineDevIconConf",
				"BufferLineDevIconLuaSelected",
				"BufferLineDevIconLuaInactive",
				"BufferLineDevIconLua",
				"BufferLineIndicatorVisible",
				"BufferLineIndicatorSelected",
				"BufferLineBufferSelected",
				"BufferLineBufferVisible",
				"BufferLineCloseButtonSelected",
				"BufferLineCloseButtonVisible",
				"BufferLineCloseButton",
				"BufferLineSeparatorSelected",
				"BufferLineSeparatorVisible",
				"BufferLineSeparator",
				"BufferLineBuffer",
				"BufferLineFill",
				"BufferLineBackground",
				"SignColumn",
				"Float",
				"Pmenu",
				"FloatShadow",
				"FloatShadowThrough",
				"NormalFloat",
			},
			exclude_groups = {},
		})
		vim.cmd("hi NormalFloat guibg=nil")
		vim.cmd("hi BufferLineDevIconConf guibg=nil")
		vim.cmd("hi BufferLineDevIconConf guibg=nil")
		vim.cmd("hi BufferLineDevIconConfInactive guibg=nil")
		vim.cmd("hi FloatBorder guibg=nil guifg=#f2e2c3")
		vim.cmd("hi GitGutterAdd ctermfg=142 ctermbg=237 guifg=#b8bb26 guibg=nil")
		vim.cmd("hi GitGutterDelete ctermfg=167 ctermbg=237 guifg=#fb4934 guibg=nil")
		vim.cmd("hi GitGutterChange ctermfg=108 ctermbg=237 guifg=#8ec07c guibg=nil")
		vim.cmd("hi GitGutterChangeDelete ctermfg=108 ctermbg=237 guifg=#8ec07c guibg=nil")
		vim.cmd("set pumblend=0")
		vim.cmd("hi BufferLineTabSelected cterm=bold,italic gui=bold,italic guifg=#ebdbb2 guibg=nil")
	end,
}
