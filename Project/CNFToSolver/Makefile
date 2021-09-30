all: hello

hello: cnf_io_prb.o cnf_io.o 
	g++ -no-pie cnf_io_prb.o cnf_io.o -o hello 


cnf_io_prb.o: cnf_io_prb.cpp
	g++ -c -Wall cnf_io_prb.cpp

cnf_io.o: cnf_io.cpp
	g++ -c -Wall cnf_io.cpp

