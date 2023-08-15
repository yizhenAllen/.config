return {
  'akinsho/toggleterm.nvim',
  version = "*",
  -- opts = true,
  opts = {
    size = 13,
    open_mapping = [[<c-t>]],
    hide_numbers = true,
    shade_filetypes = {},
    shade_terminals = true,
    shading_factor = 2,
    start_in_insert = true,
    insert_mappings = true,
    persist_size = true,
    direction = "horizontal",
    close_on_exit = true,
    shell = vim.o.shell,
    float_opts = {
      border = "curved",
      winblend = 0,
      highlights = {
        border = "Normal",
        background = "Normal",
      },
    },
  },
  init = function()
    function _G.set_terminal_keymaps()
      local opts = { noremap = true }
      -- vim.api.nvim_buf_set_keymap(0, 't', '<esc>', [[<C-\><C-n>]], opts)
      vim.api.nvim_buf_set_keymap(0, 't', '<C-h>', [[<C-\><C-n><C-W>h]], opts)
      vim.api.nvim_buf_set_keymap(0, 't', '<C-j>', [[<C-\><C-n><C-W>j]], opts)
      vim.api.nvim_buf_set_keymap(0, 't', '<C-k>', [[<C-\><C-n><C-W>k]], opts)
      vim.api.nvim_buf_set_keymap(0, 't', '<C-l>', [[<C-\><C-n><C-W>l]], opts)
    end
    local Terminal = require("toggleterm.terminal").Terminal
    local lazygit = Terminal:new({ cmd = "lazygit", size = 20, direction = "float", hidden = true })
    function _LAZYGIT_TOGGLE()
      lazygit:toggle()
    end

    local jo = Terminal:new({ cmd = "joshuto", direction = "float", hidden = true })
    function _JOSHUTO()
      jo:toggle()
    end

    local python = Terminal:new({ cmd = "python", direction = "float", hidden = true })
    function _PYTHON()
      python:toggle()
    end
    vim.keymap.set("n", "<leader>tl", function() vim.cmd("lua _LAZYGIT_TOGGLE()") end, { desc = "open lazygit" })
    vim.keymap.set("n", "<leader>tj", function() vim.cmd("lua _JOSHUTO()") end, { desc = "open joshuto" })
    vim.keymap.set("n", "<leader>tp", function() vim.cmd("lua _PYTHON()") end, { desc = "open python" })
    vim.keymap.set("n", "<leader>rp", function() vim.cmd("TermExec cmd='python -u %'") end, { desc = "run python" })
    vim.keymap.set("n", "<leader>dS", function() vim.cmd("TermExec cmd='rm /Users/yizhen/.local/share/nvim/sessions/*'") end, { desc = "delete session" })
  end,
}
