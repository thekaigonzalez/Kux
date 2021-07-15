

local self = {}

function self:Main(ar)
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

end

return self