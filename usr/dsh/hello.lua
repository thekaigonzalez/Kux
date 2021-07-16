local self = {}

self.Message = "Hello, World!"
self.Pm = true
function self:Main(a)
    if a[1] == nil then
        -- do nothing
    elseif a[1] == "-h" then
        print("Prints hello world.\nYou could use traditional [Hello World] (-tr)\nOneWord (-ow) [Hello]\nOr, Simply use `hello`.")
        self.Pm = false
    elseif a[1] == "-tr" then
        self.Message = "Hello World"
    elseif a[1] == "-ow" then
        self.Message = "Hello"
    elseif a[1] == "hello" then
        print("Don't you tell me hello, I'm telling you hello!")
        self.Pm = false
    end

    if self.Pm == true then
        print(self.Message)
    end

    self.Pm = true
end

return self