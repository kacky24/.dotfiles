local plugin = {
    'junegunn/fzf',
    build = function()
        vim.fn['system']('./install --all')
    end,
    path = vim.fn.expand('~/.fzf'),
    marged = false
}

return plugin
