//
// Created by Kai Gonzalez on 7/8/21.
//
#include <lua5.3/lua.hpp>
#include <lua5.3/lauxlib.h>
#include <lua5.3/lualib.h>
#include <cpr/cpr.h>
#include <iostream>
#include <unistd.h>
#include <filesystem>
int cwdfs(lua_State* L)
{
    lua_pushstring(L, std::filesystem::current_path().c_str());
    return 1;
}

extern "C"
{
int luaopen_libfs(lua_State* L)
{
    lua_register(L, "getworkingdir_posix", cwdfs);
    return 1;
}
}