-- when open a file, let nvim right at the position where the lastest change of this file happened.

vim.cmd [[
  autocmd BufReadPost * if @% !~# '\.git[\/\\]COMMIT_EDITMSG$' && line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
]]

local opt = vim.opt

-- use mouse
opt.mouse:append("a")

-- system clipboard
opt.clipboard:append("unnamedplus")

-- line number
opt.relativenumber = true
opt.number = true
-- indentation
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true

-- avoid wrapping codes automaticly
opt.wrap = false

-- cursor line
opt.cursorline = true

-- split to right and down
opt.splitbelow = true
opt.splitright = true

-- search
opt.ignorecase = true
opt.smartcase = true

-- appearance
opt.termguicolors = true
opt.signcolumn = "yes"

-- fold method, can be set to syntax but need additional config
-- opt.foldenable = false
-- opt.foldmethod = "syntax"
-- opt.foldexpr = "nvim_treesitter#foldexpr()"
-- opt.foldlevel = 0

----------------------------------------------
-------------kickstart configes---------------
----------------------------------------------

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = false

-- Decrease update time
vim.o.updatetime = 250
vim.o.timeoutlen = 300

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'


----------------------------------------------
-------------lazyvim configes-----------------
----------------------------------------------

opt.autowrite = true           -- Enable auto write
opt.completeopt = "menu,menuone,noselect"
opt.conceallevel = 3           -- Hide * markup for bold and italic
opt.confirm = true             -- Confirm to save changes before exiting modified buffers
opt.expandtab = true           -- Use spaces instead of tabs
opt.formatoptions = "jcroqlnt" -- tcqj
opt.grepformat = "%f:%l:%c:%m"
opt.grepprg = "rg --vimgrep"
opt.laststatus = 0
opt.list = false                    -- Show some invisible characters (tabs...
opt.pumblend = 10                  -- Popup blend
opt.pumheight = 10                 -- Maximum number of entries in a popupsopt.scrolloff = 4 -- Lines of context
opt.sessionoptions = { "buffers", "curdir", "tabpages", "winsize" }
opt.shiftround = true              -- Round indent
opt.shortmess:append({ W = true, I = true, c = true })
opt.showmode = false               -- Dont show mode since we have a statusline
opt.sidescrolloff = 8              -- Columns of context
opt.smartindent = true             -- Insert indents automatically
opt.spelllang = { "en" }
opt.tabstop = 2                    -- Number of spaces tabs count for
opt.undolevels = 10000
opt.wildmode = "longest:full,full" -- Command-line completion mode
opt.winminwidth = 5                -- Minimum window width

if vim.fn.has("nvim-0.9.0") == 1 then
  opt.splitkeep = "screen"
  opt.shortmess:append({ C = true })
end

-- Fix markdown indentation settings
vim.g.markdown_recommended_style = 0
