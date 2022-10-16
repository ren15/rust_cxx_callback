cmake_minimum_required(VERSION 3.15)
project(mysignal)

include_directories(include)

add_executable(main
src/main.cc
src/mysignal.cc
)

add_library(mysignal SHARED
src/mysignal.cc
)

add_executable(c_main
src/c_main.c
)

target_link_libraries(c_main mysignal)

