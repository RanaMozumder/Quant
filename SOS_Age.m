function [fx, fxderiv] = SOS_Age(x)
%variables
%sos=speed of sound
%x=age of women

%we are looking for the age of a patient whose sos=3850 m/s
sos=3850;

%the function to minimize
fx = 3383 + 39.9*x -0.78*x^2 +0.0039*x^3-sos;

%and its derivative
fxderiv = 39.9 -0.78*2*x + 0.0039*3*x^2;
