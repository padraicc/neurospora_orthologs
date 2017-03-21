#!/usr/bin/env bash

ncra_gff=/data/bo1pgc/neurospora_phylogenomics/neurospora_annotations/ncra_NC12/GCF_000182925.2_NC12_genomic.gff.gz

zgrep ^NC_026501.1  ${ncra_gff} | grep -w CDS | cut -f4 -d';' | cut -f2 -d'=' | uniq > ncra_LGI_prot_ids.txt

ntet_gff=/data/bo1pgc/neurospora_phylogenomics/neurospora_annotations/ntet_2508/GCF_000213175.1_v2.0_genomic.gff.gz

# the scaffold called NW_009799179.1 by NCBI is the scaffold 81 in JGI 2508 v2 assembly. This is the mat chromosome (aka chromosome 1)

zgrep ^NW_009799179.1 ${ntet_gff} | grep -w CDS | cut -f4 -d';' | cut -f2 -d'=' | uniq > ntet_LGI_prot_ids.txt

# Get the protein ids for the ncra genes with evidence for balanncing selection

cat zhou_ncra_balancing_sel_genes.txt | while read i; do zgrep -w $i ${ncra_gff} | cut -f9 |
cut -f2 -d';' | cut -f2 -d'='; done  > zhou_ncra_balancing_sel_genes_ids.txt

cat zhou_ncra_balancing_sel_genes_ids.txt | while read i; do zgrep -w ${i} ${ncra_gff} | grep -w CDS |
cut -f4 -d';' | cut -f2 -d'=' | uniq ; done > zhou_ncra_balancing_sel_genes_prot_id.txt

rm zhou_ncra_balancing_sel_genes_ids.txt
