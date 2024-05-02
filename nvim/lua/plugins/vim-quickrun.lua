local config = function()
    vim.g.quickrun_config = {
        _ ={
            ["outputter/buffer/split"] = ":botright 10sp",
            ["outputter/buffer/close_on_empty"] = 1
        }
    }
end

local plugin = {
    "thinca/vim-quickrun",
    config = config
}

return plugin
