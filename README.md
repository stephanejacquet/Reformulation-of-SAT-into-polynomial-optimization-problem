# Reformulation-of-SAT-into-polynomial-optimization-problem

This code is describing the work published here: https://link.springer.com/chapter/10.1007%2F978-3-030-63461-2_21

It offers a way to solve a SAT instance by transforming it a polynomial optimization problem. The solver ADMB should be used to solve it using the code from that project.

The file ''simple.tpl'' should be used in the ADMB solver, since it describes the transformation suggested by the article.

When the folder containing ADMB is in the same folder than the bash script ''run'', you can use this file to solve a SAT instance defined in a .cnf file which is in the variable FILENAME.
