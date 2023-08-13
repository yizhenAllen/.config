return {
  'keaising/im-select.nvim',
  config = function()
    require('im_select').setup {
      default_im_select = "com.baidu.inputmethod.BaiduIM.pinyin"
    }
  end
}
