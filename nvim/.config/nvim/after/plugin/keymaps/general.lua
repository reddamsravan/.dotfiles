local keymap = require('cosmic.keymap')

local nnoremap = keymap.nnoremap
local inoremap = keymap.inoremap
local vnoremap = keymap.vnoremap
-- local xnoremap = keymap.xnoremap

-- Normal Mode
nnoremap('<leader>q', ':q<CR>')
nnoremap('<leader>w', ':w<CR>')

nnoremap('<C-h>', '<C-w>h')
nnoremap('<C-j>', '<C-w>j')
nnoremap('<C-k>', '<C-w>k')
nnoremap('<C-l>', '<C-w>l')

nnoremap('<C-n>', ':bnext<CR>')
nnoremap('<C-p>', ':bprevious<CR>')

nnoremap('J', ':m .+1<CR>==')
nnoremap('K', ':m .-2<CR>==')

-- Insert Mode
inoremap('jk', '<ESC>')
vnoremap('<C-j>', '<Esc>:m .+1<CR>==gi')
vnoremap('<C-k>', '<Esc>:m .-2<CR>==gi')

-- Visual Mode
vnoremap('J', ":m '>+1<CR>gv=gv")
vnoremap('K', ":m '<-2<CR>gv=gv")

-- Visual Block Mode

