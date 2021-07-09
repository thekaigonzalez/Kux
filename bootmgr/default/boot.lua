--- Default bootmgr by Kai Gonzalez
--- Licensed Under the Mozilla Public License 2.0

local mgr = {}

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
        command = require ('usr.dsh.' + command)

    end

    return 1 --- KUX_SUCCESS
end



return mgr