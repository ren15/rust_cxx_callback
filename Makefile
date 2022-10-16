.PHONY: $(MAKECMDGOALS)

export REPO_DIR=${PWD}
export BUILD_DIR=${REPO_DIR}/cmake-build
export SOURCE_DIR=${REPO_DIR}/cxx

help:
	echo "help"

run_rust:
	cd rust_caller && LD_LIBRARY_PATH=../cmake-build cargo r

run_docker:
	docker build -t local .
	docker run local bash -c "make cmake_build && make cmake_run"
	docker run local bash -c "make cmake_build && make run_rust"

cmake_build:
	mkdir -p ${BUILD_DIR} && rm -rf ${BUILD_DIR}/*
	cmake -S cxx -B ${BUILD_DIR} -DCMAKE_EXPORT_COMPILE_COMMANDS=1
	ln -f -s ${BUILD_DIR}/compile_commands.json ${SOURCE_DIR}/compile_commands.json
	cmake --build ${BUILD_DIR}

cmake_run:
	${BUILD_DIR}/main
	${BUILD_DIR}/c_main
