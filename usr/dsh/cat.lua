require('libmemio')

local self = {}

-- convenience purposes
function startswith(text, prefix)
    return text:find(prefix, 1, true) == 1
end


function self:Main(argv)
    --- setup for an argument iterator
    for _, argkv in ipairs(argv) do
        if startswith(argkv, "-h") then
            MemPrint(500, "cat <file>\n")
        else
            MemPrint(1000, "\n\n" .. io.open(argkv):read() .. "\n\n")
        end
    end
end

return self