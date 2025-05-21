#!/bin/bash
set -e

# 1. 进入项目根目录
cd "$(dirname "$0")"

# 2. 清理旧的 build 目录
rm -rf build
mkdir build
cd build

# 3. 设置编译器
export CC=clang
export CXX=clang++
export FC=/opt/homebrew/bin/gfortran-13
export CMAKE_Fortran_COMPILER=/opt/homebrew/bin/gfortran-13

# 4. 配置 CMake
cmake \
  -D CMAKE_PREFIX_PATH="$(brew --prefix qt@5)/lib/cmake/Qt5;/opt/homebrew/opt/webp;/usr/local" \
  -D Qt5_DIR="$(brew --prefix qt@5)/lib/cmake/Qt5" \
  -D CMAKE_INSTALL_PREFIX="install" \
  -D CMAKE_OSX_SYSROOT="$(xcrun --sdk macosx --show-sdk-path)" \
  -D CMAKE_BUILD_TYPE=Release \
  -D WSJT_GENERATE_DOCS=OFF \
  -D WSJT_SKIP_MANPAGES=ON \
  -D fixup_library_dirs="$(brew --prefix webp)/lib;$(brew --prefix libheif)/lib;/opt/homebrew/lib/gcc/current" \
  -D CMAKE_C_COMPILER=clang \
  -D CMAKE_CXX_COMPILER=clang++ \
  -D CMAKE_Fortran_COMPILER=/opt/homebrew/bin/gfortran-13 \
  ..

# 5. 编译
cmake --build . --config Release -j $(sysctl -n hw.ncpu)

# 6. 安装
cmake --install . --config Release

# 7. 代码签名
codesign --force --deep --sign - ./install/jtdx.app

echo "✅ JTDX 构建完成！"