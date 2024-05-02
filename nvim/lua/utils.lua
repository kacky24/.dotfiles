---@param array string[]
---@param func functionType
local function array_map(array, func)
    local new_array = {}
    for _, v in ipairs(array) do
        table.insert(new_array, func(v))
    end
    return new_array
end

return {
    array_map = array_map
}
