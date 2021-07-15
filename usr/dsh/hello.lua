local self = {}

self.Message = "Hello, World!"

function self:Main(a)
    if a[1] == nil then
        -- do nothing
    elseif a[1] == "-h" then
        print("Prints hello world.\nYou could use traditional [Hello World] (-tr)\nOneWord (-ow) [Hello]\nOr, Simply use `hello`.")
    elseif a[1] == "-tr" then
        self.Message = "Hello World"
    end
    print(self.Message)
end

return self