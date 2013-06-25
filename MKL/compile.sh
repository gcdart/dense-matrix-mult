MKL_INCDIR=/opt/composer_xe_2013.2.146/mkl/include
MKL_LIBDIR=/opt/composerxe/mkl/lib/intel64/
MKL_RT_LIBDIR=/opt/composer_xe_2013/lib/intel64/

gcc \
-I $MKL_INCDIR \
-L $MKL_LIBDIR \
-L $MKL_RT_LIBDIR \
-O4 -msse2 -msse3 -msse4 \
dense_mult_mkl.c \
-Wl,--start-group -lmkl_gnu_thread -lmkl_core -lmkl_intel_lp64 -Wl,--end-group \
-fopenmp -lm \
-o ap.out

gcc \
-I $MKL_INCDIR \
-L $MKL_LIBDIR \
-L $MKL_RT_LIBDIR \
-O4 -msse2 -msse3 -msse4 \
dense_mult_mkl.c \
-Wl,--start-group -lmkl_sequential -lmkl_core -lmkl_intel_lp64 -Wl,--end-group \
-lm -lpthread \
-o a.out


