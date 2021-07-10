require('libmemio') -- MemPrint(memstack, string)

local self = {}

function self:Main(arguments)
    -- PLAN:
    -- Iterate through Arguments starting with "1" to prevent printing the entire command
    local i = 1
    for _,arg in ipairs(arguments) do
        MemPrint(1024, arg .. " ");
        i = i + 1
    end
    MemPrint(1,"\n")

end

return self