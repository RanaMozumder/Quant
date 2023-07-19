function steepestdescent(func, funcfalpha, x0, toldf)
% Performs unconstrained multivariable optimization using the steepest
% descent method

% Input variables
% func: calculates the gradient vector at x
% funcfalpha: calculates the value of f(x-alpha*df)
% x0: initial guess point
% toldf: tolerance for error in gradient

% Other variables
maxloops = 20; 
ab = [0 10]; % smallest and largest values of alpha
tolalpha = 0.001; % tolerance for error in alpha
df = feval(func, x0);

% Minimization algorithm
for i = 1:maxloops
    alpha = steepestparabolicinterpolation(funcfalpha, ab, ...
        tolalpha, x0, df)
    x1 = x0 - alpha*df;
    x0 = x1;
    df = feval(func, x0);
    fprintf('at step %2d, norm of gradient is %5.4f \n',i, norm(df))
    if norm(df) < toldf 
        break
    end
end
fprintf('number of steepest descent iterations is %2d \n',i)
fprintf('minimum point is %5.4f, %5.4f \n',x1)