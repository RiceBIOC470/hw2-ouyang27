function opt_dnaseq = protein2dnaOptimized(proteinseq)
filename = 'codons.csv';
fid = fopen(filename, 'r');
fgetl(fid);
frequency = [];
for ii = 1:64
    info = strsplit(fgetl(fid),',');
    codons(ii).amino_acid = cell2mat(info(1));
    codons(ii).codon = cell2mat(info(2));
    c = cell2mat(info(3));
    frequency(ii) = str2num(c);
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
    f = 0;
    for jj = 1:l
        n = index(jj);
        if frequency(n)>f
            f = frequency(n);
            ind = n;
        end
    end
    cod = codons(ind).codon;
    dseq = strcat(dseq, cod);
end
opt_dnaseq = strcat(dseq, 'TGA');