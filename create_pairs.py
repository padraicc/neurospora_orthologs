from __future__ import print_function
import sys
import itertools

species_ids = []
with open(sys.argv[1]) as infile:
    for line in infile:
        file_id = line.rstrip()
        species_id = file_id[9:]
        species_ids.append(species_id)

if sys.argv[2] == 'recip':
    for i in species_ids:
        for j in species_ids:
            print(i, j, sep='\t')
elif sys.argv[2] == 'unique':
    unique_pairs = list(itertools.combinations(species_ids, 2))
    for i in unique_pairs:
        print(i[0], i[1], sep='\t')
else:
    sys.exit('Specify recip or unique as second command line arg')
