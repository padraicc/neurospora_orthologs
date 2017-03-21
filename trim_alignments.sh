#!/usr/bin/env bash



mkdir -p  /fastdata/bo1pgc/neurospora_phylogenomics/neurospora_alignments/cds_aligns_phylip_trimmed
ln -s /fastdata/bo1pgc/neurospora_phylogenomics/neurospora_alignments/cds_aligns_phylip_trimmed

ls cds_multifasta_aligned/*.fasta | while read i
do

	out="$(basename $i .fasta)"

	#echo ${out}

	trimal -in ${i} -out cds_aligns_phylip_trimmed/${out}.phy -phylip -gappyout -automated1

done