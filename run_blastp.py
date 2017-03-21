from qsub import *
import sys


blast_cmd = 'blastp -query protein_fasta/Annotated%s.Proteins.fasta -db protein_fasta/Annotated%s.Proteins.fasta ' \
            '-outfmt 5 | perl protein_fasta/blast_parser.pl 40 > ' \
            'protein_fasta/Annotated%s.Proteins.fasta-Annotated%s.Proteins.fasta' % (sys.argv[1], sys.argv[2],
                                                                                         sys.argv[1], sys.argv[2])

outdir = sys.argv[3]
job_id = 'blastp_' + sys.argv[1] + '_' + sys.argv[2]
q_sub(['module load apps/binapps/ncbi-blast', 'module load apps/gcc/4.4.7/perl/5.24.0', blast_cmd],
        out=outdir + '/' + job_id,
        t=24,
        mem=8, rmem=8)
