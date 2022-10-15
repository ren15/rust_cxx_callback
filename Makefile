.PHONY: $(MAKECMDGOALS)

help:
	echo "help"

cxx:
	g++ -Wall -o main cxx/src/main.cc cxx/src/mysignal.cc -I cxx/include -std=c++17

run_cxx: cxx
	./main

cxx_so:
	g++ -Wall -fPIC -shared -o libmysignal.so cxx/src/mysignal.cc -I cxx/include -std=c++17

c: cxx_so
	gcc -Wall -o c_main cxx/src/c_main.c -I cxx/include -std=c11 -L. -lmysignal

run_c: c
	LD_LIBRARY_PATH=${PWD} ./c_main

rust_run:
	cd rust_caller && LD_LIBRARY_PATH=.. cargo r

