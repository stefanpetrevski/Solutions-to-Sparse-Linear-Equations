function xrandom = randomvector(n,k) 
%%RANDOMVECTOR Generates a k-sparse vector with coefficients from
%the uniform distribution on [0,1] in uniformly random places.

xrandom = rand(n,1); % First draw all entries from the uniform distribution on [0,1]
y = randsample(n,n-k); % Draw n-k random positive integers from 1 to n inclusive

for i = 1:n-k
    xrandom(y(i)) = 0; % For the randomly chosen integers, set the entries corresponding to those indices to 0 instead
end