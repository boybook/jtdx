# JTDX

<div align="center">
<img src="https://jtdx-improved.sourceforge.io/logo.jpg" alt="JTDX Logo" width="200"/>

[![License: GPL v3](https://img.shields.io/badge/License-GPLv3-blue.svg)](https://www.gnu.org/licenses/gpl-3.0)
[![Website](https://img.shields.io/badge/Website-jtdx.tech-blue)](https://jtdx.tech)
[![Mailing List](https://img.shields.io/badge/Mailing%20List-jtdx.groups.io-green)](https://jtdx.groups.io/g/main)

*A powerful amateur radio communication software for weak signal modes*
</div>

## Overview

Copyright (C) 2001-2020 by Joe Taylor, K1JT.
Copyright (C) 2016-2020 by Igor Chernikov UA3DJY and Arvo Järve ES1JA.

JTDX is a sophisticated computer program designed for amateur radio enthusiasts to communicate using very weak signals. It's a fork of WSJT-X, enhanced with additional features and improvements.

JTDX is forked from  WSJT-X, a computer  program  dedicated to amateur radio communication using very weak signals. 

The program runs equally well on Windows, Macintosh and Linux systems, and installation packages are available for all three platforms.

JTDX is an open-source project released under the GPL license (See COPYING). If you have  programming or documentation skills or would like to  contribute to the project in other ways,please make your interests known to the development team.

---

This repository is maintained by BG5DRB, focusing on build overall optimization while preserving the core functionality developed by the original JTDX team.

## Quick Start

### Binary Installation

The easiest way to get started is to download the pre-built binary packages from our website:

[Download JTDX](https://jtdx.tech)

### Building from Source

#### Prerequisites

- Qt 5.9 or later
- FFTW v3 (single precision)
- Hamlib library
- CMake
- Asciidoc

#### Build Instructions

1. **Install Dependencies**

   **Linux:**
   ```bash
   # Install Qt5 and FFTW
   sudo apt-get install qt5-default qtmultimedia5-dev libqt5serialport5-dev libfftw3-dev
   ```

   **macOS:**
   ```bash
   # Using MacPorts
   sudo port install qt5 fftw-3-single +gcc9 asciidoc libusb-devel
   ```

2. **Build Hamlib**
   ```bash
   mkdir ~/hamlib-prefix
   cd ~/hamlib-prefix
   git clone git://git.code.sf.net/p/jtdx/hamlib src
   cd src
   ./bootstrap
   mkdir ../build
   cd ../build
   ../src/configure --prefix=$HOME/hamlib-prefix \
      --disable-static --enable-shared --without-readline \
      --without-indi --without-cxx-binding --disable-winradio
   make
   make install-strip
   ```

3. **Build JTDX**
   ```bash
   mkdir -p ~/jtdx-prefix/build
   cd ~/jtdx-prefix
   git clone git://git.code.sf.net/p/jtdx/code src
   cd build
   cmake -D CMAKE_PREFIX_PATH=~/hamlib-prefix ../src
   cmake --build .
   cmake --build . --target install
   ```

For detailed build instructions for specific platforms, please refer to the [INSTALL](INSTALL) file.

## Contributing

JTDX is an open-source project released under the GPL license. We welcome contributions in various forms:

- Code improvements
- Documentation
- Bug reports
- Feature suggestions
- Testing and feedback

To get involved, please join our [mailing list](https://jtdx.groups.io/g/main) or contact the development team.

## License

This project is licensed under the GNU General Public License v3.0 - see the [COPYING](COPYING) file for details.

## Acknowledgments

### Original Development
- Original WSJT-X development by Joe Taylor, K1JT
- JTDX fork development by Igor Chernikov UA3DJY and Arvo Järve ES1JA

### Current Maintenance
- Build automation and optimization by BG5DRB

### Community
- All contributors and the amateur radio community

---

*73 de JTDX Development Team* 