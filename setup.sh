#! /bin/bash
if [ "$UNAME" = Darwin ]; then
    brew update
    brew install gtk+3 pkg-config make gcc

elif [ -f /etc/lsb-release ]; then
    sudo apt-get update
    sudo apt-get install -y libgtk-3-dev pkg-config \
         xvfb make gcc

elif [ -f /etc/redhat-release ] && grep "release 7" /etc/redhat-release; then
    sudo yum install -y gcc gobject-introspection-devel \
         pkg-config gtk3 make

elif [[ "$UNAME" == "MINGW64_NT"* ]]; then
    # msys2 on PC
    pacman -Syu --noconfirm
    pacman -Sy --noconfirm mingw-w64-x86_64-gtk3 mingw-w64-x86_64-make mingw-w64-x86_64-gcc

elif [[ "$UNAME" == "MSYS_NT"* ]]; then
    # travis 
    $msys2 pacman -Syu --noconfirm
    $msys2 pacman -Sy --noconfirm mingw-w64-x86_64-gtk3 \
           mingw-w64-x86_64-make \
           gtk3mingw-w64-x86_64-gcc
fi
