function newtonsmethod(func, x0, tolx, tolfx)
% Newton's method used to solve nonlinear equation in x

% Input variables
% func : nonlinear function 
% x0   : initial guess value
% tolx : tolerance for error in estimating root
% tolfx: tolerance for error in function value at solution

% Other variables
maxloops = 20;

[fx, fxderiv] = feval(func,x0);
fprintf(' i   x(i)    f(x(i))    f''(x(i)) \n');
% Iterative solution scheme
for i = 1:maxloops
    x1 = x0 - fx/fxderiv;
    [fx, fxderiv] = feval(func,x1);
    fprintf('%2d  %5.4f  %7.6f  %7.6f \n',i,x1,fx,fxderiv);
    if (abs(x1 - x0) <=tolx && abs(fx) < tolfx) 
        break % Jump out of the for loop
    end
    x0 = x1;
end
  
