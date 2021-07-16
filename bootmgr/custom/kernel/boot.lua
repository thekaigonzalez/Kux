local manager = {}

--- osdev stuff
require('lib.osdev.shared')

---https stuff
require("libhttp")

--- Low level KuxAPI memory functions
require('libmemio')


AllowUniversalLua()


--- entry point to a Kux-Based System.
function manager:bmain()
    print("Hello, My custom world!")
    --[[
        You can create Package managers, Commands, A Bash Prompt, And so much more using the flexible SysBase Kux provides!
    
        Check out FreeKSD for some good modifications and scripting techniques!
    ]]
end

