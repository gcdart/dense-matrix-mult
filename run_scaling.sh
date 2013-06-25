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
sizes=`echo 5000`;

# The name of each folder i.e. BLAS implementation

dirs="ACML ATLAS EIGEN MKL OpenBLAS";

threads=`seq 2 1 48`

for s in `echo $sizes`;
do
    mkdir -p ./scaling/size\=$s;

    for method in `echo $dirs`;
    do

	file="./scaling/size=$s/"$method."output";
	echo $method > $file;
	printf "%10s %10s\n" \#Threads $method > $file;

	echo " Running $method for matrix-dimension $s \n Output-file : $file";

	for thr in `echo $threads`;
	do
	    export OMP_NUM_THREADS=$thr;
	    echo "    #threads=$thr"
	    printf "%10d " $thr >> $file;
	    echo `./$method/ap.out $iters $s` | awk -F':' '{ print $NF;}' | | xargs printf '%10.5f\n' >> $file;
	done
    done
done
