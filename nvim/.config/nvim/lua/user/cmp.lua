local M = {
    'hrsh7th/nvim-cmp',
    dependencies = {
        {
            'hrsh7th/cmp-nvim-lsp',
            event = 'InsertEnter',
        },
        {
            'hrsh7th/cmp-buffer',
            event = 'InsertEnter',
        },
        {
            'hrsh7th/cmp-path',
            event = 'InsertEnter',
        },
        {
            'hrsh7th/cmp-cmdline',
            event = 'InsertEnter',
        },
        {
            'saadparwaiz1/cmp_luasnip',
            event = 'InsertEnter',
        },
        {
            'hrsh7th/cmp-nvim-lua',
            event = 'InsertEnter',
        },
        {
            'L3MON4D3/LuaSnip',
            event = 'InsertEnter',
            dependencies = {
                'rafamadriz/friendly-snippets',
            },
        },
    },
}

function M.config()
    local cmp = require('cmp')
    local luasnip = require('luasnip')

    require('luasnip/loaders/from_vscode').lazy_load()
    luasnip.config.setup({})

    local has_words_before = function()
        unpack = unpack or table.unpack
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0
            and vim.api
                    .nvim_buf_get_lines(0, line - 1, line, true)[1]
                    :sub(col, col)
                    :match('%s')
                == nil
    end

    cmp.setup({
        snippet = {
            expand = function(args)
                luasnip.lsp_expand(args.body)
            end,
        },
        completion = {
            completeopt = 'menu,menuone,noinsert',
        },
        mapping = cmp.mapping.preset.insert({
            ['<C-n>'] = cmp.mapping.select_next_item(),
            ['<C-p>'] = cmp.mapping.select_prev_item(),
            ['<C-d>'] = cmp.mapping.scroll_docs(-4),
            ['<C-f>'] = cmp.mapping.scroll_docs(4),
            ['<C-Space>'] = cmp.mapping.complete({}),
            ['<CR>'] = cmp.mapping.confirm({
                behavior = cmp.ConfirmBehavior.Replace,
                select = true,
            }),
            ['<Tab>'] = cmp.mapping(function(fallback)
                if cmp.visible() then
                    if #cmp.get_entries() == 1 then
                        cmp.confirm({ select = true })
                    else
                        cmp.select_next_item()
                    end
                elseif luasnip.expand_or_locally_jumpable() then
                    luasnip.expand_or_jump()
                elseif has_words_before() then
                    cmp.complete()
                    if #cmp.get_entries() == 1 then
                        cmp.confirm({ select = true })
                    end
                else
                    fallback()
                end
            end, { 'i', 's' }),
            ['<S-Tab>'] = cmp.mapping(function(fallback)
                if cmp.visible() then
                    cmp.select_prev_item()
                elseif luasnip.locally_jumpable(-1) then
                    luasnip.jump(-1)
                else
                    fallback()
                end
            end, { 'i', 's' }),
        }),
        sources = {
            { name = 'nvim_lsp' },
            { name = 'luasnip' },
            { name = 'path' },
            { name = 'buffer' },
        },
    })

    cmp.setup.cmdline({ '/', '?' }, {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
            { name = 'buffer' },
        },
    })

    cmp.setup.cmdline(':', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
            { name = 'path' },
        }, {
            { name = 'cmdline' },
        }),
    })
end

return M
