local M = {
    'nvim-lualine/lualine.nvim',
    lazy = false,
    priority = 1000
}

function M.config()
    local lualine = require('lualine')

    lualine.setup {
        options = {
            theme = 'auto',
            component_separators = { left = '', right = ''},
            section_separators = { left = '', right = ''},
            globalstatus = true,
        }
    }
end

return M
