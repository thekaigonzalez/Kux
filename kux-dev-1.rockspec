package = "Kux"
version = "dev-1"
source = {
   url = "*** please add URL for source tarball, zip or repository here ***"
}
description = {
   summary = "Open bin/shch and let it work it's magic.",
   detailed = "shch Opens bootchooser.lua. And installs a loader if you have none, asks to load one if you do. Using C++ as a backend loader, Managing multiple versions of Kux is simple.",
   homepage = "github.com/thekaigonzalez/Kux",
   license = "G-A-GPL"
}
build = {
   type = "builtin",
   modules = {},
   install = {
      bin = {}
   }
}
