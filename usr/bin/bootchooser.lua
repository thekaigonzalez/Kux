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


function file_exists(name)
    local f=io.open(name,"r")
    if f~=nil then io.close(f) return true else return false end
end


local filename = function()
    local str = debug.getinfo(2, "S").source:sub(2)
    return str:match("^.*/(.*).lua$") or str
end


function LOG(str)
    print(filename() .. ": " .. str)
end


if file_exists("usr/bootloader/is.txt") then
    LOG("Loading Kux...")

    fsn = require("usr.bootloader.bootmanager.boot")
    fsn.bmain()
else
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
                sys_register("is", "default") --- register into bootloader registry
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