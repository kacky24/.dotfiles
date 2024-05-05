local config = function()
    local cmp = require('cmp')
    local lspkind = require('lspkind')
    cmp.setup({
        snippet = {
            expand = function(args)
                vim.fn['vsnip#anonymous'](args.body)
            end,
        },
        mapping = {
            ['<C-n>'] = cmp.mapping.select_next_item(),
            ['<C-m>'] = cmp.mapping.select_prev_item(),
            ['<C-,>'] = cmp.mapping.complete(),
            ['<C-e>'] = cmp.mapping.close(),
            ['<CR>'] = cmp.mapping.confirm({
                select = true,
            }),
        },
        sources = {
            { name = 'nvim_lsp' },
            { name = 'buffer' },
            { name = 'path' },
            { name = 'vsnip' },
        },
        experimental = {
            ghost_text = false,
        },
        --LspKind(icon)を設定
        formatting = {
            format = lspkind.cmp_format({
                mode = 'symbol_text',
                maxwidth = 50,
                ellipsis_char = '...',
                show_labelDetails = true,
            })
        },
    })
end

local plugin = {
    'hrsh7th/nvim-cmp',
    dependencies = {
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-path',
        'hrsh7th/vim-vsnip',
        'hrsh7th/cmp-vsnip',
        'onsails/lspkind.nvim',
    },
    config=config
}

return plugin
