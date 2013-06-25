# export LD_LIBRARY_PATH just for the compilation stage with open64 compiler 

LD_LIBRARY_PATH=/opt/open64/open64-5.0/lib/gcc-lib/x86_64-open64-linux/5.0/32

OPENCC=/opt/open64/open64-5.0/bin/opencc
OPENCC_INCDIR=/opt/open64/open64-5.0/include/5.0
OPENCC_LIBDIR=/opt/open64/open64-5.0/lib/gcc-lib/x86_64-open64-linux/5.0

ACML_MP_INCDIR=/opt/acml5.3.1/open64_64_mp/include
ACML_MP_LIBDIR=/opt/acml5.3.1/open64_64_mp/lib

ACML_INCDIR=/opt/acml5.3.1/open64_64/include
ACML_LIBDIR=/opt/acml5.3.1/open64_64/lib

$OPENCC \
-I $OPENCC_INCDIR \
-I $ACML_MP_INCDIR \
-L $OPENCC_LIBDIR \
-L $ACML_MP_LIBDIR \
-O4 -msse2 -msse3 \
dense_mult_acml.c \
-lfortran -lffio -lrt -lacml_mp -fopenmp \
-o ap.out

$OPENCC \
-I $OPENCC_INCDIR \
-I $ACML_INCDIR \
-L $OPENCC_LIBDIR \
-L $ACML_LIBDIR \
-O4 -msse2 -msse3 \
dense_mult_acml.c \
-lfortran -lffio -lrt -lacml -lpthread \
-o a.out
