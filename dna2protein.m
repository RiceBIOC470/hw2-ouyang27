function proteinseq = dna2protein(dnaseq,frame)
% Input a dna sequence and a reading frame and returns the corresponding
% protein sequence. 
seq = upper(dnaseq);
filename = 'codons.csv';
fid = fopen(filename, 'r');
fgetl(fid);
for ii = 1:64
    info = strsplit(fgetl(fid),',');
    info = cell2mat(info);
    codons(ii).amino_acid = info(1:3);
    codons(ii).codon = info(4:6);
end
fclose(fid);    
if frame == 1 | frame == 2 |  frame == 3
    n = frame;
    l = length(dnaseq);
    pseq = '';
    sample = cat(2, codons.codon);
    stop_codon = ['TAA', 'TGA', 'TAG'];
    while n+3 < l 
        c = seq(n:n+2);
        if contains(stop_codon, c) == 0
            index = strfind(sample, c);
            for jj = 1:length(index)
                if mod(index(jj),3) == 1
                    ind = (index(jj)+2) ./ 3;
                end
            end
        aa = codons(ind).amino_acid;
        pseq = strcat(pseq, aa);
        n = n+3;
        else 
            break
        end
    end
    proteinseq = pseq;
else
    proteinseq = 'Error';
end