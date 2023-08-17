-- Autocompletion
return {
  'hrsh7th/nvim-cmp',
  dependencies = {
    -- Snippet Engine & its associated nvim-cmp source
    'L3MON4D3/LuaSnip',
    'saadparwaiz1/cmp_luasnip',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-cmdline',

    'hrsh8th/cmp-nvim-lsp',                                   -- Adds LSP completion capabilities
    'neovim/nvim-lspconfig',                                  -- LSP Configuration & Plugins
    'rafamadriz/friendly-snippets',                           -- Adds a number of user-friendly snippets

    { 'williamboman/mason.nvim', config = true },             -- Automatically install LSPs to stdpath for neovim
    'williamboman/mason-lspconfig.nvim',
    { 'j-hui/fidget.nvim',       tag = 'legacy', opts = {} }, -- Useful status updates for LSP
    'folke/neodev.nvim',                                      -- Additional lua configuration, makes nvim stuff amazing!
  },
  config = function()
    local cmp = require("cmp")
    local luasnip = require 'luasnip'
    require("luasnip/loaders/from_vscode").lazy_load()
    luasnip.config.setup {}
    vim.opt.completeopt = "menu,menuone,noselect"
    require("cmp").setup({
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      mapping = require("cmp").mapping.preset.insert {
        ["<C-u>"] = require("cmp").mapping.scroll_docs(-4),
        ["<C-d>"] = require("cmp").mapping.scroll_docs(4),
        -- ["<C-k>"] = require("cmp").mapping.complete(), -- show completion suggestions
        ["<C-c>"] = require("cmp").mapping.abort(), -- close completion window
        ["<CR>"] = require("cmp").mapping.confirm({ select = false }),
        ['<Tab>'] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif luasnip.expand_or_locally_jumpable() then
            luasnip.expand_or_jump()
          else
            fallback()
          end
        end, { 'i', 's' }),
        ['<S-Tab>'] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.locally_jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { 'i', 's' }),
      },
      sources = require("cmp").config.sources({ -- sources for autocompletion
        { name = "nvim_lsp" },                  -- lsp
        { name = "luasnip" },                   -- snippets
        { name = "buffer" },                    -- text within current buffer
        { name = "path" },                      -- file system paths
      }),

    })

    -- local capabilities = require('cmp_nvim_lsp').default_capabilities()
    -- require('lspconfig')['<black>'].setup {
    --   capabilities = capabilities
    -- }

    -- -- configure lspkind for vs-code like icons
    -- formatting = {
    --   format = require.("lspkind").cmp_format({
    --     maxwidth = 50,
    --     ellipsis_char = "...",
    --   }),
    -- }
  end
}
