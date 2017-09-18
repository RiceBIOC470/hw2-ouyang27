function randomSeq = randdnaseq(N)
% returns a random dna sequence of length N
rand_seq = randi(4, 1, N);
rand_seq = num2str(rand_seq);
rand_seq=rand_seq(rand_seq~=' ');
for jj=1:N
    if rand_seq(jj) == '1'
        rand_seq(jj) = char('A');
    elseif rand_seq(jj) == '2'
        rand_seq(jj) = char('T');
    elseif rand_seq(jj) == '3'
        rand_seq(jj) = char('G');
    else
        rand_seq(jj) = char('C');
    end
end
randomSeq = rand_seq;