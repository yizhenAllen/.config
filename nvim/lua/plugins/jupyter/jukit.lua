return {
--   "luk400/vim-jukit",
--   config = function()
--     vim.cmd([[nnoremap <leader>121 :call jukit#splits#show_last_cell_output(1)<cr>]])
--     vim.cmd([[nnoremap <leader>123 :call jukit#layouts#set_layout()<cr>]])
--     vim.keymap.set("n", "<leader>tp", ":JukitOut conda activate ")
--
--
--     vim.cmd([[let g:jukit_terminal="tmux"]])
--     vim.cmd([[let g:jukit_inline_plotting=0]])
--
--     vim.cmd [[hi jukit_textcell_bg_colors guibg=nil]]
--     -- vim.cmd [[let g:jukit_highlight_markers = 1]]
--     -- vim.cmd [[let g:jukit_enable_textcell_syntax = 1]]
--
--     vim.cmd([[let g:jukit_layout = {
--     \'split': 'horizontal',
--     \'p1': 0.4,
--     \'val': [
--         \'file_content',
--         \{
--             \'split': 'vertical',
--             \'p1': 0.6,
--             \'val': ['output', 'output_history']
--         \}
--     \]
-- \}]])
--   end,
}
