# Change this to refer to the location of the libraries for all the implementations
export LD_LIBRARY_PATH=\
/opt/composerxe/mkl/lib/intel64/:\
/opt/composer_xe_2013/lib/intel64/:\
/opt/openblas/xianyi-OpenBLAS-54e7b37:\
/opt/acml5.3.1/open64_64_mp/lib/:\
/opt/acml5.3.1/open64_64/lib/

# Number of iterations+1 to average over.
iters=6

# The different sizes of the matrices to compare
sizes=`seq 1000 1000 10000`;

# The name of each folder i.e. BLAS implementation
# ATLAS cannot change the number of threads dynamically
dirs="EIGEN MKL OpenBLAS ACML";

threads="8 16 32 40 48";

for thr in `echo $threads`; 
do
# Number of threads set to the required number. only ATLAS does NOT use this variable.
    export OMP_NUM_THREADS=$thr;

    mkdir -p ./output/core\=$thr

    for method in `echo $dirs`;
    do

	file="./output/core=$thr/"$method."output";
	printf "%10s %10s\n" Dimension $method > $file;

	echo " Running $method on $thr cores \n Output-file : $file";

	for s in `echo $sizes`; 
	do 
	    echo "    Matrix size=$s"
	    printf "%10d " $s >> $file;
	    echo `./$method/ap.out $iters $s` | awk -F':' '{ print $NF;}' | xargs printf '%10.5f\n' >> $file;
	done
    done
done
