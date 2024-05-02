local config = function()
    vim.api.nvim_set_keymap(
        'n', '<Space>gb', ':Gblame<CR>', {noremap = true, silent = true}
    )
    vim.api.nvim_set_keymap(
        'n', '<Space>gd', ':Gdiff<CR>', {noremap = true, silent = true}
    )
    vim.api.nvim_set_keymap(
        'n', '<Space>gs', ':Gstatus<CR>', {noremap = true, silent = true}
    )
    vim.api.nvim_set_keymap(
        'n', '<Space>gw', ':Gwrite<CR>', {noremap = true, silent = true}
    )
    vim.api.nvim_set_keymap(
        'n', '<Space>gr', ':Gread<CR>', {noremap = true, silent = true}
    )
    vim.api.nvim_set_keymap(
        'n', '<Space>gc', ':Gcommit<CR>', {noremap = true, silent = true}
    )
    vim.api.nvim_set_keymap(
        'n', '<Space>gp', ':Gpush<CR>', {noremap = true, silent = true}
    )
    vim.api.nvim_set_keymap(
        'n', '<Space>gh', ':diffget //2<CR>', {noremap = true, silent = true}
    )
    vim.api.nvim_set_keymap(
        'n', '<Space>gl', ':diffget //3<CR>', {noremap = true, silent = true}
    )
end

local plugin = {
    "tpope/vim-fugitive",
    config = config
}

return plugin
