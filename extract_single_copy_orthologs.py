from __future__ import print_function
import sys


species_num = 10
single_ortho_list = [1 for i in range(10)]

with open(sys.argv[1]) as infile:
    for line in infile:
        col = line.split('\t')
        if not col[0].startswith('OG'):
            print(line.rstrip())
            continue

        orthogroup_num = []
        for i in col[1:]:
            if i == '':
                orthogroup_num.append(0)
            else:
                orthogroup_num.append(len(i.split(',')))

        # print(orthogroup_num)
        if orthogroup_num == single_ortho_list:
            if len(line.split()[1:]) < species_num:
                continue
            else:
                print(line.rstrip())



