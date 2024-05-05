local config = function()
    require('lspsaga').setup({})
end

local plugin = {
  'glepnir/lspsaga.nvim',
  dependencies = {
    'nvim-treesitter/nvim-treesitter',
    'nvim-tree/nvim-web-devicons'
  },
  config=config
}

return plugin
