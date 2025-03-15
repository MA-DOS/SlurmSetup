#!/bin/bash

echo "Terminating all SLURM jobs for user nfomin3..."
scancel -u nfomin3

echo "Waiting for all SLURM jobs to terminate..."
while squeue -u nfomin3 | grep -q nfomin3; do
    sleep 1
done

echo "Cleaning nextflow traces...!"

rm -rf /home/nfomin3/dev/SlurmSetup/nextflow/chipseq/data

echo "Cleaning monitoring output files...!"

cd /home/nfomin3/dev/LowLevelMonitoring
rm -rf results

echo "Done with deleting...!"

echo "Running Workflow!"
cd /home/nfomin3/dev/SlurmSetup/nextflow/chipseq
sbatch run.sbatch

sleep 2

echo "Waiting to find containers...!"
while true; do clear; docker ps -a | grep "nxf"; sleep 1; done


