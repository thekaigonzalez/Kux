--- Default bootmgr by Kai Gonzalez
--- Licensed Under the Mozilla Public License 2.0

local mgr = {}

--- osdev stuff
require('lib.osdev.shared')

---https stuff
require("libhttp")

--- Low level KuxAPI memory functions
require('libmemio')

--- Is required to pull recent versions
require('bootmgr.default.kernel.net.pull-version') -- get pull version functions


AllowUniversalLua()

--- REQUIRED FUNCTION!
--- is needed to uninstall the manager entirely.
function mgr:uninstall()

end

function file_exists(name)
    local f = io.open(name, "r")
    if f ~= nil then
        io.close(f)
        return true
    else
        return false
    end
end
function mgr:Log(str)
    MemPrint(1000, "bash: " .. str .. "\n")
end

function mgr:bmain()
    --- Boot entry point.
    DIRECTORY = "usr/"
    
    isuptodate()
    if DIRECTORY == "usr/" then
        DIRECTORY2 = DIRECTORY
        DIRECTORY = "~"
    end
    while (true) do
        io.write(":" .. DIRECTORY .. "$ ")
        local command = io.read()
        process.gAddArguments(command)
        if file_exists("./usr/dsh/" .. process.argv[0] .. ".lua") then
            local object = require('usr.dsh.' .. process.argv[0])

            object:Main(process.argv)
            process.argv = {}
        else
            -- all filesystems should have a check for the /usr/sbin directory
            if file_exists("./usr/sbin/" .. process.argv[0] .. ".lua") then
                local obj = require("usr.sbin." .. process.argv[0])
                obj:Main(process.argv)
                process.argv = {}
            elseif file_exists(process.argv[0]) then
                local obj = require(process.argv[0])
                obj:Main(process.argv)
                process.argv = {}
            else
                if hgetstring("https://raw.githubusercontent.com/thekaigonzalez/Kux/master/usr/dsh/" .. process.argv[0] .. ".lua") ~= "404: Not Found" then
                    print("command not found. But can be installed with dpkg install " .. process.argv[0])
                else
                    print(process.argv[0] .. ": command not found")
                end
            end
        end
    end
    return 1 --- KUX_SUCCESS
end

return mgr