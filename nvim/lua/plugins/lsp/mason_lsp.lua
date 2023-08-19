return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
    "folke/neodev.nvim",
    "nvimdev/lspsaga.nvim"
  },
  config = function()
    require("mason").setup()
    require("mason-lspconfig").setup {
      ensure_installed = { "lua_ls", "pyright", "bashls" },
      automatic_installation = false,
    }
    require("lspsaga").setup({
      -- keybinds for navigation in lspsaga window
      scroll_preview = { scroll_down = "<C-f>", scroll_up = "<C-b>" },
      -- use enter to open file with definition preview
      definition = {
        edit = "<CR>",
      },
      ui = {
        colors = {
          normal_bg = "#022746",
        },
      },
    })
    local lspconfig = require('lspconfig')
    -- Add additional capabilities supported by nvim-cmp
    local capabilities = require('cmp_nvim_lsp').default_capabilities()
    require("neodev").setup({})

    lspconfig.pyright.setup {
      capabilities = capabilities,
    }
    lspconfig.lua_ls.setup {
      capabilities = capabilities,
      setting = {
        Lua = {
          workspace = {
            library = {
              [vim.fn.expand('$VIMRUNTIME/lua')] = true,
              [vim.fn.stdpath("config") .. "/lua"] = true,
            },
            checkThirdParty = false
          },
          telemetry = { enable = false },
          diagnostics = {
            globals = { 'vim' }, -- Get the language server to recognize the `vim` global
          },
          completion = {
            callSnippet = "Replace" --from neodev manual
          },
        },
      }
    }
    lspconfig.bashls.setup {
      capabilities = capabilities,
    }

    -- vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
    -- vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
    -- vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
    -- vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)
  end
}
