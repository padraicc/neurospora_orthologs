#!/bin/bash

#$ -l h_rt=72:00:00
#$ -l mem=8G
#$ -l rmem=8G
#$ -l arch=intel*
#$ -e orthofinder.e
#$ -o orthofinder.o
#$ -N orthofinder
#$ -q evolgen.q -P evolgen
#$ -pe openmp 20

module load apps/binapps/ncbi-blast

orthofinder -f protein_fasta_files/ -t 20 -a 20