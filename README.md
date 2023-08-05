# ClientFF

## 简介

桌面客户端搭建模板。

* 框架：Qt6.5.1
* 编译器：Visual Studio Community 2022 Release - x86

## 第三方库编译

### Qt6.5.1_x86

1、Qt6.5.1 源码下载：https://download.qt.io/official_releases/qt/6.5/6.5.1/single/qt-everywhere-src-6.5.1.zip

2、Visual Studio 2022 下载安装

3、CMake 3.26（安装 VS2022 时勾选即可）

4、Python3

5、Perl 5.32 64位 https://strawberryperl.com/download/5.32.1.1/strawberry-perl-5.32.1.1-64bit.msi

6、ninja 1.11.1 https://github.com/ninja-build/ninja/releases （解压后添加到系统环境变量）

``` shell
# 使用管理员权限打开 x86 Native Tools Command Prompt for VS 2022 命令行，进入下载后解压的源码根目录
cd D:\qt-everywhere-src-6.5.1

# 编译配置
configure -prefix E:\thirdlib\qt6.5.1_x86\ -debug-and-release -opensource

# 编译源码
cmake --build . --parallel

# 安装
cmake --install .

# PS: 若最后安装出现如下报错，可以尝试执行以下命令，手动指定安装路径
# -- Install configuration: "Debug"
# CMake Error at qtbase/cmake_install.cmake:41 (file):
#   file cannot create directory:
#   E:/thirdlib/qt6.5.1_x86;D:/qt-everywhere-src-6.5.1/
# -debug-and-release/lib/cmake/Qt6BuildInternals.
#   Maybe need administrative privileges.
# Call Stack (most recent call first):
# cmake_install.cmake:42 (include)
cmake --install . --prefix E:\thirdlib\qt6.5.1_x86
```

## 编译前准备

### 链接第三方库

因为 `thirdlib` 占用空间过于大，建议使用链接的方式引入第三方库。

Windows下链接可使用以下命令，打开 `cmd`。

``` shell 
mklink /J E:\project\ClientFF\thirdlib E:\thirdlib
```

### 环境变量

项目编译好后的可执行文件执行需要链接 `Qt` 的一些动态库，若采用 `cmake` 去拷贝到同级目录，既延长了编译时间又产生不必要的空间浪费，所以需将第三方库 `thirdlib` 中的 `qt6.5.1_x86/bin` 目录添加到系统的环境变量 `PATH` 中。

## 编译运行

建议使用 `VSCode`，安装 `CMake插件`，选择 `Kit` 为 `Visual Studio Community 2022 Release - x86`，然后点击小虫子按钮，可一键编译运行。

也可以手动执行以下命令进行编译。

``` shell
# 进入项目根目录
cd E:\project\ClientFF

# 创建编译目录
mkdir build

# 进入编译目录
cd .\build\

# 编译并生成可执行文件
cmake -A win32 -DCMAKE_BUILD_TYPE=Release ..
cmake --build . --config Release

# 运行
..\bin\Release\ClientFF.exe
```