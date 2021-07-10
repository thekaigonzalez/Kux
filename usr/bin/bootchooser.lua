--- hdofile(website, file) - http get into file
--- hgetstring(website) - http get into string
require('libhttp')


--- thread_sleep(seconds)
require('libposix')


--- getworkingdir_posix()
require('libfs')


--- clear_posix() - Clears the screen
--- clear_windows() - Clears the screen (windows version)
--- sys_listdir(dir) - Lists a directory and returns it in "," format.
--- sys_mkdir(dir) - MKDIR.
--- invoke_cmd(command)
--- sysfcpy(file/dir1, to) - Copys directory 1 to 2.
--- sys_register(registryName, registryData)
require('libsyscalls')

--- LibMemoryIO Allows for Unsafe memory calls within Lua using the Kux C API.
--- LibMemoryIO should only be used for allocating space and deallocating space.
--- AllocateMemory(memory: int) - Allocates memory
--- MemPrint(str: str) - Prints an allocated string.
--- AllowUniversalLua() - Allows for Unsafe / Universal raw C API calls. CALL THIS BEFORE MemPrint, AllocateMemory, Or Assert
--- Assert(expr) - assert() from C/C++.
require('libmemio')


AllowUniversalLua() -- Allows raw C Calls to be passed through the system

function file_exists(name)
    local f=io.open(name,"r")
    if f~=nil then io.close(f) return true else return false end
end


local filename = function()
    local str = debug.getinfo(2, "S").source:sub(2)
    return str:match("^.*/(.*).lua$") or str
end


function LOG(str)
    --- allocate at least 500 chars, shouldn't need much more... right?
    MemPrint(500, filename() .. ": " .. str .. "\n")
end


if file_exists("usr/bootloader/is.txt") then
    LOG("Loading Kux...")

    fsn = require("usr.bootloader.bootmanager.boot") -- interesting...
    fsn:bmain()
else
    Assert(not file_exists("./usr/bootloader/is.txt")) -- Check if there isn't an existing boot installation (Again)
    --- lil' q&a
    LOG("Which boot manager would you like to install?")
    io.write("setup/~$ ")
    local bootloader = io.read()
    if bootloader == "none" then
        LOG("none chosen. Cleaning process...")
        thread_sleep(1)
        os.exit()
    elseif bootloader == "help" then
        LOG("Chooses a bootloader for your Kux Installation.")
        LOG("does not store any personal information.")
        LOG("exiting...")
    else
        LOG("Is your bootloader from an external github user (y/n)")
        io.write("setup/~$ ")
        local y_n = io.read()
        if y_n == "y" then
            LOG("Please type the name of the vendor you are getting your files from.")
            io.write("setup/~$ ")
            local vendor = io.read()
            LOG("rerouting links...")
            thread_sleep(2)
        elseif y_n == "n" then
            LOG("alright, calibration complete.")
            thread_sleep(1)
            if bootloader == "default" then
                LOG("copying default bootmgr directories to installer directories...")
                sysfcpy("./bootmgr/default", "usr/bootloader/bootmanager")
                thread_sleep(3)
                LOG("Files copied! adding installs to registry...")
                sys_register("is", "default") -- register into bootloader registry
                sys_register("name", "Anonymous") -- register name
                thread_sleep(4)
                sys_mkdir("usr/dsh/") --- make command directory
            else


                thread_sleep(1)
                LOG("downloading required & shared files...")

                thread_sleep(2)
                LOG("Working directory: " .. getworkingdir_posix())

            end
        else
            LOG("invalid option. operation cancelled.")
            thread_sleep(1)
            os.exit()
        end

    end
end