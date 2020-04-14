function x = sparsify(x,k)
%%SPARSIFY Returns a vector with only the largest k entries in absolute
%value unaltered; all others become 0.

    [xsort ind] = sort(abs(x), 'descend'); % Sort entries by absolute value, from largest to smallest
    x(ind(k+1:end),1) = 0; % Set smallest n-k entries in absolute value to 0
end