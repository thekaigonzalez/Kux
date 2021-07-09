all:
	g++ src/initial.cpp -std=c++11 -llua -llua5.4 -o bin/shch
	g++ lib/http.cpp -std=c++11 -lcpr -shared -fPIC -llua -llua5.4 -o ./libhttp.so
	g++ lib/posix_thread_sleep.cpp -std=c++11 -lcpr -shared -fPIC -llua -llua5.4 -o ./libposix.so
	g++ lib/luafs.cpp -std=c++17 -lcpr -shared -fPIC -llua -llua5.4 -o ./libfs.so
	g++ lib/libsys.cpp -std=c++17 -lcpr -shared -fPIC -llua -llua5.4 -o ./libsyscalls.so

	gcc lib/symlib.c -fPIC -llua5.4 -shared -Wall -o ./symlib.so