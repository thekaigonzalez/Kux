#include <lua5.4/lua.hpp>
#include <lua5.4/lauxlib.h>
#include <lua5.4/lualib.h>

//#include <iostream>
//#include <sstream>
//#include <vector>
int main(int argc, char *argv[])
{
//
//    printf("bash> ");
//    std::string bashcmd;
//    getline(std::cin, bashcmd);
//    std::stringstream api;
//
//    api << bashcmd;
//    std::string arg;
//    std::vector<std::string>argvstr{};
//    while (getline(api, arg, ' '))
//    {
//        argvstr.push_back(arg);
//    }
    lua_State *L = luaL_newstate();
    luaL_openlibs(L);
    if (luaL_dofile(L, "./usr/bin/bootchooser.lua") == 1)
    {
        fprintf(stderr,"luaL_dofile failed: %s\n",lua_tostring(L,-1));
    }
    return 0;
}