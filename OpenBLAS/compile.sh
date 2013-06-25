OPENBLAS_LIBDIR=/opt/openblas/
OPENBLAS_INCDIR=/opt/openblas/

gcc \
-I $OPENBLAS_INCDIR \
-L $OPENBLAS_LIBDIR \
-O4 -msse2 -msse3 -msse4 \
dense_mult.c \
-lopenblas -fopenmp \
-o ap.out


cp ap.out a.out
