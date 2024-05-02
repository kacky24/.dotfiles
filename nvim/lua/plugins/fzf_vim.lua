local config = function()
    vim.api.nvim_set_keymap(
        'n', ',f', ':GFiles<CR>', {noremap = true, silent = true}
    )
    vim.api.nvim_set_keymap(
        'n', ',F', ':Files<CR>', {noremap = true, silent = true}
    )
    vim.api.nvim_set_keymap(
        'n', ',g', ':GFiles?<CR>', {noremap = true, silent = true}
    )
    vim.api.nvim_set_keymap(
        'n', ',b', ':Buffers<CR>', {noremap = true, silent = true}
    )
    vim.api.nvim_set_keymap(
        'n', ',l', ':BLines<CR>', {noremap = true, silent = true}
    )
    vim.api.nvim_set_keymap(
        'n', ',h', ':History<CR>', {noremap = true, silent = true}
    )
    vim.api.nvim_set_keymap(
        'n', ',m', ':Mark<CR>', {noremap = true, silent = true}
    )
    vim.api.nvim_set_keymap(
        'n', ',c', ':Colors<CR>', {noremap = true, silent = true}
    )
    vim.api.nvim_set_keymap(
        'n', ',r', ':Rg<CR>', {noremap = true, silent = true}
    )
end

local plugin = {
    "junegunn/fzf.vim",
    dependencies = { 'junegunn/fzf' },
    config = config
}

return plugin
