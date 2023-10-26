local M = {
    'williamboman/mason-lspconfig.nvim',
    dependencies = {
        'williamboman/mason.nvim',
    },
}

M.servers = {
    'lua_ls',
    'html',
    'tsserver',
    'gopls',
}

function M.config()
    require('mason').setup {
        ui = {
            border = 'rounded',
        },
    }

    require('mason-lspconfig').setup {
        ensure_installed = M.servers,
    }
end

return M
