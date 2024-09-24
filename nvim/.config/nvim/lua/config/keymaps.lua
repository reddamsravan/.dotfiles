-- Space is leader
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Disable the spacebar key's default behavior in Normal and Visual modes
vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

local opts = { noremap = true, silent = true }

-- insert mode jk to go to normal mode
vim.keymap.set("i", "jk", "<Esc>", opts)

-- save
vim.keymap.set("n", "<C-s>", "<cmd> w <CR>", opts)

-- close
vim.keymap.set("n", "<C-q>", "<cmd> q <CR>", opts)

-- Navigate between splits
vim.keymap.set("n", "<C-k>", ":wincmd k<CR>", opts)
vim.keymap.set("n", "<C-j>", ":wincmd j<CR>", opts)
vim.keymap.set("n", "<C-h>", ":wincmd h<CR>", opts)
vim.keymap.set("n", "<C-l>", ":wincmd l<CR>", opts)
