cmake_minimum_required(VERSION 2.8.12)
project (helloworld)

include_directories(include)

set(SOURCES src/helloworld.c)

add_executable(helloworld ${SOURCES})

install(TARGETS helloworld DESTINATION /bin)
