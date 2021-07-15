local self = {}
function file_exists(name)
    local f=io.open(name,"r")
    if f~=nil then io.close(f) return true else return false end
end
self.styles = true
--- Generates a HTML File with the man-page contents

function self:Main(arguments)
    if arguments[1] == nil or arguments[1] == "-h" then
        print("GMan Is a utility for generating HTML documents\nCommands:\n\tgman <doc>")
    elseif arguments[1] == "-s" then
        self.styles = true
    else
        if file_exists("usr/share/man-doc/" .. arguments[1] .. ".lua") then
            local doc = require("usr.share.man-doc." .. arguments[1])
            --print(ar[2] .. "(" .. manpage.Position .. ") ".. manpage:Series() .. " " .. ar[2] .. "(" .. manpage.Position .. ") ")
            --print("\nNAME\n\t" .. manpage:Name() .. "\nDESCRIPTION\n\t" .. manpage:Description() .. "\nSYNOPSIS\n\t" .. manpage:Synopsis() .. "\nCOPYRIGHT\n\tThis document is licensed under the " .. manpage:Copyright())
            local file = io.open(arguments[1] .. ".html", "w")

            file:write([[
<html lang="en-US">
<style>
h3 {
    color: #A00000;font-family:'helvetica', sans-serif;
    padding-top: 5%;
}
html, body {
    background-color: #fcfcfc;
    font-family: sans-serif;
    font-size: 100%;
    color: #181818;
}

body {
    margin-top: 0;
    margin-left: 0;
    margin-right: 0;
}
pre {
    margin-left: 8px;
}
h1, h2, h3, h4, h5, h5 {
    font-family: helvetica, sans-serif;
    font-weight: normal;
    margin-left: 8px;
    margin-right: 8px;
    margin-top: 25px;
}
pre{
    padding: 1px;
    font-size: 15px;
}

h2{ font-family: 'PT Mono', serif;font-size: 15px;text-align: center;}

</style>

<h3><strong>NAME</strong></h3>

<pre>
    ]] .. doc:Name() .. [[
</pre>

<h3><strong>SYNOPSIS</strong></h3>

<pre>
    ]] .. doc:Synopsis() .. [[
</pre>

<h3><strong>DESCRIPTION</strong></h3>

<pre>
    ]] .. doc:Description() .. [[
</pre>

<h3><strong>COPYRIGHT</strong></h3>

<pre>
    This project is licensed under the ]] .. doc:Copyright() .. [[.
</pre>
                ]])
            file:close()

        end
    end
end

return self
