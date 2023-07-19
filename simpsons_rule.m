function I = simpsons_rule(integrandfunc, a, b, n)
% This function uses Simpson's 3/8 rule and composite Simpson's 1/3 
% rule to compute an integral when the analytical form of the 
% function is  provided.

% Input variables
% integrandfunc : function that calculates the integrand
% a : lower limit of integration
% b : upper limit of integration
% n : number of subintervals.

% Output variables
% I : value of integral

x = linspace(a, b, n + 1); % n + 1 nodes created within the interval
y = feval(integrandfunc, x);
h = (b-a)/n;

% Initializing
I1 = 0; I2 = 0; k = 0;

% If n is odd, use Simpson's 3/8 rule first
if mod(n,2)~=0 % n is not divisible by 2
    I1 = 3*h/8*(y(1) + 3*y(2) + 3*y(3) + y(4));
    k = 3; % Placeholder to locate start of integration using 1/3 rule
end
    
% Use Simpson's 1/3 rule to evaluate remainder of integral
I2 =  h/3*(y(1+k) + y(n+1) + 4*sum(y(2+k:2:n)) + 2*sum(y(3+k:2:n-1)));

I = I1 + I2;
