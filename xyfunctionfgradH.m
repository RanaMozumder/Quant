function [f, df, H] = xyfunctionfgradH(x)
% Calculates the value, gradient, and Hessian of 
% f(x)= x*exp(x + y) + y^2

f = x(1)*exp(x(1) + x(2)) + x(2)^2;
df = [(1 + x(1))*exp(x(1) + x(2)); x(1)*exp(x(1) + x(2)) + 2*x(2)];
H = [(2 + x(1))*exp(x(1) + x(2)), (1 + x(1))*exp(x(1) + x(2)); ...
    (1 + x(1))*exp(x(1) + x(2)), x(1)*exp(x(1) + x(2)) + 2];
