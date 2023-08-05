find_package(Qt6 6.5 COMPONENTS Quick Gui REQUIRED)
find_package(FramelessHelper REQUIRED COMPONENTS Core Quick)

qt_standard_project_setup(REQUIRES 6.5)

# 获取CPP
file(GLOB_RECURSE CPP_FILES *.cpp *.h)

# 获取QML
file(GLOB_RECURSE QML_PATHS *.qml)
foreach(filepath ${QML_PATHS})
    string(REPLACE "${CMAKE_CURRENT_SOURCE_DIR}/" "" filename ${filepath})
    list(APPEND QML_FILES ${filename})
endforeach(filepath)
list(REMOVE_DUPLICATES QML_FILES)

# 获取静态资源
file(GLOB_RECURSE RES_PATHS *.png *.jpg *.svg *jpeg)
foreach(filepath ${RES_PATHS})
    string(REPLACE "${CMAKE_CURRENT_SOURCE_DIR}/" "" filename ${filepath})
    list(APPEND RES_FILES ${filename})
endforeach(filepath)
list(REMOVE_DUPLICATES RES_FILES)

# 设置可执行文件输出路径
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_SOURCE_DIR}/bin)

# 添加可执行文件
qt_add_executable( ${PROJECT_NAME} WIN32
    ${CPP_FILES}
)

# Qt6.5 设置policy
if(QT_KNOWN_POLICY_QTP0001)
    qt_policy(SET QTP0001 OLD)
endif()

# 添加QML模块
qt_add_qml_module( ${PROJECT_NAME}
    URI ${PROJECT_NAME}
    QML_FILES ${QML_FILES}
    RESOURCES ${RES_FILES}
)

# 链接库
target_link_libraries(${PROJECT_NAME} PRIVATE 
    Qt6::Gui
    Qt6::Quick
    FramelessHelper::Core
    FramelessHelper::Quick)