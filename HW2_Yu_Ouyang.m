%GB comments
1a. 100
1b. 100
2a. 100
2b. 100
2c. 100
2d. 100
2e. 100
3a.  100
3b. 100 
3c.  100
Overall: 100


%% Problem 1. 
% in the repository you will find the meannonan.m function we discussed in
% class which produced the mean of a vector of numbers that ignores values
% of NaN or Inf. 

% Part 1. Run the following code:

xx = rand(5); % random 5x5 matrix
xx(3,2) = NaN; %put a NaN in
yy = mean(xx); 
zz = meannonan(xx);

%compare the size of yy and zz. Notice that yy produces a row vector (the
%average of the rows) and has a NaN in the column that contained the NaN whereas 
%zz is a single number (the average of all non-NaN entries in xx). Explain
%this behavior. 

%Yu Ouyang's answer: for the builtin function mean, it takes the mean in each
% column, since it is a 5x5 matrix. However, there is a NaN in the second
% column, so the mean for the second column is NaN.
% For the function meannonan, I looked up the function file and found that
% the function first figure out the NaN and infinite numbers in the column,
% the delete them. And the numbers are no longer in a 5x5 matrix form. They
% are a single array of numbers. Therefore when taking the mean of the
% array, it would be a single number instead of 5 mean numbers for each
% column in the previous matrix. 

% Part 2. Modify the meannonan code so that it behaves as the mean function
% and produces a row vector where each entry is the average of each column
% and in the column with a NaN, this NaN is ignored. 



%% Problem 2. ORFs using functions
% In this problem we will use functions to simplify and extend our code from HW1, prob 2 

% Part 1. Fill in the function randdnaseq.m in this repository so that it returns a random sequence
% of length N. 

% Part 2. Fill in the function findORF.m in this repository so that takes any dna
% sequence as an input and returns the length of the longest open
% reading frame and the positions of the start and stop codons. 
% Decide what your code should do when no ORF is found and
% implement this. Your function should also work whether the entered dna
% sequence is uppercase, lowercase, or some mixture. The builtin MATLAB functions
% lower and upper could be useful for this. 

% Part 3. Write another function called probabilityORF that utilizes the functions from 
% Parts 1 and 2. It should take two inputs - a sequence length (N) and an length  of an ORF (N_ORF) and
% returns the probability that that a sequence of length N contains an ORF
% of at least length N_ORF

% Part4. Write  a final function called plotProbabilityORF.m which takes
% N_ORF as an argument and makes a plot of the probabily of having an
% ORF at least this long as a function of the dnasequence length. Decide how the
% code should determine the lproengths of dna sequence to test and implement
% your decision. 

% Part 5. Write code that uses your function from part 4 to make a single
% plot with separate curves for ORF lengths 100,200,300,and 400. Make sure
% your plot has appropriate axis labels and legend. 

plotProbabilityORF(100);
hold on; 
plotProbabilityORF(200);
hold on;
plotProbabilityORF(300);
hold on;
plotProbabilityORF(400);
xlabel('sequence length (b.p.)', 'FontSize', 24);
ylabel('Probability', 'FontSize', 24);
legend({'100','200','300','400'},'FontSize', 24);
set(gca,'FontSize', 16);

%% Problem 3. Codon translation and optimization

% DNA sequence gets translated into protein through a code known as the
% genetic code. Every sequence of 3 base pairs (a codon) is translated into
% 1 amino acid. The first two columns of the file codons.csv file in this repository 
% give the correspondence between codons and amino acids. 

% Part 1. Fill in the function dna2protein.m so that it takes any
% dnasequence and translates it to protein. The second argument -  frame -
% should take on values of 1,2, or 3 and should refer to whether the
% translation should start from the 1st, 2nd or 3rd base pair (that is,
% which reading frame to use). Make your code returns an error and
% appropriate message if frame isn't 1,2, or 3. 
dnaseq = 'CCTTTCCCTTCGTGCCCCCCGGCAGCCTCCAGCGTCGGTCCCCAGGCAGCATGGTGAGGTCTGCTCCCGGACCCTCGCCAC';
proteinseq = dna2protein(dnaseq,1);

% Part 2. Write code to turn your protein sequence back into DNA sequence.
% Call your function protein2dna.m
% Notice that there isn't a unique way to do this. For example, there are 4
% different codons that correspond to the amino acid Gly. For a first pass,
% choose one of these codons at random.
dnaseq = protein2dna(proteinseq)


% Part 3. The third column of the codons.csv file contains the frequency of
% this codon's use in the human proteome in units of number of appearances per
% thousand codons. Some codons are used more than others. For example,
% for the amino acid Gln, the codon CAG is used nearly 3 times as often as
% CAA. When researchers add DNA to human cells, if it contains CAG rather than
% CAA for Gln, it will be translated  more efficiently. The process of
% taking a protein seqeunce and finding the DNA sequence that will be
% translated most efficiently in a particular organism is called codon
% optimization. Copy your function protein2dna.m from part 2 to a new
% function called protein2dnaOptimized.m that produces a codon-optimized DNA sequence using the 
% information in the third column of codons.csv. 
% In other words, for any amino acid, it always uses the codon that appears
% most frequently in the human proteome. 
%
opt_dnaseq = protein2dnaOptimized(proteinseq)
