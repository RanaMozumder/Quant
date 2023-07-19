%% Box 7.3
% Use ode23 to solve the epidemic outbreak problem.
clear all
% Variables
k = 1e-5; % infectiousness of disease, per person per contact per day
gamma = 4; % recovery period, days 

% Initial conditions
y0(1) = 100000;
y0(2) = 100;
y0(3) = 0;

% Time interval
tf = 100; % days

% Call ODE Solver
[t, y] = ode23('epidemic', tf, y0, [], k, gamma);