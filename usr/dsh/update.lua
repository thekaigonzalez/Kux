---@diagnostic disable: undefined-global
require('libposix')
local self = {}
function file_exists(name)
    local f=io.open(name,"r")
    if f~=nil then io.close(f) return true else return false end
end
function self:Main(args)
    if file_exists("usr/dsh/" .. args[1] .. ".lua") then
        print("updating...")
        thread_sleep(1)
        print("cleaning threads... (1/2)")
        thread_sleep(2)
        print("cleaning threads... (2/2)")
        thread_sleep(1)
        print("downloading and installing script...")
        os.remove("usr/dsh/" .. args[1] .. ".lua")
        local url = "https://raw.githubusercontent.com/thekaigonzalez/Kux/master/usr/dsh/" .. args[1] .. ".lua"
        local f=io.open("usr/dsh/" .. args[1] .. ".lua", "r")
        
        if (hgetstring(url) == f:read("a")) then
            print("command " .. args[1] .. " up to date. no changes made.")
        else
            hdofile(url, "usr/dsh/" .. args[1] .. ".lua")
            thread_sleep(4)
            print("complete!")
        end
    elseif args[1] == nil or args[1] == "-h" then
        print("PKG update make in Lua 5.4")
        print("Commands:\n\tupdate <command>")
    else
        print("the command you are trying to update is not installed on your system.")
        print("Trying to install " .. args[1] .. ".latest ...")
        local url = "https://raw.githubusercontent.com/thekaigonzalez/Kux/master/usr/dsh/" .. args[1] .. ".lua"

        hdofile(url, "usr/dsh/" .. args[1] .. ".lua")
    end
end

return self