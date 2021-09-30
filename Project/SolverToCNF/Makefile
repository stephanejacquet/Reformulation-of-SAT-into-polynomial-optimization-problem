all: evaluate_cnf

evaluate_cnf: cnf_io_prb_evaluate.o cnf_io.o 
	g++ -no-pie cnf_io_prb_evaluate.o cnf_io.o -o evaluate_cnf 


cnf_io_prb_evaluate.o: cnf_io_prb_evaluate.cpp
	g++ -c -Wall cnf_io_prb_evaluate.cpp

cnf_io.o: cnf_io.cpp
	g++ -c -Wall cnf_io.cpp

