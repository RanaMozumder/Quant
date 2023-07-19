% function f = frictionminimization(a)

function [df ddf] = frictionminimization(a)
% Calculates the first and second derivatives of the friction coefficient function

u=1;
b=1;

n = 4*pi*u;
d = log(2*a/b) - 0.5;

% f = n*a/d;
df = n/d - n/(d^2);
ddf = -n/(d^2*a) + (2*n)/(d^3*a);
