cmake_minimum_required(VERSION 3.26)

project(ClientFF)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

set(THIRD_LIB_PATH ${CMAKE_SOURCE_DIR}/thirdlib)
set(Qt_LIB_PATH ${THIRD_LIB_PATH}/qt6.5.1_x86)

list(APPEND CMAKE_PREFIX_PATH
    ${Qt_LIB_PATH})

add_subdirectory(src)