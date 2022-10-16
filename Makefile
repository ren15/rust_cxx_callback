.PHONY: $(MAKECMDGOALS)

help:
	echo "help"

cxx:
	g++ -Wall -o main cxx/src/main.cc cxx/src/mysignal.cc -I cxx/include -std=c++17

run_cxx: 
	./main

cxx_so:
	g++ -Wall -fPIC -shared -o libmysignal.so cxx/src/mysignal.cc -I cxx/include -std=c++17

c: 
	gcc -Wall -o c_main cxx/src/c_main.c -I cxx/include -std=c11 -L. -lmysignal

run_c: 
	LD_LIBRARY_PATH=${PWD} ./c_main

run_rust:
	cd rust_caller && cargo clean && LD_LIBRARY_PATH=.. cargo r

run_docker:
	docker build -t local .
	docker run local bash -c "make cxx_so && make c && make run_c"
	docker run local bash -c "make cxx && make run_cxx"
	docker run local bash -c "make cxx_so && make run_rust"

cmake_configure:
	mkdir -p build
	cmake -S cxx -B build
cmake_build:
	cmake --build build
cmake_run:
	LD_LIBRARY_PATH=${PWD}/build ./build/main
