//
// Created by Kai Gonzalez on 7/8/21.
//
#include <lua5.4/lua.hpp>
#include <lua5.4/lauxlib.h>
#include <lua5.4/lualib.h>
#include <cpr/cpr.h>
#include <iostream>
#include <unistd.h>
#include <filesystem>
namespace fs = std::filesystem;


int clearsys_posix(lua_State* L)
{
    system("clear");
    return 1;
}

int clearsys_winapi(lua_State* L)
{
    system("cls");
    return 1;
}

int ls_return(lua_State* L)
{
    std::stringstream FStream;
    for (const auto& path : std::filesystem::directory_iterator(luaL_checkstring(L, 1)))
    {
        FStream << path.path().string() << ",\n";
    }
    lua_pushstring(L, FStream.str().c_str());
    return 1;
}

int mkdir_sys(lua_State* L)
{
    std::filesystem::create_directory(luaL_checkstring(L, 1));
    return 1;
}

int invoke_command(lua_State *L)
{
    system(luaL_checkstring(L, 1));
    return 1;
}

int copy_files(lua_State* L)
{
    fs::copy(luaL_checkstring(L, 1), luaL_checkstring(L, 2));
    return 1;
}

int sys_writeregistry(lua_State* L)
{
    std::string regname = luaL_checkstring(L, 1);
    std::string regdata = luaL_checkstring(L, 2);
    std::ofstream REGISTRY_FILE("usr/bootloader/" + regname + ".txt");
    REGISTRY_FILE << regdata;
    REGISTRY_FILE.close();
    return 1;
}

extern "C"
{
    int luaopen_libsyscalls(lua_State* L)
    {
        lua_register(L, "clear_posix", clearsys_posix);
        lua_register(L, "clear_windows", clearsys_winapi);
        lua_register(L, "sys_listdir", ls_return);
        lua_register(L, "sys_mkdir", mkdir_sys);
        lua_register(L, "invoke_cmd", invoke_command);
        lua_register(L, "sysfcpy", copy_files);
        lua_register(L, "sys_register", sys_writeregistry);
        return 1;
    }
}