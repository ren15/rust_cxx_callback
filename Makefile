.PHONY: $(MAKECMDGOALS)

export REPO_DIR=${PWD}
export BUILD_DIR=${REPO_DIR}/build
export SOURCE_DIR=${REPO_DIR}/cxx

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
	docker run local bash -c "make cmake_configure && make cmake_build && make cmake_run"

cmake_configure:
	mkdir -p build
	rm -rf build/*
	cmake -S cxx -B build -DCMAKE_EXPORT_COMPILE_COMMANDS=1
	ln -f -s ${BUILD_DIR}/compile_commands.json ${SOURCE_DIR}/compile_commands.json
cmake_build:
	cmake --build build
cmake_run:
	./build/main
	./build/c_main
