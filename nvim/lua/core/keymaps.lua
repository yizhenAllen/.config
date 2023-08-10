-- leader key
vim.g.mapleader = " "

-- set a alias
local keymap = vim.keymap


---------------------------------------------------
---------------- visual mode ----------------------
---------------------------------------------------

-- use "J" and "K" to move lines in visual mode
keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")

---------------------------------------------------
---------------- normal mode ----------------------
---------------------------------------------------

-- use "r" to undo rather than ctrl r
keymap.set("n", "r", "<C-r>")

-- split windows & navigation
keymap.set("n", "<leader>sl", "<C-w>v") -- 水平新增窗口
keymap.set("", "<leader>sj", "<C-w>s")  -- 垂直新增窗口

-- navigate between panes
keymap.set("n", "<C-h>", "<C-w>h")
keymap.set("n", "<C-l>", "<C-w>l")
keymap.set("n", "<C-j>", "<C-w>j")
keymap.set("n", "<C-k>", "<C-w>k")

-- no highlight
keymap.set("n", "<C-n>", ":nohl<CR>")

-- switch between buffers
keymap.set("n", "L", ":bnext<CR>")
keymap.set("n", "H", ":bprevious<CR>")

-- use Q and <leader>q to quit a pane
-- keymap.set("n", "<leader>q", ":bd | bprev<CR>") -- used to quit a window/pane without saving
-- keymap.set("n", "<leader>Q", ":q!<CR>") -- used to quit a window/pane without saving
-- keymap.set("n", "Q", ":wq<CR>")         -- used to save and quit a window/pane normally

-- -- use R to fold
-- keymap.set("n", "R", "za")

-- use S to save
keymap.set("n", "S", ":w<CR>")

-- plugins
keymap.set("n", "<leader>e", ":Neotree toggle reveal_force_cwd<cr>")
