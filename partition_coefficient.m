function f = partition_coefficient(beta)
% This function calculates 
% (1) the dimensionless potential energy of interaction between the 
% solute and pore wall, and 
% (2) the integrand function that characterizes solute distribution 
% within the pore.

% Input variables
% beta : dimensionless radial position of sphere center in tube

% Parameters
kB = 1.38e-23;      % J/molecule/deg K : Boltzmann constant
T = 273 + 37;       % deg K : temperature
R = 8.314;          % J/mol/deg K : gas constant 
F = 96485.34;       % Coulomb/mol : Faraday constant
eps0 = 8.8542e-12;  % C/V/m : dielectric permittivity of free space
releps = 74;        % solvent relative dielectric permittivity
deltabar = 0.1;     % ratio of sphere to solvent dielectric constant
R0 = 20e-9;         % m : pore radius
Cinf = 0.01*1000;   % mol/m^3 : electrolyte concentration
alpha = 0.25;       % dimensionless sphere radius
qs = 0.01;          % C/m^2 : sphere surface charge density
qc = 0.01;          % C/m^2 : cylinder surface charge density

% Additional calculations
abseps = releps*eps0; % absolute solvent dielectric permittivity
sigmas = F*R0*qs/abseps/R/T; % dimensionless surface charge density
sigmac = F*R0*qc/abseps/R/T; % dimensionless surface charge density

% Calculation of tau: ratio of pore radius to Debye length
tau = R0*sqrt(F^2/abseps/R/T*2*Cinf);

%Calculation of lambda
% Calculation of infinite series
t = 0; firstterm = 0; total = 0; lastterm = 1;
% If difference between new term and first term is less than 0.001*first
% term
while lastterm > (0.001*firstterm)
    preterm = (beta.^t)*factorial(2*t)/(2^(3*t))/((factorial(t))^2);
    lastterm = preterm.*besseli(t, tau*beta)* ...
        (tau*besselk(t + 1, 2*tau) + 0.75*besselk(t, 2*tau));
    if t == 0
        firstterm = lastterm;
    end
    total = lastterm + total;
    t = t + 1; 
end
lambda = pi/2*besseli(0, tau*beta).*total;

% Calculating the Langevin function
L = coth(tau*alpha) - 1/tau/alpha;

% Calculating the interaction energy
delGnum1 = 8*pi*tau*alpha^4*exp(tau*alpha)/((1+tau*alpha)^2)* ...
    lambda*sigmas^2;
delGnum2 = 4*pi^2*alpha^2*besseli(0, tau*beta)/ ...
    (1 + tau*alpha)/besseli(1,tau)*sigmas*sigmac;
delGnum3 = (pi*besseli(0, tau*beta)/tau/besseli(1,tau)).^2* ...
    (exp(tau*alpha) - exp(-tau*alpha))* ...
    tau*alpha*L/(1 + tau*alpha)*sigmac^2;
delGnum = delGnum1 + delGnum2 + delGnum3;
delGden = pi*tau*exp(-tau*alpha) - 2*(exp(tau*alpha) - ...
    exp(-tau*alpha)) * tau*alpha*L*lambda/(1 + tau*alpha);
delG = delGnum./delGden;

% Calculating the dimensional interaction energy
E = R0*(R*T/F)^2*abseps*delG;

% Calculating the integrand
f = 2*exp(-E/kB/T).*beta;
