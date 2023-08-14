return {
  -- {
  --   "rebelot/kanagawa.nvim",
  --   priority = 1000, -- make sure to load this before all the other start plugins
  --   config = function()
  --     vim.cmd.colorscheme 'kanagawa-wave'
  --   end
  -- },

  -- {
  --  'navarasu/onedark.nvim',
  --  priority = 1000, -- make sure to load this before all the other start plugins
  --  config = function()
  --    require('onedark').setup {
  --    style = 'warmer',
  --    transparent = false
  --    }
  --    require('onedark').load()
  --  end
  -- }

  {
    'morhetz/gruvbox',
    lazy = false,
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      vim.g.gruvbox_contrast_dark = 'soft'
      vim.cmd.colorscheme 'gruvbox'
      vim.cmd('highlight Cursor guibg=#83D87D')
      vim.cmd('highlight CursorLine guibg=#3E4F50')
      -- set the cursor blinking
      vim.cmd(
        "set guicursor=n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor,sm:block-blinkwait175-blinkoff150-blinkon175")
    end
  }

  -- set guicursor="n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor,sm:block-blinkwait175-blinkoff150-blinkon175"


  -- {
  --   'marko-cerovac/material.nvim',
  --   priority = 1000, -- make sure to load this before all the other start plugins
  --   init = function()
  --     vim.g.material_style = "darker"
  --     vim.cmd 'colorscheme material'
  --     vim.cmd "hi search guifg='#5e9b6f'"
  --     require('material.functions').toggle_eob()
  --   end,
  --   opt = {
  --     custom_highlights = {
  --       Search = { fg = '#5e9b6f' },
  --       -- CursorLine = { fg = colors.editor.constrast , underline = true },
  --     }
  --   }
  -- }

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
