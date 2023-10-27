local M = {
    'lewis6991/gitsigns.nvim',
    event = 'BufEnter',
}

function M.config()
    local icons = require('user.icons')
    require('gitsigns').setup {
        signs = {
            add = { text = icons.git.LineAdded },
            change = { text = icons.git.LineModified },
            delete = { text = icons.git.LineRemoved },
            topdelete = { text = icons.git.FileDeleted },
            changedelete = { text = icons.git.FileRenamed },
            untracked = { text = icons.git.FileUntracked },
        }
    }
end

return M
