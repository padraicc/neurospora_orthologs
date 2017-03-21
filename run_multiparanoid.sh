#!/bin/bash

#$ -l h_rt=08:00:00
#$ -l mem=8G
#$ -l rmem=8G
#$ -l arch=intel*
#$ -e multiparanoid.e
#$ -o multiparanoid.o
#$ -N multiparanoid

module load apps/gcc/4.4.7/perl/5.24.0



perl multiparanoid.pl -species AnnotatedNcraNC12.Proteins.fasta+AnnotatedNdis8579.Proteins.fasta+\
AnnotatedNhispaniola8817.Proteins.fasta+AnnotatedNIntermedia8761.Proteins.fasta+AnnotatedNmetzenbergii10397.Proteins.fasta+\
AnnotatedNsitophilaW1434.Proteins.fasta+AnnotatedNtet10752L9.Proteins.fasta+AnnotatedNtet2503L8.Proteins.fasta+\
AnnotatedNtet2508L6.Proteins.fasta+AnnotatedNtet9045L7.Proteins.fasta
