--- Pulls the current version from Git.
--- If the version of the process is not the same, Pull boot file (since it's really the only changed file), And any other
--- Filesystem-Known files such as the net version
--- Also pull PATCH-NOTES.txt to read patch notes :)

require "lib.osdev.shared"

--- I need the hgetstring(website) function.
require "libhttp"

process.version = io.open("bootmgr/default/version/VERSION.manifest"):read()
function ReadLine(f, line)
    local i = 1 -- line counter
    for l in f:lines() do -- lines iterator, "l" returns the line
        if i == line then return l end -- we found this line, return it
        i = i + 1 -- counting lines
    end
    return "" -- Doesn't have that line
end

function isuptodate()
    local str = ""
    local i = 0
    for l in io.open("bootmgr/default/version/VERSION.manifest"):lines() do
        if i == 0 then
            str = str .. l
        end
        i = i + 1
    end
    print("LINE: " .. hgetstring("https://raw.githubusercontent.com/thekaigonzalez/Kux/master/bootmgr/default/version/VERSION.manifest") .. "")

    if str ~= hgetstring("https://raw.githubusercontent.com/thekaigonzalez/Kux/master/bootmgr/default/version/VERSION.manifest") then
        print("Updates needed!")
        print(hgetstring("https://raw.githubusercontent.com/thekaigonzalez/Kux/master/bootmgr/default/version/PATCH-NOTES.txt"))
    end
end