function x = sparsify2(x,k)
%%SPARSIFY2 Returns a vector with at most k zeros closest to the 
%initial solution, under the costraint that the non-zero 
%coefficients are in [0,1]. 

    [xsort ind] = sort(x, 'descend'); % Sort entries by size
    x(ind(k+1:end)) = 0; % Set the smallest entries to 0
for i = 1:k
    if x(ind(i)) > 1
        x(ind(i)) = 1; % Setting entries bigger than 1 to 1.
    elseif x(ind(i)) < 0
        x(ind(i)) = 0; % Setting entries smaller than 0 to 0.
    else
        ; % Do nothing if entries are in [0,1]
    end
end
end