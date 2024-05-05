require('config/options')
require('config/options')
require('config/keymaps')
require('config/autocmds')

if not vim.g.vscode then
   require('config/lazy_nvim')
end
