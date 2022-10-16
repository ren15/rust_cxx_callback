cmake_minimum_required(VERSION 3.15)
project(mysignal)

include_directories(include)

add_executable(main
src/main.cc
src/mysignal.cc
)

