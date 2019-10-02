#!/usr/bin/bash
# run_snakemake_cluster.sh - script to run snakemake workflow executing
# all jobs in parallel on a SLURM cluster.

module load snakemake/5.6.0

snakemake -s demo.snakefile \
	--cluster-config cluster.yaml \
	--cluster "sbatch -M {cluster.name} -p {cluster.partition} -A {cluster.account} -N {cluster.nodes} -J {rule} -t {cluster.time}" \
	--jobs 3
