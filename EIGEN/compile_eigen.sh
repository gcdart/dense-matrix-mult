INCDIR=/usr/include/Eigen/

g++ \
-I $INCDIR \
-O4 -msse2 -msse3 -msse4 \
dense_mult_eigen.cpp \
-fopenmp \
-o ap.out

g++ \
-I $INCDIR \
-O4 -msse2 -msse3 -msse4 \
-DEIGEN_DONT_PARALLELIZE \
dense_mult_eigen.cpp \
-o a.out
