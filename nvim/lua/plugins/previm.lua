local config = function()
    vim.g.previm_open_cmd = 'open -a Google\\ Chrome'
    vim.api.nvim_set_keymap(
        'n', '<M-p>', ':PrevimOpen<CR>', {noremap = true, silent = true}
    )
end


local plugin ={
    'previm/previm',
    lazy = true,
    ft = {'markdown', 'mkd'},
    config = config
}

return plugin
