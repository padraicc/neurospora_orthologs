from __future__ import print_function
import sys
import gzip

with gzip.open(sys.argv[1]) as infile:
    for line in infile:
        if line.startswith('>'):
            col = line.split(' ')
            print('>' + '_'.join(col[0].split('_')[3:5]))
        else:
            print(line.rstrip())
