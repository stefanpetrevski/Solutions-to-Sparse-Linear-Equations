function successfailure = alt_proj2(k,m,n)
%%ALT_PROJ2 Runs the code of the alt_proj algorithm and measures the
%size of the resulting error in approximating the initial solution.

    epsilon = 10^(-4); % The benchmark for the error
    iteratederror = alt_proj(k,m,n);
    if (iteratederror >= epsilon)
        successfailure = false; % False if error too large
    else
        successfailure = true; % True if error sufficiently small
end