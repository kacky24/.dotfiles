local config = function()
    vim.opt.updatetime = 250
    vim.api.nvim_set_hl(0, 'GitGutterAdd', { fg = '#00ff00', ctermfg = 46 })
    vim.api.nvim_set_hl(0, 'GitGutterChange', { fg = '#ffff00', ctermfg = 11 })
    vim.api.nvim_set_hl(0, 'GitGutterDelete', { fg = '#ff0000', ctermfg = 9 })
end

local plugin = {
    "airblade/vim-gitgutter",
    config = config
}

return plugin
