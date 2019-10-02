#!/usr/bin/bash
# run_snakemake_parallel.sh - script to run snakemake workflow in parallel
# executing all jobs locally.

module load snakemake/5.6.0

snakemake -s demo.snakefile --jobs 3
