/* Copyright (C) 2013, Siddharth Gopal (gcdart AT gmail)
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of version 2.1 of the GNU Lesser General Public License
 * as published by the Free Software Foundation.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA, 02111-1307, USA,
 * or visit the GNU web site, www.gnu.org.
 */
 
 
This folder contains a simple matrix-multiplication routine to test the 
performance of 5 BLAS implementations - ACML , ATLAS , EIGEN , MKL and OpenBLAS.
All the libraries are assumed to be already installed in the system.

To compile, 

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
		 

