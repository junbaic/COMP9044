import re
from collections import defaultdict


def read_dna(dna_file):
    """
    Read a DNA string from a file.
    the file contains data in the following format:
    A <-> T
    G <-> C
    G <-> C
    C <-> G
    G <-> C
    T <-> A
    Output a list of touples:
    [
        ('A', 'T'),
        ('G', 'C'),
        ('G', 'C'),
        ('C', 'G'),
        ('G', 'C'),
        ('T', 'A'),
    ]
    Where either (or both) elements in the string might be missing:
    <-> T
    G <->
    G <-> C
    <->
    <-> C
    T <-> A
    Output:
    [
        ('', 'T'),
        ('G', ''),
        ('G', 'C'),
        ('', ''),
        ('', 'C'),
        ('T', 'A'),
    ]
    """
    with open(dna_file, 'r') as fp:
        list_dna = []
        for line in fp:
            # line = line.strip()
            a = re.search('(.*) <-> (.*)', line)
            if a:
                list_dna.append((a.group(1), a.group(2)))
        return list_dna


def is_rna(dna):
    """
    Given DNA in the aforementioned format,
    return the string "DNA" if the data is DNA,
    return the string "RNA" if the data is RNA,
    return the string "Invalid" if the data is neither DNA nor RNA.
    DNA consists of the following bases:
    Adenine  ('A'),
    Thymine  ('T'),
    Guanine  ('G'),
    Cytosine ('C'),
    RNA consists of the following bases:
    Adenine  ('A'),
    Uracil   ('U'),
    Guanine  ('G'),
    Cytosine ('C'),
    The data is DNA if at least 90% of the bases are one of the DNA bases.
    The data is RNA if at least 90% of the bases are one of the RNA bases.
    The data is invalid if more than 10% of the bases are not one of the DNA or RNA bases.
    Empty bases should be ignored.
    """
    "DNA: list"
    list_DNA = ['A', 'T', 'G', 'C']
    list_RNA = ['A', 'U', 'G', 'C']
    count_DNA = 0
    count_RNA = 0
    invalid = 0
    for a, b in dna:
        if a in list_DNA and b in list_DNA:
            count_DNA += 1
        if a in list_RNA and b in list_RNA:
            count_RNA += 1
        if a == '' or b == '':
            invalid += 1

    if count_DNA / len(dna) >= 0.9:
        return 'DNA'
    if count_RNA / len(dna) >= 0.9:
        return 'RNA'
    if invalid / len(dna) >= 0.1:
        return 'Invalid'


def clean_dna(dna):
    """
    Given DNA in the aforementioned format,
    If the pair is incomplete, ('A', '') or ('', 'G'), ect
    Fill in the missing base with the match base.
    In DNA 'A' matches with 'T', 'G' matches with 'C'
    In RNA 'A' matches with 'U', 'G' matches with 'C'
    If a pair contains an invalid base the pair should be removed.
    Pairs of empty bases should be ignored.
    """
    if is_rna(dna) == 'DNA':
        for index, item in enumerate(dna):
            if item[0] == '':
                if item[1] == 'A':
                    dna[index] = ('T', 'A')
                if item[1] == 'G':
                    dna[index] = ('C', 'G')
                if item[1] == 'T':
                    dna[index] = ('A', 'T')
                if item[1] == 'C':
                    dna[index] = ('G', 'C')
            if item[1] == '':
                if item[0] == 'A':
                    dna[index] = ('A', 'T')
                if item[0] == 'G':
                    dna[index] = ('G', 'C')
                if item[0] == 'T':
                    dna[index] = ('T', 'A')
                if item[0] == 'C':
                    dna[index] = ('C', 'G')
            if item[0] == '' and item[1] == '':
                dna.pop(index)
    if is_rna(dna) == 'RNA':
        for index, item in enumerate(dna):
            if item[0] == '':
                if item[1] == 'A':
                    dna[index] = ('U', 'A')
                if item[1] == 'G':
                    dna[index] = ('C', 'G')
                if item[1] == 'U':
                    dna[index] = ('A', 'U')
                if item[1] == 'C':
                    dna[index] = ('G', 'C')
            if item[1] == '':
                if item[0] == 'A':
                    dna[index] = ('A', 'U')
                if item[0] == 'G':
                    dna[index] = ('G', 'C')
                if item[0] == 'U':
                    dna[index] = ('U', 'A')
                if item[0] == 'C':
                    dna[index] = ('C', 'G')
            if item[0] == '' and item[1] == '':
                dna.pop(index)
    return dna

def mast_common_base(dna):
    """
    Given DNA in the aforementioned format,
    return the most common first base:
    eg. given:
    A <-> T
    G <-> C
    G <-> C
    C <-> G
    G <-> C
    T <-> A
    The most common first base is 'G'.
    Empty bases should be ignored.
    """
    new_dict = defaultdict(int)
    for a, b in dna:
        new_dict[a] += 1
    sort_dict = sorted(new_dict.items(), key=lambda x: x[1], reverse=True)
    return sort_dict[0][0]

def base_to_name(base):
    """
    Given a base, return the name of the base.
    The base names are:
    Adenine  ('A'),
    Thymine  ('T'),
    Guanine  ('G'),
    Cytosine ('C'),
    Uracil   ('U'),
    return the string "Unknown" if the base isn't one of the above.
    """
    dict_1 = {'A': 'Adenine', 'T': 'Thymine', 'G': 'Guanine', 'C': 'Cytosine', 'U': 'Uracil'}
    return dict_1[base]

