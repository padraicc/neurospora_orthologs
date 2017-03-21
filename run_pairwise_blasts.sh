#!/usr/bin/env bash


ls protein_fasta/*.fasta |  while read i; do basename $i .fa | cut -f1 -d'.'; done > file_ids.txt

python create_pairs.py file_ids.txt recip | while read i j
do
	python run_blastp.py ${i} ${j} protein_fasta

done