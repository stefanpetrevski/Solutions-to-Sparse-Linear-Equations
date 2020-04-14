function successfailure = alt_proj3(k,m,n)
%%ALT_PROJ3 Runs the alternating projection algorithm with the 
%improved version of the sparsify algorithm, and measures the 
%resulting error against a fixed "benchmark" epsilon.

    % Initial setup of Problem 1
    A = randn(m,n);
    x_star = randomvector(n,k);
    b = A * x_star;
    B = pinv(A);
    
    % Conditions specific to the iterations/initial vector
    x = zeros(n,1); % An nx1 column vector of zeroes
    i = 0; % Initial count to keep track of while loop iterations
    I = 500; % Number of iterations
    
    epsilon = 10^(-4); % The benchmark for the error
    
    while (i < I)
        x_hyphen = x + B * (b - A * x); % Step 1
        x = sparsify2(x_hyphen,k); % Step 2
        i = i + 1; % Step 3
    end
    
    x_tilde = x;
    iteratederror = (norm(x_tilde-x_star))/(norm(x_star)); % Error
    
    if (iteratederror >= epsilon)
        successfailure = false; % A false logical if error too large
    else
        successfailure = true; % A true if error sufficiently small
end