local M = {
    'nvim-telescope/telescope.nvim',
    dependencies = {
        'nvim-lua/plenary.nvim',
        { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make', lazy = true },
    },
}

function M.config()
    require('telescope').setup {}
end

return M
