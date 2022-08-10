local keymap = require('cosmic.keymap')
local nnoremap = keymap.nnoremap

nnoremap('<leader>e', ':lua vim.diagnostic.setqflist()<CR>')
