function f = profitfunction(Q)
% Calculates the objective function to be minimized

ain = 10e-6;    % feed concentration of A (kmol/m^3)
p = 400;        % price in US dollars per kg of product
c = 15;         % operating cost per kg of product
k = 2;          % forward rate constant (1/hr)
V = 12;         % fermentor volume (m^3)
rho = 2.5;      % density (kg/m^3)
MWB = 70000;    % molecular weight (kg/kmol)

f = -((p - c)*Q*ain*MWB*(1 - 1/(1 + k*V/Q))*8000 - ...
    4000*(8000*rho*Q)^0.6);

