local config = function()
    vim.cmd('colorscheme molokai')
end

local plugin = {
    "tomasr/molokai",
    config = config
}

return plugin
