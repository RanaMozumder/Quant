function f = xyfunctionalpha(alpha, x, df)
% Calculates the function f(x-alpha*df)

%Input variables
% alpha : scalar value of the step size
% x     : vector that specifies the current guess point
% df    : gradient vector of the function at x

f = (x(1)-df(1)*alpha)*exp(x(1)-df(1)*alpha+x(2)-df(2)*alpha)+ ...
    (x(2) - df(2)*alpha)^2;
