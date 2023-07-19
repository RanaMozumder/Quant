function newtonsmultiDoptimization(func, x0, toldf)
% Newton's method is used to minimize a multivariable objective function.

% Input variables
% func : calculates gradient and Hessian of nonlinear function 
% x0   : initial guessed value
% toldf: tolerance for error in norm of gradient

% Other variables
maxloops = 20;
[df, H] = feval(func,x0);

% Minimization scheme
for i = 1:maxloops
    deltax = - H\df; % df must be a column vector
    x1 = x0 + deltax;
    [df, H] = feval(func,x1);
    if norm(df) < toldf 
        break % Jump out of the for loop
    end
    x0 = x1;
end
fprintf('number of multi-D Newton''s iterations is %2d \n',i)
fprintf('norm of gradient at minimum point is %5.4f \n',norm(df))
fprintf('minimum point is %5.4f, %5.4f \n',x1)
