function goldensectionsearch(func, ab, tolx)
% The golden section search method is used to find the minimum of a
% unimodal function.

% Input variables
% func: nonlinear function to be minimized
% ab  : bracketing interval [a, b]
% tolx: tolerance for estimating the minimum

% Other variables
r = (sqrt(5) - 1) /2; % interval reduction ratio
k = 0; % counter

% Bracketing interval
a = ab(1);
b = ab(2);
fa = feval(func, a);
fb = feval(func, b);

% Interior points
x1 = (1 - r)*(b - a) + a;
x2 = r*(b - a) + a;
fx1 = feval(func, x1);
fx2 = feval(func, x2);

% Iterative solution
while (b - a) > tolx
    if fx1 > fx2
        a = x1; % shifting interval left end-point to the right
        fa = fx1;
        x1 = x2; 
        fx1 = fx2;
        x2 = r*(b - a) + a;
        fx2 = feval(func, x2);
    else
        b = x2; % shifting interval right end-point to the left
        fb = fx2;
        x2 = x1; 
        fx2 = fx1;
        x1 = (1 - r)*(b - a) + a;
        fx1 = feval(func, x1);
    end
    k = k + 1;
end
fprintf('a = %7.6f b = %7.6f f(a) = %7.6f f(b) = %7.6f \n', a, b, fa, fb)
fprintf('number of iterations = %2d \n', k)
        
        
