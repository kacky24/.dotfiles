local config = function()
    vim.g.UltiSnipsExpandTrigger = '<S-C-t>'
    --tab, shift+tabで候補を上下
    vim.g.UltiSnipsJumpForwardTrigger = '<Tab>'
    vim.g.UltiSnipsJumpBackwardTrigger = '<S-Tab>'
end

local plugin = {
    "SirVer/ultisnips",
    config = config
}

return plugin
