#!/usr/bin/env bash

#$ -l h_rt=24:00:00
#$ -l mem=8G
#$ -l rmem=8G
#$ -l arch=intel*
#$ -e align_ortho.e
#$ -o align_ortho.o
#$ -N align_ortho

module load apps/python/conda
source activate myscipy

mkdir -p /fastdata/bo1pgc/neurospora_phylogenomics/neurospora_alignments/cds_multifasta_aligned/
mkdir -p /fastdata/bo1pgc/neurospora_phylogenomics/neurospora_alignments/prot_multifasta_aligned/

ln -s /fastdata/bo1pgc/neurospora_phylogenomics/neurospora_alignments/cds_multifasta_aligned/
ln -s /fastdata/bo1pgc/neurospora_phylogenomics/neurospora_alignments/prot_multifasta_aligned/

mkdir -p /fastdata/bo1pgc/neurospora_phylogenomics/neurospora_alignments/cds_multifasta_unaligned/
mkdir -p /fastdata/bo1pgc/neurospora_phylogenomics/neurospora_alignments/prot_multifasta_unaligned/

ln -s /fastdata/bo1pgc/neurospora_phylogenomics/neurospora_alignments/cds_multifasta_unaligned/
ln -s /fastdata/bo1pgc/neurospora_phylogenomics/neurospora_alignments/prot_multifasta_unaligned/


python create_aligned_mulitfasta.py single_copy_orthologs_filtered.txt protein_fasta_files.txt cds_fasta_files.txt


