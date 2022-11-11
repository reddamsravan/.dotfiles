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
inoremap('\'', '\'\'<ESC>i')
inoremap('"', '""<ESC>i')
inoremap('(', '()<ESC>i')
inoremap('[', '[]<ESC>i')
inoremap('{', '{}<ESC>i')

-- Visual Mode
vnoremap('jk', '<esc>')
vnoremap('j', ":m '>+1<cr>gv=gv")
vnoremap('k', ":m '<-2<cr>gv=gv")

-- Visual block mode
vnoremap('<c-j>', '<Esc>:m .+1<cr>==gi')
vnoremap('<C-k>', '<Esc>:m .-2<CR>==gi')

