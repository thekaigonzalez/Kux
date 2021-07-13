//
// Created by Kai Gonzalez on 7/8/21.
//
#include <lua5.3/lua.hpp>
#include <lua5.3/lauxlib.h>
#include <lua5.3/lualib.h>
#include <cpr/cpr.h>
#include <iostream>
#include <unistd.h>

int sleepfunc(lua_State* L)
{
    sleep(luaL_checkinteger(L, 1));
    return 1;
}



extern "C"
{
    int luaopen_libposix(lua_State* L)
    {
        lua_register(L, "thread_sleep", sleepfunc);
        return 1;
    }
}