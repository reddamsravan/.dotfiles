local keymap = require('cosmic.keymap')

local nnoremap = keymap.nnoremap

nnoremap('<leader>ff', function()
    require('telescope.builtin').find_files()
end)

nnoremap('<leader>fb', function()
    require('telescope.builtin').buffers()
end)

nnoremap('<leader>fs', function()
    require('telescope.builtin').live_grep()
end)
