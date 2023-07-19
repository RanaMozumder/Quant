function f = HIVODE(t, y)
% Evaluate slope f(t,y) of coupled ODEs for HIV-1 dynamics in bloodstream
% Constants
k = 2e-4;   % uL/day/virions
N = 60;     % virions/cell
delta = 0.5;% /day
c = 3.0;    % /day
T = 250;    % noninfected cells/uL

f = [k*T*y(2)-delta*y(1); -c*y(2); N*delta*y(1)-c*y(3)];
 