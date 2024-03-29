#! /bin/bash
set -ex
. ./env.sh

echo "system uname" $UNAME

if [ "$UNAME" = Darwin ]; then
    brew update
    brew install --build-from-source gtk+3
    # make gcc pkg-config

elif [ -f /etc/lsb-release ]; then
    sudo apt-get update
    sudo apt-get install -y libgtk-3-dev pkg-config \
         xvfb make gcc

elif [ -f /etc/redhat-release ] && grep "release 7" /etc/redhat-release; then
    sudo yum install -y gcc gobject-introspection-devel \
         pkg-config gtk3 make

elif [[ "$UNAME" == "MINGW64_NT"* ]]; then
    # msys2 on PC
    # terminal will be closed after following comand executed and workflow will fail
    # pacman -Syu --noconfirm
    pacman -Sy --noconfirm mingw-w64-x86_64-gtk3 \
           mingw-w64-x86_64-make \
           mingw-w64-x86_64-gcc \
           mingw-w64-x86_64-pkg-config

elif [[ "$UNAME" == "MSYS_NT"* ]]; then
    # travis
    # terminal will be closed after following comand executed
    $msys2 pacman -Syu --noconfirm
    $msys2 pacman -Sy --noconfirm mingw-w64-x86_64-gtk3 \
           mingw-w64-x86_64-make \
           mingw-w64-x86_64-gcc \
           mingw-w64-x86_64-pkg-config
fi
