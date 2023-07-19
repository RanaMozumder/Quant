function f = bacterialpopulationdynamics(t, y)
% Evaluate slope f(t,y) of coupled ODEs for bacterial population dynamics

%Constants
mux1max = 0.185;   % /hr
mux2max = 0.185;   % /hr
Kx1 = 1e-05;       % g/L
Kx2 = 5e-06;       % g/L
Ki = 1e-04;        % g/L
invYx1O2 = 1/0.2;  % g/g
invYx1S = 1/5;     % g/g
invYx2s = 1/0.3;     % g/g
K1a = 42;          % /hr
CO2s = 0.008;      % g/L
FbyV = 0.08;       % /hr

rx1 = (mux1max*y(1)*y(3))/((Kx1+y(1))*(1+y(2)/Ki));
rx2 = (mux2max*y(2)*y(4))/(Kx2+y(2));

f = [K1a*(CO2s-y(1))-invYx1O2*rx1-FbyV*y(1); ...
    -FbyV*y(2)+invYx1S*rx1-invYx2s*rx2; ...
    -FbyV*y(3)+rx1; ...
    -FbyV*y(4)+rx2];
% f = [FbyV*(S0 - y(1)) - invYN1S*muN1max*y(1)*y(2)/(KN1 + y(1)); ...
%     -FbyV*y(2) + muN1max*y(1)*y(2)/(KN1 + y(1)) - ...
%     invYN2N1*muN2max*y(2)*y(3)/(KN2 + y(2)); ...
%     -FbyV*y(3) + muN2max*y(2)*y(3)/(KN2 + y(2))];
