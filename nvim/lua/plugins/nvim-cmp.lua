-- Autocompletion
return {
  'hrsh7th/nvim-cmp',
  dependencies = {
    -- Snippet Engine & its associated nvim-cmp source
    'L3MON4D3/LuaSnip', -- luasnip settings
    {
      'saadparwaiz1/cmp_luasnip', -- luasnip cmp source
      dependencies = 'rafamadriz/friendly-snippets', -- Adds a number of user-friendly snippets 'saadparwaiz1/cmp_luasnip',
    },
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-buffer',

    'hrsh8th/cmp-nvim-lsp', -- Adds LSP completion capabilities

    "onsails/lspkind.nvim", -- vscode like-icons, format the lsp-cmp window
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

        -- super Tab
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
        { name = "luasnip" },                   -- snippets of lua
        { name = "buffer" },                    -- text within current buffer
        { name = "path" },                      -- file system paths
      }),

---@diagnostic disable-next-line: missing-fields
      formatting = {
        fields = {"abbr", "kind", "menu"},

        -- configure lspkind for vs-code like icons
        format = require("lspkind").cmp_format({
          mode = 'symbol_text', -- show only symbol annotations
          maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
          ellipsis_char = '...', -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)
          before = function (entry, vim_item)
            vim_item.menu = ({
              nvim_lsp = "[LSP]",
              nvim_lua = "[NVIM_LUA]",
              luasnip = "[Snippet]",
              buffer = "[Buffer]",
              path = "[Path]",
            })[entry.source.name]
            return vim_item
          end
        })
      },

      confirm_opts = {
        behavior = cmp.ConfirmBehavior.Replace,
        select = false,
      },
      window = {
        documentation = cmp.config.window.bordered(),
        completion = cmp.config.window.bordered({border = "rounded"}),
      },
      experimental = {
        ghost_text = false,
        native_menu = false,
      },
    })

  end
}
