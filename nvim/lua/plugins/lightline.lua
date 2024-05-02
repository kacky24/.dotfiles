local config = function()
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

local plugin = {
    "itchyny/lightline.vim",
    config = config
}

return plugin
