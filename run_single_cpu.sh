# Change this to refer to the location of the libraries for all the implementations
export LD_LIBRARY_PATH=\
/opt/composerxe/mkl/lib/intel64/:\
/opt/composer_xe_2013/lib/intel64/:\
/opt/openblas/xianyi-OpenBLAS-54e7b37:\
/opt/acml5.3.1/open64_64_mp/lib/:\
/opt/acml5.3.1/open64_64/lib/

# Number of threads set to 1. Only OpenBLAS uses this variable
export OMP_NUM_THREADS=1;

# Number of iterations+1 to average over.
iters=6 

# The different sizes of the matrices to compare
sizes=`seq 500 500 5000`;

# The name of each folder i.e. BLAS implementation
dirs="ACML ATLAS EIGEN MKL OpenBLAS";

# Where the output should go
mkdir -p ./output/core\=1

for method in `echo $dirs`;
do

    file="./output/core=1/"$method."output";
    printf "%10s %10s\n" Dimension $method > $file;

    echo " Running $method for single core \n Output-file : $file";

    for s in `echo $sizes`; 
    do 
	echo "    Matrix size=$s"
	printf "%10d " $s >> $file;
	echo `./$method/a.out $iters $s` | awk -F':' '{ print $NF;}' | xargs printf '%10.5f\n' >> $file;
    done
done



