return {
  'rmagatti/auto-session',
  opts = {
    log_level = "error",
    cwd_change_handling = {
      post_cwd_changed_hook = function() -- example refreshing the lualine status line _after_ the cwd changes
        require("lualine").refresh()     -- refresh lualine so the new session name is displayed in the status bar
      end,
    },
  },
}
