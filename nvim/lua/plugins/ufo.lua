
return {
  "kevinhwang91/nvim-ufo",
  dependencies = "kevinhwang91/promise-async",
  event = "BufRead",
  config = function()
    local handler = function(virtText, lnum, endLnum, width, truncate)
      local newVirtText = {}
      local suffix = (' 📌 %d '):format(endLnum - lnum)
      local sufWidth = vim.fn.strdisplaywidth(suffix)
      local targetWidth = width - sufWidth
      local curWidth = 0
      for _, chunk in ipairs(virtText) do
        local chunkText = chunk[1]
        local chunkWidth = vim.fn.strdisplaywidth(chunkText)
        if targetWidth > curWidth + chunkWidth then
          table.insert(newVirtText, chunk)
        else
          chunkText = truncate(chunkText, targetWidth - curWidth)
          local hlGroup = chunk[2]
          table.insert(newVirtText, {chunkText, hlGroup})
          chunkWidth = vim.fn.strdisplaywidth(chunkText)
          -- str width returned from truncate() may less than 2nd argument, need padding
          if curWidth + chunkWidth < targetWidth then
            suffix = suffix .. (' '):rep(targetWidth - curWidth - chunkWidth)
          end
          break
        end
        curWidth = curWidth + chunkWidth
      end
      table.insert(newVirtText, {suffix, 'MoreMsg'})
      return newVirtText
    end
    local ftMap = {
      python = ''
    }
  require('ufo').setup({
    provider_selector = function(bufnr, filetype)
        return ""
    end,
    -- provider_selector = function(bufnr, filetype, buftype)
    --   return { 'treesitter', 'indent' }
    -- end,
    close_fold_kinds = { '' },
    fold_virt_text_handler = handler
    }
    )
    -- vim.keymap.set('n', 'zR', require('ufo').openAllFolds)
    -- vim.keymap.set('n', 'zM', require('ufo').closeAllFolds)
  end,
}
