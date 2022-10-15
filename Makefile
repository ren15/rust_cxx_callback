.PHONY: $(MAKECMDGOALS)

help:
	echo "help"
cxx:
	g++ -Wall -o main cxx/src/main.cc cxx/src/mysignal.cc -I cxx/include -std=c++17 -lpthread
run_cxx:
	./main
