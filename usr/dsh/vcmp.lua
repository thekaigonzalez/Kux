--bootmgr/default/version/VERSION.manifest

local self = {}

function self:Main(arg)

    local stuff = io.open("usr/dversion/VERSION.manifest", "r")
    io.write("your version: " .. stuff:read() .. " ")
    if hgetstring("https://raw.githubusercontent.com/thekaigonzalez/Kux/master/bootmgr/default/version/VERSION.manifest") == stuff:read() then
        io.write("== ")
    else
        io.write("~= ")
    end
    io.write(hgetstring("https://raw.githubusercontent.com/thekaigonzalez/Kux/master/bootmgr/default/version/VERSION.manifest") .. "\n")

end
return self