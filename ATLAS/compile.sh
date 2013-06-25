# Make sure you recompile ATLAS from scratch and then use the built libraries
ATLAS_LIBDIR=/usr/lib

gcc \
-L $ATLAS_LIBDIR \
-O4 -msse2 -msse3 -msse4 \
dense_mult.c \
-lptcblas -lptlapack -latlas -lpthread \
-o ap.out

gcc \
-L $ATLAS_LIBDIR \
-O4 -msse2 -msse3 -msse4 \
dense_mult.c \
-lcblas -llapack -latlas \
-o a.out
