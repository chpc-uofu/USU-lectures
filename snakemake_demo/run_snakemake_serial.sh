#!/usr/bin/bash
# run_snakemake_serial.sh - script to run snakemake workflow serially
# executing all jobs locally.

module load snakemake/5.6.0

snakemake -s demo.snakefile
