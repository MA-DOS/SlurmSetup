#!/bin/bash

# TODO: Improve configuration here for realistic scenario.
#SBATCH --job-name=nextflow_chipseq
#SBATCH --output=chipseq_test.out
#SBATCH --error=chipseq_test.err
#SBATCH --time=200:00:00          
#SBATCH --partition=nf-core    
#SBATCH --cpus-per-task=2    
#SBATCH --mem=4       
#SBATCH --nodes=1

# Run the nf-core ChIP-seq pipeline with the test profile
nextflow run nf-core/chipseq -profile test,docker -c nextflow.config --outdir output 
