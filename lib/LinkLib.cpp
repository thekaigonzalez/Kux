#include <lua5.3/lua.hpp>
#include <lua5.3/lauxlib.h>
#include <lua5.3/lualib.h>

#include <iostream>
#include <unistd.h>
#include <filesystem>



int luaL_dofile_linked(lua_State *L)
{
    std::string str = luaL_checkstring(L, 2);
    luaL_dostring(L, ("require(" + str + ")").c_str());
    luaL_dofile(L, luaL_checkstring(L, 1));

    return 1;
}



extern "C"
{
int luaopen_dev(lua_State* L)
{
    lua_register(L, "gbind", luaL_dofile_linked);
    return 1;
}
}