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
        hdofile("https://raw.githubusercontent.com/thekaigonzalez/Kux/master/usr/dsh/" .. args[1] .. ".lua", "usr/dsh/" .. args[1] .. ".lua")
        thread_sleep(4)
        print("complete!")
    else
        print("the command you are trying to update is not installed on your system.")
        print("if using kap, try running `kap pull-apt ppa:outdated " .. args[1] .. "` to install it.")
    end
end

return self