function f = IVdrip(z)
% This function calculates the integrand function of the IV drip problem.

% Parameters
L = 91.44;  % cm
mu = 0.01;  % Poise
d = 0.1;    % cm
rho = 1;    % g/cm^3
alpha = 64*L*mu/d^2/rho;
g = 981;    % cm/s^2

f = 1./(-alpha + sqrt(alpha^2 + 8*g*(z + L)));