#!/bin/bash
#SBATCH --account=nstaff
#SBATCH --constraint=haswell
#SBATCH --image=docker:rcthomas/nersc-python-bench:0.1.1
#SBATCH --job-name=mpi4py-import-cori-haswell-shifter-003
#SBATCH --mail-type=FAIL
#SBATCH --mail-user=rcthomas@lbl.gov
#SBATCH --nodes=3
#SBATCH --ntasks-per-node=32
#SBATCH --output=logs/mpi4py-import-cori-haswell-shifter-003-%j.out
#SBATCH --partition=regular
#SBATCH --qos=normal
#SBATCH --time=30

# Configuration.

commit=true

# Run benchmark.

export OMP_NUM_THREADS=1

output=tmp/latest-$SLURM_JOB_NAME.txt
srun -c 2 shifter python /usr/local/bin/mpi4py-import.py $(date +%s) | tee $output
