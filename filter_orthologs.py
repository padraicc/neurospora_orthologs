from __future__ import print_function
import sys


filter_set = set()
with open(sys.argv[1]) as filter_file:
    for line in filter_file:
        filter_set.add(line.rstrip())

for line in sys.stdin:
    col = line.split('\t')
    if not col[0].startswith('OG'):
        print(line.rstrip())
        continue
    else:
        ncra_prot_id = line.split()[2]
        # print(ncra_prot_id)

        if ncra_prot_id not in filter_set:
            print(line.rstrip())
