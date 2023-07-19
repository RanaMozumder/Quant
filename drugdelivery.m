function f = drugdelivery(x, y)
% Evaluate f(x,y) for controlled-release drug delivery problem

% Constants
Cs = 0.1e-3;    % solubility of drug (g/ml)
Cm = 0.0;       % concentration of drug in medium (g/ml)
Cdrug = 0.256;  % concentration of drug in particle (g/cm^3)
rhop = 1.28;    % density of particle (g/cm^3)
rhof = 1.0;     % density of medium (g/cm^3)
mu = 0.7e-2;    % viscosity of medium (Poise)
k = 1e-6;       % mass transfer coefficient (cm/s)
g = 981;        % acceleration due to gravity (cm/s^2)

f = [-k/y(2)/Cdrug*(Cs - Cm)*1e4; ...
    (rhop-rhof)/rhop*g/y(2) - 9*mu/2/(y(1)*1e-4)^2/rhop + ...
    3*k/(y(1)*1e-4)/Cdrug*(Cs - Cm); ...
    1/y(2)];
    