--- Default bootmgr by Kai Gonzalez
--- Licensed Under the Mozilla Public License 2.0

local mgr = {}


--- osdev stuff
require('lib.osdev.shared')

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
    local f=io.open(name,"r")
    if f~=nil then io.close(f) return true else return false end
end
function mgr:Log(str)
    MemPrint(1000, "bash: " .. str .. "\n")
end

function mgr:bmain() --- Boot entry point.
    DIRECTORY = "usr/"
    isuptodate()
    if DIRECTORY == "usr/" then
        DIRECTORY2 = DIRECTORY
        DIRECTORY = "~"
    end
    while (true) do
        io.write(DIRECTORY .. " % ")
        local command = io.read()
        process.gAddArguments(command)
        -- hopefully don't fucking die when you get commands wrong :)
        if file_exists("./usr/dsh/" .. process.argv[0] .. ".lua") then
            local object = require ('usr.dsh.' .. process.argv[0])
            object:Main(process.argv)
        else
            mgr:Log("unknown command")
        end

    end

    return 1 --- KUX_SUCCESS
end



return mgr