function [t, y]= eulerforwardmethodvectorized(odefunc, tf, y0, h)
% Euler's forward method is used to solve coupled first-order ODEs

% Input variables
% odefunc : name of the function that calculates f(t, y)
% tf : final time or size of interval
% y0 : vector of initial conditions y(0)
% h : step size

% Other variables
n = length(y0); % number of dependent time-varying variables

% Output variables
t = [0:h:tf]; % vector of time points
y = zeros(n, length(t)); % dependent variable vector
y(:,1) = y0; % initial condition at t = 0
             % indexing of matrix elements begins with 1 in MATLAB

%Euler's forward method for solving coupled first-order ODEs
for k = 1:length(t)-1
    y(:,k+1) = y(:,k)+ h*feval(odefunc, t(k), y(:,k));
end
