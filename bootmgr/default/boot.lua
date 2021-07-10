--- Default bootmgr by Kai Gonzalez
--- Licensed Under the Mozilla Public License 2.0

local mgr = {}


--- osdev stuff
require('lib.osdev.shared')

--- Low level KuxAPI memory functions
require('libmemio')

--- REQUIRED FUNCTION!
--- is needed to uninstall the manager entirely.
function mgr.uninstall()

end


function mgr.bmain() --- Boot entry point.
    DIRECTORY = "usr/"
    print("welcome to Kux default edition!")
    print("Type HELP for a list of commands.")
    if DIRECTORY == "usr/" then
        DIRECTORY2 = DIRECTORY
        DIRECTORY = "~"
    end
    while (true) do
        io.write(DIRECTORY .. " % ")
        local command = io.read()
        process.gAddArguments(command)

        local object = require ('usr.dsh.' .. process.argv[0])
        object:Main(process.argv)

    end

    return 1 --- KUX_SUCCESS
end



return mgr