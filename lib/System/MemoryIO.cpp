#include <lua5.4/lua.hpp>
#include <lua5.4/lauxlib.h>
#include <lua5.4/lualib.h>

#include <iostream>
#include <unistd.h>
#include <filesystem>
bool UnsafeMemsetsallowed = false;
int alloclua(lua_State *L)
{
    if (UnsafeMemsetsallowed)
    {
        void* memory = malloc(luaL_checkinteger(L, 1));
    }
    return 1;
}

int assertflua(lua_State *L)
{
    if (UnsafeMemsetsallowed)
    {
        assert(lua_toboolean(L, 1));
    }
    return 1;
}

int allowUluafile(lua_State* L)
{
    UnsafeMemsetsallowed = true;
    return 1;
}

int fastprint(lua_State *L)
{
    if (UnsafeMemsetsallowed) {
        auto memory = malloc(sizeof luaL_checkinteger(L, 1));

        printf("%s", luaL_checkstring(L, 2));

        free(memory);
    }
    else {
        printf("FastPrint() failed!\nwhat(): Universal C API not allowed\n\nRETURN CODE(): 0x0002");
        return -1;
    }
    return 1;
}

extern "C"
{
int luaopen_libmemio(lua_State* L)
{
    lua_register(L, "AllocateMemory", alloclua);
    lua_register(L, "Assert", assertflua);
    lua_register(L, "AllowUniversalLua", allowUluafile);
    lua_register(L, "MemPrint", fastprint);
    return 1;
}
}