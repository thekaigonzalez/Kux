
function split(s, delimiter)
    result = {};
    for match in (s..delimiter):gmatch("(.-)"..delimiter) do
        table.insert(result, match);
    end
    return result;
end


process = {}
process.argv = {}
function process.gAddArguments(string)
    local lns = split(string, " ")
    i = 0
    -- works!
    for _,V in ipairs(lns) do
        process.argv[i] = V;
        i = i + 1
    end
end

