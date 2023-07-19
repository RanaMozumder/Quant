function [df] = xyfunctiongrad(x)
% Calculates the gradient of f(x) = x*exp(x + y) + y^2

df = [(1 + x(1))*exp(x(1) + x(2)); x(1)*exp(x(1) + x(2)) + 2*x(2)];

