require "libposix"
require "libhttp"
require "libsyscalls"
local self = {}

function self:Main(a)
    if a[1] == "+stable" then
        print("Pulling boot.lua from recent commits..")
        thread_sleep(2)
        os.remove("usr/bootloader/bootmanager/boot.lua") -- removes the terminal while keeping the command in memory
        hdofile("https://raw.githubusercontent.com/thekaigonzalez/Kux/master/bootmgr/default/boot.lua", "usr/bootloader/bootmanager/boot.lua") -- store the update into a file
        os.remove('bootmgr/default/version/VERSION.manifest')
        hdofile("https://raw.githubusercontent.com/thekaigonzalez/Kux/master/bootmgr/default/version/VERSION.manifest", "bootmgr/default/version/VERSION.manifest")
        dofile("usr/bootloader/bootmanager/boot.lua")
    end
end

return self