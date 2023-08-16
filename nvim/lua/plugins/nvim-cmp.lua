return
-- Autocompletion
{
  'hrsh7th/nvim-cmp',
  dependencies = {
    -- Snippet Engine & its associated nvim-cmp source
    'L3MON4D3/LuaSnip',
    'saadparwaiz1/cmp_luasnip',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-buffer',

    -- Adds LSP completion capabilities
    'hrsh7th/cmp-nvim-lsp',

  -- LSP Configuration & Plugins
    'neovim/nvim-lspconfig',

    -- Adds a number of user-friendly snippets
    'rafamadriz/friendly-snippets',

    -- Automatically install LSPs to stdpath for neovim
    { 'williamboman/mason.nvim', config = true },
    'williamboman/mason-lspconfig.nvim',

    -- Useful status updates for LSP
    { 'j-hui/fidget.nvim', tag = 'legacy', opts = {} },

    -- Additional lua configuration, makes nvim stuff amazing!
    'folke/neodev.nvim',
  },
  config = function()
    require("luasnip/loaders/from_vscode").lazy_load()

    vim.opt.completeopt = "menu,menuone,noselect"

    require("cmp").setup({
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      mapping = require("cmp").mapping.preset.insert({
        -- ["<C-k>"] = require("cmp").mapping.select_prev_item(), -- previous suggestion
        -- ["<C-j>"] = require("cmp").mapping.select_next_item(), -- next suggestion
        ["<C-u>"] = require("cmp").mapping.scroll_docs(-4),
        ["<C-d>"] = require("cmp").mapping.scroll_docs(4),
        -- ["<C-k>"] = require("cmp").mapping.complete(), -- show completion suggestions
        ["<C-c>"] = require("cmp").mapping.abort(), -- close completion window
        ["<CR>"] = require("cmp").mapping.confirm({ select = false }),
      }),
      -- sources for autocompletion
      sources = require("cmp").config.sources({
        { name = "nvim_lsp" }, -- lsp
        { name = "luasnip" }, -- snippets
        { name = "buffer" }, -- text within current buffer
        { name = "path" }, -- file system paths
      }),

      -- configure lspkind for vs-code like icons
      -- formatting = {
      --   format = require("lspkind").cmp_format({
      --     maxwidth = 50,
      --     ellipsis_char = "...",
      --   }),
      -- },
    })
  end,
}
