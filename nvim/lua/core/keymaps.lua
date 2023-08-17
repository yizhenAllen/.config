-- leader key
vim.g.mapleader = " "

-- set a alias
local keymap = vim.keymap

---------------------------------------------------
---------------- visual mode ----------------------
---------------------------------------------------
keymap.set("v", "J", "j") -- get rid of moving line when select

-- unmap space key in visual mode
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

--stay in indent mode
keymap.set("v", "<", "<gv")
keymap.set("v", ">", ">gvi")

keymap.set("v", "p", '"_dP') --don't copy when press p in visual mode

--move text up and down in visual mode
keymap.set("v", "<C-j>", ":move '>+1<CR>gv-gv", opts)
keymap.set("v", "<C-k>", ":move '<-2<CR>gv-gv", opts)

---------------------------------------------------
---------------- normal mode ----------------------
---------------------------------------------------

-- use "r" to undo rather than ctrl r
keymap.set("n", "r", "<C-r>")

-- split windows & navigation
keymap.set("n", "<leader>sl", "<C-w>v") -- vertically split
keymap.set("", "<leader>sj", "<C-w>s")  -- horizontally split

-- navigate between tabs
keymap.set("n", "<leader>h", "gt")
keymap.set("n", "<leader>l", "gT")

-- no highlight
keymap.set("n", "<leader>n", ":nohl<cr>")

-- switch between buffers
keymap.set("n", "L", ":bnext<CR>")
keymap.set("n", "H", ":bprevious<CR>")

-- use leader q to quit buffer
keymap.set("n", "<leader>q", ":bd<CR>") -- used to quit a window/pane without saving

-- leader w to write
keymap.set("n", "<leader>w", ":w<cr>", { desc = "write" }) -- write current file

-- plugins
-- keymap.set("n", "<leader>e", ":Neotree toggle reveal_force_cwd<cr>")
keymap.set("n", "<leader>e", ":Neotree toggle float dir=%:p:h reveal reveal_force_cwd<cr>")

-- Resize Windows
keymap.set("n", "<C-Left>", "<C-w><")
keymap.set("n", "<C-Right>", "<C-w>>")
keymap.set("n", "<C-down>", "<C-w>+")
keymap.set("n", "<C-up>", "<C-w>-")
keymap.set("n", "<leader>=", "<C-w>=")
keymap.set("n", "<leader>st", "<C-w>T") -- grab split into a new tab
-- use maximizer
keymap.set("n", "<leader>m", ":MaximizerToggle<cr>")

--unmap space, and map j,k to gj,gk
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- yank current filepath
keymap.set("n", "<leader>yp", function() vim.cmd("let @+ = expand('%:p')") end, { desc = "yank current filepath" })

--increment and decrement numbers
keymap.set("n", "<leader>+", "<C-a>")
keymap.set("n", "<leader>-", "<C-x>")

--delete and paste keymap.set("n", "<leader>d", "d^")
keymap.set("n", "<leader>y", "y^")

--do not yank when delete
keymap.set({ "n", "v" }, "x", '"_d')
keymap.set({ "n", "v" }, "xx", '"_dd')
keymap.set({ "n", "v" }, "X", '"_d$')
keymap.set({ "n", "v" }, "<leader>x", '"_d^')

vim.keymap.set("n", "<leader>r", "za") -- use <leader>r to fold
vim.keymap.set("n", "R", "za") -- use <leader>r to fold
