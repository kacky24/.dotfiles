local config = function()
    vim.g.copilot_enable = 1
    vim.g.copilot_enable_default = 1
    vim.api.nvim_set_keymap(
        'i', '<Tab>', 'copilot#Accept("\\<CR>")',
        {
            noremap = true,
            silent = true,
            script = true,
            expr = true,
            replace_keycodes=false
        }
    )
    --vim.g.copilot_no_tab_map = true
    --https://github.com/github/copilot.vim/blob/release/doc/copilot.txt
    vim.keymap.set('i', '<C-j>', '<Plug>(copilot-accept-word)', {noremap=true})
    vim.keymap.set('i', '<C-l>', '<Plug>(copilot-next)', {noremap=true})
    vim.keymap.set('i', '<C-h>', '<Plug>(copilot-previous)', {noremap=true})
    vim.keymap.set('i', '<C-[>', '<Plug>(copilot-accept-line)', {noremap=true})
    vim.keymap.set('i', '<C-k>', '<Plug>(copilot-dismiss)', {noremap=true})
    vim.keymap.set('n','<C-p>', ':Copilot panel<CR>', {noremap=true})
end


local plugin = {
    "github/copilot.vim",
    config = config
}

return plugin
