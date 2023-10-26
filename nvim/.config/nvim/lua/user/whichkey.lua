local M = {
    'folke/which-key.nvim',
    event = 'VeryLazy'
}

function M.config()
    local mappings = {
        f = {
            name = '[f]ind',
            b = { '<cmd>Telescope buffers<cr>', '[b]uffer' },
            f = { '<cmd>Telescope find_files<cr>', '[f]iles' },
            s = { '<cmd>Telescope live_grep<cr>', '[s]tring' },
        },
    }

    local opts = {
        mode = 'n',
        prefix = '<leader>',
    }

    local wk = require('which-key')
    wk.setup {}

    wk.register(mappings, opts)
end

return M
