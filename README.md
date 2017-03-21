# Ortholog detection and phylogenetic analysis of Neurospora proteins

I tried two pipelines for detecting orthologs between the Neurospora proteomes. These were Orthofinder and Multiparanoid.

## Data downloaded

	$ sh download_data.sh

## 1.) Orthofinder

Reference: [https://genomebiology.biomedcentral.com/articles/10.1186/s13059-015-0721-2](https://genomebiology.biomedcentral.com/articles/10.1186/s13059-015-0721-2) 

	$ qsub run_orthofinder.sh
	
Orthofinder finds 4119 single copy orthologs between the 10 Neuropsora proteomes. This ortholog set was further filtered
to exclude genes residing on LGI (the mat chromosome), which has shown a history of large scale introgression in multiple
lineages of N. tetrasperma. I also excluded orthologs where the N. crassa gene has shown evidence of balancing selection (see
Table S5 of Zhao et al. (2015) which listed genes in the N. crassa genome show evidence of balancing selection). 
	
	$ sh extract_filter_orthologs.sh
	
These filtering steps resulted in a set of 3135 single copy orthologs which were used for the phylogenetic analysis described below. Next, I aligned the CDS orthologs aligned using muscle v3.8.31 .


**TODO** Complete the alignments and consider filtering steps to ensure that only good quality alignments are produced. The step below are yet to be completed. Seems to be quite a few genes with premature stop codons, consider removing these.

	$ qsub qsub_align_orthologs.sh
	

The CDS alignments were them trimmed using trimAl v1.4.
	
	$ sh trim_alignments.sh


## 2.) Multiparanoid

reference: [http://multiparanoid.sbc.su.se/](http://multiparanoid.sbc.su.se/)

The steps for running multi paranoid are given below.

	$ sh build_blast_databases.sh
	
	$ sh run_pairwise_blasts.sh
	
	$ rm protein_fasta/blastp_*.error; rm protein_fasta/blastp_*.out
	
	$ sh run_inparanoid.sh
	
	$ rm protein_fasta/inparanoid_*.error; rm protein_fasta/inparanoid_*.out
	
	$ qsub run_multiparanoid.sh

**TODO** Retrieve single copy orthologs from multi paranoid and compare with orthofinder results

# References

Zhao, Jiuhai, Pierre Gladieux, Elizabeth Hutchison, Joanna Bueche, Charles Hall, Fanny Perraudeau, and N. Louise Glass. 2015. “Identification of Allorecognition Loci in Neurospora Crassa by Genomics and Evolutionary Approaches.” Molecular Biology and Evolution 32 (9): 2417–32.
