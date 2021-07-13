# Kux
Kux is a Lua filesystem manager & loader.

Open bin/shch and let it work it's magic.

Containing its own:

- Http library
- Symbol Searching Library
- Lua Loader
- Portable Sleeping Library
- Posix library
- Portable System Calls library
- Simple Loader
- Linux man-page style documentation (https://thekaigonzalez.github.io/Kux/head/)

Kux is completely from scratch. No external libraries except for maybe luarocks are used.

> shch Opens bootchooser.lua. then, installs a loader if you have none, asks to load one if you do. Using C++ as a backend loader, Managing multiple versions of Kux is simple.

## Kux VS KTerminal: How do they compare?

Well, Kux is a performant, Dynamic terminal written in C++ and Lua, with a little C innit ;)

KTerminal, is a bulky bash replication written in Python

Kux

- written in lua & C
- Contains runtimes for running Kux apps
- Contains solid Lua APIs which interface with C++ standard apis.
- No Unnecessary Codes
KTerminal

- Written in Python
- Bulky and slow when it comes to HTTP Get Requests.
- Contains unnecessary codes which slow KTerminal up.

### Performance Comparison

Kux is approximately a SECOND faster than KTerminal.

## The Filesystem
The Filesystem rule is (Unix x86 Format).

