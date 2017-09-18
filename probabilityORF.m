function pp = probabilityORF(N, N_ORF)
p = 0;
for ii = 1:1000
    rand_seq = randdnaseq(N);
    [ORFlength, ~, ~] = findORF(rand_seq);
    if ORFlength > N_ORF
        p = p + 1;
    end
end
pp = p./1000;