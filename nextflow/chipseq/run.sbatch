#!/bin/bash
#!/bin/bash

#SBATCH --job-name=nextflow_chipseq
#SBATCH --output=chipseq_test.out
#SBATCH --error=chipseq_test.err
#SBATCH --time=200:00:00          # Max time for the job
#SBATCH --partition=test    
#SBATCH --cpus-per-task=2    
#SBATCH --mem=4       
#SBATCH --nodes=1
# 1 node does not work
# 2 nodes: 2:33
# 3 nodes: 2:28
# 4 nodes work well: 2:33min

# Run the nf-core ChIP-seq pipeline with the test profile
nextflow run nf-core/chipseq -profile test,docker -c nextflow.config --outdir output 
