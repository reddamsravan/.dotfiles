local M = {
    'nvim-treesitter/nvim-treesitter',
    event = { 'BufReadPost', 'BufNewFile' },
    build = ':TSUpdate',
    dependencies = {
        {
            'nvim-treesitter/nvim-treesitter-textobjects',
            event = 'VeryLazy',
        },
        {
            'JoosepAlviste/nvim-ts-context-commentstring',
            event = 'VeryLazy',
        },
        {
            'windwp/nvim-ts-autotag',
            event = 'VeryLazy',
        },
        {
            'windwp/nvim-autopairs',
            event = 'InsertEnter',
        },
    },
}

function M.config()
    require('nvim-treesitter.configs').setup {
        ensure_installed = { 'c', 'lua', 'vim', 'vimdoc', 'query' },
        ignore_install = { '' },
        sync_install = false,
        highlight = {
            enable = true,
            disable = { '' },
            additional_vim_regex_highlighting = false,
        },
        indent = { enable = true },
        autopairs = { enable = true },
        autotag = { enable = true },
        context_commentstring = {
            enable = true,
            enable_autocmd = false,
        },
        textobjects = {
            select = {
                enable = true,
                lookahead = true,
                keymaps = {
                    ['af'] = '@function.outer',
                    ['if'] = '@function.inner',
                },
            },
        },
    }
end

return M
