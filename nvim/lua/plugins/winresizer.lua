local config = function()
    vim.g.winresizer_vert_resize = 5
end

local plugin = {
    'simeji/winresizer',
    keys = {
        '<C-s>', ':WinResizerStartResize<CR>', desc='start window resizer'
    },
    config = config
}

return plugin
