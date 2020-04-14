function errorone = one_step(k,m,n)
%%ONE_STEP Generates an instance of Problem 1 and runs Algorithm 1 
%to give the error in approximating the initial sparse random 
%vector.

    % Initial setup of Problem 1
    A = randn(m,n); % A matrix with i.i.d stand. Normal coeff. 
    x_star = randomvector(n,k); % Calls function, obtains random vector
    b = A * x_star; 
    B = pinv(A); % The Moore-Penrose pseudo-inverse
    
    x_hyphen = B * b; % Step 1 of algorithm
    x_tilde = sparsify(x_hyphen, k); % Step 2 of algorithm
    errorone = (norm(x_tilde-x_star))/(norm(x_star)); % Error
end
    