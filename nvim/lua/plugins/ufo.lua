return {
  "kevinhwang91/nvim-ufo",
  dependencies = "kevinhwang91/promise-async",
  event = "BufRead",
  opts = {
    provider_selector = function()
    vim.keymap.set('n', 'zR', require('ufo').openAllFolds)
    vim.keymap.set('n', 'zM', require('ufo').closeAllFolds)
      return { 'treesitter', 'indent' }
    end,
    close_all_kinds = {'imports'},
  },
}
