local M = {
    'neovim/nvim-lspconfig',
    dependencies = {

        -- Additional lua configuration, makes nvim stuff amazing!
        'folke/neodev.nvim',
        'nvimtools/none-ls.nvim',

        -- Useful status updates for LSP
        -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
        { 'j-hui/fidget.nvim', opts = {} },

        -- Automatically install LSPs to stdpath for neovim
        {
            'williamboman/mason.nvim',
            dependencies = {
                'williamboman/mason-lspconfig.nvim',
            },
        },

        -- LSP auto completions
        {
            'hrsh7th/cmp-nvim-lsp',
        },
    },
}

function M.config()
    require('neodev').setup()

    local null_ls = require('null-ls')

    null_ls.setup({
        sources = {
            null_ls.builtins.formatting.stylua,
            null_ls.builtins.diagnostics.eslint,
            null_ls.builtins.completion.spell,
        },
    })

    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

    require('mason').setup()
    require('mason-lspconfig').setup()
    require('mason-lspconfig').setup_handlers({
        function(server_name)
            require('lspconfig')[server_name].setup({
                capabilities = capabilities,
            })
        end,
    })

    -- Global mappings.
    -- See `:help vim.diagnostic.*` for documentation on any of the below functions
    vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
    vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
    vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
    vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)

    -- Use LspAttach autocommand to only map the following keys
    -- after the language server attaches to the current buffer
    vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('UserLspConfig', {}),
        callback = function(ev)
            -- Buffer local mappings.
            -- See `:help vim.lsp.*` for documentation on any of the below functions
            local opts = { buffer = ev.buf }
            vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
            vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
            vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
            vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
            vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
            vim.keymap.set(
                'n',
                '<space>wa',
                vim.lsp.buf.add_workspace_folder,
                opts
            )
            vim.keymap.set(
                'n',
                '<space>wr',
                vim.lsp.buf.remove_workspace_folder,
                opts
            )
            vim.keymap.set('n', '<space>wl', function()
                print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
            end, opts)
            vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
            vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
            vim.keymap.set(
                { 'n', 'v' },
                '<space>ca',
                vim.lsp.buf.code_action,
                opts
            )
            vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)

            -- Create a command `:Format` local to the LSP buffer
            vim.api.nvim_buf_create_user_command(ev.buf, 'Format', function(_)
                vim.lsp.buf.format()
            end, { desc = 'Format current buffer with LSP' })
        end,
    })
end

return M
