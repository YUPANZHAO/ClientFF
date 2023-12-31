cmake_minimum_required(VERSION 3.26)

project(ClientFF)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

set(EXEC_RES "${CMAKE_SOURCE_DIR}/${PROJECT_NAME}.rc")

set(THIRD_LIB_PATH ${CMAKE_SOURCE_DIR}/thirdlib)
set(Qt_LIB_PATH ${THIRD_LIB_PATH}/qt_6.5.1_x64)
set(FRAMELESS_HELPER_LIB_PATH ${THIRD_LIB_PATH}/framelesshelper_2.4.2_x64/lib64/cmake)

list(APPEND CMAKE_PREFIX_PATH
    ${Qt_LIB_PATH}
    ${FRAMELESS_HELPER_LIB_PATH})

set(FRAMELESSHELPER_IMPORT_DIR "${FRAMELESS_HELPER_LIB_PATH}/qml")
list(APPEND QML_IMPORT_PATH "${FRAMELESSHELPER_IMPORT_DIR}")
list(REMOVE_DUPLICATES QML_IMPORT_PATH)
set(QML_IMPORT_PATH ${QML_IMPORT_PATH} CACHE STRING "Qt Creator extra QML import paths" FORCE)

add_subdirectory(src)