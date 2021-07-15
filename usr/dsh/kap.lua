require("libposix")
local self = {}

function self:Main(aa)
    if aa[1] == nil or aa[1] == "-h" then
        print("KAP: Kux's Advanced Packaging | ")
        print("Commands:\n\tkap apt-get install <pkg>\n\tkap pull-apt ppa:outdated <pkg>\n\n\tapt-get <action> - Gets a package from the Package repository.\n\tpull-apt <ppa:type> <context> - Pulls a package from the repository depending on the parameters.")
    end
    if aa[1] == "apt-get" then

    elseif aa[1] == "pull-apt" then
        if aa[2] == nil then
            print("missing ppa ")
        else

            if aa[2] == "ppa:outdated" then
                print("GET " .. aa[3])
                thread_sleep(1)
                -- check if the file exists on server
                if hgetstring("https://raw.githubusercontent.com/thekaigonzalez/Kux/master/usr/dsh/" .. aa[3] .. ".lua") == "404: Not Found" then
                    print("Module not found! Returned 404 when i tried contacting servers.")
                else
                    hdofile("https://raw.githubusercontent.com/thekaigonzalez/Kux/master/usr/dsh/" .. aa[3] .. ".lua", "usr/dsh/" .. aa[3] .. ".lua")
                    print("Finished installing " .. aa[3])
                    print("(some packages require restarts to be active!)")
                end
            end
        end
    elseif aa[1] == "boop" then
        print("That is not a secret in the program.")
    end
end

return self