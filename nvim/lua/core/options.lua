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

-- avoid wrapping codes automaticly
opt.wrap = false

-- cursor line & highlight
opt.cursorline = true
vim.cmd('highlight CursorLine guibg=#3d4f39') -- will be covered by the colorscheme if put here

-- split to right and down
opt.splitbelow = true
opt.splitright = true

-- search
opt.ignorecase = true
opt.smartcase = true

-- appearance
opt.termguicolors = true
opt.signcolumn = "yes"

-- hide command line automatically
vim.cmd('set cmdheight=0')

vim.g.loaded_perl_provider = 0     -- do not use perl binding
vim.g.loaded_ruby_provider = 0     -- do not use ruby binding

opt.iskeyword:append({ "-", "_" }) -- see '-' as part of a word

--fold options
vim.o.foldenable = true
opt.foldmethod = "expr"
opt.foldexpr = "nvim_treesitter#foldexpr()" --use treesitter to fold
vim.o.foldlevel = 99
vim.o.foldlevelstart = 99
-- add following or files opened by telescope cannot be folded
vim.api.nvim_create_autocmd({ "BufEnter" }, { pattern = { "*" }, command = "normal zx" })
vim.keymap.set("n", "R", "za")

--language settings
vim.cmd("lan en_Us.UTF-8")

----------------------------------------------
-------------kickstart configes---------------
----------------------------------------------

vim.o.breakindent = true --preseving indent when wrap

-- inset indents
opt.autoindent = true
opt.smartindent = true
opt.backspace = "indent,eol,start"

-- Save undo history
vim.o.undofile = false

-- Decrease update time
vim.o.updatetime = 250
vim.o.timeoutlen = 300

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

----------------------------------------------
-------------kickstart keymaps---------------
----------------------------------------------
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

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
opt.list = false                   -- Show some invisible characters (tabs...
opt.pumblend = 10                  -- Popup blend
opt.pumheight = 10                 -- Maximum number of entries in a popupsopt.scrolloff = 4 -- Lines of context
opt.sessionoptions = { "buffers", "curdir", "tabpages", "winsize" }
opt.shiftround = true              -- Round indent
opt.shortmess:append({ W = true, I = true, c = true })
opt.showmode = false               -- Dont show mode since we have a statusline
opt.sidescrolloff = 8              -- Columns of context
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


----------------------------------------------
-------------lazyvim configes-----------------
----------------------------------------------
vim.bo.buflisted = true
