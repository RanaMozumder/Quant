function bisectionmethod(func,ab, tolx, tolfx)
% Bisection algorithm used to solve a nonlinear equation in x

% Input variables
% func : non-linear function 
% ab   : bracketing interval [a, b]
% tolx : tolerance for error in estimating root
% tolfx: tolerance for error in function value at solution

% Other variables
maxloops = 50; % maximum number of iterations allowed

% Root-containing interval [a b]
a = ab(1); 
b = ab(2); 
fa = feval(func, a); % feval evaluates func at point a
fb = feval(func, b); % feval evaluates func at point b
% Min number of iterations required to meet criterion of Tolx
minloops = ceil(log(abs(b-a)/tolx)/log(2)); 
         % ceil rounds towards +Inf 

fprintf('Min iterations for reaching convergence = %2d \n',minloops)
fprintf(' i     x      f(x)  \n'); % \n is carriage return

% Iterative solution scheme
for i = 1:maxloops
    x = (a+b)/2; % mid-point of interval   
    fx = feval(func,x);
    fprintf('%3d %5.4f %5.4f \n',i,x,fx);
    if (i >= minloops && abs(fx) < tolfx) 
        break % Jump out of the for loop
    end
    if (fx*fa < 0)  % [a x] contains root
        fb = fx; b = x;
    else            % [x b] contains root
        fa = fx; a = x;
    end
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

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
  
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

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
