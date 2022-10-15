.PHONY: $(MAKECMDGOALS)

help:
	echo "help"
cxx:
	g++ -o main cxx/src/main.cc cxx/src/mysignal.cc -I cxx/include -std=c++11 -lpthread
run_cxx:
	./main
