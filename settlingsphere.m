function f = settlingsphere(t, y)
% Evaluate slopes f(t,y) of coupled equations
a = 10e-4;  % cm : radius of sphere
rhos = 1.1; % g/cm3 : density of sphere
rhof = 1;   % g/cm3 : density of medium
g = 981;    % cm/s2 : acceleration due to gravity
mu = 3.5e-2;% g/cm.s: viscosity
f = [y(2); (rhos - rhof)*g/rhos - (9/2)*mu*y(2)/(a^2)/rhos];
