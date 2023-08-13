return {
  'gelguy/wilder.nvim',
  config = function()
    local wilder = require("wilder")
    wilder.setup({
      modes = { ':', '/', '?' },
      next_key = '<Right>',
      previous_key = '<Left>',
    })
  end,
}
