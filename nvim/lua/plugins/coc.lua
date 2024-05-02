local config = function()
    vim.api.nvim_set_keymap(
        'i', 'gd', '<Plug>(coc-definition)', { noremap = false, silent = true}
    )
    vim.api.nvim_set_keymap(
        'n', 'gd', '<Plug>(coc-definition)', { noremap = false, silent = true}
    )
    vim.api.nvim_set_keymap(
        'i', 'gy', '<Plug>(coc-type-definition)', { noremap = false, silent = true}
    )
    vim.api.nvim_set_keymap(
        'n', 'gy', '<Plug>(coc-type-definition)', { noremap = false, silent = true}
    )
    vim.api.nvim_set_keymap(
        'i', 'gi', '<Plug>(coc-implementation)', { noremap = false, silent = true}
    )
    vim.api.nvim_set_keymap(
        'n', 'gi', '<Plug>(coc-implementation)', { noremap = false, silent = true}
    )
    vim.api.nvim_set_keymap(
        'i', 'gr', '<Plug>(coc-references)', { noremap = false, silent = true}
    )
    vim.api.nvim_set_keymap(
        'n', 'gr', '<Plug>(coc-references)', { noremap = false, silent = true}
    )
    local function show_documentation()
        if vim.fn.index({'vim', 'help'}, vim.bo.filetype) >= 0 then
            vim.cmd('h ' .. vim.fn.expand('<cword>'))
        else
            vim.fn.CocActionAsync('doHover')
        end
    end
    -- Map 'K' to the Lua function above in normal mode
    vim.api.nvim_set_keymap(
        'n', 'K', '', {noremap = true, silent = true, callback = show_documentation
    })
    --tab, shift+tabで候補を上下
    vim.keymap.set(
        'i', '<C-n>', 'coc#pum#visible() ? coc#pum#next(1) : "<Tab>"',
        {silent=true, noremap=true, expr=true}
    )
    vim.keymap.set(
        "i", "<C-m>", [[coc#pum#visible() ? coc#pum#prev(1) : "<C-h>"]],
        {silent=true, noremap=true, expr=true}
    )
    --enterで補完を確定
    vim.api.nvim_set_keymap(
        'i', '<CR>', 'pumvisible() ? "\\<C-y>" : "\\<C-g>u\\<CR>"', {expr = true}
    )
    --補完で使用するpythonを自動指定	
    --参考: https://github.com/neoclide/coc-python/issues/55	
    if vim.fn.isdirectory(vim.fn.expand('./.venv')) then	
        vim.fn['coc#config'](
            'python', {pythonPath = vim.fn.system('poetry run which python')}
        )
    elseif vim.fn.isdirectory(vim.fn.expand('~/.pyenv')) then
        vim.fn['coc#config'](
            'python', {pythonPath = vim.fn.system('pyenv which python')}
        )
    end
end

local plugin = {
    "neoclide/coc.nvim",
    branch = 'release',
    merge = false,
    config = config
}


return plugin
