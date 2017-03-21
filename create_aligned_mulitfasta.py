from __future__ import print_function
import sys
import egglib


def align_list_to_dict(files_textfile):

    gene_dict = {}
    with open(files_textfile) as file_list:
        for f in file_list:
            if '/' in f:
                file_id = f.split('/')[-1]
            else:
                file_id = f

            species_id = file_id.split('.')[0]
            species_cont = egglib.io.from_fasta(f.rstrip())
            gene_dict[species_id] = species_cont

    # print(gene_dict.items()[0:3])

    return gene_dict

egglib.wrappers.paths['muscle'] = '/home/bo1pgc/bin/muscle'

prot_file_list = sys.argv[2]
cds_file_list = sys.argv[3]

orthologs = sys.argv[1]

prot_outdir = 'prot_multifasta_unaligned/'
prot_aligned_outdir = 'prot_multifasta_aligned/'

cds_outdir = 'cds_multifasta_unaligned/'
cds_aligned_outdir = 'cds_multifasta_aligned/'

prot = align_list_to_dict(prot_file_list)
cds = align_list_to_dict(cds_file_list)

with open(orthologs) as ortholog_file:
    for line in ortholog_file:
        skip = 0
        cont = egglib.Container()
        cds_cont = egglib.Container()
        col = line.rstrip().split('\t')

        if not col[0].startswith('OG'):
            species_list = (line.split())
        else:
            for i in range(len(species_list)):
                species_id = species_list[i]
                gene_id = col[i + 1]

                seq_index = prot[species_id].find(gene_id).index
                seq = prot[species_id].get_sequence(seq_index).str()
                cont.add_sample(species_id, seq)

                try:
                    cds_seq_index = cds[species_id].find(gene_id).index
                    cds_seq = cds[species_id].get_sequence(seq_index).str()
                    cds_cont.add_sample(species_id, cds_seq)
                except AttributeError:
                    print(species_id, gene_id)
                    skip = 1
                    break

            if skip:
                continue

            ortho_id = col[0]

            prot_fasta_name = prot_outdir + ortho_id + '.Protein.fasta'
            cont.to_fasta(prot_fasta_name)

            # cds_fasta_name = cds_outdir + ortho_id + '.CDS.fasta'
            # cds_cont.to_fasta(cds_fasta_name)



            # prot_align_name = prot_aligned_outdir + ortho_id + '.Protein.fasta'
            # prot_align = egglib.wrappers.muscle(cont)
            # prot_align.to_fasta(prot_align_name)

            # cds_align_name = cds_aligned_outdir + ortho_id + '.CDS.fasta'
            # cds_align = egglib.wrappers.muscle(cds_cont)
            # cds_align.to_fasta(cds_align_name)

            # try:
            #     cds_align = egglib.tools.backalign(cds_cont, prot_align, fix_stop=True)
            #     cds_align.to_fasta(cds_align_name)
            # except egglib.tools._code_tools.BackalignError:
            # #     egglib.tools.BackalignError.alignment
            #     print(ortho_id)
            # except ValueError:
            #     continue