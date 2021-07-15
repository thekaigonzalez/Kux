local self = {}

function self:Main(a)
    for i, v in ipairs(a) do
        print(v)
    end
end

return self