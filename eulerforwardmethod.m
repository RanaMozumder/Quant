function [t, y]= eulerforwardmethod(odefunc, tf, y0, h)
% Euler's forward method is used to solve a first-order ODE

% Input variables
% odefunc : name of the function that calculates f(t, y)
% tf      : final time or size of interval
% y0      : y(0)
% h       : step size

% Output variables
t = [0:h:tf]; % vector of time points
y = zeros(size(t)); % dependent variable vector
y(1) = y0; % indexing of vector elements begins with 1 in MATLAB

%Euler's forward method for solving a first-order ODE
for k = 1:length(t)-1
    y(k+1) = y(k)+ h*feval(odefunc, t(k), y(k));
end