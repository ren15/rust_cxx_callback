.PHONY: $(MAKECMDGOALS)

help:
	echo "help"

cxx:
	g++ -Wall -o main cxx/src/main.cc cxx/src/mysignal.cc -I cxx/include -std=c++17

run_cxx:
	./main

c:
	gcc -Wall -o c_main cxx/src/c_main.c -I cxx/include -std=c11

run_c:
	./c_main

