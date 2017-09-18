function [ORFlength, start_pos, stop_pos] = findORF(dnaseq)
%Function to find the length of the longest open reading frame of a
%sequences called dnaseq

%fill in here. 
rand_seq = upper(dnaseq);
start_codon = strfind(rand_seq, 'ATG');
stop_codon = [strfind(rand_seq, 'TAA') strfind(rand_seq, 'TGA') strfind(rand_seq, 'TAG')];
firstStopCodon = zeros(1, length(start_codon));
N = length(rand_seq);
for ii = 1:length(start_codon)
    Olengths = stop_codon - start_codon(ii)+3;
    good_length = 1e8;
    good_ind = 0;
    for jj = 1:length(Olengths)
        if Olengths(jj) > 0 && ...
                mod(Olengths(jj),3) == 0 && ...
                Olengths(jj) < good_length
            good_length = Olengths(jj);
            good_ind = jj;
        end
    end
    if good_ind > 0
        firstStopCodon(ii) = stop_codon(good_ind);
    else
        firstStopCodon(ii) = start_codon(ii);
    end
end
ORF = firstStopCodon - start_codon + 3;
[M, I] = max(ORF);
if M > 3
    ORFlength = M;
    start_pos = start_codon(I);
    stop_pos = firstStopCodon(I);
else
    ORFlength = NaN;
    start_pos = NaN;
    stop_pos = NaN;
end

