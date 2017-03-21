from qsub import *
import sys


inparanoid_cmd = 'perl inparanoid.pl Annotated%s.Proteins.fasta  Annotated%s.Proteins.fasta' % (sys.argv[1], sys.argv[2])

outdir = sys.argv[3]
chdir = 'cd %s' % outdir
job_id = 'inparanoid_' + sys.argv[1] + '_' + sys.argv[2]
q_sub(['module load apps/gcc/4.4.7/perl/5.24.0', chdir, inparanoid_cmd],
        out=outdir + '/' + job_id,
        t=8,
        mem=8, rmem=8)
