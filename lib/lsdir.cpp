#include <lua5.3/lua.hpp>
#include <lua5.3/lauxlib.h>
#include <lua5.3/lualib.h>
#include <cpr/cpr.h>
#include <iostream>
#include <unistd.h>
#include <filesystem>


int lsdirec(lua_State* L)
{
    for (const auto& a : std::filesystem::directory_iterator(luaL_checkstring(L, 1))) {
    printf("%s\n", a.path().c_str());
    }
    return 1;
}


extern "C"
{
int luaopen_libsfs(lua_State* L)
{
    lua_register(L, "listdirectory", lsdirec);
    return 1;
}
}