function f = epidemic(t, y, flag, k, gamma)
% Evaluate slope f(t,y) of coupled ODEs for dynamics of epidemic outbreak

% Constants
beta = 0.0001; % birth rate, per person per day
mu = 0.00001; % death rate, per person per day

f = [-k*y(1)*y(2) + beta*(y(1)+y(3)) - mu*y(1); ...
    k*y(1)*y(2) - 1/gamma*y(2)- mu*y(2); ...
    1/gamma*y(2) - mu*y(3)];

    