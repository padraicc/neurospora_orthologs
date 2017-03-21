#!/usr/bin/env bash


curr_dir=$( pwd )
anno_dir=/fastdata/bo1pgc/neurospora_phylogenomics/neurospora_annotations
cds_dir=/fastdata/bo1pgc/neurospora_phylogenomics/neurospora_annotations/cds_fasta_files
prot_dir=/fastdata/bo1pgc/neurospora_phylogenomics/neurospora_annotations/protein_fasta_files

if [ ! -d "$anno_dir" ]; then
	mkdir -p ${anno_dir}
	mkdir ${prot_dir}
	mkdir ${cds_dir}
fi

# copy the N. tetrasperma protein and CDS fasta files to fastdata
ntet_dir=/data/bo1pgc/neurospora_phylogenomics/neurospora_annotations/ntet_lineages
cp ${ntet_dir}/AnnotatedCDS* ${cds_dir}
cp ${ntet_dir}/*Proteins.fasta ${prot_dir}

# retrieve annotation files for N. tetrasperma 2508 v2 genome from NCBI refseqls
mkdir ${anno_dir}/ntet_2508
cd ${anno_dir}/ntet_2508
wget -c ftp://ftp.ncbi.nlm.nih.gov/genomes/refseq/fungi/Neurospora_tetrasperma/all_assembly_versions/GCF_000213175.1_v2.0/*

#Truncate the names and  make them consistent between the  protein and CDS files
python ${curr_dir}/rename_fasta.py GCF_000213175.1_v2.0_cds_from_genomic.fna.gz | faSort > ${cds_dir}/AnnotatedCDSNtet2508L6.fasta
zcat GCF_000213175.1_v2.0_protein.faa.gz | faReformat -s | faSort > ${prot_dir}/AnnotatedNtet2508L6.Proteins.fasta

# retrieve annotation files for N. crassa genome NC12 NCBI refseq
mkdir ${anno_dir}/ncra_NC12
cd ${anno_dir}/ncra_NC12
wget -c ftp://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/000/182/925/GCF_000182925.2_NC12/*

python ${curr_dir}/rename_fasta.py GCF_000182925.2_NC12_cds_from_genomic.fna.gz | faSort > ${cds_dir}/AnnotatedCDSNcraNC12.fasta
zcat GCF_000182925.2_NC12_protein.faa.gz | faReformat -s | faSort > ${prot_dir}/AnnotatedNcraNC12.Proteins.fasta

# N. discreta genes downloaded from JGI at http://genome.jgi.doe.gov/Neudi1/Neudi1.download.ftp.html

ndis_dir=/data/bo1pgc/neurospora_phylogenomics/neurospora_annotations/ndis_8579
cp ${ndis_dir}/Ndiscreta.FilteredModels2.proteins.fasta.gz ${prot_dir}
gunzip -c ${prot_dir}/Ndiscreta.FilteredModels2.proteins.fasta.gz > ${prot_dir}/AnnotatedNdis8579.Proteins.fasta

cp ${ndis_dir}/Ndiscreta.FilteredModels2.CDS.fasta.gz ${cds_dir}
gunzip -c ${ndis_dir}/Ndiscreta.FilteredModels2.CDS.fasta.gz > ${cds_dir}/AnnotatedCDSNdis8579.fasta
