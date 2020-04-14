%% Project A Sparse solutions of linear equations

%% Exercise 3.1

type sparsify.m
x = randn(20,1)
sparsify(x,7)

%% Exercise 3.2

%%
% The random vector is generated as follows. First, we draw all the
% coefficients from the uniform distribution on $$ [0,1] $$. Second, we
% take $$ n-k $$ positive integers from $$ 1 $$ to $$ n $$ inclusive
% at random. Finally, we set the coefficients corresponding to these drawn
% integers to 0, and output the final vector.

type randomvector.m
type one_step.m

%% Exercise 3.3

one_step(30,200,400)

%% Proof of closed-form solution of the optimization

%%
% In this section we prove the result on page 11 from the project 
% booklet, which states that the closed form for the Eucledian projection
% onto the set for which $$ Ax = b $$ is given by 
% $$ z^{*} = z + A^{\dagger}(b-Az) $$. To show this, we first prove a
% useful lemma.
%
% Lemma: If $$ Ax = b $$, the minumum $$ min(x^{T}x) $$ is achieved for
% $$ x^{*} = A^{\dagger}b $$.
%
% Proof: On page 9 it is noted that $$ x^{*} $$ is indeed a solution
% of $$ Ax = b $$. Now note that for any other $$ x $$ for which 
% $$ Ax = b $$, we must have that $$ A(x-x^{*}) = 0 $$. For convenience of
% notation, define $$ y = x-x^{*} $$ so that $$ Ay $$ = 0.
% Now consider $$ y^{T}x^{*} $$, i.e. the dot product of $$ y $$ 
% and $$ x^{*} $$. They are perpendicular, since $$ y^{T}x^{*} = $$
% $$ y^{T}A^{T}(AA^{T})^{-1}b =(Ay)^{T}*(AA^{T})^{-1}b = 0 $$.
% Thus we have: $$ x^{T}x = (y+x^{*})^{T}(y+x^{*}) = $$
% $$ = y^{T}y + (x^{*})^{T}x^{*}  \geq (x^{*})^{T}x^{*} $$.
% This proves the lemma.
%
% Back to the problem, we substitute $$ t = z^{*} - z $$, and we hence  
% need to minimize $$ t^{T}t $$ subject to $$ At = A(z^{*} - z) = $$
% $$ b - Az $$. Hence, applying the lemma, the desired closed form for
% the solution is given by $$ t = A^{\dagger}(b - Az) $$, or rearranging
% $$ z^{*} = z + A^{\dagger}(b-Az) $$ as desired.
%% Exercise 3.4

type alt_proj.m

%% Exercise 3.5

alt_proj(30,200,400)

%% Exercise 3.6

type alt_proj2.m
alt_proj2(30,200,400)


%% Exercise 3.7

for k = 10:10:200 % Looping over the values of k
    count(k) = 0; % Initial success count is nothing
    for j = 1:100
        count(k) = count(k) + alt_proj2(k,200,400); % Adding 1 or 0
    end
    plot(k,(count(k))/100,'*') % Plotting the individual points
    hold on
end
hold off
title('Values against proportion of successes for altproj2');
xlabel('Values of k');
ylabel('Proportion of successes');

%%
% For $$ m=200 $$, $$ n=400 $$, the recovery against the fixed 
% epsilon seems to be perfect for $$ 10 \leq k \leq 70 $$, i.e. sparse
% solutions are approximated with great accuracy. Between $$ 70 $$ 
% and $$ 110 $$, the success rate is strictly decreasing, and from this
% point onwards it becomes $$ 0 $$. Hence, the algorithm works very well
% for smaller values of $$ k $$ and less so as we increase it towards
% $$ 200 $$.

%% Exercise 3.8

%%
% We modify the sparsify function to display the closest vector with
% at most $$ k $$ coefficients in the range $$ [0,1] $$. This is
% achieved by sorting the coefficients in size, and realizing that if any
% of the biggest $$ k $$ coefficients is bigger than $$ 1 $$, it must be
% set to  $$ 1 $$; if it is negative, the best one can do is setting 
% $$ 0 $$. Naturally, if the coefficients are in the desired range to
% begin with, we do not alter them in any way.

type sparsify2.m
x = randn(20,1)
sparsify2(x,7)

%% Exercise 3.9

type alt_proj3.m

for k = 10:10:200 % Looping over the values of k
    count(k) = 0; % Initial success count is nothing
    for j = 1:100
        count(k) = count(k) + alt_proj3(k,200,400); % Adding 1 or 0
    end
    plot(k,(count(k))/100, 'o') % Plotting the individual points
    hold on
end
hold off
title('Values against proportion of successes for altproj3');
xlabel('Values of k');
ylabel('Proportion of successes');

%%
% Much like the previous algorithm, the success rate is perfect against
% the given value of epsilon for $$ 10 \leq k \leq 70 $$, but now it is
% also near perfect for $$ k=80 $$, an improvement from before. The drop 
% from perfect success to zero success in this case is in the range 
% $$ 90 \leq k \leq 130 $$, with each success rate here greater than 
% the corresponding one for the previous algorithm. In general, we can
% say that this plot is roughly a shift to the right from the original
% one, with the declining trend being less steep. The improvements
% are particularly significant for roughly $$ 80 \leq k \leq 120 $$. For
% the largest values of $$ k $$, the algorithm completely fails 
% to improve from altproj2, as the success proportion is $$ 0 $$.