-- leader key
vim.g.mapleader = " "

-- set a alias
local keymap = vim.keymap

---------------------------------------------------
---------------- visual mode ----------------------
---------------------------------------------------
-- unmap space key in visual mode
-- vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

--unmap J when in visual mode
vim.keymap.set("v", "J", "j", { silent = true })
vim.keymap.set("v", "K", "k", { silent = true })

--stay in indent mode
keymap.set("v", "<", "<gv")
keymap.set("v", ">", ">gv")

keymap.set("v", "p", '"_dP') --don't copy when press p in visual mode

---------------------------------------------------
---------------- normal mode ----------------------
---------------------------------------------------

-- use "r" to undo rather than ctrl r
keymap.set("n", "r", "<C-r>")

-- split windows & navigation
keymap.set("n", "<leader>sl", "<C-w>v") -- vertically split
keymap.set("n", "<leader>sj", "<C-w>s") -- horizontally split
keymap.set("n", "<leader>sw", "<C-w>w") -- switch window focus

-- navigate between tabs
keymap.set("n", "<leader>h", "gT")
keymap.set("n", "<leader>l", "gt")

-- add semicolon at the end of the line
keymap.set("n", "<leader>;", "A;<Esc>")

-- no highlight
keymap.set("n", "<leader>n", ":nohl<cr>")

-- switch between buffers
keymap.set("n", "L", ":bnext<CR>")
keymap.set("n", "H", ":bprevious<CR>")

-- use leader q to quit buffer
keymap.set("n", "<leader>q", ":bd<CR>") -- used to quit a buffer
keymap.set("n", "<leader><leader>q", ":q<CR>") -- used to quit a window/pane

-- leader w to write
keymap.set("n", "<leader>w", ":w<cr>", { desc = "write" }) -- write current file

-- neotree
keymap.set("n", "<leader>k", ":Neotree<cr>") -- use when previewing windows
-- keymap.set("n", "<leader>e", ":Neotree toggle float dir=%:p:h<cr>")
keymap.set("n", "<leader>e", ":Neotree toggle float dir=%:p:h reveal reveal_force_cwd<cr>")

-- Resize Windows
keymap.set("n", "<C-Left>", "<C-w><")
keymap.set("n", "<C-Right>", "<C-w>>")
keymap.set("n", "<C-down>", "<C-w>+")
keymap.set("n", "<C-up>", "<C-w>-")
keymap.set("n", "<leader>=", "<C-w>=") -- balance the split windows
keymap.set("n", "<leader>st", "<C-w>T") -- grab split into a new tab

-- use maximizer
keymap.set("n", "<leader>m", ":MaximizerToggle<cr>")

--unmap space, and map j,k to gj,gk
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- yank current filepath
keymap.set("n", "<leader>yp", function()
	vim.cmd("let @+ = expand('%:p')")
end, { desc = "yank current filepath" })

--delete and paste
keymap.set("n", "<leader>d", "d^")
keymap.set("n", "<leader>y", "y^")

--do not yank when delete
keymap.set({ "n", "v" }, "x", '"_d')
keymap.set({ "n" }, "xx", '"_dd')
keymap.set({ "n" }, "X", '"_d$')
keymap.set({ "n" }, "<leader>x", '"_d^')

--use leader d to delete to the head
keymap.set("n", "<leader>d", "d^")
keymap.set("n", "<leader>c", "c^")

vim.keymap.set("n", "R", "za") -- use R to fold
vim.keymap.set("n", "t", "r") -- use t to replace

-- hold the cursor posi when press J
keymap.set("n", "J", "mzJ`z")

keymap.set("n", "n", "nzz")
keymap.set("n", "N", "Nzz")

-- virtual env
keymap.set("n", "<leader>se", ":PyLspActivateCondaEnv ")
