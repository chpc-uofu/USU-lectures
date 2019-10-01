Matlab, R and Python example scripts

This repository has example scripts on how to run Matlab, R and Python on CHPC clusters.

Please keep in mind that it is usually necessary to do at least some modifications to the code in order to run in parallel. The examples below give an idea on the relatively simple changes that were needed to parallelize these examples, but, other codes may need more changes.

## Matlab

There are three ways to run Matlab, with increasing level of parallelism:
- serial calculation (not recommended, will not utilize full node efficiently) - loop_serial.m, run_matlab_serial.m run_matlab_serial.slr
  -- submit job as "sbatch run_matlab_serial.slr"
- parallel calculation using single node - loop_parallel_onenode.m, run_matlab_onenode.m, run_matlab_onenode.slr
  -- submit job as "sbatch run_matlab_onenode.slr"
- parallel calculation on multiple nodes using Matlab Parallel Server - loop_parallel.m, parallel_multinode.m
  -- this is started from Matlab that runs on the interactive node, e.g. "matlab -nodisplay -r parallel_multinode"

For more info, see [https://www.chpc.utah.edu/documentation/software/matlab.php](https://www.chpc.utah.edu/documentation/software/matlab.php)

## R

Similarly to Matlab, R can be run serially, parallel on one node or parallel on more nodes.
- serial R - serial-iris.R, R-serial-iris.slr
  -- submit job as "sbatch R-serial-iris.slr"
- parallel R on one node - parallel-onenode-iris.R, R-parallel-onenode-iris.slr
  -- submit job as "sbatch R-parallel-onenode-iris.slr"
- parallel R on multiple nodes - parallel-multinode-iris.R, R-parallel-multinode-iris.slr
  -- submit job as "sbatch R-parallel-multinode-iris.slr"
- submit SLURM job directly from R - rslurm-example.R - this one is only partly functional now because of limitations in partition selection in the rslurm get_slurm_output() function

More information is at [https://www.chpc.utah.edu/documentation/software/r-language.php](https://www.chpc.utah.edu/documentation/software/r-language.php).


## Python

Job scripts would be very similar to R, replacing Rscript command with python. We would also want to load the appropriate Python stack. There are multiple options for that listed at [https://www.chpc.utah.edu/documentation/software/python.php](https://www.chpc.utah.edu/documentation/software/python.php).

We recommend to install Miniconda with the needed Python modules, as described at [https://www.chpc.utah.edu/documentation/software/python-anaconda.php](https://www.chpc.utah.edu/documentation/software/python-anaconda.php).

The following examples demonstrate use of Dask inside of a Jupyter Notebook: dask_embarrass.ipynb  dask_slurmcluster.ipynb  dask_slurm_xarray.ipynb.

To use those, go to ondemand.chpc.utah.edu, authenticate, select Interactive Apps - Jupyter Notebook on Notchpeak, in the Environment Setup, put:
module use ~u0101881/MyModules
module load miniconda3/latest
Then "Launch" the job, and when job starts push "Connect to Jupyter". Then open the notebook of interest.

  
