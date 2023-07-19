function [t, y] = RK4methodvectorized(odefunc, tf, y0, h)
% Classical RK-4 method is used to solve coupled first-order ODEs

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

% RK-4 method for solving coupled first-order ODEs
for k = 1:length(t)-1
    k1 = feval(odefunc, t(k), y(:,k));
    k2 = feval(odefunc, t(k)+ h/2, y(:,k) + h/2*k1);
    k3 = feval(odefunc, t(k)+ h/2, y(:,k) + h/2*k2);
    k4 = feval(odefunc, t(k)+ h, y(:,k) + h*k3);
    y(:,k+1) = y(:,k) + h/6*(k1 + 2*k2 + 2*k3 + k4);
    %so that concentration of methanol doesn't become negative
    if y(2, k+1)<0
        y(2, k+1) = 0;
    end
end
