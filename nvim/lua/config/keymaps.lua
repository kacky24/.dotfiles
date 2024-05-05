--------------------------------------------------------
--キーに関する設定
vim.api.nvim_set_keymap('i', 'jj', '<ESC>', { noremap = true, silent = false })
vim.api.nvim_set_keymap('i', '{', '{}<Left>', { noremap = true, silent = false })
vim.api.nvim_set_keymap('i', '{<ENTER>', '{}<Left><CR><ESC><S-o>', { noremap = true, silent = false })
vim.api.nvim_set_keymap('i', '(', '()<ESC>i', { noremap = true, silent = false })
vim.api.nvim_set_keymap('i', '(<ENTER>', '()<Left><CR><ESC><S-o>', { noremap = true, silent = false })
vim.api.nvim_set_keymap("i", "'", "''<Left>", { noremap = true, silent = false })
vim.api.nvim_set_keymap('i', '"', '""<Left>', { noremap = true, silent = false })
vim.api.nvim_set_keymap('i', '[', '[]<Left>', { noremap = true, silent = false })
vim.api.nvim_set_keymap('n', ';', ':', { noremap = true, silent = false })
vim.api.nvim_set_keymap('n', ':', ';', { noremap = true, silent = false })
vim.api.nvim_set_keymap('v', ';', ':', { noremap = true, silent = false })
vim.api.nvim_set_keymap('v', ':', ';', { noremap = true, silent = false })
vim.api.nvim_set_keymap('i', ';', ':', { noremap = true, silent = false })
vim.api.nvim_set_keymap('i', ':', ';', { noremap = true, silent = false })

--j, k による移動を折り返されたテキストでも自然に振る舞うように変更
vim.api.nvim_set_keymap('n', 'j', 'gj', { noremap = true, silent = false })
vim.api.nvim_set_keymap('n', 'k', 'gk', { noremap = true, silent = false })
vim.api.nvim_set_keymap('n', 'Y', 'y$', { noremap = true, silent = false })

--copy $ pasteに関する設定
-- Execute 'uname' and store the result in OSTYPE
local handle = io.popen('uname')
local OSTYPE = handle:read('*a')
handle:close()

-- Trim any trailing whitespace (such as newline character)
OSTYPE = OSTYPE:gsub('%s+$', '')

if OSTYPE == 'Linux' then
  vim.api.nvim_set_keymap('n', 'yy', 'yy:wv<CR>', { noremap = true, silent = false })
  vim.api.nvim_set_keymap('v', 'yy', 'yy:wv<CR>', { noremap = true, silent = false })
  vim.api.nvim_set_keymap('i', 'yy', 'yy:wv<CR>', { noremap = true, silent = false })
  vim.api.nvim_set_keymap('n', 'y', 'y:wv<CR>', { noremap = true, silent = false })
  vim.api.nvim_set_keymap('v', 'y', 'y:wv<CR>', { noremap = true, silent = false })
  vim.api.nvim_set_keymap('i', 'y', 'y:wv<CR>', { noremap = true, silent = false })
  vim.api.nvim_set_keymap('n', 'p', ':rv!<CR>p', { noremap = true, silent = false })
  vim.api.nvim_set_keymap('v', 'p', ':rv!<CR>p', { noremap = true, silent = false })
  vim.api.nvim_set_keymap('i', 'p', ':rv!<CR>p', { noremap = true, silent = false })
end

--------------------------------------------------------
--tabに関する設定
--the prefix key
vim.api.nvim_set_keymap('n', '[Tag]', '<Nop>', { noremap = true, silent = false })
vim.api.nvim_set_keymap('n', 't', '[Tag]', { noremap = false, silent = false })
--Tab jump
--t1 で1番左のタブ、t2 で1番左から2番目のタブにジャンプ
for n = 1, 9 do
    vim.api.nvim_set_keymap('n', '[Tag]'.. tostring(n), ':<C-u>tabnext '.. tostring(n) ..'<CR>', { noremap = true, silent = true })
end

vim.api.nvim_set_keymap('n', '[Tag]c', ':tabnew<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '[Tag]l', ':tabnext<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '[Tag]h', ':tabprevious<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '[Tag]t', ':tabs<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '[Tag]x', ':tabclose<CR>', { noremap = true, silent = true })

--------------------------------------------------------
--window
vim.g.winresizer_start_key = '<C-s>'
