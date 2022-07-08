--[[ Dup ]]

--[[ Inspired by zypper dup from SUSE Linux ]]

local proc = {}


function proc:Main()
  math.random();
  math.random();
  print("Gathering new kernel...")
  thread_sleep(math.random(1, 3))
  print("Removing...")
  os.remove("usr/bootloader/bootmanager/boot.lua") -- removes the terminal while keeping the command in memory
  print("Downloading master->boot")
  hdofile("https://raw.githubusercontent.com/thekaigonzalez/Kux/master/bootmgr/default/boot.lua",
    "usr/bootloader/bootmanager/boot.lua") -- store the update into a file
  thread_sleep(math.random(1, 5))
  local nv = hgetstring("https://raw.githubusercontent.com/thekaigonzalez/Kux/master/bootmgr/default/version/VERSION.manifest")
  local ver = io.open("usr/dversion/VERSION.manifest", "r")

  local vm = ver:read()

  ver:close()

  if (vm == nv) then
    print("dup: Kernel up to date.")
  else
    print("Would you like to upgrade the kernel?\n")

    print(vm .. " -> " .. nv .. "\n\n")

    io.write("(y/n) (n): ")

    local ans = io.read()

    if (ans == "y") then
      os.remove('usr/dversion/VERSION.manifest')


      dofile("usr/bootloader/bootmanager/boot.lua")
      hdofile("https://raw.githubusercontent.com/thekaigonzalez/Kux/master/bootmgr/default/version/VERSION.manifest", "usr/dversion/VERSION.manifest")

      process.version = hgetstring("https://raw.githubusercontent.com/thekaigonzalez/Kux/master/bootmgr/default/version/VERSION.manifest")
    else
      print("answer: n..., exiting.")
    end
  end
end

return proc
