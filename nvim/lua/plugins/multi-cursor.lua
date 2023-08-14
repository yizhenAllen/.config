return {
  "mg979/vim-visual-multi",
  branch = "master",
  event = "VeryLazy",
  init = function()
    vim.g.VM_maps = {
      -- ["Find Under"] = "<C-f>",
      -- ["Find Under"] = "",
      -- ["Find Sub Word"] = "",
      ["Add Cursor Down"] = "",
      ["Add Cursor Up"] = "",
    }
    vim.keymap.set(
      { "n" },
      "<c-s-j>",
      ":call vm#commands#add_cursor_down(0, v:count1)<cr>",
      { noremap = true, silent = true }
    )
    vim.keymap.set(
      { "n" },
      "<c-s-k>",
      ":call vm#commands#add_cursor_up(0, v:count1)<cr>",
      { noremap = true, silent = true }
    )
    -- vim.keymap.set(
    --   { "n" },
    --   "<c-down>",
    --   "",
    --   { noremap = true, silent = true }
    -- )
    -- vim.keymap.set(
    --   { "n" },
    --   "<c-up>",
    --   "",
    --   { noremap = true, silent = true }
    -- )
  end,
}
