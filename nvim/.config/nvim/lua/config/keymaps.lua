-- Space is leader
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Disable the space key's default behavior in Normal and Visual modes
vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

local opts = { noremap = true, silent = true }

-- Insert mode jk to go to normal mode
vim.keymap.set("i", "jk", "<Esc>", opts)

-- Save
vim.keymap.set("n", "<C-s>", "<cmd> w <CR>", opts)
vim.keymap.set("i", "<C-s>", "<Esc><cmd> w <CR>", opts)

-- Close
vim.keymap.set("n", "<C-q>", "<cmd> q <CR>", opts)

-- Navigate between splits
vim.keymap.set("n", "<C-k>", ":wincmd k<CR>", opts)
vim.keymap.set("n", "<C-j>", ":wincmd j<CR>", opts)
vim.keymap.set("n", "<C-h>", ":wincmd h<CR>", opts)
vim.keymap.set("n", "<C-l>", ":wincmd l<CR>", opts)

-- Zoom in/out
vim.keymap.set('n', '<leader>zi', '<cmd> tab split<CR>', opts)
vim.keymap.set('n', '<leader>zo', '<cmd> tab close<CR>', opts)
