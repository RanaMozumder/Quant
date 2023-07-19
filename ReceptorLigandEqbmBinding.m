function [fx, fxderiv] = ReceptorLigandEqbmBinding(Req)
% Equilibrium binding of multivalent ligand to cell surface

% Constants
RT = 10688;     % Total number of receptors on a cell
L0 = 2.0e-9;    % Ligand concentration in medium (M)
Kd = 7.73e-5;   % equilibrium dissociation constant (M)
v = 18;         % Total number of binding sites on ligand
f = v/2;        % Total number of binding sites that a single cell can bind
Kx = 5.8e-5;    % crosslinking equilibrium constant (cell/#)

fx = Req*(1+v*(L0/Kd)*(1+Kx*Req)^(f-1)) - RT;
fxderiv = 1+v*(L0/Kd)*(1+Kx*Req)^(f-1) + ...
    Req*v*(L0/Kd)*(f-1)*Kx*(1+Kx*Req)^(f-2);



