%% Box 7.4
% Use ode15s to solve the microbial population dynamics problem.
clear all

% Variables
S0 = 0.5; % glucose concentration in feed mg/ml

% Initial conditions
y0(1) = 0.5; % mg glucose/ml
y0(2) = 13e8; % bacteria/ml
y0(3) = 4e5; % amoeba/ml

% Time interval
tf = 1200; % hr

% Call ODE Solver
[t, y] = ode15s('popdynamics', tf, y0, [], S0);

%% Step Change in Substrate Concentration in Feed

S0 = 0.1; % mg glucose/ml
y0 = y(end, :); % Values of variables at last time point
% Call ODE Solver
[t, y] = ode15s('popdynamics', tf, y0, [], S0);