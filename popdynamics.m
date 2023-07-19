function f = popdynamics(t, y, flag, S0)
% Evaluate slope f(t,y) of coupled ODEs for microbial population dynamics

%Constants
FbyV = 1/16;        % feed to chemostat volume ratio (/hr)
muN1max =  0.25;    % max specific growth rate for E coli (/hr)
muN2max = 0.24;     % max specific growth rate for amoeba (/hr)
KN1 = 5e-4;         % saturation constant (mg glucose/ml)
KN2 = 4e8;          % saturation constant (bacteria/ml)
invYN1S = 3.3e-10;  % reciprocal yield factor (mg glucose/bacteria) 
invYN2N1 = 1.4e3;   % reciprocal yield factor (bacteria/amoeba) 

f = [FbyV*(S0 - y(1)) - invYN1S*muN1max*y(1)*y(2)/(KN1 + y(1)); ...
    -FbyV*y(2) + muN1max*y(1)*y(2)/(KN1 + y(1)) - ...
    invYN2N1*muN2max*y(2)*y(3)/(KN2 + y(2)); ...
    -FbyV*y(3) + muN2max*y(2)*y(3)/(KN2 + y(2))];
