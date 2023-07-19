function gen_newtonsmethod2(func, x, tolx, tolfx)
% Generalized Newton's method to solve a system of two nonlinear
% equations in two variables

% Input variables
% func : function that evaluates the system of nonlinear equations and
        % the Jacobian matrix
% x    : initial guess values of the independent variables
% tolx : tolerance for error in the solution
% tolfx: tolerance for error in function value 

% Other variables
maxloops = 20;

[fx, J] = feval(func,x);
fprintf(' i   x1(i+1)   x2(i+1)  f1(x(i))  f2(x(i)) \n');
% Iterative solution scheme
for i = 1:maxloops
    dx = J \ (-fx); 
    x = x + dx; 
    [fx, J] = feval(func,x);
    fprintf('%2d  %7.6f  %7.6f %7.6f  %7.6f \n', ...
        i,x(1), x(2), fx(1), fx(2));
    if (abs(dx) <=tolx & abs(fx) < tolfx) 
    % note use of element-wise AND operator
        break % Jump out of the for loop
    end
end
   
