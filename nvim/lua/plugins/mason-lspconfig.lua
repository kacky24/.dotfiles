local plugins = {
        {
        'williamboman/mason.nvim',
        opts = {
            ensure_installed = {
                'pyright',
                'flake8',
                'black',
                'isort',
                'debugpy'
            }
        },
        config = function()
            require('mason').setup()
        end
    },
    {
        'neovim/nvim-lspconfig',
        config = function(j)
            local lspconfig = require('lspconfig')
            lspconfig.pyright.setup({
                settings = {
                    python = {
                        venvpath = '.',
                        pythonPath = './.venv/bin/python',
                        analysis = {
                            extraPaths = {'.'}
                        }
                    }
                }
            })
            vim.keymap.set('n', 'K',  '<cmd>lua vim.lsp.buf.hover()<CR>')
            vim.keymap.set('n', 'gf', '<cmd>lua vim.lsp.buf.format()<CR>')
            vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>')
            vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>')
            vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>')
            vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>')
            vim.keymap.set('n', 'gt', '<cmd>lua vim.lsp.buf.type_definition()<CR>')
            vim.keymap.set('n', 'gn', '<cmd>lua vim.lsp.buf.rename()<CR>')
            vim.keymap.set('n', 'ga', '<cmd>lua vim.lsp.buf.code_action()<CR>')
            vim.keymap.set('n', 'ge', '<cmd>lua vim.diagnostic.open_float()<CR>')
            vim.keymap.set('n', 'g]', '<cmd>lua vim.diagnostic.goto_next()<CR>')
            vim.keymap.set('n', 'g[', '<cmd>lua vim.diagnostic.goto_prev()<CR>')
        end
    },
    {
        'williamboman/mason-lspconfig.nvim',
        dependencies = {
            'williamboman/mason.nvim',
            'neovim/nvim-lspconfig',
        },
        config=function()
            require('mason-lspconfig').setup()
        end
    },
    {
        'nvimtools/none-ls.nvim',
        ft = {'python'},
        config = function()
            local none_ls = require('null-ls')
            none_ls.setup({
                sources = {
                    none_ls.builtins.formatting.black,
                    --none_ls.builtins.formatting.isort,
                    --none_ls.builtins.diagnostics.mypy
                }
            })
        end
    },
    {
        'mfussenegger/nvim-dap',
        config = function()
            --local dap = require("dap")
            --dap.set_exception_breakpoints = { "Error", "Exception" }
            plugin = true
            vim.keymap.set('n', '<Leader>dc', ':DapContinue<CR>')
            vim.keymap.set('n', '<Leader>do', ':DapStepOver<CR>')
            vim.keymap.set('n', '<Leader>di', ':DapStepInto<CR>')
            --vim.keymap.set('n', '<Leader>do', ':DapStepOut<CR>')
            vim.keymap.set('n', '<Leader>db', ':DapToggleBreakpoint<CR>')
        end
    },
    {
        'mfussenegger/nvim-dap-python',
        ft = {'python'},
        dependencies = {
            'mfussenegger/nvim-dap',
            'rcarriga/nvim-dap-ui'
        },
        config = function(_, opts)
            local cwd = vim.loop.cwd()
            local path = cwd .. '/.venv/bin/python'
            require('dap-python').setup('~/.local/share/nvim/mason/packages/debugpy/venv/bin/python')
            plugin = true
            n = {
                ['<Leader>dpr'] = {
                    function()
                        require('dap-python').test_method()
                    end
                }
            }
        end
    },
    {
        'rcarriga/nvim-dap-ui',
        dependencies = {
            'mfussenegger/nvim-dap',
            'nvim-neotest/nvim-nio'
        },
        config = function()
            local dap = require('dap')
            local dapui = require('dapui')
            vim.keymap.set('n', '<Leader>du', ':lua require("dapui").toggle()<CR>')
            dapui.setup()
            dap.listeners.after.event_initialized['dapui_config'] = function()
                dapui.open()
            end
            dap.listeners.before.event_terminated['dapui_config'] = function()
                dapui.close()
            end
            dap.listeners.before.event_exited['dapui_config'] = function()
                dapui.close()
            end
        end
    },

}

return plugins
