function I = trapezoidal_rule(integrandfunc, a, b, n)
% This function uses the composite trapezoidal rule to calculate an
% integral when an analytical function for the integrand 
% is specified.

% Input variables
% integrandfunc : function that calculates the integrand
% a : lower limit of integration
% b : upper limit of integration
% n : number of subintervals

% Output variables
% I : value of integral

x = linspace(a, b, n + 1); %n + 1 nodes created within the interval
y = feval(integrandfunc, x); 
h = (b-a)/n;
I = h/2*(y(1) + y(n+1) + 2*sum(y(2:n)));

