return {
    {
        'dense-analysis/ale',
        config = function()
            --checkのタイミング
            vim.g.ale_lint_on_save = 1
            vim.g.ale_lint_on_text_changed = 'never'
            vim.g.ale_lint_on_insert_leave = 0
            vim.g.ale_lint_on_enter = 1
            --color
            vim.api.nvim_set_hl(0, 'ALEWarningSign', { fg = '#ffff00' , ctermfg = 11 })
            vim.api.nvim_set_hl(0, 'ALEErrorSign', { fg = '#ff0000' , ctermfg = 9 })
            --C-k, C-jでエラー箇所に移動
            vim.api.nvim_set_keymap('n', '<C-k>', '<Plug>(ale_previous_wrap)', { noremap = true, silent = true })
            vim.api.nvim_set_keymap('n', '<C-j>', '<Plug>(ale_next_wrap)', { noremap = true, silent = true })
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
    },
    {
        'scrooloose/nerdtree',
        keys = {
            '<C-e>', ':NERDTreeToggle<CR>', desc='toggle NERDTree'
        },
        config = function()
            vim.keymap.set(
                'n', '<C-e>', ':NERDTreeToggle<CR>', {noremap = true, silent = true}
            )
            vim.g.NERDTreeFileLines = 1
            -- Open the existing NERDTree on each new tab
            vim.api.nvim_create_autocmd("BufWinEnter", {
                pattern = "*",
                callback = function()
                    if vim.bo.buftype ~= "quickfix" and vim.fn.getcmdwintype() == '' then
                        vim.cmd("silent NERDTreeMirror")
                    end
                end
            })
        end
    },
    {
        'tomasr/molokai',
        config = function()
            vim.cmd('colorscheme molokai')
        end
    },
    {
        'itchyny/lightline.vim',
        config = function()
            vim.g.lightline = {
                colorscheme = 'molokai',
                active = {
                    left = {
                        { 'mode', 'paste' },
                        { 'readonly', 'filename', 'modified' }
                    }
                },
                component_function = {
                    filename = 'LightlineFilename',
                    paste = 'LightlinePaste'
                }
            }
            vim.g.lightline.component_expand = {
                linter_checking = 'lightline#ale#checking',
                linter_warnings = 'lightline#ale#warnings',
                linter_errors = 'lightline#ale#errors',
                linter_ok = 'lightline#ale#ok'
            }
            vim.g.lightline.component_type = {
                linter_checking = 'left',
                linter_warnings = 'warning',
                linter_errors = 'error',
                linter_ok = 'left'
            }
            vim.g.lightline.active = {
                left = {
                    { 'mode', 'paste' },
                    { 'gitbranch', 'readonly', 'filename', 'modified' },
                    { 'linter_checking', 'linter_warnings', 'linter_errors', 'linter_ok' }
                }
            }
            --https://qiita.com/yuyuchu3333/items/20a0acfe7e0d0e167ccc
            local function my_fugitive()
                if vim.bo.filetype ~= 'vimfilter' and vim.bo.filetype ~= 'gundo' then
                    local ok, head = pcall(vim.fn['fugitive#head'])
                    if ok and head ~= '' then
                        return '⭠  ' .. head
                    end
                end
                return ''
            end
            vim.g.lightline.component_function = {
                gitbranch = my_fugitive
            }
        end

    },
    {
        'maximbaz/lightline-ale'
    },
    {
        'airblade/vim-gitgutter',
        config = function()
            vim.opt.updatetime = 250
            vim.api.nvim_set_hl(0, 'GitGutterAdd', { fg = '#00ff00', ctermfg = 46 })
            vim.api.nvim_set_hl(0, 'GitGutterChange', { fg = '#ffff00', ctermfg = 11 })
            vim.api.nvim_set_hl(0, 'GitGutterDelete', { fg = '#ff0000', ctermfg = 9 })
        end
    },
    {
        'neoclide/coc.nvim',
        branch = 'release',
        merged = false,
        config = function()
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
    },
    {
        'SirVer/ultisnips',
        --tabがトリガーとならないようにとりあえずshit+ctr+tでマッピング
        config = function()
            vim.g.UltiSnipsExpandTrigger = '<S-C-t>'
            --tab, shift+tabで候補を上下
            vim.g.UltiSnipsJumpForwardTrigger = '<Tab>'
            vim.g.UltiSnipsJumpBackwardTrigger = '<S-Tab>'
        end
    },
    {
        'honza/vim-snippets'
    },
    {
        'kassio/neoterm',
        --位置とサイズ
        config = function()
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
    },
    {
        'junegunn/fzf',
        build = function()
            vim.fn['system']('./install --all')
        end,
        path = vim.fn.expand('~/.fzf'),
        marged = false
    },
    {
        'junegunn/fzf.vim',
        dependencies = { 'junegunn/fzf' },
        config = function()
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
    },
    {
        'tpope/vim-fugitive',
        config = function()
            vim.api.nvim_set_keymap(
                'n', '<Space>gb', ':Gblame<CR>', {noremap = true, silent = true}
            )
            vim.api.nvim_set_keymap(
                'n', '<Space>gd', ':Gdiff<CR>', {noremap = true, silent = true}
            )
            vim.api.nvim_set_keymap(
                'n', '<Space>gs', ':Gstatus<CR>', {noremap = true, silent = true}
            )
            vim.api.nvim_set_keymap(
                'n', '<Space>gw', ':Gwrite<CR>', {noremap = true, silent = true}
            )
            vim.api.nvim_set_keymap(
                'n', '<Space>gr', ':Gread<CR>', {noremap = true, silent = true}
            )
            vim.api.nvim_set_keymap(
                'n', '<Space>gc', ':Gcommit<CR>', {noremap = true, silent = true}
            )
            vim.api.nvim_set_keymap(
                'n', '<Space>gp', ':Gpush<CR>', {noremap = true, silent = true}
            )
            vim.api.nvim_set_keymap(
                'n', '<Space>gh', ':diffget //2<CR>', {noremap = true, silent = true}
            )
            vim.api.nvim_set_keymap(
                'n', '<Space>gl', ':diffget //3<CR>', {noremap = true, silent = true}
            )
        end
    },
    {
        'simeji/winresizer',
        keys = {
            '<C-s>', ':WinResizerStartResize<CR>', desc='start window resizer'
        }
        --config = function()
            -- vim.api.nvim_set_keymap(
            --     'n', '<C-s>', ':WinResizerStartResize<CR>', {noremap = true, silent = true}
            -- )
            -- vim.g.winresizer_vert_resize = 5
        --end
    },
    {
        'thinca/vim-quickrun',
        config = function()
            vim.g.quickrun_config = {
                _ ={
                    ["outputter/buffer/split"] = ":botright 10sp",
                    ["outputter/buffer/close_on_empty"] = 1
                }
            }
        end
    },
    {
        'github/copilot.vim',
        config = function()
            vim.g.copilot_enable = 1
            vim.g.copilot_enable_default = 1
            vim.api.nvim_set_keymap(
                'i', '<Tab>', 'copilot#Accept("\\<CR>")',
                {noremap = false, silent = true, script = true, expr = true}
            )
            --vim.g.copilot_no_tab_map = true
            -- vim.api.nvim_set_keymap(
            --     'i', '<C-l>', '<Plug>(copilot-next)',{noremap = false, silent = true}
            -- )
            -- vim.api.nvim_set_keymap(
            --     'i', '<C-h>', '<Plug>(copilot-previous)',{noremap = false, silent = true}
            -- )
            vim.keymap.set('i', '<C-j>', '<Plug>(copilot-accept-word)')
            vim.keymap.set('i', '<C-l>', '<Plug>(copilot-next)')
            vim.keymap.set('i', '<C-h>', '<Plug>(copilot-previous)')
            vim.keymap.set('i', '<C-[>', '<Plug>(copilot-accept-line)')
            vim.keymap.set('i', '<C-k>', '<Plug>(copilot-dismiss)')
            vim.keymap.set('n','<C-p>', ':Copilot panel<CR>')

        end
    },
    {
        'cespare/vim-toml',
        lazy = true,
        ft = 'toml'
    },
    {
        'vim-python/python-syntax',
        lazy = true,
        ft = 'python'
    },
    {
        'previm/previm',
        lazy = true,
        ft = {'markdown', 'mkd'},
        config = function()
            vim.g.previm_open_cmd = 'open -a Google\\ Chrome'
            vim.api.nvim_set_keymap(
                'n', '<M-p>', ':PrevimOpen<CR>', {noremap = true, silent = true}
            )
        end
    }
}

