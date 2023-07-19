function [t, y] = midpointmethod(odefunc, tf, y0, h)
% Midpoint (RK-2) method is used to solve a first-order ODE

% Input variables
% odefunc : name of the function that calculates f(t, y)
% tf : final time or size of interval
% y0 : y(0)
% h : step size

% Output variables
t = [0:h:tf]; % vector of time points
y = zeros(size(t)); % dependent variable vector
y(1) = y0; % indexing of vector elements begins with 1 in MATLAB

% Euler's forward method for solving first-order ODE
for k = 1:length(t)-1
    k1 = feval(odefunc, t(k), y(k));
    k2 = feval(odefunc, t(k) + h/2, y(k) + h/2*k1);
    y(k+1) = y(k) + h*k2;
end
