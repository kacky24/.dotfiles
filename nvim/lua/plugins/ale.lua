local config = function()
    --checkのタイミング
    vim.g.ale_lint_on_save = 1
    vim.g.ale_lint_on_text_changed = 'never'
    vim.g.ale_lint_on_insert_leave = 0
    vim.g.ale_lint_on_enter = 1
    --color
    vim.api.nvim_set_hl(0, 'ALEWarningSign', { fg = '#ffff00' , ctermfg = 11 })
    vim.api.nvim_set_hl(0, 'ALEErrorSign', { fg = '#ff0000' , ctermfg = 9 })
    --C-k, C-jでエラー箇所に移動
    vim.api.nvim_set_keymap(
        'n', '<C-k>', '<Plug>(ale_previous_wrap)', { noremap = true, silent = true }
    )
    vim.api.nvim_set_keymap(
        'n', '<C-j>', '<Plug>(ale_next_wrap)', { noremap = true, silent = true }
    )
    --python
    vim.g.ale_linters = {
        python = {'flake8'}
    }
    vim.g.ale_fixers = {
        python = {'black', 'isort'}
    }
    vim.g.ale_python_flake8_executable = vim.g.python3_host_prog
    vim.g.ale_python_flake8_options = '-m flake8'
    vim.g.ale_python_isort_executable = vim.g.python3_host_prog
    vim.g.ale_python_isort_options = '-m isort'
    vim.g.ale_python_black_executable = vim.g.python3_host_prog
    vim.g.ale_python_black_options = '-m black'
end

local plugin = {
    "dense-analysis/ale",
    config = config
}

return plugin
