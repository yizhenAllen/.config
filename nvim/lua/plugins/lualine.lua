return
{
  'nvim-lualine/lualine.nvim',
  config = function()
      require('lualine').setup({
    options = {
      icons_enabled = true,
      transparent = false,
      theme = 'auto',
      -- component_separators = '',
      -- section_separators = '',
      -- component_separators = { left = '', right = '' },
      -- section_separators = { left = '', right = '' },
    },
    sections = {
      lualine_a = { 'mode' },
      lualine_b = { 'branch', 'diff', 'diagnostics' },
      lualine_c = {
        {
          'filename',
          file_status = true, -- displays file status (readonly status, modified status)
          path = 1            -- 0 = just filename, 1 = relative path, 2 = absolute path
        }
      }
    }
  })
   -- vim.cmd("hi lualine_c_normal guibg=nil")
  end
}
