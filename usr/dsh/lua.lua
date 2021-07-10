require('libmemio') -- do i need to really tell you why?

require('lua-dev') -- ...god damn....

-- convenience purposes
function startswith(text, prefix)
    return text:find(prefix, 1, true) == 1
end



local self = {}


self.Libraries = {}
self.Libchain = ""
local libindex = 0
--- Code that took me 3 hours...
--- please help my soul
function self:Main(argv)

    for _,argument in ipairs(argv) do -- iterate over arguments
        if startswith(argument, "-l") then -- check if it starts with the link command
            local str = argument
            local stri = ""
            local istr = string.match(str, "-l(%a+)")
            self.Libraries[libindex] = istr
            self.Libchain = self.Libchain .. istr

            libindex = libindex + 1
        elseif startswith(argument, "--file") then
            local str = argument
            local istr = string.match(str, "--file=(%a+)")

            local i = 0


            gbind(istr, self.Libchain)
            self.Libchain = ""
        else
            local str = argument
            local istr = string.match(str, "--file=(%a+)")

            local i = 0


            gbind(str, self.Libchain)
            self.Libchain = ""
        end
    end
end

return self