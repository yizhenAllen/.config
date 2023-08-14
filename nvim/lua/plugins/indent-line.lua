return
{
  -- Add indentation guides even on blank lines
  'lukas-reineke/indent-blankline.nvim',
  -- See `:help indent_blankline.txt`
  opts = {
    char = '┊',
    show_trailing_blankline_indent = false,
    show_current_context = true,
  },
  -- init = function()
  --   vim.g.indent_blankline_show_current_context_start = "v:true"
  --   vim.cmd [[highlight IndentBlanklineContextStart guisp=#00FF00 gui=underline]]
  -- end
}
