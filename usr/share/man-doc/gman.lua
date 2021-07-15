---copied template from pull.mandoc

local doc = {}

doc.Position = "1"

--- Shows up as "NAME" in the manpage
function doc:Name()
    return "gman - Generate HTML from KManPage"
end
--- a brief overview of what it does and the commands
function doc:Synopsis()
    return "gman [page]"
end

function doc:Description()
    return [[
This command generates Manual page HTMLs and styles from Man pages stored in usr/share/man-doc.
    ]]
end

function doc:Copyright()
    return "MIT License"
end

function doc:Series()
    return "GKux Extra Command Palette"
end

return doc