require("libsfs")

local self = {}

function self:Main(argv)
    if argv[1] == nil or #argv < 1then
        listdirectory(".")
    else
        if argv[1] == "--h" or argv[1] == "--help" then
            print("ls [-h] [-d] [DIR ...]")
        elseif argv[1] == "-d" then
            if argv[2] == nil then
                print("missing DIR")
            else
                listdirectory(argv[2])
            end
        else
            listdirectory(argv[1])
        end
    end
end
return self