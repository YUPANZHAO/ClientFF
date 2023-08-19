set(CMAKE_AUTOUIC ON)
set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)

find_package(Qt6 6.5 COMPONENTS Quick Gui REQUIRED)
find_package(FramelessHelper REQUIRED COMPONENTS Core Quick)

qt_standard_project_setup(REQUIRES 6.5)

# 获取CPP
file(GLOB_RECURSE CPP_FILES *.cpp *.h)

# 开始生成qrc文件
set(QRC_FIEL_NAME "res.qrc")
set(QRC_FILE_PATH "${CMAKE_CURRENT_SOURCE_DIR}/${QRC_FIEL_NAME}")
file(WRITE ${QRC_FILE_PATH} "<RCC>\n\t<qresource prefix=\"/ClientFF/\">\n")

# 获取QML
file(GLOB_RECURSE QML_PATHS *.qml)
foreach(filepath ${QML_PATHS})
    string(REPLACE "${CMAKE_CURRENT_SOURCE_DIR}/" "" filename ${filepath})
    file(APPEND ${QRC_FILE_PATH} "\t\t<file>${filename}</file>\n")
endforeach(filepath)

# 获取静态资源
file(GLOB_RECURSE RES_PATHS *.png *.jpg *.svg *jpeg)
foreach(filepath ${RES_PATHS})
    string(REPLACE "${CMAKE_CURRENT_SOURCE_DIR}/" "" filename ${filepath})
    list(APPEND RES_FILES ${filename})
    file(APPEND ${QRC_FILE_PATH} "\t\t<file>${filename}</file>\n")
endforeach(filepath)

# qrc文件生成结束
file(APPEND ${QRC_FILE_PATH} "\t</qresource>\n</RCC>")

# 设置可执行文件输出路径
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_SOURCE_DIR}/bin)

# 添加可执行文件
qt_add_executable( ${PROJECT_NAME} WIN32
    ${CPP_FILES}
    ${QRC_FIEL_NAME}
)

# 链接库
target_link_libraries(${PROJECT_NAME} PRIVATE 
    Qt6::Gui
    Qt6::Quick
    FramelessHelper::Core
    FramelessHelper::Quick)

# 拷贝配置文件到执行目录
add_custom_command(TARGET ${PROJECT_NAME} POST_BUILD COMMAND ${CMAKE_COMMAND} -E copy_directory "${PROJECT_SOURCE_DIR}/config" "$<TARGET_FILE_DIR:${PROJECT_NAME}>/config")