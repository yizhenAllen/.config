return
{
  'nvim-telescope/telescope.nvim',
  branch = '0.1.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    {
      'nvim-telescope/telescope-fzf-native.nvim',
      build = 'make',
      cond = function()
        return vim.fn.executable 'make' == 1
      end,
    },
  },
  opts = {
    defaults = {
      mappings = {
        i = {
          ['<C-k>'] = "preview_scrolling_up",
          ['<C-j>'] = "preview_scrolling_down",
          ['<C-u>'] = "results_scrolling_up",
          ['<C-d>'] = "results_scrolling_down",
        },
        n = {
          ['<C-k>'] = "preview_scrolling_up",
          ['<C-j>'] = "preview_scrolling_down",
          ['<C-u>'] = "results_scrolling_up",
          ['<C-d>'] = "results_scrolling_down",
        },
      },
    },
    pickers = {
      buffers = {
        initial_mode = "normal"
      }
    },
  },

  init = function()
    -- Enable telescope fzf native, if installed
    pcall(require('telescope').load_extension, 'fzf')

    vim.keymap.set('n', '<leader>so', require('telescope.builtin').oldfiles, { desc = '[S]earch recent [O]ld files' })
    vim.keymap.set('n', '<leader>sk', require('telescope.builtin').keymaps, { desc = '[S]earch [K]eymaps' })
    vim.keymap.set('n', '<leader>j', require('telescope.builtin').buffers,
      { desc = 'Find existing buffers' })
    vim.keymap.set('n', '<leader>/', function()
      require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
        winblend = 10,
        previewer = false,
      })
    end, { desc = 'Fuzzily search in current buffer' })
    vim.keymap.set('n', '<leader>gf', require('telescope.builtin').git_files, { desc = 'Search [G]it [F]iles' })
    vim.keymap.set('n', '<leader>sf', require('telescope.builtin').find_files, { desc = '[S]earch [F]iles' })
    vim.keymap.set('n', '<leader>sF', function() require('telescope.builtin').find_files({ search_dirs = { "~" } }) end,
      { desc = '[S]earch [F]iles from Home' })
    vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
    vim.keymap.set('n', '<leader>sw', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' })
    vim.keymap.set({ 'n', 'v' }, '<leader>sw', require('telescope.builtin').grep_string,
      { desc = '[S]earch current [W]ord' })
    vim.keymap.set('n', '<leader>sg', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' })
    vim.keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })
  end
}
