function []= plotProbabilityORF(N_ORF)
max = N_ORF * 20;
if max > 2000
    max = 2000;
end
N = 0:1:max;
P = [];
P(1) = 0;
for ii = 1:max
    P(ii+1) = probabilityORF(ii, N_ORF);
end
Prob = P;
plot(N, Prob);

