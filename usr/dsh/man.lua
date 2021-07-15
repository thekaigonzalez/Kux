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
function file_exists(name)
    local f=io.open(name,"r")
    if f~=nil then io.close(f) return true else return false end
end
function self:Main(ar)
    if isdir("usr/share/man-doc") then
        if ar[1] == nil then
            print("what are you looking for?\ntry `man man`")
        else
            if ar[1] == "-h" then
                print("MAN Page Language for Kux\nCommands:\n\tman <doc>\n\tman -k <doc>\n\tman -e <doc>")
            elseif ar[1] == "-i" then
                if ar[2] == nil or #ar < 2 then
                    print("missing document!")
                else
                    if hgetstring("https://raw.githubusercontent.com/thekaigonzalez/Kux/master/usr/share/man-doc/" .. ar[2] .. ".lua") ~= "404: Not Found" then
                        hdofile("https://raw.githubusercontent.com/thekaigonzalez/Kux/master/usr/share/man-doc/" .. ar[2] .. ".lua", "usr/share/man-doc/" .. ar[2] .. ".lua")
                    else
                        print("manual entry download '" .. ar[2] .. "' not found in server.")
                    end
                end
            elseif ar[1] == "-k" then
                if ar[2] == nil or #ar < 2 then
                    print("no entry found for ''")
                else
                    if file_exists("usr/share/man-doc/" .. ar[2] .. ".lua") then
                        local manpage = require('usr.share.man-doc.' .. ar[2])
                        print(ar[2] .. "(" .. manpage.Position .. ") ".. manpage:Series() .. " " .. ar[2] .. "(" .. manpage.Position .. ") ")
                        print("\nNAME\n\t" .. manpage:Name() .. "\nDESCRIPTION\n\t" .. manpage:Description() .. "\nSYNOPSIS\n\t" .. manpage:Synopsis() .. "\nCOPYRIGHT\n\tThis document is licensed under the " .. manpage:Copyright())
                    else
                        print("no manual entry found for '" .. ar[2] .. "'")
                    end

                end



            else
                if file_exists("usr/share/man-doc/" .. ar[1] .. ".lua") then
                    clear_posix()
                    local manpage = require('usr.share.man-doc.' .. ar[1])
                    print(ar[1] .. "(" .. manpage.Position .. ") ".. manpage:Series() .. " " .. ar[1] .. "(" .. manpage.Position .. ") ")
                    print("\nNAME\n\t" .. manpage:Name() .. "\nDESCRIPTION\n\t" .. manpage:Description() .. "\nSYNOPSIS\n\t" .. manpage:Synopsis() .. "\nCOPYRIGHT\n\tThis document is licensed under the " .. manpage:Copyright())
                else
                    print("no manual entry found for '" .. ar[1] .. "'")
                end

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