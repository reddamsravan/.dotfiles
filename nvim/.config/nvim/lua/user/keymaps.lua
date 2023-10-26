vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

keymap('n', '<Space>', '<Nop>', opts)
-- Better window navigation
keymap('n', '<C-h>', '<C-w>h', opts)
keymap('n', '<C-j>', '<C-w>j', opts)
keymap('n', '<C-k>', '<C-w>k', opts)
keymap('n', '<C-l>', '<C-w>l', opts)
