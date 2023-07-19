function f = hematocrit(x)
% Constants
delta = 2.92;   % microns : plasma layer thickness
R = 15;         % microns : radius of blood vessel
hinlet = 0.44;  % hematocrit
temp = 310;     % Kelvin : temperature of system
    
% Calculating variables
sigma = 1 - delta/R;
sigma2 = sigma^2;
   
alpha = 0.070.*exp(2.49.*x + (1107/temp).*exp(-1.69.*x));
% Equation 5.3
numerator = (1-sigma2)^2; 
denominator = sigma2*(2*(1-sigma2)+sigma2*(1-alpha.*x));
% Equation 5.11
f = 1 + numerator./denominator - x./hinlet;
