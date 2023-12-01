local M = {
    'lewis6991/gitsigns.nvim',
    event = 'BufEnter',
    dependencies = {
        'tpope/vim-fugitive',
    },
}

function M.config()
    require('gitsigns').setup({
        signs = {
            add = { text = '+' },
            change = { text = '~' },
            delete = { text = '-' },
            topdelete = { text = '‾' },
            changedelete = { text = '~' },
            untracked = { text = '┆' },
        },
    })
end

return M
