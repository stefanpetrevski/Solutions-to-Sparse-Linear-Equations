function erroralt = alt_proj(k,m,n)
%%ALT_PROJ Finds the error obtained by running the more sophisticated
%alternating projection algorithm as opposed to the one step.

    % Initial setup of Problem 1
    A = randn(m,n); % A matrix with i.i.d stand. Normal coeff. 
    x_star = randomvector(n,k); % Calls function, obtains random vector
    b = A * x_star; 
    B = pinv(A); % The Moore-Penrose pseudo-inverse
    
    % Conditions specific to the iterations/initial vector
    x = zeros(n,1); % An nx1 column vector of zeroes
    i = 0; % Initial count to keep track of while loop iterations
    I = 500; % Number of iterations
    
    while (i < I)
        x_hyphen = x + B * (b - A * x); % Step 1
        x = sparsify(x_hyphen,k); % Step 2
        i = i + 1; % Step 3
    end
    
    x_tilde = x; % Recovered vector
    erroralt = (norm(x_tilde-x_star))/(norm(x_star)); % Error
end