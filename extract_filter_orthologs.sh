#!/usr/bin/env bash


# Compile a list of proteins to remove from the ortholog set. These are proteins LGI or proteins that have shown
# evidence of being under balancing selection

cat ncra_LGI_prot_ids.txt zhou_ncra_balancing_sel_genes_prot_id.txt | sort -u > proteins_to_filter.txt

python extract_single_copy_orthologs.py protein_fasta_files/Results_Jan12/Orthogroups.csv |
python filter_orthologs.py proteins_to_filter.txt > single_copy_orthologs_filtered.txt
