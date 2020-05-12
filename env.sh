export UNAME="$(uname)"


if [[ "$UNAME" == "MSYS_NT"* ]]; then
   export PATH=/mingw64/bin:$PATH
   export PKG_CONFIG_PATH=/mingw64/lib/pkgconfig
fi     
