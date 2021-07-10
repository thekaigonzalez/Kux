local self = {}

--- lregex helAlo l (%a+)
function self:Main(arguments)
    print(string.match(arguments[1], arguments[2] .. arguments[3] .. arguments[2]))
end

return self