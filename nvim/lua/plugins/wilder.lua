return {
  'gelguy/wilder.nvim',
  -- provide selections for you when you are typing command/searching
  config = function()
    local wilder = require("wilder")
    wilder.setup({
      modes = { ':', '/', '?' },
      next_key = '<Right>',
      previous_key = '<Left>',
    })
  end,
}
