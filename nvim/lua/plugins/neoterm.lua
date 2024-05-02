local config = function()
    vim.g.neoterm_default_mod = 'belowright'
    vim.g.neoterm_size = 10
    --画面下部にコマンド実行結果が表示
    vim.g.neoterm_autoscroll = 1
    --C-wでターミナル内の挿入モードを抜けてウィンドウ移動
    vim.api.nvim_set_keymap(
        't', '<C-w>', '<C-\\><C-n><C-w>', {noremap = true, silent = true}
    )
    --:Tnewのマッピング
    vim.api.nvim_set_keymap(
        'n', '<C-t>', ':Tnew<CR>', {noremap = true, silent = true}
    )
end

local plugin = {
    "kassio/neoterm",
    config = config
}

return plugin
