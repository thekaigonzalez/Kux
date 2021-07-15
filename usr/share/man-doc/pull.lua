local doc = {}

doc.Position = "1"

--- Shows up as "NAME" in the manpage
function doc:Name()
    return "pull - Pull Updates from a specific channel"
end
--- a brief overview of what it does and the commands
function doc:Synopsis()
   return "pull [channel]"
end

function doc:Description()
    return [[
        This Command Pulls the most recent boot manager from the servers.
        Run this command when you're getting notifications, Or you download an older version to stay updated
        with all the latest security features.
    ]]
end

function doc:Copyright()
    return "MIT License"
end

function doc:Series()
    return "GKux Command Palette"
end

return doc