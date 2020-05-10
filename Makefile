mini: mini.c
	gcc `pkg-config --cflags --libs gtk+-3.0` $< -o $@

clean:
	rm -f mini *.o
