# Introduction
 
This folder contains a simple matrix-multiplication routine to test the 
performance of 5 BLAS implementations - ACML , ATLAS , EIGEN , MKL and OpenBLAS.
All the libraries are assumed to be already installed in the system.

# Compile

1. Go inside each folder.
2. Open compile.sh and put in the appropriate paths.
3. sh compile.sh

This will product two executables in each folder

1. a.out
   This is the single-threaded version of matrix-multiplication.

2. ap.out
   This is the multithreaded version of matrix-multiplication. The number of 
   threads can be controlled by setting OMP_NUM_THREADS variables.   
   Note that the number of threads for the ATLAS library is determined at 
   compile time and cannot be dynamically changed. The OMP_NUM_THREADS variable
   has no effect on ATLAS

# Test-scripts 

There are three shell scripts,

  1. run_single_cpu.sh

     Computes the average matrix-multiplication time (over 5 runs) for each
     implementation on progressively increasing sizes of the matrices.
		 
  2. run_multiple_cpu.sh
	
     Computes the average matrix-multiplication time (over 5 runs) for each
     implementation on progressively increasing sizes of the matrices and
     increasing number of threads.
		 
  3. run_scaling.sh
	
     Computes the average matrix-multiplication time (over 5 runs) for each
     implementation on a 5000x5000 matrix with increasing number of threads.	
		 

# Plotting-tools

   Some handy plotting tools based on R are provided in the graphics folder