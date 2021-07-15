---copied template from pull.mandoc

local doc = {}

doc.Position = "1"

--- Shows up as "NAME" in the manpage
function doc:Name()
    return "man - Read Digital Documentation on a specific item"
end
--- a brief overview of what it does and the commands
function doc:Synopsis()
    return "man [page]"
end

function doc:Description()
    return [[
This command shows user generated documentation for reading documentation on certain libraries,
commands, etc...
    ]]
end

function doc:Copyright()
    return "MIT License"
end

function doc:Series()
    return "GKux System Commands Palette"
end

return doc