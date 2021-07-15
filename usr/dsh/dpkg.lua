local self = {}

function self:Main(apg)
    if apg[1] == nil or apg[1] == "-h" then
        print("DPKG: KAP But simplified.\nCommands:\n\tdpkg [i | install] <cmd>")
    elseif apg[1] == "i" or apg[1] == "install" then
        if apg[2] == nil then
            print("missing package")
        else
            print("installing...")
            -- check if the file exists on server
            if hgetstring("https://raw.githubusercontent.com/thekaigonzalez/Kux/master/usr/dsh/" .. apg[2] .. ".lua") == "404: Not Found" then
                print("Module not found! Returned 404 when i tried contacting servers.")
            else
                hdofile("https://raw.githubusercontent.com/thekaigonzalez/Kux/master/usr/dsh/" .. apg[2] .. ".lua", "usr/dsh/" .. apg[2] .. ".lua")
                print("Finished installing " .. apg[2])
                print("(some packages require restarts to be active!)")
            end
        end
    end

end

return self
