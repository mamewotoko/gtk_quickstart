#! /bin/sh
gcc $(pkg-config --cflags --libs gtk+-3.0) main.c -o main
