function dnaseq = protein2dna(proteinseq)
filename = 'codons.csv';
fid = fopen(filename, 'r');
fgetl(fid);
for ii = 1:64
    info = strsplit(fgetl(fid),',');
    info = cell2mat(info);
    codons(ii).amino_acid = info(1:3);
    codons(ii).codon = info(4:6);
end
L = length(proteinseq);
L = L/3;
dseq = '';
for ii = 1:L
    i = ii*3;
    aa = proteinseq(i-2:i);
    sample = cat(2, codons.amino_acid);
    index = strfind(sample, aa);
    index = (index+2)./3;
    l = length(index);
    j = randi(l);
    ind = index(j);
    cod = codons(ind).codon;
    dseq = strcat(dseq, cod);
end
dnaseq = strcat(dseq, 'TGA');
    
    