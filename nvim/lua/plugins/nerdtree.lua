local config = function()
    vim.keymap.set(
        'n', '<C-e>', ':NERDTreeToggle<CR>', {noremap = true, silent = true}
    )
    vim.g.NERDTreeFileLines = 1
    -- Open the existing NERDTree on each new tab
    vim.api.nvim_create_autocmd("BufWinEnter", {
        pattern = "*",
        callback = function()
            if vim.bo.buftype ~= "quickfix" and vim.fn.getcmdwintype() == '' then
                vim.cmd("silent NERDTreeMirror")
            end
        end
    })
end

local plugin = {
    "preservim/nerdtree",
    keys = {
        '<C-e>', ':NERDTreeToggle<CR>', desc='toggle NERDTree'
    },
    config = config
}

return plugin
