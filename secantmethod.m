function secantmethod(func, x0, x1, tolx, tolfx)
% Secant method used to solve a nonlinear equation in x

% Input variables
% func : nonlinear function 
% x0   : first initial guess value
% x1   : second initial guess value
% tolx : tolerance for error in estimating root
% tolfx: tolerance for error in function value at solution

% Other variables
maxloops = 50;

fx0 = feval(func,x0);
fx1 = feval(func,x1);
fprintf(' i    x(i-1)    x(i)     x(i+1)    f(x(i-1))  f(x(i)) \n');

% Iterative solution scheme
for i = 1:maxloops
    x2 = x1 - fx1*(x1 - x0)/(fx1 - fx0);
    fx2 = feval(func,x2);
    fprintf('%2d  %5.4f  %5.4f  %5.4f  %7.6f  %7.6f \n', ...
        i,x0,x1,x2,fx0,fx1);
    if (abs(x2 - x1) <=tolx && abs(fx2) < tolfx) 
        break % Jump out of the for loop
    end
    x0 = x1;
    x1 = x2;
    fx0 = fx1;
    fx1 = fx2;
end
   



