//
// Created by Kai Gonzalez on 7/6/21.
//

#include <lua5.4/lua.h>
#include <lua5.4/lualib.h>
#include <lua5.4/lauxlib.h>
#include <string.h>
#include <stdio.h>
#include <dlfcn.h>

int getFILEDlsym(lua_State* L)
{
    typedef void (*lib_func)();
    const char* fs = luaL_checkstring(L, 1);
    void *lib = dlopen(fs, RTLD_NOW); //RTLD_LAZY=0x00001
    lib_func func = dlsym(lib, luaL_checkstring(L, 2));
    func();
    return 1;
}

int luaopen_symblib(lua_State* L)
{
    lua_register(L, "regisym", getFILEDlsym);
    return 1;
}