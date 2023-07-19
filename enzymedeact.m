function f = enzymedeact(t, y)
% Evaluate slope f(t,y) of coupled ODEs for enzyme deactivation

% Constants
k2 = 21;    % s-1/e.u.
Km = 0.004; % M
kd = 0.03;  %s-1

f = [-k2*y(1)*y(2)/(Km + y(1));-kd*y(2)/(1 + y(1)/Km)];