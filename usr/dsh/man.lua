require("libsyscalls")

--- Check if a file or directory exists in this path
function exists(file)
    local ok, err, code = os.rename(file, file)
    if not ok then
        if code == 13 then
            -- Permission denied, but it exists
            return true
        end
    end
    return ok, err
end

--- Check if a directory exists in this path
function isdir(path)
    -- "/" works on both Unix and Windows
    return exists(path.."/")
end


local self = {}

function self:Main(ar)
    if isdir("usr/share") then
        if ar[1] == nil then
            print("what are you looking for?\ntry `man man`")
        elseif ar[1] ~= nil then
            if ar[1] == "-h" then
                print("MAN Page Language for Kux\nCommands:\n\tman <doc>\n\tman -k <doc>\n\tman -e <doc>")
            else
                local manpage = require('usr.share.man-doc.' .. ar[1])
                print(ar[1] .. "(" .. manpage.Position .. ") ".. manpage:Series() .. " " .. ar[1] .. "(" .. manpage.Position .. ") ")
                print("\nNAME\n\t" .. manpage:Name() .. "\nDESCRIPTION\n\t" .. manpage:Description() .. "\nSYNOPSIS\n\t" .. manpage:Synopsis() .. "\nCOPYRIGHT\n\tThis document is licensed under the " .. manpage:Copyright())
            end

        end

    else
        print("downloading man-docs...")
        thread_sleep(2)
        print("cleaning threads... (1/2)")
        thread_sleep(2)
        print("cleaning threads... (2/2)")
        thread_sleep(1)
        print("Making directories ... (1/1)")
        sys_mkdir("usr/share")
        sys_mkdir("usr/share/man-doc")
        thread_sleep(1)
        print("Done installing! Type man -i <document> To install a document driver.")
    end

end

return self