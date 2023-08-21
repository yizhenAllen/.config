return{
  'HallerPatrick/py_lsp.nvim',
  config = function ()
    require'py_lsp'.setup {
      host_python = "/opt/homebrew/Caskroom/miniconda/base/bin/python",
      -- default_venv_name = ".venv" -- For local venv
    }
  end
}
