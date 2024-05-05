--------------------------------------------------------
--編集に関する設定
vim.opt.number = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.encoding = 'utf-8'
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.wildmenu = true
vim.opt.backspace = {'indent','eol','start'}
vim.opt.clipboard = 'unnamed'

--ビープ音を消す
vim.opt.vb.t_vb = ''
vim.opt.errorbells = false

vim.cmd('filetype off')

vim.cmd('filetype plugin indent on')
vim.cmd('syntax enable')


vim.opt.termguicolors = true

vim.opt.viminfo = "'50,\"3000,:0,n~/.viminfo"

--------------------------------------------------------
--python
vim.g.python3_host_prog = vim.fn.expand('~/.asdf/installs/python/3.12.3/bin/python')
--vim-python/python-syntaxによる設定
--self, clsを色付け
vim.g.python_highlight_class_vars = 1


