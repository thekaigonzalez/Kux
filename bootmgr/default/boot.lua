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
    print([[
    Welcome to ...
        GGGGGGGGGGGGGKKKKKKKKK    KKKKKKK
     GGG::::::::::::GK:::::::K    K:::::K
   GG:::::::::::::::GK:::::::K    K:::::K
  G:::::GGGGGGGG::::GK:::::::K   K::::::K
 G:::::G       GGGGGGKK::::::K  K:::::KKKuuuuuu    uuuuuu  xxxxxxx      xxxxxxx
G:::::G                K:::::K K:::::K   u::::u    u::::u   x:::::x    x:::::x
G:::::G                K::::::K:::::K    u::::u    u::::u    x:::::x  x:::::x
G:::::G    GGGGGGGGGG  K:::::::::::K     u::::u    u::::u     x:::::xx:::::x
G:::::G    G::::::::G  K:::::::::::K     u::::u    u::::u      x::::::::::x
G:::::G    GGGGG::::G  K::::::K:::::K    u::::u    u::::u       x::::::::x
G:::::G        G::::G  K:::::K K:::::K   u::::u    u::::u       x::::::::x
 G:::::G       G::::GKK::::::K  K:::::KKKu:::::uuuu:::::u      x::::::::::x
  G:::::GGGGGGGG::::GK:::::::K   K::::::Ku:::::::::::::::uu   x:::::xx:::::x
   GG:::::::::::::::GK:::::::K    K:::::K u:::::::::::::::u  x:::::x  x:::::x
     GGG::::::GGG:::GK:::::::K    K:::::K  uu::::::::uu:::u x:::::x    x:::::x
        GGGGGG   GGGGKKKKKKKKK    KKKKKKK    uuuuuuuu  uuuuxxxxxxx      xxxxxxx
    ]])
    isuptodate()
    if DIRECTORY == "usr/" then
        DIRECTORY2 = DIRECTORY
        DIRECTORY = "~"
    end
    while (true) do
        io.write(io.open("usr/bootloader/name.txt"):lines()[0] .. ":" .. DIRECTORY .. " % ")
        local command = io.read()
        process.gAddArguments(command)

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