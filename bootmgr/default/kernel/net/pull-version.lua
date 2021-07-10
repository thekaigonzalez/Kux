--- Pulls the current version from Git.
--- If the version of the process is not the same, Pull boot file (since it's really the only changed file), And any other
--- Filesystem-Known files such as the net version
--- Also pull PATCH-NOTES.txt to read patch notes :)

require "lib.osdev.shared"

--- I need the hgetstring(website) function.
require "libhttp"

process.version = "1.4.2"


function isuptodate()
    if hgetstring("https://raw.githubusercontent.com/thekaigonzalez/Kux/master/bootmgr/default/version/VERSION.manifest") ~= process.version then
        print("Updates needed!")
        print(hgetstring("https://raw.githubusercontent.com/thekaigonzalez/Kux/master/bootmgr/default/version/PATCH-NOTES.txt"))
    end
end