
cmake_minimum_required(VERSION 3.4.1)
PROJECT(native_app)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_INCLUDE_CURRENT_DIR ON)
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++11 -Wall -Werror")


include_directories(include/)

add_library( # Sets the name of the library.
             native_app

             # Sets the library as a shared library.
             SHARED

             # Provides a relative path to your source file(s).
             native_app.cpp )

find_library( # Sets the name of the path variable.
              log-lib

              # Specifies the name of the NDK library that
              # you want CMake to locate.
              log )

target_link_libraries( # Specifies the target library.
                       native_app

                       # Links the target library to the log library
                       # included in the NDK.
                       ${log-lib} )
