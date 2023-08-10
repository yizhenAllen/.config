return{
  'akinsho/bufferline.nvim', requires = 'nvim-tree/nvim-web-devicons',
   config = function()
     vim.opt.termguicolors = true
     require("bufferline").setup{}
   end
}
