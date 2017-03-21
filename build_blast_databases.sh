#!/usr/bin/env bash

ls protein_fasta/*.fasta | while read i; do makeblastdb -in ${i} -dbtype prot ; done