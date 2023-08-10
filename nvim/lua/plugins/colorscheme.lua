return{
  -- {
  --   "rebelot/kanagawa.nvim",
  --   priority = 1000, -- make sure to load this before all the other start plugins
  --   config = function()
  --     vim.cmd.colorscheme 'kanagawa-wave'
  --   end
  -- },

  --{
  --  'navarasu/onedark.nvim',
  --  priority = 1000, -- make sure to load this before all the other start plugins
  --  config = function()
  --    require('onedark').setup {
  --    style = 'warmer',
  --    transparent = false
  --    }
  --    require('onedark').load()
  --  end
  --}

  {
    'marko-cerovac/material.nvim',
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      vim.g.material_style = "darker"
      vim.cmd 'colorscheme material'
      lualine_style = "default"
    end
  }

--------     {
--------     -- Set lualine as statusline
--------     'nvim-lualine/lualine.nvim',
--------     -- See `:help lualine.txt`
--------     opts = {
--------       options = {
--------         icons_enabled = true,
--------         theme = 'nightfly',
--------         component_separators = '|',
--------         section_separators = '',
--------       },
--------     },
--------   },

}
